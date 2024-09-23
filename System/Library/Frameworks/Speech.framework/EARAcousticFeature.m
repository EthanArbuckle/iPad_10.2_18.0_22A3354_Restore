@implementation EARAcousticFeature

- (EARAcousticFeature)initWithFeature:(id)a3
{
  id v4;
  EARAcousticFeature *v5;
  void *v6;
  uint64_t v7;
  NSArray *acousticFeatureValuePerFrame;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EARAcousticFeature;
  v5 = -[EARAcousticFeature init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "acousticFeatureValuePerFrame");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    acousticFeatureValuePerFrame = v5->_acousticFeatureValuePerFrame;
    v5->_acousticFeatureValuePerFrame = (NSArray *)v7;

    objc_msgSend(v4, "frameDuration");
    v5->_frameDuration = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *acousticFeatureValuePerFrame;
  id v5;

  acousticFeatureValuePerFrame = self->_acousticFeatureValuePerFrame;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", acousticFeatureValuePerFrame, CFSTR("acousticFeatureValuePerFrame"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("frameDuration"), self->_frameDuration);

}

- (EARAcousticFeature)initWithCoder:(id)a3
{
  id v4;
  EARAcousticFeature *v5;
  uint64_t v6;
  NSArray *acousticFeatureValuePerFrame;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EARAcousticFeature;
  v5 = -[EARAcousticFeature init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("acousticFeatureValuePerFrame"));
    v6 = objc_claimAutoreleasedReturnValue();
    acousticFeatureValuePerFrame = v5->_acousticFeatureValuePerFrame;
    v5->_acousticFeatureValuePerFrame = (NSArray *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("frameDuration"));
    v5->_frameDuration = v8;
  }

  return v5;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
