@implementation _CLRangingPeer

- (_CLRangingPeer)init
{

  return 0;
}

- (_CLRangingPeer)initWithMacAddressAsUInt:(unint64_t)a3 secureRangingKeyID:(id)a4
{
  _CLRangingPeer *v7;
  _CLRangingPeerInternal *v8;
  const char *v9;
  void *v12;
  const char *v13;
  objc_super v14;

  if (HIWORD(a3))
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLRangingPeer.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(macAddress & 0xFFFF000000000000) == 0"));
  }
  v14.receiver = self;
  v14.super_class = (Class)_CLRangingPeer;
  v7 = -[_CLRangingPeer init](&v14, sel_init);
  if (v7)
  {
    v8 = [_CLRangingPeerInternal alloc];
    v7->_internal = (id)objc_msgSend_initWithMacAddressAsUInt_secureRangingKeyID_(v8, v9, a3, (uint64_t)a4);
  }
  return v7;
}

- (_CLRangingPeer)initWithMacAddressAsString:(id)a3 secureRangingKeyID:(id)a4
{
  uint64_t v7;
  const char *v8;
  void *v11;
  const char *v12;

  if (!a3)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLRangingPeer.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("macAddress"));
  }
  v7 = objc_msgSend_uintMacAddressFromString_(_CLRangingPeer, a2, (uint64_t)a3, (uint64_t)a4);
  if (v7 == -1)
    return 0;
  else
    return (_CLRangingPeer *)objc_msgSend_initWithMacAddressAsUInt_secureRangingKeyID_(self, v8, v7, (uint64_t)a4);
}

- (_CLRangingPeer)initWithMacAddressAsData:(id)a3 secureRangingKeyID:(id)a4
{
  char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v14;
  const char *v15;
  ether_addr v16;

  if (!a3)
  {
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, CFSTR("CLRangingPeer.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("macAddress"));
  }
  *(_WORD *)&v16.octet[4] = 0;
  *(_DWORD *)v16.octet = 0;
  objc_msgSend_getBytes_length_(a3, a2, (uint64_t)&v16, 6);
  v7 = ether_ntoa(&v16);
  v10 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v8, (uint64_t)v7, v9);
  return (_CLRangingPeer *)objc_msgSend_initWithMacAddressAsString_secureRangingKeyID_(self, v11, v10, (uint64_t)a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLRangingPeer;
  -[_CLRangingPeer dealloc](&v3, sel_dealloc);
}

- (unint64_t)macAddress
{
  return *((_QWORD *)self->_internal + 1);
}

- (NSData)secureRangingKeyID
{
  return (NSData *)*((_QWORD *)self->_internal + 2);
}

- (id)getMacAddressAsString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend_macAddress(self, a2, v2, v3);
  return (id)MEMORY[0x1E0DE7D20](_CLRangingPeer, sel_hexStringMacAddressFromUInt_, v4, v5);
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
  const char *v9;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)objc_msgSend_initWithMacAddressAsUInt_secureRangingKeyID_(v8, v9, *((_QWORD *)self->_internal + 1), *((_QWORD *)self->_internal + 2));
}

- (_CLRangingPeer)initWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v16;
  const char *v17;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CLRangingPeer.m"), 231, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[aDecoder allowsKeyedCoding]"));
  }
  v10 = objc_msgSend_decodeInt64ForKey_(a3, v7, (uint64_t)CFSTR("kCLCodingKeyRangingPeerMacAddress"), v9);
  v11 = objc_opt_class();
  v13 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("kCLCodingKeyRangingPeerSecureRangingKeyID"));
  return (_CLRangingPeer *)objc_msgSend_initWithMacAddressAsUInt_secureRangingKeyID_(self, v14, v10, v13);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *internal;
  const char *v11;
  void *v12;
  const char *v13;

  if ((objc_msgSend_allowsKeyedCoding(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLRangingPeer.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[aCoder allowsKeyedCoding]"));
  }
  internal = self->_internal;
  objc_msgSend_encodeInt64_forKey_(a3, v7, internal[1], (uint64_t)CFSTR("kCLCodingKeyRangingPeerMacAddress"));
  objc_msgSend_encodeObject_forKey_(a3, v11, internal[2], (uint64_t)CFSTR("kCLCodingKeyRangingPeerSecureRangingKeyID"));
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *internal;
  void *v5;
  uint64_t MacAddressAsString;
  const char *v7;
  uint64_t v8;

  internal = self->_internal;
  v5 = (void *)MEMORY[0x1E0CB3940];
  MacAddressAsString = objc_msgSend_getMacAddressAsString(self, a2, v2, v3);
  if (internal[2])
    return (id)objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("Peer:%@ hasKey:%s"), v8, MacAddressAsString, "Yes");
  else
    return (id)objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("Peer:%@ hasKey:%s"), v8, MacAddressAsString, "No");
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = objc_msgSend_macAddress(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_secureRangingKeyID(self, v6, v7, v8);
  return objc_msgSend_hash(v9, v10, v11, v12) ^ v5;
}

- (BOOL)isEqualToPeer:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL result;

  if (self == a3)
    return 1;
  v6 = objc_msgSend_macAddress(self, a2, (uint64_t)a3, v3);
  result = 0;
  if (v6 == objc_msgSend_macAddress(a3, v7, v8, v9))
  {
    if (objc_msgSend_secureRangingKeyID(a3, v10, v11, v12))
    {
      v16 = (void *)objc_msgSend_secureRangingKeyID(self, v13, v14, v15);
      v20 = objc_msgSend_secureRangingKeyID(a3, v17, v18, v19);
      if ((objc_msgSend_isEqualToData_(v16, v21, v20, v22) & 1) != 0)
        return 1;
    }
    if (!objc_msgSend_secureRangingKeyID(a3, v13, v14, v15) && !objc_msgSend_secureRangingKeyID(self, v23, v24, v25))
      return 1;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return MEMORY[0x1E0DE7D20](self, sel_isEqualToPeer_, a3, v5);
  }
  return 0;
}

+ (unint64_t)uintMacAddressFromString:(id)a3
{
  uint64_t v3;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  char v26;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  unsigned int v32;
  _WORD v33[18];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v28 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, (uint64_t)a1, CFSTR("CLRangingPeer.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("macAddress"));
  }
  v10 = objc_msgSend_length(a3, a2, (uint64_t)a3, v3);
  if ((unint64_t)(v10 - 18) <= 0xFFFFFFFFFFFFFFF8)
  {
    v30 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8, v9);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)a1, CFSTR("CLRangingPeer.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(len >= 11) && (len <= 17)"));
  }
  objc_msgSend_getCharacters_range_(a3, v7, (uint64_t)v33, 0, v10);
  if ((int)v10 >= 1)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = v10 - 1;
    while (1)
    {
      v18 = (unsigned __int16)v33[v17] << 24;
      if (v18 == 973078528)
      {
        ++v14;
        if (v15 == 2)
        {
          v15 = 0;
          goto LABEL_16;
        }
        if (v15 != 1)
          goto LABEL_20;
        v15 = 0;
      }
      else
      {
        v32 = 0;
        v19 = (void *)MEMORY[0x1E0CB3900];
        v20 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v11, (uint64_t)CFSTR("%c"), v12, (v18 >> 24));
        v23 = (void *)objc_msgSend_scannerWithString_(v19, v21, v20, v22);
        if (!objc_msgSend_scanHexInt_(v23, v24, (uint64_t)&v32, v25) || v32 == -1)
        {
LABEL_20:
          v26 = 0;
          goto LABEL_21;
        }
        v13 += (unint64_t)v32 << v16;
        ++v15;
      }
      v16 += 4;
LABEL_16:
      if ((unint64_t)--v17 >= 0xFFFFFFFFFFFFFFFELL)
        goto LABEL_19;
    }
  }
  v13 = 0;
  v14 = 0;
LABEL_19:
  v26 = 1;
LABEL_21:
  if ((v26 & (v14 == 5)) != 0)
    return v13;
  else
    return -1;
}

+ (id)hexStringMacAddressFromUInt:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v5;
  int64x2_t v6;
  _DWORD *v7;
  uint64x2_t v8;
  int64x2_t v9;
  void *v13;
  const char *v14;
  unsigned int v15;
  _DWORD v16[5];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (HIWORD(a3))
  {
    v13 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)a1, CFSTR("CLRangingPeer.m"), 341, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(macAddress & 0xFFFF000000000000) == 0"));
  }
  v5 = 0;
  v6 = (int64x2_t)xmmword_18F776570;
  v7 = v16;
  v8 = (uint64x2_t)vdupq_n_s64(6uLL);
  v9 = vdupq_n_s64(2uLL);
  do
  {
    if ((vmovn_s64((int64x2_t)vcgtq_u64(v8, (uint64x2_t)v6)).u8[0] & 1) != 0)
      *(v7 - 1) = (a3 >> v5);
    if ((vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(6uLL), *(uint64x2_t *)&v6)).i32[1] & 1) != 0)
      *v7 = (a3 >> (v5 + 8));
    v6 = vaddq_s64(v6, v9);
    v5 += 16;
    v7 += 2;
  }
  while (v5 != 48);
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%02X:%02X:%02X:%02X:%02X:%02X"), v3, *(double *)v6.i64, v16[4], v16[3], v16[2], v16[1], v16[0], v15);
}

@end
