@implementation IKJSBlob

- (IKJSBlob)initWithData:(id)a3
{
  id v5;
  void *v6;
  IKJSBlob *v7;
  objc_super v9;

  v5 = a3;
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)IKJSBlob;
  v7 = -[IKJSObject initWithAppContext:](&v9, sel_initWithAppContext_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_data, a3);

  return v7;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
