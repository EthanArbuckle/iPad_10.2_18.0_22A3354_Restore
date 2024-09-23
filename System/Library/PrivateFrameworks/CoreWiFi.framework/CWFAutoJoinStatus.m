@implementation CWFAutoJoinStatus

- (CWFAutoJoinStatus)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CWFAutoJoinStatus *v6;
  uint64_t v7;
  NSUUID *UUID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CWFAutoJoinStatus;
  v6 = -[CWFAutoJoinStatus init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

  }
  return v6;
}

- (double)duration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;

  objc_msgSend_endedAt(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend_endedAt(self, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13, v14, v15);
    v17 = v16;
    objc_msgSend_startedAt(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v22, v23, v24, v25, v26);
    v32 = v17 - v31;
    v33 = 0.0;
    if (v32 >= 0.0)
    {
      objc_msgSend_endedAt(self, v27, v28, v29, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v34, v35, v36, v37, v38);
      v40 = v39;
      objc_msgSend_startedAt(self, v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v45, v46, v47, v48, v49);
      v33 = v40 - v50;

    }
  }
  else
  {
    v33 = 0.0;
  }

  return v33;
}

- (id)deepCopy
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = objc_opt_class();
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v5, (uint64_t)self, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v3, v7, v4, (uint64_t)v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(self->_UUID, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v11, v12, 5, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v16, (uint64_t)CFSTR("uuid=%@, "), v17, v18, v15);

  objc_msgSend_appendFormat_(v6, v19, (uint64_t)CFSTR("intf=%@, "), v20, v21, self->_interfaceName);
  sub_1B063D5D0(self->_trigger, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v27, (uint64_t)CFSTR("trigger=%@. "), v28, v29, v26);

  sub_1B0642810(self->_state, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v35, (uint64_t)CFSTR("state=%@, "), v36, v37, v34);

  if (self->_result)
    objc_msgSend_appendFormat_(v6, v38, (uint64_t)CFSTR("result=%s, "), v39, v40, "yes");
  else
    objc_msgSend_appendFormat_(v6, v38, (uint64_t)CFSTR("result=%s, "), v39, v40, "no");
  sub_1B0630E50(self->_startedAt);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v42, (uint64_t)CFSTR("start=%@, "), v43, v44, v41);

  sub_1B0630E50(self->_endedAt);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_duration(self, v46, v47, v48, v49);
  objc_msgSend_appendFormat_(v6, v51, (uint64_t)CFSTR("end=%@ (%lums), "), v52, v53, v45, (unint64_t)(v50 * 1000.0));

  objc_msgSend_appendFormat_(v6, v54, (uint64_t)CFSTR("joins=%@"), v55, v56, self->_joinAttempts);
  return (NSString *)v6;
}

- (BOOL)isEqualToAutoJoinStatus:(id)a3
{
  void *v3;
  id v5;
  NSUUID *UUID;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUUID *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSUUID *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char isEqual;
  NSDate *startedAt;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSDate *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSDate *v39;
  uint64_t v40;
  NSDate *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSDate *endedAt;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSDate *joinAttempts;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSDate *v58;
  uint64_t v59;
  NSDate *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  NSString *interfaceName;
  NSString *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  int64_t trigger;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int64_t state;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSDate *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NSDate *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSArray *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  BOOL v112;
  NSDate *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  NSString *v118;
  NSDate *v119;
  NSString *v120;
  void *v121;
  NSString *v122;
  void *v123;
  NSDate *v124;
  void *v125;

  v5 = a3;
  UUID = self->_UUID;
  objc_msgSend_UUID(v5, v7, v8, v9, v10);
  v15 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  if (UUID != v15)
  {
    if (!self->_UUID || (objc_msgSend_UUID(v5, v11, v12, v13, v14), (v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      isEqual = 0;
      goto LABEL_55;
    }
    v3 = (void *)v16;
    v21 = self->_UUID;
    objc_msgSend_UUID(v5, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v21, v23, (uint64_t)v22, v24, v25))
    {
      isEqual = 0;
LABEL_54:

      goto LABEL_55;
    }
    v125 = v22;
  }
  startedAt = self->_startedAt;
  objc_msgSend_startedAt(v5, v11, v12, v13, v14);
  v32 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (startedAt != v32)
  {
    if (!self->_startedAt)
    {
      isEqual = 0;
      goto LABEL_53;
    }
    objc_msgSend_startedAt(v5, v28, v29, v30, v31);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
      goto LABEL_43;
    v38 = (void *)v33;
    v39 = self->_startedAt;
    objc_msgSend_startedAt(v5, v34, v35, v36, v37);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v39;
    v42 = (void *)v40;
    if ((objc_msgSend_isEqual_(v41, v43, v40, v44, v45) & 1) == 0)
    {

      goto LABEL_43;
    }
    v121 = v42;
    v123 = v38;
  }
  endedAt = self->_endedAt;
  objc_msgSend_endedAt(v5, v28, v29, v30, v31);
  v47 = objc_claimAutoreleasedReturnValue();
  joinAttempts = (NSDate *)v47;
  if (endedAt == (NSDate *)v47)
  {
    v124 = (NSDate *)v47;
    v64 = v3;
LABEL_20:
    interfaceName = self->_interfaceName;
    objc_msgSend_interfaceName(v5, v48, v49, v50, v51);
    v66 = (NSString *)objc_claimAutoreleasedReturnValue();
    v120 = interfaceName;
    v122 = v66;
    if (interfaceName == v66)
    {
      v119 = joinAttempts;
      v3 = v64;
    }
    else
    {
      if (!self->_interfaceName)
      {
        v119 = joinAttempts;
        isEqual = 0;
        v3 = v64;
        goto LABEL_46;
      }
      objc_msgSend_interfaceName(v5, v67, v68, v69, v70);
      v71 = objc_claimAutoreleasedReturnValue();
      v3 = v64;
      if (!v71)
      {
        v119 = joinAttempts;
        LOBYTE(joinAttempts) = 0;
        goto LABEL_48;
      }
      v116 = (void *)v71;
      v118 = self->_interfaceName;
      objc_msgSend_interfaceName(v5, v72, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqual_(v118, v77, (uint64_t)v76, v78, v79) & 1) == 0)
      {

        isEqual = 0;
        v112 = endedAt == v124;
        v113 = v124;
        if (!v112)
        {
LABEL_57:

          v110 = v123;
          joinAttempts = v113;
LABEL_58:

          if (startedAt == v32)
          {
LABEL_60:

LABEL_61:
            v22 = v125;
            if (UUID == v15)
              goto LABEL_55;
            goto LABEL_54;
          }
LABEL_59:

          goto LABEL_60;
        }
LABEL_69:

        v110 = v123;
        if (startedAt == v32)
          goto LABEL_60;
        goto LABEL_59;
      }
      v115 = v76;
      v119 = joinAttempts;
    }
    trigger = self->_trigger;
    if (trigger == objc_msgSend_trigger(v5, v67, v68, v69, v70)
      && (state = self->_state, state == objc_msgSend_state(v5, v82, v83, v84, v85))
      && (v91 = self->_result, v91 == objc_msgSend_result(v5, v87, v88, v89, v90)))
    {
      joinAttempts = (NSDate *)self->_joinAttempts;
      objc_msgSend_joinAttempts(v5, v92, v93, v94, v95);
      v96 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v101 = v96;
      LOBYTE(joinAttempts) = joinAttempts == v96;
      if ((_BYTE)joinAttempts || !self->_joinAttempts)
      {

        isEqual = (char)joinAttempts;
LABEL_38:
        v66 = v122;
        if (v120 != v122)
        {

LABEL_48:
          isEqual = (char)joinAttempts;
LABEL_49:
          v80 = v123;
          joinAttempts = v124;
          if (endedAt != v124)
          {

          }
          goto LABEL_51;
        }
LABEL_46:

        goto LABEL_49;
      }
      objc_msgSend_joinAttempts(v5, v97, v98, v99, v100);
      joinAttempts = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (joinAttempts)
      {
        v106 = self->_joinAttempts;
        objc_msgSend_joinAttempts(v5, v102, v103, v104, v105);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v106, v107, (uint64_t)v114, v108, v109);

        if (v120 == v122)
        {

        }
        else
        {

        }
        v112 = endedAt == v124;
        v113 = v124;
        joinAttempts = v119;
        if (!v112)
          goto LABEL_57;
        goto LABEL_69;
      }

    }
    else
    {
      LOBYTE(joinAttempts) = 0;
    }
    isEqual = 0;
    goto LABEL_38;
  }
  if (self->_endedAt)
  {
    objc_msgSend_endedAt(v5, v48, v49, v50, v51);
    v53 = objc_claimAutoreleasedReturnValue();
    if (!v53)
    {
      isEqual = 0;
      v110 = v123;
      goto LABEL_58;
    }
    v124 = joinAttempts;
    v117 = (void *)v53;
    v58 = self->_endedAt;
    objc_msgSend_endedAt(v5, v54, v55, v56, v57);
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = v58;
    joinAttempts = (NSDate *)v59;
    if ((objc_msgSend_isEqual_(v60, v61, v59, v62, v63) & 1) != 0)
    {
      v64 = v3;
      goto LABEL_20;
    }

    if (startedAt == v32)
    {

      goto LABEL_44;
    }

LABEL_43:
LABEL_44:
    isEqual = 0;
    goto LABEL_61;
  }
  isEqual = 0;
  v80 = v123;
LABEL_51:

  if (startedAt != v32)
  {

  }
LABEL_53:
  v22 = v125;

  if (UUID != v15)
    goto LABEL_54;
LABEL_55:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  CWFAutoJoinStatus *v4;
  CWFAutoJoinStatus *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToAutoJoinStatus;

  v4 = (CWFAutoJoinStatus *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToAutoJoinStatus = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToAutoJoinStatus = objc_msgSend_isEqualToAutoJoinStatus_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToAutoJoinStatus = 0;
  }

  return isEqualToAutoJoinStatus;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *joinAttempts;
  int64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_interfaceName, v7, v8, v9, v10) ^ v6;
  v16 = objc_msgSend_hash(self->_startedAt, v12, v13, v14, v15);
  v21 = v11 ^ v16 ^ objc_msgSend_hash(self->_endedAt, v17, v18, v19, v20);
  joinAttempts = self->_joinAttempts;
  v23 = self->_trigger ^ self->_state ^ self->_result;
  return v21 ^ v23 ^ objc_msgSend_hash(joinAttempts, v24, v25, v26, v27);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
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

  v6 = (void *)objc_msgSend_allocWithZone_(CWFAutoJoinStatus, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setInterfaceName_(v11, v15, (uint64_t)self->_interfaceName, v16, v17);
  objc_msgSend_setStartedAt_(v11, v18, (uint64_t)self->_startedAt, v19, v20);
  objc_msgSend_setEndedAt_(v11, v21, (uint64_t)self->_endedAt, v22, v23);
  objc_msgSend_setTrigger_(v11, v24, self->_trigger, v25, v26);
  objc_msgSend_setState_(v11, v27, self->_state, v28, v29);
  objc_msgSend_setResult_(v11, v30, self->_result, v31, v32);
  objc_msgSend_setJoinAttempts_(v11, v33, (uint64_t)self->_joinAttempts, v34, v35);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;

  UUID = self->_UUID;
  v21 = a3;
  objc_msgSend_encodeObject_forKey_(v21, v5, (uint64_t)UUID, (uint64_t)CFSTR("_UUID"), v6);
  objc_msgSend_encodeObject_forKey_(v21, v7, (uint64_t)self->_interfaceName, (uint64_t)CFSTR("_interfaceName"), v8);
  objc_msgSend_encodeObject_forKey_(v21, v9, (uint64_t)self->_startedAt, (uint64_t)CFSTR("_startedAt"), v10);
  objc_msgSend_encodeObject_forKey_(v21, v11, (uint64_t)self->_endedAt, (uint64_t)CFSTR("_endedAt"), v12);
  objc_msgSend_encodeObject_forKey_(v21, v13, (uint64_t)self->_joinAttempts, (uint64_t)CFSTR("_joinAttempts"), v14);
  objc_msgSend_encodeInteger_forKey_(v21, v15, self->_trigger, (uint64_t)CFSTR("_trigger"), v16);
  objc_msgSend_encodeInteger_forKey_(v21, v17, self->_state, (uint64_t)CFSTR("_state"), v18);
  objc_msgSend_encodeBool_forKey_(v21, v19, self->_result, (uint64_t)CFSTR("_result"), v20);

}

- (CWFAutoJoinStatus)initWithCoder:(id)a3
{
  id v4;
  CWFAutoJoinStatus *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSUUID *UUID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *interfaceName;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSDate *startedAt;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSDate *endedAt;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *joinAttempts;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CWFAutoJoinStatus;
  v5 = -[CWFAutoJoinStatus init](&v47, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_UUID"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_interfaceName"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("_startedAt"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    startedAt = v5->_startedAt;
    v5->_startedAt = (NSDate *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("_endedAt"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    endedAt = v5->_endedAt;
    v5->_endedAt = (NSDate *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    objc_msgSend_setWithObjects_(v26, v29, v27, v30, v31, v28, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v33, (uint64_t)v32, (uint64_t)CFSTR("_joinAttempts"), v34);
    v35 = objc_claimAutoreleasedReturnValue();
    joinAttempts = v5->_joinAttempts;
    v5->_joinAttempts = (NSArray *)v35;

    v5->_trigger = objc_msgSend_decodeIntegerForKey_(v4, v37, (uint64_t)CFSTR("_trigger"), v38, v39);
    v5->_state = objc_msgSend_decodeIntegerForKey_(v4, v40, (uint64_t)CFSTR("_state"), v41, v42);
    v5->_result = objc_msgSend_decodeBoolForKey_(v4, v43, (uint64_t)CFSTR("_result"), v44, v45);
  }

  return v5;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)endedAt
{
  return self->_endedAt;
}

- (void)setEndedAt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)joinAttempts
{
  return self->_joinAttempts;
}

- (void)setJoinAttempts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(int64_t)a3
{
  self->_trigger = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinAttempts, 0);
  objc_storeStrong((id *)&self->_endedAt, 0);
  objc_storeStrong((id *)&self->_startedAt, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (id)JSONCompatibleKeyValueMap
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  id v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t i;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_UUID(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("uuid"), v15);

  objc_msgSend_interfaceName(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, (uint64_t)CFSTR("interface_name"), v22);

  objc_msgSend_startedAt(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v28, (uint64_t)v27, (uint64_t)CFSTR("started_at"), v29);

  objc_msgSend_endedAt(self, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)v34, (uint64_t)CFSTR("ended_at"), v36);

  v37 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_duration(self, v38, v39, v40, v41);
  objc_msgSend_numberWithUnsignedInteger_(v37, v43, (unint64_t)(v42 * 1000.0), v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v47, (uint64_t)v46, (uint64_t)CFSTR("duration"), v48);

  v49 = (void *)MEMORY[0x1E0CB37E8];
  v54 = objc_msgSend_result(self, v50, v51, v52, v53);
  objc_msgSend_numberWithBool_(v49, v55, v54, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v59, (uint64_t)v58, (uint64_t)CFSTR("result"), v60);

  v65 = objc_msgSend_state(self, v61, v62, v63, v64);
  sub_1B0642810(v65, v66, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v71, (uint64_t)v70, (uint64_t)CFSTR("state"), v72);

  v77 = objc_msgSend_trigger(self, v73, v74, v75, v76);
  sub_1B063D5D0(v77, v78, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v83, (uint64_t)v82, (uint64_t)CFSTR("trigger"), v84);

  v85 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  objc_msgSend_joinAttempts(self, v86, v87, v88, v89, 0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v91, (uint64_t)&v112, (uint64_t)v116, 16);
  if (v92)
  {
    v97 = v92;
    v98 = *(_QWORD *)v113;
    do
    {
      for (i = 0; i != v97; ++i)
      {
        if (*(_QWORD *)v113 != v98)
          objc_enumerationMutation(v90);
        objc_msgSend_JSONCompatibleKeyValueMap(*(void **)(*((_QWORD *)&v112 + 1) + 8 * i), v93, v94, v95, v96);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v85, v101, (uint64_t)v100, v102, v103);

      }
      v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v93, (uint64_t)&v112, (uint64_t)v116, 16);
    }
    while (v97);
  }

  objc_msgSend_setObject_forKeyedSubscript_(v3, v104, (uint64_t)v85, (uint64_t)CFSTR("join_attempts"), v105);
  sub_1B06475A8(v3, 0, 1u);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v109)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v106, (uint64_t)v109, v107, v108);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v110 = 0;
  }

  return v110;
}

@end
