@implementation AXMVisionFeatureColorInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionFeatureColorInfo)initWithCoder:(id)a3
{
  id v4;
  AXMVisionFeatureColorInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXMVisionFeatureColorInfo;
  v5 = -[AXMVisionFeatureColorInfo init](&v11, sel_init);
  if (v5)
  {
    AXMSecureCodingClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("mainColors"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    AXMSecureCodingClasses();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("mainColorWeights"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXMVisionFeatureColorInfo setMainColors:weights:](v5, "setMainColors:weights:", v7, v9);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AXMVisionFeatureColorInfo mainColors](self, "mainColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("mainColors"));

  -[AXMVisionFeatureColorInfo mainColorWeights](self, "mainColorWeights");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("mainColorWeights"));

}

- (void)setMainColors:(id)a3 weights:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 != objc_msgSend(v7, "count"))
  {
    AXMediaLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[AXMVisionFeatureColorInfo setMainColors:weights:].cold.1(v9);

  }
  v10 = objc_msgSend(v6, "count");
  if (v10 == objc_msgSend(v7, "count"))
  {
    -[AXMVisionFeatureColorInfo setMainColors:](self, "setMainColors:", v6);
    -[AXMVisionFeatureColorInfo setMainColorWeights:](self, "setMainColorWeights:", v7);
  }

}

- (void)enumerateMainColors:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  void (**v12)(id, _QWORD, void *, double);

  v12 = (void (**)(id, _QWORD, void *, double))a3;
  -[AXMVisionFeatureColorInfo mainColors](self, "mainColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      -[AXMVisionFeatureColorInfo mainColors](self, "mainColors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXMVisionFeatureColorInfo mainColorWeights](self, "mainColorWeights");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v12[2](v12, i, v8, v11);

    }
  }

}

- (double)remainingColorWeight
{
  return self->_remainingColorWeight;
}

- (void)setRemainingColorWeight:(double)a3
{
  self->_remainingColorWeight = a3;
}

- (NSArray)mainColors
{
  return self->_mainColors;
}

- (void)setMainColors:(id)a3
{
  objc_storeStrong((id *)&self->_mainColors, a3);
}

- (NSArray)mainColorWeights
{
  return self->_mainColorWeights;
}

- (void)setMainColorWeights:(id)a3
{
  objc_storeStrong((id *)&self->_mainColorWeights, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainColorWeights, 0);
  objc_storeStrong((id *)&self->_mainColors, 0);
}

- (void)setMainColors:(os_log_t)log weights:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_FAULT, "input arrays must be same length", v1, 2u);
}

@end
