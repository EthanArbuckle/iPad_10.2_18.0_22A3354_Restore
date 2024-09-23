@implementation AVPlayerLoggingIdentifier

- (NSString)name
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", self->_priv->identifierName);
}

- (AVPlayerLoggingIdentifier)init
{
  AVPlayerLoggingIdentifier *v2;
  AVPlayerLoggingIdentifierInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVPlayerLoggingIdentifier;
  v2 = -[AVPlayerLoggingIdentifier init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVPlayerLoggingIdentifierInternal);
    v2->_priv = v3;
    if (v3)
    {
      v2->_priv->identifierName = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("P/%@"), (id)FigCFStringCreateLoggingIdentifierOfLength());
      CFRetain(v2->_priv);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  AVPlayerLoggingIdentifierInternal *priv;
  objc_super v4;

  priv = self->_priv;
  if (priv)
  {

    CFRelease(self->_priv);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerLoggingIdentifier;
  -[AVPlayerLoggingIdentifier dealloc](&v4, sel_dealloc);
}

@end
