@implementation AFSpeechLatticeMitigatorResult

- (void)encodeWithCoder:(id)a3
{
  NSString *version;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  version = self->_version;
  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", version, CFSTR("_version"));
  *(float *)&v5 = self->_score;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("_score"), v5);
  *(float *)&v6 = self->_threshold;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("_threshold"), v6);
  *(float *)&v7 = self->_calibrationScale;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("_calibrationScale"), v7);
  *(float *)&v8 = self->_calibrationOffset;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("_calibrationOffset"), v8);

}

- (AFSpeechLatticeMitigatorResult)initWithCoder:(id)a3
{
  id v4;
  AFSpeechLatticeMitigatorResult *v5;
  uint64_t v6;
  NSString *version;
  float v8;
  float v9;
  float v10;
  float v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFSpeechLatticeMitigatorResult;
  v5 = -[AFSpeechLatticeMitigatorResult init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_version"));
    v6 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v6;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_score"));
    v5->_score = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_threshold"));
    v5->_threshold = v9;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_calibrationScale"));
    v5->_calibrationScale = v10;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_calibrationOffset"));
    v5->_calibrationOffset = v11;
  }

  return v5;
}

- (AFSpeechLatticeMitigatorResult)initWithResults:(id)a3 score:(float)a4 threshold:(float)a5
{
  id v8;
  AFSpeechLatticeMitigatorResult *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  AFSpeechLatticeMitigatorResult *v14;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AFSpeechLatticeMitigatorResult;
  v9 = -[AFSpeechLatticeMitigatorResult init](&v16, sel_init);
  if (v9)
  {
    LODWORD(v12) = 1.0;
    LODWORD(v13) = 0;
    *(float *)&v10 = a4;
    *(float *)&v11 = a5;
    v14 = -[AFSpeechLatticeMitigatorResult initWithResults:score:threshold:calibrationScale:calibrationOffset:](v9, "initWithResults:score:threshold:calibrationScale:calibrationOffset:", v8, v10, v11, v12, v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (AFSpeechLatticeMitigatorResult)initWithResults:(id)a3 score:(float)a4 threshold:(float)a5 calibrationScale:(float)a6 calibrationOffset:(float)a7
{
  id v12;
  AFSpeechLatticeMitigatorResult *v13;
  uint64_t v14;
  NSString *version;
  objc_super v17;

  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AFSpeechLatticeMitigatorResult;
  v13 = -[AFSpeechLatticeMitigatorResult init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    version = v13->_version;
    v13->_version = (NSString *)v14;

    v13->_score = a4;
    v13->_threshold = a5;
    v13->_calibrationScale = a6;
    v13->_calibrationOffset = a7;
  }

  return v13;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("version");
  v3 = (void *)-[NSString copy](self->_version, "copy");
  v11[0] = v3;
  v10[1] = CFSTR("score");
  *(float *)&v4 = self->_score;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("threshold");
  *(float *)&v6 = self->_threshold;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)version
{
  return self->_version;
}

- (float)score
{
  return self->_score;
}

- (float)threshold
{
  return self->_threshold;
}

- (float)calibrationScale
{
  return self->_calibrationScale;
}

- (float)calibrationOffset
{
  return self->_calibrationOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
