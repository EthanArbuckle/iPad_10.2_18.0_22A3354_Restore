@implementation IDSGFTMetricsJoinCycle

- (IDSGFTMetricsJoinCycle)initWithFromType:(id)a3 fromUniqueID:(id)a4 anonymizer:(id)a5 templateDictionary:(id)a6
{
  IDSGFTMetricsJoinCycle *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IDSGFTMetricsJoinCycle;
  result = -[IDSGFTMetricsReferencePoint initWithFromType:fromUniqueID:anonymizer:templateDictionary:](&v7, sel_initWithFromType_fromUniqueID_anonymizer_templateDictionary_, a3, a4, a5, a6);
  if (result)
    result->_remoteActiveTime = -1.0;
  return result;
}

- (void)receivedAllocateResponseAtTime:(double)a3
{
  MEMORY[0x1E0DE7D20](self, sel_event_time_, CFSTR("alloc"), a3);
}

- (void)localDidJoin
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("lj"), v2);
}

- (void)localDidJoinAtTime:(double)a3
{
  MEMORY[0x1E0DE7D20](self, sel_event_time_, CFSTR("lj"), a3);
}

- (void)remoteDidJoin
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("rj"), v2);
}

- (void)remoteDidBecomeActive
{
  double v3;
  const char *v4;

  if (self->_remoteActiveTime < 0.0)
  {
    v3 = ids_monotonic_time();
    self->_remoteActiveTime = v3;
    objc_msgSend_event_(self, v4, (uint64_t)CFSTR("ra"), v3);
  }
}

- (void)receivedKMOverQR
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("km-qr"), v2);
}

- (void)receivedKMOverPush
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("km-push"), v2);
}

- (void)receivedKMOverPushViaCache
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("km-push-cache"), v2);
}

- (void)receivedKMOverPushViaCacheAtTime:(double)a3
{
  MEMORY[0x1E0DE7D20](self, sel_event_time_, CFSTR("km-push-cache"), a3);
}

- (void)receivedKMOverQUIC
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("km-quic"), v2);
}

- (void)receivedUnverifiedKMOverQUIC
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("km-quic-uv"), v2);
}

- (void)requestedKM
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("req-km"), v2);
}

- (void)receivedPreKeyOverPush
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("pk-push"), v2);
}

- (void)receivedPreKeyOverQUIC
{
  double v2;

  objc_msgSend_event_(self, a2, (uint64_t)CFSTR("pk-quic"), v2);
}

- (void)decryptedBlobOverQUIC:(id)a3
{
  double v3;
  const char *v5;
  double v6;
  id v7;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@-quic"), v3, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_event_(self, v5, (uint64_t)v7, v6);

}

@end
