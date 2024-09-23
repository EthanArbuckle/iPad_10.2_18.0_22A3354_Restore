@implementation MTRFabricInfo

- (MTRFabricInfo)initWithFabricTable:(const void *)a3 fabricInfo:(const void *)a4
{
  id v6;
  const char *v7;
  NSObject *v8;
  int v9;
  char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  MTRFabricInfo *v32;
  __int128 v34;
  uint64_t v35;
  objc_super v36;
  __int128 v37;
  uint64_t v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  char *v42;
  uint64_t (**v43)();
  _QWORD v44[10];

  v44[9] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)MTRFabricInfo;
  v6 = -[MTRFabricInfo init](&v36, sel_init);
  if (!v6)
    goto LABEL_11;
  v43 = &off_250505A50;
  v34 = 0uLL;
  v35 = 0;
  sub_2341E2710((uint64_t)a4, (uint64_t)&v43, (uint64_t)&v34);
  if ((_DWORD)v34)
  {
    sub_234117B80(0, "NotSpecified");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *((unsigned __int8 *)a4 + 137);
      v37 = v34;
      v38 = v35;
      v10 = sub_2341083CC((const char **)&v37, 1);
      *(_DWORD *)buf = 67109378;
      v40 = v9;
      v41 = 2080;
      v42 = v10;
      _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch root public key for fabric index %x: %s", buf, 0x12u);
    }

    if (sub_234114844(1u))
    {
      v37 = v34;
      v38 = v35;
      sub_2341083CC((const char **)&v37, 1);
      sub_2341147D0(0, 1);
    }
    goto LABEL_11;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v7, (uint64_t)v44, 65);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)*((_QWORD *)v6 + 1);
  *((_QWORD *)v6 + 1) = v11;

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v13, *((unsigned __int16 *)a4 + 69));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v14;

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v16, *((_QWORD *)a4 + 1));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)*((_QWORD *)v6 + 3);
  *((_QWORD *)v6 + 3) = v17;

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v19, *(_QWORD *)a4);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)*((_QWORD *)v6 + 4);
  *((_QWORD *)v6 + 4) = v20;

  v22 = sub_23400A580((uint64_t)a4);
  v24 = v23;
  v25 = objc_alloc(MEMORY[0x24BDD17C8]);
  v27 = objc_msgSend_initWithBytes_length_encoding_(v25, v26, v22, v24, 4);
  v28 = (void *)*((_QWORD *)v6 + 5);
  *((_QWORD *)v6 + 5) = v27;

  if (!sub_23400A5C4((void **)v6 + 6, (uint64_t *)v6 + 7, (uint64_t)a3, *((unsigned __int8 *)a4 + 137), sub_2341E2AB4, 0, (uint64_t)"root")|| !sub_23400A5C4((void **)v6 + 8, (uint64_t *)v6 + 9, (uint64_t)a3, *((unsigned __int8 *)a4 + 137), sub_2341E3150, 0, (uint64_t)"intermediate")|| !sub_23400A5C4((void **)v6 + 10, (uint64_t *)v6 + 11, (uint64_t)a3,
          *((unsigned __int8 *)a4 + 137),
          sub_2341E3340,
          0,
          (uint64_t)"operational"))
  {
LABEL_11:
    v32 = 0;
    goto LABEL_12;
  }
  objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], v29, *((unsigned __int8 *)a4 + 137));
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)*((_QWORD *)v6 + 12);
  *((_QWORD *)v6 + 12) = v30;

  v32 = (MTRFabricInfo *)v6;
LABEL_12:

  return v32;
}

- (NSData)rootPublicKey
{
  return self->_rootPublicKey;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (NSString)label
{
  return self->_label;
}

- (MTRCertificateDERBytes)rootCertificate
{
  return self->_rootCertificate;
}

- (MTRCertificateTLVBytes)rootCertificateTLV
{
  return self->_rootCertificateTLV;
}

- (MTRCertificateDERBytes)intermediateCertificate
{
  return self->_intermediateCertificate;
}

- (MTRCertificateTLVBytes)intermediateCertificateTLV
{
  return self->_intermediateCertificateTLV;
}

- (MTRCertificateDERBytes)operationalCertificate
{
  return self->_operationalCertificate;
}

- (MTRCertificateTLVBytes)operationalCertificateTLV
{
  return self->_operationalCertificateTLV;
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_operationalCertificateTLV, 0);
  objc_storeStrong((id *)&self->_operationalCertificate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificateTLV, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_rootCertificateTLV, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
}

@end
