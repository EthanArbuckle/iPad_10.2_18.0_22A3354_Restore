@implementation AVContentKeyRequestParams

- (AVContentKeyRequestParams)initWithInitializationData:(id)a3 contentIdentifier:(id)a4 keyIDFromInitializationData:(id)a5 options:(id)a6 identifier:(id)a7
{
  AVContentKeyRequestParams *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVContentKeyRequestParams;
  v12 = -[AVContentKeyRequestParams init](&v14, sel_init);
  if (v12)
  {
    v12->_initializationData = (NSData *)objc_msgSend(a3, "copy");
    v12->_contentIdentifier = (NSData *)objc_msgSend(a4, "copy");
    v12->_keyIDFromInitializationData = (NSData *)objc_msgSend(a5, "copy");
    v12->_options = (NSDictionary *)objc_msgSend(a6, "copy");
    v12->_identifier = (id)objc_msgSend(a7, "copy");
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVContentKeyRequestParams;
  -[AVContentKeyRequestParams dealloc](&v3, sel_dealloc);
}

- (NSData)initializationData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInitializationData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSData)contentIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContentIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSData)keyIDFromInitializationData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKeyIDFromInitializationData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

@end
