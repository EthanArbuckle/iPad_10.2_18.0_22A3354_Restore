@implementation BUZipInflateReadChannel

+ (void)test_setMaxBufferSize:(unint64_t)a3
{
  unint64_t v3;

  v3 = 0xFFFFFFFFLL;
  if (a3 < 0xFFFFFFFF)
    v3 = a3;
  if (!a3)
    v3 = 0x40000;
  qword_254B69F20 = v3;
}

- (BUZipInflateReadChannel)initWithReadChannel:(id)a3 uncompressedSize:(unint64_t)a4 CRC:(unsigned int)a5 validateCRC:(BOOL)a6
{
  id v11;
  BUZipInflateReadChannel *v12;
  BUZipInflateReadChannel *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v11 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BUZipInflateReadChannel;
  v12 = -[BUZipInflateReadChannel init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_readChannel, a3);
    v13->_stream.next_in = 0;
    v13->_remainingUncompressedSize = a4;
    v13->_CRC = a5;
    v13->_validateCRC = a6;
    v13->_stream.avail_in = 0;
    v13->_stream.avail_out = 0;
    v13->_stream.next_out = 0;
    v13->_stream.zfree = 0;
    v13->_stream.opaque = 0;
    v13->_stream.zalloc = 0;
    if (inflateInit2_(&v13->_stream, -15, "1.2.12", 112))
    {
      BUZipLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_212E6DFB8(v14, v15, v16, v17, v18, v19, v20, v21);

      v13 = 0;
    }
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_close(self, a2, v2);
  inflateEnd(&self->_stream);
  free(self->_outBuffer);
  v4.receiver = self;
  v4.super_class = (Class)BUZipInflateReadChannel;
  -[BUZipInflateReadChannel dealloc](&v4, sel_dealloc);
}

- (void)prepareBuffer
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;

  v4 = objc_msgSend_remainingUncompressedSize(self, a2, v2);
  v7 = qword_254B69F20;
  if (v4)
  {
    v8 = objc_msgSend_remainingUncompressedSize(self, v5, v6);
    if (v7 >= v8)
      v7 = v8;
  }
  self->_outBufferSize = v7;
  v9 = (char *)malloc_type_malloc(v7, 0xE1F45118uLL);
  self->_outBuffer = v9;
  self->_stream.avail_out = self->_outBufferSize;
  self->_stream.next_out = (Bytef *)v9;
}

- (void)readWithHandler:(id)a3
{
  id v4;
  BUStreamReadChannel *readChannel;
  id v6;
  const char *v7;
  _QWORD v8[5];
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[3];
  int v15;
  _QWORD v16[3];
  int v17;
  _QWORD v18[3];
  char v19;
  _QWORD v20[3];
  char v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 1;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 1;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v15 = crc32(0, 0, 0);
  readChannel = self->_readChannel;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_212E69C54;
  v8[3] = &unk_24CEDAE18;
  v10 = v20;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  v11 = v16;
  v12 = v18;
  v13 = v14;
  objc_msgSend_readWithHandler_(readChannel, v7, (uint64_t)v8);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

}

- (BOOL)processData:(id)a3 inflateResult:(int *)a4 CRC:(unsigned int *)a5 isDone:(BOOL)a6 handler:(id)a7
{
  _BOOL4 v8;
  NSObject *v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  int v19;
  BOOL v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD applier[5];
  id v38;
  uint64_t *v39;
  int *v40;
  unsigned int *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;

  v8 = a6;
  v12 = a3;
  v13 = a7;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 1;
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = sub_212E69F20;
  applier[3] = &unk_24CEDAE40;
  v39 = &v42;
  v40 = a4;
  applier[4] = self;
  v41 = a5;
  v14 = v13;
  v38 = v14;
  dispatch_data_apply(v12, applier);
  v17 = objc_msgSend_validateCRC(self, v15, v16);
  v19 = *((unsigned __int8 *)v43 + 24);
  if (!v17)
    goto LABEL_10;
  if (!*((_BYTE *)v43 + 24))
    goto LABEL_20;
  if (v8)
  {
    if (!a5)
    {
LABEL_9:
      v19 = 1;
LABEL_10:
      if (v19 && v8)
      {
        if (*a4 != 1)
        {
          BUZipLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            sub_212E6DFE8(v21, v22, v23, v24, v25, v26, v27, v28);
LABEL_19:

          *((_BYTE *)v43 + 24) = 0;
          goto LABEL_20;
        }
        goto LABEL_16;
      }
      if (v19)
      {
LABEL_16:
        v20 = 1;
        goto LABEL_21;
      }
LABEL_20:
      objc_msgSend_handleFailureWithHandler_error_(self, v18, (uint64_t)v14, 0);
      v20 = *((_BYTE *)v43 + 24) != 0;
      goto LABEL_21;
    }
LABEL_8:
    if (self->_CRC != *a5)
    {
      BUZipLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_212E6E018(v21, v29, v30, v31, v32, v33, v34, v35);
      goto LABEL_19;
    }
    goto LABEL_9;
  }
  v20 = 1;
  if (a5 && *a4 == 1)
    goto LABEL_8;
LABEL_21:

  _Block_object_dispose(&v42, 8);
  return v20;
}

- (void)handleFailureWithHandler:(id)a3 error:(id)a4
{
  void (*v5)(void);
  void *v6;
  id v7;
  const char *v8;
  id v9;

  if (a4)
  {
    v5 = (void (*)(void))*((_QWORD *)a3 + 2);
    v9 = a3;
    v5();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = a3;
    objc_msgSend_bu_fileReadUnknownErrorWithUserInfo_(v6, v8, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(v7, 1, 0);

  }
}

- (void)close
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_readChannel(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_close(v4, v5, v6);

  MEMORY[0x24BEDD108](self, sel_setReadChannel_, 0);
}

- (BUStreamReadChannel)readChannel
{
  return self->_readChannel;
}

- (void)setReadChannel:(id)a3
{
  objc_storeStrong((id *)&self->_readChannel, a3);
}

- (unint64_t)remainingUncompressedSize
{
  return self->_remainingUncompressedSize;
}

- (void)setRemainingUncompressedSize:(unint64_t)a3
{
  self->_remainingUncompressedSize = a3;
}

- (unsigned)CRC
{
  return self->_CRC;
}

- (void)setCRC:(unsigned int)a3
{
  self->_CRC = a3;
}

- (BOOL)validateCRC
{
  return self->_validateCRC;
}

- (void)setValidateCRC:(BOOL)a3
{
  self->_validateCRC = a3;
}

- (unint64_t)outBufferSize
{
  return self->_outBufferSize;
}

- (void)setOutBufferSize:(unint64_t)a3
{
  self->_outBufferSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end
