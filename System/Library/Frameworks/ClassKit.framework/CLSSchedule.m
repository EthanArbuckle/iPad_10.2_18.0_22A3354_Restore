@implementation CLSSchedule

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40726C4;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB470 != -1)
    dispatch_once(&qword_1ED0FB470, block);
  return (id)qword_1ED0FB468;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSSchedule;
  return -[CLSObject _init](&v3, sel__init);
}

- (id)initForObject:(id)a3 scheduleDate:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSSchedule;
  v10 = -[CLSObject _init](&v14, sel__init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v7, v8, v9);
    v12 = (void *)v10[15];
    v10[15] = v11;

    objc_opt_class();
    v10[13] = objc_opt_isKindOfClass() & 1;
    v10[14] = 1;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t updated;
  const char *v50;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  objc_msgSend_parent(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scheduleDate(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_copy(v13, v14, v15);
  v18 = (void *)objc_msgSend_initForObject_scheduleDate_(v7, v17, (uint64_t)v10, v16);

  objc_msgSend_objectID(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend_copy(v21, v22, v23);
  objc_msgSend_setObjectID_(v18, v25, (uint64_t)v24);

  objc_msgSend_dateCreated(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend_copy(v28, v29, v30);
  objc_msgSend_setDateCreated_(v18, v32, (uint64_t)v31);

  objc_msgSend_dateLastModified(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend_copy(v35, v36, v37);
  objc_msgSend_setDateLastModified_(v18, v39, (uint64_t)v38);

  objc_msgSend_parentObjectID(self, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend_copy(v42, v43, v44);
  objc_msgSend_setParentObjectID_(v18, v46, (uint64_t)v45);

  updated = objc_msgSend_scheduleUpdateStatus(self, v47, v48);
  objc_msgSend_setScheduleUpdateStatus_(v18, v50, updated);
  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSSchedule)initWithCoder:(id)a3
{
  id v4;
  CLSSchedule *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSDate *scheduleDate;
  const char *v10;
  const char *v11;
  const char *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLSSchedule;
  v5 = -[CLSObject initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("scheduleDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    scheduleDate = v5->_scheduleDate;
    v5->_scheduleDate = (NSDate *)v8;

    v5->_scheduledEntityType = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("scheduledEntityType"));
    v5->_scheduleAction = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)CFSTR("scheduleAction"));
    v5->_scheduleUpdateStatus = objc_msgSend_decodeIntegerForKey_(v4, v12, (uint64_t)CFSTR("scheduleUpdateStatus"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLSSchedule;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_scheduleDate, CFSTR("scheduleDate"), v9.receiver, v9.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_scheduledEntityType, CFSTR("scheduledEntityType"));
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_scheduleAction, CFSTR("scheduleAction"));
  objc_msgSend_encodeInteger_forKey_(v4, v8, self->_scheduleUpdateStatus, CFSTR("scheduleUpdateStatus"));

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  char v25;
  BOOL v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  char v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  void *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t updated;
  const char *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  char v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  char v89;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = 0;
    goto LABEL_44;
  }
  v10 = v9;
  objc_msgSend_objectID(self, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend_objectID(v10, v13, v14);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v25 = 0;
      goto LABEL_11;
    }
  }
  objc_msgSend_objectID(self, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_40:
    v26 = 0;
    goto LABEL_41;
  }
  v4 = (void *)v16;
  objc_msgSend_objectID(v10, v17, v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_39:

    goto LABEL_40;
  }
  objc_msgSend_objectID(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectID(v10, v22, v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v21, v24, (uint64_t)v6) & 1) == 0)
  {

    goto LABEL_39;
  }
  v87 = v21;
  v25 = 1;
LABEL_11:
  v89 = v25;
  objc_msgSend_parentObjectID(self, v13, v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    objc_msgSend_parentObjectID(v10, v27, v28);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v88)
    {
      v86 = v6;
      v88 = 0;
      v83 = 0;
      goto LABEL_26;
    }
  }
  objc_msgSend_parentObjectID(self, v27, v28);
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    v26 = 0;
    v41 = v89;
    v42 = v88;
    if (v29)
      goto LABEL_19;
    goto LABEL_18;
  }
  v33 = (void *)v30;
  objc_msgSend_parentObjectID(v10, v31, v32);
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34)
  {

    if (v29)
    else

    if ((v89 & 1) == 0)
      goto LABEL_40;

LABEL_38:
    goto LABEL_39;
  }
  v84 = v33;
  v85 = (void *)v34;
  v86 = v6;
  objc_msgSend_parentObjectID(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parentObjectID(v10, v38, v39);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v37, v40, (uint64_t)v7) & 1) == 0)
  {

    if (v29)
    else

    if ((v89 & 1) == 0)
      goto LABEL_40;

    goto LABEL_38;
  }
  v79 = v7;
  v80 = v37;
  v83 = 1;
LABEL_26:
  objc_msgSend_scheduleDate(self, v27, v28);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45 || (objc_msgSend_scheduleDate(v10, v43, v44), (v82 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_scheduleDate(self, v43, v44);
    v46 = objc_claimAutoreleasedReturnValue();
    if (!v46)
      goto LABEL_64;
    v81 = (void *)v46;
    objc_msgSend_scheduleDate(v10, v47, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    if (!v49)
    {

      v26 = 0;
      goto LABEL_48;
    }
    v78 = (void *)v49;
    objc_msgSend_scheduleDate(self, v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_scheduleDate(v10, v53, v54);
    v55 = objc_claimAutoreleasedReturnValue();
    v77 = (void *)v52;
    v56 = (void *)v52;
    v7 = (void *)v55;
    if (!objc_msgSend_isEqualToDate_(v56, v57, v55))
    {
      v26 = 0;
LABEL_47:

LABEL_48:
      v59 = v45;
      if (v45)
      {

        goto LABEL_56;
      }
LABEL_55:
      v73 = v59;

LABEL_56:
      if ((v83 & 1) != 0)
      {

      }
      v6 = v86;
      if (!v29)

      if ((v89 & 1) == 0)
        goto LABEL_41;
      goto LABEL_61;
    }
    v75 = v3;
    v76 = 1;
  }
  else
  {
    v75 = v3;
    v82 = 0;
    v76 = 0;
  }
  v60 = objc_msgSend_scheduledEntityType(self, v43, v44);
  if (v60 != objc_msgSend_scheduledEntityType(v10, v61, v62)
    || (v65 = objc_msgSend_scheduleAction(self, v63, v64), v65 != objc_msgSend_scheduleAction(v10, v66, v67)))
  {
    if ((v76 & 1) == 0)
    {
      v3 = v75;
      v74 = v82;
      if (v45)
      {
LABEL_68:
        v59 = v45;
        goto LABEL_69;
      }
LABEL_67:

      goto LABEL_68;
    }

    v3 = v75;
LABEL_64:
    v59 = v45;
    v74 = v82;
    if (v45)
    {
LABEL_69:
      v26 = 0;
      goto LABEL_70;
    }
    goto LABEL_67;
  }
  updated = objc_msgSend_scheduleUpdateStatus(self, v68, v69);
  v26 = updated == objc_msgSend_scheduleUpdateStatus(v10, v71, v72);
  v3 = v75;
  if ((v76 & 1) != 0)
    goto LABEL_47;
  v59 = v45;
  if (!v45)
    goto LABEL_55;
LABEL_70:

  if ((v83 & 1) != 0)
  {

  }
  v41 = v89;
  v42 = v88;
  v6 = v86;
  if (!v29)
LABEL_18:

LABEL_19:
  if ((v41 & 1) != 0)
  {
LABEL_61:

  }
LABEL_41:
  if (!v15)

LABEL_44:
  return v26;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  const char *v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;
  const char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLSSchedule;
  -[CLSObject dictionaryRepresentation](&v12, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_scheduleDate, CFSTR("scheduleDate"));
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v5, self->_scheduledEntityType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v6, CFSTR("scheduledEntityType"));

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, self->_scheduleAction);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, CFSTR("scheduleAction"));

  return v3;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSSchedule;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("scheduleUpdateStatus");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 1);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v21, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v9, v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }

}

- (int64_t)scheduledEntityType
{
  uint64_t v2;
  int64_t scheduledEntityType;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  scheduledEntityType = self->_scheduledEntityType;
  objc_msgSend_unlock(self, v5, v6);
  return scheduledEntityType;
}

- (void)setScheduledEntityType:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_scheduledEntityType != a3)
  {
    self->_scheduledEntityType = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)scheduleAction
{
  uint64_t v2;
  int64_t scheduleAction;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  scheduleAction = self->_scheduleAction;
  objc_msgSend_unlock(self, v5, v6);
  return scheduleAction;
}

- (void)setScheduleAction:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_scheduleAction != a3)
  {
    self->_scheduleAction = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (NSDate)scheduleDate
{
  uint64_t v2;
  NSDate *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_scheduleDate;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setScheduleDate:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *scheduleDate;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  scheduleDate = self->_scheduleDate;
  v12 = (id)v8;
  if (v8 | (unint64_t)scheduleDate
    && (!v8 || !scheduleDate || (objc_msgSend_isEqualToDate_(scheduleDate, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_scheduleDate, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (int64_t)scheduleUpdateStatus
{
  uint64_t v2;
  int64_t scheduleUpdateStatus;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  scheduleUpdateStatus = self->_scheduleUpdateStatus;
  objc_msgSend_unlock(self, v5, v6);
  return scheduleUpdateStatus;
}

- (void)setScheduleUpdateStatus:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_scheduleUpdateStatus != a3)
  {
    self->_scheduleUpdateStatus = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleDate, 0);
}

@end
