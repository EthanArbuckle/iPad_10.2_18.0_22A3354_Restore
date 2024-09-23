@implementation CKDProtobufStreamWriter

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  unint64_t curDataPos;
  uint64_t Object;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  NSOutputStream *v21;
  NSObject *v22;
  NSOutputStream *outputStream;
  void *v24;
  const char *v25;
  int v26;
  NSOutputStream *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, CFSTR("CKDProtobufStreamWriter.m"), 269, CFSTR("I didn't order this stream, so why is it on my bill?"));

  }
  if ((objc_msgSend_haveFinishedStreaming(self, v8, v9) & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1C3B83E24]();
    if (a4 != 16)
    {
      if (a4 == 8)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v17 = (void *)*MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          v18 = v17;
          objc_msgSend_streamError(v7, v19, v20);
          v21 = (NSOutputStream *)objc_claimAutoreleasedReturnValue();
          v26 = 138412290;
          v27 = v21;
          _os_log_error_impl(&dword_1BE990000, v18, OS_LOG_TYPE_ERROR, "Got a stream error: %@", (uint8_t *)&v26, 0xCu);

        }
        goto LABEL_22;
      }
      if (a4 != 4)
        goto LABEL_22;
      if (!objc_msgSend_count(self->_allObjects, v10, v11))
      {
        curDataPos = self->_curDataPos;
        if (curDataPos >= objc_msgSend_length(self->_curData, v13, v14))
        {
LABEL_11:
          if ((objc_msgSend__finishStreaming_(self, v13, (uint64_t)self->_outputStream) & 1) == 0)
            goto LABEL_22;
          goto LABEL_21;
        }
      }
      Object = objc_msgSend__streamNextObject_(self, v13, (uint64_t)self->_outputStream);
      if ((Object & 0x8000000000000000) == 0)
      {
        if (!Object)
          goto LABEL_11;
LABEL_22:
        objc_autoreleasePoolPop(v12);
        goto LABEL_23;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v22 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        outputStream = self->_outputStream;
        v26 = 134217984;
        v27 = outputStream;
        _os_log_error_impl(&dword_1BE990000, v22, OS_LOG_TYPE_ERROR, "Failed to write into the outputStream:%p", (uint8_t *)&v26, 0xCu);
      }
    }
LABEL_21:
    objc_msgSend_tearDown(self, v10, v11);
    goto LABEL_22;
  }
LABEL_23:

}

- (BOOL)haveFinishedStreaming
{
  return self->_haveFinishedStreaming;
}

- (BOOL)_finishStreaming:(id)a3
{
  const char *v4;
  BOOL result;
  NSData *v6;
  NSData *curData;
  const char *v8;

  if (!objc_msgSend_shouldCompress(self, a2, (uint64_t)a3))
    return 1;
  result = 1;
  if (!self->_haveFlushedZlib)
  {
    self->_haveFlushedZlib = 1;
    objc_msgSend__compressBodyData_shouldFlush_(self, v4, 0, 1);
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    curData = self->_curData;
    self->_curData = v6;

    self->_curDataPos = 0;
    objc_msgSend__streamNextObject_(self, v8, (uint64_t)self->_outputStream);
    return 0;
  }
  return result;
}

- (BOOL)shouldCompress
{
  return self->_shouldCompress;
}

- (id)_compressBodyData:(id)a3 shouldFlush:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  int v20;
  const char *v21;
  void *v23;
  const char *v24;
  _BYTE v25[8192];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend_data(MEMORY[0x1E0C99DF0], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  bzero(v25, 0x2000uLL);
  v11 = v7;
  self->_zlibStream.next_in = (Bytef *)objc_msgSend_bytes(v11, v12, v13);
  self->_zlibStream.avail_in = objc_msgSend_length(v11, v14, v15);
  if (v4)
  {
    if (objc_msgSend_haveFinishedCompression(self, v16, v17))
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, CFSTR("CKDProtobufStreamWriter.m"), 172, CFSTR("We just tried to finish compression twice"));

    }
    objc_msgSend_setHaveFinishedCompression_(self, v18, 1);
    v20 = 4;
  }
  else
  {
    v20 = 0;
  }
  do
  {
    self->_zlibStream.avail_out = 0x2000;
    self->_zlibStream.next_out = v25;
    if (deflate(&self->_zlibStream, v20) == -2)
      __assert_rtn("-[CKDProtobufStreamWriter _compressBodyData:shouldFlush:]", "CKDProtobufStreamWriter.m", 181, "ret != Z_STREAM_ERROR");
    objc_msgSend_appendBytes_length_(v10, v21, (uint64_t)v25, 0x2000 - self->_zlibStream.avail_out);
  }
  while (!self->_zlibStream.avail_out);
  if (self->_zlibStream.avail_in)
    __assert_rtn("-[CKDProtobufStreamWriter _compressBodyData:shouldFlush:]", "CKDProtobufStreamWriter.m", 185, "_zlibStream.avail_in == 0");

  return v10;
}

- (int64_t)_streamNextObject:(id)a3
{
  id v4;
  unint64_t curDataPos;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  NSData *curData;

  v4 = a3;
  curDataPos = self->_curDataPos;
  if (curDataPos >= objc_msgSend_length(self->_curData, v6, v7))
  {
    while (objc_msgSend_count(self->_allObjects, v8, v9))
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_allObjects, v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectAtIndex_(self->_allObjects, v13, 0);
      objc_msgSend__prepareObjectForStreaming_(self, v14, (uint64_t)v12);

      curData = self->_curData;
      if (curData && objc_msgSend_length(curData, v8, v9))
        goto LABEL_2;
    }
    v10 = 0;
  }
  else
  {
LABEL_2:
    v10 = objc_msgSend__writeDataToStream_(self, v8, (uint64_t)v4);
  }

  return v10;
}

- (int64_t)_writeDataToStream:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  unint64_t curDataPos;
  NSData *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  int64_t v19;

  v4 = a3;
  if (objc_msgSend_length(self->_curData, v5, v6)
    && (curDataPos = self->_curDataPos, curDataPos < objc_msgSend_length(self->_curData, v7, v8)))
  {
    v10 = self->_curData;
    v13 = objc_msgSend_bytes(v10, v11, v12) + self->_curDataPos;
    v16 = objc_msgSend_length(v10, v14, v15);
    v18 = objc_msgSend_write_maxLength_(v4, v17, v13, v16 - self->_curDataPos);
    v19 = v18;
    if (v18 >= 1)
      self->_curDataPos += v18;

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_tearDownOutputStream
{
  CKDProtobufStreamWriter *v2;
  NSObject *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  NSOutputStream *v7;
  NSOutputStream *outputStream;
  int v9;
  NSOutputStream *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_outputStream)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v3 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      outputStream = v2->_outputStream;
      v9 = 134217984;
      v10 = outputStream;
      _os_log_debug_impl(&dword_1BE990000, v3, OS_LOG_TYPE_DEBUG, "Tearing down output stream: %p", (uint8_t *)&v9, 0xCu);
    }
    MEMORY[0x1C3B82A38](v2->_outputStream, 0);
    objc_msgSend_setDelegate_(v2->_outputStream, v4, 0);
    objc_msgSend_close(v2->_outputStream, v5, v6);
    v7 = v2->_outputStream;
    v2->_outputStream = 0;

  }
  if (v2->_hasInitedCompression)
  {
    deflateEnd(&v2->_zlibStream);
    v2->_hasInitedCompression = 0;
  }
  objc_sync_exit(v2);

}

- (void)tearDown
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  objc_msgSend_setHaveFinishedStreaming_(self, a2, 1);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE9B894C;
  block[3] = &unk_1E782EA40;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)setHaveFinishedStreaming:(BOOL)a3
{
  self->_haveFinishedStreaming = a3;
}

- (void)_prepareObjectForStreaming:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD);
  const char *v13;
  NSData *v14;
  NSData *curData;
  id v16;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend__dataForMessage_(v5, v6, (uint64_t)v4);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_logRequestObjectBlock(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_logRequestObjectBlock(self, v10, v11);
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v12)[2](v12, v16);

  }
  if (objc_msgSend_shouldCompress(self, v10, v11))
  {
    objc_msgSend__compressBodyData_shouldFlush_(self, v13, (uint64_t)v16, 0);
    v14 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = (NSData *)v16;
  }
  curData = self->_curData;
  self->_curData = v14;

  self->_curDataPos = 0;
}

- (id)logRequestObjectBlock
{
  return self->_logRequestObjectBlock;
}

- (void)setStreamedObjects:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *allObjects;

  v4 = (NSMutableArray *)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3);
  allObjects = self->_allObjects;
  self->_allObjects = v4;

}

- (void)setLogRequestObjectBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setHaveFinishedCompression:(BOOL)a3
{
  self->_haveFinishedCompression = a3;
}

- (id)open
{
  CKDProtobufStreamWriter *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  NSOutputStream *outputStream;
  const char *v19;
  int v20;
  id v21;
  id v22;
  uint8_t buf[4];
  NSOutputStream *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1E0C99E70];
  v21 = 0;
  v22 = 0;
  v6 = objc_msgSend_bufferSize(v2, v4, v5);
  objc_msgSend_createBoundInputStream_outputStream_bufferSize_(v3, v7, (uint64_t)&v22, &v21, v6);
  v8 = v22;
  v9 = v22;
  v10 = v21;
  v11 = v21;
  if (!v9)
  {
    v19 = "inputStream != nil";
    v20 = 146;
    goto LABEL_10;
  }
  v12 = v11;
  if (!v11)
  {
    v19 = "outputStream != nil";
    v20 = 147;
LABEL_10:
    __assert_rtn("-[CKDProtobufStreamWriter open]", "CKDProtobufStreamWriter.m", v20, v19);
  }
  objc_storeStrong((id *)&v2->_inputStream, v8);
  objc_storeStrong((id *)&v2->_outputStream, v10);
  objc_msgSend_setDelegate_(v2->_outputStream, v13, (uint64_t)v2);
  MEMORY[0x1C3B82A38](v2->_outputStream, v2->_dispatchQueue);
  objc_msgSend_open(v2->_outputStream, v14, v15);
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v16 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    outputStream = v2->_outputStream;
    *(_DWORD *)buf = 134217984;
    v24 = outputStream;
    _os_log_debug_impl(&dword_1BE990000, v16, OS_LOG_TYPE_DEBUG, "Opened outputStream: %p", buf, 0xCu);
  }

  objc_sync_exit(v2);
  return v9;
}

- (CKDProtobufStreamWriter)initWithCompression:(BOOL)a3
{
  _BOOL4 v3;
  CKDProtobufStreamWriter *v4;
  CKDProtobufStreamWriter *v5;
  int v6;
  int v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *dispatchQueue;
  objc_super v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)CKDProtobufStreamWriter;
  v4 = -[CKDProtobufStreamWriter init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_curDataPos = 0;
    v4->_shouldCompress = v3;
    if (v3)
    {
      v4->_zlibStream.zalloc = 0;
      v4->_zlibStream.zfree = 0;
      v4->_zlibStream.opaque = 0;
      v6 = deflateInit2_(&v4->_zlibStream, -1, 8, 31, 8, 0, "1.2.12", 112);
      if (v6)
      {
        v7 = v6;
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v8 = *MEMORY[0x1E0C952B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v20 = v7;
          _os_log_error_impl(&dword_1BE990000, v8, OS_LOG_TYPE_ERROR, "Could not initialize zlib for compression, error %d", buf, 8u);
        }
        v5->_shouldCompress = 0;
      }
      else
      {
        v5->_hasInitedCompression = 1;
      }
    }
    v5->_bufferSize = 1024;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v13, v14);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v15;

  }
  return v5;
}

- (BOOL)haveFinishedCompression
{
  return self->_haveFinishedCompression;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend__tearDownOutputStream(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CKDProtobufStreamWriter;
  -[CKDProtobufStreamWriter dealloc](&v4, sel_dealloc);
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryLogFileHandle, 0);
  objc_storeStrong(&self->_logRequestObjectBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_curData, 0);
  objc_storeStrong((id *)&self->_allObjects, 0);
}

+ (id)_dataForMessage:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend_data(a3, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v11 = 0;
  objc_msgSend_length(v3, v4, v5);
  v6 = PBDataWriterWriteBareVarint();
  v7 = (void *)objc_opt_new();
  objc_msgSend_appendBytes_length_(v7, v8, (uint64_t)&v11, v6);
  objc_msgSend_appendData_(v7, v9, (uint64_t)v3);

  return v7;
}

+ (id)uncompressedDataForStreamedObjects:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v20, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v6);
        objc_msgSend__dataForMessage_(a1, v9, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendData_(v5, v14, (uint64_t)v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v20, 16);
    }
    while (v10);
  }

  return v5;
}

- (void)setShouldCompress:(BOOL)a3
{
  self->_shouldCompress = a3;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (NSFileHandle)binaryLogFileHandle
{
  return self->_binaryLogFileHandle;
}

- (void)setBinaryLogFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_binaryLogFileHandle, a3);
}

- (BOOL)hasInitedCompression
{
  return self->_hasInitedCompression;
}

- (void)setHasInitedCompression:(BOOL)a3
{
  self->_hasInitedCompression = a3;
}

@end
