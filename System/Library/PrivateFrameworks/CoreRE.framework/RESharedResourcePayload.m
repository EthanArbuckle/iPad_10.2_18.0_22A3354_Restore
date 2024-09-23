@implementation RESharedResourcePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RESharedResourcePayload)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RESharedResourcePayload;
  return -[RESharedResourcePayload init](&v3, sel_init);
}

- (RESharedResourcePayload)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RESharedResourcePayload;
  return -[RESharedResourcePayload init](&v4, sel_init, a3);
}

- (NSObject)clientObject
{
  return objc_loadWeakRetained((id *)&self->_clientObject);
}

- (void)setClientObject:(id)a3
{
  objc_storeWeak((id *)&self->_clientObject, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientObject);
}

@end
