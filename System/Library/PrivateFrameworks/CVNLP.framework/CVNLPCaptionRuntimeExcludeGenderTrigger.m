@implementation CVNLPCaptionRuntimeExcludeGenderTrigger

- (CVNLPCaptionRuntimeExcludeGenderTrigger)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CVNLPCaptionRuntimeExcludeGenderTrigger *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *triggerTokens;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CVNLPCaptionRuntimeExcludeGenderTrigger;
  v7 = -[CVNLPCaptionRuntimeExcludeGenderTrigger init](&v14, sel_init);
  if (v7)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("triggerTokens"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v4, v9, (uint64_t)CFSTR("triggerTokens"), v10);
      v11 = objc_claimAutoreleasedReturnValue();
      triggerTokens = v7->_triggerTokens;
      v7->_triggerTokens = (NSArray *)v11;
    }
    else
    {
      triggerTokens = v7->_triggerTokens;
      v7->_triggerTokens = 0;
    }

  }
  return v7;
}

- (NSArray)triggerTokens
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerTokens, 0);
}

@end
