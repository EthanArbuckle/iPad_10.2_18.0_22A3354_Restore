@implementation IDSAPSUserPayload

- (IDSAPSUserPayload)initWithBlastDoorObject:(id)a3
{
  id v4;
  const char *v5;
  IDSAPSUserPayload *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  int v12;
  const char *v13;
  double v14;
  uint64_t v15;
  NSMutableDictionary *payload;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IDSAPSUserPayload;
  v6 = -[IDSAPSUserPayload init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend_valueForKey_(v4, v5, (uint64_t)CFSTR("command"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_intValue(v8, v9, v10, v11);

    if (v12 == 97)
    {
      objc_msgSend_extractCommandWebTunnelResponseFrom_(v6, v13, (uint64_t)v4, v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12 == 255)
        objc_msgSend_extractCommandResponseFrom_(v6, v13, (uint64_t)v4, v14);
      else
        objc_msgSend_extractMadridProtocolPayloadFrom_(v6, v13, (uint64_t)v4, v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    payload = v6->_payload;
    v6->_payload = (NSMutableDictionary *)v15;

  }
  return v6;
}

- (id)extractCommandResponseFrom:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  const char *v36;
  uint64_t v37;
  double v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  const char *v46;
  uint64_t v47;
  double v48;
  void *v49;
  uint64_t v50;
  const char *v51;
  double v52;
  void *v53;
  const char *v54;
  double v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  void *v60;
  const char *v61;
  double v62;
  const char *v63;
  uint64_t v64;
  double v65;
  void *v66;
  uint64_t v67;
  const char *v68;
  double v69;
  void *v70;
  const char *v71;
  double v72;
  const char *v73;
  uint64_t v74;
  double v75;
  void *v76;
  uint64_t v77;
  const char *v78;
  double v79;
  void *v80;
  const char *v81;
  double v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  double v86;
  void *v87;
  const char *v88;
  double v89;
  const char *v90;
  uint64_t v91;
  double v92;
  void *v93;
  uint64_t v94;
  const char *v95;
  double v96;
  void *v97;
  const char *v98;
  double v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  double v103;
  void *v104;
  const char *v105;
  double v106;
  const char *v107;
  uint64_t v108;
  double v109;
  void *v110;
  uint64_t v111;
  const char *v112;
  double v113;
  void *v114;
  const char *v115;
  double v116;
  const char *v117;
  uint64_t v118;
  double v119;
  void *v120;
  uint64_t v121;
  const char *v122;
  double v123;
  void *v124;
  const char *v125;
  double v126;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend_command(v5, v7, v8, v9);
  objc_msgSend_numberWithInteger_(v6, v11, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v4, v14, (uint64_t)v13, v15, CFSTR("c"));

  if (objc_msgSend_has_messageId(v5, v16, v17, v18))
  {
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v23 = objc_msgSend_messageId(v5, v19, v20, v21);
    objc_msgSend_numberWithLongLong_(v22, v24, v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v27, (uint64_t)v26, v28, CFSTR("i"));

  }
  objc_msgSend_messageUUID(v5, v19, v20, v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_messageUUID(v5, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v34, (uint64_t)v33, v35, CFSTR("U"));

  }
  if (objc_msgSend_has_responseStatus(v5, v30, v31, v32))
  {
    v39 = (void *)MEMORY[0x1E0CB37E8];
    v40 = objc_msgSend_responseStatus(v5, v36, v37, v38);
    objc_msgSend_numberWithInteger_(v39, v41, v40, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v44, (uint64_t)v43, v45, CFSTR("s"));

  }
  if (objc_msgSend_has_failReason(v5, v36, v37, v38))
  {
    v49 = (void *)MEMORY[0x1E0CB37E8];
    v50 = objc_msgSend_failReason(v5, v46, v47, v48);
    objc_msgSend_numberWithInteger_(v49, v51, v50, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v54, (uint64_t)v53, v55, CFSTR("fR"));

  }
  objc_msgSend_token(v5, v46, v47, v48);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    objc_msgSend_token(v5, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v61, (uint64_t)v60, v62, CFSTR("t"));

  }
  if (objc_msgSend_has_internalBuild(v5, v57, v58, v59))
  {
    v66 = (void *)MEMORY[0x1E0CB37E8];
    v67 = objc_msgSend_internalBuild(v5, v63, v64, v65);
    objc_msgSend_numberWithBool_(v66, v68, v67, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v71, (uint64_t)v70, v72, CFSTR("x-internal"));

  }
  if (objc_msgSend_has_loggingProfile(v5, v63, v64, v65))
  {
    v76 = (void *)MEMORY[0x1E0CB37E8];
    v77 = objc_msgSend_loggingProfile(v5, v73, v74, v75);
    objc_msgSend_numberWithBool_(v76, v78, v77, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v81, (uint64_t)v80, v82, CFSTR("x-logging"));

  }
  objc_msgSend_applicationId(v5, v73, v74, v75);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    objc_msgSend_applicationId(v5, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v88, (uint64_t)v87, v89, CFSTR("qai"));

  }
  if (objc_msgSend_has_requestType(v5, v84, v85, v86))
  {
    v93 = (void *)MEMORY[0x1E0CB37E8];
    v94 = objc_msgSend_requestType(v5, v90, v91, v92);
    objc_msgSend_numberWithInteger_(v93, v95, v94, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v98, (uint64_t)v97, v99, CFSTR("qat"));

  }
  objc_msgSend_idsSessionId(v5, v90, v91, v92);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
  {
    objc_msgSend_idsSessionId(v5, v101, v102, v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v105, (uint64_t)v104, v106, CFSTR("qids"));

  }
  if (objc_msgSend_has_sharedSession(v5, v101, v102, v103))
  {
    v110 = (void *)MEMORY[0x1E0CB37E8];
    v111 = objc_msgSend_sharedSession(v5, v107, v108, v109);
    objc_msgSend_numberWithBool_(v110, v112, v111, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v115, (uint64_t)v114, v116, CFSTR("qrss"));

  }
  if (objc_msgSend_has_protocolVersion(v5, v107, v108, v109))
  {
    v120 = (void *)MEMORY[0x1E0CB37E8];
    v121 = objc_msgSend_protocolVersion(v5, v117, v118, v119);
    objc_msgSend_numberWithInteger_(v120, v122, v121, v123);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v125, (uint64_t)v124, v126, CFSTR("qv"));

  }
  return v4;
}

- (id)extractCommandWebTunnelResponseFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  const char *v37;
  uint64_t v38;
  double v39;
  void *v40;
  uint64_t v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  void *v51;
  const char *v52;
  double v53;
  const char *v54;
  uint64_t v55;
  double v56;
  void *v57;
  uint64_t v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  void *v68;
  const char *v69;
  double v70;
  void *v71;
  const char *v72;
  double v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  double v77;
  void *v78;
  const char *v79;
  double v80;
  const char *v81;
  uint64_t v82;
  double v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  double v87;
  void *v88;
  const char *v89;
  double v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  double v94;
  void *v95;
  const char *v96;
  double v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  double v101;
  void *v102;
  const char *v103;
  double v104;
  const char *v105;
  uint64_t v106;
  double v107;
  void *v108;
  uint64_t v109;
  const char *v110;
  double v111;
  void *v112;
  const char *v113;
  double v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  double v118;
  void *v119;
  const char *v120;
  double v121;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v4;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend_command(v6, v8, v9, v10);
  objc_msgSend_numberWithInteger_(v7, v12, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, v16, CFSTR("c"));

  if (objc_msgSend_has_messageId(v6, v17, v18, v19))
  {
    v23 = (void *)MEMORY[0x1E0CB37E8];
    v24 = objc_msgSend_messageId(v6, v20, v21, v22);
    objc_msgSend_numberWithInteger_(v23, v25, v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v28, (uint64_t)v27, v29, CFSTR("i"));

  }
  objc_msgSend_messageUUID(v6, v20, v21, v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend_messageUUID(v6, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v35, (uint64_t)v34, v36, CFSTR("U"));

  }
  if (objc_msgSend_has_responseStatus(v6, v31, v32, v33))
  {
    v40 = (void *)MEMORY[0x1E0CB37E8];
    v41 = objc_msgSend_responseStatus(v6, v37, v38, v39);
    objc_msgSend_numberWithInteger_(v40, v42, v41, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v45, (uint64_t)v44, v46, CFSTR("s"));

  }
  objc_msgSend_contentType(v6, v37, v38, v39);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend_contentType(v6, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v52, (uint64_t)v51, v53, CFSTR("cT"));

  }
  if (objc_msgSend_has_epochTimeNanos(v6, v48, v49, v50))
  {
    v57 = (void *)MEMORY[0x1E0CB37E8];
    v58 = objc_msgSend_epochTimeNanos(v6, v54, v55, v56);
    objc_msgSend_numberWithLongLong_(v57, v59, v58, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v62, (uint64_t)v61, v63, CFSTR("e"));

  }
  objc_msgSend_httpUrl(v6, v54, v55, v56);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_msgSend_httpUrl(v6, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v69, (uint64_t)v68, v70, CFSTR("u"));

  }
  objc_msgSend_httpHeaders(v6, v65, v66, v67);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extractMadridHttpHeadersFrom_(self, v72, (uint64_t)v71, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v74;
  if (v74 && objc_msgSend_count(v74, v75, v76, v77))
    objc_msgSend_setObject_forKey_(v5, v79, (uint64_t)v78, v80, CFSTR("h"));

  objc_msgSend_httpBody(v6, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    objc_msgSend_httpBody(v6, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v89, (uint64_t)v88, v90, CFSTR("b"));

  }
  objc_msgSend_httpBodyUrl(v6, v85, v86, v87);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (v91)
  {
    objc_msgSend_httpBodyUrl(v6, v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v96, (uint64_t)v95, v97, CFSTR("bu"));

  }
  objc_msgSend_httpBodyKey(v6, v92, v93, v94);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (v98)
  {
    objc_msgSend_httpBodyKey(v6, v99, v100, v101);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v103, (uint64_t)v102, v104, CFSTR("bk"));

  }
  if (objc_msgSend_has_httpResponseStatus(v6, v99, v100, v101))
  {
    v108 = (void *)MEMORY[0x1E0CB37E8];
    v109 = objc_msgSend_httpResponseStatus(v6, v105, v106, v107);
    objc_msgSend_numberWithInteger_(v108, v110, v109, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v113, (uint64_t)v112, v114, CFSTR("hs"));

  }
  objc_msgSend_httpErrorMsg(v6, v105, v106, v107);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v115)
  {
    objc_msgSend_httpErrorMsg(v6, v116, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v120, (uint64_t)v119, v121, CFSTR("hr"));

  }
  return v5;
}

- (id)extractMadridHttpHeadersFrom:(id)a3
{
  id v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  void *v48;
  const char *v49;
  double v50;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v3;
  objc_msgSend_adhocServiceOverride(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_adhocServiceOverride(v5, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v14, (uint64_t)v13, v15, CFSTR("aS"));

  }
  objc_msgSend_responseIdentifierString(v5, v10, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_responseIdentifierString(v5, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v21, (uint64_t)v20, v22, CFSTR("ri"));

  }
  objc_msgSend_strictTransportSecurity(v5, v17, v18, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_strictTransportSecurity(v5, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v28, (uint64_t)v27, v29, CFSTR("strict-transport-security"));

  }
  objc_msgSend_traceId(v5, v24, v25, v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend_traceId(v5, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v35, (uint64_t)v34, v36, CFSTR("x-b3-traceid"));

  }
  objc_msgSend_splunkHint(v5, v31, v32, v33);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend_splunkHint(v5, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v42, (uint64_t)v41, v43, CFSTR("sh"));

  }
  objc_msgSend_asHttpHeader(v5, v38, v39, v40);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend_asHttpHeader(v5, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v49, (uint64_t)v48, v50, CFSTR("as"));

  }
  return v4;
}

- (id)extractMadridDeliveryContextFrom:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_count(v3, v5, v6, v7))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = objc_msgSend_count(v3, v8, v9, v10);
    objc_msgSend_numberWithUnsignedInteger_(v11, v13, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v16, (uint64_t)v15, v17, CFSTR("c"));

  }
  return v4;
}

- (id)extractQuickRelayAllocationStatusFrom:(id)a3
{
  id v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  void *v40;
  const char *v41;
  double v42;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v3;
  if (objc_msgSend_has_participantId(v5, v6, v7, v8))
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = objc_msgSend_participantId(v5, v9, v10, v11);
    objc_msgSend_numberWithUnsignedLongLong_(v12, v14, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v17, (uint64_t)v16, v18, CFSTR("qri"));

  }
  if (objc_msgSend_has_allocationStatus(v5, v9, v10, v11))
  {
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v23 = objc_msgSend_allocationStatus(v5, v19, v20, v21);
    objc_msgSend_numberWithInteger_(v22, v24, v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v27, (uint64_t)v26, v28, CFSTR("qrs"));

  }
  objc_msgSend_token(v5, v19, v20, v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_token(v5, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v34, (uint64_t)v33, v35, CFSTR("t"));

  }
  objc_msgSend_destinationId(v5, v30, v31, v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend_destinationId(v5, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v41, (uint64_t)v40, v42, CFSTR("tP"));

  }
  return v4;
}

- (id)extractQuickRelaySelfAllocTokenFrom:(id)a3
{
  id v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  void *v51;
  const char *v52;
  double v53;
  const char *v54;
  uint64_t v55;
  double v56;
  void *v57;
  uint64_t v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v3;
  objc_msgSend_relayIp(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_relayIp(v5, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v14, (uint64_t)v13, v15, CFSTR("qrip"));

  }
  objc_msgSend_relayIpv6(v5, v10, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_relayIpv6(v5, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v21, (uint64_t)v20, v22, CFSTR("qrip6"));

  }
  if (objc_msgSend_has_relayPort(v5, v17, v18, v19))
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    v27 = objc_msgSend_relayPort(v5, v23, v24, v25);
    objc_msgSend_numberWithInteger_(v26, v28, v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v31, (uint64_t)v30, v32, CFSTR("qrp"));

  }
  objc_msgSend_relaySessionKey(v5, v23, v24, v25);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend_relaySessionKey(v5, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v38, (uint64_t)v37, v39, CFSTR("qrsk"));

  }
  objc_msgSend_relaySessionId(v5, v34, v35, v36);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend_relaySessionId(v5, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v45, (uint64_t)v44, v46, CFSTR("qrsi"));

  }
  objc_msgSend_relayAccessToken(v5, v41, v42, v43);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend_relayAccessToken(v5, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v52, (uint64_t)v51, v53, CFSTR("qrst"));

  }
  if (objc_msgSend_has_relayProvider(v5, v48, v49, v50))
  {
    v57 = (void *)MEMORY[0x1E0CB37E8];
    v58 = objc_msgSend_relayProvider(v5, v54, v55, v56);
    objc_msgSend_numberWithInteger_(v57, v59, v58, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v4, v62, (uint64_t)v61, v63, CFSTR("qrpr"));

  }
  return v4;
}

- (id)extractMadridProtocolPayloadFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  const char *v30;
  uint64_t v31;
  double v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  void *v51;
  const char *v52;
  double v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  double v57;
  void *v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  double v64;
  void *v65;
  const char *v66;
  double v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  double v71;
  void *v72;
  const char *v73;
  double v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  double v78;
  void *v79;
  const char *v80;
  double v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  double v85;
  void *v86;
  const char *v87;
  double v88;
  const char *v89;
  uint64_t v90;
  double v91;
  void *v92;
  void *v93;
  const char *v94;
  double v95;
  const char *v96;
  uint64_t v97;
  double v98;
  void *v99;
  uint64_t v100;
  const char *v101;
  double v102;
  void *v103;
  const char *v104;
  double v105;
  const char *v106;
  uint64_t v107;
  double v108;
  void *v109;
  const char *v110;
  double v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  double v115;
  const char *v116;
  double v117;
  const char *v118;
  uint64_t v119;
  double v120;
  void *v121;
  uint64_t v122;
  const char *v123;
  double v124;
  void *v125;
  const char *v126;
  double v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  double v131;
  void *v132;
  const char *v133;
  double v134;
  const char *v135;
  uint64_t v136;
  double v137;
  void *v138;
  uint64_t v139;
  const char *v140;
  double v141;
  void *v142;
  const char *v143;
  double v144;
  const char *v145;
  uint64_t v146;
  double v147;
  void *v148;
  uint64_t DeliveryReceipt;
  const char *v150;
  double v151;
  void *v152;
  const char *v153;
  double v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  double v158;
  void *v159;
  const char *v160;
  double v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  double v165;
  void *v166;
  const char *v167;
  double v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  double v172;
  void *v173;
  const char *v174;
  double v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  double v179;
  void *v180;
  const char *v181;
  double v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  double v186;
  void *v187;
  const char *v188;
  double v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  double v193;
  void *v194;
  const char *v195;
  double v196;
  const char *v197;
  uint64_t v198;
  double v199;
  void *v200;
  uint64_t v201;
  const char *v202;
  double v203;
  void *v204;
  const char *v205;
  double v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  double v210;
  void *v211;
  const char *v212;
  double v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  double v217;
  void *v218;
  const char *v219;
  double v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  double v224;
  void *v225;
  const char *v226;
  double v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  double v231;
  void *v232;
  const char *v233;
  double v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  double v238;
  void *v239;
  const char *v240;
  double v241;
  void *v242;
  const char *v243;
  uint64_t v244;
  double v245;
  void *v246;
  const char *v247;
  double v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  double v252;
  void *v253;
  const char *v254;
  double v255;
  const char *v256;
  uint64_t v257;
  double v258;
  void *v259;
  uint64_t v260;
  const char *v261;
  double v262;
  void *v263;
  const char *v264;
  double v265;
  const char *v266;
  uint64_t v267;
  double v268;
  void *v269;
  uint64_t v270;
  const char *v271;
  double v272;
  void *v273;
  const char *v274;
  double v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  double v279;
  void *v280;
  const char *v281;
  double v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  double v286;
  void *v287;
  const char *v288;
  double v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  double v293;
  void *v294;
  const char *v295;
  double v296;
  const char *v297;
  uint64_t v298;
  double v299;
  void *v300;
  uint64_t v301;
  const char *v302;
  double v303;
  void *v304;
  const char *v305;
  double v306;
  void *v307;
  const char *v308;
  uint64_t v309;
  double v310;
  void *v311;
  const char *v312;
  double v313;
  void *v314;
  const char *v315;
  uint64_t v316;
  double v317;
  void *v318;
  const char *v319;
  double v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  double v324;
  void *v325;
  const char *v326;
  double v327;
  void *v328;
  const char *v329;
  uint64_t v330;
  double v331;
  void *v332;
  const char *v333;
  double v334;
  const char *v335;
  uint64_t v336;
  double v337;
  void *v338;
  uint64_t v339;
  const char *v340;
  double v341;
  void *v342;
  const char *v343;
  double v344;
  const char *v345;
  uint64_t v346;
  double v347;
  void *v348;
  uint64_t v349;
  const char *v350;
  double v351;
  void *v352;
  const char *v353;
  double v354;
  const char *v355;
  uint64_t v356;
  double v357;
  void *v358;
  uint64_t v359;
  const char *v360;
  double v361;
  void *v362;
  const char *v363;
  double v364;
  const char *v365;
  uint64_t v366;
  double v367;
  void *v368;
  uint64_t v369;
  const char *v370;
  double v371;
  void *v372;
  const char *v373;
  double v374;
  void *v375;
  const char *v376;
  uint64_t v377;
  double v378;
  void *v379;
  const char *v380;
  double v381;
  void *v382;
  const char *v383;
  uint64_t v384;
  double v385;
  void *v386;
  const char *v387;
  double v388;
  const char *v389;
  uint64_t v390;
  double v391;
  void *v392;
  uint64_t v393;
  const char *v394;
  double v395;
  void *v396;
  const char *v397;
  double v398;
  const char *v399;
  uint64_t v400;
  double v401;
  void *v402;
  uint64_t v403;
  const char *v404;
  double v405;
  void *v406;
  const char *v407;
  double v408;
  void *v409;
  const char *v410;
  uint64_t v411;
  double v412;
  void *v413;
  const char *v414;
  double v415;
  const char *v416;
  uint64_t v417;
  double v418;
  void *v419;
  uint64_t v420;
  const char *v421;
  double v422;
  void *v423;
  const char *v424;
  double v425;
  void *v426;
  const char *v427;
  uint64_t v428;
  double v429;
  void *v430;
  const char *v431;
  double v432;
  const char *v433;
  uint64_t v434;
  double v435;
  void *v436;
  uint64_t v437;
  const char *v438;
  double v439;
  void *v440;
  const char *v441;
  double v442;
  const char *v443;
  uint64_t v444;
  double v445;
  void *v446;
  uint64_t v447;
  const char *v448;
  double v449;
  void *v450;
  const char *v451;
  double v452;
  const char *v453;
  uint64_t v454;
  double v455;
  void *v456;
  uint64_t v457;
  const char *v458;
  double v459;
  void *v460;
  const char *v461;
  double v462;
  id v463;
  const char *v464;
  uint64_t v465;
  void *v466;
  const char *v467;
  double v468;
  uint64_t v469;
  const char *v470;
  double v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  void *v475;
  const char *v476;
  double v477;
  const char *v478;
  uint64_t v479;
  double v480;
  const char *v481;
  double v482;
  id v483;
  const char *v484;
  uint64_t v485;
  void *v486;
  const char *v487;
  double v488;
  uint64_t v489;
  const char *v490;
  double v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  void *v495;
  const char *v496;
  double v497;
  const char *v498;
  uint64_t v499;
  double v500;
  const char *v501;
  double v502;
  const char *v503;
  uint64_t v504;
  double v505;
  const char *v506;
  uint64_t v507;
  double v508;
  void *v509;
  uint64_t v510;
  const char *v511;
  double v512;
  void *v513;
  const char *v514;
  double v515;
  const char *v516;
  uint64_t v517;
  double v518;
  void *v519;
  uint64_t v520;
  const char *v521;
  double v522;
  void *v523;
  const char *v524;
  double v525;
  const char *v526;
  uint64_t v527;
  double v528;
  void *v529;
  uint64_t v530;
  const char *v531;
  double v532;
  void *v533;
  const char *v534;
  double v535;
  const char *v536;
  uint64_t v537;
  double v538;
  void *v539;
  uint64_t v540;
  const char *v541;
  double v542;
  void *v543;
  const char *v544;
  double v545;
  const char *v546;
  uint64_t v547;
  double v548;
  void *v549;
  uint64_t v550;
  const char *v551;
  double v552;
  void *v553;
  const char *v554;
  double v555;
  const char *v556;
  uint64_t v557;
  double v558;
  void *v559;
  uint64_t v560;
  const char *v561;
  double v562;
  void *v563;
  const char *v564;
  double v565;
  const char *v566;
  uint64_t v567;
  double v568;
  void *v569;
  uint64_t v570;
  const char *v571;
  double v572;
  void *v573;
  const char *v574;
  double v575;
  void *v576;
  const char *v577;
  uint64_t v578;
  double v579;
  void *v580;
  const char *v581;
  double v582;
  void *v583;
  const char *v584;
  uint64_t v585;
  double v586;
  void *v587;
  const char *v588;
  double v589;
  void *v590;
  const char *v591;
  uint64_t v592;
  double v593;
  void *v594;
  const char *v595;
  double v596;
  void *v597;
  const char *v598;
  uint64_t v599;
  double v600;
  void *v601;
  const char *v602;
  double v603;
  void *v604;
  const char *v605;
  uint64_t v606;
  double v607;
  void *v608;
  const char *v609;
  double v610;
  void *v611;
  const char *v612;
  uint64_t v613;
  double v614;
  void *v615;
  const char *v616;
  double v617;
  void *v618;
  const char *v619;
  uint64_t v620;
  double v621;
  void *v622;
  const char *v623;
  double v624;
  void *v625;
  const char *v626;
  uint64_t v627;
  double v628;
  void *v629;
  const char *v630;
  double v631;
  const char *v632;
  uint64_t v633;
  double v634;
  void *v635;
  uint64_t v636;
  const char *v637;
  double v638;
  void *v639;
  const char *v640;
  double v641;
  void *v642;
  const char *v643;
  uint64_t v644;
  double v645;
  void *v646;
  const char *v647;
  double v648;
  const char *v649;
  uint64_t v650;
  double v651;
  void *v652;
  uint64_t v653;
  const char *v654;
  double v655;
  void *v656;
  const char *v657;
  double v658;
  void *v659;
  const char *v660;
  uint64_t v661;
  double v662;
  void *v663;
  const char *v664;
  double v665;
  const char *v666;
  uint64_t v667;
  double v668;
  void *v669;
  uint64_t v670;
  const char *v671;
  double v672;
  void *v673;
  const char *v674;
  double v675;
  const char *v676;
  uint64_t v677;
  double v678;
  void *v679;
  uint64_t Chunk;
  const char *v681;
  double v682;
  void *v683;
  const char *v684;
  double v685;
  void *v686;
  const char *v687;
  uint64_t v688;
  double v689;
  void *v690;
  const char *v691;
  double v692;
  const char *v693;
  uint64_t v694;
  double v695;
  void *v696;
  uint64_t v697;
  const char *v698;
  double v699;
  void *v700;
  const char *v701;
  double v702;
  const char *v703;
  uint64_t v704;
  double v705;
  void *v706;
  uint64_t v707;
  const char *v708;
  double v709;
  void *v710;
  const char *v711;
  double v712;
  void *v713;
  const char *v714;
  uint64_t v715;
  double v716;
  void *v717;
  const char *v718;
  double v719;
  void *v720;
  const char *v721;
  double v722;
  void *v723;
  const char *v724;
  uint64_t v725;
  double v726;
  void *v727;
  const char *v728;
  double v729;
  const char *v730;
  uint64_t v731;
  double v732;
  void *v733;
  const char *v734;
  uint64_t v735;
  double v736;
  void *v737;
  const char *v738;
  double v739;
  void *v740;
  const char *v741;
  uint64_t v742;
  double v743;
  void *v744;
  const char *v745;
  double v746;
  void *v747;
  const char *v748;
  uint64_t v749;
  double v750;
  void *v751;
  const char *v752;
  double v753;
  const char *v754;
  uint64_t v755;
  double v756;
  void *v757;
  uint64_t v758;
  const char *v759;
  double v760;
  void *v761;
  const char *v762;
  double v763;
  void *v764;
  const char *v765;
  uint64_t v766;
  double v767;
  void *v768;
  const char *v769;
  double v770;
  const char *v771;
  uint64_t v772;
  double v773;
  void *v774;
  uint64_t v775;
  const char *v776;
  double v777;
  void *v778;
  const char *v779;
  double v780;
  const char *v781;
  uint64_t v782;
  double v783;
  void *v784;
  uint64_t v785;
  const char *v786;
  double v787;
  void *v788;
  const char *v789;
  double v790;
  const char *v791;
  uint64_t v792;
  double v793;
  void *v794;
  uint64_t v795;
  const char *v796;
  double v797;
  void *v798;
  const char *v799;
  double v800;
  const char *v801;
  uint64_t v802;
  double v803;
  void *v804;
  uint64_t v805;
  const char *v806;
  double v807;
  void *v808;
  const char *v809;
  double v810;
  void *v811;
  const char *v812;
  uint64_t v813;
  double v814;
  void *v815;
  const char *v816;
  double v817;
  void *v818;
  const char *v819;
  uint64_t v820;
  double v821;
  void *v822;
  const char *v823;
  double v824;
  void *v825;
  const char *v826;
  uint64_t v827;
  double v828;
  void *v829;
  const char *v830;
  double v831;
  const char *v832;
  uint64_t v833;
  double v834;
  void *v835;
  uint64_t v836;
  const char *v837;
  double v838;
  void *v839;
  const char *v840;
  double v841;
  const char *v842;
  uint64_t v843;
  double v844;
  void *v845;
  uint64_t v846;
  const char *v847;
  double v848;
  void *v849;
  const char *v850;
  double v851;
  const char *v852;
  uint64_t v853;
  double v854;
  void *v855;
  uint64_t isInitiatorKey;
  const char *v857;
  double v858;
  void *v859;
  const char *v860;
  double v861;
  const char *v862;
  uint64_t v863;
  double v864;
  void *v865;
  uint64_t v866;
  const char *v867;
  double v868;
  void *v869;
  const char *v870;
  double v871;
  const char *v872;
  uint64_t v873;
  double v874;
  void *v875;
  uint64_t v876;
  const char *v877;
  double v878;
  void *v879;
  const char *v880;
  double v881;
  const char *v882;
  uint64_t v883;
  double v884;
  void *v885;
  uint64_t v886;
  const char *v887;
  double v888;
  void *v889;
  const char *v890;
  double v891;
  const char *v892;
  uint64_t v893;
  double v894;
  void *v895;
  uint64_t v896;
  const char *v897;
  double v898;
  void *v899;
  const char *v900;
  double v901;
  void *v902;
  const char *v903;
  uint64_t v904;
  double v905;
  void *v906;
  const char *v907;
  double v908;
  const char *v909;
  uint64_t v910;
  double v911;
  void *v912;
  uint64_t v913;
  const char *v914;
  double v915;
  void *v916;
  const char *v917;
  double v918;
  const char *v919;
  uint64_t v920;
  double v921;
  void *v922;
  uint64_t ErrorCode;
  const char *v924;
  double v925;
  void *v926;
  const char *v927;
  double v928;
  void *v929;
  const char *v930;
  uint64_t v931;
  double v932;
  void *v933;
  const char *v934;
  double v935;
  void *v936;
  const char *v937;
  uint64_t v938;
  double v939;
  void *v940;
  const char *v941;
  double v942;
  const char *v943;
  uint64_t v944;
  double v945;
  void *v946;
  uint64_t Timestamp;
  const char *v948;
  double v949;
  void *v950;
  const char *v951;
  double v952;
  void *v953;
  const char *v954;
  uint64_t v955;
  double v956;
  void *v957;
  const char *v958;
  double v959;
  void *v960;
  const char *v961;
  uint64_t v962;
  double v963;
  void *v964;
  const char *v965;
  double v966;
  const char *v967;
  uint64_t v968;
  double v969;
  void *v970;
  uint64_t v971;
  const char *v972;
  double v973;
  void *v974;
  const char *v975;
  double v976;
  const char *v977;
  uint64_t v978;
  double v979;
  void *v980;
  uint64_t v981;
  const char *v982;
  double v983;
  void *v984;
  const char *v985;
  double v986;
  const char *v987;
  uint64_t v988;
  double v989;
  void *v990;
  uint64_t v991;
  const char *v992;
  double v993;
  void *v994;
  const char *v995;
  double v996;
  const char *v997;
  uint64_t v998;
  double v999;
  void *v1000;
  uint64_t v1001;
  const char *v1002;
  double v1003;
  void *v1004;
  const char *v1005;
  double v1006;
  void *v1007;
  const char *v1008;
  uint64_t v1009;
  double v1010;
  void *v1011;
  const char *v1012;
  double v1013;
  const char *v1014;
  uint64_t v1015;
  double v1016;
  void *v1017;
  uint64_t v1018;
  const char *v1019;
  double v1020;
  void *v1021;
  const char *v1022;
  double v1023;
  const char *v1024;
  uint64_t v1025;
  double v1026;
  void *v1027;
  uint64_t v1028;
  const char *v1029;
  double v1030;
  void *v1031;
  const char *v1032;
  double v1033;
  void *v1034;
  const char *v1035;
  uint64_t v1036;
  double v1037;
  void *v1038;
  const char *v1039;
  double v1040;
  const char *v1041;
  uint64_t v1042;
  double v1043;
  void *v1044;
  uint64_t v1045;
  const char *v1046;
  double v1047;
  void *v1048;
  const char *v1049;
  double v1050;
  const char *v1051;
  uint64_t v1052;
  double v1053;
  void *v1054;
  uint64_t InfoAttribute;
  const char *v1056;
  double v1057;
  void *v1058;
  const char *v1059;
  double v1060;
  void *v1061;
  const char *v1062;
  uint64_t v1063;
  double v1064;
  void *v1065;
  const char *v1066;
  double v1067;
  void *v1068;
  const char *v1069;
  uint64_t v1070;
  double v1071;
  void *v1072;
  const char *v1073;
  double v1074;
  const char *v1075;
  uint64_t v1076;
  double v1077;
  void *v1078;
  uint64_t v1079;
  const char *v1080;
  double v1081;
  void *v1082;
  const char *v1083;
  double v1084;
  void *v1085;
  const char *v1086;
  uint64_t v1087;
  double v1088;
  void *v1089;
  const char *v1090;
  double v1091;
  void *v1092;
  const char *v1093;
  uint64_t v1094;
  double v1095;
  void *v1096;
  const char *v1097;
  double v1098;
  void *v1099;
  const char *v1100;
  uint64_t v1101;
  double v1102;
  void *v1103;
  const char *v1104;
  double v1105;
  const char *v1106;
  uint64_t v1107;
  double v1108;
  void *v1109;
  uint64_t v1110;
  const char *v1111;
  double v1112;
  void *v1113;
  const char *v1114;
  double v1115;
  void *v1116;
  const char *v1117;
  uint64_t v1118;
  double v1119;
  void *v1120;
  const char *v1121;
  double v1122;
  const char *v1123;
  uint64_t v1124;
  double v1125;
  void *v1126;
  uint64_t v1127;
  const char *v1128;
  double v1129;
  void *v1130;
  const char *v1131;
  double v1132;
  void *v1133;
  const char *v1134;
  uint64_t v1135;
  double v1136;
  void *v1137;
  const char *v1138;
  double v1139;
  void *v1140;
  const char *v1141;
  uint64_t v1142;
  double v1143;
  void *v1144;
  const char *v1145;
  double v1146;
  const char *v1147;
  uint64_t v1148;
  double v1149;
  void *v1150;
  uint64_t v1151;
  const char *v1152;
  double v1153;
  void *v1154;
  const char *v1155;
  double v1156;
  const char *v1157;
  uint64_t v1158;
  double v1159;
  void *v1160;
  uint64_t v1161;
  const char *v1162;
  double v1163;
  void *v1164;
  const char *v1165;
  double v1166;
  id v1167;
  const char *v1168;
  uint64_t v1169;
  void *v1170;
  const char *v1171;
  double v1172;
  uint64_t v1173;
  const char *v1174;
  double v1175;
  uint64_t v1176;
  uint64_t v1177;
  uint64_t v1178;
  void *v1179;
  const char *v1180;
  double v1181;
  const char *v1182;
  uint64_t v1183;
  double v1184;
  const char *v1185;
  double v1186;
  id v1187;
  const char *v1188;
  uint64_t v1189;
  void *v1190;
  const char *v1191;
  double v1192;
  uint64_t v1193;
  const char *v1194;
  double v1195;
  uint64_t v1196;
  uint64_t v1197;
  uint64_t v1198;
  void *v1199;
  const char *v1200;
  double v1201;
  const char *v1202;
  uint64_t v1203;
  double v1204;
  const char *v1205;
  double v1206;
  const char *v1207;
  uint64_t v1208;
  double v1209;
  void *v1210;
  const char *v1211;
  uint64_t v1212;
  double v1213;
  void *v1214;
  const char *v1215;
  double v1216;
  const char *v1217;
  uint64_t v1218;
  double v1219;
  void *v1220;
  uint64_t v1221;
  const char *v1222;
  double v1223;
  void *v1224;
  const char *v1225;
  double v1226;
  const char *v1227;
  uint64_t v1228;
  double v1229;
  void *v1230;
  uint64_t v1231;
  const char *v1232;
  double v1233;
  void *v1234;
  const char *v1235;
  double v1236;
  const char *v1237;
  uint64_t v1238;
  double v1239;
  void *v1240;
  uint64_t v1241;
  const char *v1242;
  double v1243;
  void *v1244;
  const char *v1245;
  double v1246;
  const char *v1247;
  uint64_t v1248;
  double v1249;
  const char *v1250;
  uint64_t v1251;
  double v1252;
  void *v1253;
  uint64_t v1254;
  const char *v1255;
  double v1256;
  void *v1257;
  const char *v1258;
  double v1259;
  const char *v1260;
  uint64_t v1261;
  double v1262;
  const char *v1263;
  uint64_t v1264;
  double v1265;
  void *v1266;
  uint64_t v1267;
  const char *v1268;
  double v1269;
  void *v1270;
  const char *v1271;
  double v1272;
  const char *v1273;
  uint64_t v1274;
  double v1275;
  const char *v1276;
  uint64_t v1277;
  double v1278;
  void *v1279;
  uint64_t v1280;
  const char *v1281;
  double v1282;
  void *v1283;
  const char *v1284;
  double v1285;
  const char *v1286;
  uint64_t v1287;
  double v1288;
  void *v1289;
  uint64_t isBulkedPayload;
  const char *v1291;
  double v1292;
  void *v1293;
  const char *v1294;
  double v1295;
  const char *v1296;
  uint64_t v1297;
  double v1298;
  void *v1299;
  uint64_t v1300;
  const char *v1301;
  double v1302;
  void *v1303;
  const char *v1304;
  double v1305;
  const char *v1306;
  uint64_t v1307;
  double v1308;
  void *v1309;
  const char *v1310;
  uint64_t v1311;
  double v1312;
  void *v1313;
  const char *v1314;
  double v1315;
  const char *v1316;
  uint64_t v1317;
  double v1318;
  const char *v1319;
  uint64_t v1320;
  double v1321;
  void *v1322;
  uint64_t v1323;
  const char *v1324;
  double v1325;
  void *v1326;
  const char *v1327;
  double v1328;
  const char *v1329;
  uint64_t v1330;
  double v1331;
  const char *v1332;
  uint64_t v1333;
  double v1334;
  void *v1335;
  uint64_t v1336;
  const char *v1337;
  double v1338;
  void *v1339;
  const char *v1340;
  double v1341;
  const char *v1342;
  uint64_t v1343;
  double v1344;
  const char *v1345;
  uint64_t v1346;
  double v1347;
  void *v1348;
  uint64_t v1349;
  const char *v1350;
  double v1351;
  void *v1352;
  const char *v1353;
  double v1354;
  const char *v1355;
  uint64_t v1356;
  double v1357;
  const char *v1358;
  uint64_t v1359;
  double v1360;
  void *v1361;
  uint64_t v1362;
  const char *v1363;
  double v1364;
  void *v1365;
  const char *v1366;
  double v1367;
  const char *v1368;
  uint64_t v1369;
  double v1370;
  const char *v1371;
  uint64_t v1372;
  double v1373;
  void *v1374;
  uint64_t v1375;
  const char *v1376;
  double v1377;
  void *v1378;
  const char *v1379;
  double v1380;
  const char *v1381;
  uint64_t v1382;
  double v1383;
  const char *v1384;
  uint64_t v1385;
  double v1386;
  void *v1387;
  uint64_t isTrustedSender;
  const char *v1389;
  double v1390;
  void *v1391;
  const char *v1392;
  double v1393;
  id v1394;
  __int128 v1396;
  __int128 v1397;
  __int128 v1398;
  __int128 v1399;
  __int128 v1400;
  __int128 v1401;
  __int128 v1402;
  __int128 v1403;
  __int128 v1404;
  __int128 v1405;
  __int128 v1406;
  __int128 v1407;
  __int128 v1408;
  __int128 v1409;
  __int128 v1410;
  __int128 v1411;
  _BYTE v1412[128];
  _BYTE v1413[128];
  _BYTE v1414[128];
  _BYTE v1415[128];
  uint64_t v1416;

  v1416 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v4;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend_command(v6, v8, v9, v10);
  objc_msgSend_numberWithInteger_(v7, v12, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, v16, CFSTR("c"));

  if (objc_msgSend_has_commandContext(v6, v17, v18, v19))
  {
    v23 = (void *)MEMORY[0x1E0CB37E8];
    v24 = objc_msgSend_commandContext(v6, v20, v21, v22);
    objc_msgSend_numberWithInteger_(v23, v25, v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v28, (uint64_t)v27, v29, CFSTR("cc"));

  }
  if (objc_msgSend_has_version(v6, v20, v21, v22))
  {
    v33 = (void *)MEMORY[0x1E0CB37E8];
    v34 = objc_msgSend_version(v6, v30, v31, v32);
    objc_msgSend_numberWithInteger_(v33, v35, v34, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v38, (uint64_t)v37, v39, CFSTR("v"));

  }
  objc_msgSend_payload(v6, v30, v31, v32);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend_payload(v6, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v45, (uint64_t)v44, v46, CFSTR("P"));

  }
  objc_msgSend_bulkedPayload(v6, v41, v42, v43);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend_bulkedPayload(v6, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v52, (uint64_t)v51, v53, CFSTR("N"));

  }
  objc_msgSend_fanoutPayload(v6, v48, v49, v50);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    objc_msgSend_fanoutPayload(v6, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v59, (uint64_t)v58, v60, CFSTR("fP"));

  }
  objc_msgSend_additionalPayload(v6, v55, v56, v57);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    objc_msgSend_additionalPayload(v6, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v66, (uint64_t)v65, v67, CFSTR("aP"));

  }
  objc_msgSend_payloadMetadata(v6, v62, v63, v64);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend_payloadMetadata(v6, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v73, (uint64_t)v72, v74, CFSTR("Pm"));

  }
  objc_msgSend_messageId(v6, v69, v70, v71);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    objc_msgSend_messageId(v6, v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v80, (uint64_t)v79, v81, CFSTR("i"));

  }
  objc_msgSend_messageUUID(v6, v76, v77, v78);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    objc_msgSend_messageUUID(v6, v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v87, (uint64_t)v86, v88, CFSTR("U"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_queueId(v6, v89, v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    if (v92)
    {
      objc_msgSend_queueId(v6, v89, v90, v91);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v5, v94, (uint64_t)v93, v95, CFSTR("qI"));

    }
  }
  if (objc_msgSend_has_deliveryStatus(v6, v89, v90, v91))
  {
    v99 = (void *)MEMORY[0x1E0CB37E8];
    v100 = objc_msgSend_deliveryStatus(v6, v96, v97, v98);
    objc_msgSend_numberWithBool_(v99, v101, v100, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v104, (uint64_t)v103, v105, CFSTR("D"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_deliveryContext(v6, v106, v107, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_extractMadridDeliveryContextFrom_(self, v110, (uint64_t)v109, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    if (v112 && objc_msgSend_count(v112, v113, v114, v115))
      objc_msgSend_setObject_forKey_(v5, v116, (uint64_t)v112, v117, CFSTR("Dc"));

  }
  if (objc_msgSend_has_certifiedDeliveryVersion(v6, v106, v107, v108))
  {
    v121 = (void *)MEMORY[0x1E0CB37E8];
    v122 = objc_msgSend_certifiedDeliveryVersion(v6, v118, v119, v120);
    objc_msgSend_numberWithInteger_(v121, v123, v122, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v126, (uint64_t)v125, v127, CFSTR("cdv"));

  }
  objc_msgSend_certifiedDeliveryRts(v6, v118, v119, v120);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  if (v128)
  {
    objc_msgSend_certifiedDeliveryRts(v6, v129, v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v133, (uint64_t)v132, v134, CFSTR("cdr"));

  }
  if (objc_msgSend_has_noResponseNeeded(v6, v129, v130, v131))
  {
    v138 = (void *)MEMORY[0x1E0CB37E8];
    v139 = objc_msgSend_noResponseNeeded(v6, v135, v136, v137);
    objc_msgSend_numberWithBool_(v138, v140, v139, v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v143, (uint64_t)v142, v144, CFSTR("nr"));

  }
  if (objc_msgSend_has_generateDeliveryReceipt(v6, v135, v136, v137))
  {
    v148 = (void *)MEMORY[0x1E0CB37E8];
    DeliveryReceipt = objc_msgSend_generateDeliveryReceipt(v6, v145, v146, v147);
    objc_msgSend_numberWithBool_(v148, v150, DeliveryReceipt, v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v153, (uint64_t)v152, v154, CFSTR("gd"));

  }
  objc_msgSend_sessionToken(v6, v145, v146, v147);
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  if (v155)
  {
    objc_msgSend_sessionToken(v6, v156, v157, v158);
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v160, (uint64_t)v159, v161, CFSTR("sT"));

  }
  objc_msgSend_homekitSessionToken(v6, v156, v157, v158);
  v162 = (void *)objc_claimAutoreleasedReturnValue();

  if (v162)
  {
    objc_msgSend_homekitSessionToken(v6, v163, v164, v165);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v167, (uint64_t)v166, v168, CFSTR("hT"));

  }
  objc_msgSend_destinationId(v6, v163, v164, v165);
  v169 = (void *)objc_claimAutoreleasedReturnValue();

  if (v169)
  {
    objc_msgSend_destinationId(v6, v170, v171, v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v174, (uint64_t)v173, v175, CFSTR("tP"));

  }
  objc_msgSend_userAgent(v6, v170, v171, v172);
  v176 = (void *)objc_claimAutoreleasedReturnValue();

  if (v176)
  {
    objc_msgSend_userAgent(v6, v177, v178, v179);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v181, (uint64_t)v180, v182, CFSTR("ua"));

  }
  objc_msgSend_MMCSOwnerId(v6, v177, v178, v179);
  v183 = (void *)objc_claimAutoreleasedReturnValue();

  if (v183)
  {
    objc_msgSend_MMCSOwnerId(v6, v184, v185, v186);
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v188, (uint64_t)v187, v189, CFSTR("mO"));

  }
  objc_msgSend_MMCSFileSignature(v6, v184, v185, v186);
  v190 = (void *)objc_claimAutoreleasedReturnValue();

  if (v190)
  {
    objc_msgSend_MMCSFileSignature(v6, v191, v192, v193);
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v195, (uint64_t)v194, v196, CFSTR("mS"));

  }
  if (objc_msgSend_has_MMCSFileLength(v6, v191, v192, v193))
  {
    v200 = (void *)MEMORY[0x1E0CB37E8];
    v201 = objc_msgSend_MMCSFileLength(v6, v197, v198, v199);
    objc_msgSend_numberWithLongLong_(v200, v202, v201, v203);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v205, (uint64_t)v204, v206, CFSTR("mL"));

  }
  objc_msgSend_MMCSAuthToken(v6, v197, v198, v199);
  v207 = (void *)objc_claimAutoreleasedReturnValue();

  if (v207)
  {
    objc_msgSend_MMCSAuthToken(v6, v208, v209, v210);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v212, (uint64_t)v211, v213, CFSTR("mA"));

  }
  objc_msgSend_MMCSAuthUrl(v6, v208, v209, v210);
  v214 = (void *)objc_claimAutoreleasedReturnValue();

  if (v214)
  {
    objc_msgSend_MMCSAuthUrl(v6, v215, v216, v217);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v219, (uint64_t)v218, v220, CFSTR("mR"));

  }
  objc_msgSend_MMCSAuthId(v6, v215, v216, v217);
  v221 = (void *)objc_claimAutoreleasedReturnValue();

  if (v221)
  {
    objc_msgSend_MMCSAuthId(v6, v222, v223, v224);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v226, (uint64_t)v225, v227, CFSTR("mU"));

  }
  objc_msgSend_MMCSDownloadAuthList(v6, v222, v223, v224);
  v228 = (void *)objc_claimAutoreleasedReturnValue();

  if (v228)
  {
    objc_msgSend_MMCSDownloadAuthList(v6, v229, v230, v231);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v233, (uint64_t)v232, v234, CFSTR("dal"));

  }
  objc_msgSend_MMCSDownloadUrlList(v6, v229, v230, v231);
  v235 = (void *)objc_claimAutoreleasedReturnValue();

  if (v235)
  {
    objc_msgSend_MMCSDownloadUrlList(v6, v236, v237, v238);
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v240, (uint64_t)v239, v241, CFSTR("dul"));

  }
  objc_msgSend_MMCSDownloadUrl(v6, v236, v237, v238);
  v242 = (void *)objc_claimAutoreleasedReturnValue();

  if (v242)
  {
    objc_msgSend_MMCSDownloadUrl(v6, v243, v244, v245);
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v247, (uint64_t)v246, v248, CFSTR("dR"));

  }
  objc_msgSend_MMCSUploadUrl(v6, v243, v244, v245);
  v249 = (void *)objc_claimAutoreleasedReturnValue();

  if (v249)
  {
    objc_msgSend_MMCSUploadUrl(v6, v250, v251, v252);
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v254, (uint64_t)v253, v255, CFSTR("uR"));

  }
  if (objc_msgSend_has_MMCSExpiryNanos(v6, v250, v251, v252))
  {
    v259 = (void *)MEMORY[0x1E0CB37E8];
    v260 = objc_msgSend_MMCSExpiryNanos(v6, v256, v257, v258);
    objc_msgSend_numberWithLongLong_(v259, v261, v260, v262);
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v264, (uint64_t)v263, v265, CFSTR("mX"));

  }
  if (objc_msgSend_has_contentVersion(v6, v256, v257, v258))
  {
    v269 = (void *)MEMORY[0x1E0CB37E8];
    v270 = objc_msgSend_contentVersion(v6, v266, v267, v268);
    objc_msgSend_numberWithInteger_(v269, v271, v270, v272);
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v274, (uint64_t)v273, v275, CFSTR("cV"));

  }
  objc_msgSend_contentHeaders(v6, v266, v267, v268);
  v276 = (void *)objc_claimAutoreleasedReturnValue();

  if (v276)
  {
    objc_msgSend_contentHeaders(v6, v277, v278, v279);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v281, (uint64_t)v280, v282, CFSTR("cH"));

  }
  objc_msgSend_contentBody(v6, v277, v278, v279);
  v283 = (void *)objc_claimAutoreleasedReturnValue();

  if (v283)
  {
    objc_msgSend_contentBody(v6, v284, v285, v286);
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v288, (uint64_t)v287, v289, CFSTR("cB"));

  }
  objc_msgSend_contentReferenceSignature(v6, v284, v285, v286);
  v290 = (void *)objc_claimAutoreleasedReturnValue();

  if (v290)
  {
    objc_msgSend_contentReferenceSignature(v6, v291, v292, v293);
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v295, (uint64_t)v294, v296, CFSTR("cR"));

  }
  if (objc_msgSend_has_attachmentSize(v6, v291, v292, v293))
  {
    v300 = (void *)MEMORY[0x1E0CB37E8];
    v301 = objc_msgSend_attachmentSize(v6, v297, v298, v299);
    objc_msgSend_numberWithInteger_(v300, v302, v301, v303);
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v305, (uint64_t)v304, v306, CFSTR("mT"));

  }
  objc_msgSend_token(v6, v297, v298, v299);
  v307 = (void *)objc_claimAutoreleasedReturnValue();

  if (v307)
  {
    objc_msgSend_token(v6, v308, v309, v310);
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v312, (uint64_t)v311, v313, CFSTR("t"));

  }
  objc_msgSend_senderId(v6, v308, v309, v310);
  v314 = (void *)objc_claimAutoreleasedReturnValue();

  if (v314)
  {
    objc_msgSend_senderId(v6, v315, v316, v317);
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v319, (uint64_t)v318, v320, CFSTR("sP"));

  }
  objc_msgSend_senderOpaqueId(v6, v315, v316, v317);
  v321 = (void *)objc_claimAutoreleasedReturnValue();

  if (v321)
  {
    objc_msgSend_senderOpaqueId(v6, v322, v323, v324);
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v326, (uint64_t)v325, v327, CFSTR("sI"));

  }
  objc_msgSend_mspId(v6, v322, v323, v324);
  v328 = (void *)objc_claimAutoreleasedReturnValue();

  if (v328)
  {
    objc_msgSend_mspId(v6, v329, v330, v331);
    v332 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v333, (uint64_t)v332, v334, CFSTR("mP"));

  }
  if (objc_msgSend_has_responseStatus(v6, v329, v330, v331))
  {
    v338 = (void *)MEMORY[0x1E0CB37E8];
    v339 = objc_msgSend_responseStatus(v6, v335, v336, v337);
    objc_msgSend_numberWithInteger_(v338, v340, v339, v341);
    v342 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v343, (uint64_t)v342, v344, CFSTR("s"));

  }
  if (objc_msgSend_has_epochTimeNanos(v6, v335, v336, v337))
  {
    v348 = (void *)MEMORY[0x1E0CB37E8];
    v349 = objc_msgSend_epochTimeNanos(v6, v345, v346, v347);
    objc_msgSend_numberWithLongLong_(v348, v350, v349, v351);
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v353, (uint64_t)v352, v354, CFSTR("e"));

  }
  if (objc_msgSend_has_originalEpochTimeNanos(v6, v345, v346, v347))
  {
    v358 = (void *)MEMORY[0x1E0CB37E8];
    v359 = objc_msgSend_originalEpochTimeNanos(v6, v355, v356, v357);
    objc_msgSend_numberWithLongLong_(v358, v360, v359, v361);
    v362 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v363, (uint64_t)v362, v364, CFSTR("oe"));

  }
  if (objc_msgSend_has_failReason(v6, v355, v356, v357))
  {
    v368 = (void *)MEMORY[0x1E0CB37E8];
    v369 = objc_msgSend_failReason(v6, v365, v366, v367);
    objc_msgSend_numberWithInteger_(v368, v370, v369, v371);
    v372 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v373, (uint64_t)v372, v374, CFSTR("fR"));

  }
  objc_msgSend_failMessageId(v6, v365, v366, v367);
  v375 = (void *)objc_claimAutoreleasedReturnValue();

  if (v375)
  {
    objc_msgSend_failMessageId(v6, v376, v377, v378);
    v379 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v380, (uint64_t)v379, v381, CFSTR("fU"));

  }
  objc_msgSend_failMessageIdString(v6, v376, v377, v378);
  v382 = (void *)objc_claimAutoreleasedReturnValue();

  if (v382)
  {
    objc_msgSend_failMessageIdString(v6, v383, v384, v385);
    v386 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v387, (uint64_t)v386, v388, CFSTR("fM"));

  }
  if (objc_msgSend_has_failDownloadAttachmentSize(v6, v383, v384, v385))
  {
    v392 = (void *)MEMORY[0x1E0CB37E8];
    v393 = objc_msgSend_failDownloadAttachmentSize(v6, v389, v390, v391);
    objc_msgSend_numberWithInteger_(v392, v394, v393, v395);
    v396 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v397, (uint64_t)v396, v398, CFSTR("fFS"));

  }
  if (objc_msgSend_has_failUploadAttachmentSize(v6, v389, v390, v391))
  {
    v402 = (void *)MEMORY[0x1E0CB37E8];
    v403 = objc_msgSend_failUploadAttachmentSize(v6, v399, v400, v401);
    objc_msgSend_numberWithInteger_(v402, v404, v403, v405);
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v407, (uint64_t)v406, v408, CFSTR("fS"));

  }
  objc_msgSend_failReasonMessage(v6, v399, v400, v401);
  v409 = (void *)objc_claimAutoreleasedReturnValue();

  if (v409)
  {
    objc_msgSend_failReasonMessage(v6, v410, v411, v412);
    v413 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v414, (uint64_t)v413, v415, CFSTR("fRM"));

  }
  if (objc_msgSend_has_failTimeElapsed(v6, v410, v411, v412))
  {
    v419 = (void *)MEMORY[0x1E0CB37E8];
    v420 = objc_msgSend_failTimeElapsed(v6, v416, v417, v418);
    objc_msgSend_numberWithLongLong_(v419, v421, v420, v422);
    v423 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v424, (uint64_t)v423, v425, CFSTR("fTE"));

  }
  objc_msgSend_encryptionType(v6, v416, v417, v418);
  v426 = (void *)objc_claimAutoreleasedReturnValue();

  if (v426)
  {
    objc_msgSend_encryptionType(v6, v427, v428, v429);
    v430 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v431, (uint64_t)v430, v432, CFSTR("E"));

  }
  if (objc_msgSend_has_storageFlags(v6, v427, v428, v429))
  {
    v436 = (void *)MEMORY[0x1E0CB37E8];
    v437 = objc_msgSend_storageFlags(v6, v433, v434, v435);
    objc_msgSend_numberWithInteger_(v436, v438, v437, v439);
    v440 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v441, (uint64_t)v440, v442, CFSTR("H"));

  }
  if (objc_msgSend_has_priority(v6, v433, v434, v435))
  {
    v446 = (void *)MEMORY[0x1E0CB37E8];
    v447 = objc_msgSend_priority(v6, v443, v444, v445);
    objc_msgSend_numberWithInteger_(v446, v448, v447, v449);
    v450 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v451, (uint64_t)v450, v452, CFSTR("pri"));

  }
  if (objc_msgSend_has_senderExpectsAck(v6, v443, v444, v445))
  {
    v456 = (void *)MEMORY[0x1E0CB37E8];
    v457 = objc_msgSend_senderExpectsAck(v6, v453, v454, v455);
    objc_msgSend_numberWithInteger_(v456, v458, v457, v459);
    v460 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v461, (uint64_t)v460, v462, CFSTR("ack"));

  }
  v463 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1408 = 0u;
  v1409 = 0u;
  v1410 = 0u;
  v1411 = 0u;
  objc_msgSend_dstIdTokenList(v6, v464, v465, 0.0);
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  v469 = objc_msgSend_countByEnumeratingWithState_objects_count_(v466, v467, (uint64_t)&v1408, v468, v1415, 16);
  if (v469)
  {
    v472 = v469;
    v473 = *(_QWORD *)v1409;
    do
    {
      v474 = 0;
      do
      {
        if (*(_QWORD *)v1409 != v473)
          objc_enumerationMutation(v466);
        objc_msgSend_extractMadridProtocolPayloadFrom_(self, v470, *(_QWORD *)(*((_QWORD *)&v1408 + 1) + 8 * v474), v471);
        v475 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v463, v476, (uint64_t)v475, v477);

        ++v474;
      }
      while (v472 != v474);
      v472 = objc_msgSend_countByEnumeratingWithState_objects_count_(v466, v470, (uint64_t)&v1408, v471, v1415, 16);
    }
    while (v472);
  }

  if (objc_msgSend_count(v463, v478, v479, v480))
    objc_msgSend_setObject_forKey_(v5, v481, (uint64_t)v463, v482, CFSTR("dtl"));

  v483 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1404 = 0u;
  v1405 = 0u;
  v1406 = 0u;
  v1407 = 0u;
  objc_msgSend_madridMessageList(v6, v484, v485, 0.0);
  v486 = (void *)objc_claimAutoreleasedReturnValue();
  v489 = objc_msgSend_countByEnumeratingWithState_objects_count_(v486, v487, (uint64_t)&v1404, v488, v1414, 16);
  if (v489)
  {
    v492 = v489;
    v493 = *(_QWORD *)v1405;
    do
    {
      v494 = 0;
      do
      {
        if (*(_QWORD *)v1405 != v493)
          objc_enumerationMutation(v486);
        objc_msgSend_extractMadridProtocolPayloadFrom_(self, v490, *(_QWORD *)(*((_QWORD *)&v1404 + 1) + 8 * v494), v491);
        v495 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v483, v496, (uint64_t)v495, v497);

        ++v494;
      }
      while (v492 != v494);
      v492 = objc_msgSend_countByEnumeratingWithState_objects_count_(v486, v490, (uint64_t)&v1404, v491, v1414, 16);
    }
    while (v492);
  }

  if (objc_msgSend_count(v483, v498, v499, v500))
    objc_msgSend_setObject_forKey_(v5, v501, (uint64_t)v483, v502, CFSTR("mml"));

  if (objc_msgSend_has_storageCheckVersion(v6, v503, v504, v505))
  {
    v509 = (void *)MEMORY[0x1E0CB37E8];
    v510 = objc_msgSend_storageCheckVersion(v6, v506, v507, v508);
    objc_msgSend_numberWithInteger_(v509, v511, v510, v512);
    v513 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v514, (uint64_t)v513, v515, CFSTR("scv"));

  }
  if (objc_msgSend_has_dateExpirationSeconds(v6, v506, v507, v508))
  {
    v519 = (void *)MEMORY[0x1E0CB37E8];
    v520 = objc_msgSend_dateExpirationSeconds(v6, v516, v517, v518);
    objc_msgSend_numberWithLongLong_(v519, v521, v520, v522);
    v523 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v524, (uint64_t)v523, v525, CFSTR("eX"));

  }
  if (objc_msgSend_has_madridProtocol(v6, v516, v517, v518))
  {
    v529 = (void *)MEMORY[0x1E0CB37E8];
    v530 = objc_msgSend_madridProtocol(v6, v526, v527, v528);
    objc_msgSend_numberWithInteger_(v529, v531, v530, v532);
    v533 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v534, (uint64_t)v533, v535, CFSTR("xp"));

  }
  if (objc_msgSend_has_internalBuild(v6, v526, v527, v528))
  {
    v539 = (void *)MEMORY[0x1E0CB37E8];
    v540 = objc_msgSend_internalBuild(v6, v536, v537, v538);
    objc_msgSend_numberWithBool_(v539, v541, v540, v542);
    v543 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v544, (uint64_t)v543, v545, CFSTR("x-internal"));

  }
  if (objc_msgSend_has_loggingProfile(v6, v536, v537, v538))
  {
    v549 = (void *)MEMORY[0x1E0CB37E8];
    v550 = objc_msgSend_loggingProfile(v6, v546, v547, v548);
    objc_msgSend_numberWithBool_(v549, v551, v550, v552);
    v553 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v554, (uint64_t)v553, v555, CFSTR("x-logging"));

  }
  if (objc_msgSend_has_traceProfile(v6, v546, v547, v548))
  {
    v559 = (void *)MEMORY[0x1E0CB37E8];
    v560 = objc_msgSend_traceProfile(v6, v556, v557, v558);
    objc_msgSend_numberWithBool_(v559, v561, v560, v562);
    v563 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v564, (uint64_t)v563, v565, CFSTR("x-trace"));

  }
  if (objc_msgSend_has_groupMessage(v6, v556, v557, v558))
  {
    v569 = (void *)MEMORY[0x1E0CB37E8];
    v570 = objc_msgSend_groupMessage(v6, v566, v567, v568);
    objc_msgSend_numberWithBool_(v569, v571, v570, v572);
    v573 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v574, (uint64_t)v573, v575, CFSTR("gm"));

  }
  objc_msgSend_contentType(v6, v566, v567, v568);
  v576 = (void *)objc_claimAutoreleasedReturnValue();

  if (v576)
  {
    objc_msgSend_contentType(v6, v577, v578, v579);
    v580 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v581, (uint64_t)v580, v582, CFSTR("cT"));

  }
  objc_msgSend_adhocServiceOverride(v6, v577, v578, v579);
  v583 = (void *)objc_claimAutoreleasedReturnValue();

  if (v583)
  {
    objc_msgSend_adhocServiceOverride(v6, v584, v585, v586);
    v587 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v588, (uint64_t)v587, v589, CFSTR("aS"));

  }
  objc_msgSend_responseIdentifier(v6, v584, v585, v586);
  v590 = (void *)objc_claimAutoreleasedReturnValue();

  if (v590)
  {
    objc_msgSend_responseIdentifier(v6, v591, v592, v593);
    v594 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v595, (uint64_t)v594, v596, CFSTR("rI"));

  }
  objc_msgSend_responseIdentifierString(v6, v591, v592, v593);
  v597 = (void *)objc_claimAutoreleasedReturnValue();

  if (v597)
  {
    objc_msgSend_responseIdentifierString(v6, v598, v599, v600);
    v601 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v602, (uint64_t)v601, v603, CFSTR("ri"));

  }
  objc_msgSend_strictTransportSecurity(v6, v598, v599, v600);
  v604 = (void *)objc_claimAutoreleasedReturnValue();

  if (v604)
  {
    objc_msgSend_strictTransportSecurity(v6, v605, v606, v607);
    v608 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v609, (uint64_t)v608, v610, CFSTR("strict-transport-security"));

  }
  objc_msgSend_traceId(v6, v605, v606, v607);
  v611 = (void *)objc_claimAutoreleasedReturnValue();

  if (v611)
  {
    objc_msgSend_traceId(v6, v612, v613, v614);
    v615 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v616, (uint64_t)v615, v617, CFSTR("x-b3-traceid"));

  }
  objc_msgSend_splunkHint(v6, v612, v613, v614);
  v618 = (void *)objc_claimAutoreleasedReturnValue();

  if (v618)
  {
    objc_msgSend_splunkHint(v6, v619, v620, v621);
    v622 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v623, (uint64_t)v622, v624, CFSTR("sh"));

  }
  objc_msgSend_asHttpHeader(v6, v619, v620, v621);
  v625 = (void *)objc_claimAutoreleasedReturnValue();

  if (v625)
  {
    objc_msgSend_asHttpHeader(v6, v626, v627, v628);
    v629 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v630, (uint64_t)v629, v631, CFSTR("as"));

  }
  if (objc_msgSend_has_homekitDeliveryStatus(v6, v626, v627, v628))
  {
    v635 = (void *)MEMORY[0x1E0CB37E8];
    v636 = objc_msgSend_homekitDeliveryStatus(v6, v632, v633, v634);
    objc_msgSend_numberWithInteger_(v635, v637, v636, v638);
    v639 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v640, (uint64_t)v639, v641, CFSTR("hD"));

  }
  objc_msgSend_homekitReportId(v6, v632, v633, v634);
  v642 = (void *)objc_claimAutoreleasedReturnValue();

  if (v642)
  {
    objc_msgSend_homekitReportId(v6, v643, v644, v645);
    v646 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v647, (uint64_t)v646, v648, CFSTR("hI"));

  }
  if (objc_msgSend_has_retryCount(v6, v643, v644, v645))
  {
    v652 = (void *)MEMORY[0x1E0CB37E8];
    v653 = objc_msgSend_retryCount(v6, v649, v650, v651);
    objc_msgSend_numberWithInteger_(v652, v654, v653, v655);
    v656 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v657, (uint64_t)v656, v658, CFSTR("rc"));

  }
  objc_msgSend_testOptions(v6, v649, v650, v651);
  v659 = (void *)objc_claimAutoreleasedReturnValue();

  if (v659)
  {
    objc_msgSend_testOptions(v6, v660, v661, v662);
    v663 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v664, (uint64_t)v663, v665, CFSTR("x-test-opts"));

  }
  if (objc_msgSend_has_fanoutChunkNumber(v6, v660, v661, v662))
  {
    v669 = (void *)MEMORY[0x1E0CB37E8];
    v670 = objc_msgSend_fanoutChunkNumber(v6, v666, v667, v668);
    objc_msgSend_numberWithInteger_(v669, v671, v670, v672);
    v673 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v674, (uint64_t)v673, v675, CFSTR("fcn"));

  }
  if (objc_msgSend_has_fanoutLastChunk(v6, v666, v667, v668))
  {
    v679 = (void *)MEMORY[0x1E0CB37E8];
    Chunk = objc_msgSend_fanoutLastChunk(v6, v676, v677, v678);
    objc_msgSend_numberWithBool_(v679, v681, Chunk, v682);
    v683 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v684, (uint64_t)v683, v685, CFSTR("flc"));

  }
  objc_msgSend_url(v6, v676, v677, v678);
  v686 = (void *)objc_claimAutoreleasedReturnValue();

  if (v686)
  {
    objc_msgSend_url(v6, v687, v688, v689);
    v690 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v691, (uint64_t)v690, v692, CFSTR("url"));

  }
  if (objc_msgSend_has_faceTimeRetryCount(v6, v687, v688, v689))
  {
    v696 = (void *)MEMORY[0x1E0CB37E8];
    v697 = objc_msgSend_faceTimeRetryCount(v6, v693, v694, v695);
    objc_msgSend_numberWithInteger_(v696, v698, v697, v699);
    v700 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v701, (uint64_t)v700, v702, CFSTR("frc"));

  }
  if (objc_msgSend_has_webtunnelVersion(v6, v693, v694, v695))
  {
    v706 = (void *)MEMORY[0x1E0CB37E8];
    v707 = objc_msgSend_webtunnelVersion(v6, v703, v704, v705);
    objc_msgSend_numberWithInteger_(v706, v708, v707, v709);
    v710 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v711, (uint64_t)v710, v712, CFSTR("wV"));

  }
  objc_msgSend_httpUrl(v6, v703, v704, v705);
  v713 = (void *)objc_claimAutoreleasedReturnValue();

  if (v713)
  {
    objc_msgSend_httpUrl(v6, v714, v715, v716);
    v717 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v718, (uint64_t)v717, v719, CFSTR("u"));

  }
  objc_msgSend_httpHeaders(v6, v714, v715, v716);
  v720 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_extractMadridHttpHeadersFrom_(self, v721, (uint64_t)v720, v722);
  v723 = (void *)objc_claimAutoreleasedReturnValue();
  v727 = v723;
  if (v723 && objc_msgSend_count(v723, v724, v725, v726))
    objc_msgSend_setObject_forKey_(v5, v728, (uint64_t)v727, v729, CFSTR("h"));

  objc_msgSend_httpBody(v6, v730, v731, v732);
  v733 = (void *)objc_claimAutoreleasedReturnValue();

  if (v733)
  {
    objc_msgSend_httpBody(v6, v734, v735, v736);
    v737 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v738, (uint64_t)v737, v739, CFSTR("b"));

  }
  objc_msgSend_httpBodyUrl(v6, v734, v735, v736);
  v740 = (void *)objc_claimAutoreleasedReturnValue();

  if (v740)
  {
    objc_msgSend_httpBodyUrl(v6, v741, v742, v743);
    v744 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v745, (uint64_t)v744, v746, CFSTR("bu"));

  }
  objc_msgSend_httpBodyKey(v6, v741, v742, v743);
  v747 = (void *)objc_claimAutoreleasedReturnValue();

  if (v747)
  {
    objc_msgSend_httpBodyKey(v6, v748, v749, v750);
    v751 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v752, (uint64_t)v751, v753, CFSTR("bk"));

  }
  if (objc_msgSend_has_httpResponseStatus(v6, v748, v749, v750))
  {
    v757 = (void *)MEMORY[0x1E0CB37E8];
    v758 = objc_msgSend_httpResponseStatus(v6, v754, v755, v756);
    objc_msgSend_numberWithInteger_(v757, v759, v758, v760);
    v761 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v762, (uint64_t)v761, v763, CFSTR("hs"));

  }
  objc_msgSend_httpErrorMsg(v6, v754, v755, v756);
  v764 = (void *)objc_claimAutoreleasedReturnValue();

  if (v764)
  {
    objc_msgSend_httpErrorMsg(v6, v765, v766, v767);
    v768 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v769, (uint64_t)v768, v770, CFSTR("hr"));

  }
  if (objc_msgSend_has_writeToCloudkit(v6, v765, v766, v767))
  {
    v774 = (void *)MEMORY[0x1E0CB37E8];
    v775 = objc_msgSend_writeToCloudkit(v6, v771, v772, v773);
    objc_msgSend_numberWithBool_(v774, v776, v775, v777);
    v778 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v779, (uint64_t)v778, v780, CFSTR("ck"));

  }
  if (objc_msgSend_has_pessimisticCheck(v6, v771, v772, v773))
  {
    v784 = (void *)MEMORY[0x1E0CB37E8];
    v785 = objc_msgSend_pessimisticCheck(v6, v781, v782, v783);
    objc_msgSend_numberWithBool_(v784, v786, v785, v787);
    v788 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v789, (uint64_t)v788, v790, CFSTR("x-pessimistic"));

  }
  if (objc_msgSend_has_unfilteredHeaders(v6, v781, v782, v783))
  {
    v794 = (void *)MEMORY[0x1E0CB37E8];
    v795 = objc_msgSend_unfilteredHeaders(v6, v791, v792, v793);
    objc_msgSend_numberWithBool_(v794, v796, v795, v797);
    v798 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v799, (uint64_t)v798, v800, CFSTR("nH"));

  }
  if (objc_msgSend_has_deliveryStatusFlags(v6, v791, v792, v793))
  {
    v804 = (void *)MEMORY[0x1E0CB37E8];
    v805 = objc_msgSend_deliveryStatusFlags(v6, v801, v802, v803);
    objc_msgSend_numberWithInteger_(v804, v806, v805, v807);
    v808 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v809, (uint64_t)v808, v810, CFSTR("O"));

  }
  objc_msgSend_conferenceURI(v6, v801, v802, v803);
  v811 = (void *)objc_claimAutoreleasedReturnValue();

  if (v811)
  {
    objc_msgSend_conferenceURI(v6, v812, v813, v814);
    v815 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v816, (uint64_t)v815, v817, CFSTR("curi"));

  }
  objc_msgSend_selfSessionToken(v6, v812, v813, v814);
  v818 = (void *)objc_claimAutoreleasedReturnValue();

  if (v818)
  {
    objc_msgSend_selfSessionToken(v6, v819, v820, v821);
    v822 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v823, (uint64_t)v822, v824, CFSTR("sst"));

  }
  objc_msgSend_queryHash(v6, v819, v820, v821);
  v825 = (void *)objc_claimAutoreleasedReturnValue();

  if (v825)
  {
    objc_msgSend_queryHash(v6, v826, v827, v828);
    v829 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v830, (uint64_t)v829, v831, CFSTR("qH"));

  }
  if (objc_msgSend_has_testDropPoint(v6, v826, v827, v828))
  {
    v835 = (void *)MEMORY[0x1E0CB37E8];
    v836 = objc_msgSend_testDropPoint(v6, v832, v833, v834);
    objc_msgSend_numberWithInteger_(v835, v837, v836, v838);
    v839 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v840, (uint64_t)v839, v841, CFSTR("x-dp"));

  }
  if (objc_msgSend_has_userPlusOne(v6, v832, v833, v834))
  {
    v845 = (void *)MEMORY[0x1E0CB37E8];
    v846 = objc_msgSend_userPlusOne(v6, v842, v843, v844);
    objc_msgSend_numberWithBool_(v845, v847, v846, v848);
    v849 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v850, (uint64_t)v849, v851, CFSTR("up1"));

  }
  if (objc_msgSend_has_isInitiatorKey(v6, v842, v843, v844))
  {
    v855 = (void *)MEMORY[0x1E0CB37E8];
    isInitiatorKey = objc_msgSend_isInitiatorKey(v6, v852, v853, v854);
    objc_msgSend_numberWithBool_(v855, v857, isInitiatorKey, v858);
    v859 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v860, (uint64_t)v859, v861, CFSTR("is-initiator-key"));

  }
  if (objc_msgSend_has_errorCode(v6, v852, v853, v854))
  {
    v865 = (void *)MEMORY[0x1E0CB37E8];
    v866 = objc_msgSend_errorCode(v6, v862, v863, v864);
    objc_msgSend_numberWithInteger_(v865, v867, v866, v868);
    v869 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v870, (uint64_t)v869, v871, CFSTR("eC"));

  }
  if (objc_msgSend_has_messageCheckpoint(v6, v862, v863, v864))
  {
    v875 = (void *)MEMORY[0x1E0CB37E8];
    v876 = objc_msgSend_messageCheckpoint(v6, v872, v873, v874);
    objc_msgSend_numberWithBool_(v875, v877, v876, v878);
    v879 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v880, (uint64_t)v879, v881, CFSTR("mc"));

  }
  if (objc_msgSend_has_conversationId(v6, v872, v873, v874))
  {
    v885 = (void *)MEMORY[0x1E0CB37E8];
    v886 = objc_msgSend_conversationId(v6, v882, v883, v884);
    objc_msgSend_numberWithInteger_(v885, v887, v886, v888);
    v889 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v890, (uint64_t)v889, v891, CFSTR("ci"));

  }
  if (objc_msgSend_has_protocolVersion(v6, v882, v883, v884))
  {
    v895 = (void *)MEMORY[0x1E0CB37E8];
    v896 = objc_msgSend_protocolVersion(v6, v892, v893, v894);
    objc_msgSend_numberWithInteger_(v895, v897, v896, v898);
    v899 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v900, (uint64_t)v899, v901, CFSTR("qv"));

  }
  objc_msgSend_applicationId(v6, v892, v893, v894);
  v902 = (void *)objc_claimAutoreleasedReturnValue();

  if (v902)
  {
    objc_msgSend_applicationId(v6, v903, v904, v905);
    v906 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v907, (uint64_t)v906, v908, CFSTR("qai"));

  }
  if (objc_msgSend_has_reason(v6, v903, v904, v905))
  {
    v912 = (void *)MEMORY[0x1E0CB37E8];
    v913 = objc_msgSend_reason(v6, v909, v910, v911);
    objc_msgSend_numberWithInteger_(v912, v914, v913, v915);
    v916 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v917, (uint64_t)v916, v918, CFSTR("qr"));

  }
  if (objc_msgSend_has_prevErrorCode(v6, v909, v910, v911))
  {
    v922 = (void *)MEMORY[0x1E0CB37E8];
    ErrorCode = objc_msgSend_prevErrorCode(v6, v919, v920, v921);
    objc_msgSend_numberWithInteger_(v922, v924, ErrorCode, v925);
    v926 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v927, (uint64_t)v926, v928, CFSTR("qpec"));

  }
  objc_msgSend_prevAccessToken(v6, v919, v920, v921);
  v929 = (void *)objc_claimAutoreleasedReturnValue();

  if (v929)
  {
    objc_msgSend_prevAccessToken(v6, v930, v931, v932);
    v933 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v934, (uint64_t)v933, v935, CFSTR("qpat"));

  }
  objc_msgSend_prevRelayIp(v6, v930, v931, v932);
  v936 = (void *)objc_claimAutoreleasedReturnValue();

  if (v936)
  {
    objc_msgSend_prevRelayIp(v6, v937, v938, v939);
    v940 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v941, (uint64_t)v940, v942, CFSTR("qpip"));

  }
  if (objc_msgSend_has_prevTimestamp(v6, v937, v938, v939))
  {
    v946 = (void *)MEMORY[0x1E0CB37E8];
    Timestamp = objc_msgSend_prevTimestamp(v6, v943, v944, v945);
    objc_msgSend_numberWithInteger_(v946, v948, Timestamp, v949);
    v950 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v951, (uint64_t)v950, v952, CFSTR("qpt"));

  }
  objc_msgSend_activeAccessToken(v6, v943, v944, v945);
  v953 = (void *)objc_claimAutoreleasedReturnValue();

  if (v953)
  {
    objc_msgSend_activeAccessToken(v6, v954, v955, v956);
    v957 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v958, (uint64_t)v957, v959, CFSTR("qaat"));

  }
  objc_msgSend_activeRelayIp(v6, v954, v955, v956);
  v960 = (void *)objc_claimAutoreleasedReturnValue();

  if (v960)
  {
    objc_msgSend_activeRelayIp(v6, v961, v962, v963);
    v964 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v965, (uint64_t)v964, v966, CFSTR("qaip"));

  }
  if (objc_msgSend_has_selfAllocTokenCountOld(v6, v961, v962, v963))
  {
    v970 = (void *)MEMORY[0x1E0CB37E8];
    v971 = objc_msgSend_selfAllocTokenCountOld(v6, v967, v968, v969);
    objc_msgSend_numberWithInteger_(v970, v972, v971, v973);
    v974 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v975, (uint64_t)v974, v976, CFSTR("qsatc"));

  }
  if (objc_msgSend_has_selfAllocTokenCount(v6, v967, v968, v969))
  {
    v980 = (void *)MEMORY[0x1E0CB37E8];
    v981 = objc_msgSend_selfAllocTokenCount(v6, v977, v978, v979);
    objc_msgSend_numberWithInteger_(v980, v982, v981, v983);
    v984 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v985, (uint64_t)v984, v986, CFSTR("qsats"));

  }
  if (objc_msgSend_has_qrNewSession(v6, v977, v978, v979))
  {
    v990 = (void *)MEMORY[0x1E0CB37E8];
    v991 = objc_msgSend_qrNewSession(v6, v987, v988, v989);
    objc_msgSend_numberWithBool_(v990, v992, v991, v993);
    v994 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v995, (uint64_t)v994, v996, CFSTR("qns"));

  }
  if (objc_msgSend_has_requestType(v6, v987, v988, v989))
  {
    v1000 = (void *)MEMORY[0x1E0CB37E8];
    v1001 = objc_msgSend_requestType(v6, v997, v998, v999);
    objc_msgSend_numberWithInteger_(v1000, v1002, v1001, v1003);
    v1004 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1005, (uint64_t)v1004, v1006, CFSTR("qat"));

  }
  objc_msgSend_idsSessionId(v6, v997, v998, v999);
  v1007 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1007)
  {
    objc_msgSend_idsSessionId(v6, v1008, v1009, v1010);
    v1011 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1012, (uint64_t)v1011, v1013, CFSTR("qids"));

  }
  if (objc_msgSend_has_relayProvider(v6, v1008, v1009, v1010))
  {
    v1017 = (void *)MEMORY[0x1E0CB37E8];
    v1018 = objc_msgSend_relayProvider(v6, v1014, v1015, v1016);
    objc_msgSend_numberWithInteger_(v1017, v1019, v1018, v1020);
    v1021 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1022, (uint64_t)v1021, v1023, CFSTR("qrpr"));

  }
  if (objc_msgSend_has_sharedSession(v6, v1014, v1015, v1016))
  {
    v1027 = (void *)MEMORY[0x1E0CB37E8];
    v1028 = objc_msgSend_sharedSession(v6, v1024, v1025, v1026);
    objc_msgSend_numberWithBool_(v1027, v1029, v1028, v1030);
    v1031 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1032, (uint64_t)v1031, v1033, CFSTR("qrss"));

  }
  objc_msgSend_groupId(v6, v1024, v1025, v1026);
  v1034 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1034)
  {
    objc_msgSend_groupId(v6, v1035, v1036, v1037);
    v1038 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1039, (uint64_t)v1038, v1040, CFSTR("qgid"));

  }
  if (objc_msgSend_has_groupMemberCount(v6, v1035, v1036, v1037))
  {
    v1044 = (void *)MEMORY[0x1E0CB37E8];
    v1045 = objc_msgSend_groupMemberCount(v6, v1041, v1042, v1043);
    objc_msgSend_numberWithInteger_(v1044, v1046, v1045, v1047);
    v1048 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1049, (uint64_t)v1048, v1050, CFSTR("qgmc"));

  }
  if (objc_msgSend_has_allocateInfoAttribute(v6, v1041, v1042, v1043))
  {
    v1054 = (void *)MEMORY[0x1E0CB37E8];
    InfoAttribute = objc_msgSend_allocateInfoAttribute(v6, v1051, v1052, v1053);
    objc_msgSend_numberWithInteger_(v1054, v1056, InfoAttribute, v1057);
    v1058 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1059, (uint64_t)v1058, v1060, CFSTR("qia"));

  }
  objc_msgSend_relayIp(v6, v1051, v1052, v1053);
  v1061 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1061)
  {
    objc_msgSend_relayIp(v6, v1062, v1063, v1064);
    v1065 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1066, (uint64_t)v1065, v1067, CFSTR("qrip"));

  }
  objc_msgSend_relayIpv6(v6, v1062, v1063, v1064);
  v1068 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1068)
  {
    objc_msgSend_relayIpv6(v6, v1069, v1070, v1071);
    v1072 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1073, (uint64_t)v1072, v1074, CFSTR("qrip6"));

  }
  if (objc_msgSend_has_relayPort(v6, v1069, v1070, v1071))
  {
    v1078 = (void *)MEMORY[0x1E0CB37E8];
    v1079 = objc_msgSend_relayPort(v6, v1075, v1076, v1077);
    objc_msgSend_numberWithInteger_(v1078, v1080, v1079, v1081);
    v1082 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1083, (uint64_t)v1082, v1084, CFSTR("qrp"));

  }
  objc_msgSend_relayAccessToken(v6, v1075, v1076, v1077);
  v1085 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1085)
  {
    objc_msgSend_relayAccessToken(v6, v1086, v1087, v1088);
    v1089 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1090, (uint64_t)v1089, v1091, CFSTR("qrst"));

  }
  objc_msgSend_relaySessionKey(v6, v1086, v1087, v1088);
  v1092 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1092)
  {
    objc_msgSend_relaySessionKey(v6, v1093, v1094, v1095);
    v1096 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1097, (uint64_t)v1096, v1098, CFSTR("qrsk"));

  }
  objc_msgSend_relaySessionId(v6, v1093, v1094, v1095);
  v1099 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1099)
  {
    objc_msgSend_relaySessionId(v6, v1100, v1101, v1102);
    v1103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1104, (uint64_t)v1103, v1105, CFSTR("qrsi"));

  }
  if (objc_msgSend_has_expiryEpochTimeMillis(v6, v1100, v1101, v1102))
  {
    v1109 = (void *)MEMORY[0x1E0CB37E8];
    v1110 = objc_msgSend_expiryEpochTimeMillis(v6, v1106, v1107, v1108);
    objc_msgSend_numberWithLongLong_(v1109, v1111, v1110, v1112);
    v1113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1114, (uint64_t)v1113, v1115, CFSTR("qe"));

  }
  objc_msgSend_initiatorIp(v6, v1106, v1107, v1108);
  v1116 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1116)
  {
    objc_msgSend_initiatorIp(v6, v1117, v1118, v1119);
    v1120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1121, (uint64_t)v1120, v1122, CFSTR("qsi"));

  }
  if (objc_msgSend_has_participantId(v6, v1117, v1118, v1119))
  {
    v1126 = (void *)MEMORY[0x1E0CB37E8];
    v1127 = objc_msgSend_participantId(v6, v1123, v1124, v1125);
    objc_msgSend_numberWithUnsignedLongLong_(v1126, v1128, v1127, v1129);
    v1130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1131, (uint64_t)v1130, v1132, CFSTR("qri"));

  }
  objc_msgSend_softwareVersion(v6, v1123, v1124, v1125);
  v1133 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1133)
  {
    objc_msgSend_softwareVersion(v6, v1134, v1135, v1136);
    v1137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1138, (uint64_t)v1137, v1139, CFSTR("qswv"));

  }
  objc_msgSend_relayBuildVersion(v6, v1134, v1135, v1136);
  v1140 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1140)
  {
    objc_msgSend_relayBuildVersion(v6, v1141, v1142, v1143);
    v1144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1145, (uint64_t)v1144, v1146, CFSTR("qrbv"));

  }
  if (objc_msgSend_has_allocationEpochTimeMillis(v6, v1141, v1142, v1143))
  {
    v1150 = (void *)MEMORY[0x1E0CB37E8];
    v1151 = objc_msgSend_allocationEpochTimeMillis(v6, v1147, v1148, v1149);
    objc_msgSend_numberWithLongLong_(v1150, v1152, v1151, v1153);
    v1154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1155, (uint64_t)v1154, v1156, CFSTR("qsat"));

  }
  if (objc_msgSend_has_allocationStatus(v6, v1147, v1148, v1149))
  {
    v1160 = (void *)MEMORY[0x1E0CB37E8];
    v1161 = objc_msgSend_allocationStatus(v6, v1157, v1158, v1159);
    objc_msgSend_numberWithInteger_(v1160, v1162, v1161, v1163);
    v1164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1165, (uint64_t)v1164, v1166, CFSTR("qrs"));

  }
  v1167 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1400 = 0u;
  v1401 = 0u;
  v1402 = 0u;
  v1403 = 0u;
  objc_msgSend_allocationStatuses(v6, v1168, v1169, 0.0);
  v1170 = (void *)objc_claimAutoreleasedReturnValue();
  v1173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1170, v1171, (uint64_t)&v1400, v1172, v1413, 16);
  if (v1173)
  {
    v1176 = v1173;
    v1177 = *(_QWORD *)v1401;
    do
    {
      v1178 = 0;
      do
      {
        if (*(_QWORD *)v1401 != v1177)
          objc_enumerationMutation(v1170);
        objc_msgSend_extractQuickRelayAllocationStatusFrom_(self, v1174, *(_QWORD *)(*((_QWORD *)&v1400 + 1) + 8 * v1178), v1175);
        v1179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v1167, v1180, (uint64_t)v1179, v1181);

        ++v1178;
      }
      while (v1176 != v1178);
      v1176 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1170, v1174, (uint64_t)&v1400, v1175, v1413, 16);
    }
    while (v1176);
  }

  if (objc_msgSend_count(v1167, v1182, v1183, v1184))
    objc_msgSend_setObject_forKey_(v5, v1185, (uint64_t)v1167, v1186, CFSTR("qal"));

  v1187 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1396 = 0u;
  v1397 = 0u;
  v1398 = 0u;
  v1399 = 0u;
  objc_msgSend_selfAllocTokenList(v6, v1188, v1189, 0.0, 0);
  v1190 = (void *)objc_claimAutoreleasedReturnValue();
  v1193 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1190, v1191, (uint64_t)&v1396, v1192, v1412, 16);
  if (v1193)
  {
    v1196 = v1193;
    v1197 = *(_QWORD *)v1397;
    do
    {
      v1198 = 0;
      do
      {
        if (*(_QWORD *)v1397 != v1197)
          objc_enumerationMutation(v1190);
        objc_msgSend_extractQuickRelaySelfAllocTokenFrom_(self, v1194, *(_QWORD *)(*((_QWORD *)&v1396 + 1) + 8 * v1198), v1195);
        v1199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v1187, v1200, (uint64_t)v1199, v1201);

        ++v1198;
      }
      while (v1196 != v1198);
      v1196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1190, v1194, (uint64_t)&v1396, v1195, v1412, 16);
    }
    while (v1196);
  }

  if (objc_msgSend_count(v1187, v1202, v1203, v1204))
    objc_msgSend_setObject_forKey_(v5, v1205, (uint64_t)v1187, v1206, CFSTR("qsatv"));

  objc_msgSend_relayReportingBlob(v6, v1207, v1208, v1209);
  v1210 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1210)
  {
    objc_msgSend_relayReportingBlob(v6, v1211, v1212, v1213);
    v1214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1215, (uint64_t)v1214, v1216, CFSTR("qrep"));

  }
  if (objc_msgSend_has_relayServerType(v6, v1211, v1212, v1213))
  {
    v1220 = (void *)MEMORY[0x1E0CB37E8];
    v1221 = objc_msgSend_relayServerType(v6, v1217, v1218, v1219);
    objc_msgSend_numberWithInteger_(v1220, v1222, v1221, v1223);
    v1224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1225, (uint64_t)v1224, v1226, CFSTR("qrast"));

  }
  if (objc_msgSend_has_qrErrorCode(v6, v1217, v1218, v1219))
  {
    v1230 = (void *)MEMORY[0x1E0CB37E8];
    v1231 = objc_msgSend_qrErrorCode(v6, v1227, v1228, v1229);
    objc_msgSend_numberWithInteger_(v1230, v1232, v1231, v1233);
    v1234 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1235, (uint64_t)v1234, v1236, CFSTR("qec"));

  }
  if (objc_msgSend_has_originalCommand(v6, v1227, v1228, v1229))
  {
    v1240 = (void *)MEMORY[0x1E0CB37E8];
    v1241 = objc_msgSend_originalCommand(v6, v1237, v1238, v1239);
    objc_msgSend_numberWithInteger_(v1240, v1242, v1241, v1243);
    v1244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1245, (uint64_t)v1244, v1246, CFSTR("oC"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_relayHighPriorityPort(v6, v1247, v1248, v1249))
  {
    v1253 = (void *)MEMORY[0x1E0CB37E8];
    v1254 = objc_msgSend_relayHighPriorityPort(v6, v1250, v1251, v1252);
    objc_msgSend_numberWithInteger_(v1253, v1255, v1254, v1256);
    v1257 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1258, (uint64_t)v1257, v1259, CFSTR("qrhpp"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_quickRelayUserType(v6, v1260, v1261, v1262))
  {
    v1266 = (void *)MEMORY[0x1E0CB37E8];
    v1267 = objc_msgSend_quickRelayUserType(v6, v1263, v1264, v1265);
    objc_msgSend_numberWithInteger_(v1266, v1268, v1267, v1269);
    v1270 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1271, (uint64_t)v1270, v1272, CFSTR("qtu"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_ipFamilyPreference(v6, v1273, v1274, v1275))
  {
    v1279 = (void *)MEMORY[0x1E0CB37E8];
    v1280 = objc_msgSend_ipFamilyPreference(v6, v1276, v1277, v1278);
    objc_msgSend_numberWithInteger_(v1279, v1281, v1280, v1282);
    v1283 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1284, (uint64_t)v1283, v1285, CFSTR("qipp"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_isBulkedPayload(v6, v1286, v1287, v1288))
  {
    v1289 = (void *)MEMORY[0x1E0CB37E8];
    isBulkedPayload = objc_msgSend_isBulkedPayload(v6, v1286, v1287, v1288);
    objc_msgSend_numberWithBool_(v1289, v1291, isBulkedPayload, v1292);
    v1293 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1294, (uint64_t)v1293, v1295, CFSTR("iB"));

  }
  if (objc_msgSend_has_wantsAppAck(v6, v1286, v1287, v1288))
  {
    v1299 = (void *)MEMORY[0x1E0CB37E8];
    v1300 = objc_msgSend_wantsAppAck(v6, v1296, v1297, v1298);
    objc_msgSend_numberWithBool_(v1299, v1301, v1300, v1302);
    v1303 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1304, (uint64_t)v1303, v1305, CFSTR("wA"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_errorDomain(v6, v1306, v1307, v1308);
    v1309 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1309)
    {
      objc_msgSend_errorDomain(v6, v1310, v1311, v1312);
      v1313 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v5, v1314, (uint64_t)v1313, v1315, CFSTR("eD"));

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_expectsPeerResponse(v6, v1316, v1317, v1318))
  {
    v1322 = (void *)MEMORY[0x1E0CB37E8];
    v1323 = objc_msgSend_expectsPeerResponse(v6, v1319, v1320, v1321);
    objc_msgSend_numberWithBool_(v1322, v1324, v1323, v1325);
    v1326 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1327, (uint64_t)v1326, v1328, CFSTR("eR"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_allowGDR(v6, v1329, v1330, v1331))
  {
    v1335 = (void *)MEMORY[0x1E0CB37E8];
    v1336 = objc_msgSend_allowGDR(v6, v1332, v1333, v1334);
    objc_msgSend_numberWithInteger_(v1335, v1337, v1336, v1338);
    v1339 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1340, (uint64_t)v1339, v1341, CFSTR("gdr"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_deliveryMinimumTimeDelay(v6, v1342, v1343, v1344))
  {
    v1348 = (void *)MEMORY[0x1E0CB37E8];
    v1349 = objc_msgSend_deliveryMinimumTimeDelay(v6, v1345, v1346, v1347);
    objc_msgSend_numberWithInteger_(v1348, v1350, v1349, v1351);
    v1352 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1353, (uint64_t)v1352, v1354, CFSTR("dMTs"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_deliveryMinimumTime(v6, v1355, v1356, v1357))
  {
    v1361 = (void *)MEMORY[0x1E0CB37E8];
    v1362 = objc_msgSend_deliveryMinimumTime(v6, v1358, v1359, v1360);
    objc_msgSend_numberWithInteger_(v1361, v1363, v1362, v1364);
    v1365 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1366, (uint64_t)v1365, v1367, CFSTR("dmt"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_sendMode(v6, v1368, v1369, v1370))
  {
    v1374 = (void *)MEMORY[0x1E0CB37E8];
    v1375 = objc_msgSend_sendMode(v6, v1371, v1372, v1373);
    objc_msgSend_numberWithInteger_(v1374, v1376, v1375, v1377);
    v1378 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1379, (uint64_t)v1378, v1380, CFSTR("sm"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend_has_isTrustedSender(v6, v1381, v1382, v1383))
  {
    v1387 = (void *)MEMORY[0x1E0CB37E8];
    isTrustedSender = objc_msgSend_isTrustedSender(v6, v1384, v1385, v1386);
    objc_msgSend_numberWithBool_(v1387, v1389, isTrustedSender, v1390);
    v1391 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v1392, (uint64_t)v1391, v1393, CFSTR("htu"));

  }
  v1394 = v5;

  return v1394;
}

- (void)logHeaderDiffAgainstSource:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  NSObject *v11;
  const char *v12;
  double v13;
  uint8_t v14[16];

  v4 = a3;
  objc_msgSend_payload(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToDictionary_(v8, v9, (uint64_t)v4, v10) & 1) == 0)
  {
    OSLogHandleForIDSCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, "Payload received from blastdoor does not match the incoming user payload.", v14, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSAPSUserPayload"), CFSTR("Payload received from blastdoor does not match the incoming user payload."));
    objc_msgSend_logDiffBetween_andTarget_withKeyPath_(self, v12, (uint64_t)v4, v13, v8, CFSTR("."));
  }

}

- (void)logDiffBetween:(id)a3 andTarget:(id)a4 withKeyPath:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  double v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  id v32;
  uint64_t v33;
  __CFString *v34;
  const char *v35;
  id v36;
  id v37;
  const char *v38;
  uint64_t v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;
  id v44;
  const char *v45;
  uint64_t v46;
  double v47;
  void *v48;
  const char *v49;
  double v50;
  const char *v51;
  double v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  double v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;
  id obj;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[128];
  uint8_t buf[4];
  id v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v76 = a5;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = v7;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v82, v10, v95, 16);
  if (v12)
  {
    v13 = "IDSAPSUserPayload";
    v14 = *(_QWORD *)v83;
    v15 = CFSTR("IDSAPSUserPayload");
    v16 = 138413058;
    do
    {
      v17 = 0;
      v74 = v12;
      do
      {
        if (*(_QWORD *)v83 != v14)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v17);
        objc_msgSend_objectForKey_(obj, v11, v18, *(double *)&v16, v67, v68, v69, v70);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v8, v20, v18, v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        if (v19)
        {
          if (v22)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v24, (uint64_t)CFSTR("%@%@ ."), v25, v76, v18);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_logDiffBetween_andTarget_withKeyPath_(self, v27, (uint64_t)v19, v28, v23, v26);

            }
            else if ((objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25) & 1) == 0)
            {
              OSLogHandleForIDSCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413058;
                v88 = v76;
                v89 = 2112;
                v90 = v18;
                v91 = 2112;
                v92 = v19;
                v93 = 2112;
                v94 = v23;
                _os_log_impl(&dword_19B949000, v29, OS_LOG_TYPE_DEFAULT, "HeaderValueMismatch: key {%@%@}}, Source value {%@}, BlastDoor value {%@}", buf, 0x2Au);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                v69 = (uint64_t)v19;
                v70 = v23;
                v67 = v76;
                v68 = v18;
                _IDSLogV(0, CFSTR("IDSFoundation"), v15, CFSTR("HeaderValueMismatch: key {%@%@}}, Source value {%@}, BlastDoor value {%@}"));
              }
            }
          }
          else
          {
            OSLogHandleForIDSCategory();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138413058;
              v88 = v76;
              v89 = 2112;
              v90 = v18;
              v91 = 2112;
              v92 = v31;
              v93 = 2112;
              v94 = v19;
              v32 = v8;
              v33 = v14;
              v34 = v15;
              v35 = v13;
              v36 = v31;
              _os_log_impl(&dword_19B949000, v30, OS_LOG_TYPE_DEFAULT, "MissingHeader: key {%@%@}, object class{%@}, value {%@}", buf, 0x2Au);

              v13 = v35;
              v15 = v34;
              v14 = v33;
              v8 = v32;
              v12 = v74;
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              v69 = objc_opt_class();
              v70 = v19;
              v67 = v76;
              v68 = v18;
              _IDSLogV(0, CFSTR("IDSFoundation"), v15, CFSTR("MissingHeader: key {%@%@}, object class{%@}, value {%@}"));
            }
          }
        }

        ++v17;
      }
      while (v12 != v17);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v82, *(double *)&v16, v95, 16);
    }
    while (v12);
  }

  v37 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend_allKeys(obj, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = (void *)objc_msgSend_initWithArray_(v37, v42, (uint64_t)v41, v43);

  v44 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend_allKeys(v8, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend_initWithArray_(v44, v49, (uint64_t)v48, v50);

  objc_msgSend_minusSet_(v73, v51, (uint64_t)v71, v52);
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  objc_msgSend_allObjects(v73, v53, v54, 0.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v55, (uint64_t)&v78, v56, v86, 16);
  if (v58)
  {
    v59 = *(_QWORD *)v79;
    v60 = 138413058;
    do
    {
      for (i = 0; i != v58; ++i)
      {
        if (*(_QWORD *)v79 != v59)
          objc_enumerationMutation(v75);
        v62 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend_objectForKey_(v8, v57, v62, *(double *)&v60, v67, v68, v69, v70);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        OSLogHandleForIDSCategory();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          v65 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138413058;
          v88 = v76;
          v89 = 2112;
          v90 = v62;
          v91 = 2112;
          v92 = v65;
          v93 = 2112;
          v94 = v63;
          v66 = v65;
          _os_log_impl(&dword_19B949000, v64, OS_LOG_TYPE_DEFAULT, "Extraheader: key {%@%@}, object class{%@}, value {%@}", buf, 0x2Au);

        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v69 = objc_opt_class();
          v70 = v63;
          v67 = v76;
          v68 = v62;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSAPSUserPayload"), CFSTR("Extraheader: key {%@%@}, object class{%@}, value {%@}"));
        }

      }
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v57, (uint64_t)&v78, *(double *)&v60, v86, 16);
    }
    while (v58);
  }

}

- (NSMutableDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
