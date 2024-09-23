@implementation NMSKeepLocalRequest

- (NMSKeepLocalRequest)initWithModelObject:(id)a3 enableState:(int64_t)a4
{
  id v7;
  NMSKeepLocalRequest *v8;
  NMSKeepLocalRequest *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NMSKeepLocalRequest;
  v8 = -[NMSKeepLocalRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_modelObject, a3);
    v9->_enableState = a4;
  }

  return v9;
}

- (void)performWithOptions:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Sub-classes should implement this method."), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (MPModelObject)modelObject
{
  return self->_modelObject;
}

- (int64_t)enableState
{
  return self->_enableState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelObject, 0);
}

@end
