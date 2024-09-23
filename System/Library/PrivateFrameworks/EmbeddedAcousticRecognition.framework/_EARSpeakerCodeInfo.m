@implementation _EARSpeakerCodeInfo

- (_EARSpeakerCodeInfo)initWithLanguage:(id)a3
{
  id v4;
  _EARSpeakerCodeInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSNumber *v12;
  NSNumber *v13;
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *nnetVersion;
  NSNumber *v17;
  NSNumber *numFrames;
  NSNumber *v19;
  NSNumber *trainingOffset;
  NSNumber *v21;
  NSNumber *recognitionOffset;
  NSNumber *v23;
  NSString *trainingSpeakerCode;
  NSString *v25;
  NSString *inferenceSpeakerCode;
  NSString *v27;
  NSString *accumulatedGradient;
  NSString *v30;
  _EARSpeakerCodeReader *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)_EARSpeakerCodeInfo;
  v5 = -[_EARSpeakerCodeInfo init](&v40, sel_init);
  if (v5)
  {
    v32 = v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", 0);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", 0);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", 0);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLong:", 0);
    v38 = 0;
    v39 = 0;
    v36 = v6;
    v37 = 0;
    v34 = v8;
    v35 = v7;
    v33 = v9;
    v31 = objc_alloc_init(_EARSpeakerCodeReader);
    -[_EARSpeakerCodeReader getTrainingSpeakerCode:inferenceSpeakerCode:accumulatedGradient:nnetVersion:numFrames:trainingOffset:recognitionOffset:language:](v31, "getTrainingSpeakerCode:inferenceSpeakerCode:accumulatedGradient:nnetVersion:numFrames:trainingOffset:recognitionOffset:language:", &v39, &v38, &v37, &v36, &v35, &v34, &v33, v4);
    v10 = (NSString *)v39;
    v11 = (NSString *)v38;
    v30 = (NSString *)v37;
    v12 = (NSNumber *)v36;

    v13 = (NSNumber *)v35;
    v14 = (NSNumber *)v34;

    v15 = (NSNumber *)v33;
    nnetVersion = v5->_nnetVersion;
    v5->_nnetVersion = v12;
    v17 = v12;

    numFrames = v5->_numFrames;
    v5->_numFrames = v13;
    v19 = v13;

    trainingOffset = v5->_trainingOffset;
    v5->_trainingOffset = v14;
    v21 = v14;

    recognitionOffset = v5->_recognitionOffset;
    v5->_recognitionOffset = v15;
    v23 = v15;

    trainingSpeakerCode = v5->_trainingSpeakerCode;
    v5->_trainingSpeakerCode = v10;
    v25 = v10;

    inferenceSpeakerCode = v5->_inferenceSpeakerCode;
    v5->_inferenceSpeakerCode = v11;
    v27 = v11;

    accumulatedGradient = v5->_accumulatedGradient;
    v5->_accumulatedGradient = v30;

    v4 = v32;
  }

  return v5;
}

- (NSString)trainingSpeakerCode
{
  return self->_trainingSpeakerCode;
}

- (NSString)inferenceSpeakerCode
{
  return self->_inferenceSpeakerCode;
}

- (void)setInferenceSpeakerCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)accumulatedGradient
{
  return self->_accumulatedGradient;
}

- (NSNumber)numFrames
{
  return self->_numFrames;
}

- (void)setNumFrames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)nnetVersion
{
  return self->_nnetVersion;
}

- (NSNumber)trainingOffset
{
  return self->_trainingOffset;
}

- (NSNumber)recognitionOffset
{
  return self->_recognitionOffset;
}

- (BOOL)isSpeakerCodeUsed
{
  return self->_isSpeakerCodeUsed;
}

- (void)setIsSpeakerCodeUsed:(BOOL)a3
{
  self->_isSpeakerCodeUsed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognitionOffset, 0);
  objc_storeStrong((id *)&self->_trainingOffset, 0);
  objc_storeStrong((id *)&self->_nnetVersion, 0);
  objc_storeStrong((id *)&self->_numFrames, 0);
  objc_storeStrong((id *)&self->_accumulatedGradient, 0);
  objc_storeStrong((id *)&self->_inferenceSpeakerCode, 0);
  objc_storeStrong((id *)&self->_trainingSpeakerCode, 0);
}

@end
