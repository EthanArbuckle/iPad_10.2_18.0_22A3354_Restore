@implementation _CLRangingPeerDistance

- (_CLRangingPeerDistance)init
{

  return 0;
}

- (_CLRangingPeerDistance)initWithPeer:(id)a3 timestamp:(id)a4 distanceMeters:(id)a5 accuracyMeters:(id)a6 initiator:(BOOL)a7
{
  return (_CLRangingPeerDistance *)MEMORY[0x1E0DE7D20](self, sel_initWithPeer_date_distanceMeters_accuracyMeters_initiator_, a3, a4);
}

- (_CLRangingPeerDistance)initWithPeer:(id)a3 date:(id)a4 distanceMeters:(id)a5 accuracyMeters:(id)a6 initiator:(BOOL)a7
{
  return (_CLRangingPeerDistance *)objc_msgSend_initWithPeer_date_distanceMeters_accuracyMeters_initiator_shouldUnlock_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, 0);
}

- (_CLRangingPeerDistance)initWithPeer:(id)a3 date:(id)a4 distanceMeters:(id)a5 accuracyMeters:(id)a6 initiator:(BOOL)a7 shouldUnlock:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _CLRangingPeerDistance *v16;
  _CLRangingPeerDistanceInternal *v17;
  const char *v18;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  objc_super v28;

  v8 = a8;
  v9 = a7;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v20 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, (uint64_t)self, CFSTR("CLRangingPeer.m"), 377, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("peer"));
    if (a4)
    {
LABEL_3:
      if (a5)
        goto LABEL_4;
LABEL_10:
      v24 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, (uint64_t)self, CFSTR("CLRangingPeer.m"), 379, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("distance"));
      if (a6)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  v22 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, CFSTR("CLRangingPeer.m"), 378, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));
  if (!a5)
    goto LABEL_10;
LABEL_4:
  if (a6)
    goto LABEL_5;
LABEL_11:
  v26 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, (uint64_t)self, CFSTR("CLRangingPeer.m"), 380, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accuracy"));
LABEL_5:
  v28.receiver = self;
  v28.super_class = (Class)_CLRangingPeerDistance;
  v16 = -[_CLRangingPeerDistance init](&v28, sel_init);
  if (v16)
  {
    v17 = [_CLRangingPeerDistanceInternal alloc];
    v16->_internal = (id)objc_msgSend_initWithPeer_date_distanceMeters_accuracyMeters_initiator_shouldUnlock_(v17, v18, (uint64_t)a3, (uint64_t)a4, a5, a6, v9, v8);
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLRangingPeerDistance;
  -[_CLRangingPeerDistance dealloc](&v3, sel_dealloc);
}

- (_CLRangingPeer)peer
{
  return (_CLRangingPeer *)*((_QWORD *)self->_internal + 1);
}

- (NSDate)date
{
  return (NSDate *)*((_QWORD *)self->_internal + 2);
}

- (NSNumber)distanceMeters
{
  return (NSNumber *)*((_QWORD *)self->_internal + 3);
}

- (NSNumber)accuracyMeters
{
  return (NSNumber *)*((_QWORD *)self->_internal + 4);
}

- (BOOL)shouldUnlock
{
  return *((_BYTE *)self->_internal + 41);
}

- (BOOL)initiator
{
  return *((_BYTE *)self->_internal + 40);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  _QWORD *internal;
  const char *v10;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  internal = self->_internal;
  return (id)objc_msgSend_initWithPeer_date_distanceMeters_accuracyMeters_initiator_shouldUnlock_(v8, v10, internal[1], internal[2], internal[3], internal[4], *((unsigned __int8 *)internal + 40), *((unsigned __int8 *)internal + 41));
}

- (_CLRangingPeerDistance)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v30;
  const char *v31;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v30 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, CFSTR("CLRangingPeer.m"), 455, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[aDecoder allowsKeyedCoding]"));
  }
  v10 = objc_opt_class();
  v12 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, (uint64_t)CFSTR("kCLCodingKeyRangingPeerDistancePeer"));
  v13 = objc_opt_class();
  v15 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("kCLCodingKeyRangingPeerDistanceTimestamp"));
  v16 = objc_opt_class();
  v18 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v17, v16, (uint64_t)CFSTR("kCLCodingKeyRangingPeerDistanceDistance"));
  v19 = objc_opt_class();
  v21 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, (uint64_t)CFSTR("kCLCodingKeyRangingPeerDistanceAccuracy"));
  v24 = objc_msgSend_decodeBoolForKey_(a3, v22, (uint64_t)CFSTR("kCLCodingKeyRangingPeerDistanceInitiator"), v23);
  v27 = objc_msgSend_decodeBoolForKey_(a3, v25, (uint64_t)CFSTR("kCLCodingKeyRangingPeerDistanceUnlock"), v26);
  return (_CLRangingPeerDistance *)objc_msgSend_initWithPeer_date_distanceMeters_accuracyMeters_initiator_shouldUnlock_(self, v28, v12, v15, v18, v21, v24, v27);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *internal;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CLRangingPeer.m"), 469, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[aCoder allowsKeyedCoding]"));
  }
  internal = self->_internal;
  objc_msgSend_encodeObject_forKey_(a3, v7, internal[1], (uint64_t)CFSTR("kCLCodingKeyRangingPeerDistancePeer"));
  objc_msgSend_encodeObject_forKey_(a3, v11, internal[2], (uint64_t)CFSTR("kCLCodingKeyRangingPeerDistanceTimestamp"));
  objc_msgSend_encodeObject_forKey_(a3, v12, internal[3], (uint64_t)CFSTR("kCLCodingKeyRangingPeerDistanceDistance"));
  objc_msgSend_encodeObject_forKey_(a3, v13, internal[4], (uint64_t)CFSTR("kCLCodingKeyRangingPeerDistanceAccuracy"));
  objc_msgSend_encodeBool_forKey_(a3, v14, *((unsigned __int8 *)internal + 40), (uint64_t)CFSTR("kCLCodingKeyRangingPeerDistanceInitiator"));
  objc_msgSend_encodeBool_forKey_(a3, v15, *((unsigned __int8 *)internal + 41), (uint64_t)CFSTR("kCLCodingKeyRangingPeerDistanceUnlock"));
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void **internal;
  void *v5;
  uint64_t MacAddressAsString;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  double v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;

  internal = (void **)self->_internal;
  v5 = (void *)MEMORY[0x1E0CB3940];
  MacAddressAsString = objc_msgSend_getMacAddressAsString(internal[1], a2, v2, v3);
  v7 = internal[2];
  objc_msgSend_floatValue(internal[3], v8, v9, v10);
  v12 = v11;
  objc_msgSend_floatValue(internal[4], v13, v14, v15);
  v20 = v19;
  if (*((_BYTE *)internal + 41))
    v21 = "Yes";
  else
    v21 = "No";
  if (objc_msgSend_secureRangingKeyID(internal[1], v16, v17, v18))
    v24 = "Yes";
  else
    v24 = "No";
  if (*((_BYTE *)internal + 40))
    return (id)objc_msgSend_stringWithFormat_(v5, v22, (uint64_t)CFSTR("Peer: %@ time:%@ distance[m]:%.02f accuracy[m]:%.02f unlock:%s secure:%s initiator:%s"), v23, MacAddressAsString, v7, *(_QWORD *)&v12, *(_QWORD *)&v20, v21, v24, "Yes");
  else
    return (id)objc_msgSend_stringWithFormat_(v5, v22, (uint64_t)CFSTR("Peer: %@ time:%@ distance[m]:%.02f accuracy[m]:%.02f unlock:%s secure:%s initiator:%s"), v23, MacAddressAsString, v7, *(_QWORD *)&v12, *(_QWORD *)&v20, v21, v24, "No");
}

- (BOOL)isInitiator
{
  return self->_initiator;
}

@end
