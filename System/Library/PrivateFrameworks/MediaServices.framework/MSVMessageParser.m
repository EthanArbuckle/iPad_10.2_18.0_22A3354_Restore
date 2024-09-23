@implementation MSVMessageParser

+ (id)createHeader:(unint64_t)a3
{
  id v3;
  _BYTE v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v3, "appendBytes:length:", v5, PBDataWriterWriteBareVarint());
  return v3;
}

- (void)processData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableData *unhandledPartialData;
  NSMutableData *unhandledPartialObjectData;
  int64_t unhandledObjectDataExpectedLength;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableData *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSMutableData *v18;
  NSMutableData *v19;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");
  unhandledPartialData = self->_unhandledPartialData;
  if (unhandledPartialData)
  {
    -[NSMutableData appendData:](unhandledPartialData, "appendData:", v4);
    v5 = -[NSMutableData bytes](self->_unhandledPartialData, "bytes");
    v6 = -[NSMutableData length](self->_unhandledPartialData, "length");
  }
  unhandledPartialObjectData = self->_unhandledPartialObjectData;
  if (unhandledPartialObjectData)
  {
    unhandledObjectDataExpectedLength = self->_unhandledObjectDataExpectedLength;
    v10 = -[NSMutableData length](unhandledPartialObjectData, "length");
    v11 = unhandledObjectDataExpectedLength - v10;
    if (unhandledObjectDataExpectedLength - v10 >= v6)
      v12 = v6;
    else
      v12 = unhandledObjectDataExpectedLength - v10;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytesNoCopy:length:freeWhenDone:", v5, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_unhandledPartialObjectData;
    v15 = objc_retainAutorelease(v13);
    -[NSMutableData appendBytes:length:](v14, "appendBytes:length:", objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
    if (v11 <= v6)
      -[MSVMessageParser _notifyDelegate:](self, "_notifyDelegate:", self->_unhandledPartialObjectData);

  }
  else
  {
    v12 = 0;
  }
  if (v12 >= v6)
  {
LABEL_17:
    v18 = self->_unhandledPartialData;
    self->_unhandledPartialData = 0;
  }
  else
  {
    while (PBReaderReadVarIntBuf())
    {
      v16 = v5 + v12;
      if (v6 - v12 >= 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytesNoCopy:length:freeWhenDone:", v16, 0, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSVMessageParser _notifyDelegate:](self, "_notifyDelegate:", v17);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSVMessageParser setUnhandledPartialObjectData:](self, "setUnhandledPartialObjectData:", v17);
        -[MSVMessageParser setUnhandledObjectDataExpectedLength:](self, "setUnhandledObjectDataExpectedLength:", 0);
      }
      v12 += objc_msgSend(v17, "length", 0);

      if (v12 >= v6)
        goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", v5 + v12, v6 - v12);
    v19 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
    v18 = self->_unhandledPartialData;
    self->_unhandledPartialData = v19;
  }

}

- (void)_notifyDelegate:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "parser:didParseMessage:", self, v5);
  -[MSVMessageParser setUnhandledPartialObjectData:](self, "setUnhandledPartialObjectData:", 0);
  -[MSVMessageParser setUnhandledObjectDataExpectedLength:](self, "setUnhandledObjectDataExpectedLength:", 0);

}

- (MSVMessageParserDelegate)delegate
{
  return (MSVMessageParserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableData)unhandledPartialObjectData
{
  return self->_unhandledPartialObjectData;
}

- (void)setUnhandledPartialObjectData:(id)a3
{
  objc_storeStrong((id *)&self->_unhandledPartialObjectData, a3);
}

- (int64_t)unhandledObjectDataExpectedLength
{
  return self->_unhandledObjectDataExpectedLength;
}

- (void)setUnhandledObjectDataExpectedLength:(int64_t)a3
{
  self->_unhandledObjectDataExpectedLength = a3;
}

- (NSMutableData)unhandledPartialData
{
  return self->_unhandledPartialData;
}

- (void)setUnhandledPartialData:(id)a3
{
  objc_storeStrong((id *)&self->_unhandledPartialData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unhandledPartialData, 0);
  objc_storeStrong((id *)&self->_unhandledPartialObjectData, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
