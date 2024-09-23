@implementation CLEEDUploadRequest

- (CLEEDUploadRequest)initWithID:(id)a3 psapID:(id)a4 partnerID:(id)a5 geofenceID:(id)a6 requestDate:(id)a7 state:(int64_t)a8 baseURL:(id)a9 relativePath:(id)a10 token:(id)a11 sessionID:(id)a12 combinedSecret:(id)a13 mediaList:(id)a14
{
  NSObject *v20;
  CLEEDUploadRequest *v21;
  const char *v22;
  uint64_t v23;
  char *v25;
  int v26;
  objc_super v28;
  int v29;
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  int64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  int64_t v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  id v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v20 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136449283;
    v56 = "-[CLEEDUploadRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:sessi"
          "onID:combinedSecret:mediaList:]";
    v57 = 2114;
    v58 = a3;
    v59 = 2114;
    v60 = a4;
    v61 = 2114;
    v62 = a5;
    v63 = 2114;
    v64 = a6;
    v65 = 2114;
    v66 = a7;
    v67 = 2050;
    v68 = a8;
    v69 = 2114;
    v70 = a9;
    v71 = 2114;
    v72 = a10;
    v73 = 2113;
    v74 = a11;
    v75 = 2113;
    v76 = a12;
    v77 = 2113;
    v78 = a13;
    v79 = 2114;
    v80 = a14;
    _os_log_impl(&dword_18F5B3000, v20, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[ID:%{public}@,psapID:%{public}@,partnerID:%{public}@,geofenceID:%{public}@,requestDate:%{public}@,state:%{public}lu,baseURL:%{public}@,relativePath:%{public}@,token:%{private}@,sessionID:%{private}@,combinedSecret:%{private}@,mediaList:%{public}@]", buf, 0x84u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v29 = 136449283;
    v30 = "-[CLEEDUploadRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:sessi"
          "onID:combinedSecret:mediaList:]";
    v31 = 2114;
    v32 = a3;
    v33 = 2114;
    v34 = a4;
    v35 = 2114;
    v36 = a5;
    v37 = 2114;
    v38 = a6;
    v39 = 2114;
    v40 = a7;
    v41 = 2050;
    v42 = a8;
    v43 = 2114;
    v44 = a9;
    v45 = 2114;
    v46 = a10;
    v47 = 2113;
    v48 = a11;
    v49 = 2113;
    v50 = a12;
    v51 = 2113;
    v52 = a13;
    v53 = 2114;
    v54 = a14;
    v26 = 132;
    v25 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithID:psapID:partnerID:geofenceID:requestDate:state:baseURL:relativePath:token:sessionID:combinedSecret:mediaList:]", "CoreLocation: %s\n", v25);
    if (v25 != (char *)buf)
      free(v25);
  }
  v28.receiver = self;
  v28.super_class = (Class)CLEEDUploadRequest;
  v21 = -[CLEEDRequest initWithID:psapID:partnerID:geofenceID:requestDate:requestType:state:](&v28, sel_initWithID_psapID_partnerID_geofenceID_requestDate_requestType_state_, a3, a4, a5, a6, a7, 2, a8, v26);
  if (v21)
  {
    v21->_baseURL = (NSString *)a9;
    v21->_relativePath = (NSString *)a10;
    v21->_token = (NSString *)a11;
    v21->_sessionID = (NSData *)a12;
    v21->_combinedSecret = (NSData *)a13;
    v21->_mediaList = (NSMutableSet *)(id)objc_msgSend_setWithSet_(MEMORY[0x1E0C99E20], v22, (uint64_t)a14, v23);
    v21->_numDuplicateMediaSelections = 0;
  }
  return v21;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLEEDUploadRequest;
  -[CLEEDRequest dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t i;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  NSString *baseURL;
  void *v21;
  NSString *relativePath;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)CLEEDUploadRequest;
  v3 = -[CLEEDRequest description](&v31, sel_description);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = (void *)objc_msgSend_mediaList(self, v4, v5, v6);
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v27, (uint64_t)v32, 16);
  if (v9)
  {
    v13 = v9;
    v14 = *(_QWORD *)v28;
    v15 = CFSTR("MediaList");
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v7);
        v17 = objc_msgSend_description(*(void **)(*((_QWORD *)&v27 + 1) + 8 * i), v10, v11, v12);
        v15 = (__CFString *)objc_msgSend_stringByAppendingString_(v15, v18, v17, v19);
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v27, (uint64_t)v32, 16);
    }
    while (v13);
  }
  else
  {
    v15 = CFSTR("MediaList");
  }
  baseURL = self->_baseURL;
  v21 = (void *)MEMORY[0x1E0CB3940];
  relativePath = self->_relativePath;
  v23 = objc_msgSend_count(self->_mediaList, v10, v11, v12);
  return (id)objc_msgSend_stringWithFormat_(v21, v24, (uint64_t)CFSTR("%@\n <CLEEDUploadRequest: baseURL:%@, relativePath:%@, mediaListCount:%lu>\n %@"), v25, v3, baseURL, relativePath, v23, v15);
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
  const char *v9;
  const char *v10;
  const char *v11;
  objc_super v12;

  v6 = objc_msgSend_uploadURL(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, (uint64_t)CFSTR("uploadURL"));
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_token, (uint64_t)CFSTR("token"));
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->_sessionID, (uint64_t)CFSTR("sessionID"));
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->_combinedSecret, (uint64_t)CFSTR("combinedSecret"));
  objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)self->_mediaList, (uint64_t)CFSTR("mediaList"));
  v12.receiver = self;
  v12.super_class = (Class)CLEEDUploadRequest;
  -[CLEEDRequest encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
}

- (CLEEDUploadRequest)initWithCoder:(id)a3
{
  CLEEDUploadRequest *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CLEEDUploadRequest;
  v4 = -[CLEEDRequest initWithCoder:](&v24, sel_initWithCoder_);
  if (v4)
  {
    v5 = objc_opt_class();
    v7 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("uploadURL"));
    objc_msgSend_setUploadURL_(v4, v8, (uint64_t)v7, v9);
    v10 = objc_opt_class();
    v4->_token = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, (uint64_t)CFSTR("token"));
    v12 = objc_opt_class();
    v4->_sessionID = (NSData *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, (uint64_t)CFSTR("sessionID"));
    v14 = objc_opt_class();
    v4->_combinedSecret = (NSData *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, (uint64_t)CFSTR("combinedSecret"));
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v21 = objc_msgSend_setWithObjects_(v16, v19, v17, v20, v18, 0);
    v4->_mediaList = (NSMutableSet *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v22, v21, (uint64_t)CFSTR("mediaList"));
  }
  return v4;
}

- (CLEEDUploadRequest)initWithDictionary:(id)a3 decryptedRequestData:(id)a4 baseURL:(id)a5 error:(int64_t *)a6
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
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t SessionStartTimeFromDict;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  const __CFString *v56;
  const __CFString *v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  const char *v63;
  uint64_t v64;
  id v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  const char *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  uint64_t v82;
  const __CFString *v83;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  char *v99;
  char *v100;
  int64_t *v101;
  uint64_t v104;
  void *SessionIDWithPhoneNumber_sessionStartTime;
  uint64_t v106;
  uint8_t buf[4];
  const char *v108;
  __int16 v109;
  uint64_t v110;
  __int16 v111;
  uint64_t v112;
  __int16 v113;
  uint64_t v114;
  __int16 v115;
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  uint64_t v122;
  __int16 v123;
  uint64_t v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  *a6 = 0;
  v9 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("request_ID"), (uint64_t)a4);
  v12 = objc_msgSend_objectForKey_(a3, v10, (uint64_t)CFSTR("partner_ID"), v11);
  v15 = objc_msgSend_objectForKey_(a3, v13, (uint64_t)CFSTR("psap_ID"), v14);
  v106 = objc_msgSend_objectForKey_(a3, v16, (uint64_t)CFSTR("geofence_ID"), v17);
  v20 = (void *)objc_msgSend_valueForKey_(a3, v18, (uint64_t)CFSTR("timestamp"), v19);
  SessionStartTimeFromDict = objc_msgSend_getSessionStartTimeFromDict_(CLEEDRequest, v21, (uint64_t)a3, v22);
  v26 = (void *)objc_msgSend_getCallIDFromDict_(CLEEDRequest, v24, (uint64_t)a3, v25);
  SessionIDWithPhoneNumber_sessionStartTime = (void *)objc_msgSend_getSessionIDWithPhoneNumber_sessionStartTime_(CLEEDCryptoUtilities, v27, (uint64_t)v26, SessionStartTimeFromDict);
  v101 = a6;
  v104 = v15;
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v28 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    v32 = objc_msgSend_integerValue(v20, v29, v30, v31);
    v36 = objc_msgSend_UTF8String(v26, v33, v34, v35);
    v39 = (void *)objc_msgSend_base64EncodedStringWithOptions_(SessionIDWithPhoneNumber_sessionStartTime, v37, 0, v38);
    *(_DWORD *)buf = 136448259;
    v108 = "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    v109 = 2114;
    v110 = v9;
    v111 = 2114;
    v112 = v12;
    v113 = 2114;
    v114 = v104;
    v115 = 2114;
    v116 = v106;
    v117 = 2050;
    v118 = v32;
    v119 = 2050;
    v120 = SessionStartTimeFromDict;
    v121 = 2081;
    v122 = v36;
    v123 = 2081;
    v124 = objc_msgSend_UTF8String(v39, v40, v41, v42);
    _os_log_impl(&dword_18F5B3000, v28, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestID:%{public}@, partnerID:%{public}@, psapID:%{public}@, geofenceID:%{public}@, timestamp:%{public}ld, sessionStartTime:%{public}lld, receivedCallID:%{private}s, sessionID:%{private}s", buf, 0x5Cu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    objc_msgSend_integerValue(v20, v85, v86, v87);
    objc_msgSend_UTF8String(v26, v88, v89, v90);
    v93 = (void *)objc_msgSend_base64EncodedStringWithOptions_(SessionIDWithPhoneNumber_sessionStartTime, v91, 0, v92);
    objc_msgSend_UTF8String(v93, v94, v95, v96);
    v97 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v97);
    if (v97 != (char *)buf)
      free(v97);
  }
  v45 = objc_msgSend_objectForKey_(a4, v43, (uint64_t)CFSTR("request_type"), v44);
  v48 = objc_msgSend_toCLEEDRequestType_(CLEEDRequest, v46, v45, v47);
  v51 = objc_msgSend_objectForKey_(a4, v49, (uint64_t)CFSTR("media_upload_path"), v50);
  v54 = objc_msgSend_objectForKey_(a4, v52, (uint64_t)CFSTR("authentication_token"), v53);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v55 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447235;
    v108 = "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    v109 = 2114;
    v110 = v45;
    v111 = 2050;
    v112 = v48;
    v113 = 2113;
    v114 = v51;
    v115 = 2113;
    v116 = v54;
    _os_log_impl(&dword_18F5B3000, v55, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestTypeString:%{public}@, requestType:%{public}ld, relativeURL:%{private}@, authenticationToken:%{private}@", buf, 0x34u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v98 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v98);
    if (v98 != (char *)buf)
      free(v98);
  }
  v56 = (const __CFString *)v104;
  v57 = (const __CFString *)v12;
  if (v9 && v12 && v104 && v106 && v26 && SessionIDWithPhoneNumber_sessionStartTime && v20 && v51 && v48 && v54)
    goto LABEL_27;
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v58 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v108 = "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    _os_log_impl(&dword_18F5B3000, v58, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more of the expected parameters is not received or valid,early return", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v100 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v100);
    if (v100 != (char *)buf)
      free(v100);
  }
  *v101 = 1;
  if (v9)
  {
LABEL_27:
    v62 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v65 = (id)objc_msgSend_initWithUUIDString_(v62, v63, v9, v64);
  }
  else
  {
    v65 = (id)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v59, v60, v61);
  }
  v69 = (uint64_t)v65;
  v70 = (void *)MEMORY[0x1E0C99D68];
  if (v20)
  {
    v71 = objc_msgSend_integerValue(v20, v66, v67, v68);
    v75 = objc_msgSend_dateWithTimeIntervalSince1970_(v70, v72, v73, v74, (double)v71);
  }
  else
  {
    v75 = objc_msgSend_date(MEMORY[0x1E0C99D68], v66, v67, v68);
  }
  v76 = v75;
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v77 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v108 = "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    v109 = 2114;
    v110 = v69;
    v111 = 2114;
    v112 = v76;
    _os_log_impl(&dword_18F5B3000, v77, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestUUID:%{public}@, requestDate:%{public}@", buf, 0x20u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v99 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v99);
    if (v99 != (char *)buf)
      free(v99);
    v56 = (const __CFString *)v104;
    v57 = (const __CFString *)v12;
  }
  if (v56)
    v79 = v56;
  else
    v79 = CFSTR("UnknownPSAPID");
  if (v57)
    v80 = v57;
  else
    v80 = CFSTR("UnknownPartnerID");
  if (v106)
    v81 = (const __CFString *)v106;
  else
    v81 = CFSTR("UnknownGeofenceID");
  if (*v101)
    v82 = 7;
  else
    v82 = 3;
  v83 = CFSTR("AuthenticationToken");
  if (v54)
    v83 = (const __CFString *)v54;
  return (CLEEDUploadRequest *)objc_msgSend_initWithID_psapID_partnerID_geofenceID_requestDate_state_baseURL_relativePath_token_sessionID_combinedSecret_mediaList_(self, v78, v69, (uint64_t)v79, v80, v81, v76, v82, a5, v51, v83, SessionIDWithPhoneNumber_sessionStartTime, 0, 0);
}

- (NSString)uploadURL
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

- (void)setUploadURL:(id)a3
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
    v68 = "-[CLEEDUploadRequest setUploadURL:]";
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
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDUploadRequest setUploadURL:]", "CoreLocation: %s\n", v66);
    if (v66 != (char *)buf)
      free(v66);
  }
}

- (id)getRequestDict
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *MediaItemDict;
  id v63;
  const char *v64;
  uint64_t v65;
  NSObject *v66;
  NSObject *v67;
  char *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  objc_super v74;
  _BYTE v75[128];
  int v76;
  const char *v77;
  uint8_t buf[4];
  const char *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v74.receiver = self;
  v74.super_class = (Class)CLEEDUploadRequest;
  v3 = -[CLEEDRequest getRequestDict](&v74, sel_getRequestDict);
  if (!v3)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v66 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v79 = "-[CLEEDUploadRequest getRequestDict]";
      _os_log_impl(&dword_18F5B3000, v66, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil uploadRequestDict, early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v76 = 136446210;
    v77 = "-[CLEEDUploadRequest getRequestDict]";
    goto LABEL_32;
  }
  v7 = v3;
  if (!objc_msgSend_sessionID(self, v4, v5, v6))
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v67 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v79 = "-[CLEEDUploadRequest getRequestDict]";
      _os_log_impl(&dword_18F5B3000, v67, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil sessionID, early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v76 = 136446210;
    v77 = "-[CLEEDUploadRequest getRequestDict]";
LABEL_32:
    v69 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLEEDUploadRequest getRequestDict]", "CoreLocation: %s\n", v69);
    if (v69 != (char *)buf)
      free(v69);
    return 0;
  }
  v11 = objc_msgSend_sessionID(self, v8, v9, v10);
  objc_msgSend_setObject_forKey_(v7, v12, v11, (uint64_t)CFSTR("EEDSessionID"));
  v16 = objc_msgSend_relativePath(self, v13, v14, v15);
  objc_msgSend_setObject_forKey_(v7, v17, v16, (uint64_t)CFSTR("media_upload_path"));
  v21 = objc_msgSend_token(self, v18, v19, v20);
  objc_msgSend_setObject_forKey_(v7, v22, v21, (uint64_t)CFSTR("authentication_token"));
  v26 = objc_msgSend_baseURL(self, v23, v24, v25);
  objc_msgSend_setObject_forKey_(v7, v27, v26, (uint64_t)CFSTR("EEDRequestBaseURL"));
  v28 = (void *)MEMORY[0x1E0CB37E8];
  v32 = objc_msgSend_numDuplicateMediaSelections(self, v29, v30, v31);
  v35 = objc_msgSend_numberWithInteger_(v28, v33, v32, v34);
  objc_msgSend_setObject_forKey_(v7, v36, v35, (uint64_t)CFSTR("EEDNumDuplicateMediaSelections"));
  if (objc_msgSend_combinedSecret(self, v37, v38, v39))
  {
    v43 = objc_msgSend_combinedSecret(self, v40, v41, v42);
    objc_msgSend_setObject_forKey_(v7, v44, v43, (uint64_t)CFSTR("EEDCombinedSecret"));
  }
  v45 = (void *)objc_msgSend_mediaList(self, v40, v41, v42);
  if (objc_msgSend_count(v45, v46, v47, v48))
  {
    v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v53 = (void *)objc_msgSend_mediaList(self, v50, v51, v52);
    v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v70, (uint64_t)v75, 16);
    if (v55)
    {
      v59 = v55;
      v60 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v59; ++i)
        {
          if (*(_QWORD *)v71 != v60)
            objc_enumerationMutation(v53);
          MediaItemDict = (void *)objc_msgSend_createMediaItemDict(*(void **)(*((_QWORD *)&v70 + 1) + 8 * i), v56, v57, v58);
          v63 = MediaItemDict;
          objc_msgSend_addObject_(v49, v64, (uint64_t)MediaItemDict, v65);
        }
        v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v70, (uint64_t)v75, 16);
      }
      while (v59);
    }
    objc_msgSend_setValue_forKey_(v7, v56, (uint64_t)v49, (uint64_t)CFSTR("EEDMediaItemSet"));
  }
  return v7;
}

- (CLEEDUploadRequest)initWithDictionary:(id)a3 error:(int64_t *)a4
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  __objc2_class *v16;
  __objc2_class *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  const char *v56;
  uint64_t v57;
  id v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i;
  void *MediaItemFromDict;
  id v85;
  NSObject *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  CLEEDUploadRequest *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  NSObject *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  int64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  int64_t v184;
  char *v185;
  NSObject *info;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  char *v190;
  char *v191;
  const char *v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  char *v205;
  NSObject *v206;
  char *v208;
  char *v209;
  uint64_t v210;
  id v211;
  void *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  _BYTE v224[128];
  int v225;
  const char *v226;
  __int16 v227;
  uint64_t v228;
  __int16 v229;
  uint64_t v230;
  __int16 v231;
  uint64_t v232;
  __int16 v233;
  uint64_t v234;
  __int16 v235;
  uint64_t v236;
  uint8_t buf[4];
  const char *v238;
  __int16 v239;
  uint64_t v240;
  __int16 v241;
  uint64_t v242;
  __int16 v243;
  uint64_t v244;
  __int16 v245;
  uint64_t v246;
  __int16 v247;
  uint64_t v248;
  uint64_t v249;

  v249 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v86 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v238 = "-[CLEEDUploadRequest initWithDictionary:error:]";
      _os_log_impl(&dword_18F5B3000, v86, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil uploadRequestDict or CLEEDHelperError, early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      goto LABEL_91;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v225 = 136446210;
    v226 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    goto LABEL_101;
  }
  *a4 = 0;
  v6 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("request_ID"), (uint64_t)a4);
  v219 = objc_msgSend_objectForKey_(a3, v7, (uint64_t)CFSTR("partner_ID"), v8);
  v218 = objc_msgSend_objectForKey_(a3, v9, (uint64_t)CFSTR("psap_ID"), v10);
  v217 = objc_msgSend_objectForKey_(a3, v11, (uint64_t)CFSTR("geofence_ID"), v12);
  v15 = (void *)objc_msgSend_objectForKey_(a3, v13, (uint64_t)CFSTR("timestamp"), v14);
  v16 = &OBJC_METACLASS___CLHeadingInternal;
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v17 = &OBJC_METACLASS___CLHeadingInternal;
  v18 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447490;
    v238 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    v239 = 2114;
    v240 = v6;
    v241 = 2114;
    v242 = v219;
    v243 = 2114;
    v244 = v218;
    v245 = 2114;
    v246 = v217;
    v247 = 2050;
    v248 = objc_msgSend_integerValue(v15, v19, v20, v21);
    _os_log_impl(&dword_18F5B3000, v18, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestID:%{public}@, partnerID:%{public}@, psapID:%{public}@, geofenceID:%{public}@, timestamp:%{public}ld", buf, 0x3Eu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v225 = 136447490;
    v226 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    v227 = 2114;
    v228 = v6;
    v229 = 2114;
    v230 = v219;
    v231 = 2114;
    v232 = v218;
    v233 = 2114;
    v234 = v217;
    v235 = 2050;
    v236 = objc_msgSend_integerValue(v15, v187, v188, v189);
    v190 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:error:]", "CoreLocation: %s\n", v190);
    if (v190 != (char *)buf)
      free(v190);
    v16 = &OBJC_METACLASS___CLHeadingInternal;
  }
  v24 = objc_msgSend_objectForKey_(a3, v22, (uint64_t)CFSTR("request_type"), v23);
  v27 = objc_msgSend_toCLEEDRequestType_(CLEEDRequest, v25, v24, v26);
  v216 = objc_msgSend_objectForKey_(a3, v28, (uint64_t)CFSTR("media_upload_path"), v29);
  v215 = objc_msgSend_objectForKey_(a3, v30, (uint64_t)CFSTR("authentication_token"), v31);
  v214 = objc_msgSend_objectForKey_(a3, v32, (uint64_t)CFSTR("EEDRequestBaseURL"), v33);
  if (v16[4].isa != (__objc2_class *)-1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v34 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447491;
    v238 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    v239 = 2114;
    v240 = v24;
    v241 = 2050;
    v242 = v27;
    v243 = 2113;
    v244 = v216;
    v245 = 2113;
    v246 = v215;
    v247 = 2113;
    v248 = v214;
    _os_log_impl(&dword_18F5B3000, v34, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestTypeString:%{public}@, requestType:%{public}ld, relativeURL:%{private}@, authenticationToken:%{private}@, baseURL:%{private}@", buf, 0x3Eu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (v16[4].isa != (__objc2_class *)-1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v225 = 136447491;
    v226 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    v227 = 2114;
    v228 = v24;
    v229 = 2050;
    v230 = v27;
    v231 = 2113;
    v232 = v216;
    v233 = 2113;
    v234 = v215;
    v235 = 2113;
    v236 = v214;
    v191 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:error:]", "CoreLocation: %s\n", v191);
    if (v191 != (char *)buf)
      free(v191);
    v16 = &OBJC_METACLASS___CLHeadingInternal;
  }
  v37 = (void *)objc_msgSend_objectForKey_(a3, v35, (uint64_t)CFSTR("EEDSessionID"), v36);
  v213 = (void *)objc_msgSend_objectForKey_(a3, v38, (uint64_t)CFSTR("EEDCombinedSecret"), v39);
  if (v16[4].isa != (__objc2_class *)-1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v40 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    v43 = (void *)objc_msgSend_base64EncodedStringWithOptions_(v37, v41, 0, v42);
    v47 = objc_msgSend_UTF8String(v43, v44, v45, v46);
    v50 = (void *)objc_msgSend_base64EncodedStringWithOptions_(v213, v48, 0, v49);
    v54 = objc_msgSend_UTF8String(v50, v51, v52, v53);
    *(_DWORD *)buf = 136446723;
    v238 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    v239 = 2081;
    v240 = v47;
    v16 = &OBJC_METACLASS___CLHeadingInternal;
    v241 = 2081;
    v242 = v54;
    _os_log_impl(&dword_18F5B3000, v40, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,sessionID:%{private}s, combinedSecret:%{private}s", buf, 0x20u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (v16[4].isa != (__objc2_class *)-1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v194 = (void *)objc_msgSend_base64EncodedStringWithOptions_(v37, v192, 0, v193);
    v198 = objc_msgSend_UTF8String(v194, v195, v196, v197);
    v201 = (void *)objc_msgSend_base64EncodedStringWithOptions_(v213, v199, 0, v200);
    v225 = 136446723;
    v226 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    v227 = 2081;
    v228 = v198;
    v229 = 2081;
    v230 = objc_msgSend_UTF8String(v201, v202, v203, v204);
    v205 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:error:]", "CoreLocation: %s\n", v205);
    if (v205 != (char *)buf)
      free(v205);
    v16 = &OBJC_METACLASS___CLHeadingInternal;
    if (!v6)
      goto LABEL_86;
  }
  else if (!v6)
  {
LABEL_86:
    if (v16[4].isa != (__objc2_class *)-1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v206 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v238 = "-[CLEEDUploadRequest initWithDictionary:error:]";
      _os_log_impl(&dword_18F5B3000, v206, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more of the expected parameters is not available", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      goto LABEL_91;
    bzero(buf, 0x65CuLL);
    if (v16[4].isa != (__objc2_class *)-1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v225 = 136446210;
    v226 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    goto LABEL_101;
  }
  if (!v219 || !v218 || !v217 || !v15 || !v216 || !v27 || !v215 || !v214 || !v37)
    goto LABEL_86;
  v55 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v58 = (id)objc_msgSend_initWithUUIDString_(v55, v56, v6, v57);
  v59 = (void *)MEMORY[0x1E0C99D68];
  v63 = objc_msgSend_integerValue(v15, v60, v61, v62);
  v67 = objc_msgSend_dateWithTimeIntervalSince1970_(v59, v64, v65, v66, (double)v63);
  if (v16[4].isa != (__objc2_class *)-1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v68 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v238 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    v239 = 2114;
    v240 = (uint64_t)v58;
    v241 = 2114;
    v242 = v67;
    _os_log_impl(&dword_18F5B3000, v68, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestUUID:%{public}@, requestDate:%{public}@", buf, 0x20u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (v16[4].isa != (__objc2_class *)-1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v225 = 136446722;
    v226 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    v227 = 2114;
    v228 = (uint64_t)v58;
    v229 = 2114;
    v230 = v67;
    v208 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:error:]", "CoreLocation: %s\n", v208);
    if (v208 != (char *)buf)
      free(v208);
  }
  v71 = (void *)objc_msgSend_valueForKey_(a3, v69, (uint64_t)CFSTR("EEDMediaItemSet"), v70);
  if (objc_msgSend_count(v71, v72, v73, v74))
  {
    v78 = (void *)objc_msgSend_set(MEMORY[0x1E0C99E20], v75, v76, v77);
    v220 = 0u;
    v221 = 0u;
    v222 = 0u;
    v223 = 0u;
    v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v79, (uint64_t)&v220, (uint64_t)v224, 16);
    if (v80)
    {
      v81 = v80;
      v210 = v67;
      v211 = v58;
      v82 = *(_QWORD *)v221;
      do
      {
        for (i = 0; i != v81; ++i)
        {
          if (*(_QWORD *)v221 != v82)
            objc_enumerationMutation(v71);
          MediaItemFromDict = (void *)objc_msgSend_createMediaItemFromDict_(CLEEDMediaItem, v75, *(_QWORD *)(*((_QWORD *)&v220 + 1) + 8 * i), v77);
          v85 = MediaItemFromDict;
          if (MediaItemFromDict)
            objc_msgSend_addObject_(v78, v75, (uint64_t)MediaItemFromDict, v77);
        }
        v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v75, (uint64_t)&v220, (uint64_t)v224, 16);
      }
      while (v81);
      v17 = &OBJC_METACLASS___CLHeadingInternal;
      v67 = v210;
      v58 = v211;
    }
  }
  else
  {
    v78 = 0;
  }
  v87 = (void *)objc_msgSend_valueForKey_(a3, v75, (uint64_t)CFSTR("EEDRequestState"), v77);
  v91 = objc_msgSend_intValue(v87, v88, v89, v90);
  v93 = objc_msgSend_initWithID_psapID_partnerID_geofenceID_requestDate_state_baseURL_relativePath_token_sessionID_combinedSecret_mediaList_(self, v92, (uint64_t)v58, v218, v219, v217, v67, v91, v214, v216, v215, v37, v213, v78);
  if (!v93)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    info = v17[3].info;
    if (os_log_type_enabled(info, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v238 = "-[CLEEDUploadRequest initWithDictionary:error:]";
      _os_log_impl(&dword_18F5B3000, info, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil request, early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      goto LABEL_91;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v225 = 136446210;
    v226 = "-[CLEEDUploadRequest initWithDictionary:error:]";
LABEL_101:
    v209 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLEEDUploadRequest initWithDictionary:error:]", "CoreLocation: %s\n", v209);
    if (v209 != (char *)buf)
      free(v209);
LABEL_91:
    v96 = 0;
    *a4 = 1;
    return v96;
  }
  v96 = (CLEEDUploadRequest *)v93;
  v97 = (void *)objc_msgSend_valueForKey_(a3, v94, (uint64_t)CFSTR("EEDRequestStatusAtFirstUserResponse"), v95);
  v101 = objc_msgSend_intValue(v97, v98, v99, v100);
  objc_msgSend_setRequestStatusAtFirstUserResponse_(v96, v102, v101, v103);
  v106 = (void *)objc_msgSend_objectForKey_(a3, v104, (uint64_t)CFSTR("EEDRequestTransmissionTime"), v105);
  v110 = objc_msgSend_integerValue(v106, v107, v108, v109);
  objc_msgSend_setRequestTransmissionTime_(v96, v111, v110, v112);
  v115 = (void *)objc_msgSend_valueForKey_(a3, v113, (uint64_t)CFSTR("EEDRequestReceivedTime"), v114);
  objc_msgSend_doubleValue(v115, v116, v117, v118);
  objc_msgSend_setRequestReceivedTime_(v96, v119, v120, v121);
  v124 = (void *)objc_msgSend_valueForKey_(a3, v122, (uint64_t)CFSTR("EEDReceivedTimeToFirstUserResponse"), v123);
  objc_msgSend_doubleValue(v124, v125, v126, v127);
  objc_msgSend_setReceivedTimeToFirstUserResponse_(v96, v128, v129, v130);
  v133 = (void *)objc_msgSend_valueForKey_(a3, v131, (uint64_t)CFSTR("EEDReceivedTimeToAcceptTime"), v132);
  objc_msgSend_doubleValue(v133, v134, v135, v136);
  objc_msgSend_setReceivedTimeToAcceptTime_(v96, v137, v138, v139);
  v142 = (void *)objc_msgSend_objectForKey_(a3, v140, (uint64_t)CFSTR("EEDNumMediaSelectIterations"), v141);
  v146 = objc_msgSend_integerValue(v142, v143, v144, v145);
  objc_msgSend_setNumMediaSelectIterations_(v96, v147, v146, v148);
  v151 = (void *)objc_msgSend_objectForKey_(a3, v149, (uint64_t)CFSTR("EEDNumDuplicateMediaSelections"), v150);
  v155 = objc_msgSend_integerValue(v151, v152, v153, v154);
  objc_msgSend_setNumDuplicateMediaSelections_(v96, v156, v155, v157);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v158 = v17[3].info;
  if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
  {
    v162 = objc_msgSend_state(v96, v159, v160, v161);
    v166 = (void *)objc_msgSend_mediaList(v96, v163, v164, v165);
    v170 = objc_msgSend_count(v166, v167, v168, v169);
    v171 = *a4;
    *(_DWORD *)buf = 136447235;
    v238 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    v239 = 2113;
    v240 = (uint64_t)v96;
    v241 = 2050;
    v242 = v162;
    v243 = 2050;
    v244 = v170;
    v245 = 2050;
    v246 = v171;
    _os_log_impl(&dword_18F5B3000, v158, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, constructed CLEEDUploadRequest:%{private}@, state:%{public}ld, mediaListCount:%{public}lu, error:%{public}ld", buf, 0x34u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v175 = objc_msgSend_state(v96, v172, v173, v174);
    v179 = (void *)objc_msgSend_mediaList(v96, v176, v177, v178);
    v183 = objc_msgSend_count(v179, v180, v181, v182);
    v184 = *a4;
    v225 = 136447235;
    v226 = "-[CLEEDUploadRequest initWithDictionary:error:]";
    v227 = 2113;
    v228 = (uint64_t)v96;
    v229 = 2050;
    v230 = v175;
    v231 = 2050;
    v232 = v183;
    v233 = 2050;
    v234 = v184;
    v185 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDUploadRequest initWithDictionary:error:]", "CoreLocation: %s\n", v185);
    if (v185 != (char *)buf)
      free(v185);
  }
  return v96;
}

- (void)updateRequestWithMediaItemList:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  NSObject *v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  int v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  int v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = objc_msgSend_numMediaSelectIterations(self, a2, (uint64_t)a3, v3);
    objc_msgSend_setNumMediaSelectIterations_(self, v7, v6 + 1, v8);
    v12 = objc_msgSend_count(a3, v9, v10, v11);
    v16 = objc_msgSend_mediaList(self, v13, v14, v15);
    objc_msgSend_minusSet_(a3, v17, v16, v18);
    v22 = v12 - objc_msgSend_count(a3, v19, v20, v21);
    v26 = (void *)objc_msgSend_mediaList(self, v23, v24, v25);
    objc_msgSend_unionSet_(v26, v27, (uint64_t)a3, v28);
    v32 = objc_msgSend_numDuplicateMediaSelections(self, v29, v30, v31);
    objc_msgSend_setNumDuplicateMediaSelections_(self, v33, v22 + v32, v34);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v35 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend_count(a3, v36, v37, v38);
      v43 = objc_msgSend_numDuplicateMediaSelections(self, v40, v41, v42);
      v47 = (void *)objc_msgSend_mediaList(self, v44, v45, v46);
      *(_DWORD *)buf = 136447490;
      v73 = "-[CLEEDUploadRequest updateRequestWithMediaItemList:]";
      v74 = 2048;
      v75 = v12;
      v76 = 2048;
      v77 = v39;
      v78 = 1024;
      v79 = v43;
      v80 = 2048;
      v81 = objc_msgSend_count(v47, v48, v49, v50);
      v82 = 1024;
      v83 = objc_msgSend_numMediaSelectIterations(self, v51, v52, v53);
      _os_log_impl(&dword_18F5B3000, v35, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,itemsBeforeRemovingDuplicates:%lu, mediaItemList.count:%lu, numDuplicateMediaSelections:%d, totalItems:%ld, numMediaSelectIterations:%d", buf, 0x36u);
    }
    if (!sub_18F5C4AE0(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    objc_msgSend_count(a3, v54, v55, v56);
    objc_msgSend_numDuplicateMediaSelections(self, v57, v58, v59);
    v63 = (void *)objc_msgSend_mediaList(self, v60, v61, v62);
    objc_msgSend_count(v63, v64, v65, v66);
    objc_msgSend_numMediaSelectIterations(self, v67, v68, v69);
    v70 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDUploadRequest updateRequestWithMediaItemList:]", "CoreLocation: %s\n", v70);
    if (v70 == (char *)buf)
      return;
LABEL_20:
    free(v70);
    return;
  }
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v71 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v73 = "-[CLEEDUploadRequest updateRequestWithMediaItemList:]";
    _os_log_impl(&dword_18F5B3000, v71, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil input parameter(s), early return", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v70 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLEEDUploadRequest updateRequestWithMediaItemList:]", "CoreLocation: %s\n", v70);
    if (v70 != (char *)buf)
      goto LABEL_20;
  }
}

- (NSMutableSet)mediaList
{
  return self->_mediaList;
}

- (void)setMediaList:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
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

- (NSString)token
{
  return self->_token;
}

- (NSData)sessionID
{
  return self->_sessionID;
}

- (NSData)combinedSecret
{
  return self->_combinedSecret;
}

- (void)setCombinedSecret:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (int64_t)numDuplicateMediaSelections
{
  return self->_numDuplicateMediaSelections;
}

- (void)setNumDuplicateMediaSelections:(int64_t)a3
{
  self->_numDuplicateMediaSelections = a3;
}

@end
