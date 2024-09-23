@implementation IDSCKContainer

+ (Class)__class
{
  if (qword_1EE40B070 != -1)
    dispatch_once(&qword_1EE40B070, &unk_1E3C20618);
  return (Class)(id)qword_1EE40B068;
}

+ (IDSCKContainer)containerWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;

  v3 = a3;
  v4 = (void *)CUTWeakLinkClass();
  objc_msgSend_containerWithIdentifier_(v4, v5, (uint64_t)v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (IDSCKContainer *)v7;
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (IDSCKDatabase)privateCloudDatabase
{
  return self->_privateCloudDatabase;
}

- (IDSCKDatabase)publicCloudDatabase
{
  return self->_publicCloudDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicCloudDatabase, 0);
  objc_storeStrong((id *)&self->_privateCloudDatabase, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end
