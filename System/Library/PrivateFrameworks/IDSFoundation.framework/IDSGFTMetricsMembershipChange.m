@implementation IDSGFTMetricsMembershipChange

- (IDSGFTMetricsMembershipChange)initWithFromType:(id)a3 fromUniqueID:(id)a4 anonymizer:(id)a5 templateDictionary:(id)a6
{
  IDSGFTMetricsMembershipChange *v6;
  double v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IDSGFTMetricsMembershipChange;
  v6 = -[IDSGFTMetricsReferencePoint initWithFromType:fromUniqueID:anonymizer:templateDictionary:](&v10, sel_initWithFromType_fromUniqueID_anonymizer_templateDictionary_, a3, a4, a5, a6);
  if (v6)
  {
    v7 = ids_monotonic_time();
    v6->_referenceTime = v7;
    objc_msgSend_event_uniqueID_time_(v6, v8, (uint64_t)CFSTR("mc"), v7, CFSTR("IDSGFTMetricsWildcard"));
  }
  return v6;
}

- (double)referenceTime
{
  return self->_referenceTime;
}

- (void)receivedKMOverQRFromToken:(id)a3
{
  ((void (*)(IDSGFTMetricsMembershipChange *, char *, const __CFString *))MEMORY[0x1E0DE7D20])(self, sel_event_uniqueID_, CFSTR("km-qr"));
}

- (void)receivedKMOverPushFromToken:(id)a3
{
  ((void (*)(IDSGFTMetricsMembershipChange *, char *, const __CFString *))MEMORY[0x1E0DE7D20])(self, sel_event_uniqueID_, CFSTR("km-push"));
}

- (void)receivedKMOverPushViaCacheForToken:(id)a3
{
  ((void (*)(IDSGFTMetricsMembershipChange *, char *, const __CFString *))MEMORY[0x1E0DE7D20])(self, sel_event_uniqueID_, CFSTR("km-push-cache"));
}

- (void)receivedKMOverPushViaCacheForToken:(id)a3 atTime:(double)a4
{
  objc_msgSend_event_uniqueID_time_(self, a2, (uint64_t)CFSTR("km-push-cache"), a4, a3);
}

- (void)receivedKMOverQUICFromToken:(id)a3
{
  ((void (*)(IDSGFTMetricsMembershipChange *, char *, const __CFString *))MEMORY[0x1E0DE7D20])(self, sel_event_uniqueID_, CFSTR("km-quic"));
}

- (void)receivedUnverifiedKMOverQUICFromToken:(id)a3
{
  ((void (*)(IDSGFTMetricsMembershipChange *, char *, const __CFString *))MEMORY[0x1E0DE7D20])(self, sel_event_uniqueID_, CFSTR("km-quic-uv"));
}

- (void)sendRatchetedKMtoAVCForToken:(id)a3
{
  ((void (*)(IDSGFTMetricsMembershipChange *, char *, const __CFString *))MEMORY[0x1E0DE7D20])(self, sel_event_uniqueID_, CFSTR("km-ratchet"));
}

@end
