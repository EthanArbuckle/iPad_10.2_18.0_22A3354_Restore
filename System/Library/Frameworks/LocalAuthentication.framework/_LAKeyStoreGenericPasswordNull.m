@implementation _LAKeyStoreGenericPasswordNull

- (_LAKeyStoreGenericPasswordNull)init
{
  _LAKeyStoreGenericPasswordNull *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_LAKeyStoreGenericPasswordNull;
  v2 = -[_LAKeyStoreGenericPasswordNull init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

  }
  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)fetchDataWithContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[LAAuthorizationError resourceNotFound](LAAuthorizationError, "resourceNotFound");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a4 + 2))(v5, 0, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
