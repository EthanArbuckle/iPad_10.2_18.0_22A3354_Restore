@implementation GDHomePerson

- (GDHomePerson)initWithHMPerson:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  GDHomePerson *v8;
  uint64_t v9;
  NSString *name;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUUID *uuid;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GDHomePerson;
  v8 = -[GDHomePerson init](&v17, sel_init);
  if (v8)
  {
    objc_msgSend_name(v4, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_msgSend_UUID(v4, v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v14;

  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
