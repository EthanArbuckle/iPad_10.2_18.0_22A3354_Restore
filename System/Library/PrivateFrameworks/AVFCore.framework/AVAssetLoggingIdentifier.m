@implementation AVAssetLoggingIdentifier

- (AVAssetLoggingIdentifier)init
{
  AVAssetLoggingIdentifier *v2;
  AVAssetLoggingIdentifierInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAssetLoggingIdentifier;
  v2 = -[AVAssetLoggingIdentifier init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVAssetLoggingIdentifierInternal);
    v2->_priv = v3;
    if (v3)
    {
      v3->derivedIdentifierCounter = 0;
      v2->_priv->identifierName = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("I/%@"), (id)FigCFStringCreateLoggingIdentifierOfLength());
      CFRetain(v2->_priv);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (NSString)name
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", self->_priv->identifierName);
}

- (id)makeDerivedIdentifier
{
  AVSpecifiedLoggingIdentifier *v3;

  ++self->_priv->derivedIdentifierCounter;
  v3 = [AVSpecifiedLoggingIdentifier alloc];
  return -[AVSpecifiedLoggingIdentifier initWithSpecifiedName:](v3, "initWithSpecifiedName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%02d"), -[AVAssetLoggingIdentifier name](self, "name"), self->_priv->derivedIdentifierCounter));
}

- (void)dealloc
{
  AVAssetLoggingIdentifierInternal *priv;
  objc_super v4;

  priv = self->_priv;
  if (priv)
  {

    CFRelease(self->_priv);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetLoggingIdentifier;
  -[AVAssetLoggingIdentifier dealloc](&v4, sel_dealloc);
}

@end
