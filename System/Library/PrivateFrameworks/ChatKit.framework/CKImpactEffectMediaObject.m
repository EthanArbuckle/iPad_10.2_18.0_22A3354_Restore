@implementation CKImpactEffectMediaObject

- (CKImpactEffectMediaObject)initWithImpactEffectAudioFileURL:(id)a3
{
  id v5;
  CKImpactEffectMediaObject *v6;
  CKImpactEffectMediaObject *v7;
  CKImpactEffectMediaObject *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKImpactEffectMediaObject;
  v6 = -[CKImpactEffectMediaObject init](&v10, sel_init);
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
