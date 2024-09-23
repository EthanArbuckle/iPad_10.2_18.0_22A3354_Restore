@implementation AVAudioSessionSpatialPreferences

- (NSArray)spatialAudioSources
{
  return self->spatialAudioSources;
}

- (void)setAlwaysSpatialize:(BOOL)a3
{
  self->alwaysSpatialize = a3;
}

- (void)setPrefersLossyAudioSources:(BOOL)a3
{
  self->prefersLossyAudioSources = a3;
}

- (void)setPrefersHeadTrackedSpatialization:(BOOL)a3
{
  self->prefersHeadTrackedSpatialization = a3;
}

- (void)setMaximumSpatializableChannels:(int64_t)a3
{
  self->maximumSpatializableChannels = a3;
}

- (void)setSpatialAudioSources:(id)a3
{
  objc_storeStrong((id *)&self->spatialAudioSources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->spatialAudioSources, 0);
}

- (BOOL)prefersLossyAudioSources
{
  return self->prefersLossyAudioSources;
}

- (BOOL)prefersHeadTrackedSpatialization
{
  return self->prefersHeadTrackedSpatialization;
}

- (int64_t)maximumSpatializableChannels
{
  return self->maximumSpatializableChannels;
}

- (BOOL)alwaysSpatialize
{
  return self->alwaysSpatialize;
}

- (AVAudioSessionSpatialPreferences)initWithCoder:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *spatialAudioSources;

  v4 = a3;
  self->prefersHeadTrackedSpatialization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prefersHeadTrackedSpatialization"));
  self->prefersLossyAudioSources = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prefersLossyAudioSources"));
  self->alwaysSpatialize = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("alwaysSpatialize"));
  self->maximumSpatializableChannels = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumSpatializableChannels"));
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("spatialAudioSources"));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  spatialAudioSources = self->spatialAudioSources;
  self->spatialAudioSources = v5;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->prefersHeadTrackedSpatialization, CFSTR("prefersHeadTrackedSpatialization"));
  objc_msgSend(v4, "encodeBool:forKey:", self->prefersLossyAudioSources, CFSTR("prefersLossyAudioSources"));
  objc_msgSend(v4, "encodeBool:forKey:", self->alwaysSpatialize, CFSTR("alwaysSpatialize"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->maximumSpatializableChannels, CFSTR("maximumSpatializableChannels"));
  objc_msgSend(v4, "encodeObject:forKey:", self->spatialAudioSources, CFSTR("spatialAudioSources"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
