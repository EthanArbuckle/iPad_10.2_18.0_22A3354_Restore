@implementation CKDPSubscriptionNotification

- (BOOL)hasAlert
{
  return self->_alert != 0;
}

- (void)setShouldBadge:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shouldBadge = a3;
}

- (void)setHasShouldBadge:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShouldBadge
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearAdditionalFields
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_additionalFields, a2, v2);
}

- (void)addAdditionalFields:(id)a3
{
  const char *v4;
  NSMutableArray *additionalFields;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  additionalFields = self->_additionalFields;
  v8 = (char *)v4;
  if (!additionalFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_additionalFields;
    self->_additionalFields = v6;

    v4 = v8;
    additionalFields = self->_additionalFields;
  }
  objc_msgSend_addObject_(additionalFields, v4, (uint64_t)v4);

}

- (unint64_t)additionalFieldsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_additionalFields, a2, v2);
}

- (id)additionalFieldsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_additionalFields, a2, a3);
}

+ (Class)additionalFieldsType
{
  return (Class)objc_opt_class();
}

- (void)setShouldSendContentAvailable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shouldSendContentAvailable = a3;
}

- (void)setHasShouldSendContentAvailable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldSendContentAvailable
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setShouldSendMutableContent:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_shouldSendMutableContent = a3;
}

- (void)setHasShouldSendMutableContent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasShouldSendMutableContent
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasCollapseIdKey
{
  return self->_collapseIdKey != 0;
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
  v11.super_class = (Class)CKDPSubscriptionNotification;
  -[CKDPSubscriptionNotification description](&v11, sel_description);
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
  CKDPSubscriptionNotificationAlert *alert;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  NSMutableArray *additionalFields;
  char has;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  NSString *collapseIdKey;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  alert = self->_alert;
  if (alert)
  {
    objc_msgSend_dictionaryRepresentation(alert, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("alert"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_shouldBadge);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("shouldBadge"));

  }
  additionalFields = self->_additionalFields;
  if (additionalFields)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)additionalFields, CFSTR("additionalFields"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_shouldSendContentAvailable);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("shouldSendContentAvailable"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_shouldSendMutableContent);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, CFSTR("shouldSendMutableContent"));

  }
  collapseIdKey = self->_collapseIdKey;
  if (collapseIdKey)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)collapseIdKey, CFSTR("collapseIdKey"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEC86548((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const char *v11;
  char has;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_alert)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_additionalFields;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v13, v17, 16);
    }
    while (v8);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_collapseIdKey)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  CKDPSubscriptionNotificationAlert *alert;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  char has;
  void *v17;
  NSString *collapseIdKey;
  _BYTE *v19;

  v4 = a3;
  alert = self->_alert;
  v19 = v4;
  if (alert)
  {
    objc_msgSend_setAlert_(v4, v5, (uint64_t)alert);
    v4 = v19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[32] = self->_shouldBadge;
    v4[36] |= 1u;
  }
  if (objc_msgSend_additionalFieldsCount(self, v5, (uint64_t)alert))
  {
    objc_msgSend_clearAdditionalFields(v19, v7, v8);
    v11 = objc_msgSend_additionalFieldsCount(self, v9, v10);
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_additionalFieldsAtIndex_(self, v7, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addAdditionalFields_(v19, v15, (uint64_t)v14);

      }
    }
  }
  has = (char)self->_has;
  v17 = v19;
  if ((has & 2) != 0)
  {
    v19[33] = self->_shouldSendContentAvailable;
    v19[36] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v19[34] = self->_shouldSendMutableContent;
    v19[36] |= 4u;
  }
  collapseIdKey = self->_collapseIdKey;
  if (collapseIdKey)
  {
    objc_msgSend_setCollapseIdKey_(v19, v7, (uint64_t)collapseIdKey);
    v17 = v19;
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
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  const char *v22;
  const char *v23;
  char has;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_alert, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v10 + 32) = self->_shouldBadge;
    *(_BYTE *)(v10 + 36) |= 1u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = self->_additionalFields;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v28, v32, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v14);
        v21 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i), v17, (uint64_t)a3, (_QWORD)v28);
        objc_msgSend_addAdditionalFields_((void *)v10, v22, (uint64_t)v21);

      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v28, v32, 16);
    }
    while (v18);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v10 + 33) = self->_shouldSendContentAvailable;
    *(_BYTE *)(v10 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v10 + 34) = self->_shouldSendMutableContent;
    *(_BYTE *)(v10 + 36) |= 4u;
  }
  v25 = objc_msgSend_copyWithZone_(self->_collapseIdKey, v23, (uint64_t)a3, (_QWORD)v28);
  v26 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v25;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPSubscriptionNotificationAlert *alert;
  uint64_t v9;
  char has;
  char v11;
  NSMutableArray *additionalFields;
  uint64_t v13;
  char isEqual;
  NSString *collapseIdKey;
  uint64_t v17;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_27;
  alert = self->_alert;
  v9 = v4[2];
  if ((unint64_t)alert | v9)
  {
    if (!objc_msgSend_isEqual_(alert, v7, v9))
      goto LABEL_27;
  }
  has = (char)self->_has;
  v11 = *((_BYTE *)v4 + 36);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
      goto LABEL_27;
    if (self->_shouldBadge)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_27;
  }
  additionalFields = self->_additionalFields;
  v13 = v4[1];
  if ((unint64_t)additionalFields | v13)
  {
    if (!objc_msgSend_isEqual_(additionalFields, v7, v13))
      goto LABEL_27;
    has = (char)self->_has;
    v11 = *((_BYTE *)v4 + 36);
  }
  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0)
      goto LABEL_27;
    if (self->_shouldSendContentAvailable)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_27;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((has & 4) == 0)
  {
    if ((v11 & 4) == 0)
      goto LABEL_33;
LABEL_27:
    isEqual = 0;
    goto LABEL_28;
  }
  if ((v11 & 4) == 0)
    goto LABEL_27;
  if (!self->_shouldSendMutableContent)
  {
    if (!*((_BYTE *)v4 + 34))
      goto LABEL_33;
    goto LABEL_27;
  }
  if (!*((_BYTE *)v4 + 34))
    goto LABEL_27;
LABEL_33:
  collapseIdKey = self->_collapseIdKey;
  v17 = v4[3];
  if ((unint64_t)collapseIdKey | v17)
    isEqual = objc_msgSend_isEqual_(collapseIdKey, v7, v17);
  else
    isEqual = 1;
LABEL_28:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = objc_msgSend_hash(self->_alert, a2, v2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_shouldBadge;
  else
    v7 = 0;
  v8 = objc_msgSend_hash(self->_additionalFields, v4, v5);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v11 = 2654435761 * self->_shouldSendContentAvailable;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v12 = 0;
    return v7 ^ v6 ^ v8 ^ v11 ^ v12 ^ objc_msgSend_hash(self->_collapseIdKey, v9, v10);
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v12 = 2654435761 * self->_shouldSendMutableContent;
  return v7 ^ v6 ^ v8 ^ v11 ^ v12 ^ objc_msgSend_hash(self->_collapseIdKey, v9, v10);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPSubscriptionNotificationAlert *alert;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const char *v15;
  char v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  alert = self->_alert;
  v7 = *((_QWORD *)v5 + 2);
  if (alert)
  {
    if (v7)
      objc_msgSend_mergeFrom_(alert, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setAlert_(self, v4, v7);
  }
  if ((*((_BYTE *)v5 + 36) & 1) != 0)
  {
    self->_shouldBadge = *((_BYTE *)v5 + 32);
    *(_BYTE *)&self->_has |= 1u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = *((id *)v5 + 1);
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v18, v22, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v8);
        objc_msgSend_addAdditionalFields_(self, v11, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v18, v22, 16);
    }
    while (v12);
  }

  v16 = *((_BYTE *)v5 + 36);
  if ((v16 & 2) != 0)
  {
    self->_shouldSendContentAvailable = *((_BYTE *)v5 + 33);
    *(_BYTE *)&self->_has |= 2u;
    v16 = *((_BYTE *)v5 + 36);
  }
  if ((v16 & 4) != 0)
  {
    self->_shouldSendMutableContent = *((_BYTE *)v5 + 34);
    *(_BYTE *)&self->_has |= 4u;
  }
  v17 = *((_QWORD *)v5 + 3);
  if (v17)
    objc_msgSend_setCollapseIdKey_(self, v15, v17);

}

- (CKDPSubscriptionNotificationAlert)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
  objc_storeStrong((id *)&self->_alert, a3);
}

- (BOOL)shouldBadge
{
  return self->_shouldBadge;
}

- (NSMutableArray)additionalFields
{
  return self->_additionalFields;
}

- (void)setAdditionalFields:(id)a3
{
  objc_storeStrong((id *)&self->_additionalFields, a3);
}

- (BOOL)shouldSendContentAvailable
{
  return self->_shouldSendContentAvailable;
}

- (BOOL)shouldSendMutableContent
{
  return self->_shouldSendMutableContent;
}

- (NSString)collapseIdKey
{
  return self->_collapseIdKey;
}

- (void)setCollapseIdKey:(id)a3
{
  objc_storeStrong((id *)&self->_collapseIdKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collapseIdKey, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_additionalFields, 0);
}

@end
