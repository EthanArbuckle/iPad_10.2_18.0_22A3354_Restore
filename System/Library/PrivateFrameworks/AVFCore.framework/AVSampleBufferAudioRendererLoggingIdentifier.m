@implementation AVSampleBufferAudioRendererLoggingIdentifier

- (AVSampleBufferAudioRendererLoggingIdentifier)init
{
  AVSampleBufferAudioRendererLoggingIdentifier *v2;
  AVSampleBufferAudioRendererLoggingIdentifierInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVSampleBufferAudioRendererLoggingIdentifier;
  v2 = -[AVSampleBufferAudioRendererLoggingIdentifier init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVSampleBufferAudioRendererLoggingIdentifierInternal);
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
  AVSampleBufferAudioRendererLoggingIdentifierInternal *priv;
  objc_super v4;

  priv = self->_priv;
  if (priv)
  {

    CFRelease(self->_priv);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVSampleBufferAudioRendererLoggingIdentifier;
  -[AVSampleBufferAudioRendererLoggingIdentifier dealloc](&v4, sel_dealloc);
}

- (NSString)name
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", self->_priv->identifierName);
}

@end
