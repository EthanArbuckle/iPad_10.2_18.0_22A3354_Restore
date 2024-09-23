@implementation SFSpeechRecognitionMetadata

- (void)encodeWithCoder:(id)a3
{
  double speakingRate;
  id v5;

  speakingRate = self->_speakingRate;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_speakingRate"), speakingRate);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_averagePauseDuration"), self->_averagePauseDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_speechStartTimestamp"), self->_speechStartTimestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_speechDuration"), self->_speechDuration);
  objc_msgSend(v5, "encodeObject:forKey:", self->_voiceAnalytics, CFSTR("_voiceAnalytics"));

}

- (SFSpeechRecognitionMetadata)initWithCoder:(id)a3
{
  id v4;
  SFSpeechRecognitionMetadata *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  SFVoiceAnalytics *voiceAnalytics;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFSpeechRecognitionMetadata;
  v5 = -[SFSpeechRecognitionMetadata init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_speakingRate"));
    v5->_speakingRate = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_averagePauseDuration"));
    v5->_averagePauseDuration = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_speechStartTimestamp"));
    v5->_speechStartTimestamp = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_speechDuration"));
    v5->_speechDuration = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_averagePauseDuration"));
    v5->_averagePauseDuration = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_voiceAnalytics"));
    v11 = objc_claimAutoreleasedReturnValue();
    voiceAnalytics = v5->_voiceAnalytics;
    v5->_voiceAnalytics = (SFVoiceAnalytics *)v11;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFSpeechRecognitionMetadata;
  -[SFSpeechRecognitionMetadata description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_speakingRate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_averagePauseDuration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_speechStartTimestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_speechDuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", speakingRate=%@, averagePauseDuration=%@, speechStartTimestamp=%@, speechDuration=%@, voiceAnalytics=%@"), v4, v5, v6, v7, self->_voiceAnalytics);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)_initWithSpeechStartTimestamp:(double)a3 speechDuration:(double)a4 voiceAnalytics:(id)a5 speakingRate:(double)a6 averagePauseDuration:(double)a7
{
  id v12;
  SFSpeechRecognitionMetadata *v13;
  SFSpeechRecognitionMetadata *v14;
  uint64_t v15;
  SFVoiceAnalytics *voiceAnalytics;
  objc_super v18;

  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFSpeechRecognitionMetadata;
  v13 = -[SFSpeechRecognitionMetadata init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_speakingRate = a6;
    v13->_averagePauseDuration = a7;
    v13->_speechStartTimestamp = a3;
    v13->_speechDuration = a4;
    v15 = objc_msgSend(v12, "copy");
    voiceAnalytics = v14->_voiceAnalytics;
    v14->_voiceAnalytics = (SFVoiceAnalytics *)v15;

  }
  return v14;
}

- (SFSpeechRecognitionMetadata)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v6;
  SFSpeechRecognitionMetadata *v7;
  void *v8;
  void *v9;
  SFSpeechRecognitionMetadata *v10;
  SFSpeechRecognitionMetadata *v11;
  objc_super v13;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v13.receiver = self;
    v13.super_class = (Class)SFSpeechRecognitionMetadata;
    v7 = -[SFSpeechRecognitionMetadata init](&v13, sel_init);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;

        v7 = v10;
      }

    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)binarySampleRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (double)speakingRate
{
  return self->_speakingRate;
}

- (NSTimeInterval)averagePauseDuration
{
  return self->_averagePauseDuration;
}

- (NSTimeInterval)speechStartTimestamp
{
  return self->_speechStartTimestamp;
}

- (NSTimeInterval)speechDuration
{
  return self->_speechDuration;
}

- (SFVoiceAnalytics)voiceAnalytics
{
  return self->_voiceAnalytics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceAnalytics, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
