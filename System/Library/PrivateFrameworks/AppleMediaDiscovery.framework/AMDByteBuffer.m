@implementation AMDByteBuffer

- (AMDByteBuffer)initWithInputStream:(id)a3 withFileSize:(unint64_t)a4
{
  AMDByteBuffer *v4;
  AMDByteBuffer *v7;
  objc_super v8;
  unint64_t v9;
  id location[2];
  AMDByteBuffer *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AMDByteBuffer;
  v11 = -[AMDByteBuffer init](&v8, sel_init);
  objc_storeStrong((id *)&v11, v11);
  -[AMDByteBuffer setInputStream:](v11, "setInputStream:", location[0]);
  -[AMDByteBuffer setReadPosition:](v11, "setReadPosition:", 0);
  -[AMDByteBuffer setFileSize:](v11, "setFileSize:", v9);
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (BOOL)hasRemaining
{
  unint64_t v3;
  NSInputStream *v4;
  BOOL v5;

  v4 = -[AMDByteBuffer inputStream](self, "inputStream");
  v5 = 0;
  if (-[NSInputStream hasBytesAvailable](v4, "hasBytesAvailable"))
  {
    v3 = -[AMDByteBuffer readPosition](self, "readPosition");
    v5 = v3 < -[AMDByteBuffer fileSize](self, "fileSize");
  }

  return v5;
}

- (unsigned)getByteWithError:(id *)a3
{
  id v3;
  NSInputStream *v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id *v9;
  SEL v10;
  AMDByteBuffer *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v7 = -[AMDByteBuffer readPosition](self, "readPosition") + 1;
  if (v7 <= -[AMDByteBuffer fileSize](v11, "fileSize"))
  {
    v5 = -[AMDByteBuffer inputStream](v11, "inputStream");
    v6 = -[NSInputStream read:maxLength:](v5, "read:maxLength:", &v8, 1);

    if (v6 > 0)
    {
      -[AMDByteBuffer setReadPosition:](v11, "setReadPosition:", -[AMDByteBuffer readPosition](v11, "readPosition") + 1);
      return v8;
    }
    else
    {
      v3 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 6, CFSTR("insufficient data to read byte"));
      *v9 = v3;
      return 0;
    }
  }
  else
  {
    *v9 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 6, CFSTR("insufficient data to read byte"));
    return 0;
  }
}

- (signed)getShortWithError:(id *)a3
{
  id v3;
  NSInputStream *v5;
  uint64_t v6;
  unint64_t v7;
  int i;
  int v9;
  signed __int16 v10;
  _BYTE v11[2];
  id *v12;
  SEL v13;
  AMDByteBuffer *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v7 = -[AMDByteBuffer readPosition](self, "readPosition") + 2;
  if (v7 <= -[AMDByteBuffer fileSize](v14, "fileSize"))
  {
    v5 = -[AMDByteBuffer inputStream](v14, "inputStream");
    v6 = -[NSInputStream read:maxLength:](v5, "read:maxLength:", v11, 2);

    if (v6 > 0)
    {
      -[AMDByteBuffer setReadPosition:](v14, "setReadPosition:", -[AMDByteBuffer readPosition](v14, "readPosition") + 2);
      v10 = 0;
      v9 = 8;
      for (i = 0; i != 2; ++i)
      {
        v10 |= v11[i] << v9;
        v9 -= 8;
      }
      return v10;
    }
    else
    {
      v3 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 6, CFSTR("insufficient data to read short"));
      *v12 = v3;
      return 0;
    }
  }
  else
  {
    *v12 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 6, CFSTR("insufficient data to read short"));
    return 0;
  }
}

- (int)getIntWithError:(id *)a3
{
  id v3;
  NSInputStream *v5;
  uint64_t v6;
  unint64_t v7;
  int i;
  int v9;
  int v10;
  _BYTE v11[4];
  id *v12;
  SEL v13;
  AMDByteBuffer *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v7 = -[AMDByteBuffer readPosition](self, "readPosition") + 4;
  if (v7 <= -[AMDByteBuffer fileSize](v14, "fileSize"))
  {
    v5 = -[AMDByteBuffer inputStream](v14, "inputStream");
    v6 = -[NSInputStream read:maxLength:](v5, "read:maxLength:", v11, 4);

    if (v6 > 0)
    {
      -[AMDByteBuffer setReadPosition:](v14, "setReadPosition:", -[AMDByteBuffer readPosition](v14, "readPosition") + 4);
      v10 = 0;
      v9 = 24;
      for (i = 0; i != 4; ++i)
      {
        v10 |= v11[i] << v9;
        v9 -= 8;
      }
      return v10;
    }
    else
    {
      v3 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 6, CFSTR("insufficient data to read int"));
      *v12 = v3;
      return 0;
    }
  }
  else
  {
    *v12 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 6, CFSTR("insufficient data to read int"));
    return 0;
  }
}

- (int64_t)getLongWithError:(id *)a3
{
  NSInputStream *v4;
  uint64_t v5;
  unint64_t v6;
  int i;
  int v8;
  int64_t v9;
  _BYTE v13[8];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = -[AMDByteBuffer readPosition](self, "readPosition") + 8;
  if (v6 <= -[AMDByteBuffer fileSize](self, "fileSize"))
  {
    v4 = -[AMDByteBuffer inputStream](self, "inputStream");
    v5 = -[NSInputStream read:maxLength:](v4, "read:maxLength:", v13, 8);

    if (v5 > 0)
    {
      -[AMDByteBuffer setReadPosition:](self, "setReadPosition:", -[AMDByteBuffer readPosition](self, "readPosition") + 8);
      v9 = 0;
      v8 = 56;
      for (i = 0; i != 8; ++i)
      {
        v9 |= (unint64_t)v13[i] << v8;
        v8 -= 8;
      }
      return v9;
    }
    else
    {
      *a3 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 6, CFSTR("insufficient data to read long"));
      return 0;
    }
  }
  else
  {
    *a3 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 6, CFSTR("insufficient data to read long"));
    return 0;
  }
}

- (id)getDataOfLength:(int)a3 error:(id *)a4
{
  id v4;
  id v5;
  NSInputStream *v7;
  void *v8;
  unint64_t v9;
  id v10[2];
  id v11;
  void *v12;
  id v13;
  id *v14;
  int v15;
  SEL v16;
  AMDByteBuffer *v17;
  id v18;

  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = a4;
  v9 = -[AMDByteBuffer readPosition](self, "readPosition") + a3;
  if (v9 <= -[AMDByteBuffer fileSize](v17, "fileSize"))
  {
    v12 = malloc_type_malloc(v15, 0xA79BE973uLL);
    v11 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v12, v15);
    v7 = -[AMDByteBuffer inputStream](v17, "inputStream");
    v8 = -[NSInputStream read:maxLength:](v7, "read:maxLength:", v12, v15);

    v10[1] = v8;
    if ((uint64_t)v8 > 0)
    {
      -[AMDByteBuffer setReadPosition:](v17, "setReadPosition:", -[AMDByteBuffer readPosition](v17, "readPosition") + v15);
      v18 = v11;
    }
    else
    {
      v10[0] = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("insufficient data to read %d bytes"), v15);
      v5 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 6, v10[0]);
      *v14 = v5;
      v18 = 0;
      objc_storeStrong(v10, 0);
    }
    objc_storeStrong(&v11, 0);
  }
  else
  {
    v13 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("insufficient data to read %d bytes"), v15);
    v4 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 6, v13);
    *v14 = v4;
    v18 = 0;
    objc_storeStrong(&v13, 0);
  }
  return v18;
}

- (void)copyDataOfLength:(unint64_t)a3 toFile:(id)a4 isCompressed:(BOOL)a5 error:(id *)a6
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  NSInputStream *v17;
  uint64_t v18;
  id v19;
  void *v20;
  unint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  size_t v28;
  compression_status v29;
  _BOOL4 v30;
  char v31;
  id v32;
  size_t v33;
  uint64_t v34;
  id v35[5];
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  compression_stream __b;
  id v40;
  unint64_t v41;
  int v42;
  id v43;
  id *v44;
  BOOL v45;
  id location;
  unint64_t v47;
  SEL v48;
  AMDByteBuffer *v49;

  v49 = self;
  v48 = a2;
  v47 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v45 = a5;
  v44 = a6;
  v6 = -[AMDByteBuffer readPosition](v49, "readPosition");
  v23 = v6 + v47;
  if (v23 > -[AMDByteBuffer fileSize](v49, "fileSize"))
  {
    v43 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("insufficient data to read %lu bytes"), v47);
    v7 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 6, v43);
    *v44 = v7;
    v42 = 1;
    objc_storeStrong(&v43, 0);
LABEL_40:
    objc_storeStrong(&location, 0);
    return;
  }
  v41 = v47;
  v40 = 0;
  memset(&__b, 0, sizeof(__b));
  v38 = 4096;
  v37 = 0x4000;
  v36 = (uint8_t *)malloc_type_malloc(0x1000uLL, 0x649E63DFuLL);
  memset((char *)&v35[3] + 7, 0, 9);
  v20 = (void *)MEMORY[0x1E0C99E48];
  v19 = (id)objc_msgSend(location, "path");
  v8 = (id)objc_msgSend(v20, "outputStreamToFileAtPath:append:");
  v9 = v40;
  v40 = v8;

  if (v40)
  {
    objc_msgSend(v40, "open");
    if (!v45)
      goto LABEL_9;
    if (compression_stream_init(&__b, COMPRESSION_STREAM_DECODE, COMPRESSION_ZLIB))
    {
      v11 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 4, CFSTR("could not initialize the compression stream"));
      *v44 = v11;
      v42 = 1;
    }
    else
    {
      v35[4] = malloc_type_malloc(0x4000uLL, 0x80AC762DuLL);
LABEL_9:
      while (v41)
      {
        v34 = 4096;
        if (v41 < 0x1000)
          v34 = v41;
        v17 = -[AMDByteBuffer inputStream](v49, "inputStream");
        v18 = -[NSInputStream read:maxLength:](v17, "read:maxLength:", v36, v34);

        v33 = v18;
        if (v18 <= 0)
        {
          v32 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error while reading from stream, remaining %lu"), v41);
          v12 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 8, v32);
          *v44 = v12;
          v42 = 1;
          objc_storeStrong(&v32, 0);
          goto LABEL_29;
        }
        v41 -= v33;
        -[AMDByteBuffer setReadPosition:](v49, "setReadPosition:", -[AMDByteBuffer readPosition](v49, "readPosition") + v33);
        if (v45)
        {
          v31 = 0;
          v30 = v41 == 0;
          __b.src_ptr = v36;
          __b.src_size = v33;
          while ((v31 & 1) == 0)
          {
            __b.dst_ptr = (uint8_t *)v35[4];
            __b.dst_size = 0x4000;
            v29 = compression_stream_process(&__b, v30);
            if (v29 == COMPRESSION_STATUS_ERROR)
            {
              v13 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 5, CFSTR("error while decompressing the stream"));
              *v44 = v13;
              v42 = 1;
              goto LABEL_29;
            }
            v28 = 0x4000 - __b.dst_size;
            v27 = objc_msgSend(v40, "write:maxLength:", v35[4], 0x4000 - __b.dst_size);
            if (v27 <= 0)
            {
              v26 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error while writing to %@"), location);
              v14 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 7, v26);
              *v44 = v14;
              v42 = 1;
              objc_storeStrong(&v26, 0);
              goto LABEL_29;
            }
            if (v41 || v29 == COMPRESSION_STATUS_END)
              v31 = 1;
          }
        }
        else
        {
          v25 = objc_msgSend(v40, "write:maxLength:", v36, v33);
          if (v25 <= 0)
          {
            v24 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error while writing to %@"), location);
            v15 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 7, v24);
            *v44 = v15;
            v42 = 1;
            objc_storeStrong(&v24, 0);
            goto LABEL_29;
          }
        }
      }
      v42 = 0;
    }
  }
  else
  {
    v35[0] = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not open output stream to file %@"), location);
    v10 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 7, v35[0]);
    *v44 = v10;
    v42 = 1;
    objc_storeStrong(v35, 0);
  }
LABEL_29:
  v16 = v42;
  free(v36);
  if (v40)
    objc_msgSend(v40, "close");
  if (v45)
  {
    free(v35[4]);
    compression_stream_destroy(&__b);
  }
  if ((HIBYTE(v35[3]) & 1) != 0)
    objc_exception_rethrow();
  v42 = v16;
  if (!v16)
  {
    v42 = 0;
LABEL_39:
    objc_storeStrong(&v40, 0);
    goto LABEL_40;
  }
  if (v16 != 2)
    goto LABEL_39;
  __break(1u);
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void)setInputStream:(id)a3
{
  objc_storeStrong((id *)&self->_inputStream, a3);
}

- (unint64_t)readPosition
{
  return self->_readPosition;
}

- (void)setReadPosition:(unint64_t)a3
{
  self->_readPosition = a3;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputStream, 0);
}

@end
