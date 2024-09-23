@implementation _MFDataCollector

- (_MFDataCollector)initWithLibrary:(id)a3 message:(id)a4 part:(id)a5 partial:(BOOL)a6 incomplete:(BOOL)a7 relaxDataProtection:(BOOL)a8 data:(id)a9
{
  id v16;
  id v17;
  _MFDataCollector *v18;
  _MFDataCollector *v19;
  NSData *v20;
  void *data;
  MFBufferedDataConsumer *v22;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v16 = a5;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)_MFDataCollector;
  v18 = -[_MFDataCollector init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_library, a3);
    objc_storeStrong((id *)&v19->_message, a4);
    objc_storeStrong((id *)&v19->_part, a5);
    v19->_partial = a6;
    v19->_incomplete = a7;
    v19->_relaxDataProtection = a8;
    if (v17)
    {
      v20 = (NSData *)v17;
      data = v19->_data;
      v19->_data = v20;
    }
    else
    {
      v22 = (MFBufferedDataConsumer *)objc_alloc_init(MEMORY[0x1E0D46068]);
      data = v19->_consumer;
      v19->_consumer = v22;
    }

  }
  return v19;
}

+ (void)writeData:(id)a3 library:(id)a4 message:(id)a5 isPartial:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  _MFDataCollector *v12;
  id v13;

  v6 = a6;
  v13 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A85B0E24]();
  v12 = -[_MFDataCollector initWithLibrary:message:part:partial:incomplete:relaxDataProtection:data:]([_MFDataCollector alloc], "initWithLibrary:message:part:partial:incomplete:relaxDataProtection:data:", v9, v10, 0, v6, 0, 0, v13);
  -[_MFDataCollector done](v12, "done");

  objc_autoreleasePoolPop(v11);
}

- (id)pathForStorage
{
  NSString *part;
  MFMailMessageLibrary *library;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  part = self->_part;
  library = self->_library;
  if (part)
    _dataPathForMessageAndPart(library, self->_message, part);
  else
    -[MFMailMessageLibrary dataPathForMessage:type:](library, "dataPathForMessage:type:", self->_message, self->_partial);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_pathByReplacingRelativePathWithFolderName:", CFSTR("mbox"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MFPersistenceLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_MFDataCollector pathForStorage].cold.1((uint64_t)v6, (uint64_t)v9, -[MFLibraryMessage libraryID](self->_message, "libraryID"));

  return v6;
}

- (int64_t)appendData:(id)a3
{
  id v5;
  MFBufferedDataConsumer *consumer;
  int64_t v7;
  void *v9;

  v5 = a3;
  consumer = self->_consumer;
  if (!consumer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailMessageLibrary.m"), 8399, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_consumer"));

    consumer = self->_consumer;
  }
  v7 = -[MFBufferedDataConsumer appendData:](consumer, "appendData:", v5);

  return v7;
}

- (void)done
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_4(&dword_1A4F90000, v1, (uint64_t)v1, "Exception occurred while writing to \"%@\": %@", v2);
  OUTLINED_FUNCTION_5();
}

- (id)data
{
  return -[MFBufferedDataConsumer data](self->_consumer, "data");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_part, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_consumer, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

- (void)pathForStorage
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_13(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_6_0(&dword_1A4F90000, v5, v3, "Sanitized path for libraryID %lld - %@", v4);
}

@end
