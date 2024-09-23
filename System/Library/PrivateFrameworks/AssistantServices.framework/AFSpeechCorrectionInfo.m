@implementation AFSpeechCorrectionInfo

- (void)encodeWithCoder:(id)a3
{
  int64_t alternativeSelectionCount;
  id v5;

  alternativeSelectionCount = self->_alternativeSelectionCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", alternativeSelectionCount, CFSTR("alternativeSelectionCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_characterModificationCount, CFSTR("characterModificationCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_characterInsertionCount, CFSTR("characterInsertionCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_characterSubstitutionCount, CFSTR("characterSubstitutionCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_characterDeletionCount, CFSTR("characterDeletionCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_correctedText, CFSTR("correctedText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recognizedTextInfo, CFSTR("_recognizedTextInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_alternativesSelectedInfo, CFSTR("_alternativesSelectedInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedAlternativesInfo, CFSTR("_selectedAlternativesInfo"));

}

- (AFSpeechCorrectionInfo)initWithCoder:(id)a3
{
  id v4;
  AFSpeechCorrectionInfo *v5;
  uint64_t v6;
  NSString *correctedText;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *recognizedTextInfo;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *alternativesSelectedInfo;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSArray *selectedAlternativesInfo;
  objc_super v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AFSpeechCorrectionInfo;
  v5 = -[AFSpeechCorrectionInfo init](&v28, sel_init);
  if (v5)
  {
    v5->_alternativeSelectionCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("alternativeSelectionCount"));
    v5->_characterModificationCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("characterModificationCount"));
    v5->_characterInsertionCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("characterInsertionCount"));
    v5->_characterSubstitutionCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("characterSubstitutionCount"));
    v5->_characterDeletionCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("characterDeletionCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("correctedText"));
    v6 = objc_claimAutoreleasedReturnValue();
    correctedText = v5->_correctedText;
    v5->_correctedText = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v29[2] = objc_opt_class();
    v29[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_recognizedTextInfo"));
    v11 = objc_claimAutoreleasedReturnValue();
    recognizedTextInfo = v5->_recognizedTextInfo;
    v5->_recognizedTextInfo = (NSDictionary *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("_alternativesSelectedInfo"));
    v18 = objc_claimAutoreleasedReturnValue();
    alternativesSelectedInfo = v5->_alternativesSelectedInfo;
    v5->_alternativesSelectedInfo = (NSDictionary *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("_selectedAlternativesInfo"));
    v25 = objc_claimAutoreleasedReturnValue();
    selectedAlternativesInfo = v5->_selectedAlternativesInfo;
    v5->_selectedAlternativesInfo = (NSArray *)v25;

  }
  return v5;
}

- (int64_t)alternativeSelectionCount
{
  return self->_alternativeSelectionCount;
}

- (void)setAlternativeSelectionCount:(int64_t)a3
{
  self->_alternativeSelectionCount = a3;
}

- (int64_t)characterModificationCount
{
  return self->_characterModificationCount;
}

- (void)setCharacterModificationCount:(int64_t)a3
{
  self->_characterModificationCount = a3;
}

- (int64_t)characterInsertionCount
{
  return self->_characterInsertionCount;
}

- (void)setCharacterInsertionCount:(int64_t)a3
{
  self->_characterInsertionCount = a3;
}

- (int64_t)characterSubstitutionCount
{
  return self->_characterSubstitutionCount;
}

- (void)setCharacterSubstitutionCount:(int64_t)a3
{
  self->_characterSubstitutionCount = a3;
}

- (int64_t)characterDeletionCount
{
  return self->_characterDeletionCount;
}

- (void)setCharacterDeletionCount:(int64_t)a3
{
  self->_characterDeletionCount = a3;
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (void)setCorrectedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)recognizedTextInfo
{
  return self->_recognizedTextInfo;
}

- (void)setRecognizedTextInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)alternativesSelectedInfo
{
  return self->_alternativesSelectedInfo;
}

- (void)setAlternativesSelectedInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)selectedAlternativesInfo
{
  return self->_selectedAlternativesInfo;
}

- (void)setSelectedAlternativesInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAlternativesInfo, 0);
  objc_storeStrong((id *)&self->_alternativesSelectedInfo, 0);
  objc_storeStrong((id *)&self->_recognizedTextInfo, 0);
  objc_storeStrong((id *)&self->_correctedText, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
