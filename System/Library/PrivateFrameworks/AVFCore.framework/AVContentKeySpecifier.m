@implementation AVContentKeySpecifier

- (id)initForKeySystem:(id)a3 identifier:(id)a4 initializationData:(id)a5 options:(id)a6
{
  AVContentKeySpecifier *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVContentKeySpecifier;
  v10 = -[AVContentKeySpecifier init](&v12, sel_init);
  if (v10)
  {
    v10->_keySystem = (NSString *)objc_msgSend(a3, "copy");
    v10->_identifier = (id)objc_msgSend(a4, "copy");
    v10->_options = (NSDictionary *)objc_msgSend(a6, "copy");
    v10->_initializationData = (NSData *)objc_msgSend(a5, "copy");
  }
  return v10;
}

- (AVContentKeySpecifier)initForKeySystem:(AVContentKeySystem)keySystem identifier:(id)contentKeyIdentifier options:(NSDictionary *)options
{
  return (AVContentKeySpecifier *)-[AVContentKeySpecifier initForKeySystem:identifier:initializationData:options:](self, "initForKeySystem:identifier:initializationData:options:", keySystem, contentKeyIdentifier, 0, options);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVContentKeySpecifier;
  -[AVContentKeySpecifier dealloc](&v3, sel_dealloc);
}

+ (AVContentKeySpecifier)contentKeySpecifierForKeySystem:(AVContentKeySystem)keySystem identifier:(id)contentKeyIdentifier options:(NSDictionary *)options
{
  return (AVContentKeySpecifier *)-[AVContentKeySpecifier initForKeySystem:identifier:initializationData:options:]([AVContentKeySpecifier alloc], "initForKeySystem:identifier:initializationData:options:", keySystem, contentKeyIdentifier, 0, options);
}

- (AVContentKeySystem)keySystem
{
  return self->_keySystem;
}

- (id)identifier
{
  return self->_identifier;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSData)initializationData
{
  return (NSData *)(id)-[NSData copy](self->_initializationData, "copy");
}

- (id)initForKeySystem:(id)a3 initializationData:(id)a4
{
  return -[AVContentKeySpecifier initForKeySystem:identifier:initializationData:options:](self, "initForKeySystem:identifier:initializationData:options:", a3, 0, a4, 0);
}

@end
