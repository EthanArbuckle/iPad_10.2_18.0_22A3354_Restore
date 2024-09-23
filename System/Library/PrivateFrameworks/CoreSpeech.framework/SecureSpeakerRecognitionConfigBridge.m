@implementation SecureSpeakerRecognitionConfigBridge

- (SecureSpeakerRecognitionConfigBridge)initWithPhraseConfigs:(id)a3 numPruningRetentionUtt:(unsigned int)a4 pruningExplicitSATThreshold:(float)a5 pruningExplicitPSRThreshold:(float)a6 pruningSATThreshold:(float)a7 pruningPSRThreshold:(float)a8 combinationWeight:(float)a9 implicitProfileThreshold:(float)a10 implicitProfileDeltaThreshold:(float)a11 implicitVTThreshold:(float)a12 maxEnrollmentUtterances:(unsigned int)a13 implicit_training_enabled:(BOOL)a14 multiUserHighScoreThreshold:(unsigned int)a15 multiUserLowScoreThreshold:(unsigned int)a16 multiUserConfidentScoreThreshold:(unsigned int)a17 multiUserDeltaScoreThreshold:(unsigned int)a18 useTDTIEnrollment:(BOOL)a19
{
  id v34;
  SecureSpeakerRecognitionConfigBridge *v35;
  SecureSpeakerRecognitionConfigBridge *v36;
  SecureSpeakerRecognitionConfigBridge *v37;
  objc_super v39;

  v34 = a3;
  if (objc_msgSend(v34, "count"))
  {
    v39.receiver = self;
    v39.super_class = (Class)SecureSpeakerRecognitionConfigBridge;
    v35 = -[SecureSpeakerRecognitionConfigBridge init](&v39, sel_init);
    v36 = v35;
    if (v35)
    {
      objc_storeStrong((id *)&v35->_phraseConfigs, a3);
      v36->_numPruningRetentionUtt = a4;
      v36->_pruningExplicitSATThreshold = a5;
      v36->_pruningExplicitPSRThreshold = a6;
      v36->_pruningSATThreshold = a7;
      v36->_pruningPSRThreshold = a8;
      v36->_combinationWeight = a9;
      v36->_implicitProfileThreshold = a10;
      v36->_implicitProfileDeltaThreshold = a11;
      v36->_implicitVTThreshold = a12;
      v36->_implicitTrainingEnabled = a14;
      v36->_maxEnrollmentUtterances = a13;
      v36->_multiUserHighScoreThreshold = a15;
      v36->_multiUserLowScoreThreshold = a16;
      v36->_multiUserConfidentScoreThreshold = a17;
      v36->_multiUserDeltaScoreThreshold = a18;
      v36->_useTDTIEnrollment = a19;
    }
    self = v36;
    v37 = self;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (void)iteratePhraseConfigs:(id)a3
{
  NSUInteger v4;
  void *v5;
  NSArray *phraseConfigs;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  v4 = -[NSArray count](self->_phraseConfigs, "count");
  v5 = v7;
  if (v7 && v4)
  {
    phraseConfigs = self->_phraseConfigs;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__SecureSpeakerRecognitionConfigBridge_iteratePhraseConfigs___block_invoke;
    v8[3] = &unk_1E7C23FA0;
    v9 = v7;
    -[NSArray enumerateObjectsUsingBlock:](phraseConfigs, "enumerateObjectsUsingBlock:", v8);

    v5 = v7;
  }

}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("phraseConfigs-count: %ld\n"), -[NSArray count](self->_phraseConfigs, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("_numPruningRetentionUtt: %u\n"), self->_numPruningRetentionUtt);
  objc_msgSend(v3, "appendFormat:", CFSTR("_pruningExplicitSATThreshold: %f\n"), self->_pruningExplicitSATThreshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("_pruningExplicitPSRThreshold: %f\n"), self->_pruningExplicitPSRThreshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("_pruningSATThreshold: %f\n"), self->_pruningSATThreshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("_pruningPSRThreshold: %f\n"), self->_pruningPSRThreshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("_combinationWeight: %f\n"), self->_combinationWeight);
  objc_msgSend(v3, "appendFormat:", CFSTR("_implicitProfileThreshold: %f\n"), self->_implicitProfileThreshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("_implicitVTThreshold: %f\n"), self->_implicitVTThreshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("_maxEnrollmentUtterances: %u\n"), self->_maxEnrollmentUtterances);
  objc_msgSend(v3, "appendFormat:", CFSTR("_implicit_training_enabled: %d\n"), self->_implicitTrainingEnabled);
  objc_msgSend(v3, "appendFormat:", CFSTR("_multiUserHighScoreThreshold: %u\n"), self->_multiUserHighScoreThreshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("_multiUserLowScoreThreshold: %u\n"), self->_multiUserLowScoreThreshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("_multiUserConfidentScoreThreshold: %u\n"), self->_multiUserConfidentScoreThreshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("_multiUserDeltaScoreThreshold: %u\n"), self->_multiUserDeltaScoreThreshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("_useTDTIEnrollment: %d\n"), self->_useTDTIEnrollment);
  return v3;
}

- (NSArray)phraseConfigs
{
  return self->_phraseConfigs;
}

- (void)setPhraseConfigs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unsigned)numPruningRetentionUtt
{
  return self->_numPruningRetentionUtt;
}

- (void)setNumPruningRetentionUtt:(unsigned int)a3
{
  self->_numPruningRetentionUtt = a3;
}

- (float)pruningExplicitSATThreshold
{
  return self->_pruningExplicitSATThreshold;
}

- (void)setPruningExplicitSATThreshold:(float)a3
{
  self->_pruningExplicitSATThreshold = a3;
}

- (float)pruningExplicitPSRThreshold
{
  return self->_pruningExplicitPSRThreshold;
}

- (void)setPruningExplicitPSRThreshold:(float)a3
{
  self->_pruningExplicitPSRThreshold = a3;
}

- (float)pruningSATThreshold
{
  return self->_pruningSATThreshold;
}

- (void)setPruningSATThreshold:(float)a3
{
  self->_pruningSATThreshold = a3;
}

- (float)pruningPSRThreshold
{
  return self->_pruningPSRThreshold;
}

- (void)setPruningPSRThreshold:(float)a3
{
  self->_pruningPSRThreshold = a3;
}

- (float)combinationWeight
{
  return self->_combinationWeight;
}

- (void)setCombinationWeight:(float)a3
{
  self->_combinationWeight = a3;
}

- (float)implicitProfileThreshold
{
  return self->_implicitProfileThreshold;
}

- (void)setImplicitProfileThreshold:(float)a3
{
  self->_implicitProfileThreshold = a3;
}

- (float)implicitProfileDeltaThreshold
{
  return self->_implicitProfileDeltaThreshold;
}

- (void)setImplicitProfileDeltaThreshold:(float)a3
{
  self->_implicitProfileDeltaThreshold = a3;
}

- (float)implicitVTThreshold
{
  return self->_implicitVTThreshold;
}

- (void)setImplicitVTThreshold:(float)a3
{
  self->_implicitVTThreshold = a3;
}

- (unsigned)maxEnrollmentUtterances
{
  return self->_maxEnrollmentUtterances;
}

- (void)setMaxEnrollmentUtterances:(unsigned int)a3
{
  self->_maxEnrollmentUtterances = a3;
}

- (BOOL)implicitTrainingEnabled
{
  return self->_implicitTrainingEnabled;
}

- (void)setImplicitTrainingEnabled:(BOOL)a3
{
  self->_implicitTrainingEnabled = a3;
}

- (unsigned)multiUserHighScoreThreshold
{
  return self->_multiUserHighScoreThreshold;
}

- (void)setMultiUserHighScoreThreshold:(unsigned int)a3
{
  self->_multiUserHighScoreThreshold = a3;
}

- (unsigned)multiUserLowScoreThreshold
{
  return self->_multiUserLowScoreThreshold;
}

- (void)setMultiUserLowScoreThreshold:(unsigned int)a3
{
  self->_multiUserLowScoreThreshold = a3;
}

- (unsigned)multiUserConfidentScoreThreshold
{
  return self->_multiUserConfidentScoreThreshold;
}

- (void)setMultiUserConfidentScoreThreshold:(unsigned int)a3
{
  self->_multiUserConfidentScoreThreshold = a3;
}

- (unsigned)multiUserDeltaScoreThreshold
{
  return self->_multiUserDeltaScoreThreshold;
}

- (void)setMultiUserDeltaScoreThreshold:(unsigned int)a3
{
  self->_multiUserDeltaScoreThreshold = a3;
}

- (BOOL)useTDTIEnrollment
{
  return self->_useTDTIEnrollment;
}

- (void)setUseTDTIEnrollment:(BOOL)a3
{
  self->_useTDTIEnrollment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseConfigs, 0);
}

uint64_t __61__SecureSpeakerRecognitionConfigBridge_iteratePhraseConfigs___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
