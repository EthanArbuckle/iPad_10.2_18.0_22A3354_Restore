@implementation EARSpeechRecognitionResultPackage

- (EARSpeechRecognitionResultPackage)initWithPackage:(id)a3
{
  id v4;
  EARSpeechRecognitionResultPackage *v5;
  EARSpeechRecognition *v6;
  void *v7;
  EARSpeechRecognition *v8;
  EARSpeechRecognition *v9;
  void *v10;
  EARSpeechRecognition *v11;
  EARAudioAnalytics *v12;
  void *v13;
  EARAudioAnalytics *v14;
  EARSpeechRecognition *v15;
  void *v16;
  EARSpeechRecognition *v17;
  EARLatticeMitigatorResult *v18;
  void *v19;
  EARLatticeMitigatorResult *v20;
  EARSpeechRecognition *recognition;
  EARSpeechRecognition *v22;
  EARSpeechRecognition *preITNRecognition;
  EARSpeechRecognition *v24;
  EARSpeechRecognition *unrepairedRecognition;
  EARSpeechRecognition *v26;
  EARAudioAnalytics *audioAnalytics;
  EARAudioAnalytics *v28;
  double v29;
  uint64_t v30;
  NSArray *correctPartialResultIndexList;
  uint64_t v32;
  NSArray *nBestVoiceCommandInterpretations;
  uint64_t v34;
  NSArray *preITNNBestVoiceCommandInterpretations;
  uint64_t v36;
  NSNumber *endOfSentenceLikelihood;
  EARLatticeMitigatorResult *latticeMitigatorResult;
  EARLatticeMitigatorResult *v39;
  uint64_t v40;
  _EARVoiceCommandDebugInfo *voiceCommandDebugInfo;
  uint64_t v42;
  _EARPerformanceMarkers *performanceMarkers;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)EARSpeechRecognitionResultPackage;
  v5 = -[EARSpeechRecognitionResultPackage init](&v45, sel_init);
  if (v5)
  {
    v6 = [EARSpeechRecognition alloc];
    objc_msgSend(v4, "recognition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EARSpeechRecognition initWithRecognition:](v6, "initWithRecognition:", v7);

    v9 = [EARSpeechRecognition alloc];
    objc_msgSend(v4, "preITNRecognition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[EARSpeechRecognition initWithRecognition:](v9, "initWithRecognition:", v10);

    v12 = [EARAudioAnalytics alloc];
    objc_msgSend(v4, "audioAnalytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[EARAudioAnalytics initWithAnalytics:](v12, "initWithAnalytics:", v13);

    v15 = [EARSpeechRecognition alloc];
    objc_msgSend(v4, "unrepairedRecognition");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[EARSpeechRecognition initWithRecognition:](v15, "initWithRecognition:", v16);

    v18 = [EARLatticeMitigatorResult alloc];
    objc_msgSend(v4, "latticeMitigatorResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[EARLatticeMitigatorResult initWithLatticeMitigatorResult:](v18, "initWithLatticeMitigatorResult:", v19);

    recognition = v5->_recognition;
    v5->_recognition = v8;
    v22 = v8;

    preITNRecognition = v5->_preITNRecognition;
    v5->_preITNRecognition = v11;
    v24 = v11;

    unrepairedRecognition = v5->_unrepairedRecognition;
    v5->_unrepairedRecognition = v17;
    v26 = v17;

    v5->_isFinal = objc_msgSend(v4, "isFinal");
    audioAnalytics = v5->_audioAnalytics;
    v5->_audioAnalytics = v14;
    v28 = v14;

    objc_msgSend(v4, "utteranceStart");
    v5->_utteranceStart = v29;
    objc_msgSend(v4, "correctPartialResultIndexList");
    v30 = objc_claimAutoreleasedReturnValue();
    correctPartialResultIndexList = v5->_correctPartialResultIndexList;
    v5->_correctPartialResultIndexList = (NSArray *)v30;

    objc_msgSend(v4, "nBestVoiceCommandInterpretations");
    v32 = objc_claimAutoreleasedReturnValue();
    nBestVoiceCommandInterpretations = v5->_nBestVoiceCommandInterpretations;
    v5->_nBestVoiceCommandInterpretations = (NSArray *)v32;

    objc_msgSend(v4, "preITNNBestVoiceCommandInterpretations");
    v34 = objc_claimAutoreleasedReturnValue();
    preITNNBestVoiceCommandInterpretations = v5->_preITNNBestVoiceCommandInterpretations;
    v5->_preITNNBestVoiceCommandInterpretations = (NSArray *)v34;

    v5->_recognitionPaused = objc_msgSend(v4, "recognitionPaused");
    v5->_firstResultAfterResume = objc_msgSend(v4, "firstResultAfterResume");
    objc_msgSend(v4, "endOfSentenceLikelihood");
    v36 = objc_claimAutoreleasedReturnValue();
    endOfSentenceLikelihood = v5->_endOfSentenceLikelihood;
    v5->_endOfSentenceLikelihood = (NSNumber *)v36;

    latticeMitigatorResult = v5->_latticeMitigatorResult;
    v5->_latticeMitigatorResult = v20;
    v39 = v20;

    v5->_numOneBestTokensExcludingTriggerPhrase = objc_msgSend(v4, "numTokensExcludingTriggerPhrase");
    objc_msgSend(v4, "voiceCommandDebugInfo");
    v40 = objc_claimAutoreleasedReturnValue();
    voiceCommandDebugInfo = v5->_voiceCommandDebugInfo;
    v5->_voiceCommandDebugInfo = (_EARVoiceCommandDebugInfo *)v40;

    objc_msgSend(v4, "performanceMarkers");
    v42 = objc_claimAutoreleasedReturnValue();
    performanceMarkers = v5->_performanceMarkers;
    v5->_performanceMarkers = (_EARPerformanceMarkers *)v42;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  EARSpeechRecognition *recognition;
  id v5;

  recognition = self->_recognition;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recognition, CFSTR("recognition"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preITNRecognition, CFSTR("preITNRecognition"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unrepairedRecognition, CFSTR("unrepairedRecognition"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFinal, CFSTR("isFinal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_audioAnalytics, CFSTR("audioAnalytics"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("utteranceStart"), self->_utteranceStart);
  objc_msgSend(v5, "encodeObject:forKey:", self->_correctPartialResultIndexList, CFSTR("correctPartialResultIndexList"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nBestVoiceCommandInterpretations, CFSTR("nBestVoiceCommandInterpretations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preITNNBestVoiceCommandInterpretations, CFSTR("preITNNBestVoiceCommandInterpretations"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_recognitionPaused, CFSTR("recognitionPaused"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_firstResultAfterResume, CFSTR("firstResultAfterResume"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endOfSentenceLikelihood, CFSTR("endOfSentenceLikelihood"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latticeMitigatorResult, CFSTR("latticeMitigatorResult"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numOneBestTokensExcludingTriggerPhrase, CFSTR("numOneBestTokensExcludingTriggerPhrase"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voiceCommandDebugInfo, CFSTR("voiceCommandDebugInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_performanceMarkers, CFSTR("performanceMarkers"));

}

- (EARSpeechRecognitionResultPackage)initWithCoder:(id)a3
{
  id v4;
  EARSpeechRecognitionResultPackage *v5;
  uint64_t v6;
  EARSpeechRecognition *recognition;
  uint64_t v8;
  EARSpeechRecognition *preITNRecognition;
  uint64_t v10;
  EARSpeechRecognition *unrepairedRecognition;
  uint64_t v12;
  EARAudioAnalytics *audioAnalytics;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *correctPartialResultIndexList;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *nBestVoiceCommandInterpretations;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSArray *preITNNBestVoiceCommandInterpretations;
  uint64_t v30;
  NSNumber *endOfSentenceLikelihood;
  uint64_t v32;
  EARLatticeMitigatorResult *latticeMitigatorResult;
  uint64_t v34;
  _EARVoiceCommandDebugInfo *voiceCommandDebugInfo;
  uint64_t v36;
  _EARPerformanceMarkers *performanceMarkers;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)EARSpeechRecognitionResultPackage;
  v5 = -[EARSpeechRecognitionResultPackage init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recognition"));
    v6 = objc_claimAutoreleasedReturnValue();
    recognition = v5->_recognition;
    v5->_recognition = (EARSpeechRecognition *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preITNRecognition"));
    v8 = objc_claimAutoreleasedReturnValue();
    preITNRecognition = v5->_preITNRecognition;
    v5->_preITNRecognition = (EARSpeechRecognition *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unrepairedRecognition"));
    v10 = objc_claimAutoreleasedReturnValue();
    unrepairedRecognition = v5->_unrepairedRecognition;
    v5->_unrepairedRecognition = (EARSpeechRecognition *)v10;

    v5->_isFinal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFinal"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioAnalytics"));
    v12 = objc_claimAutoreleasedReturnValue();
    audioAnalytics = v5->_audioAnalytics;
    v5->_audioAnalytics = (EARAudioAnalytics *)v12;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("utteranceStart"));
    v5->_utteranceStart = v14;
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("correctPartialResultIndexList"));
    v18 = objc_claimAutoreleasedReturnValue();
    correctPartialResultIndexList = v5->_correctPartialResultIndexList;
    v5->_correctPartialResultIndexList = (NSArray *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("nBestVoiceCommandInterpretations"));
    v23 = objc_claimAutoreleasedReturnValue();
    nBestVoiceCommandInterpretations = v5->_nBestVoiceCommandInterpretations;
    v5->_nBestVoiceCommandInterpretations = (NSArray *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("preITNNBestVoiceCommandInterpretations"));
    v28 = objc_claimAutoreleasedReturnValue();
    preITNNBestVoiceCommandInterpretations = v5->_preITNNBestVoiceCommandInterpretations;
    v5->_preITNNBestVoiceCommandInterpretations = (NSArray *)v28;

    v5->_recognitionPaused = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("recognitionPaused"));
    v5->_firstResultAfterResume = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("firstResultAfterResume"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endOfSentenceLikelihood"));
    v30 = objc_claimAutoreleasedReturnValue();
    endOfSentenceLikelihood = v5->_endOfSentenceLikelihood;
    v5->_endOfSentenceLikelihood = (NSNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latticeMitigatorResult"));
    v32 = objc_claimAutoreleasedReturnValue();
    latticeMitigatorResult = v5->_latticeMitigatorResult;
    v5->_latticeMitigatorResult = (EARLatticeMitigatorResult *)v32;

    v5->_numOneBestTokensExcludingTriggerPhrase = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numOneBestTokensExcludingTriggerPhrase"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("voiceCommandDebugInfo"));
    v34 = objc_claimAutoreleasedReturnValue();
    voiceCommandDebugInfo = v5->_voiceCommandDebugInfo;
    v5->_voiceCommandDebugInfo = (_EARVoiceCommandDebugInfo *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("performanceMarkers"));
    v36 = objc_claimAutoreleasedReturnValue();
    performanceMarkers = v5->_performanceMarkers;
    v5->_performanceMarkers = (_EARPerformanceMarkers *)v36;

  }
  return v5;
}

- (EARSpeechRecognition)recognition
{
  return self->_recognition;
}

- (EARSpeechRecognition)preITNRecognition
{
  return self->_preITNRecognition;
}

- (EARSpeechRecognition)unrepairedRecognition
{
  return self->_unrepairedRecognition;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (EARAudioAnalytics)audioAnalytics
{
  return self->_audioAnalytics;
}

- (double)utteranceStart
{
  return self->_utteranceStart;
}

- (NSArray)correctPartialResultIndexList
{
  return self->_correctPartialResultIndexList;
}

- (NSArray)nBestVoiceCommandInterpretations
{
  return self->_nBestVoiceCommandInterpretations;
}

- (NSArray)preITNNBestVoiceCommandInterpretations
{
  return self->_preITNNBestVoiceCommandInterpretations;
}

- (BOOL)recognitionPaused
{
  return self->_recognitionPaused;
}

- (BOOL)firstResultAfterResume
{
  return self->_firstResultAfterResume;
}

- (NSNumber)endOfSentenceLikelihood
{
  return self->_endOfSentenceLikelihood;
}

- (EARLatticeMitigatorResult)latticeMitigatorResult
{
  return self->_latticeMitigatorResult;
}

- (int64_t)numOneBestTokensExcludingTriggerPhrase
{
  return self->_numOneBestTokensExcludingTriggerPhrase;
}

- (_EARVoiceCommandDebugInfo)voiceCommandDebugInfo
{
  return self->_voiceCommandDebugInfo;
}

- (_EARPerformanceMarkers)performanceMarkers
{
  return self->_performanceMarkers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMarkers, 0);
  objc_storeStrong((id *)&self->_voiceCommandDebugInfo, 0);
  objc_storeStrong((id *)&self->_latticeMitigatorResult, 0);
  objc_storeStrong((id *)&self->_endOfSentenceLikelihood, 0);
  objc_storeStrong((id *)&self->_preITNNBestVoiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_nBestVoiceCommandInterpretations, 0);
  objc_storeStrong((id *)&self->_correctPartialResultIndexList, 0);
  objc_storeStrong((id *)&self->_audioAnalytics, 0);
  objc_storeStrong((id *)&self->_unrepairedRecognition, 0);
  objc_storeStrong((id *)&self->_preITNRecognition, 0);
  objc_storeStrong((id *)&self->_recognition, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
