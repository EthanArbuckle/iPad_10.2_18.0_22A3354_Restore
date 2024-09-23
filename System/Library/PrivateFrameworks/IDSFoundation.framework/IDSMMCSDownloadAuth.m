@implementation IDSMMCSDownloadAuth

- (IDSMMCSDownloadAuth)initWithSignature:(id)a3 authURL:(id)a4 ownerID:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  IDSMMCSDownloadAuth *v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("mS");
  v19[1] = CFSTR("mR");
  v20[0] = a3;
  v20[1] = a4;
  v19[2] = CFSTR("mO");
  v20[2] = a5;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v8, v12, (uint64_t)v20, v13, v19, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (IDSMMCSDownloadAuth *)objc_msgSend_initWithDictionaryRepresentation_(self, v15, (uint64_t)v14, v16);
  return v17;
}

- (IDSMMCSDownloadAuth)initWithDictionaryRepresentation:(id)a3
{
  id v5;
  IDSMMCSDownloadAuth *v6;
  IDSMMCSDownloadAuth *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSMMCSDownloadAuth;
  v6 = -[IDSMMCSDownloadAuth init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dictionaryRepresentation, a3);

  return v7;
}

- (NSData)signature
{
  double v2;

  return (NSData *)objc_msgSend_objectForKey_(self->_dictionaryRepresentation, a2, (uint64_t)CFSTR("mS"), v2);
}

- (NSString)authURL
{
  double v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_dictionaryRepresentation, a2, (uint64_t)CFSTR("mR"), v2);
}

- (NSString)ownerID
{
  double v2;

  return (NSString *)objc_msgSend_objectForKey_(self->_dictionaryRepresentation, a2, (uint64_t)CFSTR("mO"), v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  IDSMMCSDownloadAuth *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;

  v5 = [IDSMMCSDownloadAuth alloc];
  v8 = (void *)objc_msgSend_copyWithZone_(self->_dictionaryRepresentation, v6, (uint64_t)a3, v7);
  v11 = (void *)objc_msgSend_initWithDictionaryRepresentation_(v5, v9, (uint64_t)v8, v10);

  return v11;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

@end
