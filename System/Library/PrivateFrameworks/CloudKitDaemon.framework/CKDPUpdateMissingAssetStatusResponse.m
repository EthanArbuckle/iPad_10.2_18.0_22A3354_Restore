@implementation CKDPUpdateMissingAssetStatusResponse

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPUpdateMissingAssetStatusResponse;
  -[CKDPUpdateMissingAssetStatusResponse description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;

  return (id)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEA3C814((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  v4 = (void *)objc_opt_class();
  v6 = (void *)objc_msgSend_allocWithZone_(v4, v5, (uint64_t)a3);
  return (id)objc_msgSend_init(v6, v7, v8);
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  char isMemberOfClass;

  v3 = a3;
  v4 = objc_opt_class();
  isMemberOfClass = objc_msgSend_isMemberOfClass_(v3, v5, v4);

  return isMemberOfClass;
}

- (unint64_t)hash
{
  return 0;
}

@end
