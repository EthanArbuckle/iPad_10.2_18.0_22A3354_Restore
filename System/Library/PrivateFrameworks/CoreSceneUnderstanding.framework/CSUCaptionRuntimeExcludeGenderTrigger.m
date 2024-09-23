@implementation CSUCaptionRuntimeExcludeGenderTrigger

- (CSUCaptionRuntimeExcludeGenderTrigger)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CSUCaptionRuntimeExcludeGenderTrigger *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *triggerTokens;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CSUCaptionRuntimeExcludeGenderTrigger;
  v8 = -[CSUCaptionRuntimeExcludeGenderTrigger init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("triggerTokens"), v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v4, v10, (uint64_t)CFSTR("triggerTokens"), v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      triggerTokens = v8->_triggerTokens;
      v8->_triggerTokens = (NSArray *)v13;
    }
    else
    {
      triggerTokens = v8->_triggerTokens;
      v8->_triggerTokens = 0;
    }

  }
  return v8;
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
