@implementation HTDeveloperApp

- (HTDeveloperApp)initWithName:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  HTDeveloperApp *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *bundleID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HTDeveloperApp;
  v8 = -[HTDeveloperApp init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v11;

  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
