@implementation GSDocumentIdentifier

- (GSDocumentIdentifier)initWithFileDescriptor:(int)a3 forItemAtURL:(id)a4 allocateIfNone:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  uint64_t v8;
  id v10;
  GSDocumentIdentifier *v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  NSObject *v20;
  int v21;
  objc_super v22;
  statfs v23;
  uint64_t v24;

  v7 = a5;
  v8 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)GSDocumentIdentifier;
  v11 = -[GSDocumentIdentifier init](&v22, sel_init);
  if (v11)
  {
    memset(&v23, 0, 512);
    v21 = 0;
    if (fstatfs(v8, &v23) < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("statfs(%@) failed"), v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *__error();
      gs_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        goto LABEL_15;
    }
    else
    {
      if (!+[GSStorageManager _isPermanentStorageSupportedForStatFSInfo:error:](GSStorageManager, "_isPermanentStorageSupportedForStatFSInfo:error:", &v23, a6))
      {
LABEL_19:

        v11 = 0;
        goto LABEL_20;
      }
      if (get_volume_uuid(v23.f_mntonname, v11->volumeUUID))
      {
        v12 = GSGetDocumentID(v8, &v21);
        v13 = v12;
        v11->documentID = v12;
        if (v12 || !v7)
          goto LABEL_9;
        if (+[GSStorageManager _isPermanentStorageSupportedForFD:error:](GSStorageManager, "_isPermanentStorageSupportedForFD:error:", v8, a6))
        {
          v14 = GSTrackDocument(v8);
          v13 = v14;
          v11->documentID = v14;
          if (v14)
          {
LABEL_9:
            if (v13)
            {
              v11->deviceID = v23.f_fsid.val[0];
              goto LABEL_20;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no storage for %@"), v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            gs_default_log();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              -[GSDocumentIdentifier initWithFileDescriptor:forItemAtURL:allocateIfNone:error:].cold.3();

            if (!a6)
              goto LABEL_18;
            _GSErrorForStatus(102, v15, 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to acquire document ID for %@"), v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *__error();
          gs_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            goto LABEL_22;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("permanent storage not supported for %@"), v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *__error();
          gs_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
LABEL_22:
            _RemoveTreeInternal_cold_1();
        }
LABEL_15:

        if (!a6)
        {
LABEL_18:

          goto LABEL_19;
        }
        _GSErrorForErrno(v16, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
        *a6 = v18;
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to get device uuid for %s"), v23.f_mntonname);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *__error();
      gs_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        goto LABEL_15;
    }
    _RemoveTreeInternal_cold_1();
    goto LABEL_15;
  }
LABEL_20:

  return v11;
}

- (GSDocumentIdentifier)initWithDocumentIdentifier:(id)a3
{
  char *v4;
  char *v5;
  GSDocumentIdentifier *v6;
  objc_super v8;

  v4 = (char *)a3;
  v8.receiver = self;
  v8.super_class = (Class)GSDocumentIdentifier;
  v5 = -[GSDocumentIdentifier init](&v8, sel_init);
  v6 = (GSDocumentIdentifier *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = *(_OWORD *)(v4 + 8);
    *((_QWORD *)v5 + 3) = *((_QWORD *)v4 + 3);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDocumentIdentifier:", self);
}

- (void)encodeWithCoder:(id)a3
{
  unsigned __int8 *volumeUUID;
  id v5;

  volumeUUID = self->volumeUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeBytes:length:forKey:", volumeUUID, 16, CFSTR("u"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->documentID, CFSTR("i"));

}

- (GSDocumentIdentifier)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  id v6;
  _OWORD *v7;
  objc_super v9;
  uint64_t v10;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GSDocumentIdentifier;
  v10 = 0;
  v5 = -[GSDocumentIdentifier init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = (_OWORD *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("u"), &v10);
    if (v7 && v10 == 16)
      *(_OWORD *)(v5 + 8) = *v7;
    *((_QWORD *)v5 + 3) = objc_msgSend(v6, "decodeInt64ForKey:", CFSTR("i"));
  }

  return (GSDocumentIdentifier *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  CC_SHA256_CTX v4;
  unsigned __int8 md[32];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(&v4, 0, sizeof(v4));
  CC_SHA256_Init(&v4);
  CC_SHA256_Update(&v4, self->volumeUUID, 0x10u);
  CC_SHA256_Update(&v4, &self->documentID, 8u);
  CC_SHA256_Final(md, &v4);
  return *(_QWORD *)md;
}

- (BOOL)isEqual:(id)a3
{
  GSDocumentIdentifier *v4;
  BOOL v5;
  BOOL v6;

  v4 = (GSDocumentIdentifier *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    v6 = (objc_opt_isKindOfClass() & 1) != 0
      && (*(_QWORD *)self->volumeUUID == *(_QWORD *)v4->volumeUUID
        ? (v5 = *(_QWORD *)&self->volumeUUID[8] == *(_QWORD *)&v4->volumeUUID[8])
        : (v5 = 0),
          v5)
      && self->documentID == v4->documentID;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t documentID;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", self->volumeUUID);
  v4 = (void *)MEMORY[0x1E0CB3940];
  documentID = self->documentID;
  objc_msgSend(v3, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("docid:%lld on device %@"), documentID, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)initWithFileDescriptor:forItemAtURL:allocateIfNone:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_0(&dword_1D414C000, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
