@implementation CVNLPCaptionRuntimeReplacements

- (CVNLPCaptionRuntimeReplacements)initWithKey:(id)a3 value:(id)a4 prob:(double)a5 genderOption:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CVNLPCaptionRuntimeReplacements *v16;
  uint64_t v17;
  NSString *replacementKey;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSString *replacementValue;
  double v24;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CVNLPCaptionRuntimeReplacements;
  v16 = -[CVNLPCaptionRuntimeReplacements init](&v26, sel_init);
  if (v16)
  {
    objc_msgSend_stringWithSpaceAtEnds(v10, v13, v14, v15);
    v17 = objc_claimAutoreleasedReturnValue();
    replacementKey = v16->_replacementKey;
    v16->_replacementKey = (NSString *)v17;

    objc_msgSend_stringWithSpaceAtEnds(v11, v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    replacementValue = v16->_replacementValue;
    v16->_replacementValue = (NSString *)v22;

    v24 = 1.0;
    if (a5 != 0.0)
      v24 = a5;
    v16->_replacementProb = v24;
    objc_storeStrong((id *)&v16->_genderOption, a6);
  }

  return v16;
}

- (NSString)replacementKey
{
  return self->_replacementKey;
}

- (NSString)replacementValue
{
  return self->_replacementValue;
}

- (double)replacementProb
{
  return self->_replacementProb;
}

- (NSNumber)genderOption
{
  return self->_genderOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genderOption, 0);
  objc_storeStrong((id *)&self->_replacementValue, 0);
  objc_storeStrong((id *)&self->_replacementKey, 0);
}

@end
