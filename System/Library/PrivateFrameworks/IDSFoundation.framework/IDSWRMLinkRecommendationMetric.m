@implementation IDSWRMLinkRecommendationMetric

- (NSString)name
{
  return (NSString *)CFSTR("WRMLinkRecommendation");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  const char *v25;
  double v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  const char *v33;
  double v34;
  void *v35;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_recommendedLinkType(self, v5, v6, v7);
  objc_msgSend_numberWithUnsignedInt_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("recommendedLinkType"), v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_primaryLinkType(self, v13, v14, v15);
  objc_msgSend_numberWithUnsignedInt_(v12, v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("primaryLinkType"), v19);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  v24 = objc_msgSend_magnetState(self, v21, v22, v23);
  objc_msgSend_numberWithUnsignedInt_(v20, v25, v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    CFDictionarySetValue(v3, CFSTR("magnetState"), v27);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  v32 = objc_msgSend_infraWiFiState(self, v29, v30, v31);
  objc_msgSend_numberWithUnsignedInt_(v28, v33, v32, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    CFDictionarySetValue(v3, CFSTR("infraWiFiState"), v35);

  return (NSDictionary *)v3;
}

- (IDSWRMLinkRecommendationMetric)initWithRecommendedLinkType:(unsigned int)a3 primaryLinkType:(unsigned int)a4 magnetState:(unsigned int)a5 infraWiFiState:(unsigned int)a6
{
  IDSWRMLinkRecommendationMetric *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IDSWRMLinkRecommendationMetric;
  result = -[IDSWRMLinkRecommendationMetric init](&v11, sel_init);
  if (result)
  {
    result->_recommendedLinkType = a3;
    result->_primaryLinkType = a4;
    result->_magnetState = a5;
    result->_infraWiFiState = a6;
  }
  return result;
}

- (unsigned)recommendedLinkType
{
  return self->_recommendedLinkType;
}

- (unsigned)primaryLinkType
{
  return self->_primaryLinkType;
}

- (unsigned)magnetState
{
  return self->_magnetState;
}

- (unsigned)infraWiFiState
{
  return self->_infraWiFiState;
}

@end
