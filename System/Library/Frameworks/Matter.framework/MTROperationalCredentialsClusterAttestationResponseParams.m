@implementation MTROperationalCredentialsClusterAttestationResponseParams

- (MTROperationalCredentialsClusterAttestationResponseParams)init
{
  const char *v2;
  uint64_t v3;
  MTROperationalCredentialsClusterAttestationResponseParams *v4;
  uint64_t v5;
  NSData *attestationElements;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSData *attestationSignature;
  NSNumber *timedInvokeTimeoutMs;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTROperationalCredentialsClusterAttestationResponseParams;
  v4 = -[MTROperationalCredentialsClusterAttestationResponseParams init](&v13, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    attestationElements = v4->_attestationElements;
    v4->_attestationElements = (NSData *)v5;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    attestationSignature = v4->_attestationSignature;
    v4->_attestationSignature = (NSData *)v9;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROperationalCredentialsClusterAttestationResponseParams *v4;
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

  v4 = objc_alloc_init(MTROperationalCredentialsClusterAttestationResponseParams);
  objc_msgSend_attestationElements(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttestationElements_(v4, v8, (uint64_t)v7);

  objc_msgSend_attestationSignature(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttestationSignature_(v4, v12, (uint64_t)v11);

  objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_attestationElements, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_attestationSignature, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("<%@: attestationElements:%@; attestationSignature:%@; >"),
    v5,
    v7,
    v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (MTROperationalCredentialsClusterAttestationResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  NSDictionary *v6;
  const char *v7;
  MTROperationalCredentialsClusterAttestationResponseParams *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  char isEqualToString;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  const char *v26;
  void *v27;
  id v28;
  const char *v29;
  const char *v30;
  const char *v31;
  MTROperationalCredentialsClusterAttestationResponseParams *v32;
  void *v33;
  char *v34;
  const char *v35;
  void *v36;
  NSObject *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  void *v54;
  id v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  id v63;
  id obj;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  _BYTE v77[72];
  uint64_t v78;
  objc_super v79;
  uint64_t v80;
  void *v81;
  uint8_t v82[128];
  uint8_t buf[16];
  __int128 v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v6 = responseValue;
  v79.receiver = self;
  v79.super_class = (Class)MTROperationalCredentialsClusterAttestationResponseParams;
  v8 = -[MTROperationalCredentialsClusterAttestationResponseParams init](&v79, sel_init);
  if (v8)
  {
    objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 62, 1, error);
    if (!v78)
    {
LABEL_37:
      v32 = 0;
LABEL_38:
      sub_233CAF128(&v78);
      goto LABEL_39;
    }
    sub_234104468((uint64_t)v77);
    sub_234104498((uint64_t)v77, *(_QWORD *)(v78 + 8), *(_QWORD *)(v78 + 24));
    v75 = 0uLL;
    v76 = 0;
    sub_234105EE4((uint64_t)v77, 256, &v75);
    if ((_DWORD)v75)
      goto LABEL_30;
    *(_OWORD *)buf = 0u;
    v84 = 0u;
    sub_233D0EF38(buf, (uint64_t)v77, (uint64_t)&v73);
    v75 = v73;
    v76 = v74;
    if ((_DWORD)v73
      || (objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)buf), v75 = v73, v76 = v74, (_DWORD)v73))
    {
LABEL_30:
      v33 = (void *)MEMORY[0x24BDD17C8];
      *(_OWORD *)buf = v75;
      *(_QWORD *)&v84 = v76;
      v34 = sub_2341083CC((const char **)buf, 1);
      objc_msgSend_stringWithFormat_(v33, v35, (uint64_t)CFSTR("Command payload decoding failed: %s"), v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      sub_234117B80(0, "NotSpecified");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = objc_retainAutorelease(v36);
        v41 = objc_msgSend_UTF8String(v38, v39, v40);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v41;
        _os_log_impl(&dword_233BF3000, v37, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }

      if (sub_234114844(1u))
      {
        v44 = objc_retainAutorelease(v36);
        objc_msgSend_UTF8String(v44, v45, v46);
        sub_2341147D0(0, 1);
      }
      if (error)
      {
        v80 = *MEMORY[0x24BDD0FD8];
        objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v42, v43);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v47, v48, (uint64_t)v36, &stru_2505249E8, 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v49;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v50, (uint64_t)&v81, &v80, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v52, (uint64_t)CFSTR("MTRErrorDomain"), 13, v51);
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_37;
    }
    objc_msgSend_objectForKeyedSubscript_(v6, v10, (uint64_t)CFSTR("data"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LODWORD(v75) = 47;
      *((_QWORD *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/zap-generated/MTRCommandPayloadsObjc.mm";
      LODWORD(v76) = 7970;
      goto LABEL_29;
    }
    v68 = v11;
    objc_msgSend_objectForKeyedSubscript_(v68, v12, (uint64_t)CFSTR("type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend_objectForKeyedSubscript_(v68, v13, (uint64_t)CFSTR("type"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v68, v16, (uint64_t)CFSTR("type"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v17, v18, (uint64_t)CFSTR("Structure"));

        if ((isEqualToString & 1) != 0)
        {
          objc_msgSend_objectForKeyedSubscript_(v68, v20, (uint64_t)CFSTR("value"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          if (v67 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v69 = 0u;
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            obj = v67;
            v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v69, v82, 16);
            if (v22)
            {
              v65 = *(_QWORD *)v70;
              while (2)
              {
                v62 = v22;
                for (i = 0; i != v62; ++i)
                {
                  if (*(_QWORD *)v70 != v65)
                    objc_enumerationMutation(obj);
                  v24 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    LODWORD(v75) = 47;
                    *((_QWORD *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darw"
                                            "in/Framework/CHIP/zap-generated/MTRCommandPayloadsObjc.mm";
                    LODWORD(v76) = 7989;
                    goto LABEL_56;
                  }
                  v25 = v24;
                  objc_msgSend_objectForKeyedSubscript_(v25, v26, (uint64_t)CFSTR("contextTag"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    LODWORD(v75) = 47;
                    *((_QWORD *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darw"
                                            "in/Framework/CHIP/zap-generated/MTRCommandPayloadsObjc.mm";
                    LODWORD(v76) = 7996;

                    goto LABEL_56;
                  }
                  v28 = v27;
                  if ((objc_msgSend_isEqualToNumber_(v28, v29, (uint64_t)&unk_250591A58) & 1) != 0)
                  {
                    objc_msgSend_objectForKeyedSubscript_(v25, v30, (uint64_t)CFSTR("data"));
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v54 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v55 = v54;
                      objc_msgSend_objectForKeyedSubscript_(v55, v56, (uint64_t)CFSTR("type"));
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_objectForKeyedSubscript_(v55, v57, (uint64_t)CFSTR("value"));
                      v58 = objc_claimAutoreleasedReturnValue();
                      v59 = (void *)v58;
                      if (v66
                        && v58
                        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v63 = v66;
                        if ((objc_msgSend_isEqualToString_(v63, v60, (uint64_t)CFSTR("OctetString")) & 1) != 0)
                        {
                          objc_msgSend_setAttestationChallenge_(v8, v61, (uint64_t)v59);
                        }
                        else
                        {
                          LODWORD(v75) = 47;
                          *((_QWORD *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/sr"
                                                  "c/darwin/Framework/CHIP/zap-generated/MTRCommandPayloadsObjc.mm";
                          LODWORD(v76) = 8022;
                        }

                      }
                      else
                      {
                        LODWORD(v75) = 47;
                        *((_QWORD *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/"
                                                "darwin/Framework/CHIP/zap-generated/MTRCommandPayloadsObjc.mm";
                        LODWORD(v76) = 8016;
                      }

                    }
                    else
                    {
                      LODWORD(v75) = 47;
                      *((_QWORD *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/da"
                                              "rwin/Framework/CHIP/zap-generated/MTRCommandPayloadsObjc.mm";
                      LODWORD(v76) = 8008;
                    }

                    goto LABEL_56;
                  }

                }
                v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v69, v82, 16);
                if (v22)
                  continue;
                break;
              }
            }
LABEL_56:

          }
          else
          {
            LODWORD(v75) = 47;
            *((_QWORD *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Frame"
                                    "work/CHIP/zap-generated/MTRCommandPayloadsObjc.mm";
            LODWORD(v76) = 7982;
          }

          goto LABEL_28;
        }
      }
      else
      {

      }
    }
    LODWORD(v75) = 47;
    *((_QWORD *)&v75 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    LODWORD(v76) = 7976;
LABEL_28:

LABEL_29:
    if (!(_DWORD)v75)
    {
      v32 = v8;
      goto LABEL_38;
    }
    goto LABEL_30;
  }
  v32 = 0;
LABEL_39:

  return v32;
}

- (NSData)attestationElements
{
  return self->_attestationElements;
}

- (void)setAttestationElements:(NSData *)attestationElements
{
  objc_setProperty_nonatomic_copy(self, a2, attestationElements, 8);
}

- (NSData)attestationSignature
{
  return self->_attestationSignature;
}

- (void)setAttestationSignature:(NSData *)attestationSignature
{
  objc_setProperty_nonatomic_copy(self, a2, attestationSignature, 16);
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
  objc_setProperty_nonatomic_copy(self, a2, timedInvokeTimeoutMs, 24);
}

- (NSData)attestationChallenge
{
  return self->_attestationChallenge;
}

- (void)setAttestationChallenge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestationChallenge, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_attestationSignature, 0);
  objc_storeStrong((id *)&self->_attestationElements, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  ChipError *result;

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], a3, *(_QWORD *)a4, *((_QWORD *)a4 + 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttestationElements_(self, v8, (uint64_t)v7);

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v9, *((_QWORD *)a4 + 2), *((_QWORD *)a4 + 3));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttestationSignature_(self, v11, (uint64_t)v10);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 8060;
  return result;
}

@end
