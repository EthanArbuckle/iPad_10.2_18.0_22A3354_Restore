@implementation MTROTAHeader

- (MTROTAHeader)initWithData:(NSData *)data
{
  NSData *v4;
  MTROTAHeader *v5;
  NSData *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  MTROTAHeader *v14;
  uint64_t v15;
  NSNumber *vendorID;
  const char *v17;
  uint64_t v18;
  NSNumber *productID;
  const char *v20;
  uint64_t v21;
  NSNumber *payloadSize;
  const char *v23;
  uint64_t v24;
  NSNumber *softwareVersion;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  NSString *softwareVersionString;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  NSString *releaseNotesURL;
  const char *v38;
  uint64_t v39;
  NSData *imageDigest;
  void *v41;
  _BYTE *v42;
  const char *v43;
  uint64_t v44;
  NSNumber *minApplicableVersion;
  void *v46;
  _BYTE *v47;
  const char *v48;
  uint64_t v49;
  NSNumber *maxApplicableVersion;
  _QWORD v52[3];
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[8];
  _BYTE v57[8];
  uint64_t v58;
  uint64_t v59;
  unsigned __int8 v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  _DWORD v64[4];
  void *v65;
  objc_super v66;

  v4 = data;
  v66.receiver = self;
  v66.super_class = (Class)MTROTAHeader;
  v5 = -[MTROTAHeader init](&v66, sel_init);
  if (v5)
  {
    v65 = 0;
    sub_234103890((uint64_t)v64);
    if (v64[0])
    {
      v6 = objc_retainAutorelease(v4);
      v9 = objc_msgSend_bytes(v6, v7, v8);
      v12 = objc_msgSend_length(v6, v10, v11);
      sub_233BF7114(&v53, v9, v12);

      v63 = v53;
      *((_QWORD *)&v53 + 1) = 0;
      v54 = 0;
      v56[0] = 0;
      v57[0] = 0;
      v58 = 0;
      v59 = 0;
      v61 = 0;
      v62 = 0;
      memset(v52, 0, sizeof(v52));
      sub_2341038DC((uint64_t)v64, (uint64_t)&v63, (uint64_t)&v53, (uint64_t)v52);
      if (!LODWORD(v52[0]))
      {
        objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v13, (unsigned __int16)v53);
        v15 = objc_claimAutoreleasedReturnValue();
        vendorID = v5->_vendorID;
        v5->_vendorID = (NSNumber *)v15;

        objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v17, WORD1(v53));
        v18 = objc_claimAutoreleasedReturnValue();
        productID = v5->_productID;
        v5->_productID = (NSNumber *)v18;

        objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v20, v55);
        v21 = objc_claimAutoreleasedReturnValue();
        payloadSize = v5->_payloadSize;
        v5->_payloadSize = (NSNumber *)v21;

        objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v23, DWORD1(v53));
        v24 = objc_claimAutoreleasedReturnValue();
        softwareVersion = v5->_softwareVersion;
        v5->_softwareVersion = (NSNumber *)v24;

        v26 = *((_QWORD *)&v53 + 1);
        v27 = v54;
        v28 = objc_alloc(MEMORY[0x24BDD17C8]);
        v30 = objc_msgSend_initWithBytes_length_encoding_(v28, v29, v26, v27, 4);
        softwareVersionString = v5->_softwareVersionString;
        v5->_softwareVersionString = (NSString *)v30;

        v32 = v58;
        v33 = v59;
        v34 = objc_alloc(MEMORY[0x24BDD17C8]);
        v36 = objc_msgSend_initWithBytes_length_encoding_(v34, v35, v32, v33, 4);
        releaseNotesURL = v5->_releaseNotesURL;
        v5->_releaseNotesURL = (NSString *)v36;

        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v38, v61, v62);
        v39 = objc_claimAutoreleasedReturnValue();
        imageDigest = v5->_imageDigest;
        v5->_imageDigest = (NSData *)v39;

        v5->_imageDigestType = v60;
        if (v56[0])
        {
          v41 = (void *)MEMORY[0x24BDD16E0];
          v42 = sub_233CBCB78(v56);
          objc_msgSend_numberWithUnsignedInt_(v41, v43, *(unsigned int *)v42);
          v44 = objc_claimAutoreleasedReturnValue();
          minApplicableVersion = v5->_minApplicableVersion;
          v5->_minApplicableVersion = (NSNumber *)v44;
        }
        else
        {
          minApplicableVersion = v5->_minApplicableVersion;
          v5->_minApplicableVersion = 0;
        }

        if (v57[0])
        {
          v46 = (void *)MEMORY[0x24BDD16E0];
          v47 = sub_233CBCB78(v57);
          objc_msgSend_numberWithUnsignedInt_(v46, v48, *(unsigned int *)v47);
          v49 = objc_claimAutoreleasedReturnValue();
          maxApplicableVersion = v5->_maxApplicableVersion;
          v5->_maxApplicableVersion = (NSNumber *)v49;
        }
        else
        {
          maxApplicableVersion = v5->_maxApplicableVersion;
          v5->_maxApplicableVersion = 0;
        }

        sub_2341038A8((uint64_t)v64);
        v14 = v5;
        goto LABEL_14;
      }
      sub_2341038A8((uint64_t)v64);
    }
    v14 = 0;
LABEL_14:
    sub_233C0BB74(&v65);
    goto LABEL_15;
  }
  v14 = 0;
LABEL_15:

  return v14;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(NSNumber *)vendorID
{
  objc_setProperty_nonatomic_copy(self, a2, vendorID, 8);
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(NSNumber *)productID
{
  objc_setProperty_nonatomic_copy(self, a2, productID, 16);
}

- (NSNumber)payloadSize
{
  return self->_payloadSize;
}

- (void)setPayloadSize:(NSNumber *)payloadSize
{
  objc_setProperty_nonatomic_copy(self, a2, payloadSize, 24);
}

- (NSNumber)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(NSNumber *)softwareVersion
{
  objc_setProperty_nonatomic_copy(self, a2, softwareVersion, 32);
}

- (NSString)softwareVersionString
{
  return self->_softwareVersionString;
}

- (void)setSoftwareVersionString:(NSString *)softwareVersionString
{
  objc_setProperty_nonatomic_copy(self, a2, softwareVersionString, 40);
}

- (NSString)releaseNotesURL
{
  return self->_releaseNotesURL;
}

- (void)setReleaseNotesURL:(NSString *)releaseNotesURL
{
  objc_setProperty_nonatomic_copy(self, a2, releaseNotesURL, 48);
}

- (NSData)imageDigest
{
  return self->_imageDigest;
}

- (void)setImageDigest:(NSData *)imageDigest
{
  objc_setProperty_nonatomic_copy(self, a2, imageDigest, 56);
}

- (MTROTAImageDigestType)imageDigestType
{
  return self->_imageDigestType;
}

- (void)setImageDigestType:(MTROTAImageDigestType)imageDigestType
{
  self->_imageDigestType = imageDigestType;
}

- (NSNumber)minApplicableVersion
{
  return self->_minApplicableVersion;
}

- (void)setMinApplicableVersion:(NSNumber *)minApplicableVersion
{
  objc_setProperty_nonatomic_copy(self, a2, minApplicableVersion, 72);
}

- (NSNumber)maxApplicableVersion
{
  return self->_maxApplicableVersion;
}

- (void)setMaxApplicableVersion:(NSNumber *)maxApplicableVersion
{
  objc_setProperty_nonatomic_copy(self, a2, maxApplicableVersion, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxApplicableVersion, 0);
  objc_storeStrong((id *)&self->_minApplicableVersion, 0);
  objc_storeStrong((id *)&self->_imageDigest, 0);
  objc_storeStrong((id *)&self->_releaseNotesURL, 0);
  objc_storeStrong((id *)&self->_softwareVersionString, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_payloadSize, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
}

@end
