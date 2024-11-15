@implementation _EARAcousticFeature

- (id)_initWithAcousticFeatureValues:(id)a3 frameDuration:(float)a4
{
  id v6;
  _EARAcousticFeature *v7;
  uint64_t v8;
  NSArray *acousticFeatureValuePerFrame;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EARAcousticFeature;
  v7 = -[_EARAcousticFeature init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    acousticFeatureValuePerFrame = v7->_acousticFeatureValuePerFrame;
    v7->_acousticFeatureValuePerFrame = (NSArray *)v8;

    v7->_frameDuration = a4;
  }

  return v7;
}

- (NSArray)acousticFeatureValuePerFrame
{
  return self->_acousticFeatureValuePerFrame;
}

- (double)frameDuration
{
  return self->_frameDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acousticFeatureValuePerFrame, 0);
}

@end
