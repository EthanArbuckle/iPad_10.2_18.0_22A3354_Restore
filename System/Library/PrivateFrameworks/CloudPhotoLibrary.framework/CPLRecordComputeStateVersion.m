@implementation CPLRecordComputeStateVersion

- (CPLRecordComputeStateVersion)initWithString:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CPLRecordComputeStateVersion *v9;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (objc_msgSend(v4, "count") == 1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "integerValue");

  }
  v9 = -[CPLRecordComputeStateVersion initWithMajorVersion:stage:](self, "initWithMajorVersion:stage:", v6, v7);

  return v9;
}

- (CPLRecordComputeStateVersion)initWithMajorVersion:(unint64_t)a3 stage:(unint64_t)a4
{
  CPLRecordComputeStateVersion *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPLRecordComputeStateVersion;
  result = -[CPLRecordComputeStateVersion init](&v7, sel_init);
  if (result)
  {
    result->_majorVersion = a3;
    result->_stage = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  CPLRecordComputeStateVersion *v4;
  BOOL v5;

  v4 = (CPLRecordComputeStateVersion *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_majorVersion == v4->_majorVersion && self->_stage == v4->_stage;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_majorVersion;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  unint64_t majorVersion;
  unint64_t v6;
  int64_t v7;
  unint64_t stage;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;

  v4 = a3;
  majorVersion = self->_majorVersion;
  v6 = v4[1];
  if (majorVersion <= v6)
  {
    if (majorVersion == v6)
    {
      stage = self->_stage;
      v9 = v4[2];
      v10 = stage > v9;
      if (stage == v9)
        v11 = 0;
      else
        v11 = -1;
      if (v10)
        v7 = 1;
      else
        v7 = v11;
    }
    else
    {
      v7 = -1;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)asString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_majorVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_stage);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@.%@"), v4, v5);

  return v6;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)stage
{
  return self->_stage;
}

@end
