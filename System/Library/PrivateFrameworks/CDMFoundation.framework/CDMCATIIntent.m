@implementation CDMCATIIntent

- (CDMCATIIntent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CDMCATIIntent;
  return -[CDMCATIIntent init](&v3, sel_init);
}

- (CDMCATIIntent)initWithGuid:(id)a3 intentName:(id)a4 ensemble:(id)a5
{
  NSString *v8;
  NSString *v9;
  NSString *v10;
  CDMCATIIntent *v11;
  NSString *guid;
  NSString *v13;
  NSString *intentName;
  NSString *v15;
  NSString *ensemble;

  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  v10 = (NSString *)a5;
  v11 = -[CDMCATIIntent init](self, "init");
  guid = v11->_guid;
  v11->_guid = v8;
  v13 = v8;

  intentName = v11->_intentName;
  v11->_intentName = v9;
  v15 = v9;

  ensemble = v11->_ensemble;
  v11->_ensemble = v10;

  return v11;
}

- (NSString)guid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)intentName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIntentName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)ensemble
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnsemble:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ensemble, 0);
  objc_storeStrong((id *)&self->_intentName, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
