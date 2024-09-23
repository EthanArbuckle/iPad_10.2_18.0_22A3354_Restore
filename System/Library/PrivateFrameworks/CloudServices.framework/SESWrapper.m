@implementation SESWrapper

- (SESWrapper)initWithRequest:(id)a3
{
  return (SESWrapper *)MEMORY[0x24BEDD108](self, sel_initWithRequest_reqVersion_, a3);
}

- (SESWrapper)initWithRequest:(id)a3 reqVersion:(int)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  SESWrapper *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend_validateInput(v6, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    sub_20D67C0DC();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_20D696934();

    v13 = 0;
  }
  else
  {
    objc_msgSend_dsid(v6, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_escrowRecord(v6, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recoveryPassphrase(v6, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordID(v6, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordLabel(v6, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    self = (SESWrapper *)(id)objc_msgSend_initWithDSID_escrowRecordContents_recoveryPassphrase_recordID_recordLabel_reqVersion_(self, v27, (uint64_t)v14, v17, v20, v23, v26, v4);

    v13 = self;
  }

  return v13;
}

- (SESWrapper)initWithDSID:(id)a3 escrowRecordContents:(id)a4 recoveryPassphrase:(id)a5 recordID:(id)a6 recordLabel:(id)a7
{
  return (SESWrapper *)objc_msgSend_initWithDSID_escrowRecordContents_recoveryPassphrase_recordID_recordLabel_reqVersion_(self, a2, (uint64_t)a3, a4, a5, a6, a7, 0);
}

- (SESWrapper)initWithDSID:(id)a3 escrowRecordContents:(id)a4 recoveryPassphrase:(id)a5 recordID:(id)a6 recordLabel:(id)a7 reqVersion:(int)a8
{
  uint64_t v8;
  id v15;
  id v16;
  id v17;
  const char *v18;
  const char *v19;
  SESWrapper *v20;
  SESWrapper *v21;
  uint64_t *v22;
  const char *v23;
  SESWrapper *v24;
  id v26;
  id v27;
  objc_super v28;

  v8 = *(_QWORD *)&a8;
  v15 = a3;
  v27 = a4;
  v16 = a5;
  v26 = a6;
  v17 = a7;
  if (((objc_msgSend_isEqualToString_(v17, v18, (uint64_t)CFSTR("com.apple.protectedcloudstorage.record")) & 1) != 0
     || objc_msgSend_isEqualToString_(v17, v19, (uint64_t)CFSTR("com.apple.protectedcloudstorage.record.double"), v26, v27))&& (objc_msgSend_isEqualToString_(v16, v19, (uint64_t)v15, v26) & 1) == 0)
  {
    sub_20D696854();
  }
  v28.receiver = self;
  v28.super_class = (Class)SESWrapper;
  v20 = -[SESWrapper init](&v28, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_dsid, a3);
    objc_storeStrong((id *)&v21->_escrowRecord, a4);
    objc_storeStrong((id *)&v21->_recoveryPassphrase, a5);
    objc_storeStrong((id *)&v21->_recordID, a6);
    objc_storeStrong((id *)&v21->_label, a7);
    if (!v21->_dsid && !v21->_recoveryPassphrase)
      v21->_recoveryPassphraseMutable = 1;
    v21->_reqVersion = v8;
    v22 = (uint64_t *)malloc_type_malloc(0x38uLL, 0x6004031944618uLL);
    v21->_ckvr = (ckvr_srp_context *)v22;
    sub_20D68B2F4(v22);
    objc_msgSend_setReqVersion_(v21, v23, v8);
    v24 = v21;
  }

  return v21;
}

- (void)setReqVersion:(int)a3
{
  int *p_reqVersion;
  NSObject *v4;
  uint64_t v5;
  int *v6;

  self->_reqVersion = a3;
  p_reqVersion = &self->_reqVersion;
  if (a3 >= 3)
  {
    v6 = p_reqVersion;
    sub_20D67C0DC();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_20D696998(v6, v4, v5);

    abort();
  }
}

- (id)srpInitBlob
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  size_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  const char *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend_ckvr(self, a2, v2);
  v7 = sub_20D68B434(v4);
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = (char *)v13 - v8;
  if (v7)
    memset((char *)v13 - v8, 170, v7);
  v10 = objc_msgSend_ckvr(self, v5, v6);
  sub_20D68B460(v10, (uint64_t)v9, v7);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v11, (uint64_t)v9, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)srpKeySize
{
  uint64_t v2;

  objc_msgSend_ckvr(self, a2, v2);
  return sub_20D68B4B8();
}

- (unint64_t)srpPublicKeySize
{
  uint64_t v2;
  uint64_t v3;

  v3 = objc_msgSend_ckvr(self, a2, v2);
  return sub_20D68B434(v3);
}

- (void)srpRecoveryUpdateDSID:(id)a3 recoveryPassphrase:(id)a4
{
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *dsid;
  NSString *recoveryPassphrase;
  NSString *v11;

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  if (!self->_recoveryPassphraseMutable)
    abort();
  v8 = v7;
  self->_recoveryPassphraseMutable = 0;
  dsid = self->_dsid;
  self->_dsid = v6;
  v11 = v6;

  recoveryPassphrase = self->_recoveryPassphrase;
  self->_recoveryPassphrase = v8;

}

- (id)srpRecoveryBlobFromData:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  size_t v18;
  unint64_t v19;
  char *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const void *v24;
  const char *v25;
  uint64_t v26;
  size_t v27;
  const char *v28;
  uint64_t v29;
  unint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  _BOOL4 v55;
  const char *v56;
  uint64_t v57;
  id v58;
  const char *v59;
  const char *v60;
  size_t v61;
  const char *v62;
  uint64_t v63;
  int v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  NSObject *v73;
  const char *v74;
  NSObject *v75;
  const char *v76;
  id v77;
  NSObject *v78;
  const char *v79;
  NSObject *v80;
  const char *v81;
  NSObject *v82;
  const char *v83;
  uint64_t v84;
  id v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  void *v95;
  NSObject *v96;
  id v97;
  id v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  NSObject *v104;
  const char *v105;
  uint64_t v106;
  int v107;
  id v108;
  id v109;
  _QWORD v110[5];
  uint64_t v111;
  _QWORD v112[4];
  id v113;
  uint64_t v114;
  _BYTE v115[8];
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  self->_recoveryPassphraseMutable = 0;
  if ((unint64_t)objc_msgSend_length(v6, v7, v8) >> 32)
  {
    sub_20D67C0DC();
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      sub_20D696A04(v6, v11, v12);

    if (a4)
    {
      v15 = objc_msgSend_length(v6, v13, v14);
      objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v16, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 102, CFSTR("srp recovery blob too large: %lu bytes"), v15);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    goto LABEL_54;
  }
  v18 = objc_msgSend_length(v6, v9, v10);
  v19 = (v18 + 15) & 0xFFFFFFFFFFFFFFF0;
  v20 = (char *)&v108 - v19;
  if (v18)
    memset((char *)&v108 - v19, 170, v18);
  v21 = objc_retainAutorelease(v6);
  v24 = (const void *)objc_msgSend_bytes(v21, v22, v23);
  v27 = objc_msgSend_length(v21, v25, v26);
  memcpy(v20, v24, v27);
  v30 = objc_msgSend_length(v21, v28, v29);
  if (sub_20D68E9EC(v30, (uint64_t)v20))
  {
    v33 = (void *)MEMORY[0x24BDBCE50];
    v34 = objc_msgSend_length(v21, v31, v32);
    objc_msgSend_dataWithBytes_length_(v33, v35, (uint64_t)v20, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = objc_retainAutorelease(v36);
      v40 = objc_msgSend_bytes(v37, v38, v39);
      v114 = -1;
      v43 = objc_msgSend_ckvr(self, v41, v42);
      v114 = sub_20D68E28C(v43, v40);
      objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v44, v114);
      v109 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dsid(self, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v47)
      {
        v49 = objc_retainAutorelease(v47);
        v53 = objc_msgSend_cStringUsingEncoding_(v49, v50, 4);
        if (v53)
        {
          objc_msgSend_recoveryPassphrase(self, v51, v52);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v54 == 0;

          if (!v55)
          {
            objc_msgSend_recoveryPassphrase(self, v56, v57);
            v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v60 = (const char *)objc_msgSend_cStringUsingEncoding_(v58, v59, 4);

            if (v60)
            {
              v61 = strlen(v60);
              v111 = 0;
              v112[0] = &v111;
              v112[1] = 0x3032000000;
              v112[2] = sub_20D692B6C;
              v112[3] = sub_20D67BB74;
              v113 = 0;
              v110[0] = MEMORY[0x24BDAC760];
              v110[1] = 3221225472;
              v110[2] = sub_20D692B7C;
              v110[3] = &unk_24C75A508;
              v110[4] = &v111;
              v108 = (id)MEMORY[0x212BA6D30](v110);
              v64 = objc_msgSend_reqVersion(self, v62, v63);
              if (v64)
              {
                if (v64 == 1)
                {
                  v84 = objc_msgSend_ckvr(self, v65, v66);
                  v85 = objc_retainAutorelease(v109);
                  v88 = objc_msgSend_mutableBytes(v85, v86, v87);
                  v72 = sub_20D68B99C(v84, v53, v61, (uint64_t)v60, v40, (unsigned int *)&v114, v88, (void (*)(const char *, ...))sub_20D692A98, (uint64_t)v108);
                }
                else
                {
                  if (v64 != 2)
                  {
                    sub_20D67C0DC();
                    v104 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                    {
                      v107 = objc_msgSend_reqVersion(self, v105, v106);
                      sub_20D696B54((uint64_t)v115, v107, v104);
                    }

                    abort();
                  }
                  v67 = objc_msgSend_ckvr(self, v65, v66);
                  v68 = objc_retainAutorelease(v109);
                  v71 = objc_msgSend_mutableBytes(v68, v69, v70);
                  v72 = sub_20D68B9C4(v67, v53, v61, (uint64_t)v60, v40, (unsigned int *)&v114, v71, (void (*)(const char *, ...))sub_20D692A98, (uint64_t)v108);
                }
              }
              else
              {
                v89 = objc_msgSend_ckvr(self, v65, v66);
                v90 = objc_retainAutorelease(v109);
                v93 = objc_msgSend_mutableBytes(v90, v91, v92);
                v72 = sub_20D68B530(v89, v53, v61, (uint64_t)v60, v40, (unsigned int *)&v114, v93, (void (*)(const char *, ...))sub_20D692A98, (uint64_t)v108);
              }
              v94 = v72;
              if (a4)
              {
                v95 = *(void **)(v112[0] + 40);
                if (v95)
                  *a4 = objc_retainAutorelease(v95);
              }
              if (v94)
              {
                sub_20D67C0DC();
                v96 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
                  sub_20D696B90((uint64_t)v112, v94, v96);

                v17 = 0;
              }
              else
              {
                v97 = objc_alloc(MEMORY[0x24BDBCE50]);
                v98 = objc_retainAutorelease(v109);
                v101 = objc_msgSend_bytes(v98, v99, v100);
                v17 = (void *)objc_msgSend_initWithBytes_length_(v97, v102, v101, v114);
              }

              _Block_object_dispose(&v111, 8);
              goto LABEL_53;
            }
            sub_20D67C0DC();
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
              sub_20D696B28();

            if (a4)
            {
              objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v83, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 102, CFSTR("recoveryPassphrase could not be converted to cstring"));
              v77 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_40;
            }
LABEL_41:
            v17 = 0;
            goto LABEL_53;
          }
          sub_20D67C0DC();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            sub_20D696AFC();

          if (!a4)
            goto LABEL_41;
          objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v81, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 102, CFSTR("recoveryPassphrase not provided"));
          v77 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          sub_20D67C0DC();
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            sub_20D696AD0();

          if (!a4)
            goto LABEL_41;
          objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v79, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 102, CFSTR("username could not be converted to cstring"));
          v77 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        sub_20D67C0DC();
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          sub_20D696AA4();

        if (!a4)
          goto LABEL_41;
        objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v76, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 102, CFSTR("can't process recovery blob with no username"));
        v77 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_40:
      v17 = 0;
      *a4 = v77;
LABEL_53:

      goto LABEL_54;
    }
  }
  sub_20D67C0DC();
  v73 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    sub_20D696A78();

  if (a4)
  {
    objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v74, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 102, CFSTR("failed to convert srp init response"));
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_54:

  return v17;
}

- (id)encodedEscrowRecordWithPublicKey:(__SecKey *)a3 error:(id *)a4
{
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  id v35;
  const char *v36;
  size_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  size_t v46;
  const char *v47;
  uint64_t v48;
  unint64_t v49;
  const char *v50;
  uint64_t v51;
  unint64_t v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  id v81;
  const char *v82;
  const char *v83;
  unint64_t v84;
  char *v85;
  size_t v86;
  __int128 v87;
  const char *v88;
  uint64_t v89;
  NSObject *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  _QWORD *v96;
  const char *v97;
  uint64_t v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  unint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  unint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char *v114;
  const char *v115;
  NSObject *v116;
  _BOOL4 v117;
  const char *v118;
  _BOOL4 v119;
  int fips186_key;
  const char *v121;
  int v122;
  NSObject *v123;
  _BOOL4 v124;
  _QWORD *v126;
  size_t v127;
  CFIndex v128;
  const UInt8 *v129;
  int v130;
  const char *v131;
  CFDataRef v132;
  const char *v133;
  const __CFData *v134;
  uint64_t v135;
  uint64_t v136;
  SecKeyRef v137;
  const char *v138;
  uint64_t v139;
  unint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  unint64_t v144;
  id v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  const char *v151;
  NSObject *v152;
  _BOOL4 v153;
  const char *v154;
  const char *v155;
  NSObject *v156;
  _BOOL4 v157;
  uint64_t v158;
  NSObject *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  unint64_t v163;
  id v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  SecKeyRef v168;
  const char *v169;
  SESWrapper *v170;
  const char *v171;
  void *v172;
  const char *v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  void *v178;
  const char *v179;
  void *v180;
  const char *v181;
  id v182;
  const char *v183;
  NSObject *v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  char isEqual;
  const char *v190;
  const char *v191;
  const char *v192;
  const char *v193;
  NSObject *v194;
  SecKeyRef v195;
  CFDictionaryRef v196;
  uint64_t v197;
  uint64_t v198;
  char *v199;
  id v200;
  char *v201;
  uint64_t v202;
  const char *v203;
  size_t v204;
  CFTypeRef *v205;
  size_t v206;
  const char *v207;
  id v208;
  id v209;
  id v210;
  id v211;
  void *v212;
  void *v213;
  id v214;
  void *v215;
  void *v216;
  NSObject *v217;
  id v218;
  _WORD v219[7];
  char v220;
  NSObject *v221;
  char v222;
  _QWORD v223[2];
  _QWORD v224[2];
  CFErrorRef v225[2];
  _DWORD v226[528];
  _OWORD v227[2];
  uint64_t v228;

  v228 = *MEMORY[0x24BDAC8D0];
  v221 = 0xAAAAAAAAAAAAAAAALL;
  if (!SecKeyCopyPublicBytes())
  {
    v8 = v221;
    v10 = (void *)MEMORY[0x24BDD1770];
    objc_msgSend_escrowRecord(self, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithPropertyList_format_options_error_(v10, v12, (uint64_t)v11, 200, 0, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend_dsid(self, v14, v15);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = (void *)objc_msgSend_cStringUsingEncoding_(v16, v17, 4);
      if (v18)
      {
        v210 = v18;
        v216 = (void *)strlen((const char *)v18);
        objc_msgSend_label(self, v19, v20);
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v23 = (void *)objc_msgSend_cStringUsingEncoding_(v21, v22, 4);

        objc_msgSend_recordID(self, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v217 = v16;
        if (v26)
        {
          v29 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_label(self, v27, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_recordID(self, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v29, v34, (uint64_t)CFSTR("%@.%@"), v30, v33);
          v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v23 = (void *)objc_msgSend_cStringUsingEncoding_(v35, v36, 4);

        }
        if (v23)
        {
          v209 = v23;
          v37 = strlen((const char *)v23);
          if (v37 >= 0x80)
            v40 = 128;
          else
            v40 = v37;
          objc_msgSend_date(MEMORY[0x24BDBCE60], v38, v39);
          v41 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_posixDateFormatter(MEMORY[0x24BDD1500], v42, v43);
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          v213 = (void *)v41;
          objc_msgSend_stringFromDate_(v212, v44, v41);
          v211 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v207 = (const char *)objc_msgSend_cStringUsingEncoding_(v211, v45, 4);
          v46 = strlen(v207);
          v49 = objc_msgSend_ckvr(self, v47, v48);
          v215 = v13;
          v52 = objc_msgSend_length(v13, v50, v51);
          v53 = objc_retainAutorelease(v221);
          objc_msgSend_bytes(v53, v54, v55);
          objc_msgSend_length(v53, v56, v57);
          v208 = (id)v40;
          v206 = v46;
          v214 = (id)sub_20D68D78C(v49, (unint64_t)v216, v52, v40, v46);
          if ((unint64_t)v214 > 0x1000)
          {
            v16 = v217;
            if (a4)
            {
              objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v58, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 3, CFSTR("Escrow data too long"));
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            sub_20D67C0DC();
            v60 = objc_claimAutoreleasedReturnValue();
            v13 = v215;
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              v226[0] = 134217984;
              *(_QWORD *)&v226[1] = v214;
              _os_log_impl(&dword_20D67A000, v60, OS_LOG_TYPE_DEFAULT, "Escrow data too long: %lu", (uint8_t *)v226, 0xCu);
            }

            v9 = 0;
            v62 = v212;
            v61 = v213;
            v63 = v211;
            goto LABEL_53;
          }
          objc_msgSend_recoveryPassphrase(self, v58, v59);
          v81 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v83 = (const char *)objc_msgSend_cStringUsingEncoding_(v81, v82, 4);

          v204 = strlen(v83);
          v205 = (CFTypeRef *)&v195;
          v84 = ((unint64_t)v214 + 15) & 0xFFFFFFFFFFFFFFF0;
          v85 = (char *)&v195 - v84;
          if (v214)
          {
            v86 = (size_t)v214;
            memset((char *)&v195 - v84, 170, (size_t)v214);
            v201 = (char *)&v195 - v84;
            memset((char *)&v195 - v84, 170, v86);
          }
          else
          {
            v201 = &v222;
          }
          *(_QWORD *)&v87 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v87 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v227[0] = v87;
          v227[1] = v87;
          memset(v226, 170, sizeof(v226));
          objc_msgSend_length(v53, v88, v89);
          v90 = objc_retainAutorelease(v53);
          objc_msgSend_bytes(v90, v91, v92);
          v93 = ccrsa_import_pub_n();
          if (!v93)
          {
            if (a4)
            {
              objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v94, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 120, CFSTR("Fail to parse certificate"));
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            sub_20D67C0DC();
            v116 = objc_claimAutoreleasedReturnValue();
            v119 = os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT);
            v13 = v215;
            v16 = v217;
            if (!v119)
              goto LABEL_51;
            LOWORD(v225[0]) = 0;
            v118 = "Fail to parse certificate";
            goto LABEL_44;
          }
          v95 = v93;
          v202 = 40;
          v96 = malloc_type_malloc(24 * v93 + 40, 0x414CCAC5uLL);
          *v96 = v95;
          objc_msgSend_length(v90, v97, v98);
          v99 = objc_retainAutorelease(v90);
          objc_msgSend_bytes(v99, v100, v101);
          ccrsa_import_pub();
          v104 = objc_msgSend_ckvr(self, v102, v103);
          v203 = v83;
          v105 = v215;
          v108 = objc_msgSend_length(v215, v106, v107);
          v200 = objc_retainAutorelease(v105);
          v111 = objc_msgSend_bytes(v200, v109, v110);
          LODWORD(v105) = sub_20D68DD58(v104, (unint64_t)v216, (uint64_t)v210, v204, (uint64_t)v203, v108, v111, v208, (uint64_t)v209, v206, (uint64_t)v207, v96, (uint64_t)v85, (uint64_t)v227);
          v112 = v95 + 63;
          v113 = (unint64_t)(v95 + 63) >> 6;
          v114 = (char *)(v202 + 24 * v113);
          cc_clear();
          free(v96);
          if ((_DWORD)v105)
          {
            if (a4)
            {
              objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v115, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 125, CFSTR("Escrow error encrypting data"));
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            sub_20D67C0DC();
            v116 = objc_claimAutoreleasedReturnValue();
            v117 = os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT);
            v13 = v215;
            v16 = v217;
            if (!v117)
              goto LABEL_51;
            LOWORD(v225[0]) = 0;
            v118 = "Escrow error encrypting data";
LABEL_44:
            _os_log_impl(&dword_20D67A000, v116, OS_LOG_TYPE_DEFAULT, v118, (uint8_t *)v225, 2u);
LABEL_51:
            v9 = 0;
            v62 = v212;
            v61 = v213;
            v63 = v211;
LABEL_52:

LABEL_53:
            goto LABEL_54;
          }
          objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v115, (uint64_t)v85, v214);
          v202 = objc_claimAutoreleasedReturnValue();
          v220 = 1;
          v219[6] = 1;
          ccrng();
          ccrng();
          fips186_key = ccrsa_generate_fips186_key();
          if (fips186_key)
          {
            v122 = fips186_key;
            v16 = v217;
            if (a4)
            {
              objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v121, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 1, CFSTR("Could not generate key"));
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            sub_20D67C0DC();
            v123 = objc_claimAutoreleasedReturnValue();
            v124 = os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT);
            v13 = v215;
            v116 = v202;
            if (v124)
            {
              LODWORD(v225[0]) = 67109120;
              HIDWORD(v225[0]) = v122;
              _os_log_impl(&dword_20D67A000, v123, OS_LOG_TYPE_DEFAULT, "Could not generate key: %d", (uint8_t *)v225, 8u);
            }

            goto LABEL_51;
          }
          v198 = v112;
          v199 = v114;
          v126 = (_QWORD *)ccrsa_ctx_public();
          v127 = ccrsa_export_priv_size();
          v128 = v127;
          v129 = (const UInt8 *)&v195 - ((v127 + 15) & 0xFFFFFFFFFFFFFFF0);
          if (v127)
            memset((char *)&v195 - ((v127 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v127);
          v130 = ccrsa_export_priv();
          v16 = v217;
          if (v130)
          {
            cc_clear();
            v13 = v215;
            if (a4)
            {
              objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v131, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 1, CFSTR("failed to extra bytes of priv key"));
LABEL_61:
              v9 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_75:
              v62 = v212;
              v61 = v213;
              v63 = v211;
              v116 = v202;
              goto LABEL_52;
            }
            goto LABEL_74;
          }
          v197 = 8 * v113;
          v132 = CFDataCreateWithBytesNoCopy(0, v129, v128, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
          v13 = v215;
          if (!v132)
          {
            cc_clear();
            if (a4)
            {
              objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v154, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 1, CFSTR("failed to create data buffer"));
              goto LABEL_61;
            }
LABEL_74:
            v9 = 0;
            goto LABEL_75;
          }
          v134 = v132;
          v225[0] = 0;
          v135 = *MEMORY[0x24BDE9028];
          v223[0] = *MEMORY[0x24BDE9050];
          v223[1] = v135;
          v136 = *MEMORY[0x24BDE9030];
          v224[0] = *MEMORY[0x24BDE9080];
          v224[1] = v136;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v133, (uint64_t)v224, v223, 2);
          v196 = (CFDictionaryRef)objc_claimAutoreleasedReturnValue();
          v137 = SecKeyCreateWithData(v134, v196, v225);
          CFRelease(v134);
          if (!v137)
          {
            cc_clear();
            if (a4)
            {
              objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v155, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 1, CFSTR("cannot create key"));
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            sub_20D67C0DC();
            v156 = objc_claimAutoreleasedReturnValue();
            v157 = os_log_type_enabled(v156, OS_LOG_TYPE_ERROR);
            v116 = v202;
            if (v157)
              sub_20D696C18((uint64_t *)v225, v156, v158);

            v62 = v212;
            v61 = v213;
            v63 = v211;
            if (v225[0])
            {
              CFRelease(v225[0]);
              v9 = 0;
              v225[0] = 0;
            }
            else
            {
              v9 = 0;
            }
            goto LABEL_104;
          }
          v195 = v137;
          if (v225[0])
          {
            CFRelease(v225[0]);
            v225[0] = 0;
          }
          v140 = objc_msgSend_ckvr(self, v138, v139, v195);
          v141 = v200;
          v144 = objc_msgSend_length(v200, v142, v143);
          v145 = objc_retainAutorelease(v141);
          v148 = objc_msgSend_bytes(v145, v146, v147);
          v149 = (uint64_t)v201;
          if (sub_20D68DD58(v140, (unint64_t)v216, (uint64_t)v210, v204, (uint64_t)v203, v144, v148, v208, (uint64_t)v209, v206, (uint64_t)v207, v126, (uint64_t)v201, (uint64_t)v227))
          {
            cc_clear();
            CFRelease(v195);
            if (a4)
            {
              objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v151, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 125, CFSTR("Escrow error encrypting data (spare)"));
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            sub_20D67C0DC();
            v152 = objc_claimAutoreleasedReturnValue();
            v153 = os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT);
            v116 = v202;
            if (v153)
            {
              v219[0] = 0;
              _os_log_impl(&dword_20D67A000, v152, OS_LOG_TYPE_DEFAULT, "Escrow error encrypting data (spare)", (uint8_t *)v219, 2u);
            }

            v9 = 0;
            v62 = v212;
            v61 = v213;
            v63 = v211;
            goto LABEL_104;
          }
          v159 = v16;
          objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCEC8], v150, v149, v214);
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          v163 = objc_msgSend_length(v160, v161, v162);
          v164 = objc_retainAutorelease(v160);
          v167 = objc_msgSend_mutableBytes(v164, v165, v166);
          if (sub_20D68E2E0(v163, v167))
          {

            v168 = v195;
            goto LABEL_84;
          }
          v168 = v195;
          if (!v164)
          {
LABEL_84:
            cc_clear();
            CFRelease(v168);
            if (a4)
            {
              objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v169, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 102, CFSTR("Local SRP verify failed"));
              v9 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v9 = 0;
            }
            goto LABEL_103;
          }
          v170 = [SESWrapper alloc];
          v172 = (void *)objc_msgSend_initWithDSID_escrowRecordContents_recoveryPassphrase_recordID_recordLabel_reqVersion_(v170, v171, 0, 0, 0, 0, 0, 0);
          objc_msgSend_setRecoveryBlob_(v172, v173, (uint64_t)v164);
          objc_msgSend_srpInitBlob(self, v174, v175);
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          v216 = v172;
          v209 = v176;
          objc_msgSend_srpResponseForEscrowBlob_withKey_withFullCCKey_(v172, v177, (uint64_t)v176, v168, v226);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          v218 = 0;
          v208 = v178;
          objc_msgSend_srpRecoveryBlobFromData_error_(self, v179, (uint64_t)v178, &v218);
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          v210 = v218;
          cc_clear();
          CFRelease(v168);
          v214 = v180;
          if (v180)
          {
            objc_msgSend_recoveryResponseForBlob_(v216, v181, (uint64_t)v214);
            v182 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_decodedEscrowRecordFromData_stingray_env_duplicate_(self, v183, (uint64_t)v182, 0, 0, 0);
            v184 = objc_claimAutoreleasedReturnValue();
            objc_msgSend_escrowRecord(self, v185, v186);
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            isEqual = objc_msgSend_isEqual_(v184, v188, (uint64_t)v187);

            if ((isEqual & 1) != 0)
            {
              v9 = (id)v202;
LABEL_102:

              v13 = v215;
LABEL_103:
              v16 = v159;
              v62 = v212;
              v61 = v213;
              v63 = v211;
              v116 = v202;
LABEL_104:

              goto LABEL_52;
            }
            if (a4)
            {
              objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v190, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 102, CFSTR("Local SRP verify failed"));
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            sub_20D67C0DC();
            v194 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
              sub_20D696CB0();

          }
          else
          {
            v182 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            objc_msgSend_setObject_forKeyedSubscript_(v182, v191, (uint64_t)v210, *MEMORY[0x24BDD1398]);
            objc_msgSend_setObject_forKeyedSubscript_(v182, v192, (uint64_t)CFSTR("could not create local SRP recovery blob"), *MEMORY[0x24BDD0FC8]);
            if (a4)
            {
              objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v193, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 102, v182);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            sub_20D67C0DC();
            v184 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
              sub_20D696C84();
          }
          v9 = 0;
          goto LABEL_102;
        }
        sub_20D67C0DC();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_label(self, v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dsid(self, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v226[0] = 138412546;
          *(_QWORD *)&v226[1] = v76;
          LOWORD(v226[3]) = 2112;
          *(_QWORD *)((char *)&v226[3] + 2) = v79;
          _os_log_impl(&dword_20D67A000, v73, OS_LOG_TYPE_DEFAULT, "label missing for %@ (dsid %@)", (uint8_t *)v226, 0x16u);

        }
        v16 = v217;
        if (a4)
        {
          objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v80, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 4, CFSTR("label missing"));
          goto LABEL_29;
        }
      }
      else
      {
        sub_20D67C0DC();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_label(self, v66, v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dsid(self, v69, v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v226[0] = 138412546;
          *(_QWORD *)&v226[1] = v68;
          LOWORD(v226[3]) = 2112;
          *(_QWORD *)((char *)&v226[3] + 2) = v71;
          _os_log_impl(&dword_20D67A000, v65, OS_LOG_TYPE_DEFAULT, "username missing for %@ (dsid %@)", (uint8_t *)v226, 0x16u);

        }
        if (a4)
        {
          objc_msgSend_errorWithDomain_code_format_(CloudServicesError, v72, (uint64_t)CFSTR("EscrowServiceErrorDomain"), 4, CFSTR("Username missing"));
LABEL_29:
          v9 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_54:

          goto LABEL_55;
        }
      }
    }
    else
    {
      sub_20D67C0DC();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v64 = *a4;
        v226[0] = 138412290;
        *(_QWORD *)&v226[1] = v64;
        _os_log_impl(&dword_20D67A000, v16, OS_LOG_TYPE_DEFAULT, "error serializing escrow data: %@", (uint8_t *)v226, 0xCu);
      }
    }
    v9 = 0;
    goto LABEL_54;
  }
  sub_20D67C0DC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v226[0]) = 0;
    _os_log_impl(&dword_20D67A000, v8, OS_LOG_TYPE_DEFAULT, "SecKeyCopyPublicBytes failed", (uint8_t *)v226, 2u);
  }
  v9 = 0;
LABEL_55:

  return v9;
}

- (id)decodedEscrowRecordFromData:(id)a3 stingray:(BOOL)a4 env:(id)a5 duplicate:(BOOL)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  size_t v19;
  unint64_t v20;
  char *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const void *v25;
  const char *v26;
  uint64_t v27;
  size_t v28;
  const char *v29;
  uint64_t v30;
  unint64_t v31;
  unsigned int v32;
  const char *v33;
  uint64_t v34;
  unsigned int v35;
  int v36;
  unint64_t v37;
  const char *v38;
  NSObject *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  __int128 v45;
  const char *v46;
  uint64_t v47;
  id v48;
  const char *v49;
  const char *v50;
  __int128 *v51;
  __int128 v52;
  const char *v53;
  uint64_t v54;
  int v55;
  const char *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  const char *v61;
  NSObject *v62;
  uint64_t v64;
  void *v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  NSObject *v75;
  const char *v76;
  id v77;
  const char *v78;
  uint64_t v79;
  int v80;
  NSObject *v81;
  NSObject *v82;
  void *v83;
  id v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t *v94;
  NSObject *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  id v99;
  const char *v100;
  NSObject *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  id v106;
  const char *v107;
  void *v108;
  const char *v109;
  id v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  id v119;
  __int128 *v120;
  size_t v121;
  uint64_t *v122;
  const char *v123;
  unsigned int *v124;
  uint64_t *v125;
  uint64_t *v126;
  id v127;
  uint8_t v128[8];
  void *v129;
  id v130;
  size_t v131;
  size_t v132;
  size_t v133;
  _BYTE buf[12];
  uint64_t v135;

  v8 = a4;
  v135 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  if (!((unint64_t)objc_msgSend_length(v10, v12, v13) >> 32))
  {
    v19 = objc_msgSend_length(v10, v14, v15);
    v20 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
    v21 = (char *)&v118 - v20;
    if (v19)
      memset((char *)&v118 - v20, 170, v19);
    v22 = objc_retainAutorelease(v10);
    v25 = (const void *)objc_msgSend_bytes(v22, v23, v24);
    v28 = objc_msgSend_length(v22, v26, v27);
    memcpy(v21, v25, v28);
    v31 = objc_msgSend_length(v22, v29, v30);
    v32 = sub_20D68EF18(v31, (unsigned int *)v21);
    if (!v32)
    {
      sub_20D67C0DC();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_20D696CDC();
      goto LABEL_27;
    }
    v35 = v32;
    v36 = objc_msgSend_reqVersion(self, v33, v34);
    if (v36)
    {
      if (v36 == 2)
      {
        v37 = v35;
        if (!sub_20D68EDFC(v35, (uint64_t)v21))
          goto LABEL_25;
      }
      else
      {
        if (v36 != 1)
        {
          sub_20D67C0DC();
          v111 = (char *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v111, OS_LOG_TYPE_ERROR))
            sub_20D696D08(self, v111, v112);
          goto LABEL_62;
        }
        v37 = v35;
        if (!sub_20D68ECCC(v35, (uint64_t)v21))
          goto LABEL_25;
      }
    }
    else
    {
      v37 = v35;
      if (!sub_20D68E9EC(v35, (uint64_t)v21))
      {
LABEL_25:
        sub_20D67C0DC();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D67A000, v39, OS_LOG_TYPE_DEFAULT, "decodedEscrowRecordFromData: failed to convert", buf, 2u);
        }
LABEL_27:
        v18 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v38, (uint64_t)v21, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v40)
      goto LABEL_25;
    v126 = &v118;
    v39 = objc_retainAutorelease(v40);
    v124 = (unsigned int *)objc_msgSend_bytes(v39, v41, v42);
    v120 = (__int128 *)objc_msgSend_length(v39, v43, v44);
    v133 = 4096;
    v122 = &v118 - 512;
    memset(&v118 - 512, 170, 0x1000uLL);
    v132 = 128;
    v125 = &v118 - 16;
    *(_QWORD *)&v45 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v45 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v116 = v45;
    v117 = v45;
    v114 = v45;
    v115 = v45;
    *((_OWORD *)&v118 - 6) = v45;
    *((_OWORD *)&v118 - 5) = v45;
    *((_OWORD *)&v118 - 8) = v45;
    *((_OWORD *)&v118 - 7) = v45;
    objc_msgSend_recoveryPassphrase(self, v46, v47);
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v50 = (const char *)objc_msgSend_cStringUsingEncoding_(v48, v49, 4);

    v123 = v50;
    v121 = strlen(v50);
    v131 = 64;
    v51 = &v114;
    *(_QWORD *)&v52 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v52 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v116 = v52;
    v117 = v52;
    v114 = v52;
    v115 = v52;
    v55 = objc_msgSend_reqVersion(self, v53, v54);
    switch(v55)
    {
      case 0:
        v64 = objc_msgSend_ckvr(self, v56, v57);
        *((_QWORD *)&v117 + 1) = sub_20D692A98;
        v59 = v125;
        v60 = v122;
        if (sub_20D68C614(v64, v121, (int)v123, (uint64_t)v120, v124, &v133, v122, &v132, v125, &v131, &v114))
        {
          sub_20D67C0DC();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            goto LABEL_33;
          }
LABEL_34:
          v18 = 0;
LABEL_57:

          goto LABEL_28;
        }
LABEL_52:
        v96 = (uint64_t)v51;
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v61, (uint64_t)v60, v133);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = 0;
        objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x24BDD1770], v98, (uint64_t)v97, 0, 0, &v127);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v127;
        if (v18)
        {
          v99 = objc_alloc(MEMORY[0x24BDD17C8]);
          v101 = objc_msgSend_initWithBytes_length_encoding_(v99, v100, v96, v131, 4);
          objc_msgSend_secureBackupDate(v101, v102, v103);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setEscrowDate_(self, v105, (uint64_t)v104);

          v106 = objc_alloc(MEMORY[0x24BDD17C8]);
          v108 = (void *)objc_msgSend_initWithBytes_length_encoding_(v106, v107, (uint64_t)v59, v132, 4);
          objc_msgSend_setDecodedLabel_(self, v109, (uint64_t)v108);

          v110 = v18;
        }
        else
        {
          sub_20D67C0DC();
          v101 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v62;
            _os_log_impl(&dword_20D67A000, v101, OS_LOG_TYPE_DEFAULT, "Error deserializing data: %@", buf, 0xCu);
          }
        }

        goto LABEL_57;
      case 1:
        v120 = &v114;
        v65 = (void *)MEMORY[0x24BDBCE50];
        v66 = objc_retainAutorelease(v22);
        v69 = objc_msgSend_bytes(v66, v67, v68) + v37;
        v119 = v66;
        v72 = objc_msgSend_length(v66, v70, v71);
        objc_msgSend_dataWithBytes_length_(v65, v73, v69, v72 - v37);
        v74 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        v130 = 0;
        BYTE9(v116) = 1;
        BYTE8(v116) = a6;
        v75 = v74;
        LOBYTE(v69) = objc_msgSend_verifyCertData_withCert_withPubKey_stingray_enroll_altDSID_env_duplicate_sigVerification_error_(CertOperations, v76, v74, 0, buf, v8, 0, 0, v11, *((_QWORD *)&v116 + 1), &v130);
        v77 = v130;
        if ((v69 & 1) == 0)
        {
          if (*(_QWORD *)buf)
            CFRelease(*(CFTypeRef *)buf);
          sub_20D67C0DC();
          v82 = objc_claimAutoreleasedReturnValue();
          v62 = v75;
          if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            sub_20D696DB0();

          v18 = 0;
          goto LABEL_57;
        }
        v129 = 0;
        v80 = SecKeyCopyPublicBytes();
        if (*(_QWORD *)buf)
          CFRelease(*(CFTypeRef *)buf);
        if (v80)
        {
          sub_20D67C0DC();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
            sub_20D696D84();

          v18 = 0;
          v62 = v75;
          goto LABEL_57;
        }
        v83 = v129;
        v118 = objc_msgSend_ckvr(self, v78, v79);
        v84 = objc_retainAutorelease(v119);
        v119 = (id)objc_msgSend_bytes(v84, v85, v86);
        v89 = objc_msgSend_length(v83, v87, v88);
        v90 = objc_retainAutorelease(v83);
        v93 = objc_msgSend_bytes(v90, v91, v92);
        *((_QWORD *)&v117 + 1) = sub_20D692A98;
        *((_QWORD *)&v116 + 1) = v89;
        v59 = v125;
        v94 = v122;
        if (sub_20D68CBE0(v118, v121, (int)v123, v37, v124, v37, (int)v119, (int)&v133, v122, (uint64_t)&v132, (uint64_t)v125, (uint64_t)&v131, (uint64_t)v120, *((uint64_t *)&v116 + 1), v93))
        {
          sub_20D67C0DC();
          v95 = objc_claimAutoreleasedReturnValue();
          v62 = v75;
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v128 = 0;
            _os_log_impl(&dword_20D67A000, v95, OS_LOG_TYPE_DEFAULT, "Error decoding secret", v128, 2u);
          }

          goto LABEL_34;
        }

        v51 = v120;
        v60 = v94;
        goto LABEL_52;
      case 2:
        v58 = objc_msgSend_ckvr(self, v56, v57);
        *((_QWORD *)&v117 + 1) = sub_20D692A98;
        v59 = v125;
        v60 = v122;
        if (sub_20D68D154(v58, v121, (int)v123, (uint64_t)v120, v124, &v133, v122, &v132, v125, &v131, &v114))
        {
          sub_20D67C0DC();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
LABEL_33:
            _os_log_impl(&dword_20D67A000, v62, OS_LOG_TYPE_DEFAULT, "Error decoding secret", buf, 2u);
            goto LABEL_34;
          }
          goto LABEL_34;
        }
        goto LABEL_52;
    }
    sub_20D67C0DC();
    v111 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v111, OS_LOG_TYPE_ERROR))
      sub_20D696D08(self, v111, v113);
LABEL_62:

    abort();
  }
  sub_20D67C0DC();
  v16 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    sub_20D696A04(v10, v16, v17);

  v18 = 0;
LABEL_29:

  return v18;
}

- (id)srpResponseForEscrowBlob:(id)a3 withKey:(__SecKey *)a4 withFullCCKey:(ccrsa_full_ctx *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  unsigned int *v19;
  NSObject *v20;
  id v21;
  const char *v22;
  void *v23;
  const char *v24;
  _BOOL8 v25;
  size_t v26;
  size_t v27;
  size_t v28;
  size_t v29;
  size_t v30;
  size_t v31;
  uint64_t v32;
  char *v33;
  size_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  char *v38;
  void *v39;
  char *v40;
  void *v41;
  char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  id v52;
  const char *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  uint64_t v58;
  size_t v59;
  uint64_t v60;
  char *v61;
  id v62;
  const char *v63;
  uint64_t v64;
  unint64_t v65;
  size_t v66;
  unint64_t v67;
  size_t v68;
  size_t v69;
  size_t v70;
  size_t v71;
  size_t v72;
  unint64_t v73;
  int8x16_t v74[256];
  _QWORD v75[2];
  __int128 v76;
  uint64_t v77;

  v5 = MEMORY[0x24BDAC7A8](self);
  v7 = v6;
  v8 = (void *)v5;
  v77 = *MEMORY[0x24BDAC8D0];
  v10 = v9;
  v73 = 4096;
  memset(v74, 170, sizeof(v74));
  v13 = objc_msgSend_ckvr(v8, v11, v12);
  objc_msgSend_recoveryBlob(v8, v14, v15);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = (unsigned int *)objc_msgSend_bytes(v16, v17, v18);
  LODWORD(v7) = sub_20D68E410(v13, v19, (uint64_t *)&v73, (uint64_t)v74, v7);

  if ((_DWORD)v7)
  {
    sub_20D67C0DC();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_20D696E6C();
LABEL_4:

LABEL_24:
    v56 = 0;
    goto LABEL_25;
  }
  v21 = objc_alloc(MEMORY[0x24BDBCE50]);
  v23 = (void *)objc_msgSend_initWithBytes_length_(v21, v22, (uint64_t)v74, v73);
  objc_msgSend_setEscrowBlob_(v8, v24, (uint64_t)v23);

  v25 = sub_20D68C9C0(v73, v74);
  if (!v25)
    goto LABEL_24;
  v64 = (uint64_t)&v64;
  v26 = *(unsigned int *)((char *)v74[3].u32 + v74[1].u32[1]);
  v27 = *(unsigned int *)((char *)v74[3].u32 + v74[2].u32[1]);
  v28 = *(unsigned int *)((char *)v74[3].u32 + v74[2].u32[2]);
  v71 = v27;
  v72 = v26;
  v29 = *(unsigned int *)((char *)v74[3].u32 + v74[1].u32[2]);
  v69 = v29;
  v70 = v28;
  v67 = 0xAAAAAAAAAAAAAAAALL;
  v30 = *(unsigned int *)((char *)v74[3].u32 + v74[1].u32[3]);
  v68 = v30;
  v31 = *(unsigned int *)((char *)v74[3].u32 + v74[2].u32[0]);
  v66 = v31;
  MEMORY[0x24BDAC7A8](v25);
  v33 = (char *)&v64 - v32;
  v35 = memset((char *)&v64 - v32, 170, v34);
  v36 = (void *)MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&v64 - v37;
  if ((_DWORD)v27)
    v36 = memset((char *)&v64 - v37, 170, v27);
  v39 = (void *)MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)&v64 - ((v28 + 15) & 0x1FFFFFFF0);
  if ((_DWORD)v28)
    v39 = memset((char *)&v64 - ((v28 + 15) & 0x1FFFFFFF0), 170, v28);
  v41 = (void *)MEMORY[0x24BDAC7A8](v39);
  v42 = (char *)&v64 - ((v29 + 15) & 0x1FFFFFFF0);
  if ((_DWORD)v29)
    v41 = memset((char *)&v64 - ((v29 + 15) & 0x1FFFFFFF0), 170, v29);
  v43 = (void *)MEMORY[0x24BDAC7A8](v41);
  if ((_DWORD)v30)
    v43 = memset((char *)&v64 - ((v30 + 15) & 0x1FFFFFFF0), 170, v30);
  MEMORY[0x24BDAC7A8](v43);
  if ((_DWORD)v31)
    memset((char *)&v64 - ((v31 + 15) & 0x1FFFFFFF0), 170, v31);
  if (sub_20D68E698((unsigned int *)v74, &v72, v33, &v71, v38, &v70, v40, &v69, v42, &v68, (char *)&v64 - ((v30 + 15) & 0x1FFFFFFF0), &v67, &v66, (char *)&v64 - ((v31 + 15) & 0x1FFFFFFF0)))
  {
    v33[v72] = 0;
    v46 = objc_msgSend_srpPublicKeySize(v8, v44, v45);
    v47 = MEMORY[0x24BDAC7A8](v46);
    v51 = (char *)&v64 - v50;
    if (v47)
      memset((char *)&v64 - v50, 170, v46);
    objc_msgSend_ckvr(v8, v48, v49);
    v52 = objc_retainAutorelease(v10);
    objc_msgSend_bytes(v52, v53, v54);
    if (!sub_20D68DFC8())
    {
      v76 = xmmword_20D6993C0;
      v75[0] = 0x706050403020100;
      *(_QWORD *)((char *)v75 + 6) = 0xD0C0B0A09080706;
      v65 = sub_20D68E9B4(0xEuLL, v69, v46);
      v58 = MEMORY[0x24BDAC7A8](v65);
      v61 = (char *)&v64 - v60;
      if (v58)
        memset((char *)&v64 - v60, 170, v59);
      if ((sub_20D68E7F4(16, &v76, 0xEu, (uint64_t)v75, v69, (uint64_t)v42, v46, (uint64_t)v51, (unsigned int *)&v65, (uint64_t)v61) & 1) != 0)
      {
        v62 = objc_alloc(MEMORY[0x24BDBCE50]);
        v56 = (void *)objc_msgSend_initWithBytes_length_(v62, v63, (uint64_t)v61, v65);
        goto LABEL_25;
      }
      sub_20D67C0DC();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_20D696E14();
      goto LABEL_4;
    }
    sub_20D67C0DC();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      sub_20D696E40();

  }
  v56 = 0;
LABEL_25:

  return v56;
}

- (id)recoveryResponseForBlob:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  uint64_t v14;
  int8x8_t *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const void *v19;
  const char *v20;
  uint64_t v21;
  size_t v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  size_t v36;
  uint64_t v37;
  void *v38;
  size_t v39;
  uint64_t v40;
  char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  unint64_t v60;
  const char *v61;
  uint64_t v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  const char *v68;
  void *v69;
  NSObject *v70;
  __int128 v72;
  unint64_t v73;
  id v74;
  unint64_t *v75;
  uint64_t v76;
  size_t v77;
  size_t v78;
  _QWORD v79[2];

  v79[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7 = objc_msgSend_srpKeySize(self, v5, v6);
  if (v7)
  {
    v10 = v7;
    v11 = objc_msgSend_length(v4, v8, v9);
    v12 = MEMORY[0x24BDAC7A8](v11);
    v15 = (int8x8_t *)((char *)&v73 - v14);
    if (v12)
      memset((char *)&v73 - v14, 170, v13);
    v16 = objc_retainAutorelease(v4);
    v19 = (const void *)objc_msgSend_bytes(v16, v17, v18);
    v22 = objc_msgSend_length(v16, v20, v21);
    memcpy(v15, v19, v22);
    v25 = objc_msgSend_length(v16, v23, v24);
    if (sub_20D68EAFC(v25, v15))
    {
      v28 = (void *)MEMORY[0x24BDBCE50];
      v29 = objc_msgSend_length(v16, v26, v27);
      objc_msgSend_dataWithBytes_length_(v28, v30, (uint64_t)v15, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v75 = &v73;
        v74 = objc_retainAutorelease(v31);
        v34 = objc_msgSend_bytes(v74, v32, v33);
        v79[0] = 16;
        v35 = *(unsigned int *)(v34 + 32);
        v78 = *(unsigned int *)(v34 + 40 + *(unsigned int *)(v34 + 28));
        v36 = *(unsigned int *)(v34 + 40 + v35);
        v77 = v36;
        v37 = MEMORY[0x24BDAC7A8](v34);
        *(_QWORD *)&v72 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v72 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v38 = (void *)MEMORY[0x24BDAC7A8](v37);
        v41 = (char *)&v73 - v40;
        if ((_DWORD)v39)
          v38 = memset((char *)&v73 - v40, 170, v39);
        MEMORY[0x24BDAC7A8](v38);
        v42 = memset((char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v10);
        MEMORY[0x24BDAC7A8](v42);
        if ((_DWORD)v36)
          memset((char *)&v73 - ((v36 + 15) & 0x1FFFFFFF0), 170, v36);
        if ((sub_20D68EC20(v34, &v78, v41, v79, &v72, &v77, (char *)&v73 - ((v36 + 15) & 0x1FFFFFFF0)) & 1) != 0)
        {
          objc_msgSend_ckvr(self, v43, v44);
          v45 = sub_20D68DFF0();
          if ((_DWORD)v45)
          {
            v76 = 4096;
            MEMORY[0x24BDAC7A8](v45);
            memset(&v73 - 512, 170, 0x1000uLL);
            v73 = objc_msgSend_ckvr(self, v46, v47);
            v50 = objc_msgSend_srpKeySize(self, v48, v49);
            v53 = objc_msgSend_ckvr(self, v51, v52);
            v54 = sub_20D68B4C0(v53);
            objc_msgSend_escrowBlob(self, v55, v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend_length(v57, v58, v59);
            objc_msgSend_escrowBlob(self, v61, v62);
            v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v66 = objc_msgSend_bytes(v63, v64, v65);
            *((_QWORD *)&v72 + 1) = sub_20D692A98;
            LODWORD(v60) = sub_20D68E008(v73, v50, v54, v10, (uint64_t)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v60, v66, &v76, (uint64_t)(&v73 - 512));

            if (!(_DWORD)v60)
            {
              v67 = objc_alloc(MEMORY[0x24BDBCE50]);
              v69 = (void *)objc_msgSend_initWithBytes_length_(v67, v68, (uint64_t)(&v73 - 512), v76);
LABEL_22:

              goto LABEL_23;
            }
LABEL_21:
            v69 = 0;
            goto LABEL_22;
          }
          sub_20D67C0DC();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            sub_20D696E98();
        }
        else
        {
          sub_20D67C0DC();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            sub_20D696EC4();
        }

        goto LABEL_21;
      }
    }
    v69 = 0;
  }
  else
  {
    v69 = 0;
  }
LABEL_23:

  return v69;
}

- (void)dealloc
{
  ckvr_srp_context *ckvr;
  objc_super v4;

  ckvr = self->_ckvr;
  if (ckvr)
  {
    sub_20D68B3B8((uint64_t)ckvr);
    free(self->_ckvr);
  }
  v4.receiver = self;
  v4.super_class = (Class)SESWrapper;
  -[SESWrapper dealloc](&v4, sel_dealloc);
}

- (NSString)decodedLabel
{
  return self->_decodedLabel;
}

- (void)setDecodedLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)escrowDate
{
  return self->_escrowDate;
}

- (void)setEscrowDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)recoveryBlob
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecoveryBlob:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)reqVersion
{
  return self->_reqVersion;
}

- (ckvr_srp_context)ckvr
{
  return self->_ckvr;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)recoveryPassphrase
{
  return self->_recoveryPassphrase;
}

- (void)setRecoveryPassphrase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)recoveryPassphraseMutable
{
  return self->_recoveryPassphraseMutable;
}

- (void)setRecoveryPassphraseMutable:(BOOL)a3
{
  self->_recoveryPassphraseMutable = a3;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (NSDictionary)escrowRecord
{
  return self->_escrowRecord;
}

- (NSData)escrowBlob
{
  return self->_escrowBlob;
}

- (void)setEscrowBlob:(id)a3
{
  objc_storeStrong((id *)&self->_escrowBlob, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_escrowBlob, 0);
  objc_storeStrong((id *)&self->_escrowRecord, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_recoveryPassphrase, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_recoveryBlob, 0);
  objc_storeStrong((id *)&self->_escrowDate, 0);
  objc_storeStrong((id *)&self->_decodedLabel, 0);
}

@end
