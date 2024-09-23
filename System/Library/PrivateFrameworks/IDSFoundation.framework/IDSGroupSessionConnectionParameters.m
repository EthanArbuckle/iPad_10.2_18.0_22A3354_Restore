@implementation IDSGroupSessionConnectionParameters

- (IDSGroupSessionConnectionParameters)initWithStringRepresentation:(id)a3
{
  id v4;
  const char *v5;
  IDSGroupSessionConnectionParameters *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSString *multiplexer;
  const char *v25;
  double v26;
  uint64_t v27;
  NSString *sessionID;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  double v38;
  id v39;
  const char *v40;
  uint64_t v41;
  double v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  const char *v47;
  double v48;
  void *v49;
  const char *v50;
  double v51;
  int v52;
  const char *v53;
  uint64_t v54;
  double v55;
  const char *v56;
  uint64_t v57;
  double v58;
  const char *v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  IDSGroupSessionConnectionParameters *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  double v71;
  id v72;
  const char *v73;
  double v74;
  void *v75;
  const char *v76;
  double v77;
  uint64_t v78;
  NSData *salt;
  const char *v80;
  uint64_t v81;
  double v82;
  const char *v84;
  double v85;
  void *v86;
  objc_super v87;
  uint8_t buf[4];
  uint64_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)IDSGroupSessionConnectionParameters;
  v6 = -[IDSGroupSessionConnectionParameters init](&v87, sel_init);
  if (!v6)
    goto LABEL_20;
  objc_msgSend_componentsSeparatedByString_(v4, v5, (uint64_t)CFSTR(":"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_count(v8, v9, v10, v11) <= 2)
  {
    objc_msgSend_Multiplexer(IDSFoundationLog, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend_count(v8, v16, v17, v18);
      *(_DWORD *)buf = 134217984;
      v89 = v19;
      v20 = "Parameters string doesn't have enough fields (%lu) for the three required parameters";
LABEL_5:
      v21 = v15;
      v22 = 12;
LABEL_15:
      _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  objc_msgSend_objectAtIndexedSubscript_(v8, v12, 0, v14);
  v23 = objc_claimAutoreleasedReturnValue();
  multiplexer = v6->_multiplexer;
  v6->_multiplexer = (NSString *)v23;

  objc_msgSend_objectAtIndexedSubscript_(v8, v25, 1, v26);
  v27 = objc_claimAutoreleasedReturnValue();
  sessionID = v6->_sessionID;
  v6->_sessionID = (NSString *)v27;

  objc_msgSend_objectAtIndexedSubscript_(v8, v29, 2, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_length(v31, v32, v33, v34);

  if (!v35)
  {
    objc_msgSend_Multiplexer(IDSFoundationLog, v36, v37, v38);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v20 = "Parameters participant string needs be non-empty";
    goto LABEL_14;
  }
  objc_msgSend_objectAtIndexedSubscript_(v8, v36, 2, v38);
  v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v43 = (const char *)objc_msgSend_UTF8String(v39, v40, v41, v42);
  v6->_participantID = strtoull(v43, 0, 10);

  if ((unint64_t)objc_msgSend_count(v8, v44, v45, v46) < 4
    || (objc_msgSend_objectAtIndexedSubscript_(v8, v47, 3, v48),
        v49 = (void *)objc_claimAutoreleasedReturnValue(),
        v52 = objc_msgSend_containsString_(v49, v50, (uint64_t)CFSTR("S"), v51),
        v49,
        !v52))
  {
LABEL_19:

LABEL_20:
    v63 = v6;
    goto LABEL_21;
  }
  if ((unint64_t)objc_msgSend_count(v8, v53, v54, v55) > 4)
  {
    objc_msgSend_objectAtIndexedSubscript_(v8, v56, 4, v58);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend_length(v64, v65, v66, v67);

    if (v68)
    {
      v72 = objc_alloc(MEMORY[0x1E0C99D50]);
      objc_msgSend_objectAtIndexedSubscript_(v8, v73, 4, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend_initWithBase64EncodedString_options_(v72, v76, (uint64_t)v75, v77, 0);
      salt = v6->_salt;
      v6->_salt = (NSData *)v78;

      if (!v6->_salt)
      {
        objc_msgSend_Multiplexer(IDSFoundationLog, v80, v81, v82);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_objectAtIndexedSubscript_(v8, v84, 4, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v89 = (uint64_t)v86;
          _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "Parameters string salt field %@ could not convert to NSData", buf, 0xCu);

        }
        goto LABEL_16;
      }
      goto LABEL_19;
    }
    objc_msgSend_Multiplexer(IDSFoundationLog, v69, v70, v71);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v20 = "Parameters salt string is empty";
LABEL_14:
    v21 = v15;
    v22 = 2;
    goto LABEL_15;
  }
  objc_msgSend_Multiplexer(IDSFoundationLog, v56, v57, v58);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v62 = objc_msgSend_count(v8, v59, v60, v61);
    *(_DWORD *)buf = 134217984;
    v89 = v62;
    v20 = "Parameters string doesn't have enough fields (%lu) for salt";
    goto LABEL_5;
  }
LABEL_16:

  v63 = 0;
LABEL_21:

  return v63;
}

- (id)stringRepresentation
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  NSObject *v20;
  uint8_t buf[16];

  if (objc_msgSend_length(self->_multiplexer, a2, v2, v3) && objc_msgSend_length(self->_sessionID, v5, v6, v7))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("%@:%@:%llu"), *(double *)&self->_multiplexer, self->_multiplexer, self->_sessionID, self->_participantID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(self->_salt, v9, v10, v11))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_base64EncodedStringWithOptions_(self->_salt, v12, 0, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v14, v16, (uint64_t)CFSTR("%@:S:%@"), v17, v8, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      return v18;
    }
  }
  else
  {
    objc_msgSend_Multiplexer(IDSFoundationLog, v5, v6, v7);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v20, OS_LOG_TYPE_DEFAULT, "Parameters need required multiplexer and sessionID to be non-empty", buf, 2u);
    }

    v8 = 0;
  }
  return v8;
}

- (id)description
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  NSString *multiplexer;

  v6 = objc_msgSend_length(self->_salt, a2, v2, v3);
  multiplexer = self->_multiplexer;
  if (v6)
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("MUXConnParams: multiplexer %@ session %@ participant %llu salt %@"), v7, multiplexer, self->_sessionID, self->_participantID, self->_salt);
  else
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v5, (uint64_t)CFSTR("MUXConnParams: multiplexer %@ session %@ participant %llu"), v7, multiplexer, self->_sessionID, self->_participantID);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToGroupSessionConnectionParameters;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualToGroupSessionConnectionParameters = objc_msgSend_isEqualToGroupSessionConnectionParameters_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToGroupSessionConnectionParameters = 0;

  return isEqualToGroupSessionConnectionParameters;
}

- (BOOL)isEqualToGroupSessionConnectionParameters:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
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
  const char *v23;
  uint64_t v24;
  NSData *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  char isEqual;

  v4 = a3;
  objc_msgSend_multiplexer(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(v8, v9, (uint64_t)self->_multiplexer, v10))
  {
    objc_msgSend_sessionID(v4, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqual_(v14, v15, (uint64_t)self->_sessionID, v16)
      && objc_msgSend_participantID(v4, v17, v18, v19) == self->_participantID)
    {
      objc_msgSend_salt(v4, v20, v21, v22);
      v25 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (v25 == self->_salt)
      {
        isEqual = 1;
      }
      else
      {
        objc_msgSend_salt(v4, v23, v24, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v27, v28, (uint64_t)self->_salt, v29);

      }
    }
    else
    {
      isEqual = 0;
    }

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (NSString)multiplexer
{
  return self->_multiplexer;
}

- (void)setMultiplexer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(unint64_t)a3
{
  self->_participantID = a3;
}

- (NSData)salt
{
  return self->_salt;
}

- (void)setSalt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_multiplexer, 0);
}

@end
