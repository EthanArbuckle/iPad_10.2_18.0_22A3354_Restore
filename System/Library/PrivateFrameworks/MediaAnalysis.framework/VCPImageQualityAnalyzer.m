@implementation VCPImageQualityAnalyzer

- (int)analyzeImageQuality:(id)a3 irisPhotoOffsetSec:(float)a4 cancel:(id)a5
{
  id v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t j;
  const __CFDictionary *v26;
  double v27;
  float v28;
  float qualityScore;
  void *v32;
  uint64_t (**v33)(void);
  void *v34;
  CMTime time;
  CMTimeRange range;
  CMTimeRange v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v33 = (uint64_t (**)(void))a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BlurResults"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ObstructionResults"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "count"))
  {
    if (v33 && (v33[2]() & 1) != 0)
    {
      v8 = -128;
    }
    else
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v9 = v34;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v43 != v11)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("attributes"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sharpness"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "floatValue");
            v16 = v15;

          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v10);
      }
      else
      {
        v16 = 0.0;
      }

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ExposureResults"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("quality"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      self->_qualityScore = v20;

      v40 = 0u;
      v41 = 0u;
      v39 = 0u;
      v38 = 0u;
      v21 = v32;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v39;
        v24 = a4;
        while (2)
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v39 != v23)
              objc_enumerationMutation(v21);
            v26 = *(const __CFDictionary **)(*((_QWORD *)&v38 + 1) + 8 * j);
            memset(&v37, 0, sizeof(v37));
            CMTimeRangeMakeFromDictionary(&v37, v26);
            range = v37;
            CMTimeMakeWithSeconds(&time, v24, 600);
            if (CMTimeRangeContainsTime(&range, &time))
            {
              -[__CFDictionary vcp_quality](v26, "vcp_quality");
              *(float *)&v27 = v27;
              self->_qualityScore = fmaxf(self->_qualityScore + (float)((float)(1.0 - *(float *)&v27) * -15.0), 0.0);
              goto LABEL_25;
            }
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v22)
            continue;
          break;
        }
      }
LABEL_25:

      v28 = 0.0;
      if (v16 > 0.2)
      {
        qualityScore = self->_qualityScore;
        if (qualityScore != 0.0)
          v28 = (float)((float)(qualityScore * 0.75) + (float)(v16 * 0.25)) * 100.0;
      }
      v8 = 0;
      self->_qualityScore = roundf(v28) / 100.0;
    }
  }
  else
  {
    v8 = -50;
  }

  return v8;
}

- (float)qualityScore
{
  return self->_qualityScore;
}

@end
