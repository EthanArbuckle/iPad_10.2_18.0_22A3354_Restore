@implementation OSDFeatures(Logging)

- (id)dictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("SilenceFramesCountMs");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "silenceFramesCountMs");
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("SilenceProbability");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "silenceProbability");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("SilenceDurationMs");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "silenceDurationMs");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = CFSTR("ProcessedAudioMs");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "processedAudioMs");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
