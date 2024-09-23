@implementation _EARLatticeMitigatorResult

- (_EARLatticeMitigatorResult)initWithVersion:(id)a3 score:(float)a4 threshold:(float)a5 calibrationScale:(float)a6 calibrationOffset:(float)a7 processed:(BOOL)a8
{
  id v14;
  _EARLatticeMitigatorResult *v15;
  uint64_t v16;
  NSString *version;
  objc_super v19;

  v14 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_EARLatticeMitigatorResult;
  v15 = -[_EARLatticeMitigatorResult init](&v19, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v14, "copy");
    version = v15->_version;
    v15->_version = (NSString *)v16;

    v15->_score = a4;
    v15->_threshold = a5;
    v15->_calibrationScale = a6;
    v15->_calibrationOffset = a7;
    v15->_processed = a8;
  }

  return v15;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(ver=%@, score=%f, threshold=%f)"), self->_version, self->_score, self->_threshold);
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

@end
