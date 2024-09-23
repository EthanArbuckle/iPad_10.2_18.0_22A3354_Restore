@implementation _EARAudioAnalytics

- (id)_initWithSpeechRecognitionFeatures:(id)a3 acousticFeatures:(id)a4 snr:(double)a5
{
  id v8;
  id v9;
  _EARAudioAnalytics *v10;
  uint64_t v11;
  NSDictionary *speechRecognitionFeatures;
  uint64_t v13;
  NSDictionary *acousticFeatures;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_EARAudioAnalytics;
  v10 = -[_EARAudioAnalytics init](&v16, sel_init);
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

@end
