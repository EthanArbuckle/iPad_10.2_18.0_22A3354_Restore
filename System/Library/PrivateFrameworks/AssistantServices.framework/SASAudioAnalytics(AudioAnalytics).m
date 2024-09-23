@implementation SASAudioAnalytics(AudioAnalytics)

- (AFSpeechAudioAnalytics)af_audioAnalytics
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  AFSpeechAudioAnalytics *v7;
  void *v8;
  AFSpeechAudioAnalytics *v9;
  _QWORD v11[4];
  id v12;

  v2 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "acousticFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

  objc_msgSend(a1, "acousticFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__SASAudioAnalytics_AudioAnalytics__af_audioAnalytics__block_invoke;
  v11[3] = &unk_1E3A357F8;
  v12 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);

  v7 = [AFSpeechAudioAnalytics alloc];
  objc_msgSend(a1, "speechRecognitionFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AFSpeechAudioAnalytics initWithSpeechRecognitionFeatures:acousticFeatures:](v7, "initWithSpeechRecognitionFeatures:acousticFeatures:", v8, v6);

  return v9;
}

@end
