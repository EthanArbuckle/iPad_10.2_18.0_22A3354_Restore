@implementation QLCacheBasicFileIdentifier

- (unint64_t)hash
{
  return self->_fileId;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t fileId;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    fileId = self->_fileId;
    v6 = fileId == objc_msgSend(v4, "fileId");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)fileId
{
  return self->_fileId;
}

- (QLCacheBasicFileIdentifier)initWithFileURL:(id)a3 error:(id *)p_isa
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  stat v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  memset(&v13, 0, sizeof(v13));
  v6 = objc_retainAutorelease(a3);
  if (!stat((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v13))
  {
    self = -[QLCacheBasicFileIdentifier initWithFileId:fsid:](self, "initWithFileId:fsid:", v13.st_ino, v13.st_dev);
    p_isa = (id *)&self->super.super.isa;
    goto LABEL_8;
  }
  v7 = *__error();
  v8 = qword_1ED10E720;
  if (!qword_1ED10E720)
  {
    QLTInitLogging();
    v8 = qword_1ED10E720;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[QLCacheBasicFileIdentifier initWithFileURL:error:].cold.1(v8, (uint64_t)self, v7);
    if (!p_isa)
      goto LABEL_8;
    goto LABEL_6;
  }
  if (p_isa)
  {
LABEL_6:
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2FE0];
    v14 = *MEMORY[0x1E0CB3308];
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, *(_QWORD *)&v13.st_dev);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v7, v11);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    p_isa = 0;
  }
LABEL_8:

  return (QLCacheBasicFileIdentifier *)p_isa;
}

- (QLCacheBasicFileIdentifier)initWithFileId:(unint64_t)a3 fsid:(fsid)a4
{
  QLCacheBasicFileIdentifier *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)QLCacheBasicFileIdentifier;
  result = -[QLCacheBasicFileIdentifier init](&v7, sel_init);
  if (result)
  {
    result->_fileId = a3;
    result->_fsid = a4;
  }
  return result;
}

- (QLCacheBasicFileIdentifier)initWithCoder:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("fsid_1"));
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("fsid_2"));
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("i"));

  return -[QLCacheBasicFileIdentifier initWithFileId:fsid:](self, "initWithFileId:fsid:", v7, v5 | (unint64_t)(v6 << 32));
}

- (void)encodeWithCoder:(id)a3
{
  unsigned int *v3;
  unint64_t fileId;
  id v5;

  v3 = (unsigned int *)self;
  fileId = self->_fileId;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", fileId, CFSTR("i"));
  v3 += 4;
  objc_msgSend(v5, "encodeInt32:forKey:", *v3, CFSTR("fsid_1"));
  objc_msgSend(v5, "encodeInt32:forKey:", v3[1], CFSTR("fsid_2"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFileId:fsid:", self->_fileId, *(_QWORD *)&self->_fsid);
}

- (fsid)fsid
{
  fsid dest;

  objc_copyStruct(&dest, &self->_fsid, 8, 1, 0);
  return dest;
}

+ (Class)versionedFileIdentifierClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p ino:%llu>"), objc_opt_class(), self, self->_fileId);
}

- (void)initWithFileURL:(int)a3 error:.cold.1(void *a1, uint64_t a2, int a3)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = 138412802;
  v6 = objc_opt_class();
  v7 = 1024;
  v8 = a3;
  v9 = 2080;
  v10 = strerror(a3);
  _os_log_error_impl(&dword_1AE3F5000, v4, OS_LOG_TYPE_ERROR, "could not init %@: error %d (%s)", (uint8_t *)&v5, 0x1Cu);

}

@end
