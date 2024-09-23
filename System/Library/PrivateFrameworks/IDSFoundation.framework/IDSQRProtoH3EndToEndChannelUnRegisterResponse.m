@implementation IDSQRProtoH3EndToEndChannelUnRegisterResponse

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoH3EndToEndChannelUnRegisterResponse;
  -[IDSQRProtoH3EndToEndChannelUnRegisterResponse description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  double v3;

  return (id)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoH3EndToEndChannelUnRegisterResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;

  v4 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v4, v5, (uint64_t)a3, v6);
  return (id)objc_msgSend_init(v7, v8, v9, v10);
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  double v6;
  char isMemberOfClass;

  v3 = a3;
  v4 = objc_opt_class();
  isMemberOfClass = objc_msgSend_isMemberOfClass_(v3, v5, v4, v6);

  return isMemberOfClass;
}

- (unint64_t)hash
{
  return 0;
}

@end
