@implementation IDSSOSLogger

+ (id)logger
{
  return (id)((uint64_t (*)(id, char *, const __CFString *))MEMORY[0x1E0DE7D20])(a1, sel_loggerWithURLString_, CFSTR("https://messaging.metrics.icloud.com/sos"));
}

+ (id)loggerWithURLString:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v8 = (void *)objc_msgSend_initWithSOSURLString_(v5, v6, (uint64_t)v4, v7);

  return v8;
}

- (IDSSOSLogger)initWithSOSURLString:(id)a3
{
  id v5;
  IDSSOSLogger *v6;
  IDSSOSLogger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSSOSLogger;
  v6 = -[IDSSOSLogger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sosURLString, a3);

  return v7;
}

- (IDSRateLimiter)rateLimiter
{
  IDSRateLimiter *rateLimiter;
  IDSRateLimiter *v4;
  const char *v5;
  IDSRateLimiter *v6;
  IDSRateLimiter *v7;

  rateLimiter = self->_rateLimiter;
  if (!rateLimiter)
  {
    v4 = [IDSRateLimiter alloc];
    v6 = (IDSRateLimiter *)objc_msgSend_initWithLimit_timeLimit_(v4, v5, 1, 300.0);
    v7 = self->_rateLimiter;
    self->_rateLimiter = v6;

    rateLimiter = self->_rateLimiter;
  }
  return rateLimiter;
}

- (void)logMetric:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  int v11;
  id v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  __CFString *v18;
  __CFString *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
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
  uint64_t v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  double v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  double v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  double v70;
  void *v71;
  const char *v72;
  double v73;
  void *v74;
  const char *v75;
  double v76;
  const char *v77;
  uint64_t v78;
  double v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  double v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  double v87;
  void *v88;
  void *v89;
  const char *v90;
  double v91;
  void *v92;
  void *v93;
  const char *v94;
  double v95;
  void *v96;
  const char *v97;
  double v98;
  void *v99;
  const char *v100;
  double v101;
  const char *v102;
  double v103;
  void *v104;
  const char *v105;
  id v106;
  double v107;
  const char *v108;
  uint64_t v109;
  double v110;
  NSObject *v111;
  const char *v112;
  double v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  double v117;
  _QWORD v118[5];
  id v119;
  id v120;
  uint8_t buf[4];
  id v122;
  __int16 v123;
  void *v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6
    || (objc_msgSend_operationID(0, v4, v5, v7),
        v46 = (void *)objc_claimAutoreleasedReturnValue(),
        v46,
        !v46))
  {
    objc_msgSend_rateLimiter(self, v4, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_underLimitForItem_(v8, v9, (uint64_t)CFSTR("SOSRateLimitItem"), v10);

    if (v11)
    {
      v12 = v6;
      v16 = objc_msgSend_sosType(v12, v13, v14, v15);
      v17 = v16;
      v18 = CFSTR("warn");
      if (v16 != 1)
        v18 = 0;
      if (!v16)
        v18 = CFSTR("fatal");
      v19 = v18;
      v23 = objc_msgSend_sosDomain(v12, v20, v21, v22);
      v24 = 0;
      if (v23 <= 2)
      {
        if (v17 > 1)
        {
          v24 = 0;
        }
        else
        {
          v25 = (uint64_t)*(&off_1E3C21028 + v23);
          v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend_setObject_forKeyedSubscript_(v24, v26, (uint64_t)v19, v27, CFSTR("errorType"));
          objc_msgSend_setObject_forKeyedSubscript_(v24, v28, v25, v29, CFSTR("domain"));
          objc_msgSend_operationID(v12, v30, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v24, v34, (uint64_t)v33, v35, CFSTR("operationId"));

          v36 = (void *)MEMORY[0x1E0CB3940];
          v40 = objc_msgSend_sosError(v12, v37, v38, v39);
          objc_msgSend_stringWithFormat_(v36, v41, (uint64_t)CFSTR("%lld"), v42, v40);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v24, v44, (uint64_t)v43, v45, CFSTR("errorCode"));

        }
      }

      if (v24)
      {
        v50 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], v47, v48, v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_productName(v51, v52, v53, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_productVersion(v59, v60, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_productBuildVersion(v67, v68, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v50, v72, (uint64_t)CFSTR("%@,%@,%@"), v73, v55, v63, v71);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v24, v75, (uint64_t)v74, v76, CFSTR("osv"));

        objc_msgSend_sharedInstance(MEMORY[0x1E0D36A10], v77, v78, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_model(v80, v81, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        if (v84)
          objc_msgSend_setObject_forKeyedSubscript_(v24, v85, (uint64_t)v84, v87, CFSTR("hwv"));
        v88 = (void *)MEMORY[0x1E0CB39F0];
        objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x1E0CB39F8], v85, v86, v87);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sessionWithConfiguration_(v88, v90, (uint64_t)v89, v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        v93 = (void *)MEMORY[0x1E0CB37A8];
        objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v94, (uint64_t)self->_sosURLString, v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_requestWithURL_(v93, v97, (uint64_t)v96, v98);
        v99 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setHTTPMethod_(v99, v100, (uint64_t)CFSTR("POST"), v101);
        v120 = 0;
        objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E0CB36D8], v102, (uint64_t)v24, v103, 0, &v120);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v120;
        if (v104)
        {
          objc_msgSend_setHTTPBody_(v99, v105, (uint64_t)v104, v107);
          objc_msgSend_serverBag(MEMORY[0x1E0D36AA8], v108, v109, v110);
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v122 = v24;
            v123 = 2112;
            v124 = v99;
            _os_log_impl(&dword_19B949000, v111, OS_LOG_TYPE_DEFAULT, "Posting SOS! {payload: %@, request: %@}", buf, 0x16u);
          }

          v118[0] = MEMORY[0x1E0C809B0];
          v118[1] = 3221225472;
          v118[2] = sub_19BA5E8E0;
          v118[3] = &unk_1E3C21008;
          v118[4] = self;
          v119 = v92;
          objc_msgSend_dataTaskWithRequest_completionHandler_(v119, v112, (uint64_t)v99, v113, v118);
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_resume(v114, v115, v116, v117);

        }
      }

    }
  }

}

- (NSString)sosURLString
{
  return self->_sosURLString;
}

- (void)setSosURLString:(id)a3
{
  objc_storeStrong((id *)&self->_sosURLString, a3);
}

- (void)setRateLimiter:(id)a3
{
  objc_storeStrong((id *)&self->_rateLimiter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_sosURLString, 0);
}

@end
