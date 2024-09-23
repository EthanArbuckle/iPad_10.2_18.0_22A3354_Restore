@implementation CLEEDRequest

- (CLEEDRequest)initWithID:(id)a3 psapID:(id)a4 partnerID:(id)a5 geofenceID:(id)a6 requestDate:(id)a7 requestType:(int64_t)a8 state:(int64_t)a9
{
  NSObject *v15;
  CLEEDRequest *v16;
  char *v23;
  objc_super v25;
  int v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  int64_t v39;
  __int16 v40;
  int64_t v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  int64_t v55;
  __int16 v56;
  int64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v15 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136448002;
    v43 = "-[CLEEDRequest initWithID:psapID:partnerID:geofenceID:requestDate:requestType:state:]";
    v44 = 2114;
    v45 = a3;
    v46 = 2114;
    v47 = a4;
    v48 = 2114;
    v49 = a5;
    v50 = 2114;
    v51 = a6;
    v52 = 2114;
    v53 = a7;
    v54 = 2050;
    v55 = a8;
    v56 = 2050;
    v57 = a9;
    _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[ID:%{public}@,psapID:%{public}@,partnerID:%{public}@,geofenceID:%{public}@,requestDate:%{public}@,type:%{public}lu,state:%{public}lu]", buf, 0x52u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v26 = 136448002;
    v27 = "-[CLEEDRequest initWithID:psapID:partnerID:geofenceID:requestDate:requestType:state:]";
    v28 = 2114;
    v29 = a3;
    v30 = 2114;
    v31 = a4;
    v32 = 2114;
    v33 = a5;
    v34 = 2114;
    v35 = a6;
    v36 = 2114;
    v37 = a7;
    v38 = 2050;
    v39 = a8;
    v40 = 2050;
    v41 = a9;
    v23 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequest initWithID:psapID:partnerID:geofenceID:requestDate:requestType:state:]", "CoreLocation: %s\n", v23);
    if (v23 != (char *)buf)
      free(v23);
  }
  v25.receiver = self;
  v25.super_class = (Class)CLEEDRequest;
  v16 = -[CLEEDRequest init](&v25, sel_init);
  if (v16)
  {
    v16->_ID = (NSUUID *)a3;
    v16->_psapID = (NSString *)a4;
    v16->_partnerID = (NSString *)a5;
    v16->_geofenceID = (NSString *)a6;
    v16->_requestDate = (NSDate *)a7;
    v16->_type = a8;
    v16->_state = a9;
    __asm { FMOV            V1.2D, #-1.0 }
    *(_OWORD *)&v16->_requestStatusAtFirstUserResponse = xmmword_18F771FF0;
    *(_OWORD *)&v16->_requestReceivedTime = _Q1;
    v16->_receivedTimeToAcceptTime = -1.0;
    v16->_numMediaSelectIterations = 0;
  }
  return v16;
}

- (CLEEDRequest)initWithDictionary:(id)a3 decryptedRequestData:(id)a4 baseURL:(id)a5 error:(int64_t *)a6
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
  id v29;
  const char *v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  uint64_t v49;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  int v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("request_ID"), (uint64_t)a4, a5);
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
    v58 = "-[CLEEDRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    v59 = 2114;
    v60 = v9;
    v61 = 2114;
    v62 = v12;
    v63 = 2114;
    v64 = v15;
    v65 = 2114;
    v66 = v18;
    v67 = 2050;
    v68 = objc_msgSend_integerValue(v21, v23, v24, v25);
    _os_log_impl(&dword_18F5B3000, v22, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestID:%{public}@, partnerID:%{public}@, psapID:%{public}@, geofenceID:%{public}@, timestamp:%{public}ld", buf, 0x3Eu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    objc_msgSend_integerValue(v21, v51, v52, v53);
    v56 = 62;
    v54 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v54);
    if (v54 != (char *)buf)
      free(v54);
  }
  if (v9)
  {
    v29 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v32 = (id)objc_msgSend_initWithUUIDString_(v29, v30, v9, v31);
  }
  else
  {
    v32 = (id)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v26, v27, v28);
  }
  v36 = (uint64_t)v32;
  v37 = (void *)MEMORY[0x1E0C99D68];
  if (v21)
  {
    v38 = objc_msgSend_integerValue(v21, v33, v34, v35);
    v42 = objc_msgSend_dateWithTimeIntervalSince1970_(v37, v39, v40, v41, (double)v38);
  }
  else
  {
    v42 = objc_msgSend_date(MEMORY[0x1E0C99D68], v33, v34, v35);
  }
  v43 = v42;
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v44 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v58 = "-[CLEEDRequest initWithDictionary:decryptedRequestData:baseURL:error:]";
    v59 = 2114;
    v60 = v36;
    v61 = 2114;
    v62 = v43;
    _os_log_impl(&dword_18F5B3000, v44, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestUUID:%{public}@, requestDate:%{public}@", buf, 0x20u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v56 = 32;
    v55 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequest initWithDictionary:decryptedRequestData:baseURL:error:]", "CoreLocation: %s\n", v55);
    if (v55 != (char *)buf)
      free(v55);
  }
  if (v15)
    v46 = (const __CFString *)v15;
  else
    v46 = CFSTR("UnknownPSAPID");
  if (v12)
    v47 = (const __CFString *)v12;
  else
    v47 = CFSTR("UnknownPartnerID");
  if (v18)
    v48 = (const __CFString *)v18;
  else
    v48 = CFSTR("UnknownGeofenceID");
  v49 = 7;
  if (*a6 == 9)
    v49 = 8;
  return (CLEEDRequest *)objc_msgSend_initWithID_psapID_partnerID_geofenceID_requestDate_requestType_state_(self, v45, v36, (uint64_t)v46, v47, v48, v43, 0, v49, v56);
}

- (CLEEDRequest)initWithDictionary:(id)a3 error:(int64_t *)a4
{
  uint64_t v7;
  const char *v8;

  v7 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("EEDRequestBaseURL"), (uint64_t)a4);
  return (CLEEDRequest *)objc_msgSend_initWithDictionary_decryptedRequestData_baseURL_error_(self, v8, (uint64_t)a3, 0, v7, a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLEEDRequest;
  -[CLEEDRequest dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (void *)objc_msgSend_ID(self, a2, v2, v3);
  v10 = objc_msgSend_UUIDString(v6, v7, v8, v9);
  v14 = objc_msgSend_psapID(self, v11, v12, v13);
  v18 = objc_msgSend_partnerID(self, v15, v16, v17);
  v22 = objc_msgSend_geofenceID(self, v19, v20, v21);
  v26 = objc_msgSend_requestDate(self, v23, v24, v25);
  v30 = objc_msgSend_type(self, v27, v28, v29);
  v34 = objc_msgSend_state(self, v31, v32, v33);
  return (id)objc_msgSend_stringWithFormat_(v5, v35, (uint64_t)CFSTR("<CLEEDRequest: ID, %@, psapID, %@, partnerID, %@, geofenceID, %@, requestDate, %@, type, %lu, state, %lu>"), v36, v10, v14, v18, v22, v26, v30, v34);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSObject *v5;
  NSUUID *ID;
  NSString *psapID;
  NSString *geofenceID;
  NSString *partnerID;
  NSDate *requestDate;
  int64_t type;
  int64_t state;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  char *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  NSUUID *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  NSString *v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  NSDate *v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  int64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v5 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEBUG))
  {
    ID = self->_ID;
    psapID = self->_psapID;
    partnerID = self->_partnerID;
    geofenceID = self->_geofenceID;
    requestDate = self->_requestDate;
    type = self->_type;
    state = self->_state;
    *(_DWORD *)buf = 136448002;
    v22 = "-[CLEEDRequest encodeWithCoder:]";
    v23 = 2114;
    v24 = ID;
    v25 = 2114;
    v26 = psapID;
    v27 = 2114;
    v28 = partnerID;
    v29 = 2114;
    v30 = geofenceID;
    v31 = 2114;
    v32 = requestDate;
    v33 = 2050;
    v34 = type;
    v35 = 2050;
    v36 = state;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[ID:%{public}@,psapID:%{public}@,partnerID:%{public}@,geofenceID:%{public}@,requestDate:%{public}@,type:%{public}lu,state:%{public}lu]", buf, 0x52u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v20 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequest encodeWithCoder:]", "CoreLocation: %s\n", v20);
    if (v20 != (char *)buf)
      free(v20);
  }
  objc_msgSend_encodeObject_forKey_(a3, v13, (uint64_t)self->_ID, (uint64_t)CFSTR("ID"));
  objc_msgSend_encodeObject_forKey_(a3, v14, (uint64_t)self->_psapID, (uint64_t)CFSTR("psapID"));
  objc_msgSend_encodeObject_forKey_(a3, v15, (uint64_t)self->_partnerID, (uint64_t)CFSTR("partnerID"));
  objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)self->_geofenceID, (uint64_t)CFSTR("geofenceID"));
  objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)self->_requestDate, (uint64_t)CFSTR("requestDate"));
  objc_msgSend_encodeInteger_forKey_(a3, v18, self->_type, (uint64_t)CFSTR("type"));
  objc_msgSend_encodeInteger_forKey_(a3, v19, self->_state, (uint64_t)CFSTR("state"));
}

- (CLEEDRequest)initWithCoder:(id)a3
{
  CLEEDRequest *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  NSUUID *ID;
  NSString *psapID;
  NSString *geofenceID;
  NSString *partnerID;
  NSDate *requestDate;
  int64_t type;
  int64_t state;
  NSUUID *v28;
  NSString *v29;
  NSString *v30;
  NSString *v31;
  NSDate *v32;
  int64_t v33;
  int64_t v34;
  char *v35;
  objc_super v36;
  int v37;
  const char *v38;
  __int16 v39;
  NSUUID *v40;
  __int16 v41;
  NSString *v42;
  __int16 v43;
  NSString *v44;
  __int16 v45;
  NSString *v46;
  __int16 v47;
  NSDate *v48;
  __int16 v49;
  int64_t v50;
  __int16 v51;
  int64_t v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  NSUUID *v56;
  __int16 v57;
  NSString *v58;
  __int16 v59;
  NSString *v60;
  __int16 v61;
  NSString *v62;
  __int16 v63;
  NSDate *v64;
  __int16 v65;
  int64_t v66;
  __int16 v67;
  int64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)CLEEDRequest;
  v4 = -[CLEEDRequest init](&v36, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_ID = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("ID"));
    v7 = objc_opt_class();
    v4->_psapID = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, (uint64_t)CFSTR("psapID"));
    v9 = objc_opt_class();
    v4->_partnerID = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, (uint64_t)CFSTR("partnerID"));
    v11 = objc_opt_class();
    v4->_geofenceID = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("geofenceID"));
    v13 = objc_opt_class();
    v4->_requestDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("requestDate"));
    v4->_type = objc_msgSend_decodeIntegerForKey_(a3, v15, (uint64_t)CFSTR("type"), v16);
    v4->_state = objc_msgSend_decodeIntegerForKey_(a3, v17, (uint64_t)CFSTR("state"), v18);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v19 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEBUG))
    {
      ID = v4->_ID;
      psapID = v4->_psapID;
      partnerID = v4->_partnerID;
      geofenceID = v4->_geofenceID;
      requestDate = v4->_requestDate;
      type = v4->_type;
      state = v4->_state;
      *(_DWORD *)buf = 136448002;
      v54 = "-[CLEEDRequest initWithCoder:]";
      v55 = 2114;
      v56 = ID;
      v57 = 2114;
      v58 = psapID;
      v59 = 2114;
      v60 = partnerID;
      v61 = 2114;
      v62 = geofenceID;
      v63 = 2114;
      v64 = requestDate;
      v65 = 2050;
      v66 = type;
      v67 = 2050;
      v68 = state;
      _os_log_impl(&dword_18F5B3000, v19, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[ID:%{public}@,psapID:%{public}@,partnerID:%{public}@,geofenceID:%{public}@,requestDate:%{public}@,type:%{public}lu,state:%{public}lu]", buf, 0x52u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v28 = v4->_ID;
      v29 = v4->_psapID;
      v31 = v4->_partnerID;
      v30 = v4->_geofenceID;
      v32 = v4->_requestDate;
      v33 = v4->_type;
      v34 = v4->_state;
      v37 = 136448002;
      v38 = "-[CLEEDRequest initWithCoder:]";
      v39 = 2114;
      v40 = v28;
      v41 = 2114;
      v42 = v29;
      v43 = 2114;
      v44 = v31;
      v45 = 2114;
      v46 = v30;
      v47 = 2114;
      v48 = v32;
      v49 = 2050;
      v50 = v33;
      v51 = 2050;
      v52 = v34;
      v35 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequest initWithCoder:]", "CoreLocation: %s\n", v35);
      if (v35 != (char *)buf)
        free(v35);
    }
  }
  return v4;
}

+ (id)getDecryptedControlRequestData:(id)a3 sessionID:(id)a4 partnerAdrPublicKeyData:(id)a5 deviceSessionPrivateKey:(__SecKey *)a6 deviceSessionSecret:(id)a7 combinedSecret:(id *)a8 error:(int64_t *)a9
{
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  id v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t DecryptedPartnerSessionSecret_sessionID_partnerID_partnerAdrPublicKeyData_deviceSessionPrivateKey;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t SharedInfoPrefixFromSessionID_partnerID_partnerAdrPublicKeyData_deviceSessionPrivateKey;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  id result;
  NSObject *v75;
  id v76;
  NSObject *v77;
  NSObject *v78;
  int64_t v79;
  NSObject *v80;
  NSObject *v81;
  char *v82;
  char *v83;
  char *v84;
  char *v85;
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint8_t buf[4];
  const char *v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  id v97;
  __int16 v98;
  id v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  id v103;
  __int16 v104;
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4 || !a5 || !a6 || !a7 || !a8)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v75 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v91 = "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devi"
            "ceSessionSecret:combinedSecret:error:]";
      _os_log_impl(&dword_18F5B3000, v75, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_52;
    goto LABEL_66;
  }
  v14 = objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("call_ID"), (uint64_t)a4);
  v17 = (void *)objc_msgSend_valueForKey_(a3, v15, (uint64_t)CFSTR("session_start_time"), v16);
  v21 = objc_msgSend_intValue(v17, v18, v19, v20);
  v24 = objc_msgSend_valueForKey_(a3, v22, (uint64_t)CFSTR("partner_ID"), v23);
  v25 = objc_alloc(MEMORY[0x1E0C99D50]);
  v28 = objc_msgSend_valueForKey_(a3, v26, (uint64_t)CFSTR("partner_session_secret"), v27);
  v88 = (id)objc_msgSend_initWithBase64EncodedString_options_(v25, v29, v28, 0);
  v30 = objc_alloc(MEMORY[0x1E0C99D50]);
  v33 = objc_msgSend_valueForKey_(a3, v31, (uint64_t)CFSTR("partner_key_confirmation"), v32);
  v35 = (id)objc_msgSend_initWithBase64EncodedString_options_(v30, v34, v33, 0);
  v87 = objc_msgSend_valueForKey_(a3, v36, (uint64_t)CFSTR("request_ID"), v37);
  v38 = objc_alloc(MEMORY[0x1E0C99D50]);
  v41 = objc_msgSend_valueForKey_(a3, v39, (uint64_t)CFSTR("request"), v40);
  v42 = v24;
  v43 = v14;
  v45 = (id)objc_msgSend_initWithBase64EncodedString_options_(v38, v44, v41, 0);
  v46 = (uint64_t)v45;
  if (!v43 || !v88 || !v35 || !v87 || !v45 || !v42 || v21 <= 0)
  {
    v76 = v45;
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v77 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136448003;
      v91 = "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devi"
            "ceSessionSecret:combinedSecret:error:]";
      v92 = 2113;
      v93 = v43;
      v94 = 2050;
      v95 = v21;
      v96 = 2113;
      v97 = v88;
      v98 = 2113;
      v99 = v35;
      v100 = 2113;
      v101 = v87;
      v102 = 2113;
      v103 = v76;
      v104 = 2114;
      v105 = v42;
      _os_log_impl(&dword_18F5B3000, v77, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,receivedPhoneNumber:%{private}@, receivedSessionStartTime:%{public}lld, encryptedPartnerSessionSecret:%{private}@, partnerKeyConfirmation:%{private}@,requestID:%{private}@,encryptedRequestData:%{private}@,partnerID:%{public}@", buf, 0x52u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v83 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:combinedSecret:error:]", "CoreLocation: %s\n", v83);
      if (v83 != (char *)buf)
        free(v83);
    }
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v78 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v91 = "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devi"
            "ceSessionSecret:combinedSecret:error:]";
      _os_log_impl(&dword_18F5B3000, v78, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more of received data is nil,early return", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v84 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:combinedSecret:error:]", "CoreLocation: %s\n", v84);
      if (v84 != (char *)buf)
        free(v84);
    }
    result = 0;
    v79 = 1;
    goto LABEL_49;
  }
  v47 = (void *)objc_opt_class();
  DecryptedPartnerSessionSecret_sessionID_partnerID_partnerAdrPublicKeyData_deviceSessionPrivateKey = objc_msgSend_getDecryptedPartnerSessionSecret_sessionID_partnerID_partnerAdrPublicKeyData_deviceSessionPrivateKey_(v47, v48, (uint64_t)v88, (uint64_t)a4, v42, a5, a6);
  if (!DecryptedPartnerSessionSecret_sessionID_partnerID_partnerAdrPublicKeyData_deviceSessionPrivateKey)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v80 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v91 = "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devi"
            "ceSessionSecret:combinedSecret:error:]";
      _os_log_impl(&dword_18F5B3000, v80, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil partnerSessionSecret,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
    {
LABEL_52:
      v82 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:combinedSecret:error:]", "CoreLocation: %s\n", v82);
      if (v82 != (char *)buf)
        free(v82);
      return 0;
    }
LABEL_66:
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    goto LABEL_52;
  }
  v53 = (void *)DecryptedPartnerSessionSecret_sessionID_partnerID_partnerAdrPublicKeyData_deviceSessionPrivateKey;
  v89 = v46;
  v54 = (void *)MEMORY[0x1E0C99DF0];
  v55 = objc_msgSend_length(a7, v50, v51, v52);
  v59 = objc_msgSend_length(v53, v56, v57, v58);
  v62 = (void *)objc_msgSend_dataWithCapacity_(v54, v60, v59 + v55, v61);
  objc_msgSend_appendData_(v62, v63, (uint64_t)a7, v64);
  objc_msgSend_appendData_(v62, v65, (uint64_t)v53, v66);
  *a8 = v62;
  v67 = (void *)objc_opt_class();
  SharedInfoPrefixFromSessionID_partnerID_partnerAdrPublicKeyData_deviceSessionPrivateKey = objc_msgSend_getSharedInfoPrefixFromSessionID_partnerID_partnerAdrPublicKeyData_deviceSessionPrivateKey_(v67, v68, (uint64_t)a4, v42, a5, a6);
  v70 = (void *)objc_opt_class();
  if ((objc_msgSend_validateDerivedSessionSecrets_sharedInfoPrefix_partnerKeyConfirmation_(v70, v71, (uint64_t)v62, SharedInfoPrefixFromSessionID_partnerID_partnerAdrPublicKeyData_deviceSessionPrivateKey, v35) & 1) != 0)
  {
    v72 = (void *)objc_opt_class();
    result = (id)objc_msgSend_getDecryptedRequestDict_requestID_combinedSecret_sharedInfoPrefix_(v72, v73, v89, v87, v62, SharedInfoPrefixFromSessionID_partnerID_partnerAdrPublicKeyData_deviceSessionPrivateKey);
    if (result)
      return result;
  }
  else
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v81 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v91 = "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devi"
            "ceSessionSecret:combinedSecret:error:]";
      _os_log_impl(&dword_18F5B3000, v81, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,validateDerivedSessionSecrets failed, reject request", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v85 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequest getDecryptedControlRequestData:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:combinedSecret:error:]", "CoreLocation: %s\n", v85);
      if (v85 != (char *)buf)
        free(v85);
    }
    result = 0;
  }
  v79 = 9;
LABEL_49:
  *a9 = v79;
  return result;
}

+ (int64_t)requestTypeFromDict:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("request_type"), v3);
  return objc_msgSend_toCLEEDRequestType_(CLEEDRequest, v5, v4, v6);
}

+ (int64_t)toCLEEDRequestType:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  int64_t v7;
  NSObject *v8;
  NSObject *v9;
  char *v11;
  char *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("video_streaming"), v3) & 1) != 0)
    {
      v7 = 1;
    }
    else if (objc_msgSend_isEqualToString_(a3, v5, (uint64_t)CFSTR("media_upload"), v6))
    {
      v7 = 2;
    }
    else
    {
      v7 = 0;
    }
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v9 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "+[CLEEDRequest toCLEEDRequestType:]";
      v15 = 2114;
      v16 = a3;
      v17 = 2050;
      v18 = v7;
      _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestTypeString:%{public}@, requestType:%{public}ld", buf, 0x20u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest toCLEEDRequestType:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf)
        free(v11);
    }
  }
  else
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v8 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_ERROR, "#EED2FWK,toCLEEDRequestType,nil requestTypeString", buf, 2u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequest toCLEEDRequestType:]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf)
        free(v12);
    }
    return 0;
  }
  return v7;
}

+ (id)toCLEEDRequestString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unknownRequest");
  if (a3 == 1)
    v3 = CFSTR("video_streaming");
  if (a3 == 2)
    return CFSTR("media_upload");
  else
    return (id)v3;
}

+ (id)createRequestFromDict:(id)a3 baseURL:(id)a4 sessionID:(id)a5 partnerAdrPublicKeyData:(id)a6 deviceSessionPrivateKey:(__SecKey *)a7 deviceSessionSecret:(id)a8 error:(int64_t *)a9
{
  void *v15;
  const char *v16;
  uint64_t DecryptedControlRequestData_sessionID_partnerAdrPublicKeyData_deviceSessionPrivateKey_deviceSessionSecret_combinedSecret_error;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CLEEDRequest *v23;
  const char *v24;
  void *v25;
  NSObject *v26;
  int64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  CLEEDRequest *v32;
  const char *v33;
  NSObject *v34;
  int64_t v35;
  CLEEDUploadRequest *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  int64_t v47;
  int64_t v48;
  CLEEDStreamingRequest *v49;
  const char *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  int64_t v57;
  int64_t v58;
  uint8_t *v59;
  CLEEDRequest *v60;
  const char *v61;
  NSObject *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  int v83;
  const char *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  int64_t v88;
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  int64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v29 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v90 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      _os_log_impl(&dword_18F5B3000, v29, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, empty message, early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      goto LABEL_39;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v83 = 136446210;
    v84 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceS"
          "essionSecret:error:]";
    goto LABEL_89;
  }
  if (!a4 || !objc_msgSend_length(a4, a2, (uint64_t)a3, (uint64_t)a4))
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v28 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v90 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      _os_log_impl(&dword_18F5B3000, v28, OS_LOG_TYPE_ERROR, "#EED2,%{public}s, nil or empty base URL, early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      goto LABEL_39;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v83 = 136446210;
    v84 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceS"
          "essionSecret:error:]";
    goto LABEL_89;
  }
  if (!a6 || !a7 || !a8)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v30 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v90 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      _os_log_impl(&dword_18F5B3000, v30, OS_LOG_TYPE_ERROR, "#EED2,%{public}s, nil partnerAdrPublicKeyData or  deviceSessionPrivateKey or deviceSessionSecret, early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      goto LABEL_39;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v83 = 136446210;
    v84 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceS"
          "essionSecret:error:]";
LABEL_89:
    v71 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:error:]", "CoreLocation: %s\n", v71);
    if (v71 != (char *)buf)
      free(v71);
LABEL_39:
    v25 = 0;
    *a9 = 1;
    return v25;
  }
  v82 = 0;
  v15 = (void *)objc_opt_class();
  DecryptedControlRequestData_sessionID_partnerAdrPublicKeyData_deviceSessionPrivateKey_deviceSessionSecret_combinedSecret_error = objc_msgSend_getDecryptedControlRequestData_sessionID_partnerAdrPublicKeyData_deviceSessionPrivateKey_deviceSessionSecret_combinedSecret_error_(v15, v16, (uint64_t)a3, (uint64_t)a5, a6, a7, a8, &v82, a9);
  if (!DecryptedControlRequestData_sessionID_partnerAdrPublicKeyData_deviceSessionPrivateKey_deviceSessionSecret_combinedSecret_error)
  {
    *a9 = 9;
    v32 = [CLEEDRequest alloc];
    v25 = (void *)objc_msgSend_initWithDictionary_decryptedRequestData_baseURL_error_(v32, v33, (uint64_t)a3, 0, a4, a9);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v34 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      v35 = *a9;
      *(_DWORD *)buf = 136446722;
      v90 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      v91 = 2114;
      v92 = (uint64_t)v25;
      v93 = 2050;
      v94 = v35;
      _os_log_impl(&dword_18F5B3000, v34, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, decryptedRequestData nil, constructed CLEEDRequest:%{public}@, error:%{public}ld", buf, 0x20u);
    }
    if (!sub_18F5C4AE0(115, 2))
      return v25;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_74;
LABEL_99:
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    goto LABEL_74;
  }
  v18 = DecryptedControlRequestData_sessionID_partnerAdrPublicKeyData_deviceSessionPrivateKey_deviceSessionSecret_combinedSecret_error;
  v19 = (void *)objc_opt_class();
  v22 = objc_msgSend_requestTypeFromDict_(v19, v20, v18, v21);
  if (v22 == 2)
  {
    v36 = [CLEEDUploadRequest alloc];
    v38 = (void *)objc_msgSend_initWithDictionary_decryptedRequestData_baseURL_error_(v36, v37, (uint64_t)a3, v18, a4, a9);
    v25 = v38;
    if (v38)
      objc_msgSend_setCombinedSecret_(v38, v39, v82, v40);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v41 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      v45 = objc_msgSend_uploadURL(v25, v42, v43, v44);
      *(_DWORD *)buf = 136446466;
      v90 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      v91 = 2114;
      v92 = v45;
      _os_log_impl(&dword_18F5B3000, v41, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, uploadURL is: %{public}@", buf, 0x16u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v75 = objc_msgSend_uploadURL(v25, v72, v73, v74);
      v83 = 136446466;
      v84 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      v85 = 2114;
      v86 = v75;
      v76 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:error:]", "CoreLocation: %s\n", v76);
      if (v76 != (char *)buf)
        free(v76);
    }
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v46 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      v47 = *a9;
      *(_DWORD *)buf = 136446723;
      v90 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      v91 = 2113;
      v92 = (uint64_t)v25;
      v93 = 2050;
      v94 = v47;
      _os_log_impl(&dword_18F5B3000, v46, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, constructed CLEEDRequestTypeMediaUpload:%{private}@, error:%{public}ld", buf, 0x20u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v48 = *a9;
      v83 = 136446723;
      v84 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      v85 = 2113;
      v86 = (uint64_t)v25;
      v87 = 2050;
      v88 = v48;
      goto LABEL_75;
    }
    return v25;
  }
  if (v22 == 1)
  {
    v49 = [CLEEDStreamingRequest alloc];
    v25 = (void *)objc_msgSend_initWithDictionary_decryptedRequestData_baseURL_error_(v49, v50, (uint64_t)a3, v18, a4, a9);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v51 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      v55 = objc_msgSend_streamingURL(v25, v52, v53, v54);
      *(_DWORD *)buf = 136446466;
      v90 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      v91 = 2114;
      v92 = v55;
      _os_log_impl(&dword_18F5B3000, v51, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, streamingURL is: %{public}@", buf, 0x16u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v80 = objc_msgSend_streamingURL(v25, v77, v78, v79);
      v83 = 136446466;
      v84 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      v85 = 2114;
      v86 = v80;
      v81 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:error:]", "CoreLocation: %s\n", v81);
      if (v81 != (char *)buf)
        free(v81);
    }
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v56 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      v57 = *a9;
      *(_DWORD *)buf = 136446722;
      v90 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      v91 = 2114;
      v92 = (uint64_t)v25;
      v93 = 2050;
      v94 = v57;
      _os_log_impl(&dword_18F5B3000, v56, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, constructed CLEEDRequestTypeStreaming:%{public}@, error:%{public}ld", buf, 0x20u);
    }
    if (!sub_18F5C4AE0(115, 2))
      return v25;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
    {
LABEL_74:
      v58 = *a9;
      v83 = 136446722;
      v84 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      v85 = 2114;
      v86 = (uint64_t)v25;
      v87 = 2050;
      v88 = v58;
LABEL_75:
      v59 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:error:]", "CoreLocation: %s\n");
LABEL_76:
      if (v59 != buf)
        free(v59);
      return v25;
    }
    goto LABEL_99;
  }
  if (v22)
  {
    *a9 = 1;
    v60 = [CLEEDRequest alloc];
    v25 = (void *)objc_msgSend_initWithDictionary_decryptedRequestData_baseURL_error_(v60, v61, (uint64_t)a3, v18, a4, a9);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v62 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      v63 = (void *)objc_opt_class();
      v66 = objc_msgSend_requestTypeFromDict_(v63, v64, (uint64_t)a3, v65);
      *(_DWORD *)buf = 136446466;
      v90 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      v91 = 2050;
      v92 = v66;
      _os_log_impl(&dword_18F5B3000, v62, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,not handling the request type %{public}ld", buf, 0x16u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v67 = (void *)objc_opt_class();
      v70 = objc_msgSend_requestTypeFromDict_(v67, v68, (uint64_t)a3, v69);
      v83 = 136446466;
      v84 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      v85 = 2050;
      v86 = v70;
      v59 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:deviceSessionSecret:error:]", "CoreLocation: %s\n");
      goto LABEL_76;
    }
  }
  else
  {
    *a9 = 1;
    v23 = [CLEEDRequest alloc];
    v25 = (void *)objc_msgSend_initWithDictionary_decryptedRequestData_baseURL_error_(v23, v24, (uint64_t)a3, v18, a4, a9);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v26 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *a9;
      *(_DWORD *)buf = 136446722;
      v90 = "+[CLEEDRequest createRequestFromDict:baseURL:sessionID:partnerAdrPublicKeyData:deviceSessionPrivateKey:devic"
            "eSessionSecret:error:]";
      v91 = 2114;
      v92 = (uint64_t)v25;
      v93 = 2050;
      v94 = v27;
      _os_log_impl(&dword_18F5B3000, v26, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, constructed CLEEDRequest:%{public}@, error:%{public}ld", buf, 0x20u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 == -1)
        goto LABEL_74;
      goto LABEL_99;
    }
  }
  return v25;
}

- (id)getRequestDict
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t UserResponse;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  NSObject *v114;
  char *v116;
  uint8_t buf[4];
  const char *v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  if (v8)
  {
    v9 = (void *)objc_msgSend_ID(self, v5, v6, v7);
    v13 = objc_msgSend_UUIDString(v9, v10, v11, v12);
    objc_msgSend_setObject_forKey_(v8, v14, v13, (uint64_t)CFSTR("request_ID"));
    v18 = objc_msgSend_psapID(self, v15, v16, v17);
    objc_msgSend_setObject_forKey_(v8, v19, v18, (uint64_t)CFSTR("psap_ID"));
    v20 = (void *)MEMORY[0x1E0CB3940];
    v24 = (void *)objc_msgSend_requestDate(self, v21, v22, v23);
    objc_msgSend_timeIntervalSince1970(v24, v25, v26, v27);
    v31 = objc_msgSend_stringWithFormat_(v20, v28, (uint64_t)CFSTR("%f"), v29, v30);
    objc_msgSend_setObject_forKey_(v8, v32, v31, (uint64_t)CFSTR("timestamp"));
    v36 = objc_msgSend_partnerID(self, v33, v34, v35);
    objc_msgSend_setObject_forKey_(v8, v37, v36, (uint64_t)CFSTR("partner_ID"));
    v41 = objc_msgSend_geofenceID(self, v38, v39, v40);
    objc_msgSend_setObject_forKey_(v8, v42, v41, (uint64_t)CFSTR("geofence_ID"));
    v46 = objc_msgSend_type(self, v43, v44, v45);
    v49 = objc_msgSend_toCLEEDRequestString_(CLEEDRequest, v47, v46, v48);
    objc_msgSend_setObject_forKey_(v8, v50, v49, (uint64_t)CFSTR("request_type"));
    v51 = (void *)MEMORY[0x1E0CB37E8];
    v55 = objc_msgSend_state(self, v52, v53, v54);
    v58 = objc_msgSend_numberWithInteger_(v51, v56, v55, v57);
    objc_msgSend_setObject_forKey_(v8, v59, v58, (uint64_t)CFSTR("EEDRequestState"));
    v60 = (void *)MEMORY[0x1E0CB37E8];
    UserResponse = objc_msgSend_requestStatusAtFirstUserResponse(self, v61, v62, v63);
    v67 = objc_msgSend_numberWithInteger_(v60, v65, UserResponse, v66);
    objc_msgSend_setObject_forKey_(v8, v68, v67, (uint64_t)CFSTR("EEDRequestStatusAtFirstUserResponse"));
    v69 = (void *)MEMORY[0x1E0CB37E8];
    v73 = objc_msgSend_requestTransmissionTime(self, v70, v71, v72);
    v76 = objc_msgSend_numberWithInteger_(v69, v74, v73, v75);
    objc_msgSend_setObject_forKey_(v8, v77, v76, (uint64_t)CFSTR("EEDRequestTransmissionTime"));
    v78 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_requestReceivedTime(self, v79, v80, v81);
    v85 = objc_msgSend_numberWithDouble_(v78, v82, v83, v84);
    objc_msgSend_setObject_forKey_(v8, v86, v85, (uint64_t)CFSTR("EEDRequestReceivedTime"));
    v87 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_receivedTimeToFirstUserResponse(self, v88, v89, v90);
    v94 = objc_msgSend_numberWithDouble_(v87, v91, v92, v93);
    objc_msgSend_setObject_forKey_(v8, v95, v94, (uint64_t)CFSTR("EEDReceivedTimeToFirstUserResponse"));
    v96 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_receivedTimeToAcceptTime(self, v97, v98, v99);
    v103 = objc_msgSend_numberWithDouble_(v96, v100, v101, v102);
    objc_msgSend_setObject_forKey_(v8, v104, v103, (uint64_t)CFSTR("EEDReceivedTimeToAcceptTime"));
    v105 = (void *)MEMORY[0x1E0CB37E8];
    v109 = objc_msgSend_numMediaSelectIterations(self, v106, v107, v108);
    v112 = objc_msgSend_numberWithInteger_(v105, v110, v109, v111);
    objc_msgSend_setObject_forKey_(v8, v113, v112, (uint64_t)CFSTR("EEDNumMediaSelectIterations"));
  }
  else
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v114 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v118 = "-[CLEEDRequest getRequestDict]";
      _os_log_impl(&dword_18F5B3000, v114, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil requestDict, early return", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v116 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "-[CLEEDRequest getRequestDict]", "CoreLocation: %s\n", v116);
      if (v116 != (char *)buf)
        free(v116);
    }
  }
  return v8;
}

+ (id)createRequestFromCachedDict:(id)a3 error:(int64_t *)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t *v11;
  NSObject *v12;
  void *v13;
  CLEEDUploadRequest *v14;
  const char *v15;
  NSObject *v16;
  int64_t v17;
  CLEEDStreamingRequest *v18;
  const char *v19;
  NSObject *v20;
  int64_t v21;
  char *v22;
  NSObject *v23;
  CLEEDRequest *v24;
  const char *v25;
  char *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  int64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = (void *)objc_opt_class();
    v9 = objc_msgSend_requestTypeFromDict_(v6, v7, (uint64_t)a3, v8);
    if (v9 == 2)
    {
      v14 = [CLEEDUploadRequest alloc];
      v13 = (void *)objc_msgSend_initWithDictionary_error_(v14, v15, (uint64_t)a3, (uint64_t)a4);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v16 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *a4;
        *(_DWORD *)buf = 136446723;
        v29 = "+[CLEEDRequest createRequestFromCachedDict:error:]";
        v30 = 2113;
        v31 = v13;
        v32 = 2050;
        v33 = v17;
        _os_log_impl(&dword_18F5B3000, v16, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,constructed CLEEDRequestTypeMediaUpload:%{private}@, error:%{public}ld", buf, 0x20u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 == -1)
        {
LABEL_32:
          v22 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest createRequestFromCachedDict:error:]", "CoreLocation: %s\n", v22);
          if (v22 != (char *)buf)
            free(v22);
          return v13;
        }
LABEL_50:
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        goto LABEL_32;
      }
    }
    else
    {
      if (v9 != 1)
      {
        if (v9)
        {
          *a4 = 1;
          if (qword_1EE1720A0 != -1)
            dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
          v23 = qword_1EE172098;
          if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446210;
            v29 = "+[CLEEDRequest createRequestFromCachedDict:error:]";
            _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,unhandled request type, this should never happen", buf, 0xCu);
          }
          if (!sub_18F5C4AE0(115, 0))
            goto LABEL_39;
          bzero(buf, 0x65CuLL);
          if (qword_1EE1720A0 != -1)
            dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
          v11 = (uint8_t *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequest createRequestFromCachedDict:error:]", "CoreLocation: %s\n");
        }
        else
        {
          *a4 = 1;
          if (qword_1EE1720A0 != -1)
            dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
          v10 = qword_1EE172098;
          if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            v29 = "+[CLEEDRequest createRequestFromCachedDict:error:]";
            _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,CLEEDRequestTypeUnknown, this should never happen", buf, 0xCu);
          }
          if (!sub_18F5C4AE0(115, 2))
            goto LABEL_39;
          bzero(buf, 0x65CuLL);
          if (qword_1EE1720A0 != -1)
            dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
          v11 = (uint8_t *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest createRequestFromCachedDict:error:]", "CoreLocation: %s\n");
        }
        if (v11 != buf)
          free(v11);
LABEL_39:
        v24 = [CLEEDRequest alloc];
        return (id)objc_msgSend_initWithDictionary_error_(v24, v25, (uint64_t)a3, (uint64_t)a4);
      }
      v18 = [CLEEDStreamingRequest alloc];
      v13 = (void *)objc_msgSend_initWithDictionary_error_(v18, v19, (uint64_t)a3, (uint64_t)a4);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v20 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *a4;
        *(_DWORD *)buf = 136446723;
        v29 = "+[CLEEDRequest createRequestFromCachedDict:error:]";
        v30 = 2113;
        v31 = v13;
        v32 = 2050;
        v33 = v21;
        _os_log_impl(&dword_18F5B3000, v20, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,constructed CLEEDRequestTypeStreaming:%{private}@, error:%{public}ld", buf, 0x20u);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 == -1)
          goto LABEL_32;
        goto LABEL_50;
      }
    }
  }
  else
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v12 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v29 = "+[CLEEDRequest createRequestFromCachedDict:error:]";
      _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, empty message, early return", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v27 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequest createRequestFromCachedDict:error:]", "CoreLocation: %s\n", v27);
      if (v27 != (char *)buf)
        free(v27);
    }
    v13 = 0;
    *a4 = 1;
  }
  return v13;
}

+ (id)toEEDControlResponseStatus:(int64_t)a3
{
  const __CFString *v3;
  NSObject *v4;
  char *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) > 0x11)
    v3 = CFSTR("UnknownError");
  else
    v3 = (const __CFString *)*((_QWORD *)&off_1E2991598 + a3 - 1);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v4 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v8 = "+[CLEEDRequest toEEDControlResponseStatus:]";
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,responseStatus:%{public}@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest toEEDControlResponseStatus:]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf)
      free(v6);
  }
  return (id)v3;
}

- (id)getResponseDataDictionary
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("request_ID");
  v5 = (void *)objc_msgSend_ID(self, a2, v2, v3);
  v17[1] = CFSTR("request_status");
  v18[0] = objc_msgSend_UUIDString(v5, v6, v7, v8);
  v12 = objc_msgSend_state(self, v9, v10, v11);
  v18[1] = objc_msgSend_toEEDControlResponseStatus_(CLEEDRequest, v13, v12, v14);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v18, (uint64_t)v17, 2);
}

+ (id)getPartnerIDFromDict:(id)a3
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  char *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("partner_ID"), v3);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v5 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v4;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "#EED2,getPartnerIDFromDict,partnerID:%{public}@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getPartnerIDFromDict:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf)
      free(v7);
  }
  if (v4)
    return v4;
  else
    return CFSTR("UnknownPartnerID");
}

+ (id)getCallIDFromDict:(id)a3
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  char *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("call_ID"), v3);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v5 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v4;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "#EED2,getCallIDFromDict,callID:%{public}@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getCallIDFromDict:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf)
      free(v7);
  }
  if (v4)
    return v4;
  else
    return CFSTR("UnknownCallID");
}

+ (int64_t)getSessionStartTimeFromDict:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  char *v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("session_start_time"), v3);
  v8 = objc_msgSend_intValue(v4, v5, v6, v7);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v9 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v13 = v8;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "#EED2,getSessionStartTimeFromDict,SessionStartTime:%{public}lld", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getSessionStartTimeFromDict:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf)
      free(v11);
  }
  return v8;
}

+ (id)getSharedInfoPrefixFromSessionID:(id)a3 partnerID:(id)a4 partnerAdrPublicKeyData:(id)a5 deviceSessionPrivateKey:(__SecKey *)a6
{
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  NSObject *v45;
  char *v46;
  NSObject *v47;
  uint8_t *v48;
  NSObject *v49;
  NSObject *v50;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4 || !a5 || !a6)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v47 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v53 = "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      _os_log_impl(&dword_18F5B3000, v47, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_22;
    goto LABEL_42;
  }
  v9 = objc_msgSend_copyPublicKeyFromPrivateKey_(CLEEDCryptoUtilities, a2, (uint64_t)a6, (uint64_t)a4);
  if (!v9)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v49 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v53 = "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      _os_log_impl(&dword_18F5B3000, v49, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,nil deviceSessionPublicKey, early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 2))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v48 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n");
    goto LABEL_31;
  }
  v12 = (const void *)v9;
  v13 = (id)objc_msgSend_createKeyExternalRepresentation_(CLEEDCryptoUtilities, v10, v9, v11);
  CFRelease(v12);
  if (!v13)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v50 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v53 = "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      _os_log_impl(&dword_18F5B3000, v50, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil deviceSessionPublicKeyData, early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_22;
LABEL_42:
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
LABEL_22:
    v48 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n");
LABEL_31:
    if (v48 != buf)
      free(v48);
    return 0;
  }
  v17 = (void *)MEMORY[0x1E0C99DF0];
  v18 = objc_msgSend_length(a3, v14, v15, v16);
  v22 = objc_msgSend_length(a4, v19, v20, v21) + v18;
  v26 = v22 + objc_msgSend_length(a5, v23, v24, v25);
  v30 = objc_msgSend_length(v13, v27, v28, v29);
  v33 = (void *)objc_msgSend_dataWithCapacity_(v17, v31, v26 + v30, v32);
  objc_msgSend_appendData_(v33, v34, (uint64_t)a3, v35);
  v38 = objc_msgSend_dataUsingEncoding_(a4, v36, 4, v37);
  objc_msgSend_appendData_(v33, v39, v38, v40);
  objc_msgSend_appendData_(v33, v41, (uint64_t)a5, v42);
  objc_msgSend_appendData_(v33, v43, (uint64_t)v13, v44);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v45 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447491;
    v53 = "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
    v54 = 2114;
    v55 = a3;
    v56 = 2114;
    v57 = a4;
    v58 = 2114;
    v59 = a5;
    v60 = 2114;
    v61 = v13;
    v62 = 2113;
    v63 = v33;
    _os_log_impl(&dword_18F5B3000, v45, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,session ID = %{public}@, partner ID = %{public}@, ADR public key = %{public}@,device session public key = %{public}@, sharedInfoPrefix = %{private}@", buf, 0x3Eu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v46 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getSharedInfoPrefixFromSessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n", v46);
    if (v46 != (char *)buf)
      free(v46);
  }
  return v33;
}

+ (id)getDecryptedPartnerSessionSecret:(id)a3 sessionID:(id)a4 partnerID:(id)a5 partnerAdrPublicKeyData:(id)a6 deviceSessionPrivateKey:(__SecKey *)a7
{
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  void *ECIESDecryptedData_key_sharedInfo;
  NSObject *v49;
  char *v50;
  NSObject *v51;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (a3 && a4 && a5 && a6 && a7)
  {
    v12 = (void *)MEMORY[0x1E0C99DF0];
    v13 = objc_msgSend_length(a6, a2, (uint64_t)a3, (uint64_t)a4);
    v17 = objc_msgSend_length(a3, v14, v15, v16);
    v20 = (void *)objc_msgSend_dataWithCapacity_(v12, v18, v17 + v13, v19);
    objc_msgSend_appendData_(v20, v21, (uint64_t)a6, v22);
    objc_msgSend_appendData_(v20, v23, (uint64_t)a3, v24);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v25 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v58 = "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      v59 = 2114;
      v60 = a6;
      _os_log_impl(&dword_18F5B3000, v25, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,partner ADR public key = %{public}@\n", buf, 0x16u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v53 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n", v53);
      if (v53 != (char *)buf)
        free(v53);
    }
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v26 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446467;
      v58 = "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      v59 = 2113;
      v60 = v20;
      _os_log_impl(&dword_18F5B3000, v26, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,full encrypted partner session secret blob = %{private}@\n", buf, 0x16u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v54 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n", v54);
      if (v54 != (char *)buf)
        free(v54);
    }
    v30 = (void *)MEMORY[0x1E0C99DF0];
    v31 = objc_msgSend_length(a4, v27, v28, v29);
    v35 = objc_msgSend_length(a5, v32, v33, v34);
    v38 = (void *)objc_msgSend_dataWithCapacity_(v30, v36, v35 + v31, v37);
    objc_msgSend_appendData_(v38, v39, (uint64_t)a4, v40);
    v43 = objc_msgSend_dataUsingEncoding_(a5, v41, 4, v42);
    objc_msgSend_appendData_(v38, v44, v43, v45);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v46 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446467;
      v58 = "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      v59 = 2113;
      v60 = v20;
      _os_log_impl(&dword_18F5B3000, v46, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,shared info = %{private}@\n", buf, 0x16u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v55 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n", v55);
      if (v55 != (char *)buf)
        free(v55);
    }
    ECIESDecryptedData_key_sharedInfo = (void *)objc_msgSend_getECIESDecryptedData_key_sharedInfo_(CLEEDCryptoUtilities, v47, (uint64_t)v20, (uint64_t)a7, v38);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v49 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446467;
      v58 = "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      v59 = 2113;
      v60 = ECIESDecryptedData_key_sharedInfo;
      _os_log_impl(&dword_18F5B3000, v49, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,partner session secret = %{private}@\n", buf, 0x16u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v50 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n", v50);
      if (v50 != (char *)buf)
        free(v50);
    }
  }
  else
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v51 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v58 = "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]";
      _os_log_impl(&dword_18F5B3000, v51, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v56 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequest getDecryptedPartnerSessionSecret:sessionID:partnerID:partnerAdrPublicKeyData:deviceSessionPrivateKey:]", "CoreLocation: %s\n", v56);
      if (v56 != (char *)buf)
        free(v56);
    }
    return 0;
  }
  return ECIESDecryptedData_key_sharedInfo;
}

+ (BOOL)validateDerivedSessionSecrets:(id)a3 sharedInfoPrefix:(id)a4 partnerKeyConfirmation:(id)a5
{
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  void *DerivedKeyWithLength_secretData_additionalInfo;
  const char *v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  void *GMACWithAuthData_key_iv;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  BOOL result;
  NSObject *v43;
  int v44;
  NSObject *v45;
  int v46;
  NSObject *v47;
  int v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v8 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446467;
    v55 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
    v56 = 2113;
    v57 = a3;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,combined secret = %{private}@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v49 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]", "CoreLocation: %s\n", v49);
    if (v49 != (char *)buf)
      free(v49);
  }
  v11 = objc_msgSend_dataUsingEncoding_(CFSTR("partner key confirmation"), v9, 4, v10);
  v12 = (void *)MEMORY[0x1E0C99DF0];
  v16 = objc_msgSend_length(a4, v13, v14, v15);
  v20 = objc_msgSend_length(CFSTR("partner key confirmation"), v17, v18, v19);
  v23 = (void *)objc_msgSend_dataWithCapacity_(v12, v21, v20 + v16, v22);
  objc_msgSend_appendData_(v23, v24, (uint64_t)a4, v25);
  objc_msgSend_appendData_(v23, v26, v11, v27);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v28 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446467;
    v55 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
    v56 = 2113;
    v57 = v23;
    _os_log_impl(&dword_18F5B3000, v28, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, shared info =%{private}@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v50 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]", "CoreLocation: %s\n", v50);
    if (v50 != (char *)buf)
      free(v50);
  }
  DerivedKeyWithLength_secretData_additionalInfo = (void *)objc_msgSend_getDerivedKeyWithLength_secretData_additionalInfo_(CLEEDCryptoUtilities, v29, 48, (uint64_t)a3, v23);
  if (!DerivedKeyWithLength_secretData_additionalInfo)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v43 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v55 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
      _os_log_impl(&dword_18F5B3000, v43, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil derivedKeyBlob,early return", buf, 0xCu);
    }
    v44 = sub_18F5C4AE0(115, 0);
    result = 0;
    if (!v44)
      return result;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      goto LABEL_67;
    goto LABEL_64;
  }
  v32 = DerivedKeyWithLength_secretData_additionalInfo;
  v33 = objc_msgSend_subdataWithRange_(DerivedKeyWithLength_secretData_additionalInfo, v31, 0, 32);
  v35 = objc_msgSend_subdataWithRange_(v32, v34, 32, 16);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v36 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446979;
    v55 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
    v56 = 2113;
    v57 = v32;
    v58 = 2113;
    v59 = v33;
    v60 = 2113;
    v61 = v35;
    _os_log_impl(&dword_18F5B3000, v36, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,derived key blob = %{private}@,derived key = %{private}@, derived IV blob = %{private}@", buf, 0x2Au);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v51 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]", "CoreLocation: %s\n", v51);
    if (v51 != (char *)buf)
      free(v51);
  }
  if (!v33 || !v35)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v45 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v55 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
      _os_log_impl(&dword_18F5B3000, v45, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil derivedKey or derivedIV,early return", buf, 0xCu);
    }
    v46 = sub_18F5C4AE0(115, 0);
    result = 0;
    if (!v46)
      return result;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      goto LABEL_67;
LABEL_64:
    v53 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]", "CoreLocation: %s\n", v53);
    if (v53 != (char *)buf)
      free(v53);
    return 0;
  }
  GMACWithAuthData_key_iv = (void *)objc_msgSend_getGMACWithAuthData_key_iv_(CLEEDCryptoUtilities, v37, v11, v33, v35);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v39 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446467;
    v55 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
    v56 = 2113;
    v57 = GMACWithAuthData_key_iv;
    _os_log_impl(&dword_18F5B3000, v39, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,partner key confirmation tag = %{private}@\n", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v52 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]", "CoreLocation: %s\n", v52);
    if (v52 != (char *)buf)
      free(v52);
  }
  if (GMACWithAuthData_key_iv && (objc_msgSend_isEqualToData_(GMACWithAuthData_key_iv, v40, (uint64_t)a5, v41) & 1) != 0)
    return 1;
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v47 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v55 = "+[CLEEDRequest validateDerivedSessionSecrets:sharedInfoPrefix:partnerKeyConfirmation:]";
    _os_log_impl(&dword_18F5B3000, v47, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil computedPartnerKeyConfirmation or partner key confirmation does not match\n", buf, 0xCu);
  }
  v48 = sub_18F5C4AE0(115, 0);
  result = 0;
  if (v48)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_64;
LABEL_67:
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    goto LABEL_64;
  }
  return result;
}

+ (id)getDecryptedRequestDict:(id)a3 requestID:(id)a4 combinedSecret:(id)a5 sharedInfoPrefix:(id)a6
{
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  void *DerivedKeyWithLength_secretData_additionalInfo;
  const char *v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t AESGCMDecryptedData_key_iv_authTag;
  const char *v62;
  uint64_t v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  NSObject *v109;
  void *v110;
  NSObject *v112;
  char *v113;
  char *v114;
  char *v115;
  char *v116;
  void *v117;
  int v118;
  const char *v119;
  __int16 v120;
  _BYTE v121[28];
  uint8_t buf[4];
  const char *v123;
  __int16 v124;
  _BYTE v125[28];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v10 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446723;
    v123 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    v124 = 2113;
    *(_QWORD *)v125 = a5;
    *(_WORD *)&v125[8] = 2113;
    *(_QWORD *)&v125[10] = a6;
    _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,combined secret = %{private}@, sharedInfoPrefix = %{private}@", buf, 0x20u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v118 = 136446723;
    v119 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    v120 = 2113;
    *(_QWORD *)v121 = a5;
    *(_WORD *)&v121[8] = 2113;
    *(_QWORD *)&v121[10] = a6;
    v114 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]", "CoreLocation: %s\n", v114);
    if (v114 != (char *)buf)
      free(v114);
  }
  if (!a3 || !a4 || !a5 || !a6)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v106 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v123 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
      _os_log_impl(&dword_18F5B3000, v106, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one ore more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v118 = 136446210;
    v119 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    goto LABEL_89;
  }
  v13 = objc_msgSend_dataUsingEncoding_(CFSTR("partner request"), v11, 4, v12);
  v14 = (void *)MEMORY[0x1E0C99DF0];
  v18 = objc_msgSend_length(a6, v15, v16, v17);
  v22 = objc_msgSend_length(a4, v19, v20, v21) + v18;
  v26 = objc_msgSend_length(CFSTR("partner request"), v23, v24, v25);
  v29 = (void *)objc_msgSend_dataWithCapacity_(v14, v27, v22 + v26, v28);
  objc_msgSend_appendData_(v29, v30, (uint64_t)a6, v31);
  v34 = objc_msgSend_dataUsingEncoding_(a4, v32, 4, v33);
  objc_msgSend_appendData_(v29, v35, v34, v36);
  objc_msgSend_appendData_(v29, v37, v13, v38);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v39 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446467;
    v123 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    v124 = 2113;
    *(_QWORD *)v125 = v29;
    _os_log_impl(&dword_18F5B3000, v39, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, shared info =%{private}@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v118 = 136446467;
    v119 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    v120 = 2113;
    *(_QWORD *)v121 = v29;
    v115 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]", "CoreLocation: %s\n", v115);
    if (v115 != (char *)buf)
      free(v115);
  }
  DerivedKeyWithLength_secretData_additionalInfo = (void *)objc_msgSend_getDerivedKeyWithLength_secretData_additionalInfo_(CLEEDCryptoUtilities, v40, 48, (uint64_t)a5, v29);
  if (!DerivedKeyWithLength_secretData_additionalInfo)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v107 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v123 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
      _os_log_impl(&dword_18F5B3000, v107, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil derivedKeyBlob,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v118 = 136446210;
    v119 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    goto LABEL_89;
  }
  v43 = DerivedKeyWithLength_secretData_additionalInfo;
  v44 = objc_msgSend_subdataWithRange_(DerivedKeyWithLength_secretData_additionalInfo, v42, 0, 32);
  v46 = objc_msgSend_subdataWithRange_(v43, v45, 32, 16);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v47 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446979;
    v123 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    v124 = 2113;
    *(_QWORD *)v125 = v43;
    *(_WORD *)&v125[8] = 2113;
    *(_QWORD *)&v125[10] = v44;
    *(_WORD *)&v125[18] = 2113;
    *(_QWORD *)&v125[20] = v46;
    _os_log_impl(&dword_18F5B3000, v47, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,derived key blob = %{private}@,derived key = %{private}@, derived IV blob = %{private}@", buf, 0x2Au);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v118 = 136446979;
    v119 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    v120 = 2113;
    *(_QWORD *)v121 = v43;
    *(_WORD *)&v121[8] = 2113;
    *(_QWORD *)&v121[10] = v44;
    *(_WORD *)&v121[18] = 2113;
    *(_QWORD *)&v121[20] = v46;
    v116 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]", "CoreLocation: %s\n", v116);
    if (v116 != (char *)buf)
      free(v116);
  }
  if (!v44 || !v46)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v108 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v123 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
      _os_log_impl(&dword_18F5B3000, v108, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil derivedKey or derivedIV,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v118 = 136446210;
    v119 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    goto LABEL_89;
  }
  v51 = objc_msgSend_length(a3, v48, v49, v50);
  v53 = objc_msgSend_subdataWithRange_(a3, v52, 0, v51 - 16);
  v57 = objc_msgSend_length(a3, v54, v55, v56);
  v59 = objc_msgSend_subdataWithRange_(a3, v58, v57 - 16, 16);
  AESGCMDecryptedData_key_iv_authTag = objc_msgSend_getAESGCMDecryptedData_key_iv_authTag_(CLEEDCryptoUtilities, v60, v53, v44, v46, v59);
  if (!AESGCMDecryptedData_key_iv_authTag)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v109 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v123 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
      _os_log_impl(&dword_18F5B3000, v109, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,getAESGCMDecryptedData returned nil request data, early return\n", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v118 = 136446210;
    v119 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
LABEL_89:
    v105 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]", "CoreLocation: %s\n", v105);
    if (v105 == (char *)buf)
      return 0;
LABEL_90:
    free(v105);
    return 0;
  }
  v117 = 0;
  v63 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v62, AESGCMDecryptedData_key_iv_authTag, 1, &v117);
  if (v117)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v64 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      v68 = objc_msgSend_code(v117, v65, v66, v67);
      v72 = (void *)objc_msgSend_domain(v117, v69, v70, v71);
      v76 = objc_msgSend_UTF8String(v72, v73, v74, v75);
      v80 = (void *)objc_msgSend_localizedDescription(v117, v77, v78, v79);
      v84 = objc_msgSend_UTF8String(v80, v81, v82, v83);
      *(_DWORD *)buf = 136446978;
      v123 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
      v124 = 1026;
      *(_DWORD *)v125 = v68;
      *(_WORD *)&v125[4] = 2082;
      *(_QWORD *)&v125[6] = v76;
      *(_WORD *)&v125[14] = 2082;
      *(_QWORD *)&v125[16] = v84;
      _os_log_impl(&dword_18F5B3000, v64, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to deserialize json dictionary,error code,%{public}d,domain,%{public}s,reason,%{public}s\n", buf, 0x26u);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v88 = objc_msgSend_code(v117, v85, v86, v87);
    v92 = (void *)objc_msgSend_domain(v117, v89, v90, v91);
    v96 = objc_msgSend_UTF8String(v92, v93, v94, v95);
    v100 = (void *)objc_msgSend_localizedDescription(v117, v97, v98, v99);
    v104 = objc_msgSend_UTF8String(v100, v101, v102, v103);
    v118 = 136446978;
    v119 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    v120 = 1026;
    *(_DWORD *)v121 = v88;
    *(_WORD *)&v121[4] = 2082;
    *(_QWORD *)&v121[6] = v96;
    *(_WORD *)&v121[14] = 2082;
    *(_QWORD *)&v121[16] = v104;
    v105 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]", "CoreLocation: %s\n", v105);
    if (v105 == (char *)buf)
      return 0;
    goto LABEL_90;
  }
  v110 = (void *)v63;
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v112 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v123 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    v124 = 2114;
    *(_QWORD *)v125 = v110;
    _os_log_impl(&dword_18F5B3000, v112, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,request dict:%{public}@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v118 = 136446466;
    v119 = "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]";
    v120 = 2114;
    *(_QWORD *)v121 = v110;
    v113 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequest getDecryptedRequestDict:requestID:combinedSecret:sharedInfoPrefix:]", "CoreLocation: %s\n", v113);
    if (v113 != (char *)buf)
      free(v113);
  }
  return v110;
}

- (void)updateDurationInformationForCA:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  double v6;
  double Current;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  double v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;

  v4 = a3;
  v78 = *MEMORY[0x1E0C80C00];
  objc_msgSend_requestReceivedTime(self, a2, a3, v3);
  if (v6 > 0.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v8 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446723;
      v71 = "-[CLEEDRequest updateDurationInformationForCA:]";
      v72 = 2049;
      v73 = objc_msgSend_state(self, v9, v10, v11);
      v74 = 1026;
      LODWORD(v75) = v4;
      _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,state:%{private}ld, response:%{public}d", buf, 0x1Cu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      objc_msgSend_state(self, v59, v60, v61);
      v62 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequest updateDurationInformationForCA:]", "CoreLocation: %s\n", v62);
      if (v62 != (char *)buf)
        free(v62);
    }
    if (objc_msgSend_state(self, v12, v13, v14) == 3)
    {
      objc_msgSend_receivedTimeToFirstUserResponse(self, v15, v16, v17);
      if (v18 <= 0.0)
      {
        objc_msgSend_requestReceivedTime(self, v15, v16, v17);
        objc_msgSend_setReceivedTimeToFirstUserResponse_(self, v20, v21, v22, vabdd_f64(Current, v19));
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        v23 = qword_1EE172098;
        if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_requestReceivedTime(self, v24, v25, v26);
          v28 = v27;
          objc_msgSend_receivedTimeToFirstUserResponse(self, v29, v30, v31);
          *(_DWORD *)buf = 136446979;
          v71 = "-[CLEEDRequest updateDurationInformationForCA:]";
          v72 = 2049;
          v73 = v28;
          v74 = 2049;
          v75 = Current;
          v76 = 2049;
          v77 = v32;
          _os_log_impl(&dword_18F5B3000, v23, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestReceivedTime:%{private}f, currentTime:%{private}f, receivedTimeToFirstUserResponse:%{private}f", buf, 0x2Au);
        }
        if (sub_18F5C4AE0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1EE1720A0 != -1)
            dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
          objc_msgSend_requestReceivedTime(self, v63, v64, v65);
          objc_msgSend_receivedTimeToFirstUserResponse(self, v66, v67, v68);
          v69 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequest updateDurationInformationForCA:]", "CoreLocation: %s\n", v69);
          if (v69 != (char *)buf)
            free(v69);
        }
      }
    }
    if (!v4)
      return;
    objc_msgSend_receivedTimeToAcceptTime(self, v15, v16, v17);
    if (v36 > 0.0)
      return;
    objc_msgSend_requestReceivedTime(self, v33, v34, v35);
    objc_msgSend_setReceivedTimeToAcceptTime_(self, v38, v39, v40, vabdd_f64(Current, v37));
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v41 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_requestReceivedTime(self, v42, v43, v44);
      v46 = v45;
      objc_msgSend_receivedTimeToAcceptTime(self, v47, v48, v49);
      *(_DWORD *)buf = 136446979;
      v71 = "-[CLEEDRequest updateDurationInformationForCA:]";
      v72 = 2049;
      v73 = v46;
      v74 = 2049;
      v75 = Current;
      v76 = 2049;
      v77 = v50;
      _os_log_impl(&dword_18F5B3000, v41, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestReceivedTime:%{private}f, currentTime:%{private}f,receivedTimeToAcceptTime:%{private}f", buf, 0x2Au);
    }
    if (!sub_18F5C4AE0(115, 2))
      return;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    objc_msgSend_requestReceivedTime(self, v51, v52, v53);
    objc_msgSend_receivedTimeToAcceptTime(self, v54, v55, v56);
    v57 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequest updateDurationInformationForCA:]", "CoreLocation: %s\n", v57);
    if (v57 == (char *)buf)
      return;
LABEL_38:
    free(v57);
    return;
  }
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v58 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v71 = "-[CLEEDRequest updateDurationInformationForCA:]";
    _os_log_impl(&dword_18F5B3000, v58, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s,requestReceivedTime is invalid, early return", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v57 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequest updateDurationInformationForCA:]", "CoreLocation: %s\n", v57);
    if (v57 != (char *)buf)
      goto LABEL_38;
  }
}

- (NSUUID)ID
{
  return self->_ID;
}

- (NSString)psapID
{
  return self->_psapID;
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)partnerID
{
  return self->_partnerID;
}

- (NSString)geofenceID
{
  return self->_geofenceID;
}

- (int64_t)requestStatusAtFirstUserResponse
{
  return self->_requestStatusAtFirstUserResponse;
}

- (void)setRequestStatusAtFirstUserResponse:(int64_t)a3
{
  self->_requestStatusAtFirstUserResponse = a3;
}

- (int64_t)requestTransmissionTime
{
  return self->_requestTransmissionTime;
}

- (void)setRequestTransmissionTime:(int64_t)a3
{
  self->_requestTransmissionTime = a3;
}

- (double)requestReceivedTime
{
  return self->_requestReceivedTime;
}

- (void)setRequestReceivedTime:(double)a3
{
  self->_requestReceivedTime = a3;
}

- (double)receivedTimeToFirstUserResponse
{
  return self->_receivedTimeToFirstUserResponse;
}

- (void)setReceivedTimeToFirstUserResponse:(double)a3
{
  self->_receivedTimeToFirstUserResponse = a3;
}

- (double)receivedTimeToAcceptTime
{
  return self->_receivedTimeToAcceptTime;
}

- (void)setReceivedTimeToAcceptTime:(double)a3
{
  self->_receivedTimeToAcceptTime = a3;
}

- (int64_t)numMediaSelectIterations
{
  return self->_numMediaSelectIterations;
}

- (void)setNumMediaSelectIterations:(int64_t)a3
{
  self->_numMediaSelectIterations = a3;
}

@end
