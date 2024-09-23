@implementation _CLRangingPeerDistanceInternal

- (_CLRangingPeerDistanceInternal)initWithPeer:(id)a3 date:(id)a4 distanceMeters:(id)a5 accuracyMeters:(id)a6 initiator:(BOOL)a7 shouldUnlock:(BOOL)a8
{
  _CLRangingPeerDistanceInternal *v14;
  _CLRangingPeerDistanceInternal *v15;
  _CLRangingPeer *peer;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSDate *date;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSNumber *distanceMeters;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSNumber *accuracyMeters;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)_CLRangingPeerDistanceInternal;
  v14 = -[_CLRangingPeerDistanceInternal init](&v33, sel_init);
  v15 = v14;
  if (v14)
  {
    peer = v14->_peer;
    if (peer != a3)
    {

      v15->_peer = (_CLRangingPeer *)objc_msgSend_copy(a3, v17, v18, v19);
    }
    date = v15->_date;
    if (date != a4)
    {

      v15->_date = (NSDate *)objc_msgSend_copy(a4, v21, v22, v23);
    }
    distanceMeters = v15->_distanceMeters;
    if (distanceMeters != a5)
    {

      v15->_distanceMeters = (NSNumber *)objc_msgSend_copy(a5, v25, v26, v27);
    }
    accuracyMeters = v15->_accuracyMeters;
    if (accuracyMeters != a6)
    {

      v15->_accuracyMeters = (NSNumber *)objc_msgSend_copy(a6, v29, v30, v31);
    }
    v15->_initiator = a7;
    v15->_shouldUnlock = a8;
  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  self->_peer = 0;
  self->_date = 0;

  self->_distanceMeters = 0;
  self->_accuracyMeters = 0;
  v3.receiver = self;
  v3.super_class = (Class)_CLRangingPeerDistanceInternal;
  -[_CLRangingPeerDistanceInternal dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)objc_msgSend_initWithPeer_date_distanceMeters_accuracyMeters_initiator_shouldUnlock_(v8, v9, (uint64_t)self->_peer, (uint64_t)self->_date, self->_distanceMeters, self->_accuracyMeters, self->_initiator, self->_shouldUnlock);
}

@end
