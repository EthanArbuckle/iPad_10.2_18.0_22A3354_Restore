@implementation XRSchemaPatternRestrictionElementParser

+ (id)_elementNameToClassMap
{
  if (qword_25583C6A0 != -1)
    dispatch_once(&qword_25583C6A0, &unk_24EDC2A70);
  return (id)qword_25583C698;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  const char *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  objc_msgSend_elementAttributes(v17, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("value"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_finishedParsingPatternWithParser_patternValue_(WeakRetained, v15, (uint64_t)v17, (uint64_t)v13, v16);

  }
}

- (XRSchemaRegexPatternDetectionDelegate)delegate
{
  return (XRSchemaRegexPatternDetectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
