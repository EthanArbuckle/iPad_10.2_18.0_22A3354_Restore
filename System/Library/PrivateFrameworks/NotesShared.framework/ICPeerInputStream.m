@implementation ICPeerInputStream

- (ICPeerInputStream)initWithInputStream:(id)a3
{
  id v5;
  ICPeerInputStream *v6;
  ICPeerInputStream *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICPeerInputStream;
  v6 = -[ICPeerInputStream init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputStream, a3);
    objc_msgSend(v5, "setDelegate:", v7);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleInRunLoop:forMode:", v8, *MEMORY[0x1E0C99748]);

    if (!objc_msgSend(v5, "streamStatus"))
      objc_msgSend(v5, "open");
  }

  return v7;
}

- (void)dealloc
{
  NSInputStream *inputStream;
  objc_super v4;

  -[NSInputStream setDelegate:](self->_inputStream, "setDelegate:", 0);
  -[NSInputStream close](self->_inputStream, "close");
  inputStream = self->_inputStream;
  self->_inputStream = 0;

  v4.receiver = self;
  v4.super_class = (Class)ICPeerInputStream;
  -[ICPeerInputStream dealloc](&v4, sel_dealloc);
}

- (void)startReadLength
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPeerInputStream setData:](self, "setData:", v3);

  -[ICPeerInputStream setLength:](self, "setLength:", 0);
  -[ICPeerInputStream setMaxLength:](self, "setMaxLength:", 4);
  -[ICPeerInputStream setIsMessage:](self, "setIsMessage:", 0);
}

- (void)startReadMessage:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPeerInputStream setData:](self, "setData:", v5);

  -[ICPeerInputStream setLength:](self, "setLength:", 0);
  -[ICPeerInputStream setMaxLength:](self, "setMaxLength:", a3);
  -[ICPeerInputStream setIsMessage:](self, "setIsMessage:", 1);
}

- (void)readDataFrom:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  NSObject *v19;

  v4 = a3;
  if (!objc_msgSend(v4, "hasBytesAvailable"))
    goto LABEL_18;
  v5 = *MEMORY[0x1E0CB2FE0];
  while (1)
  {
    v6 = -[ICPeerInputStream maxLength](self, "maxLength");
    v7 = v6 - -[ICPeerInputStream length](self, "length");
    -[ICPeerInputStream data](self, "data");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v4, "read:maxLength:", objc_msgSend(v8, "bytes") + -[ICPeerInputStream length](self, "length"), v7);

    if (v9 >= 1)
    {
      -[ICPeerInputStream setLength:](self, "setLength:", -[ICPeerInputStream length](self, "length") + v9);
      v10 = -[ICPeerInputStream maxLength](self, "maxLength");
      if (v10 == -[ICPeerInputStream length](self, "length"))
      {
        if (-[ICPeerInputStream isMessage](self, "isMessage"))
        {
          -[ICPeerInputStream delegate](self, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICPeerInputStream data](self, "data");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "handleMessage:fromInputStream:", v12, self);

          -[ICPeerInputStream startReadLength](self, "startReadLength");
        }
        else
        {
          -[ICPeerInputStream data](self, "data");
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v18 = *(unsigned int *)objc_msgSend(v17, "bytes");

          -[ICPeerInputStream startReadMessage:](self, "startReadMessage:", v18);
        }
      }
      goto LABEL_12;
    }
    if (v9 < 0)
      break;
LABEL_12:
    if ((objc_msgSend(v4, "hasBytesAvailable") & 1) == 0)
      goto LABEL_18;
  }
  objc_msgSend(v4, "streamError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToString:", v5) & 1) != 0)
  {
    objc_msgSend(v4, "streamError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "code");

    if (v16 != 35)
      goto LABEL_15;
    goto LABEL_12;
  }

LABEL_15:
  v19 = os_log_create("com.apple.notes", "Multipeer");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[ICPeerInputStream readDataFrom:].cold.1(v4, v19);

LABEL_18:
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSInputStream *inputStream;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  switch(a4)
  {
    case 0uLL:
      v7 = os_log_create("com.apple.notes", "Multipeer");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      v16 = 138412290;
      v17 = v6;
      v8 = "Stream none event %@.";
      goto LABEL_15;
    case 1uLL:
      v11 = os_log_create("com.apple.notes", "Multipeer");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v6;
        _os_log_impl(&dword_1BD918000, v11, OS_LOG_TYPE_INFO, "Stream open %@.", (uint8_t *)&v16, 0xCu);
      }

      -[ICPeerInputStream startReadLength](self, "startReadLength");
      goto LABEL_21;
    case 2uLL:
      v12 = os_log_create("com.apple.notes", "Multipeer");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v6;
        _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_INFO, "Stream bytes available %@.", (uint8_t *)&v16, 0xCu);
      }

      -[ICPeerInputStream readDataFrom:](self, "readDataFrom:", v6);
      goto LABEL_21;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_21;
    case 4uLL:
      v7 = os_log_create("com.apple.notes", "Multipeer");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v6;
        v8 = "Stream space available %@.";
LABEL_15:
        _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v16, 0xCu);
      }
LABEL_16:

      goto LABEL_21;
    case 8uLL:
      v9 = os_log_create("com.apple.notes", "Multipeer");
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      v16 = 138412290;
      v17 = v6;
      v10 = "Stream error occurred %@.";
      goto LABEL_19;
    default:
      if (a4 != 16)
        goto LABEL_21;
      v9 = os_log_create("com.apple.notes", "Multipeer");
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      v16 = 138412290;
      v17 = v6;
      v10 = "Stream end %@.";
LABEL_19:
      _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, 0xCu);
LABEL_20:

      objc_msgSend(v6, "close");
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromRunLoop:forMode:", v13, *MEMORY[0x1E0C99748]);

      inputStream = self->_inputStream;
      self->_inputStream = 0;

      -[ICPeerInputStream delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "didDisconnectInputStream:", self);

LABEL_21:
      return;
  }
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (ICPeerInputStreamDelegate)delegate
{
  return (ICPeerInputStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_maxLength = a3;
}

- (BOOL)isMessage
{
  return self->_isMessage;
}

- (void)setIsMessage:(BOOL)a3
{
  self->_isMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inputStream, 0);
}

- (void)readDataFrom:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "streamError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "ICPeerInputStream error reading data: %@", (uint8_t *)&v4, 0xCu);

}

@end
