@implementation PCCWrappedKey

- (PCCWrappedKey)initWithKey:(id)a3 permittedRemoteMeasurement:(id)a4 attestation:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  PCCWrappedKey *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  void *v46;
  id v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  id v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  id v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  char v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  id v91;
  const char *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  unint64_t v96;
  size_t v97;
  id v98;
  const char *v99;
  uint64_t v100;
  const void *v101;
  const char *v102;
  void *v103;
  void *v104;
  unsigned __int16 v105;
  id v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  int v113;
  int v114;
  int v115;
  const char *v116;
  uint64_t v117;
  double v118;
  int v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  NSData *routingToken;
  PCCWrappedKey *v124;
  uint64_t v126;
  void *v127;
  void *v128;
  id v129;
  id v130;
  char v131;
  id v132;
  PCCWrappedKey *v133;
  void *v134;
  void *v135;
  id v136;
  char *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142[6];
  objc_super v143;
  _OWORD v144[9];
  uint64_t v145;
  _OWORD v146[8];
  char v147;
  _OWORD v148[2];
  void *v149;
  uint64_t v150;
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v143.receiver = self;
  v143.super_class = (Class)PCCWrappedKey;
  v13 = -[PCCWrappedKey init](&v143, sel_init);
  if (!v13)
    goto LABEL_29;
  if (v10)
  {
    v14 = (void *)MEMORY[0x1E0C99DF0];
    objc_msgSend_applicationEnclaveQuote(v10, v11, v12);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend_bytes(v15, v16, v17);
    objc_msgSend_applicationEnclaveQuote(v10, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_length(v21, v22, v23);
    objc_msgSend_dataWithBytes_length_(v14, v25, v18, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_retainAutorelease(v26);
    v142[0] = objc_msgSend_mutableBytes(v27, v28, v29);
    v142[1] = objc_msgSend_length(v27, v30, v31);
    v32 = (void *)MEMORY[0x1E0C99DF0];
    objc_msgSend_quotingEnclaveQuote(v10, v33, v34);
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v38 = objc_msgSend_bytes(v35, v36, v37);
    objc_msgSend_quotingEnclaveQuote(v10, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend_length(v41, v42, v43);
    objc_msgSend_dataWithBytes_length_(v32, v45, v38, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = objc_retainAutorelease(v46);
    v142[2] = objc_msgSend_mutableBytes(v47, v48, v49);
    v135 = v47;
    v142[3] = objc_msgSend_length(v47, v50, v51);
    v52 = (void *)MEMORY[0x1E0C99DF0];
    objc_msgSend_certificate(v10, v53, v54);
    v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v57 = objc_msgSend_cStringUsingEncoding_(v55, v56, 4);
    objc_msgSend_certificate(v10, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend_lengthOfBytesUsingEncoding_(v60, v61, 4);
    objc_msgSend_dataWithBytes_length_(v52, v63, v57, v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = objc_retainAutorelease(v64);
    v142[4] = objc_msgSend_mutableBytes(v65, v66, v67);
    v142[5] = objc_msgSend_length(v65, v68, v69);
    objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringArrayForKey_(v72, v73, (uint64_t)CFSTR("PCCPinnedVerificationHashes"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend_BOOLForKey_(v72, v75, (uint64_t)CFSTR("PCCPinnedVerificationDisabled"));
    v136 = v9;
    if (objc_msgSend_count(v74, v77, v78))
    {
      v81 = objc_msgSend_count(v74, v79, v80);
      v137 = (char *)malloc_type_calloc(0x20uLL, (unsigned __int16)v81, 0xAC995C02uLL);
      if (!v137)
        goto LABEL_25;
      v126 = v81;
      v127 = v74;
      v131 = v76;
      v128 = v72;
      v129 = v65;
      v132 = v27;
      v133 = v13;
      v130 = v10;
      v134 = v8;
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v82 = v74;
      v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v83, (uint64_t)&v138, v151, 16);
      if (v84)
      {
        v85 = v84;
        v86 = 0;
        v87 = *(_QWORD *)v139;
        do
        {
          v88 = 0;
          v89 = &v137[32 * v86];
          do
          {
            if (*(_QWORD *)v139 != v87)
              objc_enumerationMutation(v82);
            v90 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * v88);
            v91 = objc_alloc(MEMORY[0x1E0C99D50]);
            v93 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v91, v92, v90, 1);
            v96 = objc_msgSend_length(v93, v94, v95);
            if (v96 >= 0x20)
              v97 = 32;
            else
              v97 = v96;
            v98 = objc_retainAutorelease(v93);
            v101 = (const void *)objc_msgSend_bytes(v98, v99, v100);
            memcpy(v89, v101, v97);

            ++v88;
            v89 += 32;
          }
          while (v85 != v88);
          v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v102, (uint64_t)&v138, v151, 16);
          v86 += v88;
        }
        while (v85);
      }

      v103 = v136;
      v104 = v137;
      v65 = v129;
      v10 = v130;
      v74 = v127;
      v72 = v128;
      v105 = v126;
    }
    else
    {
      v131 = v76;
      v103 = v9;
      v133 = v13;
      v134 = v8;
      v132 = v27;
      v105 = 482;
      v104 = &unk_1EF571CC0;
    }
    v106 = objc_retainAutorelease(v103);
    v111 = objc_msgSend_bytes(v106, v107, v108);
    v112 = 0;
    memset(v148, 0, sizeof(v148));
    v149 = v104;
    v150 = v105;
    BYTE2(v150) = v131;
    do
    {
      if (v112 >= objc_msgSend_length(v106, v109, v110, v126, v127, v128, v129, v130))
        break;
      *((_BYTE *)v148 + v112) = *(_BYTE *)(v111 + v112);
      ++v112;
    }
    while (v112 != 32);
    v147 = 0;
    memset(v146, 0, sizeof(v146));
    sub_1BEC8B10C(v142, (uint64_t)v148, (uint64_t)v146);
    v114 = v113;
    if (v104 != &unk_1EF571CC0)
      free(v104);
    v27 = v132;
    v13 = v133;
    v8 = v134;
    if (v114)
    {
      v115 = 1;
      v9 = v136;
      goto LABEL_27;
    }
    v145 = 0;
    memset(v144, 0, sizeof(v144));
    *(_QWORD *)&v118 = sub_1BEC8ABE0((uint64_t)v146, (uint64_t)v144).n128_u64[0];
    v9 = v136;
    if (!v119)
    {
      objc_msgSend_secret(v134, v116, v117, v118);
      v133->_wrappedInvocationKey = (pcc_wrapped_invocation_key *)sub_1BEC8AB34();
      objc_msgSend_routingToken(v10, v120, v121);
      v122 = objc_claimAutoreleasedReturnValue();
      routingToken = v133->_routingToken;
      v133->_routingToken = (NSData *)v122;

      sub_1BEC8AE18((uint64_t)v144);
      v115 = 0;
LABEL_27:

      if (v115)
        goto LABEL_28;
LABEL_29:
      v124 = v13;
      goto LABEL_30;
    }
LABEL_25:
    v115 = 1;
    goto LABEL_27;
  }
LABEL_28:
  v124 = 0;
LABEL_30:

  return v124;
}

- (id)data
{
  return (id)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], a2, (uint64_t)self->_wrappedInvocationKey->var0, self->_wrappedInvocationKey->var1, 0);
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_clear(self, a2, v2);
  free(self->_wrappedInvocationKey);
  v4.receiver = self;
  v4.super_class = (Class)PCCWrappedKey;
  -[PCCWrappedKey dealloc](&v4, sel_dealloc);
}

- (pcc_wrapped_invocation_key)wrappedInvocationKey
{
  return self->_wrappedInvocationKey;
}

- (void)setWrappedInvocationKey:(pcc_wrapped_invocation_key *)a3
{
  self->_wrappedInvocationKey = a3;
}

- (NSData)routingToken
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRoutingToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingToken, 0);
}

@end
