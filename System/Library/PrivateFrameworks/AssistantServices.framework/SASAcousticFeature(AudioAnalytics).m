@implementation SASAcousticFeature(AudioAnalytics)

- (AFSpeechAcousticFeature)af_acousticFeature
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AFSpeechAcousticFeature *v10;
  void *v11;
  AFSpeechAcousticFeature *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "acousticFeaturePerFrame");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "acousticFeaturePerFrame", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v10 = [AFSpeechAcousticFeature alloc];
  objc_msgSend(a1, "frameDuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v12 = -[AFSpeechAcousticFeature initWithAcousticFeatureValue:frameDuration:](v10, "initWithAcousticFeatureValue:frameDuration:", v4);

  return v12;
}

@end
