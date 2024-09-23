@implementation IDSMissingMessageMetric

- (IDSMissingMessageMetric)initWithReason:(int64_t)a3 guid:(id)a4 service:(id)a5 additionalInformation:(id)a6
{
  id v11;
  id v12;
  id v13;
  IDSMissingMessageMetric *v14;
  IDSMissingMessageMetric *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)IDSMissingMessageMetric;
  v14 = -[IDSMissingMessageMetric init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_reason = a3;
    objc_storeStrong((id *)&v14->_guid, a4);
    objc_storeStrong((id *)&v15->_service, a5);
    objc_storeStrong((id *)&v15->_additionalInfo, a6);
  }

  return v15;
}

- (NSDictionary)payload
{
  id v3;
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  void *v13;
  double v14;
  NSDictionary *additionalInfo;
  id v16;
  const char *v17;
  double v18;
  _QWORD v20[4];
  id v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend__shouldReportReason(self, v4, v5, v6))
  {
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v7, self->_reason, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v3, v10, (uint64_t)v9, v11, CFSTR("fR"));

  }
  IDSGetUUIDData(self->_guid);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend_setObject_forKey_(v3, v12, (uint64_t)v13, v14, CFSTR("fU"));
  additionalInfo = self->_additionalInfo;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_19BADA0C4;
  v20[3] = &unk_1E3C1F208;
  v16 = v3;
  v21 = v16;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(additionalInfo, v17, (uint64_t)v20, v18);

  return (NSDictionary *)v16;
}

- (NSNumber)command
{
  return (NSNumber *)&unk_1E3C87240;
}

- (BOOL)shouldReportMetric
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  int v12;
  const char *v13;
  uint64_t v14;
  double v15;
  BOOL v16;
  char shouldReportMetricForExternal;

  objc_msgSend_sharedInstance(IDSServerBag, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("ids-send-missing-metric-message"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v12 = objc_msgSend_BOOLValue(v8, v9, v10, v11);
  else
    v12 = 1;
  if ((objc_msgSend__isInternal(self, v9, v10, v11) & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    shouldReportMetricForExternal = objc_msgSend__shouldReportMetricForExternal(self, v13, v14, v15);
    if (v12)
      v16 = shouldReportMetricForExternal;
    else
      v16 = 0;
  }

  return v16;
}

- (BOOL)_shouldReportReason
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;

  if ((objc_msgSend__isInternal(self, a2, v2, v3) & 1) != 0)
    return 1;
  else
    return objc_msgSend__shouldReportReasonForExternal(self, v5, v6, v7);
}

- (BOOL)_shouldReportMetricForExternal
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  int v12;
  int64_t reason;
  BOOL v14;
  int v15;

  objc_msgSend_sharedInstance(IDSServerBag, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("ids-send-missing-metric-message-without-reason"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v12 = objc_msgSend_BOOLValue(v8, v9, v10, v11);
  else
    v12 = 0;
  reason = self->_reason;
  v14 = (unint64_t)(reason - 702) > 0xA || ((1 << (reason + 66)) & 0x5A7) == 0;
  if (!v14 || reason == 801)
    v15 = objc_msgSend__shouldReportReasonForExternal(self, v9, v10, v11) | v12;
  else
    LOBYTE(v15) = 0;

  return v15;
}

- (BOOL)_shouldReportReasonForExternal
{
  int64_t reason;

  reason = self->_reason;
  return reason == 710 || reason == 801 || reason == 712;
}

- (int64_t)reason
{
  return self->_reason;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSString)service
{
  return self->_service;
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
