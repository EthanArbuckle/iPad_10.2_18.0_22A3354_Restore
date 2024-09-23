@implementation INSDeviceInfo

- (INSDeviceInfo)initWithAceVersion:(id)a3
{
  id v5;
  INSDeviceInfo *v6;
  INSDeviceInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INSDeviceInfo;
  v6 = -[INSDeviceInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_aceVersion, a3);

  return v7;
}

- (void)setAceVersion:(id)a3
{
  NSString *v4;
  NSString *mutableAceVersion;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  mutableAceVersion = self->_mutableAceVersion;
  self->_mutableAceVersion = v4;

}

- (NSString)aceVersion
{
  return self->_aceVersion;
}

- (NSString)mutableAceVersion
{
  return self->_mutableAceVersion;
}

- (void)setMutableAceVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAceVersion, 0);
  objc_storeStrong((id *)&self->_aceVersion, 0);
}

+ (id)newWithBuilder:(id)a3
{
  void (**v4)(id, INSDeviceInfo *);
  INSDeviceInfo *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (void (**)(id, INSDeviceInfo *))a3;
  v5 = objc_alloc_init(INSDeviceInfo);
  if (v4)
  {
    v4[2](v4, v5);
    v6 = objc_alloc((Class)a1);
    -[INSDeviceInfo mutableAceVersion](v5, "mutableAceVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithAceVersion:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
