@implementation CLGatheringBleAdvertisement

- (CLGatheringBleAdvertisement)initWithAddress:(id)a3 withAuthTag:(id)a4 withRssi:(int64_t)a5 withCount:(int64_t)a6 withTime:(double)a7
{
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CLGatheringBleAdvertisement *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  NSObject *v22;
  char *v24;
  char *v25;
  objc_super v26;
  int v27;
  int v28;
  uint8_t buf[4];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    if ((a5 & 0x80000000) == 0)
    {
      if (qword_1EE172088 != -1)
        dispatch_once(&qword_1EE172088, &unk_1E2990D10);
      v13 = qword_1EE1720A8;
      if (os_log_type_enabled((os_log_t)qword_1EE1720A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        v30 = a5;
        _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_DEBUG, "CLGatheringBleAdvertisement has RSSI %d!", buf, 8u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE172088 != -1)
          dispatch_once(&qword_1EE172088, &unk_1E2990D10);
        v27 = 67109120;
        v28 = a5;
        v25 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLGatheringBleAdvertisement initWithAddress:withAuthTag:withRssi:withCount:withTime:]", "CoreLocation: %s\n", v25);
        if (v25 != (char *)buf)
          free(v25);
      }
    }
    v26.receiver = self;
    v26.super_class = (Class)CLGatheringBleAdvertisement;
    v17 = -[CLGatheringBleAdvertisement init](&v26, sel_init);
    if (v17)
    {
      v17->_address = (NSData *)objc_msgSend_copy(a3, v14, v15, v16);
      v17->_authTag = (NSData *)objc_msgSend_copy(a4, v18, v19, v20);
      v21 = -80;
      if ((int)a5 < 0)
        v21 = a5;
      v17->_rssi = v21;
      v17->_count = a6;
      v17->_unixTime = a7;
    }
  }
  else
  {
    if (qword_1EE172088 != -1)
      dispatch_once(&qword_1EE172088, &unk_1E2990D10);
    v22 = qword_1EE1720A8;
    if (os_log_type_enabled((os_log_t)qword_1EE1720A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v22, OS_LOG_TYPE_ERROR, "CLGatheringBleAdvertisement cannot init if address is NULL!", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172088 != -1)
        dispatch_once(&qword_1EE172088, &unk_1E2990D10);
      LOWORD(v27) = 0;
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLGatheringBleAdvertisement initWithAddress:withAuthTag:withRssi:withCount:withTime:]", "CoreLocation: %s\n", v24);
      if (v24 != (char *)buf)
        free(v24);
    }
    return 0;
  }
  return v17;
}

- (CLGatheringBleAdvertisement)initWithAddress:(id)a3 contactId:(id)a4 flags:(int64_t)a5 eFlags:(int64_t)a6 authTag:(id)a7 iTag:(id)a8 rssi:(int64_t)a9 count:(int64_t)a10 unixTime:(double)a11
{
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CLGatheringBleAdvertisement *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  char *v33;
  char *v34;
  objc_super v35;
  int v36;
  int v37;
  uint8_t buf[4];
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((a9 & 0x80000000) == 0)
    {
      if (qword_1EE172088 != -1)
        dispatch_once(&qword_1EE172088, &unk_1E2990D10);
      v19 = qword_1EE1720A8;
      if (os_log_type_enabled((os_log_t)qword_1EE1720A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        v39 = a9;
        _os_log_impl(&dword_18F5B3000, v19, OS_LOG_TYPE_DEBUG, "CLGatheringBleAdvertisement has RSSI %d!", buf, 8u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE172088 != -1)
          dispatch_once(&qword_1EE172088, &unk_1E2990D10);
        v36 = 67109120;
        v37 = a9;
        v33 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLGatheringBleAdvertisement initWithAddress:contactId:flags:eFlags:authTag:iTag:rssi:count:unixTime:]", "CoreLocation: %s\n", v33);
        if (v33 != (char *)buf)
          free(v33);
      }
    }
    v35.receiver = self;
    v35.super_class = (Class)CLGatheringBleAdvertisement;
    v23 = -[CLGatheringBleAdvertisement init](&v35, sel_init);
    if (v23)
    {
      v23->_address = (NSData *)objc_msgSend_copy(a3, v20, v21, v22);
      if (a4)
        v27 = objc_msgSend_copy(a4, v24, v25, v26);
      else
        v27 = 0;
      v23->_contactId = (NSString *)v27;
      v23->_flags = a5;
      v23->_eFlags = a6;
      if (a7)
        v29 = objc_msgSend_copy(a7, v24, v25, v26);
      else
        v29 = 0;
      v23->_authTag = (NSData *)v29;
      if (a8)
        v30 = objc_msgSend_copy(a8, v24, v25, v26);
      else
        v30 = 0;
      v31 = -80;
      if ((int)a9 < 0)
        v31 = a9;
      v23->_iTag = (NSData *)v30;
      v23->_rssi = v31;
      v23->_count = a10;
      v23->_unixTime = a11;
    }
  }
  else
  {
    if (qword_1EE172088 != -1)
      dispatch_once(&qword_1EE172088, &unk_1E2990D10);
    v28 = qword_1EE1720A8;
    if (os_log_type_enabled((os_log_t)qword_1EE1720A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v28, OS_LOG_TYPE_ERROR, "CLGatheringBleAdvertisement cannot init if address is NULL!", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172088 != -1)
        dispatch_once(&qword_1EE172088, &unk_1E2990D10);
      LOWORD(v36) = 0;
      v34 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLGatheringBleAdvertisement initWithAddress:contactId:flags:eFlags:authTag:iTag:rssi:count:unixTime:]", "CoreLocation: %s\n", v34);
      if (v34 != (char *)buf)
        free(v34);
    }
    return 0;
  }
  return v23;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLGatheringBleAdvertisement;
  -[CLGatheringBleAdvertisement dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSData *address;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  address = self->_address;
  v9 = objc_msgSend_address(a3, v5, v6, v7);
  return objc_msgSend_isEqualToData_(address, v10, v9, v11);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_hash(self->_address, a2, v2, v3);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t DateString;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *contactId;
  uint64_t flags_low;
  uint64_t eFlags_low;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;

  v5 = (void *)MEMORY[0x1E0CB3940];
  DateString = objc_msgSend_getDateString_(self, a2, v2, v3, self->_unixTime);
  v9 = objc_msgSend_hexString_(self, v7, (uint64_t)self->_address, v8);
  contactId = self->_contactId;
  flags_low = LOBYTE(self->_flags);
  eFlags_low = LOBYTE(self->_eFlags);
  v15 = objc_msgSend_hexString_(self, v13, (uint64_t)self->_authTag, v14);
  v18 = objc_msgSend_hexString_(self, v16, (uint64_t)self->_iTag, v17);
  return (id)objc_msgSend_stringWithFormat_(v5, v19, (uint64_t)CFSTR("%@,%@,%@,%02x,%02x,%@,%@,%d,%d"), v20, DateString, v9, contactId, flags_low, eFlags_low, v15, v18, self->_rssi, self->_count);
}

- (id)hexString:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;

  if (!a3 || !objc_msgSend_length(a3, a2, (uint64_t)a3, v3) || !objc_msgSend_bytes(a3, v5, v6, v7))
    return &stru_1E2993188;
  v11 = 2 * objc_msgSend_length(a3, v8, v9, v10);
  v12 = (char *)malloc_type_malloc(v11 | 1, 0xD7D9A0AAuLL);
  v12[v11] = 0;
  v16 = objc_msgSend_bytes(a3, v13, v14, v15);
  if (objc_msgSend_length(a3, v17, v18, v19))
  {
    v20 = 0;
    v21 = v12;
    do
    {
      sprintf(v21, "%02X", *(unsigned __int8 *)(v16 + v20++));
      v21 += 2;
    }
    while (objc_msgSend_length(a3, v22, v23, v24) > v20);
  }
  v25 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v25, v26, (uint64_t)v12, v11, 1, 1);
}

- (id)getDateString:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  if (qword_1ECD8F868 != -1)
    dispatch_once(&qword_1ECD8F868, &unk_1E2990570);
  v6 = (void *)qword_1ECD8F860;
  v7 = objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x1E0C99D68], a2, v3, v4, a3);
  return (id)objc_msgSend_stringFromDate_(v6, v8, v7, v9);
}

- (CLGatheringBleAdvertisement)initWithData:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (objc_msgSend_length(a3, a2, (uint64_t)a3, v3) != 84)
    return 0;
  v9 = objc_msgSend_bytes(a3, v6, v7, v8);
  return (CLGatheringBleAdvertisement *)MEMORY[0x1E0DE7D20](self, sel_initWithPersistenceBytes_, v9, v10);
}

- (CLGatheringBleAdvertisement)initWithPersistenceBytes:(id *)a3
{
  char *v4;
  id v5;
  const char *v6;
  size_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int var5;
  uint64_t v14;
  __int128 v15;
  id v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  int var8;
  uint64_t var7;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CLGatheringBleAdvertisement;
  v4 = -[CLGatheringBleAdvertisement init](&v25, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99D50]);
    *((_QWORD *)v4 + 1) = objc_msgSend_initWithBytes_length_(v5, v6, (uint64_t)a3->var1, 6);
    v7 = strlen(a3->var2);
    v8 = 50;
    if (v7 < 0x32)
      v8 = v7;
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      v12 = objc_msgSend_initWithUTF8String_(v9, v10, (uint64_t)a3->var2, v11);
    }
    else
    {
      v12 = 0;
    }
    *((_QWORD *)v4 + 2) = v12;
    var5 = a3->var5;
    v14 = *(_QWORD *)&a3->var3;
    *(_QWORD *)&v15 = (int)v14;
    *((_QWORD *)&v15 + 1) = SHIDWORD(v14);
    *(_OWORD *)(v4 + 24) = v15;
    if (var5)
    {
      v16 = objc_alloc(MEMORY[0x1E0C99D50]);
      v18 = objc_msgSend_initWithBytes_length_(v16, v17, (uint64_t)&a3->var5, 3);
    }
    else
    {
      v18 = 0;
    }
    *((_QWORD *)v4 + 5) = v18;
    if (a3->var6)
    {
      v19 = objc_alloc(MEMORY[0x1E0C99D50]);
      v21 = objc_msgSend_initWithBytes_length_(v19, v20, (uint64_t)&a3->var6, 3);
    }
    else
    {
      v21 = 0;
    }
    *((_QWORD *)v4 + 6) = v21;
    var8 = a3->var8;
    if (var8 >= 0)
      var8 = -80;
    var7 = a3->var7;
    *((_QWORD *)v4 + 7) = var8;
    *((_QWORD *)v4 + 8) = var7;
    *((_QWORD *)v4 + 9) = *(_QWORD *)&a3->var0;
  }
  return (CLGatheringBleAdvertisement *)v4;
}

- (id)encodedBytes
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  _OWORD v8[4];
  __int128 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v9 = 0u;
  memset(v8, 0, sizeof(v8));
  objc_msgSend_getBytes_length_(self->_address, a2, (uint64_t)v8 + 8, 6, 0);
  objc_msgSend_getCString_maxLength_encoding_(self->_contactId, v3, (unint64_t)v8 | 0xE, 50, 4);
  *(int8x8_t *)&v9 = vand_s8((int8x8_t)vmovn_s64(*(int64x2_t *)&self->_flags), (int8x8_t)0xFF000000FFLL);
  objc_msgSend_getBytes_length_(self->_authTag, v4, (uint64_t)&v9 + 8, 3);
  objc_msgSend_getBytes_length_(self->_iTag, v5, (uint64_t)&v9 + 12, 3);
  HIWORD(v10) = SLOBYTE(self->_rssi);
  LOWORD(v10) = self->_count;
  *(double *)v8 = self->_unixTime;
  return (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)v8, 84);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_address, (uint64_t)CFSTR("Address"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_contactId, (uint64_t)CFSTR("ContactId"));
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_flags, (uint64_t)CFSTR("Flags"));
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->_eFlags, (uint64_t)CFSTR("EncryptedFlags"));
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_authTag, (uint64_t)CFSTR("AuthTag"));
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->_iTag, (uint64_t)CFSTR("IntegrityTag"));
  objc_msgSend_encodeInteger_forKey_(a3, v10, self->_rssi, (uint64_t)CFSTR("RSSI"));
  objc_msgSend_encodeInteger_forKey_(a3, v11, self->_count, (uint64_t)CFSTR("Count"));
  objc_msgSend_encodeDouble_forKey_(a3, v12, (uint64_t)CFSTR("Date"), v13, self->_unixTime);
}

- (CLGatheringBleAdvertisement)initWithCoder:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;

  v5 = objc_opt_class();
  v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("Address"));
  v8 = objc_opt_class();
  v10 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("ContactId"));
  v13 = objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("Flags"), v12);
  v16 = objc_msgSend_decodeIntegerForKey_(a3, v14, (uint64_t)CFSTR("EncryptedFlags"), v15);
  v17 = objc_opt_class();
  v19 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, (uint64_t)CFSTR("AuthTag"));
  v20 = objc_opt_class();
  v22 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v21, v20, (uint64_t)CFSTR("IntegrityTag"));
  v25 = objc_msgSend_decodeIntegerForKey_(a3, v23, (uint64_t)CFSTR("RSSI"), v24);
  v28 = objc_msgSend_decodeIntegerForKey_(a3, v26, (uint64_t)CFSTR("Count"), v27);
  objc_msgSend_decodeDoubleForKey_(a3, v29, (uint64_t)CFSTR("Date"), v30);
  return (CLGatheringBleAdvertisement *)objc_msgSend_initWithAddress_contactId_flags_eFlags_authTag_iTag_rssi_count_unixTime_(self, v31, v7, v10, v13, v16, v19, v22, v25, v28);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLGatheringBleAdvertisement *v4;
  const char *v5;

  v4 = [CLGatheringBleAdvertisement alloc];
  return (id)objc_msgSend_initWithAddress_contactId_flags_eFlags_authTag_iTag_rssi_count_unixTime_(v4, v5, (uint64_t)self->_address, (uint64_t)self->_contactId, self->_flags, self->_eFlags, self->_authTag, self->_iTag, self->_unixTime, self->_rssi, self->_count);
}

- (NSData)address
{
  return self->_address;
}

- (NSString)contactId
{
  return self->_contactId;
}

- (int64_t)flags
{
  return self->_flags;
}

- (int64_t)eFlags
{
  return self->_eFlags;
}

- (NSData)authTag
{
  return self->_authTag;
}

- (NSData)iTag
{
  return self->_iTag;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (int64_t)count
{
  return self->_count;
}

- (double)unixTime
{
  return self->_unixTime;
}

@end
