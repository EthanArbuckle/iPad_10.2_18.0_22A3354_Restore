@implementation ICPeerOutputStream

- (ICPeerOutputStream)initWithOutputStream:(id)a3
{
  id v5;
  ICPeerOutputStream *v6;
  ICPeerOutputStream *v7;
  void *v8;
  NSMutableData *v9;
  NSMutableData *data;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICPeerOutputStream;
  v6 = -[ICPeerOutputStream init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputStream, a3);
    objc_msgSend(v5, "setDelegate:", v7);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scheduleInRunLoop:forMode:", v8, *MEMORY[0x1E0C99748]);

    if (!objc_msgSend(v5, "streamStatus"))
      objc_msgSend(v5, "open");
    v9 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    data = v7->_data;
    v7->_data = v9;

  }
  return v7;
}

- (void)dealloc
{
  NSOutputStream *outputStream;
  objc_super v4;

  -[NSOutputStream setDelegate:](self->_outputStream, "setDelegate:", 0);
  -[NSOutputStream close](self->_outputStream, "close");
  outputStream = self->_outputStream;
  self->_outputStream = 0;

  v4.receiver = self;
  v4.super_class = (Class)ICPeerOutputStream;
  -[ICPeerOutputStream dealloc](&v4, sel_dealloc);
}

- (void)writeMessageData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[ICPeerOutputStream data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  v8 = objc_msgSend(v4, "length");
  -[ICPeerOutputStream data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendBytes:length:", &v8, 4);

  -[ICPeerOutputStream data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendData:", v4);

  objc_sync_exit(v5);
  -[ICPeerOutputStream writeData](self, "writeData");

}

- (void)writeData
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "ICPeerOutputStream error writing data: %@", buf, 0xCu);

}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSOutputStream *outputStream;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  switch(a4)
  {
    case 0uLL:
      v7 = os_log_create("com.apple.notes", "networking");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v14 = 138412290;
      v15 = v6;
      v8 = "Stream none event %@.";
      goto LABEL_11;
    case 1uLL:
      v7 = os_log_create("com.apple.notes", "networking");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v14 = 138412290;
      v15 = v6;
      v8 = "Stream open %@.";
      goto LABEL_11;
    case 2uLL:
      v7 = os_log_create("com.apple.notes", "networking");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v14 = 138412290;
      v15 = v6;
      v8 = "Stream bytes available %@.";
LABEL_11:
      _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0xCu);
LABEL_12:

      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      break;
    case 4uLL:
      v10 = os_log_create("com.apple.notes", "networking");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_1BD918000, v10, OS_LOG_TYPE_DEFAULT, "Stream space available %@.", (uint8_t *)&v14, 0xCu);
      }

      -[ICPeerOutputStream writeData](self, "writeData");
      break;
    case 8uLL:
      v9 = os_log_create("com.apple.notes", "networking");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "streamError");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412546;
        v15 = v6;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_DEFAULT, "Stream error occurred %@ %@.", (uint8_t *)&v14, 0x16u);

      }
      goto LABEL_19;
    default:
      if (a4 != 16)
        break;
      v9 = os_log_create("com.apple.notes", "networking");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_DEFAULT, "Stream end %@.", (uint8_t *)&v14, 0xCu);
      }
LABEL_19:

      objc_msgSend(v6, "close");
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromRunLoop:forMode:", v12, *MEMORY[0x1E0C99748]);

      outputStream = self->_outputStream;
      self->_outputStream = 0;

      break;
  }

}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
}

@end
