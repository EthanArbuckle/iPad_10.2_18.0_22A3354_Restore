@implementation EARLatticeMitigatorResult

- (EARLatticeMitigatorResult)initWithLatticeMitigatorResult:(id)a3
{
  id v4;
  EARLatticeMitigatorResult *v5;
  uint64_t v6;
  NSString *version;
  float v8;
  float v9;
  float v10;
  float v11;
  EARLatticeMitigatorResult *v12;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)EARLatticeMitigatorResult;
    v5 = -[EARLatticeMitigatorResult init](&v14, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "version");
      v6 = objc_claimAutoreleasedReturnValue();
      version = v5->_version;
      v5->_version = (NSString *)v6;

      objc_msgSend(v4, "score");
      v5->_score = v8;
      objc_msgSend(v4, "threshold");
      v5->_threshold = v9;
      objc_msgSend(v4, "calibrationScale");
      v5->_calibrationScale = v10;
      objc_msgSend(v4, "calibrationOffset");
      v5->_calibrationOffset = v11;
      v5->_processed = objc_msgSend(v4, "processed");
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

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
  objc_msgSend(v9, "encodeObject:forKey:", version, CFSTR("version"));
  *(float *)&v5 = self->_score;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("score"), v5);
  *(float *)&v6 = self->_threshold;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("threshold"), v6);
  *(float *)&v7 = self->_calibrationScale;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("calibrationScale"), v7);
  *(float *)&v8 = self->_calibrationOffset;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("calibrationOffset"), v8);
  objc_msgSend(v9, "encodeBool:forKey:", self->_processed, CFSTR("processed"));

}

- (EARLatticeMitigatorResult)initWithCoder:(id)a3
{
  id v4;
  EARLatticeMitigatorResult *v5;
  uint64_t v6;
  NSString *version;
  float v8;
  float v9;
  float v10;
  float v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EARLatticeMitigatorResult;
  v5 = -[EARLatticeMitigatorResult init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v6 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v6;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("score"));
    v5->_score = v8;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("threshold"));
    v5->_threshold = v9;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("calibrationScale"));
    v5->_calibrationScale = v10;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("calibrationOffset"));
    v5->_calibrationOffset = v11;
    v5->_processed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("processed"));
  }

  return v5;
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

- (BOOL)processed
{
  return self->_processed;
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
