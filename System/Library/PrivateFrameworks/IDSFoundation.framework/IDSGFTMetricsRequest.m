@implementation IDSGFTMetricsRequest

- (IDSGFTMetricsRequest)initWithFromType:(id)a3 fromUniqueID:(id)a4 anonymizer:(id)a5 templateDictionary:(id)a6
{
  IDSGFTMetricsRequest *v6;
  double v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IDSGFTMetricsRequest;
  v6 = -[IDSGFTMetricsReferencePoint initWithFromType:fromUniqueID:anonymizer:templateDictionary:](&v10, sel_initWithFromType_fromUniqueID_anonymizer_templateDictionary_, a3, a4, a5, a6);
  if (v6)
  {
    v7 = ids_monotonic_time();
    objc_msgSend_event_uniqueID_time_(v6, v8, (uint64_t)CFSTR("req"), v7, &unk_1E3C86BC8);
  }
  return v6;
}

- (void)receivedResponse:(unsigned int)a3
{
  double v3;
  const char *v5;
  double v6;
  id v7;

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], a2, *(uint64_t *)&a3, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_uniqueID_reason_(self, v5, (uint64_t)CFSTR("rsp"), v6, &unk_1E3C86BC8, v7);

}

@end
