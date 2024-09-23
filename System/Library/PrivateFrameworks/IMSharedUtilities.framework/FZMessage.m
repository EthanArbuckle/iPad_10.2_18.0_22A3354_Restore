@implementation FZMessage

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FZMessage;
  return -[IMMessageItem copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (FZMessage)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FZMessage;
  return -[IMMessageItem initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FZMessage;
  -[IMMessageItem encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FZMessage;
  -[IMItem encodeWithIMRemoteObjectSerializedDictionary:](&v3, sel_encodeWithIMRemoteObjectSerializedDictionary_, a3);
}

- (FZMessage)initWithIMRemoteObjectSerializedDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FZMessage;
  return -[IMItem initWithIMRemoteObjectSerializedDictionary:](&v4, sel_initWithIMRemoteObjectSerializedDictionary_, a3);
}

@end
