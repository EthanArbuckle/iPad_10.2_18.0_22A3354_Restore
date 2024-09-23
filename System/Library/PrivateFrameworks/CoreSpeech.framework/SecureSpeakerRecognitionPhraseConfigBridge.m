@implementation SecureSpeakerRecognitionPhraseConfigBridge

- (SecureSpeakerRecognitionPhraseConfigBridge)initWithName:(id)a3 satThreshold:(float)a4
{
  id v7;
  SecureSpeakerRecognitionPhraseConfigBridge *v8;
  float *v9;
  SecureSpeakerRecognitionPhraseConfigBridge *v10;
  objc_super v12;

  v7 = a3;
  if (v7)
  {
    v12.receiver = self;
    v12.super_class = (Class)SecureSpeakerRecognitionPhraseConfigBridge;
    v8 = -[SecureSpeakerRecognitionPhraseConfigBridge init](&v12, sel_init);
    v9 = (float *)v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_name, a3);
      v9[2] = a4;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (float)satThreshold
{
  return self->_satThreshold;
}

- (void)setSatThreshold:(float)a3
{
  self->_satThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
