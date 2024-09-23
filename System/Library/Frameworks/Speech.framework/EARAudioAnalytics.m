@implementation EARAudioAnalytics

- (EARAudioAnalytics)initWithAnalytics:(id)a3
{
  id v4;
  EARAudioAnalytics *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSDictionary *speechRecognitionFeatures;
  uint64_t v12;
  NSDictionary *acousticFeatures;
  double v14;
  _QWORD v16[4];
  id v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EARAudioAnalytics;
  v5 = -[EARAudioAnalytics init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "acousticFeatures");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __39__EARAudioAnalytics_initWithAnalytics___block_invoke;
    v16[3] = &unk_1E6485898;
    v17 = v7;
    v8 = v7;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v16);
    objc_msgSend(v4, "speechRecognitionFeatures");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    speechRecognitionFeatures = v5->_speechRecognitionFeatures;
    v5->_speechRecognitionFeatures = (NSDictionary *)v10;

    v12 = objc_msgSend(v8, "copy");
    acousticFeatures = v5->_acousticFeatures;
    v5->_acousticFeatures = (NSDictionary *)v12;

    objc_msgSend(v4, "snr");
    v5->_snr = v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *speechRecognitionFeatures;
  id v5;

  speechRecognitionFeatures = self->_speechRecognitionFeatures;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", speechRecognitionFeatures, CFSTR("speechRecognitionFeatures"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_acousticFeatures, CFSTR("acousticFeatures"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("snr"), self->_snr);

}

- (EARAudioAnalytics)initWithCoder:(id)a3
{
  id v4;
  EARAudioAnalytics *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *speechRecognitionFeatures;
  uint64_t v9;
  uint64_t v10;
  NSDictionary *acousticFeatures;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EARAudioAnalytics;
  v5 = -[EARAudioAnalytics init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("speechRecognitionFeatures"));
    v7 = objc_claimAutoreleasedReturnValue();
    speechRecognitionFeatures = v5->_speechRecognitionFeatures;
    v5->_speechRecognitionFeatures = (NSDictionary *)v7;

    v9 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v9, objc_opt_class(), CFSTR("acousticFeatures"));
    v10 = objc_claimAutoreleasedReturnValue();
    acousticFeatures = v5->_acousticFeatures;
    v5->_acousticFeatures = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("snr"));
    v5->_snr = v12;
  }

  return v5;
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

void __39__EARAudioAnalytics_initWithAnalytics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  EARAcousticFeature *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[EARAcousticFeature initWithFeature:]([EARAcousticFeature alloc], "initWithFeature:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
