@implementation _LTLanguagePairOfflineAvailability

- (_LTLanguagePairOfflineAvailability)initWithLocales:(id)a3
{
  id v5;
  _LTLanguagePairOfflineAvailability *v6;
  _LTLanguagePairOfflineAvailability *v7;
  NSString *sourceASRState;
  NSString *targetASRState;
  NSString *sourceTTSState;
  NSString *targetTTSState;
  NSString *mtState;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_LTLanguagePairOfflineAvailability;
  v6 = -[_LTLanguagePairOfflineAvailability init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pair, a3);
    v7->_pairState = 3;
    sourceASRState = v7->_sourceASRState;
    v7->_sourceASRState = (NSString *)CFSTR("Unknown");

    targetASRState = v7->_targetASRState;
    v7->_targetASRState = (NSString *)CFSTR("Unknown");

    sourceTTSState = v7->_sourceTTSState;
    v7->_sourceTTSState = (NSString *)CFSTR("Unimplemented");

    targetTTSState = v7->_targetTTSState;
    v7->_targetTTSState = (NSString *)CFSTR("Unimplemented");

    mtState = v7->_mtState;
    v7->_mtState = (NSString *)CFSTR("Unknown");

    v7->_needsUpdate = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t pairState;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;

  -[_LTLanguagePairOfflineAvailability pair](self, "pair");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_LTLanguagePairOfflineAvailability pair](self, "pair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  pairState = self->_pairState;
  if (pairState > 2)
    v10 = CFSTR("Unknown");
  else
    v10 = off_250693A48[pairState];
  if (self->_needsUpdate)
    v11 = CFSTR("Update");
  else
    v11 = &stru_250695360;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ <-> %@ | pair: %@ MT: %@ ASR-%@ : %@ ASR-%@: %@ %@"), v5, v8, v10, self->_mtState, v5, self->_sourceASRState, v8, self->_targetASRState, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (_LTLanguagePairOfflineAvailability)initWithCoder:(id)a3
{
  id v4;
  _LTLanguagePairOfflineAvailability *v5;
  uint64_t v6;
  _LTLocalePair *pair;
  uint64_t v8;
  NSString *sourceASRState;
  uint64_t v10;
  NSString *targetASRState;
  uint64_t v12;
  NSString *sourceTTSState;
  uint64_t v14;
  NSString *targetTTSState;
  uint64_t v16;
  NSString *mtState;
  _LTLanguagePairOfflineAvailability *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_LTLanguagePairOfflineAvailability;
  v5 = -[_LTLanguagePairOfflineAvailability init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pair"));
    v6 = objc_claimAutoreleasedReturnValue();
    pair = v5->_pair;
    v5->_pair = (_LTLocalePair *)v6;

    v5->_pairState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pairState"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("sourceASRState"));
    v8 = objc_claimAutoreleasedReturnValue();
    sourceASRState = v5->_sourceASRState;
    v5->_sourceASRState = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("targetASRState"));
    v10 = objc_claimAutoreleasedReturnValue();
    targetASRState = v5->_targetASRState;
    v5->_targetASRState = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("sourceTTSState"));
    v12 = objc_claimAutoreleasedReturnValue();
    sourceTTSState = v5->_sourceTTSState;
    v5->_sourceTTSState = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("targetTTSState"));
    v14 = objc_claimAutoreleasedReturnValue();
    targetTTSState = v5->_targetTTSState;
    v5->_targetTTSState = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("mtState"));
    v16 = objc_claimAutoreleasedReturnValue();
    mtState = v5->_mtState;
    v5->_mtState = (NSString *)v16;

    v5->_needsUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsUpdate"));
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _LTLocalePair *pair;
  id v5;

  pair = self->_pair;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pair, CFSTR("pair"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pairState, CFSTR("pairState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceASRState, CFSTR("sourceASRState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetASRState, CFSTR("targetASRState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceTTSState, CFSTR("sourceTTSState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetTTSState, CFSTR("targetTTSState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mtState, CFSTR("mtState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_needsUpdate, CFSTR("needsUpdate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)pairState
{
  return self->_pairState;
}

- (void)setPairState:(int64_t)a3
{
  self->_pairState = a3;
}

- (_LTLocalePair)pair
{
  return self->_pair;
}

- (void)setPair:(id)a3
{
  objc_storeStrong((id *)&self->_pair, a3);
}

- (NSString)sourceASRState
{
  return self->_sourceASRState;
}

- (void)setSourceASRState:(id)a3
{
  objc_storeStrong((id *)&self->_sourceASRState, a3);
}

- (NSString)targetASRState
{
  return self->_targetASRState;
}

- (void)setTargetASRState:(id)a3
{
  objc_storeStrong((id *)&self->_targetASRState, a3);
}

- (NSString)mtState
{
  return self->_mtState;
}

- (void)setMtState:(id)a3
{
  objc_storeStrong((id *)&self->_mtState, a3);
}

- (NSString)sourceTTSState
{
  return self->_sourceTTSState;
}

- (void)setSourceTTSState:(id)a3
{
  objc_storeStrong((id *)&self->_sourceTTSState, a3);
}

- (NSString)targetTTSState
{
  return self->_targetTTSState;
}

- (void)setTargetTTSState:(id)a3
{
  objc_storeStrong((id *)&self->_targetTTSState, a3);
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetTTSState, 0);
  objc_storeStrong((id *)&self->_sourceTTSState, 0);
  objc_storeStrong((id *)&self->_mtState, 0);
  objc_storeStrong((id *)&self->_targetASRState, 0);
  objc_storeStrong((id *)&self->_sourceASRState, 0);
  objc_storeStrong((id *)&self->_pair, 0);
}

@end
