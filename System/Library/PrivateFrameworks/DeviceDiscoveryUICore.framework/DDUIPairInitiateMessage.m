@implementation DDUIPairInitiateMessage

- (DDUIPairInitiateMessage)initWithApplicationInfo:(id)a3
{
  id v5;
  DDUIPairInitiateMessage *v6;
  DDUIPairInitiateMessage *v7;
  DDUIPairInitiateMessage *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)DDUIPairInitiateMessage;
    v6 = -[DDUIPairInitiateMessage init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_applicationInfo, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (DDUIPairInitiateMessage)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  DDUIApplicationInfo *v5;
  DDUIPairInitiateMessage *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[DDUIApplicationInfo initWithDictionaryRepresentation:]([DDUIApplicationInfo alloc], "initWithDictionaryRepresentation:", v4);

    self = -[DDUIPairInitiateMessage initWithApplicationInfo:](self, "initWithApplicationInfo:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;

  -[DDUIPairInitiateMessage applicationInfo](self, "applicationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; applicationInfo = %@>"),
               objc_opt_class(),
               self,
               self->_applicationInfo);
}

- (DDUIApplicationInfo)applicationInfo
{
  return self->_applicationInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationInfo, 0);
}

@end
