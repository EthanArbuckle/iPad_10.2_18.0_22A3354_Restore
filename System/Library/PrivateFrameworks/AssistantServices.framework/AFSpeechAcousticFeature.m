@implementation AFSpeechAcousticFeature

- (void)encodeWithCoder:(id)a3
{
  NSArray *acousticFeatureValuePerFrame;
  id v5;

  acousticFeatureValuePerFrame = self->_acousticFeatureValuePerFrame;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", acousticFeatureValuePerFrame, CFSTR("_acousticFeatureValuePerFrame"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_frameDuration"), self->_frameDuration);

}

- (AFSpeechAcousticFeature)initWithCoder:(id)a3
{
  id v4;
  AFSpeechAcousticFeature *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *acousticFeatureValuePerFrame;
  double v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFSpeechAcousticFeature;
  v5 = -[AFSpeechAcousticFeature init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_acousticFeatureValuePerFrame"));
    v9 = objc_claimAutoreleasedReturnValue();
    acousticFeatureValuePerFrame = v5->_acousticFeatureValuePerFrame;
    v5->_acousticFeatureValuePerFrame = (NSArray *)v9;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_frameDuration"));
    v5->_frameDuration = v11;
  }

  return v5;
}

- (AFSpeechAcousticFeature)initWithAcousticFeatureValue:(id)a3 frameDuration:(double)a4
{
  id v6;
  AFSpeechAcousticFeature *v7;
  uint64_t v8;
  NSArray *acousticFeatureValuePerFrame;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFSpeechAcousticFeature;
  v7 = -[AFSpeechAcousticFeature init](&v11, sel_init);
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
