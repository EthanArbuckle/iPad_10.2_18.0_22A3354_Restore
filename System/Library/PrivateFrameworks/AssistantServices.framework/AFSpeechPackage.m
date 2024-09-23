@implementation AFSpeechPackage

- (void)encodeWithCoder:(id)a3
{
  AFSpeechRecognition *recognition;
  id v5;

  recognition = self->_recognition;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recognition, CFSTR("recognition"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unfilteredRecognition, CFSTR("unfilteredRecognition"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawRecognition, CFSTR("rawRecognition"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_audioAnalytics, CFSTR("audioAnalytics"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFinal, CFSTR("isFinal"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("utteranceStart"), self->_utteranceStart);
  objc_msgSend(v5, "encodeObject:forKey:", self->_latticeMitigatorResult, CFSTR("latMitRes"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_recognitionPaused, CFSTR("recognitionPaused"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_speechProfileUsed, CFSTR("speechProfileUsed"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_resultCandidateId, CFSTR("resultCandidateId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endOfSentenceLikelihood, CFSTR("endOfSentenceLikelihood"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelVersion, CFSTR("modelVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_acousticModelVersion, CFSTR("acousticModelVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_potentialCommandPrecedingUtterance, CFSTR("potentialCommandPrecedingUtterance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_potentialCommandUtterance, CFSTR("potentialCommandUtterance"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_numOneBestTokensExcludingTriggerPhrase, CFSTR("numOneBestTokensExcludingTriggerPhrase"));

}

- (AFSpeechPackage)initWithCoder:(id)a3
{
  id v3;
  double v4;
  double v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  unsigned int v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  AFSpeechPackage *v24;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recognition"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unfilteredRecognition"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawRecognition"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioAnalytics"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isFinal"));
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("utteranceStart"));
  v5 = v4;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("latMitRes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("recognitionPaused"));
  v6 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("speechProfileUsed"));
  v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("resultCandidateId"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endOfSentenceLikelihood"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("acousticModelVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("potentialCommandPrecedingUtterance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("potentialCommandUtterance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("numOneBestTokensExcludingTriggerPhrase"));

  BYTE1(v15) = v6;
  LOBYTE(v15) = v17;
  v24 = -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:", v22, v18, v21, v20, v16, v19, v5, v15, v7, v8, v9, v10, v11, v12, v13);

  return v24;
}

- (AFSpeechPackage)init
{
  uint64_t v3;

  LOWORD(v3) = 0;
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", 0, 0, 0, 0, 0, 0, 0.0, v3, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 rawRecognition:(id)a4 audioAnalytics:(id)a5 isFinal:(BOOL)a6 utteranceStart:(double)a7
{
  uint64_t v8;

  LOWORD(v8) = 0;
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", a3, a3, a4, a5, a6, 0, a7, v8, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8
{
  uint64_t v9;

  LOWORD(v9) = 0;
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", a3, a4, a5, a6, a7, 0, a8, v9, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 rawRecognition:(id)a4 audioAnalytics:(id)a5 isFinal:(BOOL)a6 utteranceStart:(double)a7 latticeMitigatorResult:(id)a8
{
  uint64_t v9;

  LOWORD(v9) = 0;
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", a3, a3, a4, a5, a6, a8, a7, v9, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9
{
  uint64_t v10;

  LOWORD(v10) = 0;
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", a3, a4, a5, a6, a7, a9, a8, v10, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10
{
  uint64_t v11;

  LOWORD(v11) = a10;
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", a3, a4, a5, a6, a7, a9, a8, v11, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11
{
  uint64_t v12;

  LOWORD(v12) = __PAIR16__(a11, a10);
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:", a3, a4, a5, a6, a7, a9, a8, v12, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12
{
  uint64_t v13;

  LOWORD(v13) = __PAIR16__(a11, a10);
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:", a3, a4, a5, a6, a7, a9, a8, v13, a12, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12 endOfSentenceLikelihood:(id)a13
{
  uint64_t v14;

  LOWORD(v14) = __PAIR16__(a11, a10);
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:", a3, a4, a5, a6, a7, a9, a8, v14, a12, a13, 0, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12 endOfSentenceLikelihood:(id)a13 modelVersion:(id)a14 acousticModelVersion:(id)a15
{
  uint64_t v16;

  LOWORD(v16) = __PAIR16__(a11, a10);
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:", a3, a4, a5, a6, a7, a9, a8, v16, a12, a13, a14, a15, 0, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12 endOfSentenceLikelihood:(id)a13 modelVersion:(id)a14 acousticModelVersion:(id)a15 potentialCommandPrecedingUtterance:(id)a16 potentialCommandUtterance:(id)a17
{
  uint64_t v18;

  LOWORD(v18) = __PAIR16__(a11, a10);
  return -[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:", a3, a4, a5, a6, a7, a9, a8, v18, a12, a13, a14, a15, a16, a17, 0);
}

- (AFSpeechPackage)initWithRecognition:(id)a3 unfilteredRecognition:(id)a4 rawRecognition:(id)a5 audioAnalytics:(id)a6 isFinal:(BOOL)a7 utteranceStart:(double)a8 latticeMitigatorResult:(id)a9 recognitionPaused:(BOOL)a10 speechProfileUsed:(BOOL)a11 resultCandidateId:(int64_t)a12 endOfSentenceLikelihood:(id)a13 modelVersion:(id)a14 acousticModelVersion:(id)a15 potentialCommandPrecedingUtterance:(id)a16 potentialCommandUtterance:(id)a17 numOneBestTokensExcludingTriggerPhrase:(int64_t)a18
{
  id v24;
  id v25;
  id v26;
  id v27;
  AFSpeechPackage *v28;
  uint64_t v29;
  AFSpeechRecognition *recognition;
  uint64_t v31;
  AFSpeechRecognition *unfilteredRecognition;
  uint64_t v33;
  AFSpeechRecognition *rawRecognition;
  uint64_t v35;
  AFSpeechAudioAnalytics *audioAnalytics;
  uint64_t v37;
  NSNumber *endOfSentenceLikelihood;
  uint64_t v39;
  AFSpeechPackage *potentialCommandPrecedingUtterance;
  uint64_t v41;
  AFSpeechPackage *potentialCommandUtterance;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v51;

  v50 = a3;
  v49 = a4;
  v48 = a5;
  v47 = a6;
  v24 = a9;
  v25 = a13;
  v46 = a14;
  v45 = a15;
  v26 = a16;
  v27 = a17;
  v51.receiver = self;
  v51.super_class = (Class)AFSpeechPackage;
  v28 = -[AFSpeechPackage init](&v51, sel_init);
  if (v28)
  {
    v29 = objc_msgSend(v50, "copy");
    recognition = v28->_recognition;
    v28->_recognition = (AFSpeechRecognition *)v29;

    v31 = objc_msgSend(v49, "copy");
    unfilteredRecognition = v28->_unfilteredRecognition;
    v28->_unfilteredRecognition = (AFSpeechRecognition *)v31;

    v33 = objc_msgSend(v48, "copy");
    rawRecognition = v28->_rawRecognition;
    v28->_rawRecognition = (AFSpeechRecognition *)v33;

    v35 = objc_msgSend(v47, "copy");
    audioAnalytics = v28->_audioAnalytics;
    v28->_audioAnalytics = (AFSpeechAudioAnalytics *)v35;

    v28->_isFinal = a7;
    v28->_utteranceStart = a8;
    objc_storeStrong((id *)&v28->_latticeMitigatorResult, a9);
    v28->_recognitionPaused = a10;
    v28->_speechProfileUsed = a11;
    v28->_resultCandidateId = a12;
    v37 = objc_msgSend(v25, "copy");
    endOfSentenceLikelihood = v28->_endOfSentenceLikelihood;
    v28->_endOfSentenceLikelihood = (NSNumber *)v37;

    objc_storeStrong((id *)&v28->_modelVersion, a14);
    objc_storeStrong((id *)&v28->_acousticModelVersion, a15);
    v39 = objc_msgSend(v26, "copy");
    potentialCommandPrecedingUtterance = v28->_potentialCommandPrecedingUtterance;
    v28->_potentialCommandPrecedingUtterance = (AFSpeechPackage *)v39;

    v41 = objc_msgSend(v27, "copy");
    potentialCommandUtterance = v28->_potentialCommandUtterance;
    v28->_potentialCommandUtterance = (AFSpeechPackage *)v41;

    v28->_numOneBestTokensExcludingTriggerPhrase = a18;
  }

  return v28;
}

- (AFSpeechPackage)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  AFSpeechRecognition *v7;
  id v8;
  void *v9;
  objc_class *v10;
  AFSpeechRecognition *v11;
  id v12;
  void *v13;
  objc_class *v14;
  NSString *p_isa;
  id v16;
  AFSpeechRecognition *v17;
  void *v18;
  objc_class *v19;
  NSString *v20;
  id v21;
  NSString *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  AFSpeechPackage *v51;
  void *v52;
  uint64_t v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSString *v63;
  AFSpeechRecognition *v64;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("recognition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (AFSpeechRecognition *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (!v8)
  {
    v12 = 0;
    v51 = 0;
LABEL_39:

    goto LABEL_40;
  }
  NSClassFromString((NSString *)&v7->super.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v51 = 0;
    v12 = v8;
    goto LABEL_39;
  }

  v7 = -[AFSpeechRecognition initWithDictionary:]([AFSpeechRecognition alloc], "initWithDictionary:", v8);
  if (v7)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("unfilteredRecognition"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (AFSpeechRecognition *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    if (v12)
    {
      NSClassFromString((NSString *)&v11->super.isa);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        v11 = -[AFSpeechRecognition initWithDictionary:]([AFSpeechRecognition alloc], "initWithDictionary:", v12);
        if (!v11)
        {
          v51 = 0;
LABEL_38:

          goto LABEL_39;
        }
        objc_msgSend(v4, "objectForKey:", CFSTR("rawRecognition"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        p_isa = (NSString *)objc_claimAutoreleasedReturnValue();
        v16 = v13;
        if (v16)
        {
          NSClassFromString(p_isa);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {

            v17 = -[AFSpeechRecognition initWithDictionary:]([AFSpeechRecognition alloc], "initWithDictionary:", v16);
            if (!v17)
            {
              p_isa = 0;
              v51 = 0;
LABEL_36:

              goto LABEL_37;
            }
            v64 = v17;
            objc_msgSend(v4, "objectForKey:", CFSTR("isFinal"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (objc_class *)objc_opt_class();
            NSStringFromClass(v19);
            v20 = (NSString *)objc_claimAutoreleasedReturnValue();
            v21 = v18;
            if (v21)
            {
              NSClassFromString(v20);
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v62 = v21;

                objc_msgSend(v4, "objectForKey:", CFSTR("utteranceStart"));
                v22 = (NSString *)objc_claimAutoreleasedReturnValue();
                v23 = (objc_class *)objc_opt_class();
                NSStringFromClass(v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = v22;
                LODWORD(v22) = strictValidationOfObjectWithClassType(v22, v24);

                if (!(_DWORD)v22)
                {
                  v51 = 0;
                  v21 = v62;
                  p_isa = (NSString *)&v64->super.isa;
                  goto LABEL_34;
                }
                objc_msgSend(v4, "objectForKey:", CFSTR("recognitionPaused"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = (objc_class *)objc_opt_class();
                NSStringFromClass(v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = v25;
                v28 = strictValidationOfObjectWithClassType(v25, v27);

                p_isa = (NSString *)&v64->super.isa;
                if (v28)
                {
                  objc_msgSend(v4, "objectForKey:", CFSTR("speechProfileUsed"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v30);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = v29;
                  LODWORD(v29) = strictValidationOfObjectWithClassType(v29, v31);

                  if ((_DWORD)v29)
                  {
                    objc_msgSend(v4, "objectForKey:", CFSTR("resultCandidateId"));
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v33);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v59 = v32;
                    LODWORD(v32) = strictValidationOfObjectWithClassType(v32, v34);

                    if ((_DWORD)v32)
                    {
                      objc_msgSend(v4, "objectForKey:", CFSTR("endOfSentenceLikelihood"));
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v36);
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      v58 = v35;
                      LODWORD(v35) = strictValidationOfObjectWithClassType(v35, v37);

                      if ((_DWORD)v35)
                      {
                        objc_msgSend(v4, "objectForKey:", CFSTR("modelVersion"));
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        v39 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v39);
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        v41 = strictValidationOfObjectWithClassType(v38, v40);

                        if (v41)
                        {
                          objc_msgSend(v4, "objectForKey:", CFSTR("acousticModelVersion"));
                          v42 = (void *)objc_claimAutoreleasedReturnValue();
                          v43 = (objc_class *)objc_opt_class();
                          NSStringFromClass(v43);
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                          v57 = v42;
                          LODWORD(v42) = strictValidationOfObjectWithClassType(v42, v44);

                          if ((_DWORD)v42)
                          {
                            objc_msgSend(v4, "objectForKey:", CFSTR("numOneBestTokensExcludingTriggerPhrase"));
                            v45 = (void *)objc_claimAutoreleasedReturnValue();
                            v46 = (objc_class *)objc_opt_class();
                            NSStringFromClass(v46);
                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                            v56 = v45;
                            LODWORD(v45) = strictValidationOfObjectWithClassType(v45, v47);

                            if ((_DWORD)v45)
                            {
                              v48 = objc_msgSend(v62, "BOOLValue");
                              -[NSString doubleValue](v63, "doubleValue");
                              v50 = v49;
                              v55 = objc_msgSend(v61, "BOOLValue");
                              BYTE1(v54) = objc_msgSend(v60, "BOOLValue");
                              LOBYTE(v54) = v55;
                              self = objc_retain(-[AFSpeechPackage initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:](self, "initWithRecognition:unfilteredRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:recognitionPaused:speechProfileUsed:resultCandidateId:endOfSentenceLikelihood:modelVersion:acousticModelVersion:potentialCommandPrecedingUtterance:potentialCommandUtterance:numOneBestTokensExcludingTriggerPhrase:", v7, v11, v64, 0, v48, 0, v50, v54, (int)objc_msgSend(v59, "intValue"), v58, v38, v57, 0,
                                         0,
                                         (int)objc_msgSend(v56, "intValue")));
                              v51 = self;
                            }
                            else
                            {
                              v51 = 0;
                            }

                          }
                          else
                          {
                            v51 = 0;
                          }

                        }
                        else
                        {
                          v51 = 0;
                        }

                        v21 = v62;
                        p_isa = (NSString *)&v64->super.isa;
                      }
                      else
                      {
                        v51 = 0;
                        v21 = v62;
                      }

                    }
                    else
                    {
                      v51 = 0;
                      v21 = v62;
                    }

                  }
                  else
                  {
                    v51 = 0;
                    v21 = v62;
                  }

                }
                else
                {
                  v51 = 0;
                  v21 = v62;
                }
                v52 = v61;
LABEL_33:

LABEL_34:
                goto LABEL_35;
              }
              v63 = v20;
              v51 = 0;
              v52 = v21;
            }
            else
            {
              v63 = v20;
              v52 = 0;
              v51 = 0;
            }
            p_isa = (NSString *)&v64->super.isa;
            goto LABEL_33;
          }
          v51 = 0;
          v21 = v16;
        }
        else
        {
          v21 = 0;
          v51 = 0;
        }
LABEL_35:

        goto LABEL_36;
      }
      v51 = 0;
      v16 = v12;
    }
    else
    {
      v16 = 0;
      v51 = 0;
    }
LABEL_37:

    goto LABEL_38;
  }
  v51 = 0;
LABEL_40:

  return v51;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSNumber *endOfSentenceLikelihood;
  void *v6;
  NSString *modelVersion;
  void *v8;
  NSString *acousticModelVersion;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[12];
  _QWORD v21[14];

  v21[12] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("recognition");
  -[AFSpeechRecognition dictionaryRepresentation](self->_recognition, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  v20[1] = CFSTR("unfilteredRecognition");
  -[AFSpeechRecognition dictionaryRepresentation](self->_unfilteredRecognition, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v18;
  v20[2] = CFSTR("rawRecognition");
  -[AFSpeechRecognition dictionaryRepresentation](self->_rawRecognition, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  v20[3] = CFSTR("isFinal");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFinal);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v16;
  v20[4] = CFSTR("utteranceStart");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_utteranceStart);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v15;
  v20[5] = CFSTR("recognitionPaused");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_recognitionPaused);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v14;
  v20[6] = CFSTR("speechProfileUsed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_speechProfileUsed);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v3;
  v20[7] = CFSTR("resultCandidateId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_resultCandidateId);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v4;
  v20[8] = CFSTR("endOfSentenceLikelihood");
  endOfSentenceLikelihood = self->_endOfSentenceLikelihood;
  v6 = endOfSentenceLikelihood;
  if (!endOfSentenceLikelihood)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[8] = v6;
  v20[9] = CFSTR("modelVersion");
  modelVersion = self->_modelVersion;
  v8 = modelVersion;
  if (!modelVersion)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[9] = v8;
  v20[10] = CFSTR("acousticModelVersion");
  acousticModelVersion = self->_acousticModelVersion;
  v10 = acousticModelVersion;
  if (!acousticModelVersion)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[10] = v10;
  v20[11] = CFSTR("numOneBestTokensExcludingTriggerPhrase");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numOneBestTokensExcludingTriggerPhrase);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[11] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (acousticModelVersion)
  {
    if (modelVersion)
      goto LABEL_9;
LABEL_12:

    if (endOfSentenceLikelihood)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!modelVersion)
    goto LABEL_12;
LABEL_9:
  if (!endOfSentenceLikelihood)
    goto LABEL_13;
LABEL_10:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  AFSpeechRecognition *v5;
  AFSpeechRecognition *v6;
  AFSpeechRecognition *v7;
  NSNumber *v8;
  NSString *v9;
  NSString *v10;
  BOOL v11;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  v11 = (objc_opt_isKindOfClass() & 1) != 0
     && ((v5 = (AFSpeechRecognition *)*((_QWORD *)v4 + 2), v5 == self->_recognition)
      || -[AFSpeechRecognition isEqual:](v5, "isEqual:"))
     && ((v6 = (AFSpeechRecognition *)*((_QWORD *)v4 + 3), v6 == self->_unfilteredRecognition)
      || -[AFSpeechRecognition isEqual:](v6, "isEqual:"))
     && ((v7 = (AFSpeechRecognition *)*((_QWORD *)v4 + 4), v7 == self->_rawRecognition)
      || -[AFSpeechRecognition isEqual:](v7, "isEqual:"))
     && v4[8] == self->_isFinal
     && *((double *)v4 + 6) == self->_utteranceStart
     && v4[9] == self->_recognitionPaused
     && v4[10] == self->_speechProfileUsed
     && *((_QWORD *)v4 + 11) == self->_resultCandidateId
     && ((v8 = (NSNumber *)*((_QWORD *)v4 + 8), v8 == self->_endOfSentenceLikelihood)
      || -[NSNumber isEqual:](v8, "isEqual:"))
     && ((v9 = (NSString *)*((_QWORD *)v4 + 12), v9 == self->_modelVersion)
      || -[NSString isEqualToString:](v9, "isEqualToString:"))
     && ((v10 = (NSString *)*((_QWORD *)v4 + 13), v10 == self->_acousticModelVersion)
      || -[NSString isEqualToString:](v10, "isEqualToString:"))
     && *((_QWORD *)v4 + 14) == self->_numOneBestTokensExcludingTriggerPhrase;

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[AFSpeechRecognition hash](self->_recognition, "hash");
  v4 = -[AFSpeechRecognition hash](self->_rawRecognition, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_resultCandidateId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash") ^ (16 * (self->_isFinal ^ self->_recognitionPaused ^ self->_speechProfileUsed));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_utteranceStart);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (void)setPotentialCommandPrecedingUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_potentialCommandPrecedingUtterance, a3);
}

- (void)setPotentialCommandUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_potentialCommandUtterance, a3);
}

- (AFSpeechRecognition)recognition
{
  return self->_recognition;
}

- (AFSpeechRecognition)unfilteredRecognition
{
  return self->_unfilteredRecognition;
}

- (AFSpeechRecognition)rawRecognition
{
  return self->_rawRecognition;
}

- (AFSpeechAudioAnalytics)audioAnalytics
{
  return self->_audioAnalytics;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (double)utteranceStart
{
  return self->_utteranceStart;
}

- (AFSpeechLatticeMitigatorResult)latticeMitigatorResult
{
  return self->_latticeMitigatorResult;
}

- (BOOL)recognitionPaused
{
  return self->_recognitionPaused;
}

- (BOOL)speechProfileUsed
{
  return self->_speechProfileUsed;
}

- (NSNumber)endOfSentenceLikelihood
{
  return self->_endOfSentenceLikelihood;
}

- (AFSpeechPackage)potentialCommandPrecedingUtterance
{
  return self->_potentialCommandPrecedingUtterance;
}

- (AFSpeechPackage)potentialCommandUtterance
{
  return self->_potentialCommandUtterance;
}

- (int64_t)resultCandidateId
{
  return self->_resultCandidateId;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (NSString)acousticModelVersion
{
  return self->_acousticModelVersion;
}

- (int64_t)numOneBestTokensExcludingTriggerPhrase
{
  return self->_numOneBestTokensExcludingTriggerPhrase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acousticModelVersion, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_potentialCommandUtterance, 0);
  objc_storeStrong((id *)&self->_potentialCommandPrecedingUtterance, 0);
  objc_storeStrong((id *)&self->_endOfSentenceLikelihood, 0);
  objc_storeStrong((id *)&self->_latticeMitigatorResult, 0);
  objc_storeStrong((id *)&self->_audioAnalytics, 0);
  objc_storeStrong((id *)&self->_rawRecognition, 0);
  objc_storeStrong((id *)&self->_unfilteredRecognition, 0);
  objc_storeStrong((id *)&self->_recognition, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
