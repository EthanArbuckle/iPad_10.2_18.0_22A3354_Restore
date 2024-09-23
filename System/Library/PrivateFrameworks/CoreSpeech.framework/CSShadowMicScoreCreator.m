@implementation CSShadowMicScoreCreator

- (CSShadowMicScoreCreator)init
{
  CSShadowMicScoreCreator *v2;
  NSMutableArray *v3;
  NSMutableArray *rmsSamplesForEntireAudio;
  NSMutableData *v5;
  NSMutableData *audioBuffer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSShadowMicScoreCreator;
  v2 = -[CSShadowMicScoreCreator init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    rmsSamplesForEntireAudio = v2->_rmsSamplesForEntireAudio;
    v2->_rmsSamplesForEntireAudio = v3;

    v5 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    audioBuffer = v2->_audioBuffer;
    v2->_audioBuffer = v5;

    v2->_speechVoiceLevel = -1.0;
    v2->_shadowMicScore = -1.0;
  }
  return v2;
}

- (void)addDataToBuffer:(id)a3
{
  -[NSMutableData appendData:](self->_audioBuffer, "appendData:", a3);
}

- (void)calculateShadowMicScore
{
  unint64_t bestEarlyDetectSample;
  unint64_t bestStartDetectSample;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  unint64_t v11;
  int v12;
  double v13;
  RMSSample *v14;
  unint64_t v15;
  unint64_t bestEndDetectSample;
  NSObject *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  bestStartDetectSample = self->_bestStartDetectSample;
  bestEarlyDetectSample = self->_bestEarlyDetectSample;
  if (bestStartDetectSample > bestEarlyDetectSample || (v5 = self->_bestEndDetectSample, bestStartDetectSample > v5))
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    bestEndDetectSample = self->_bestEndDetectSample;
    *(_DWORD *)buf = 136315906;
    v23 = "-[CSShadowMicScoreCreator calculateShadowMicScore]";
    v24 = 2048;
    v25 = bestStartDetectSample;
    v26 = 2048;
    v27 = bestEarlyDetectSample;
    v28 = 2048;
    v29 = bestEndDetectSample;
    v8 = "%s _bestStartDetectSample %lu was greater than _bestEarlyDetectSample %lu or _bestEndDetectSample %lu";
    v9 = v6;
    v10 = 42;
    goto LABEL_18;
  }
  if (bestEarlyDetectSample > v5)
  {
    v7 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315650;
    v23 = "-[CSShadowMicScoreCreator calculateShadowMicScore]";
    v24 = 2048;
    v25 = bestEarlyDetectSample;
    v26 = 2048;
    v27 = v5;
    v8 = "%s _bestEarlyDetectSample %lu was greater than _bestEndDetectSample %lu";
    v9 = v7;
    v10 = 32;
    goto LABEL_18;
  }
  v11 = 2 * (int)bestStartDetectSample;
  if (v11 + 160 > -[NSMutableData length](self->_audioBuffer, "length"))
  {
LABEL_15:
    -[CSShadowMicScoreCreator _calculateNumberOfVoicingFrames](self, "_calculateNumberOfVoicingFrames");
    if (self->_numberOfTotalFramesETFT)
    {
      self->_shadowMicScore = (double)-[CSShadowMicScoreCreator numberOfVoicingFrames](self, "numberOfVoicingFrames")
                            / (double)self->_numberOfTotalFramesETFT;
      return;
    }
    v17 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
    {
LABEL_4:
      self->_shadowMicScore = -1.0;
      return;
    }
    *(_DWORD *)buf = 136315394;
    v23 = "-[CSShadowMicScoreCreator calculateShadowMicScore]";
    v24 = 2048;
    v25 = 0;
    v8 = "%s _numberOfTotalFramesETFT %lu is 0";
    v9 = v17;
    v10 = 22;
LABEL_18:
    _os_log_fault_impl(&dword_1C2614000, v9, OS_LOG_TYPE_FAULT, v8, buf, v10);
    goto LABEL_4;
  }
  v12 = v11 + 80;
  while (1)
  {
    -[NSMutableData getBytes:range:](self->_audioBuffer, "getBytes:range:", buf, v11, 160);
    -[CSShadowMicScoreCreator _calculateRMSWithFrameData:](self, "_calculateRMSWithFrameData:", buf);
    v14 = -[RMSSample initWithRMSScore:lastSampleCount:]([RMSSample alloc], "initWithRMSScore:lastSampleCount:", v11 >> 1, v13);
    -[NSMutableArray addObject:](self->_rmsSamplesForEntireAudio, "addObject:", v14);
    if (-[RMSSample lastSampleCount](v14, "lastSampleCount") <= self->_bestEarlyDetectSample + 160
      || self->_speechVoiceLevel != -1.0)
    {
      goto LABEL_14;
    }
    -[CSShadowMicScoreCreator _calculateSpeechVoicingLevel](self, "_calculateSpeechVoicingLevel");
    if (self->_speechVoiceLevel == -1.0)
      break;
    -[NSMutableArray removeAllObjects](self->_rmsSamplesForEntireAudio, "removeAllObjects");
LABEL_14:

    v11 = v12;
    v15 = v12 + 160;
    v12 += 80;
    if (v15 > -[NSMutableData length](self->_audioBuffer, "length"))
      goto LABEL_15;
  }
  v18 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
  {
    v19 = 136315394;
    v20 = "-[CSShadowMicScoreCreator calculateShadowMicScore]";
    v21 = 2048;
    _os_log_fault_impl(&dword_1C2614000, v18, OS_LOG_TYPE_FAULT, "%s _speechVoiceLevel %lu is 0", (uint8_t *)&v19, 0x16u);
  }
  self->_shadowMicScore = -1.0;

}

- (double)_calculateRMSWithFrameData:(signed __int16)a3[80]
{
  uint64_t v3;
  int64x2_t v4;
  int64x2_t v5;
  int64x2_t v6;
  int64x2_t v7;
  int16x8_t v8;
  uint32x4_t v9;
  uint32x4_t v10;

  v3 = 0;
  v4 = 0uLL;
  v5 = 0uLL;
  v6 = 0uLL;
  v7 = 0uLL;
  do
  {
    v8 = *(int16x8_t *)&a3[v3];
    v9 = (uint32x4_t)vmull_high_s16(v8, v8);
    v10 = (uint32x4_t)vmull_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v8.i8);
    v7 = (int64x2_t)vaddw_high_u32((uint64x2_t)v7, v9);
    v6 = (int64x2_t)vaddw_u32((uint64x2_t)v6, *(uint32x2_t *)v9.i8);
    v5 = (int64x2_t)vaddw_high_u32((uint64x2_t)v5, v10);
    v4 = (int64x2_t)vaddw_u32((uint64x2_t)v4, *(uint32x2_t *)v10.i8);
    v3 += 8;
  }
  while (v3 != 80);
  return (double)vaddvq_s64(vaddq_s64(vaddq_s64(v4, v6), vaddq_s64(v5, v7)));
}

- (void)_calculateSpeechVoicingLevel
{
  unint64_t v3;
  uint64_t v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray sortUsingSelector:](self->_rmsSamplesForEntireAudio, "sortUsingSelector:", sel_compareScoresDesc_);
  v3 = vcvtms_u32_f32((float)(unint64_t)-[NSMutableArray count](self->_rmsSamplesForEntireAudio, "count") * 0.2);
  v4 = -[NSMutableArray count](self->_rmsSamplesForEntireAudio, "count");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_rmsSamplesForEntireAudio;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    v10 = 0.0;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v5);
      if (!(v3 - v4 + v8 + v11))
        break;
      objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "RMSScore", (_QWORD)v14);
      v10 = v10 + v12;
      if (v7 == ++v11)
      {
        v8 += v11;
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v10 = 0.0;
  }

  v13 = -1.0;
  if (v4 != v3)
    v13 = floor(v10 / (double)(v4 - v3));
  self->_speechVoiceLevel = v13;
}

- (void)_calculateNumberOfVoicingFrames
{
  unint64_t bestEarlyDetectSample;
  double speechVoiceLevel;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  bestEarlyDetectSample = self->_bestEarlyDetectSample;
  speechVoiceLevel = self->_speechVoiceLevel;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_rmsSamplesForEntireAudio;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = bestEarlyDetectSample + 320;
    v10 = *(_QWORD *)v16;
    v11 = (double)(unint64_t)floor(speechVoiceLevel * 0.25);
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v13, "lastSampleCount", (_QWORD)v15) >= v9
          && objc_msgSend(v13, "lastSampleCount") + 80 < self->_bestEndDetectSample)
        {
          ++self->_numberOfTotalFramesETFT;
          objc_msgSend(v13, "RMSScore");
          if (v14 >= v11)
            ++v8;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  self->_numberOfVoicingFrames = v8;
}

- (unint64_t)bestStartDetectSample
{
  return self->_bestStartDetectSample;
}

- (void)setBestStartDetectSample:(unint64_t)a3
{
  self->_bestStartDetectSample = a3;
}

- (unint64_t)bestEarlyDetectSample
{
  return self->_bestEarlyDetectSample;
}

- (void)setBestEarlyDetectSample:(unint64_t)a3
{
  self->_bestEarlyDetectSample = a3;
}

- (unint64_t)bestEndDetectSample
{
  return self->_bestEndDetectSample;
}

- (void)setBestEndDetectSample:(unint64_t)a3
{
  self->_bestEndDetectSample = a3;
}

- (double)shadowMicScore
{
  return self->_shadowMicScore;
}

- (void)setShadowMicScore:(double)a3
{
  self->_shadowMicScore = a3;
}

- (NSMutableArray)rmsSamplesForEntireAudio
{
  return self->_rmsSamplesForEntireAudio;
}

- (void)setRmsSamplesForEntireAudio:(id)a3
{
  objc_storeStrong((id *)&self->_rmsSamplesForEntireAudio, a3);
}

- (NSMutableData)audioBuffer
{
  return self->_audioBuffer;
}

- (void)setAudioBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_audioBuffer, a3);
}

- (double)speechVoiceLevel
{
  return self->_speechVoiceLevel;
}

- (void)setSpeechVoiceLevel:(double)a3
{
  self->_speechVoiceLevel = a3;
}

- (unint64_t)numberOfVoicingFrames
{
  return self->_numberOfVoicingFrames;
}

- (void)setNumberOfVoicingFrames:(unint64_t)a3
{
  self->_numberOfVoicingFrames = a3;
}

- (int64_t)numberOfTotalFramesETFT
{
  return self->_numberOfTotalFramesETFT;
}

- (void)setNumberOfTotalFramesETFT:(int64_t)a3
{
  self->_numberOfTotalFramesETFT = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_rmsSamplesForEntireAudio, 0);
}

@end
