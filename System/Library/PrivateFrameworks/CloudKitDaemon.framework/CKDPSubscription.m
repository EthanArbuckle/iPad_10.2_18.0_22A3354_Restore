@implementation CKDPSubscription

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CKDPSubscription;
  -[CKDPSubscription dealloc](&v3, sel_dealloc);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int)evaluationType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_evaluationType;
  else
    return 1;
}

- (void)setEvaluationType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_evaluationType = a3;
}

- (void)setHasEvaluationType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEvaluationType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)evaluationTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7835F50[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEvaluationType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("trigger")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("sync")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("metasync")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (int)owner
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_owner;
  else
    return 1;
}

- (void)setOwner:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_owner = a3;
}

- (void)setHasOwner:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOwner
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)ownerAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("user");
  if (a3 == 2)
  {
    v3 = CFSTR("device");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsOwner:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;

  v3 = a3;
  v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("user")) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("device")))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (unint64_t)mutationTriggersCount
{
  return self->_mutationTriggers.count;
}

- (int)mutationTriggers
{
  return self->_mutationTriggers.list;
}

- (void)clearMutationTriggers
{
  PBRepeatedInt32Clear();
}

- (void)addMutationTriggers:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)mutationTriggersAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_mutationTriggers;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;

  p_mutationTriggers = &self->_mutationTriggers;
  count = self->_mutationTriggers.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v6, v9, v7, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v10, v11, v12);

  }
  return p_mutationTriggers->list[a3];
}

- (void)setMutationTriggers:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)mutationTriggersAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E7835F68[a3 - 1];
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMutationTriggers:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("insert")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("update")) & 1) != 0)
  {
    v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("remove")))
  {
    v6 = 3;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasNotification
{
  return self->_notification != 0;
}

- (void)clearFilters
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_filters, a2, v2);
}

- (void)addFilters:(id)a3
{
  const char *v4;
  NSMutableArray *filters;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  filters = self->_filters;
  v8 = (char *)v4;
  if (!filters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_filters;
    self->_filters = v6;

    v4 = v8;
    filters = self->_filters;
  }
  objc_msgSend_addObject_(filters, v4, (uint64_t)v4);

}

- (unint64_t)filtersCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_filters, a2, v2);
}

- (id)filtersAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_filters, a2, a3);
}

+ (Class)filtersType
{
  return (Class)objc_opt_class();
}

- (void)clearRecordTypes
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_recordTypes, a2, v2);
}

- (void)addRecordTypes:(id)a3
{
  const char *v4;
  NSMutableArray *recordTypes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  recordTypes = self->_recordTypes;
  v8 = (char *)v4;
  if (!recordTypes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_recordTypes;
    self->_recordTypes = v6;

    v4 = v8;
    recordTypes = self->_recordTypes;
  }
  objc_msgSend_addObject_(recordTypes, v4, (uint64_t)v4);

}

- (unint64_t)recordTypesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_recordTypes, a2, v2);
}

- (id)recordTypesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_recordTypes, a2, a3);
}

+ (Class)recordTypesType
{
  return (Class)objc_opt_class();
}

- (void)setFireOnce:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_fireOnce = a3;
}

- (void)setHasFireOnce:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFireOnce
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPSubscription;
  -[CKDPSubscription description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  CKDPIdentifier *identifier;
  void *v8;
  const char *v9;
  char has;
  unsigned int v11;
  __CFString *v12;
  int owner;
  __CFString *v14;
  const char *v15;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_mutationTriggers;
  unint64_t count;
  const char *v18;
  void *v19;
  unint64_t v20;
  unsigned int v21;
  __CFString *v22;
  CKDPSubscriptionNotification *notification;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  NSMutableArray *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  NSMutableArray *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  const char *v62;
  const char *v63;
  void *v64;
  const char *v65;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  void *v67;
  const char *v68;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("identifier"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v11 = self->_evaluationType - 1;
    if (v11 >= 3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_evaluationType);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E7835F50[v11];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v12, CFSTR("evaluationType"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    owner = self->_owner;
    if (owner == 1)
    {
      v14 = CFSTR("user");
      objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("user"), CFSTR("owner"));
    }
    else if (owner == 2)
    {
      v14 = CFSTR("device");
      objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)CFSTR("device"), CFSTR("owner"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_owner);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("owner"));
    }

  }
  p_mutationTriggers = &self->_mutationTriggers;
  count = self->_mutationTriggers.count;
  if (count)
  {
    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v4, count);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_mutationTriggers.count)
    {
      v20 = 0;
      do
      {
        v21 = p_mutationTriggers->list[v20] - 1;
        if (v21 >= 3)
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v18, (uint64_t)CFSTR("(unknown: %i)"), p_mutationTriggers->list[v20]);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = off_1E7835F68[v21];
        }
        objc_msgSend_addObject_(v19, v18, (uint64_t)v22);

        ++v20;
      }
      while (v20 < self->_mutationTriggers.count);
    }
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v19, CFSTR("mutationTriggers"));

  }
  notification = self->_notification;
  if (notification)
  {
    objc_msgSend_dictionaryRepresentation(notification, v4, count);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v24, CFSTR("notification"));

  }
  if (objc_msgSend_count(self->_filters, v4, count))
  {
    v28 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v31 = objc_msgSend_count(self->_filters, v29, v30);
    v33 = (void *)objc_msgSend_initWithCapacity_(v28, v32, v31);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v34 = self->_filters;
    v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v74, v79, 16);
    if (v36)
    {
      v39 = v36;
      v40 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v75 != v40)
            objc_enumerationMutation(v34);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v74 + 1) + 8 * i), v37, v38);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v33, v43, (uint64_t)v42);

        }
        v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v74, v79, 16);
      }
      while (v39);
    }

    objc_msgSend_setObject_forKey_(v6, v44, (uint64_t)v33, CFSTR("filters"));
  }
  if (objc_msgSend_count(self->_recordTypes, v26, v27))
  {
    v47 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v50 = objc_msgSend_count(self->_recordTypes, v48, v49);
    v52 = (void *)objc_msgSend_initWithCapacity_(v47, v51, v50);
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v53 = self->_recordTypes;
    v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v70, v78, 16);
    if (v55)
    {
      v58 = v55;
      v59 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v58; ++j)
        {
          if (*(_QWORD *)v71 != v59)
            objc_enumerationMutation(v53);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v70 + 1) + 8 * j), v56, v57);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v52, v62, (uint64_t)v61);

        }
        v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v70, v78, 16);
      }
      while (v58);
    }

    objc_msgSend_setObject_forKey_(v6, v63, (uint64_t)v52, CFSTR("recordTypes"));
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v45, self->_fireOnce);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v65, (uint64_t)v64, CFSTR("fireOnce"));

  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(zoneIdentifier, v45, v46);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v68, (uint64_t)v67, CFSTR("zoneIdentifier"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB9D738((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  NSMutableArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const char *v13;
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_mutationTriggers.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < self->_mutationTriggers.count);
  }
  if (self->_notification)
    PBDataWriterWriteSubmessage();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = self->_filters;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v13, (uint64_t)&v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_recordTypes;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v20, (uint64_t)&v21, v29, 16);
    }
    while (v17);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_zoneIdentifier)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  CKDPIdentifier *identifier;
  char has;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  const char *v16;
  CKDPSubscriptionNotification *notification;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  const char *v35;
  void *v36;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  _BYTE *v38;

  v4 = a3;
  identifier = self->_identifier;
  v38 = v4;
  if (identifier)
  {
    objc_msgSend_setIdentifier_(v4, v5, (uint64_t)identifier);
    v4 = v38;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_evaluationType;
    v4[92] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_owner;
    v4[92] |= 2u;
  }
  if (objc_msgSend_mutationTriggersCount(self, v5, (uint64_t)identifier))
  {
    objc_msgSend_clearMutationTriggers(v38, v8, v9);
    v12 = objc_msgSend_mutationTriggersCount(self, v10, v11);
    if (v12)
    {
      v13 = v12;
      for (i = 0; i != v13; ++i)
      {
        v15 = objc_msgSend_mutationTriggersAtIndex_(self, v8, i);
        objc_msgSend_addMutationTriggers_(v38, v16, v15);
      }
    }
  }
  notification = self->_notification;
  if (notification)
    objc_msgSend_setNotification_(v38, v8, (uint64_t)notification);
  if (objc_msgSend_filtersCount(self, v8, (uint64_t)notification))
  {
    objc_msgSend_clearFilters(v38, v18, v19);
    v22 = objc_msgSend_filtersCount(self, v20, v21);
    if (v22)
    {
      v23 = v22;
      for (j = 0; j != v23; ++j)
      {
        objc_msgSend_filtersAtIndex_(self, v18, j);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addFilters_(v38, v26, (uint64_t)v25);

      }
    }
  }
  if (objc_msgSend_recordTypesCount(self, v18, v19))
  {
    objc_msgSend_clearRecordTypes(v38, v27, v28);
    v31 = objc_msgSend_recordTypesCount(self, v29, v30);
    if (v31)
    {
      v32 = v31;
      for (k = 0; k != v32; ++k)
      {
        objc_msgSend_recordTypesAtIndex_(self, v27, k);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addRecordTypes_(v38, v35, (uint64_t)v34);

      }
    }
  }
  v36 = v38;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v38[88] = self->_fireOnce;
    v38[92] |= 4u;
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v38, v27, (uint64_t)zoneIdentifier);
    v36 = v38;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  char has;
  const char *v15;
  uint64_t v16;
  void *v17;
  NSMutableArray *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  const char *v26;
  NSMutableArray *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v12;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v10 + 32) = self->_evaluationType;
    *(_BYTE *)(v10 + 92) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 64) = self->_owner;
    *(_BYTE *)(v10 + 92) |= 2u;
  }
  PBRepeatedInt32Copy();
  v16 = objc_msgSend_copyWithZone_(self->_notification, v15, (uint64_t)a3);
  v17 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = v16;

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v18 = self->_filters;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v44, v49, 16);
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(v18);
        v25 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v44 + 1) + 8 * i), v21, (uint64_t)a3);
        objc_msgSend_addFilters_((void *)v10, v26, (uint64_t)v25);

      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v44, v49, 16);
    }
    while (v22);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v27 = self->_recordTypes;
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v40, v48, 16);
  if (v29)
  {
    v31 = v29;
    v32 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v41 != v32)
          objc_enumerationMutation(v27);
        v34 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v40 + 1) + 8 * j), v30, (uint64_t)a3, (_QWORD)v40);
        objc_msgSend_addRecordTypes_((void *)v10, v35, (uint64_t)v34);

      }
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v40, v48, 16);
    }
    while (v31);
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v10 + 88) = self->_fireOnce;
    *(_BYTE *)(v10 + 92) |= 4u;
  }
  v37 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v36, (uint64_t)a3, (_QWORD)v40);
  v38 = *(void **)(v10 + 80);
  *(_QWORD *)(v10 + 80) = v37;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPIdentifier *identifier;
  uint64_t v9;
  const char *v10;
  CKDPSubscriptionNotification *notification;
  uint64_t v12;
  NSMutableArray *filters;
  uint64_t v14;
  NSMutableArray *recordTypes;
  uint64_t v16;
  char isEqual;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v20;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_25;
  identifier = self->_identifier;
  v9 = v4[6];
  if ((unint64_t)identifier | v9)
  {
    if (!objc_msgSend_isEqual_(identifier, v7, v9))
      goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_evaluationType != *((_DWORD *)v4 + 8))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 2) == 0 || self->_owner != *((_DWORD *)v4 + 16))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 92) & 2) != 0)
  {
    goto LABEL_25;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_25;
  notification = self->_notification;
  v12 = v4[7];
  if ((unint64_t)notification | v12)
  {
    if (!objc_msgSend_isEqual_(notification, v10, v12))
      goto LABEL_25;
  }
  filters = self->_filters;
  v14 = v4[5];
  if ((unint64_t)filters | v14)
  {
    if (!objc_msgSend_isEqual_(filters, v10, v14))
      goto LABEL_25;
  }
  recordTypes = self->_recordTypes;
  v16 = v4[9];
  if ((unint64_t)recordTypes | v16)
  {
    if (!objc_msgSend_isEqual_(recordTypes, v10, v16))
      goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 92) & 4) == 0)
      goto LABEL_31;
LABEL_25:
    isEqual = 0;
    goto LABEL_26;
  }
  if ((*((_BYTE *)v4 + 92) & 4) == 0)
    goto LABEL_25;
  if (!self->_fireOnce)
  {
    if (!*((_BYTE *)v4 + 88))
      goto LABEL_31;
    goto LABEL_25;
  }
  if (!*((_BYTE *)v4 + 88))
    goto LABEL_25;
LABEL_31:
  zoneIdentifier = self->_zoneIdentifier;
  v20 = v4[10];
  if ((unint64_t)zoneIdentifier | v20)
    isEqual = objc_msgSend_isEqual_(zoneIdentifier, v10, v20);
  else
    isEqual = 1;
LABEL_26:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_evaluationType;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_owner;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  v7 = PBRepeatedInt32Hash();
  v10 = objc_msgSend_hash(self->_notification, v8, v9);
  v13 = objc_msgSend_hash(self->_filters, v11, v12);
  v16 = objc_msgSend_hash(self->_recordTypes, v14, v15);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v19 = 2654435761 * self->_fireOnce;
  else
    v19 = 0;
  return v5 ^ v4 ^ v6 ^ v7 ^ v10 ^ v13 ^ v16 ^ v19 ^ objc_msgSend_hash(self->_zoneIdentifier, v17, v18);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPIdentifier *identifier;
  uint64_t v7;
  char v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  const char *v14;
  CKDPSubscriptionNotification *notification;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  const char *v31;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  identifier = self->_identifier;
  v7 = *((_QWORD *)v5 + 6);
  if (identifier)
  {
    if (v7)
      objc_msgSend_mergeFrom_(identifier, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setIdentifier_(self, v4, v7);
  }
  v8 = *((_BYTE *)v5 + 92);
  if ((v8 & 1) != 0)
  {
    self->_evaluationType = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 1u;
    v8 = *((_BYTE *)v5 + 92);
  }
  if ((v8 & 2) != 0)
  {
    self->_owner = *((_DWORD *)v5 + 16);
    *(_BYTE *)&self->_has |= 2u;
  }
  v9 = objc_msgSend_mutationTriggersCount(v5, v4, v7);
  if (v9)
  {
    v11 = v9;
    for (i = 0; i != v11; ++i)
    {
      v13 = objc_msgSend_mutationTriggersAtIndex_(v5, v10, i);
      objc_msgSend_addMutationTriggers_(self, v14, v13);
    }
  }
  notification = self->_notification;
  v16 = *((_QWORD *)v5 + 7);
  if (notification)
  {
    if (v16)
      objc_msgSend_mergeFrom_(notification, v10, v16);
  }
  else if (v16)
  {
    objc_msgSend_setNotification_(self, v10, v16);
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v17 = *((id *)v5 + 5);
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v38, v43, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v39 != v22)
          objc_enumerationMutation(v17);
        objc_msgSend_addFilters_(self, v20, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v38, v43, 16);
    }
    while (v21);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v24 = *((id *)v5 + 9);
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v34, v42, 16);
  if (v26)
  {
    v28 = v26;
    v29 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v35 != v29)
          objc_enumerationMutation(v24);
        objc_msgSend_addRecordTypes_(self, v27, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k), (_QWORD)v34);
      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v34, v42, 16);
    }
    while (v28);
  }

  if ((*((_BYTE *)v5 + 92) & 4) != 0)
  {
    self->_fireOnce = *((_BYTE *)v5 + 88);
    *(_BYTE *)&self->_has |= 4u;
  }
  zoneIdentifier = self->_zoneIdentifier;
  v33 = *((_QWORD *)v5 + 10);
  if (zoneIdentifier)
  {
    if (v33)
      objc_msgSend_mergeFrom_(zoneIdentifier, v31, v33);
  }
  else if (v33)
  {
    objc_msgSend_setZoneIdentifier_(self, v31, v33);
  }

}

- (CKDPIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (CKDPSubscriptionNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  objc_storeStrong((id *)&self->_notification, a3);
}

- (NSMutableArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (NSMutableArray)recordTypes
{
  return self->_recordTypes;
}

- (void)setRecordTypes:(id)a3
{
  objc_storeStrong((id *)&self->_recordTypes, a3);
}

- (BOOL)fireOnce
{
  return self->_fireOnce;
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_recordTypes, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_filters, 0);
}

@end
