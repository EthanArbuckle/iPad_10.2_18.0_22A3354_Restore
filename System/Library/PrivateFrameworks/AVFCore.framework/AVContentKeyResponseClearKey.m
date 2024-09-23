@implementation AVContentKeyResponseClearKey

- (AVContentKeyResponseClearKey)initWithKeyData:(id)a3 initializationVector:(id)a4
{
  AVContentKeyResponseClearKey *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVContentKeyResponseClearKey;
  v6 = -[AVContentKeyResponse initWithKeySystem:](&v8, sel_initWithKeySystem_, CFSTR("ClearKeySystem"));
  if (v6)
  {
    v6->_keyData = (NSData *)objc_msgSend(a3, "copy");
    v6->_initializationVector = (NSData *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVContentKeyResponseClearKey;
  -[AVContentKeyResponse dealloc](&v3, sel_dealloc);
}

@end
