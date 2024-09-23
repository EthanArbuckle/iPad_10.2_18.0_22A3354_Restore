@implementation MTRCommissionerControlClusterReverseOpenCommissioningWindowParams

- (MTRCommissionerControlClusterReverseOpenCommissioningWindowParams)init
{
  MTRCommissionerControlClusterReverseOpenCommissioningWindowParams *v2;
  MTRCommissionerControlClusterReverseOpenCommissioningWindowParams *v3;
  NSNumber *commissioningTimeout;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSData *pakePasscodeVerifier;
  NSNumber *discriminator;
  NSNumber *iterations;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSData *salt;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MTRCommissionerControlClusterReverseOpenCommissioningWindowParams;
  v2 = -[MTRCommissionerControlClusterReverseOpenCommissioningWindowParams init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    commissioningTimeout = v2->_commissioningTimeout;
    v2->_commissioningTimeout = (NSNumber *)&unk_250591A40;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    pakePasscodeVerifier = v3->_pakePasscodeVerifier;
    v3->_pakePasscodeVerifier = (NSData *)v7;

    discriminator = v3->_discriminator;
    v3->_discriminator = (NSNumber *)&unk_250591A40;

    iterations = v3->_iterations;
    v3->_iterations = (NSNumber *)&unk_250591A40;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    salt = v3->_salt;
    v3->_salt = (NSData *)v13;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRCommissionerControlClusterReverseOpenCommissioningWindowParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;

  v4 = objc_alloc_init(MTRCommissionerControlClusterReverseOpenCommissioningWindowParams);
  objc_msgSend_commissioningTimeout(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCommissioningTimeout_(v4, v8, (uint64_t)v7);

  objc_msgSend_pakePasscodeVerifier(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPakePasscodeVerifier_(v4, v12, (uint64_t)v11);

  objc_msgSend_discriminator(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDiscriminator_(v4, v16, (uint64_t)v15);

  objc_msgSend_iterations(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIterations_(v4, v20, (uint64_t)v19);

  objc_msgSend_salt(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSalt_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *commissioningTimeout;
  const char *v7;
  void *v8;
  NSNumber *discriminator;
  NSNumber *iterations;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  commissioningTimeout = self->_commissioningTimeout;
  objc_msgSend_base64EncodedStringWithOptions_(self->_pakePasscodeVerifier, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  discriminator = self->_discriminator;
  iterations = self->_iterations;
  objc_msgSend_base64EncodedStringWithOptions_(self->_salt, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v13, (uint64_t)CFSTR("<%@: commissioningTimeout:%@; pakePasscodeVerifier:%@; discriminator:%@; iterations:%@; salt:%@; >"),
    v5,
    commissioningTimeout,
    v8,
    discriminator,
    iterations,
    v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (MTRCommissionerControlClusterReverseOpenCommissioningWindowParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  MTRCommissionerControlClusterReverseOpenCommissioningWindowParams *v8;
  const char *v9;
  void *v10;
  char *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  MTRCommissionerControlClusterReverseOpenCommissioningWindowParams *v30;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  _BYTE v36[72];
  uint64_t v37;
  objc_super v38;
  uint64_t v39;
  void *v40;
  __int128 buf;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MTRCommissionerControlClusterReverseOpenCommissioningWindowParams;
  v8 = -[MTRCommissionerControlClusterReverseOpenCommissioningWindowParams init](&v38, sel_init);
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 1873, 2, a4);
  if (v37)
  {
    sub_234104468((uint64_t)v36);
    sub_234104498((uint64_t)v36, *(_QWORD *)(v37 + 8), *(_QWORD *)(v37 + 24));
    v34 = 0uLL;
    v35 = 0;
    sub_234105EE4((uint64_t)v36, 256, &v34);
    if (!(_DWORD)v34)
    {
      LOWORD(buf) = 0;
      *((_QWORD *)&buf + 1) = 0;
      v42 = 0;
      v43 = 0;
      v45 = 0;
      v44 = 0;
      v46 = 0;
      sub_233D3CCDC((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
      v34 = v32;
      v35 = v33;
      if (!(_DWORD)v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&buf);
        v34 = v32;
        v35 = v33;
        if (!(_DWORD)v32)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    buf = v34;
    v42 = v35;
    v11 = sub_2341083CC((const char **)&buf, 1);
    objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("Command payload decoding failed: %s"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_234117B80(0, "NotSpecified");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_retainAutorelease(v13);
      v18 = objc_msgSend_UTF8String(v15, v16, v17);
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_233BF3000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_234114844(1u))
    {
      v21 = objc_retainAutorelease(v13);
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_2341147D0(0, 1);
    }
    if (a4)
    {
      v39 = *MEMORY[0x24BDD0FD8];
      objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v19, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_2505249E8, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v26;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)&v40, &v39, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v29, (uint64_t)CFSTR("MTRErrorDomain"), 13, v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v30 = 0;
LABEL_14:
  sub_233CAF128(&v37);
LABEL_16:

  return v30;
}

- (NSNumber)commissioningTimeout
{
  return self->_commissioningTimeout;
}

- (void)setCommissioningTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)pakePasscodeVerifier
{
  return self->_pakePasscodeVerifier;
}

- (void)setPakePasscodeVerifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)discriminator
{
  return self->_discriminator;
}

- (void)setDiscriminator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)iterations
{
  return self->_iterations;
}

- (void)setIterations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)salt
{
  return self->_salt;
}

- (void)setSalt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_iterations, 0);
  objc_storeStrong((id *)&self->_discriminator, 0);
  objc_storeStrong((id *)&self->_pakePasscodeVerifier, 0);
  objc_storeStrong((id *)&self->_commissioningTimeout, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v19;
  const char *v20;
  ChipError *result;

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], a3, *(unsigned __int16 *)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCommissioningTimeout_(self, v8, (uint64_t)v7);

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v9, *((_QWORD *)a4 + 1), *((_QWORD *)a4 + 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPakePasscodeVerifier_(self, v11, (uint64_t)v10);

  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v12, *((unsigned __int16 *)a4 + 12));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDiscriminator_(self, v14, (uint64_t)v13);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v15, *((unsigned int *)a4 + 7));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIterations_(self, v17, (uint64_t)v16);

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v18, *((_QWORD *)a4 + 4), *((_QWORD *)a4 + 5));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSalt_(self, v20, (uint64_t)v19);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 31509;
  return result;
}

@end
