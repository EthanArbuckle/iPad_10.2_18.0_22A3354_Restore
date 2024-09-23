@implementation IDSDeliveryControllerTimeMetric

- (IDSDeliveryControllerTimeMetric)initWithStartDate:(id)a3 endDate:(id)a4 endpointCount:(int64_t)a5 usedPipeline:(BOOL)a6 usedMMCS:(BOOL)a7 responseCode:(int64_t)a8
{
  id v14;
  id v15;
  const char *v16;
  IDSDeliveryControllerTimeMetric *v17;
  double v18;
  double v19;
  objc_super v21;

  v14 = a3;
  v15 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IDSDeliveryControllerTimeMetric;
  v17 = -[IDSDeliveryControllerTimeMetric init](&v21, sel_init);
  if (v17)
  {
    objc_msgSend_timeIntervalSinceDate_(v15, v16, (uint64_t)v14, v18);
    v17->_timeToSend = v19;
    v17->_endpointCount = a5;
    v17->_usedPipeline = a6;
    v17->_usedMMCS = a7;
    v17->_responseCode = a8;
  }

  return v17;
}

- (NSString)name
{
  return (NSString *)CFSTR("DeliveryControllerTime");
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
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  const char *v33;
  double v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  const char *v41;
  double v42;
  void *v43;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_timeToSend(self, v5, v6, v7);
  objc_msgSend_numberWithDouble_(v4, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("TimeToSend"), v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_endpointCount(self, v13, v14, v15);
  objc_msgSend_numberWithInteger_(v12, v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("EndpointCount"), v19);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  v24 = objc_msgSend_usedPipeline(self, v21, v22, v23);
  objc_msgSend_numberWithBool_(v20, v25, v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    CFDictionarySetValue(v3, CFSTR("UsedPipeline"), v27);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  v32 = objc_msgSend_usedMMCS(self, v29, v30, v31);
  objc_msgSend_numberWithBool_(v28, v33, v32, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
    CFDictionarySetValue(v3, CFSTR("UsedMMCS"), v35);

  v36 = (void *)MEMORY[0x1E0CB37E8];
  v40 = objc_msgSend_responseCode(self, v37, v38, v39);
  objc_msgSend_numberWithInteger_(v36, v41, v40, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    CFDictionarySetValue(v3, CFSTR("ResponseCode"), v43);

  CFDictionarySetValue(v3, CFSTR("Version"), &unk_1E3C86B80);
  return (NSDictionary *)v3;
}

- (unsigned)rtcType
{
  return CUTReportingTypeDeliveryControllerTime;
}

- (double)timeToSend
{
  return self->_timeToSend;
}

- (int64_t)endpointCount
{
  return self->_endpointCount;
}

- (BOOL)usedPipeline
{
  return self->_usedPipeline;
}

- (BOOL)usedMMCS
{
  return self->_usedMMCS;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

@end
