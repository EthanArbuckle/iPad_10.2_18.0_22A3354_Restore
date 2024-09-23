@implementation AFSpeechAudioAnalytics

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *speechRecognitionFeatures;
  id v5;

  speechRecognitionFeatures = self->_speechRecognitionFeatures;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", speechRecognitionFeatures, CFSTR("_speechRecognitionFeatures"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_acousticFeatures, CFSTR("_acousticFeatures"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_snr"), self->_snr);

}

- (AFSpeechAudioAnalytics)initWithCoder:(id)a3
{
  id v4;
  AFSpeechAudioAnalytics *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *speechRecognitionFeatures;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *acousticFeatures;
  double v16;
  objc_super v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AFSpeechAudioAnalytics;
  v5 = -[AFSpeechAudioAnalytics init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_speechRecognitionFeatures"));
    v9 = objc_claimAutoreleasedReturnValue();
    speechRecognitionFeatures = v5->_speechRecognitionFeatures;
    v5->_speechRecognitionFeatures = (NSDictionary *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_acousticFeatures"));
    v14 = objc_claimAutoreleasedReturnValue();
    acousticFeatures = v5->_acousticFeatures;
    v5->_acousticFeatures = (NSDictionary *)v14;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_snr"));
    v5->_snr = v16;
  }

  return v5;
}

- (AFSpeechAudioAnalytics)initWithSpeechRecognitionFeatures:(id)a3 acousticFeatures:(id)a4
{
  id v6;
  id v7;
  AFSpeechAudioAnalytics *v8;
  uint64_t v9;
  NSDictionary *speechRecognitionFeatures;
  uint64_t v11;
  NSDictionary *acousticFeatures;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFSpeechAudioAnalytics;
  v8 = -[AFSpeechAudioAnalytics init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    speechRecognitionFeatures = v8->_speechRecognitionFeatures;
    v8->_speechRecognitionFeatures = (NSDictionary *)v9;

    v11 = objc_msgSend(v7, "copy");
    acousticFeatures = v8->_acousticFeatures;
    v8->_acousticFeatures = (NSDictionary *)v11;

  }
  return v8;
}

- (AFSpeechAudioAnalytics)initWithSpeechRecognitionFeatures:(id)a3 acousticFeatures:(id)a4 snr:(double)a5
{
  id v8;
  id v9;
  AFSpeechAudioAnalytics *v10;
  uint64_t v11;
  NSDictionary *speechRecognitionFeatures;
  uint64_t v13;
  NSDictionary *acousticFeatures;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AFSpeechAudioAnalytics;
  v10 = -[AFSpeechAudioAnalytics init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    speechRecognitionFeatures = v10->_speechRecognitionFeatures;
    v10->_speechRecognitionFeatures = (NSDictionary *)v11;

    v13 = objc_msgSend(v9, "copy");
    acousticFeatures = v10->_acousticFeatures;
    v10->_acousticFeatures = (NSDictionary *)v13;

    v10->_snr = a5;
  }

  return v10;
}

- (NSDictionary)speechRecognitionFeatures
{
  return self->_speechRecognitionFeatures;
}

- (NSDictionary)acousticFeatures
{
  return self->_acousticFeatures;
}

- (double)snr
{
  return self->_snr;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acousticFeatures, 0);
  objc_storeStrong((id *)&self->_speechRecognitionFeatures, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
