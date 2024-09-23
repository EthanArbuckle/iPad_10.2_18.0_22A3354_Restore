@implementation BMStreamMetadata

- (Class)eventDataClass
{
  return self->_eventDataClass;
}

- (BOOL)isEqual:(id)a3
{
  BMStreamMetadata *v4;
  BMStreamMetadata *v5;
  NSString *streamId;
  Class eventDataClass;
  char v8;
  BMAccount *account;
  NSString *remoteStreamName;
  BMPruningPolicy *pruningPolicy;
  BMPruningPolicy *v13;
  BMPruningPolicy *v14;
  void *v15;

  v4 = (BMStreamMetadata *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      streamId = self->_streamId;
      if ((streamId == v5->_streamId || -[NSString isEqual:](streamId, "isEqual:"))
        && (eventDataClass = self->_eventDataClass,
            eventDataClass == -[BMStreamMetadata eventDataClass](v5, "eventDataClass"))
        && ((account = self->_account, account == v5->_account)
         || -[BMAccount isEqual:](account, "isEqual:"))
        && ((remoteStreamName = self->_remoteStreamName, remoteStreamName == v5->_remoteStreamName)
         || -[NSString isEqual:](remoteStreamName, "isEqual:")))
      {
        pruningPolicy = self->_pruningPolicy;
        -[BMStreamMetadata pruningPolicy](v5, "pruningPolicy");
        v13 = (BMPruningPolicy *)objc_claimAutoreleasedReturnValue();
        if (pruningPolicy == v13)
        {
          v8 = 1;
        }
        else
        {
          v14 = self->_pruningPolicy;
          -[BMStreamMetadata pruningPolicy](v5, "pruningPolicy");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = -[BMPruningPolicy isEqual:](v14, "isEqual:", v15);

        }
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BMPruningPolicy)pruningPolicy
{
  return self->_pruningPolicy;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BMPruningPolicy *pruningPolicy;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_streamId, CFSTR("streamId"));
  NSStringFromClass(self->_eventDataClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMStreamMetadata encodeWithCoder:].cold.1(v6);

  }
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("eventType"));
  pruningPolicy = self->_pruningPolicy;
  if (pruningPolicy)
  {
    v14[0] = CFSTR("pruneOnAccess");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPruningPolicy pruneOnAccess](pruningPolicy, "pruneOnAccess"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v14[1] = CFSTR("maxAge");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMPruningPolicy maxAge](self->_pruningPolicy, "maxAge");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v10;
    v14[2] = CFSTR("maxStreamSize");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BMPruningPolicy maxStreamSize](self->_pruningPolicy, "maxStreamSize"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v11;
    v14[3] = CFSTR("filterByAgeOnRead");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPruningPolicy filterByAgeOnRead](self->_pruningPolicy, "filterByAgeOnRead"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("pruningPolicy"));
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_account, CFSTR("account"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_remoteStreamName, CFSTR("remoteName"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_remoteStreamName, 0);
  objc_storeStrong((id *)&self->_pruningPolicy, 0);
  objc_storeStrong((id *)&self->_eventDataClass, 0);
  objc_storeStrong((id *)&self->_streamId, 0);
}

- (BMStreamMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  BMStreamMetadata *v7;
  Class v8;
  Class v9;
  void *v10;
  char v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v30;
  void *v31;
  BMPruningPolicy *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD block[5];
  _BYTE buf[24];
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("streamId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventType"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!-[BMStreamMetadata checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v6, CFSTR("eventType"), v4, CFSTR("com.apple.biome.BMStreamMetadata"), -1))
  {
    v8 = NSClassFromString(v6);
    if (!v8)
    {
      __biome_log_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[BMStreamMetadata initWithCoder:].cold.1((uint64_t)v6, v15);
      v7 = 0;
      goto LABEL_26;
    }
    v9 = v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "allowedClasses");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v9);

      if ((v11 & 1) != 0)
        goto LABEL_19;
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v37 = 16;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __34__BMStreamMetadata_initWithCoder___block_invoke_29;
      v34[3] = &unk_1E5565DA8;
      v34[4] = buf;
      if (initWithCoder__onceToken_28 != -1)
        dispatch_once(&initWithCoder__onceToken_28, v34);
      v13 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v12, v13))
      {
        v14 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        _os_log_impl(&dword_1A95BD000, v12, v13, "Event class '%@' missing from %@ allowedClasses", buf, 0x16u);
      }
    }
    else
    {
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v37 = 16;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __34__BMStreamMetadata_initWithCoder___block_invoke;
      block[3] = &unk_1E5565DA8;
      block[4] = buf;
      if (initWithCoder__onceToken_0 != -1)
        dispatch_once(&initWithCoder__onceToken_0, block);
      v16 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v12, v16))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v6;
        _os_log_impl(&dword_1A95BD000, v12, v16, "Class \"%@\" doesn't conform to BMStoreData", buf, 0xCu);
      }
      v9 = 0;
    }

LABEL_19:
    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("pruningPolicy"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (-[BMStreamMetadata checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForid:key:coder:errorDomain:errorCode:", v20, CFSTR("pruningPolicy"), v4, CFSTR("com.apple.biome.BMStreamMetadata"), -1))
      {
        v7 = 0;
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      v32 = [BMPruningPolicy alloc];
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("pruneOnAccess"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v33, "unsignedIntegerValue") != 0;
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("filterByAgeOnRead"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v31, "BOOLValue");
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("maxAge"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v25 = v24;
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("maxStreamSize"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[BMPruningPolicy initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:](v32, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", v30, v22, objc_msgSend(v26, "unsignedIntValue"), v25);

    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[BMStreamMetadata initWithStreamId:eventType:account:remoteStreamName:pruningPolicy:](self, "initWithStreamId:eventType:account:remoteStreamName:pruningPolicy:", v5, v9, v27, v28, v21);

    v7 = self;
    goto LABEL_25;
  }
  v7 = 0;
LABEL_27:

  return v7;
}

- (BMStreamMetadata)initWithStreamId:(id)a3 eventType:(Class)a4 account:(id)a5 remoteStreamName:(id)a6 pruningPolicy:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BMStreamMetadata *v16;
  uint64_t v17;
  NSString *streamId;
  uint64_t v19;
  NSString *remoteStreamName;
  objc_super v22;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)BMStreamMetadata;
  v16 = -[BMStreamMetadata init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    streamId = v16->_streamId;
    v16->_streamId = (NSString *)v17;

    objc_storeStrong((id *)&v16->_eventDataClass, a4);
    objc_storeStrong((id *)&v16->_account, a5);
    v19 = objc_msgSend(v14, "copy");
    remoteStreamName = v16->_remoteStreamName;
    v16->_remoteStreamName = (NSString *)v19;

    objc_storeStrong((id *)&v16->_pruningPolicy, a7);
  }

  return v16;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode key %@"), v11, *MEMORY[0x1E0CB2D50]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v13, a7, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)setRemoteStreamName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMStreamMetadata)initWithStreamId:(id)a3 eventType:(Class)a4 remoteStreamName:(id)a5 pruningPolicy:(id)a6
{
  return -[BMStreamMetadata initWithStreamId:eventType:account:remoteStreamName:pruningPolicy:](self, "initWithStreamId:eventType:account:remoteStreamName:pruningPolicy:", a3, a4, 0, a5, a6);
}

- (BOOL)isRemote
{
  return self->_remoteStreamName != 0;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_streamId, "hash");
  v4 = -[objc_class hash](self->_eventDataClass, "hash") ^ v3;
  v5 = -[BMAccount hash](self->_account, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_remoteStreamName, "hash");
  return v6 ^ -[BMPruningPolicy hash](self->_pruningPolicy, "hash");
}

uint64_t __34__BMStreamMetadata_initWithCoder___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __34__BMStreamMetadata_initWithCoder___block_invoke_29(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 17;
  return result;
}

- (NSString)streamId
{
  return self->_streamId;
}

- (NSString)remoteStreamName
{
  return self->_remoteStreamName;
}

- (BMAccount)account
{
  return self->_account;
}

- (void)encodeWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A95BD000, log, OS_LOG_TYPE_ERROR, "Can't get class string", v1, 2u);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A95BD000, a2, OS_LOG_TYPE_ERROR, "Can't get class from class string - %@", (uint8_t *)&v2, 0xCu);
}

@end
