@implementation CWFEvent

- (void).cxx_destruct
{
  objc_storeStrong(&self->_acknowledge, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (int64_t)type
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;

  objc_msgSend_eventID(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_type(v5, v6, v7, v8, v9);

  return v10;
}

- (CWFEventID)eventID
{
  return self->_eventID;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setEventID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CWFEvent)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CWFEvent *v6;
  uint64_t v7;
  NSUUID *UUID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CWFEvent;
  v6 = -[CWFEvent init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

  }
  return v6;
}

- (NSDictionary)info
{
  return self->_info;
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
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
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
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_eventID(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_type(v8, v9, v10, v11, v12);
  sub_1B062BEE0(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v19, (uint64_t)v18, (uint64_t)CFSTR("type"), v20);

  objc_msgSend_eventID(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_interfaceName(v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v31, (uint64_t)v30, (uint64_t)CFSTR("interface_name"), v32);

  objc_msgSend_timestamp(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, (uint64_t)CFSTR("timestamp"), v39);

  objc_msgSend_UUID(self, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v44, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v50, (uint64_t)v49, (uint64_t)CFSTR("uuid"), v51);

  v52 = (void *)MEMORY[0x1E0CB37E8];
  v57 = objc_msgSend_acknowledgementTimeout(self, v53, v54, v55, v56);
  objc_msgSend_numberWithUnsignedLongLong_(v52, v58, v57, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v62, (uint64_t)v61, (uint64_t)CFSTR("acknowledgement_timeout"), v63);

  objc_msgSend_info(self, v64, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v69, (uint64_t)v68, (uint64_t)CFSTR("info"), v70);

  sub_1B06475A8(v3, 0, 1u);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v71, (uint64_t)v74, v72, v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v75 = 0;
  }

  return v75;
}

- (void)setType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_eventID(self, a2, a3, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setType_(v9, v6, a3, v7, v8);

}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  CWFEventID *eventID;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v6 = (void *)MEMORY[0x1E0CB3940];
  eventID = self->_eventID;
  objc_msgSend_UUIDString(self->_UUID, a2, v2, v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v8, v9, 5, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B0630E50(self->_timestamp);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v14, (uint64_t)CFSTR("%@, uuid=%@, timestamp=%@, ackTimeout=%lluns, info=%@"), v15, v16, eventID, v12, v13, self->_acknowledgementTimeout, self->_info);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isEqualToEvent:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSUUID *UUID;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CWFEventID *eventID;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CWFEventID *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CWFEventID *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSDate **p_timestamp;
  NSDate *v42;
  char isEqual;
  NSDate *timestamp;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSDate *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;

  v6 = a3;
  v11 = v6;
  if (self->_UUID)
  {
    objc_msgSend_UUID(v6, v7, v8, v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      isEqual = 0;
LABEL_22:

      goto LABEL_23;
    }
    UUID = self->_UUID;
    objc_msgSend_UUID(v11, v12, v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(UUID, v19, (uint64_t)v18, v20, v21))
    {
      isEqual = 0;
LABEL_21:

      goto LABEL_22;
    }
    eventID = self->_eventID;
    objc_msgSend_eventID(v11, v22, v23, v24, v25);
    v31 = (CWFEventID *)objc_claimAutoreleasedReturnValue();
    if (eventID == v31)
    {
      timestamp = self->_timestamp;
      p_timestamp = &self->_timestamp;
      if (timestamp)
        goto LABEL_14;
    }
    else if (self->_eventID)
    {
      objc_msgSend_eventID(v11, v27, v28, v29, v30);
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v3 = (void *)v32;
        v37 = self->_eventID;
        objc_msgSend_eventID(v11, v33, v34, v35, v36);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v37, v38, (uint64_t)v4, v39, v40) & 1) == 0
          || (v42 = self->_timestamp, p_timestamp = &self->_timestamp, !v42))
        {
          isEqual = 0;
LABEL_19:

          goto LABEL_20;
        }
LABEL_14:
        objc_msgSend_timestamp(v11, v27, v28, v29, v30);
        v45 = objc_claimAutoreleasedReturnValue();
        if (v45)
        {
          v50 = (void *)v45;
          v51 = *p_timestamp;
          objc_msgSend_timestamp(v11, v46, v47, v48, v49);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v51, v53, (uint64_t)v52, v54, v55);

        }
        else
        {
          isEqual = 0;
        }
        if (eventID == v31)
          goto LABEL_20;
        goto LABEL_19;
      }
    }
    isEqual = 0;
LABEL_20:

    goto LABEL_21;
  }
  isEqual = 0;
LABEL_23:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  CWFEvent *v4;
  CWFEvent *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToEvent;

  v4 = (CWFEvent *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToEvent = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToEvent = objc_msgSend_isEqualToEvent_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToEvent = 0;
  }

  return isEqualToEvent;
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

  v6 = objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_eventID, v7, v8, v9, v10) ^ v6;
  return v11 ^ objc_msgSend_hash(self->_timestamp, v12, v13, v14, v15);
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

  v6 = (void *)objc_msgSend_allocWithZone_(CWFEvent, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setEventID_(v11, v15, (uint64_t)self->_eventID, v16, v17);
  objc_msgSend_setTimestamp_(v11, v18, (uint64_t)self->_timestamp, v19, v20);
  objc_msgSend_setInfo_(v11, v21, (uint64_t)self->_info, v22, v23);
  objc_msgSend_setAcknowledgementTimeout_(v11, v24, self->_acknowledgementTimeout, v25, v26);
  objc_msgSend_setAcknowledge_(v11, v27, (uint64_t)self->_acknowledge, v28, v29);
  return v11;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)acknowledgementTimeout
{
  return self->_acknowledgementTimeout;
}

- (void)setAcknowledgementTimeout:(unint64_t)a3
{
  self->_acknowledgementTimeout = a3;
}

- (id)acknowledge
{
  return self->_acknowledge;
}

- (void)setAcknowledge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
