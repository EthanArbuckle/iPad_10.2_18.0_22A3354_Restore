@implementation CSAsset(KeywordDetector)

- (float)keywordDetectorThreshold
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("threshold"), CFSTR("keywordDetector"), &unk_1E7C643F0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

- (id)keywordDetectorConfigPathRecognizer
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "resourcePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "getStringForKey:category:default:", CFSTR("configFileRecognizer"), CFSTR("keywordDetector"), CFSTR("keyword_detector.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (float)keywordDetectorWaitTimeSinceVT
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "getNumberForKey:category:default:", CFSTR("waitTimeSinceVT"), CFSTR("keywordDetector"), &unk_1E7C64400);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

@end
