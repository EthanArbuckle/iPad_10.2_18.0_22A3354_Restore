@implementation MTRDeviceAttestationDeviceInfo

- (MTRDeviceAttestationDeviceInfo)initWithDACCertificate:(id)a3 dacPAICertificate:(id)a4 certificateDeclaration:(id)a5 basicInformationVendorID:(id)a6 basicInformationProductID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  MTRDeviceAttestationDeviceInfo *v19;
  uint64_t v20;
  NSData *dacCertificate;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSData *dacPAICertificate;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSData *certificateDeclaration;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSNumber *basicInformationVendorID;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSNumber *basicInformationProductID;
  NSData *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  _BYTE *v46;
  const char *v47;
  uint64_t v48;
  NSNumber *vendorID;
  void *v50;
  _BYTE *v51;
  const char *v52;
  uint64_t v53;
  NSNumber *productID;
  _BYTE v56[2];
  __int16 v57;
  unsigned __int8 v58[2];
  __int16 v59;
  __int128 v60;
  _DWORD v61[6];
  unsigned __int8 v62[2];
  __int16 v63;
  char v64;
  __int16 v65;
  objc_super v66;
  __int128 v67;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v66.receiver = self;
  v66.super_class = (Class)MTRDeviceAttestationDeviceInfo;
  v19 = -[MTRDeviceAttestationDeviceInfo init](&v66, sel_init);
  if (v19)
  {
    v20 = objc_msgSend_copy(v12, v17, v18);
    dacCertificate = v19->_dacCertificate;
    v19->_dacCertificate = (NSData *)v20;

    v24 = objc_msgSend_copy(v13, v22, v23);
    dacPAICertificate = v19->_dacPAICertificate;
    v19->_dacPAICertificate = (NSData *)v24;

    v28 = objc_msgSend_copy(v14, v26, v27);
    certificateDeclaration = v19->_certificateDeclaration;
    v19->_certificateDeclaration = (NSData *)v28;

    v32 = objc_msgSend_copy(v15, v30, v31);
    basicInformationVendorID = v19->_basicInformationVendorID;
    v19->_basicInformationVendorID = (NSNumber *)v32;

    v36 = objc_msgSend_copy(v16, v34, v35);
    basicInformationProductID = v19->_basicInformationProductID;
    v19->_basicInformationProductID = (NSNumber *)v36;

    v62[0] = 0;
    v64 = 0;
    v38 = objc_retainAutorelease(v19->_dacCertificate);
    v41 = objc_msgSend_bytes(v38, v39, v40);
    v44 = objc_msgSend_length(v38, v42, v43);
    sub_233BF7114(&v67, v41, v44);

    v60 = v67;
    sub_23413D364((uint64_t)&v60, v62, (uint64_t)v61);
    if (!v61[0])
    {
      v58[0] = v62[0];
      if (v62[0])
      {
        v59 = v63;
        v45 = (void *)MEMORY[0x24BDD16E0];
        v46 = sub_233CBCEC0(v58);
        objc_msgSend_numberWithUnsignedShort_(v45, v47, *(unsigned __int16 *)v46);
        v48 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = 0;
      }
      vendorID = v19->_vendorID;
      v19->_vendorID = (NSNumber *)v48;

      v56[0] = v64;
      if (v64)
      {
        v57 = v65;
        v50 = (void *)MEMORY[0x24BDD16E0];
        v51 = sub_233CBCEC0(v56);
        objc_msgSend_numberWithUnsignedShort_(v50, v52, *(unsigned __int16 *)v51);
        v53 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v53 = 0;
      }
      productID = v19->_productID;
      v19->_productID = (NSNumber *)v53;

    }
  }

  return v19;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (NSNumber)productID
{
  return self->_productID;
}

- (NSNumber)basicInformationVendorID
{
  return self->_basicInformationVendorID;
}

- (NSNumber)basicInformationProductID
{
  return self->_basicInformationProductID;
}

- (MTRCertificateDERBytes)dacCertificate
{
  return self->_dacCertificate;
}

- (MTRCertificateDERBytes)dacPAICertificate
{
  return self->_dacPAICertificate;
}

- (NSData)certificateDeclaration
{
  return self->_certificateDeclaration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateDeclaration, 0);
  objc_storeStrong((id *)&self->_dacPAICertificate, 0);
  objc_storeStrong((id *)&self->_dacCertificate, 0);
  objc_storeStrong((id *)&self->_basicInformationProductID, 0);
  objc_storeStrong((id *)&self->_basicInformationVendorID, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
}

@end
