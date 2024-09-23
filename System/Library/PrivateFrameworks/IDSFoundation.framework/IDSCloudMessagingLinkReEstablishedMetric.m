@implementation IDSCloudMessagingLinkReEstablishedMetric

- (IDSCloudMessagingLinkReEstablishedMetric)initWithInactiveTime:(double)a3 linkType:(unint64_t)a4 priorLinkType:(unint64_t)a5
{
  IDSCloudMessagingLinkReEstablishedMetric *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IDSCloudMessagingLinkReEstablishedMetric;
  result = -[IDSCloudMessagingLinkReEstablishedMetric init](&v9, sel_init);
  if (result)
  {
    result->_inactiveTime = a3;
    result->_linkType = a4;
    result->_priorLinkType = a5;
  }
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("CloudMessagingLinkReEstablished");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
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

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_inactiveTime(self, v5, v6, v7);
  objc_msgSend_numberWithDouble_(v4, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("inactiveTime"), v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_linkType(self, v13, v14, v15);
  objc_msgSend_numberWithUnsignedLongLong_(v12, v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("linkType"), v19);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  v24 = objc_msgSend_priorLinkType(self, v21, v22, v23);
  objc_msgSend_numberWithUnsignedLongLong_(v20, v25, v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    CFDictionarySetValue(v3, CFSTR("priorLinkType"), v27);

  return (NSDictionary *)v3;
}

- (unsigned)awdIdentifier
{
  return 2588690;
}

- (NSCopying)awdRepresentation
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  const char *v19;
  double v20;

  v3 = objc_alloc_init((Class)CUTWeakLinkClass());
  objc_msgSend_inactiveTime(self, v4, v5, v6);
  objc_msgSend_setLinkTimeDelta_(v3, v8, (unint64_t)v7, v7);
  v12 = objc_msgSend_linkType(self, v9, v10, v11);
  objc_msgSend_setLinkType_(v3, v13, v12, v14);
  v18 = objc_msgSend_priorLinkType(self, v15, v16, v17);
  objc_msgSend_setPriorLinkType_(v3, v19, v18, v20);
  return (NSCopying *)v3;
}

- (double)inactiveTime
{
  return self->_inactiveTime;
}

- (unint64_t)linkType
{
  return self->_linkType;
}

- (unint64_t)priorLinkType
{
  return self->_priorLinkType;
}

@end
