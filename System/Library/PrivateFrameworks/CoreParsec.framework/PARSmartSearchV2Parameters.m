@implementation PARSmartSearchV2Parameters

- (PARSmartSearchV2Parameters)init
{
  PARSmartSearchV2Parameters *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PARSmartSearchV2Parameters;
  result = -[PARSmartSearchV2Parameters init](&v8, sel_init);
  if (result)
  {
    *(_WORD *)&result->_enabled = 0;
    __asm { FMOV            V1.2D, #1.0 }
    *(_OWORD *)&result->_paramA = xmmword_19A8CF890;
    *(_OWORD *)&result->_paramC = _Q1;
    *(_OWORD *)&result->_paramM = xmmword_19A8CF8A0;
    *(_OWORD *)&result->_paramV = xmmword_19A8CF8B0;
    result->_minCount = 0;
    result->_zkwMinCount = 0;
  }
  return result;
}

- (id)initFromBag:(id)a3
{
  id v4;
  PARSmartSearchV2Parameters *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  v5 = -[PARSmartSearchV2Parameters init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "smartSearchV2Parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("smart_history_score_v2_enabled"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("smart_history_score_v2_enable_count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pqc_score_a"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pqc_score_b"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pqc_score_c"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pqc_score_k"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pqc_score_m"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pqc_score_q"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pqc_score_v"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pqc_window_bucket"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pqc_score_min_count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pqc_zkw_min_count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        && objc_msgSend(v8, "BOOLValue")
        && v28
        && v27
        && v26
        && v25
        && v24
        && v9
        && v10
        && v11
        && v12
        && v13)
      {
        v5->_enabled = objc_msgSend(v8, "BOOLValue");
        v5->_enableCount = objc_msgSend(v28, "BOOLValue");
        objc_msgSend(v27, "doubleValue");
        v5->_paramA = v15;
        objc_msgSend(v26, "doubleValue");
        v5->_paramB = v16;
        objc_msgSend(v25, "doubleValue");
        v5->_paramC = v17;
        objc_msgSend(v24, "doubleValue");
        v5->_paramK = v18;
        objc_msgSend(v9, "doubleValue");
        v5->_paramM = v19;
        objc_msgSend(v10, "doubleValue");
        v5->_paramQ = v20;
        objc_msgSend(v11, "doubleValue");
        v5->_paramV = v21;
        objc_msgSend(v12, "doubleValue");
        v5->_windowBucket = v22;
        v5->_minCount = objc_msgSend(v13, "integerValue");
        v5->_zkwMinCount = objc_msgSend(v14, "integerValue");
      }

    }
  }

  return v5;
}

- (PARSmartSearchV2Parameters)initWithCoder:(id)a3
{
  id v4;
  PARSmartSearchV2Parameters *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = -[PARSmartSearchV2Parameters init](self, "init");
  if (v5)
  {
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_enabled"));
    v5->_enableCount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_enableCount"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_paramA"));
    v5->_paramA = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_paramB"));
    v5->_paramB = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_paramC"));
    v5->_paramC = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_paramK"));
    v5->_paramK = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_paramM"));
    v5->_paramM = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_paramQ"));
    v5->_paramQ = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_paramV"));
    v5->_paramV = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_windowBucket"));
    v5->_windowBucket = v13;
    v5->_minCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_minCount"));
    v5->_zkwMinCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_zkwMinCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 enabled;
  id v5;

  enabled = self->_enabled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", enabled, CFSTR("_enabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableCount, CFSTR("_enableCount"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_paramA"), self->_paramA);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_paramB"), self->_paramB);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_paramC"), self->_paramC);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_paramK"), self->_paramK);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_paramM"), self->_paramM);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_paramQ"), self->_paramQ);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_paramV"), self->_paramV);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_windowBucket"), self->_windowBucket);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_minCount, CFSTR("_minCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_zkwMinCount, CFSTR("_zkwMinCount"));

}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)enableCount
{
  return self->_enableCount;
}

- (double)paramA
{
  return self->_paramA;
}

- (double)paramB
{
  return self->_paramB;
}

- (double)paramC
{
  return self->_paramC;
}

- (double)paramK
{
  return self->_paramK;
}

- (double)paramM
{
  return self->_paramM;
}

- (double)paramQ
{
  return self->_paramQ;
}

- (double)paramV
{
  return self->_paramV;
}

- (double)windowBucket
{
  return self->_windowBucket;
}

- (int64_t)minCount
{
  return self->_minCount;
}

- (int64_t)zkwMinCount
{
  return self->_zkwMinCount;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initFromEnabled:(BOOL)a3 enableCount:(BOOL)a4 minCount:(int64_t)a5
{
  id result;

  result = -[PARSmartSearchV2Parameters init](self, "init");
  if (result)
  {
    *((_BYTE *)result + 8) = a3;
    *((_BYTE *)result + 9) = a4;
    *((_QWORD *)result + 10) = a5;
  }
  return result;
}

- (id)initFromEnabled:(BOOL)a3 enableCount:(BOOL)a4 minCount:(int64_t)a5 zkwMinCount:(int64_t)a6
{
  id result;

  result = -[PARSmartSearchV2Parameters init](self, "init");
  if (result)
  {
    *((_BYTE *)result + 8) = a3;
    *((_BYTE *)result + 9) = a4;
    *((_QWORD *)result + 10) = a5;
    *((_QWORD *)result + 11) = a6;
  }
  return result;
}

@end
