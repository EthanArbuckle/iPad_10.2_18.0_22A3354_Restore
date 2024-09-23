@implementation IASignalAnalyticsObject

- (IASignalAnalyticsObject)initWithChannel:(id)a3 signal:(id)a4 sessionIdString:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  IASignalAnalyticsObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  IASignalAnalyticsObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v29.receiver = self;
  v29.super_class = (Class)IASignalAnalyticsObject;
  v14 = -[IAXPCObject init](&v29, sel_init);
  v18 = v14;
  if (v14)
  {
    objc_msgSend_setChannelName_(v14, v15, (uint64_t)v10, v16, v17);
    objc_msgSend_setSignalName_(v18, v19, (uint64_t)v11, v20, v21);
    objc_msgSend_setAnalyticsSessionIdString_(v18, v22, (uint64_t)v12, v23, v24);
    objc_msgSend_setPayload_(v18, v25, (uint64_t)v13, v26, v27);
  }

  return v18;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  objc_super v83;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v83.receiver = self;
  v83.super_class = (Class)IASignalAnalyticsObject;
  -[IAXPCObject description](&v83, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v9, v11, (uint64_t)v10, v12, v13);

  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_channelName(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v14, v20, (uint64_t)CFSTR("channelName=%@"), v21, v22, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v9, v24, (uint64_t)v23, v25, v26);

  v27 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_signalName(self, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v27, v33, (uint64_t)CFSTR("signalName=%@"), v34, v35, v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v9, v37, (uint64_t)v36, v38, v39);

  objc_msgSend_analyticsSessionIdString(self, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v49 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_analyticsSessionIdString(self, v45, v46, v47, v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v49, v51, (uint64_t)CFSTR("analyticsSessionIdString=%@"), v52, v53, v50);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v55, (uint64_t)v54, v56, v57);

  }
  objc_msgSend_payload(self, v45, v46, v47, v48);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    v63 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_payload(self, v59, v60, v61, v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v64, v65, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v63, v70, (uint64_t)CFSTR("payload=%@"), v71, v72, v69);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v9, v74, (uint64_t)v73, v75, v76);

  }
  objc_msgSend_componentsJoinedByString_(v9, v59, (uint64_t)CFSTR(", "), v61, v62);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v4, v78, (uint64_t)CFSTR(": %@"), v79, v80, v77);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  return v81;
}

- (NSString)channelName
{
  return self->_channelName;
}

- (void)setChannelName:(id)a3
{
  objc_storeStrong((id *)&self->_channelName, a3);
}

- (NSString)signalName
{
  return self->_signalName;
}

- (void)setSignalName:(id)a3
{
  objc_storeStrong((id *)&self->_signalName, a3);
}

- (NSString)analyticsSessionIdString
{
  return self->_analyticsSessionIdString;
}

- (void)setAnalyticsSessionIdString:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsSessionIdString, a3);
}

- (NSDictionary)payload
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
  objc_storeStrong((id *)&self->_analyticsSessionIdString, 0);
  objc_storeStrong((id *)&self->_signalName, 0);
  objc_storeStrong((id *)&self->_channelName, 0);
}

- (IASignalAnalyticsObject)initWithCoder:(id)a3
{
  id v4;
  IASignalAnalyticsObject *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *channelName;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *signalName;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *analyticsSessionIdString;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSDictionary *payload;
  objc_super v34;
  _QWORD v35[5];

  v35[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)IASignalAnalyticsObject;
  v5 = -[IAXPCObject initWithCoder:](&v34, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("channelName"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    channelName = v5->_channelName;
    v5->_channelName = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("signalName"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    signalName = v5->_signalName;
    v5->_signalName = (NSString *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("analyticsSessionIdString"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    analyticsSessionIdString = v5->_analyticsSessionIdString;
    v5->_analyticsSessionIdString = (NSString *)v19;

    v21 = objc_alloc(MEMORY[0x24BDBCF20]);
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v35[2] = objc_opt_class();
    v35[3] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v22, (uint64_t)v35, 4, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend_initWithArray_(v21, v25, (uint64_t)v24, v26, v27);
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v28, (uint64_t)CFSTR("payload"), v30);
    v31 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v31;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IASignalAnalyticsObject;
  v4 = a3;
  -[IAXPCObject encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_channelName, (uint64_t)CFSTR("channelName"), v6, v13.receiver, v13.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_signalName, (uint64_t)CFSTR("signalName"), v8);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_analyticsSessionIdString, (uint64_t)CFSTR("analyticsSessionIdString"), v10);
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_payload, (uint64_t)CFSTR("payload"), v12);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
