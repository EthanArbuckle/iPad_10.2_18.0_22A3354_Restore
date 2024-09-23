@implementation CKFullScreenEffectMediaObject

- (CKFullScreenEffectMediaObject)initWithFullScreenEffectAudioFileURL:(id)a3
{
  id v5;
  CKFullScreenEffectMediaObject *v6;
  CKFullScreenEffectMediaObject *v7;
  CKFullScreenEffectMediaObject *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKFullScreenEffectMediaObject;
  v6 = -[CKFullScreenEffectMediaObject init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_audioFileURL, a3);
    v8 = v7;
  }

  return v7;
}

- (id)fileURL
{
  return self->_audioFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileURL, 0);
}

@end
