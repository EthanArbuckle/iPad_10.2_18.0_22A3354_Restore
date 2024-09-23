@implementation IDSLocalDeliverySocketClosedMetric

- (NSString)name
{
  return (NSString *)CFSTR("LocalDeliverySocketClosed");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  const char *v37;
  double v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  const char *v45;
  double v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  const char *v53;
  double v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  const char *v61;
  double v62;
  void *v63;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_service(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("service"), v7);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_msgSend_isToDefaultPairedDevice(self, v9, v10, v11);
  objc_msgSend_numberWithBool_(v8, v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CFDictionarySetValue(v3, CFSTR("isToDefaultPairedDevice"), v15);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  v20 = objc_msgSend_closeError(self, v17, v18, v19);
  objc_msgSend_numberWithUnsignedLongLong_(v16, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    CFDictionarySetValue(v3, CFSTR("closeError"), v23);

  v24 = (void *)MEMORY[0x1E0CB37E8];
  v28 = objc_msgSend_socketError(self, v25, v26, v27);
  objc_msgSend_numberWithUnsignedLongLong_(v24, v29, v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    CFDictionarySetValue(v3, CFSTR("socketError"), v31);

  v32 = (void *)MEMORY[0x1E0CB37E8];
  v36 = objc_msgSend_bytesSent(self, v33, v34, v35);
  objc_msgSend_numberWithUnsignedLongLong_(v32, v37, v36, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    CFDictionarySetValue(v3, CFSTR("bytesSent"), v39);

  v40 = (void *)MEMORY[0x1E0CB37E8];
  v44 = objc_msgSend_packetsSent(self, v41, v42, v43);
  objc_msgSend_numberWithUnsignedLongLong_(v40, v45, v44, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
    CFDictionarySetValue(v3, CFSTR("packetsSent"), v47);

  v48 = (void *)MEMORY[0x1E0CB37E8];
  v52 = objc_msgSend_bytesReceived(self, v49, v50, v51);
  objc_msgSend_numberWithUnsignedLongLong_(v48, v53, v52, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
    CFDictionarySetValue(v3, CFSTR("bytesReceived"), v55);

  v56 = (void *)MEMORY[0x1E0CB37E8];
  v60 = objc_msgSend_packetsReceived(self, v57, v58, v59);
  objc_msgSend_numberWithUnsignedLongLong_(v56, v61, v60, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63)
    CFDictionarySetValue(v3, CFSTR("packetsReceived"), v63);

  return (NSDictionary *)v3;
}

- (IDSLocalDeliverySocketClosedMetric)initWithService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 closeError:(unint64_t)a5 socketError:(unint64_t)a6 bytesSent:(unint64_t)a7 packetsSent:(unint64_t)a8 bytesReceived:(unint64_t)a9 packetsReceived:(unint64_t)a10
{
  id v17;
  IDSLocalDeliverySocketClosedMetric *v18;
  IDSLocalDeliverySocketClosedMetric *v19;
  objc_super v21;

  v17 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IDSLocalDeliverySocketClosedMetric;
  v18 = -[IDSLocalDeliverySocketClosedMetric init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_service, a3);
    v19->_isToDefaultPairedDevice = a4;
    v19->_closeError = a5;
    v19->_socketError = a6;
    v19->_bytesSent = a7;
    v19->_packetsSent = a8;
    v19->_bytesReceived = a9;
    v19->_packetsReceived = a10;
  }

  return v19;
}

- (NSString)service
{
  return self->_service;
}

- (BOOL)isToDefaultPairedDevice
{
  return self->_isToDefaultPairedDevice;
}

- (unint64_t)closeError
{
  return self->_closeError;
}

- (unint64_t)socketError
{
  return self->_socketError;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (unint64_t)packetsSent
{
  return self->_packetsSent;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (unint64_t)packetsReceived
{
  return self->_packetsReceived;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
