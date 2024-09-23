@implementation CLEEDStreamingRequest

- (CLEEDStreamingRequest)initWithID:(id)a3 psapID:(id)a4 partnerID:(id)a5 geofenceID:(id)a6 requestDate:(id)a7 state:(int64_t)a8 baseURL:(id)a9 relativePath:(id)a10 token:(id)a11
{
  NSObject *v18;
  CLEEDStreamingRequest *v19;
  char *v21;
  int v22;
  objc_super v23;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  int64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  int64_t v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v18 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136448515;
    v45 = "-[CLEEDStreamingRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:]";
    v46 = 2114;
    v47 = a3;
    v48 = 2114;
    v49 = a4;
    v50 = 2114;
    v51 = a5;
    v52 = 2114;
    v53 = a6;
    v54 = 2114;
    v55 = a7;
    v56 = 2050;
    v57 = a8;
    v58 = 2114;
    v59 = a9;
    v60 = 2114;
    v61 = a10;
    v62 = 2113;
    v63 = a11;
    _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[ID:%{public}@,psapID:%{public}@,partnerID:%{public}@,geofenceID:%{public}@,requestDate:%{public}@,state:%{public}lu,baseURL:%{public}@,relativePath:%{public}@,token:%{private}@]", buf, 0x66u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v24 = 136448515;
    v25 = "-[CLEEDStreamingRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:]";
    v26 = 2114;
    v27 = a3;
    v28 = 2114;
    v29 = a4;
    v30 = 2114;
    v31 = a5;
    v32 = 2114;
    v33 = a6;
    v34 = 2114;
    v35 = a7;
    v36 = 2050;
    v37 = a8;
    v38 = 2114;
    v39 = a9;
    v40 = 2114;
    v41 = a10;
    v42 = 2113;
    v43 = a11;
    v22 = 102;
    v21 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:]", "CoreLocation: %s\n", v21);
    if (v21 != (char *)buf)
      free(v21);
  }
  v23.receiver = self;
  v23.super_class = (Class)CLEEDStreamingRequest;
  v19 = -[CLEEDRequest initWithID:psapID:partnerID:geofenceID:requestDate:requestType:state:](&v23, sel_initWithID_psapID_partnerID_geofenceID_requestDate_requestType_state_, a3, a4, a5, a6, a7, 1, a8, v22);
  if (v19)
  {
    v19->_baseURL = (NSString *)a9;
    v19->_relativePath = (NSString *)a10;
    v19->_token = (NSString *)a11;
  }
  return v19;
}

- (CLEEDStreamingRequest)initWithDictionary:(id)a3 decryptedRequestData:(id)a4 baseURL:(id)a5 error:(int64_t *)a6
{
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  int64_t *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  uint64_t v64;
  const __CFString *v65;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  int64_t *v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  *a6 = 0;
  v9 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("request_ID"), (uint64_t)a4);
  v12 = objc_msgSend_objectForKey_(a3, v10, (uint64_t)CFSTR("partner_ID"), v11);
  v15 = objc_msgSend_objectForKey_(a3, v13, (uint64_t)CFSTR("psap_ID"), v14);
  v18 = objc_msgSend_objectForKey_(a3, v16, (uint64_t)CFSTR("geofence_ID"), v17);
  v21 = (void *)objc_msgSend_valueForKey_(a3, v19, (uint64_t)CFSTR("timestamp"), v20);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v22 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    v78 = "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    v79 = 2114;
    v80 = v9;
    v81 = 2114;
    v82 = v12;
    v83 = 2114;
    v84 = v15;
    v85 = 2114;
    v86 = v18;
    v87 = 2050;
    v88 = objc_msgSend_integerValue(v21, v23, v24, v25);
    _os_log_impl(&dword_18F5B3000, v22, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestID:%{public}@, partnerID:%{public}@, psapID:%{public}@, geofenceID:%{public}@, timestamp:%{public}ld", buf, 0x3Eu);
  }
  v76 = a6;
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    objc_msgSend_integerValue(v21, v67, v68, v69);
    v70 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v70);
    if (v70 != (char *)buf)
      free(v70);
  }
  v28 = objc_msgSend_objectForKey_(a4, v26, (uint64_t)CFSTR("request_type"), v27);
  v31 = objc_msgSend_toCLEEDRequestType_(CLEEDRequest, v29, v28, v30);
  v34 = objc_msgSend_objectForKey_(a4, v32, (uint64_t)CFSTR("whip_endpoint_path"), v33);
  v37 = objc_msgSend_objectForKey_(a4, v35, (uint64_t)CFSTR("authentication_token"), v36);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v38 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447235;
    v78 = "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    v79 = 2114;
    v80 = v28;
    v81 = 2050;
    v82 = v31;
    v83 = 2113;
    v84 = v34;
    v85 = 2113;
    v86 = v37;
    _os_log_impl(&dword_18F5B3000, v38, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestTypeString:%{public}@, requestType:%{public}ld, relativePath:%{private}@, authenticationToken:%{private}@", buf, 0x34u);
  }
  v39 = v76;
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v71 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v71);
    if (v71 != (char *)buf)
      free(v71);
    v39 = v76;
    if (!v9)
      goto LABEL_19;
  }
  else if (!v9)
  {
    goto LABEL_19;
  }
  if (v12 && v15 && v18 && v21 && v34 && v31 && v37)
  {
LABEL_25:
    v44 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v47 = (id)objc_msgSend_initWithUUIDString_(v44, v45, v9, v46);
    goto LABEL_26;
  }
LABEL_19:
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v40 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v78 = "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    _os_log_impl(&dword_18F5B3000, v40, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more of the expected parameters is not received or valid", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v73 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v73);
    if (v73 != (char *)buf)
      free(v73);
    v39 = v76;
  }
  *v39 = 1;
  if (v9)
    goto LABEL_25;
  v47 = (id)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v41, v42, v43);
LABEL_26:
  v51 = (uint64_t)v47;
  v52 = (void *)MEMORY[0x1E0C99D68];
  if (v21)
  {
    v53 = objc_msgSend_integerValue(v21, v48, v49, v50);
    v57 = objc_msgSend_dateWithTimeIntervalSince1970_(v52, v54, v55, v56, (double)v53);
  }
  else
  {
    v57 = objc_msgSend_date(MEMORY[0x1E0C99D68], v48, v49, v50);
  }
  v58 = v57;
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v59 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v78 = "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    v79 = 2114;
    v80 = v51;
    v81 = 2114;
    v82 = v58;
    _os_log_impl(&dword_18F5B3000, v59, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestUUID:%{public}@, requestDate:%{public}@", buf, 0x20u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v72 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v72);
    if (v72 != (char *)buf)
      free(v72);
    v39 = v76;
  }
  if (v15)
    v61 = (const __CFString *)v15;
  else
    v61 = CFSTR("UnknownPSAPID");
  if (v12)
    v62 = (const __CFString *)v12;
  else
    v62 = CFSTR("UnknownPartnerID");
  if (v18)
    v63 = (const __CFString *)v18;
  else
    v63 = CFSTR("UnknownGeofenceID");
  if (*v39)
    v64 = 7;
  else
    v64 = 3;
  v65 = CFSTR("AuthenticationToken");
  if (v37)
    v65 = (const __CFString *)v37;
  return (CLEEDStreamingRequest *)objc_msgSend_initWithID_psapID_partnerID_geofenceID_requestDate_state_baseURL_relativePath_token_(self, v60, v51, (uint64_t)v61, v62, v63, v58, v64, a5, v34, v65);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLEEDStreamingRequest;
  -[CLEEDRequest dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLEEDStreamingRequest;
  v3 = -[CLEEDRequest description](&v16, sel_description);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_msgSend_streamingURL(self, v5, v6, v7);
  v12 = objc_msgSend_token(self, v9, v10, v11);
  return (id)objc_msgSend_stringWithFormat_(v4, v13, (uint64_t)CFSTR("%@\n <CLEEDStreamingRequest: streamingURL, %@, token, %@>"), v14, v3, v8, v12);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  const char *v8;
  objc_super v9;

  v6 = objc_msgSend_streamingURL(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, (uint64_t)CFSTR("streamingURL"));
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_token, (uint64_t)CFSTR("token"));
  v9.receiver = self;
  v9.super_class = (Class)CLEEDStreamingRequest;
  -[CLEEDRequest encodeWithCoder:](&v9, sel_encodeWithCoder_, a3);
}

- (CLEEDStreamingRequest)initWithCoder:(id)a3
{
  CLEEDStreamingRequest *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLEEDStreamingRequest;
  v4 = -[CLEEDRequest initWithCoder:](&v13, sel_initWithCoder_);
  if (v4)
  {
    v5 = objc_opt_class();
    v7 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("streamingURL"));
    objc_msgSend_setStreamingURL_(v4, v8, (uint64_t)v7, v9);
    v10 = objc_opt_class();
    v4->_token = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, (uint64_t)CFSTR("token"));
  }
  return v4;
}

- (NSString)streamingURL
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_baseURL(self, a2, v2, v3);
  v10 = objc_msgSend_relativePath(self, v7, v8, v9);
  return (NSString *)objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("https://%@/%@"), v12, v6, v10);
}

- (void)setStreamingURL:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], a2, (uint64_t)a3, v3);
  v9 = (id)objc_msgSend_host(v5, v6, v7, v8);
  objc_msgSend_setBaseURL_(self, v10, (uint64_t)v9, v11);
  v15 = (id)objc_msgSend_relativePath(v5, v12, v13, v14);
  objc_msgSend_setRelativePath_(self, v16, (uint64_t)v15, v17);
  v21 = (void *)objc_msgSend_baseURL(self, v18, v19, v20);
  if (objc_msgSend_hasSuffix_(v21, v22, (uint64_t)CFSTR("/"), v23))
  {
    v27 = (void *)objc_msgSend_baseURL(self, v24, v25, v26);
    v31 = (void *)objc_msgSend_baseURL(self, v28, v29, v30);
    v35 = objc_msgSend_length(v31, v32, v33, v34);
    v38 = objc_msgSend_substringToIndex_(v27, v36, v35 - 2, v37);
    objc_msgSend_setBaseURL_(self, v39, v38, v40);
  }
  v41 = (void *)objc_msgSend_relativePath(self, v24, v25, v26);
  if (objc_msgSend_hasPrefix_(v41, v42, (uint64_t)CFSTR("/"), v43))
  {
    v47 = (void *)objc_msgSend_relativePath(self, v44, v45, v46);
    v50 = objc_msgSend_substringFromIndex_(v47, v48, 1, v49);
    objc_msgSend_setRelativePath_(self, v51, v50, v52);
  }
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v53 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v68 = "-[CLEEDStreamingRequest setStreamingURL:]";
    v69 = 2114;
    v70 = objc_msgSend_baseURL(self, v54, v55, v56);
    v71 = 2114;
    v72 = objc_msgSend_relativePath(self, v57, v58, v59);
    _os_log_impl(&dword_18F5B3000, v53, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s,baseURL:%{public}@,relativePath:%{public}@", buf, 0x20u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    objc_msgSend_baseURL(self, v60, v61, v62);
    objc_msgSend_relativePath(self, v63, v64, v65);
    v66 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDStreamingRequest setStreamingURL:]", "CoreLocation: %s\n", v66);
    if (v66 != (char *)buf)
      free(v66);
  }
}

- (id)getRequestDict
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  char *v21;
  objc_super v22;
  int v23;
  const char *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)CLEEDStreamingRequest;
  v6 = -[CLEEDRequest getRequestDict](&v22, sel_getRequestDict);
  if (v6)
  {
    v7 = objc_msgSend_relativePath(self, v3, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v8, v7, (uint64_t)CFSTR("whip_endpoint_path"));
    v12 = objc_msgSend_token(self, v9, v10, v11);
    objc_msgSend_setObject_forKey_(v6, v13, v12, (uint64_t)CFSTR("authentication_token"));
    v17 = objc_msgSend_baseURL(self, v14, v15, v16);
    objc_msgSend_setObject_forKey_(v6, v18, v17, (uint64_t)CFSTR("EEDRequestBaseURL"));
  }
  else
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v19 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v26 = "-[CLEEDStreamingRequest getRequestDict]";
      _os_log_impl(&dword_18F5B3000, v19, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil streamingRequestDict, early return", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v23 = 136446210;
      v24 = "-[CLEEDStreamingRequest getRequestDict]";
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLEEDStreamingRequest getRequestDict]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)buf)
        free(v21);
    }
  }
  return v6;
}

- (CLEEDStreamingRequest)initWithDictionary:(id)a3 error:(int64_t *)a4
{
  int64_t *v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  __objc2_class *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  id v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  CLEEDStreamingRequest *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  NSObject *info;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  NSObject *v126;
  int64_t *v127;
  NSObject *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  char *v133;
  NSObject *v134;
  char *v136;
  char *v137;
  char *v138;
  uint64_t v141;
  uint64_t v142;
  uint8_t buf[4];
  const char *v144;
  __int16 v145;
  uint64_t v146;
  __int16 v147;
  uint64_t v148;
  __int16 v149;
  uint64_t v150;
  __int16 v151;
  uint64_t v152;
  __int16 v153;
  uint64_t v154;
  uint64_t v155;

  v4 = a4;
  v155 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v126 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v144 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
      _os_log_impl(&dword_18F5B3000, v126, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil streamingRequestDict or CLEEDHelperError, early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      goto LABEL_64;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_72;
    goto LABEL_79;
  }
  v6 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("request_ID"), (uint64_t)a4);
  v142 = objc_msgSend_objectForKey_(a3, v7, (uint64_t)CFSTR("partner_ID"), v8);
  v141 = objc_msgSend_objectForKey_(a3, v9, (uint64_t)CFSTR("psap_ID"), v10);
  v13 = objc_msgSend_objectForKey_(a3, v11, (uint64_t)CFSTR("geofence_ID"), v12);
  v16 = (void *)objc_msgSend_valueForKey_(a3, v14, (uint64_t)CFSTR("timestamp"), v15);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v17 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    v144 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
    v145 = 2114;
    v146 = v6;
    v147 = 2114;
    v148 = v142;
    v149 = 2114;
    v150 = v141;
    v151 = 2114;
    v152 = v13;
    v153 = 2050;
    v154 = objc_msgSend_integerValue(v16, v18, v19, v20);
    _os_log_impl(&dword_18F5B3000, v17, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestID:%{public}@, partnerID:%{public}@, psapID:%{public}@, geofenceID:%{public}@, timestamp:%{public}ld", buf, 0x3Eu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    objc_msgSend_integerValue(v16, v129, v130, v131);
    v132 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:error:]", "CoreLocation: %s\n", v132);
    if (v132 != (char *)buf)
      free(v132);
  }
  v23 = objc_msgSend_objectForKey_(a3, v21, (uint64_t)CFSTR("request_type"), v22);
  v26 = objc_msgSend_toCLEEDRequestType_(CLEEDRequest, v24, v23, v25);
  v29 = objc_msgSend_objectForKey_(a3, v27, (uint64_t)CFSTR("whip_endpoint_path"), v28);
  v32 = objc_msgSend_objectForKey_(a3, v30, (uint64_t)CFSTR("authentication_token"), v31);
  v35 = objc_msgSend_valueForKey_(a3, v33, (uint64_t)CFSTR("EEDRequestBaseURL"), v34);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v36 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447491;
    v144 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
    v145 = 2114;
    v146 = v23;
    v147 = 2050;
    v148 = v26;
    v149 = 2113;
    v150 = v29;
    v151 = 2113;
    v152 = v32;
    v153 = 2113;
    v154 = v35;
    _os_log_impl(&dword_18F5B3000, v36, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestTypeString:%{public}@, requestType:%{public}ld, relativePath:%{private}@, authenticationToken:%{private}@, baseURL:%{private}@", buf, 0x3Eu);
  }
  v37 = &OBJC_METACLASS___CLHeadingInternal;
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v133 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:error:]", "CoreLocation: %s\n", v133);
    if (v133 != (char *)buf)
      free(v133);
    v37 = &OBJC_METACLASS___CLHeadingInternal;
    if (!v6)
    {
LABEL_59:
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v4 = a4;
      v134 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v144 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
        _os_log_impl(&dword_18F5B3000, v134, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more of the expected parameters is not received or valid", buf, 0xCu);
      }
      if (!sub_18F5C4AE0(115, 0))
        goto LABEL_64;
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 == -1)
      {
LABEL_72:
        v137 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 0, "-[CLEEDStreamingRequest initWithDictionary:error:]", "CoreLocation: %s\n", v137);
        if (v137 != (char *)buf)
          free(v137);
LABEL_64:
        v63 = 0;
        *v4 = 1;
        return v63;
      }
LABEL_79:
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      goto LABEL_72;
    }
  }
  else if (!v6)
  {
    goto LABEL_59;
  }
  if (!v142 || !v141 || !v13 || !v16 || !v29 || !v26 || !v32 || !v35)
    goto LABEL_59;
  v38 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v41 = (id)objc_msgSend_initWithUUIDString_(v38, v39, v6, v40);
  v42 = (void *)MEMORY[0x1E0C99D68];
  v46 = objc_msgSend_integerValue(v16, v43, v44, v45);
  v50 = objc_msgSend_dateWithTimeIntervalSince1970_(v42, v47, v48, v49, (double)v46);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v51 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v144 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
    v145 = 2114;
    v146 = (uint64_t)v41;
    v147 = 2114;
    v148 = v50;
    _os_log_impl(&dword_18F5B3000, v51, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestUUID:%{public}@, requestDate:%{public}@", buf, 0x20u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v136 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:error:]", "CoreLocation: %s\n", v136);
    if (v136 != (char *)buf)
      free(v136);
    v37 = &OBJC_METACLASS___CLHeadingInternal;
  }
  v54 = (void *)objc_msgSend_valueForKey_(a3, v52, (uint64_t)CFSTR("EEDRequestState"), v53);
  v58 = objc_msgSend_intValue(v54, v55, v56, v57);
  v60 = objc_msgSend_initWithID_psapID_partnerID_geofenceID_requestDate_state_baseURL_relativePath_token_(self, v59, (uint64_t)v41, v141, v142, v13, v50, v58, v35, v29, v32);
  if (v60)
  {
    v63 = (CLEEDStreamingRequest *)v60;
    v64 = (void *)objc_msgSend_objectForKey_(a3, v61, (uint64_t)CFSTR("EEDRequestStatusAtFirstUserResponse"), v62);
    v68 = objc_msgSend_integerValue(v64, v65, v66, v67);
    objc_msgSend_setRequestStatusAtFirstUserResponse_(v63, v69, v68, v70);
    v73 = (void *)objc_msgSend_objectForKey_(a3, v71, (uint64_t)CFSTR("EEDRequestTransmissionTime"), v72);
    v77 = objc_msgSend_integerValue(v73, v74, v75, v76);
    objc_msgSend_setRequestTransmissionTime_(v63, v78, v77, v79);
    v82 = (void *)objc_msgSend_valueForKey_(a3, v80, (uint64_t)CFSTR("EEDRequestReceivedTime"), v81);
    objc_msgSend_doubleValue(v82, v83, v84, v85);
    objc_msgSend_setRequestReceivedTime_(v63, v86, v87, v88);
    v91 = (void *)objc_msgSend_valueForKey_(a3, v89, (uint64_t)CFSTR("EEDReceivedTimeToFirstUserResponse"), v90);
    objc_msgSend_doubleValue(v91, v92, v93, v94);
    objc_msgSend_setReceivedTimeToFirstUserResponse_(v63, v95, v96, v97);
    v100 = (void *)objc_msgSend_valueForKey_(a3, v98, (uint64_t)CFSTR("EEDReceivedTimeToAcceptTime"), v99);
    objc_msgSend_doubleValue(v100, v101, v102, v103);
    objc_msgSend_setReceivedTimeToAcceptTime_(v63, v104, v105, v106);
    v109 = (void *)objc_msgSend_objectForKey_(a3, v107, (uint64_t)CFSTR("EEDNumMediaSelectIterations"), v108);
    v113 = objc_msgSend_integerValue(v109, v110, v111, v112);
    objc_msgSend_setNumMediaSelectIterations_(v63, v114, v113, v115);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    info = v37[3].info;
    if (os_log_type_enabled(info, OS_LOG_TYPE_DEFAULT))
    {
      v120 = objc_msgSend_state(v63, v117, v118, v119);
      v121 = *a4;
      *(_DWORD *)buf = 136446979;
      v144 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
      v145 = 2113;
      v146 = (uint64_t)v63;
      v147 = 2050;
      v148 = v120;
      v149 = 2050;
      v150 = v121;
      _os_log_impl(&dword_18F5B3000, info, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, constructed CLEEDStreamingRequest:%{private}@, state:%{public}ld, error:%{public}ld", buf, 0x2Au);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      objc_msgSend_state(v63, v122, v123, v124);
      v125 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDStreamingRequest initWithDictionary:error:]", "CoreLocation: %s\n", v125);
      if (v125 != (char *)buf)
        free(v125);
    }
  }
  else
  {
    v127 = a4;
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v128 = v37[3].info;
    if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v144 = "-[CLEEDStreamingRequest initWithDictionary:error:]";
      _os_log_impl(&dword_18F5B3000, v128, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil request, early return", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v138 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLEEDStreamingRequest initWithDictionary:error:]", "CoreLocation: %s\n", v138);
      if (v138 != (char *)buf)
        free(v138);
      v127 = a4;
    }
    v63 = 0;
    *v127 = 1;
  }
  return v63;
}

- (NSString)token
{
  return self->_token;
}

- (NSString)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end
