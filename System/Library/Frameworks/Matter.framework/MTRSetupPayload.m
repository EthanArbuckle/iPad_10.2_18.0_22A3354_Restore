@implementation MTRSetupPayload

- (MTRSetupPayload)initWithPayload:(id)a3
{
  id v4;
  const char *v5;
  MTRSetupPayload *v6;
  MTRSetupPayload *v7;

  v4 = a3;
  if (objc_msgSend_hasPrefix_(v4, v5, (uint64_t)CFSTR("MT:")))
    v6 = (MTRSetupPayload *)sub_23404383C(self, v4);
  else
    v6 = (MTRSetupPayload *)sub_234043A74(self, v4);
  v7 = v6;

  return v7;
}

- (MTRSetupPayload)initWithSetupPasscode:(NSNumber *)setupPasscode discriminator:(NSNumber *)discriminator
{
  NSNumber *v6;
  NSNumber *v7;
  MTRSetupPayload *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  objc_super v13;

  v6 = setupPasscode;
  v7 = discriminator;
  v13.receiver = self;
  v13.super_class = (Class)MTRSetupPayload;
  v8 = -[MTRSetupPayload init](&v13, sel_init);
  objc_msgSend_setSetupPasscode_(v8, v9, (uint64_t)v6);
  objc_msgSend_setDiscriminator_(v8, v10, (uint64_t)v7);
  objc_msgSend_setDiscoveryCapabilities_(v8, v11, 7);

  return v8;
}

- (NSNumber)version
{
  return (NSNumber *)objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a2, self->_payload.version);
}

- (void)setVersion:(NSNumber *)version
{
  self->_payload.version = objc_msgSend_unsignedIntegerValue(version, a2, (uint64_t)version);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], a2, self->_payload.vendorID);
}

- (void)setVendorID:(NSNumber *)vendorID
{
  self->_payload.vendorID = objc_msgSend_unsignedIntegerValue(vendorID, a2, (uint64_t)vendorID);
}

- (NSNumber)productID
{
  return (NSNumber *)objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], a2, self->_payload.productID);
}

- (void)setProductID:(NSNumber *)productID
{
  self->_payload.productID = objc_msgSend_unsignedIntegerValue(productID, a2, (uint64_t)productID);
}

- (MTRCommissioningFlow)commissioningFlow
{
  return (unint64_t)self->_payload.commissioningFlow;
}

- (void)setCommissioningFlow:(MTRCommissioningFlow)commissioningFlow
{
  self->_payload.commissioningFlow = commissioningFlow;
}

- (MTRDiscoveryCapabilities)discoveryCapabilities
{
  Optional<chip::BitFlags<chip::RendezvousInformationFlag, unsigned char>> *p_rendezvousInformation;
  _BOOL4 mHasValue;
  _BYTE *v4;

  mHasValue = self->_payload.rendezvousInformation.mHasValue;
  p_rendezvousInformation = &self->_payload.rendezvousInformation;
  if (!mHasValue)
    return 0;
  v4 = sub_234044128(p_rendezvousInformation);
  if (*v4)
    return *v4;
  else
    return 4;
}

- (void)setDiscoveryCapabilities:(MTRDiscoveryCapabilities)discoveryCapabilities
{
  BOOL v3;

  if (discoveryCapabilities)
  {
    self->_payload.rendezvousInformation.mValue.mData = discoveryCapabilities;
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  self->_payload.rendezvousInformation.mHasValue = v3;
}

- (NSNumber)discriminator
{
  NSNumber *shadowDiscriminator;
  NSNumber *v3;
  SetupDiscriminator *p_discriminator;
  void *v6;
  uint64_t v7;
  const char *v8;

  shadowDiscriminator = self->_shadowDiscriminator;
  if (shadowDiscriminator)
  {
    v3 = shadowDiscriminator;
  }
  else
  {
    p_discriminator = &self->_payload.discriminator;
    v6 = (void *)MEMORY[0x24BDD16E0];
    if (self->_payload.discriminator.mIsShortDiscriminator)
    {
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], a2, LOBYTE(p_discriminator->mDiscriminator));
    }
    else
    {
      v7 = sub_2340441C0(p_discriminator);
      objc_msgSend_numberWithInt_(v6, v8, v7);
    }
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setDiscriminator:(NSNumber *)discriminator
{
  const char *v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;
  int hasShortDiscriminator;
  NSNumber *v10;

  v10 = discriminator;
  v6 = objc_msgSend_unsignedIntegerValue(v10, v4, v5);
  hasShortDiscriminator = objc_msgSend_hasShortDiscriminator(self, v7, v8);
  sub_2340441E0((uint64_t)self, v6 & 0xFFF, hasShortDiscriminator);

}

- (BOOL)hasShortDiscriminator
{
  return self->_payload.discriminator.mIsShortDiscriminator;
}

- (void)setHasShortDiscriminator:(BOOL)hasShortDiscriminator
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = hasShortDiscriminator;
  if (objc_msgSend_hasShortDiscriminator(self, a2, hasShortDiscriminator) != hasShortDiscriminator)
  {
    objc_msgSend_discriminator(self, v5, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_unsignedShortValue(v10, v7, v8);
    sub_2340441E0((uint64_t)self, v9, v3);

  }
}

- (NSNumber)setupPasscode
{
  return (NSNumber *)objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], a2, self->_payload.setUpPINCode);
}

- (void)setSetupPasscode:(NSNumber *)setupPasscode
{
  self->_payload.setUpPINCode = objc_msgSend_unsignedIntegerValue(setupPasscode, a2, (uint64_t)setupPasscode);
}

- (NSString)serialNumber
{
  const char *v2;
  void *v3;
  _DWORD v5[6];
  void *__p[2];
  uint64_t v7;

  __p[0] = 0;
  __p[1] = 0;
  v7 = 0;
  sub_2341C8C6C((uint64_t)&self->_payload, (uint64_t)__p, (uint64_t)v5);
  if (v5[0])
  {
    v3 = 0;
  }
  else
  {
    if (v7 >= 0)
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v2, (uint64_t)__p);
    else
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v2, (uint64_t)__p[0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (SHIBYTE(v7) < 0)
    operator delete(__p[0]);
  return (NSString *)v3;
}

- (void)setSerialNumber:(NSString *)serialNumber
{
  const char *v4;
  uint64_t v5;
  NSString *v6;
  void *v7;
  const char *v8;
  void *v9;
  NSString *v10;
  const char *v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  char *v15;
  void *__p[2];
  char v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint8_t buf[4];
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = serialNumber;
  if (!v6)
  {
    sub_2341C8E14((uint64_t)&self->_payload, (uint64_t)&v20);
    goto LABEL_15;
  }
  objc_msgSend_serialNumber(self, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v7)
  {
    if ((objc_msgSend_isEqualToString_(v7, v8, (uint64_t)v6) & 1) != 0)
    {

      goto LABEL_15;
    }
    sub_2341C8E14((uint64_t)&self->_payload, (uint64_t)&v20);
  }
  v18 = 0uLL;
  v19 = 0;
  v10 = objc_retainAutorelease(v6);
  v13 = (char *)objc_msgSend_UTF8String(v10, v11, v12);
  sub_233C0F5A8(__p, v13);
  sub_2341C8B0C((std::string *)&self->_payload, (uint64_t)__p, (uint64_t)&v18);
  if (v17 < 0)
    operator delete(__p[0]);
  if ((_DWORD)v18)
  {
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v20 = v18;
      v21 = v19;
      v15 = sub_2341083CC((const char **)&v20, 1);
      *(_DWORD *)buf = 136315138;
      v23 = v15;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "Ignoring unexpected error in SetupPayload::addSerialNumber: %s", buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v20 = v18;
      v21 = v19;
      sub_2341083CC((const char **)&v20, 1);
      sub_2341147D0(0, 1);
    }
  }

LABEL_15:
}

- (NSArray)vendorElements
{
  id v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  const char *v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;
  void **v12;

  sub_2341C88DC((uint64_t)&self->_payload, &v10);
  if (v10 == v11)
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v2 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v4 = (void *)objc_msgSend_initWithCapacity_(v2, v3, 0xCCCCCCCCCCCCCCCDLL * ((v11 - v10) >> 3));
    v5 = v10;
    for (i = v11; v5 != i; v5 += 40)
    {
      v8 = sub_2340432E4([MTROptionalQRCodeInfo alloc], v5);
      if (v8)
        objc_msgSend_addObject_(v4, v7, (uint64_t)v8);

    }
  }
  v12 = (void **)&v10;
  sub_234045EC0(&v12);
  return (NSArray *)v4;
}

- (id)vendorElementWithTag:(id)a3
{
  id v4;
  unsigned int v5;
  char *v6;
  _DWORD v8[6];
  _BYTE v9[8];
  void *__p;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v4 = a3;
  __p = 0;
  v11 = 0;
  v13 = 0;
  v12 = 0;
  v5 = sub_23404319C(v4);
  sub_2341C8E90((uint64_t)&self->_payload, v5, (uint64_t)v9, (uint64_t)v8);
  if (v8[0])
    v6 = 0;
  else
    v6 = sub_2340432E4([MTROptionalQRCodeInfo alloc], (uint64_t)v9);
  if (SHIBYTE(v12) < 0)
    operator delete(__p);

  return v6;
}

- (void)removeVendorElementWithTag:(id)a3
{
  unsigned int v4;
  _BYTE v5[24];

  v4 = sub_23404319C(a3);
  sub_2341C8A70((uint64_t)&self->_payload, v4, (uint64_t)v5);
}

- (void)addOrReplaceVendorElement:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  char *v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint8_t buf[4];
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
    sub_234002A9C(CFSTR("element"));
  v8 = 0uLL;
  v9 = 0;
  sub_2340433A4((uint64_t)v4, (std::string *)&self->_payload, (uint64_t)&v8);
  if ((_DWORD)v8)
  {
    sub_234117B80(0, "NotSpecified");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = v8;
      v11 = v9;
      v7 = sub_2341083CC((const char **)&v10, 1);
      *(_DWORD *)buf = 136315138;
      v13 = v7;
      _os_log_impl(&dword_233BF3000, v6, OS_LOG_TYPE_ERROR, "Internal error: %s", buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v10 = v8;
      v11 = v9;
      sub_2341083CC((const char **)&v10, 1);
      sub_2341147D0(0, 1);
    }
    abort();
  }

}

- (NSString)manualEntryCode
{
  const char *v2;
  void *v3;
  _QWORD v5[3];
  void *__p[2];
  uint64_t v7;
  _BYTE v8[7];
  Value v10;
  uint64_t v11;
  __int16 setUpPINCode_high;
  __int16 v13;

  *(_DWORD *)v8 = *(_DWORD *)&self->_payload.version;
  *(_DWORD *)&v8[3] = *(_DWORD *)((char *)&self->_payload.vendorID + 1);
  if (self->_payload.rendezvousInformation.mHasValue)
    v10.mData = self->_payload.rendezvousInformation.mValue;
  v11 = *(_QWORD *)&self->_payload.discriminator.mDiscriminator;
  setUpPINCode_high = HIWORD(self->_payload.setUpPINCode);
  v13 = 0;
  __p[0] = 0;
  __p[1] = 0;
  v7 = 0;
  sub_2341C5B24((uint64_t)v8, (uint64_t)__p, v5);
  if (LODWORD(v5[0]))
  {
    v3 = 0;
  }
  else
  {
    if (v7 >= 0)
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v2, (uint64_t)__p);
    else
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v2, (uint64_t)__p[0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (SHIBYTE(v7) < 0)
    operator delete(__p[0]);
  return (NSString *)v3;
}

- (id)qrCodeString
{
  return sub_234044AB4((uint64_t)self, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRSetupPayload *v4;
  id *v5;
  _BYTE v7[7];
  Value v9;
  uint64_t v10;
  __int16 setUpPINCode_high;
  uint64_t v12[3];
  uint64_t v13[3];

  v4 = [MTRSetupPayload alloc];
  *(_DWORD *)v7 = *(_DWORD *)&self->_payload.version;
  *(_DWORD *)&v7[3] = *(_DWORD *)((char *)&self->_payload.vendorID + 1);
  if (self->_payload.rendezvousInformation.mHasValue)
    v9.mData = self->_payload.rendezvousInformation.mValue;
  v10 = *(_QWORD *)&self->_payload.discriminator.mDiscriminator;
  setUpPINCode_high = HIWORD(self->_payload.setUpPINCode);
  sub_233CF15A8(v12, (uint64_t)&self->_payload.optionalVendorData);
  sub_233CF1A2C(v13, (uint64_t)&self->_payload.optionalExtensionData);
  v5 = (id *)sub_234043F58(v4, v7);
  sub_233CF19DC((uint64_t)v13, (char *)v13[1]);
  sub_233CF19DC((uint64_t)v12, (char *)v12[1]);
  objc_storeStrong(v5 + 10, self->_shadowDiscriminator);
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_discriminator(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  id v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    if (sub_2341C90CC((uint64_t)&self->_payload, (unsigned __int8 *)v7 + 8))
      v6 = sub_233BF4AA0(self->_shadowDiscriminator, *((void **)v7 + 10));
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  int hasShortDiscriminator;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;

  v4 = (void *)MEMORY[0x24BDD16A8];
  hasShortDiscriminator = objc_msgSend_hasShortDiscriminator(self, a2, v2);
  objc_msgSend_discriminator(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_unsignedIntValue(v8, v9, v10);
  v13 = 3;
  if (hasShortDiscriminator)
    v13 = 1;
  objc_msgSend_stringWithFormat_(v4, v12, (uint64_t)CFSTR("<MTRSetupPayload: discriminator=0x%0*x"), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend_discoveryCapabilities(self, v15, v16);
  if (v19)
  {
    objc_msgSend_string(MEMORY[0x24BDD16A8], v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v20;
    if ((v19 & 1) != 0)
    {
      objc_msgSend_appendString_(v20, v21, (uint64_t)CFSTR("|SoftAP"));
      v19 &= ~1uLL;
    }
    if ((v19 & 2) != 0)
    {
      objc_msgSend_appendString_(v22, v21, (uint64_t)CFSTR("|BLE"));
      v19 &= ~2uLL;
    }
    if ((v19 & 4) != 0)
    {
      objc_msgSend_appendString_(v22, v21, (uint64_t)CFSTR("|OnNetwork"));
      v19 &= ~4uLL;
    }
    if (v19)
      objc_msgSend_appendFormat_(v22, v21, (uint64_t)CFSTR("|0x%llx"), v19);
    objc_msgSend_substringFromIndex_(v22, v21, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_appendFormat_(v14, v24, (uint64_t)CFSTR(" discoveryCapabilities=%@"), v23);
  }
  v25 = objc_msgSend_commissioningFlow(self, v17, v18);
  if (v25)
    objc_msgSend_appendFormat_(v14, v26, (uint64_t)CFSTR(" commissioningFlow=0x%llx"), v25);
  objc_msgSend_appendString_(v14, v26, (uint64_t)CFSTR(">"));
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  unsigned int hasShortDiscriminator;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  id v42;

  v42 = a3;
  sub_234044AB4((uint64_t)self, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v42, v5, (uint64_t)v4, CFSTR("qr"));

  objc_msgSend_version(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v42, v9, (uint64_t)v8, CFSTR("MTRSP.ck.version"));

  objc_msgSend_vendorID(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v42, v13, (uint64_t)v12, CFSTR("MTRSP.ck.vendorID"));

  objc_msgSend_productID(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v42, v17, (uint64_t)v16, CFSTR("MTRSP.ck.productID"));

  v20 = objc_msgSend_commissioningFlow(self, v18, v19);
  objc_msgSend_encodeInteger_forKey_(v42, v21, v20, CFSTR("MTRSP.ck.commissioningFlow"));
  objc_msgSend_rendezvousInformation(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v42, v25, (uint64_t)v24, CFSTR("MTRSP.ck.rendezvousFlags"));

  hasShortDiscriminator = objc_msgSend_hasShortDiscriminator(self, v26, v27);
  objc_msgSend_encodeInteger_forKey_(v42, v29, hasShortDiscriminator, CFSTR("MTRSP.ck.hasShortDiscriminator"));
  objc_msgSend_discriminator(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v42, v33, (uint64_t)v32, CFSTR("MTRSP.ck.discriminator"));

  objc_msgSend_setupPasscode(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v42, v37, (uint64_t)v36, CFSTR("MTRSP.ck.setupPINCode"));

  objc_msgSend_serialNumber(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v42, v41, (uint64_t)v40, CFSTR("MTRSP.ck.serialNumber"));

}

- (MTRSetupPayload)initWithCoder:(id)a3
{
  id v4;
  MTRSetupPayload *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  _BOOL8 v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  _QWORD v44[3];
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MTRSetupPayload;
  v5 = -[MTRSetupPayload init](&v45, sel_init);
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("qr"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    sub_234043D84((uint64_t)v5, v8, v44);
  }
  else
  {
    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("MTRSP.ck.version"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setVersion_(v5, v13, (uint64_t)v12);

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("MTRSP.ck.vendorID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setVendorID_(v5, v17, (uint64_t)v16);

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, CFSTR("MTRSP.ck.productID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProductID_(v5, v21, (uint64_t)v20);

    v23 = objc_msgSend_decodeIntegerForKey_(v4, v22, (uint64_t)CFSTR("MTRSP.ck.commissioningFlow"));
    objc_msgSend_setCommissioningFlow_(v5, v24, v23);
    v25 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, CFSTR("MTRSP.ck.setupPINCode"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSetupPasscode_(v5, v28, (uint64_t)v27);

    v29 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v29, CFSTR("MTRSP.ck.serialNumber"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSerialNumber_(v5, v32, (uint64_t)v31);

  }
  v33 = objc_msgSend_decodeIntegerForKey_(v4, v9, (uint64_t)CFSTR("MTRSP.ck.hasShortDiscriminator")) != 0;
  objc_msgSend_setHasShortDiscriminator_(v5, v34, v33);
  v35 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, CFSTR("MTRSP.ck.discriminator"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDiscriminator_(v5, v38, (uint64_t)v37);

  v39 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, CFSTR("MTRSP.ck.rendezvousFlags"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRendezvousInformation_(v5, v42, (uint64_t)v41);

  return v5;
}

+ (NSUInteger)generateRandomPIN
{
  uint32_t v2;
  NSUInteger v3;

  do
  {
    v2 = arc4random_uniform(0x5F5E0FEu);
    v3 = v2 + 1;
  }
  while (!sub_2341C8690(v2 + 1));
  return v3;
}

+ (NSNumber)generateRandomSetupPasscode
{
  uint64_t v2;
  void *v3;
  uint64_t RandomPIN;
  const char *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  RandomPIN = objc_msgSend_generateRandomPIN(a1, a2, v2);
  return (NSNumber *)objc_msgSend_numberWithUnsignedInteger_(v3, v5, RandomPIN);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowDiscriminator, 0);
  sub_233CF19DC((uint64_t)&self->_payload.optionalExtensionData, (char *)self->_payload.optionalExtensionData.__tree_.__pair1_.__value_.__left_);
  sub_233CF19DC((uint64_t)&self->_payload.optionalVendorData, (char *)self->_payload.optionalVendorData.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_WORD *)self + 9) = 0;
  *((_BYTE *)self + 20) = 0;
  *((_DWORD *)self + 6) = 0;
  *(_DWORD *)((char *)self + 10) = 0;
  *((_WORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 4) = (char *)self + 40;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = (char *)self + 64;
  return self;
}

- (MTRSetupPayload)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTRSetupPayload;
  return -[MTRSetupPayload init](&v3, sel_init);
}

+ (MTRSetupPayload)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MTRSetupPayload;
  return (MTRSetupPayload *)objc_msgSendSuper2(&v3, "new");
}

+ (MTRSetupPayload)setupPayloadWithOnboardingPayload:(NSString *)onboardingPayload error:(NSError *)error
{
  NSString *v5;
  MTRSetupPayload *v6;
  const char *v7;
  uint64_t v8;
  void *v9;

  v5 = onboardingPayload;
  v6 = [MTRSetupPayload alloc];
  v8 = objc_msgSend_initWithPayload_(v6, v7, (uint64_t)v5);
  v9 = (void *)v8;
  if (error && !v8)
  {
    sub_2340017B8((uint64_t)MTRError, 4);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }

  return (MTRSetupPayload *)v9;
}

- (NSNumber)rendezvousInformation
{
  uint64_t v2;
  void *v3;
  const char *v4;

  v3 = (void *)objc_msgSend_discoveryCapabilities(self, a2, v2);
  if (v3)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v4, (uint64_t)v3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSNumber *)v3;
}

- (void)setRendezvousInformation:(NSNumber *)rendezvousInformation
{
  NSNumber *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSNumber *v9;

  v4 = rendezvousInformation;
  v9 = v4;
  if (v4)
  {
    v7 = objc_msgSend_unsignedIntegerValue(v4, v5, v6);
    if (v7)
      objc_msgSend_setDiscoveryCapabilities_(self, v8, v7);
    else
      objc_msgSend_setDiscoveryCapabilities_(self, v8, 4);
  }
  else
  {
    objc_msgSend_setDiscoveryCapabilities_(self, v5, 0);
  }

}

- (NSString)qrCodeString:(NSError *)error
{
  uint64_t v4;
  void *v5;
  __int128 v7;
  int v8;

  objc_msgSend_qrCodeString(self, a2, (uint64_t)error);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (error && !v4)
  {
    LODWORD(v7) = 3;
    *((_QWORD *)&v7 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP"
                           "/MTRSetupPayload.mm";
    v8 = 716;
    sub_2340017F0((uint64_t)MTRError, &v7);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSArray)getAllOptionalVendorData:(NSError *)error
{
  return (NSArray *)MEMORY[0x24BEDD108](self, sel_vendorElements, error);
}

@end
