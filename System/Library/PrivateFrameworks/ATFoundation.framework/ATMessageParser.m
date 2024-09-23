@implementation ATMessageParser

- (ATMessageParser)initWithMessageClass:(Class)a3
{
  ATMessageParser *v4;
  ATMessageParser *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATMessageParser;
  v4 = -[ATMessageParser init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_messageClass, a3);
  return v5;
}

- (void)dealloc
{
  void *objectDataBuffer;
  objc_super v4;

  objectDataBuffer = self->_objectDataBuffer;
  if (objectDataBuffer)
    free(objectDataBuffer);
  v4.receiver = self;
  v4.super_class = (Class)ATMessageParser;
  -[ATMessageParser dealloc](&v4, sel_dealloc);
}

- (BOOL)_parseObjectFromData:(id)a3
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  void (**objectParsedBlock)(id, id);
  NSObject *v11;
  void *v13;
  objc_class *v14;
  void *v15;
  uint8_t buf[16];

  v5 = (objc_class *)MEMORY[0x1E0D82B90];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

  if (!-[ATMessageParser messageClass](self, "messageClass"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATMessageParser.m"), 40, CFSTR("You can't use %@ without setting a message class"), v15);

  }
  v8 = objc_alloc_init(-[ATMessageParser messageClass](self, "messageClass"));
  v9 = objc_msgSend(v8, "readFrom:", v7);
  if (v9)
  {
    objectParsedBlock = (void (**)(id, id))self->_objectParsedBlock;
    if (objectParsedBlock)
      objectParsedBlock[2](objectParsedBlock, v8);
  }
  else
  {
    _ATLogCategoryFramework();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D19F1000, v11, OS_LOG_TYPE_ERROR, "Error parsing message", buf, 2u);
    }

  }
  return v9;
}

- (BOOL)_parseObjectLength:(const char *)a3 length:(unint64_t)a4 bytesConsumed:(unint64_t *)a5
{
  unint64_t varIntDataLen;
  size_t v8;
  unint64_t v9;
  int VarIntBuf;

  varIntDataLen = self->_varIntDataLen;
  if (10 - varIntDataLen >= a4)
    v8 = a4;
  else
    v8 = 10 - varIntDataLen;
  memcpy(&self->_varIntBuf[varIntDataLen], a3, v8);
  v9 = self->_varIntDataLen + v8;
  self->_varIntDataLen = v9;
  if (v9 == 10)
  {
    VarIntBuf = PBReaderReadVarIntBuf();
    if (VarIntBuf)
    {
      *a5 = -(uint64_t)varIntDataLen;
      self->_curObjectLength = 0;
    }
    self->_varIntDataLen = 0;
  }
  else
  {
    *a5 = v8;
    LOBYTE(VarIntBuf) = 1;
  }
  return VarIntBuf;
}

- (BOOL)processData:(const char *)a3 length:(int64_t)a4
{
  size_t v5;
  unint64_t v7;
  char *v8;
  unint64_t *p_curObjectLength;
  size_t v10;
  int VarIntBuf;
  size_t varIntDataLen;
  size_t v13;
  unint64_t v14;
  NSError *v15;
  NSError *parserError;
  NSObject *v17;
  size_t v18;
  char *objectDataBuffer;
  unint64_t objectDataLen;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  uint8_t buf[16];
  unint64_t v33;
  size_t v34;

  if (a4 >= 1)
  {
    v5 = a4;
    v7 = 0;
    v8 = 0;
    p_curObjectLength = &self->_curObjectLength;
    while (1)
    {
      v10 = *p_curObjectLength;
      if (*p_curObjectLength)
      {
        VarIntBuf = 1;
      }
      else
      {
        varIntDataLen = self->_varIntDataLen;
        if (10 - varIntDataLen >= v5 - v7)
          v13 = v5 - v7;
        else
          v13 = 10 - varIntDataLen;
        memcpy(&self->_varIntBuf[varIntDataLen], &a3[v7], v13);
        v14 = self->_varIntDataLen + v13;
        self->_varIntDataLen = v14;
        if (v14 == 10)
        {
          v33 = 0;
          v34 = 0;
          VarIntBuf = PBReaderReadVarIntBuf();
          if ((VarIntBuf & 1) != 0)
          {
            *p_curObjectLength = v33;
            if (v34 >= varIntDataLen)
            {
              v7 = v7 - varIntDataLen + v34;
            }
            else
            {
              if (v7)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATMessageParser.m"), 115, CFSTR("detected partial varIntBuffer but readOffset=%d (expected 0)"), v7);

              }
              v8 = (char *)malloc_type_malloc(varIntDataLen + v5, 0xAA8BCA9uLL);
              memcpy(v8, self->_varIntBuf, varIntDataLen);
              memcpy(&v8[varIntDataLen], a3, v5);
              v7 = v34;
              v5 += varIntDataLen;
              a3 = v8;
            }
          }
          else
          {
            +[ATInternalError errorWithCode:format:](ATInternalError, "errorWithCode:format:", 1, CFSTR("Couldn't read the size of the next object from the server"));
            v15 = (NSError *)objc_claimAutoreleasedReturnValue();
            parserError = self->_parserError;
            self->_parserError = v15;

            _ATLogCategoryFramework();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D19F1000, v17, OS_LOG_TYPE_ERROR, "Couldn't read length from input stream", buf, 2u);
            }

          }
          self->_varIntDataLen = 0;
        }
        else
        {
          v7 += v13;
          VarIntBuf = 1;
        }
        v10 = *p_curObjectLength;
        if (!*p_curObjectLength)
          goto LABEL_31;
      }
      v18 = v5 - v7;
      objectDataBuffer = (char *)self->_objectDataBuffer;
      if (objectDataBuffer)
      {
        objectDataLen = self->_objectDataLen;
        if (v18 >= v10 - objectDataLen)
          v18 = v10 - objectDataLen;
        memcpy(&objectDataBuffer[objectDataLen], &a3[v7], v18);
        v21 = self->_objectDataLen + v18;
        self->_objectDataLen = v21;
        if (v21 == self->_curObjectLength)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_objectDataBuffer);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          VarIntBuf = -[ATMessageParser _parseObjectFromData:](self, "_parseObjectFromData:", v22);
          free(self->_objectDataBuffer);
          *p_curObjectLength = 0;
          self->_objectDataBuffer = 0;

        }
        v7 += v18;
      }
      else if (v18 >= v10)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &a3[v7]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        VarIntBuf = -[ATMessageParser _parseObjectFromData:](self, "_parseObjectFromData:", v24);
        v7 += self->_curObjectLength;
        self->_curObjectLength = 0;

      }
      else
      {
        v23 = malloc_type_malloc(v10, 0x7C148DAFuLL);
        self->_objectDataBuffer = v23;
        if (!v23)
        {
          LOBYTE(VarIntBuf) = 0;
LABEL_40:
          if (v8)
            free(v8);
          return VarIntBuf;
        }
        memcpy(v23, &a3[v7], v5 - v7);
        self->_objectDataLen = v18;
        v7 = v5;
      }
LABEL_31:
      if (VarIntBuf)
        v25 = v5 - 1 >= v7;
      else
        v25 = 0;
      if (!v25)
        goto LABEL_40;
    }
  }
  v27 = self->_objectDataBuffer;
  if (!v27)
  {
    LOBYTE(VarIntBuf) = 0;
    return VarIntBuf;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v27, self->_curObjectLength, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[ATMessageParser _parseObjectFromData:](self, "_parseObjectFromData:", v28);
  self->_curObjectLength = 0;
  self->_objectDataBuffer = 0;

  return v29;
}

- (NSError)parserError
{
  return self->_parserError;
}

- (Class)messageClass
{
  return self->_messageClass;
}

- (id)objectParsedBlock
{
  return self->_objectParsedBlock;
}

- (void)setObjectParsedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectParsedBlock, 0);
  objc_storeStrong((id *)&self->_messageClass, 0);
  objc_storeStrong((id *)&self->_parserError, 0);
  objc_storeStrong((id *)&self->_parserData, 0);
}

@end
