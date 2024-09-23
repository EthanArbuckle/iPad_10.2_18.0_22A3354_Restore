@implementation CKDPSupportedCapabilities

- (int)version
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_version;
  else
    return 1;
}

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (BOOL)hasUserIdentifier
{
  return self->_userIdentifier != 0;
}

- (void)clearZoneLevelCapabilities
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_zoneLevelCapabilities, a2, v2);
}

- (void)addZoneLevelCapabilities:(id)a3
{
  const char *v4;
  NSMutableArray *zoneLevelCapabilities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  zoneLevelCapabilities = self->_zoneLevelCapabilities;
  v8 = (char *)v4;
  if (!zoneLevelCapabilities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_zoneLevelCapabilities;
    self->_zoneLevelCapabilities = v6;

    v4 = v8;
    zoneLevelCapabilities = self->_zoneLevelCapabilities;
  }
  objc_msgSend_addObject_(zoneLevelCapabilities, v4, (uint64_t)v4);

}

- (unint64_t)zoneLevelCapabilitiesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_zoneLevelCapabilities, a2, v2);
}

- (id)zoneLevelCapabilitiesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_zoneLevelCapabilities, a2, a3);
}

+ (Class)zoneLevelCapabilitiesType
{
  return (Class)objc_opt_class();
}

- (void)clearRecordLevelCapabilities
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_recordLevelCapabilities, a2, v2);
}

- (void)addRecordLevelCapabilities:(id)a3
{
  const char *v4;
  NSMutableArray *recordLevelCapabilities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  recordLevelCapabilities = self->_recordLevelCapabilities;
  v8 = (char *)v4;
  if (!recordLevelCapabilities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_recordLevelCapabilities;
    self->_recordLevelCapabilities = v6;

    v4 = v8;
    recordLevelCapabilities = self->_recordLevelCapabilities;
  }
  objc_msgSend_addObject_(recordLevelCapabilities, v4, (uint64_t)v4);

}

- (unint64_t)recordLevelCapabilitiesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_recordLevelCapabilities, a2, v2);
}

- (id)recordLevelCapabilitiesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_recordLevelCapabilities, a2, a3);
}

+ (Class)recordLevelCapabilitiesType
{
  return (Class)objc_opt_class();
}

- (void)clearFieldLevelCapabilities
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_fieldLevelCapabilities, a2, v2);
}

- (void)addFieldLevelCapabilities:(id)a3
{
  const char *v4;
  NSMutableArray *fieldLevelCapabilities;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  fieldLevelCapabilities = self->_fieldLevelCapabilities;
  v8 = (char *)v4;
  if (!fieldLevelCapabilities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fieldLevelCapabilities;
    self->_fieldLevelCapabilities = v6;

    v4 = v8;
    fieldLevelCapabilities = self->_fieldLevelCapabilities;
  }
  objc_msgSend_addObject_(fieldLevelCapabilities, v4, (uint64_t)v4);

}

- (unint64_t)fieldLevelCapabilitiesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_fieldLevelCapabilities, a2, v2);
}

- (id)fieldLevelCapabilitiesAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fieldLevelCapabilities, a2, a3);
}

+ (Class)fieldLevelCapabilitiesType
{
  return (Class)objc_opt_class();
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
  v11.super_class = (Class)CKDPSupportedCapabilities;
  -[CKDPSupportedCapabilities description](&v11, sel_description);
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
  void *v7;
  const char *v8;
  CKDPDate *time;
  void *v10;
  const char *v11;
  CKDPIdentifier *deviceIdentifier;
  void *v13;
  const char *v14;
  CKDPIdentifier *userIdentifier;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  NSMutableArray *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  NSMutableArray *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  const char *v54;
  const char *v55;
  id v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  NSMutableArray *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  void *v70;
  const char *v71;
  const char *v72;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_version);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, CFSTR("version"));

  }
  time = self->_time;
  if (time)
  {
    objc_msgSend_dictionaryRepresentation(time, v4, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("time"));

  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(deviceIdentifier, v4, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("deviceIdentifier"));

  }
  userIdentifier = self->_userIdentifier;
  if (userIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(userIdentifier, v4, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, CFSTR("userIdentifier"));

  }
  if (objc_msgSend_count(self->_zoneLevelCapabilities, v4, v5))
  {
    v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v23 = objc_msgSend_count(self->_zoneLevelCapabilities, v21, v22);
    v25 = (void *)objc_msgSend_initWithCapacity_(v20, v24, v23);
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v26 = self->_zoneLevelCapabilities;
    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v82, v88, 16);
    if (v28)
    {
      v31 = v28;
      v32 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v83 != v32)
            objc_enumerationMutation(v26);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v82 + 1) + 8 * i), v29, v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v25, v35, (uint64_t)v34);

        }
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v82, v88, 16);
      }
      while (v31);
    }

    objc_msgSend_setObject_forKey_(v6, v36, (uint64_t)v25, CFSTR("zoneLevelCapabilities"));
  }
  if (objc_msgSend_count(self->_recordLevelCapabilities, v18, v19))
  {
    v39 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v42 = objc_msgSend_count(self->_recordLevelCapabilities, v40, v41);
    v44 = (void *)objc_msgSend_initWithCapacity_(v39, v43, v42);
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v45 = self->_recordLevelCapabilities;
    v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v78, v87, 16);
    if (v47)
    {
      v50 = v47;
      v51 = *(_QWORD *)v79;
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v79 != v51)
            objc_enumerationMutation(v45);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v78 + 1) + 8 * j), v48, v49);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v44, v54, (uint64_t)v53);

        }
        v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v78, v87, 16);
      }
      while (v50);
    }

    objc_msgSend_setObject_forKey_(v6, v55, (uint64_t)v44, CFSTR("recordLevelCapabilities"));
  }
  if (objc_msgSend_count(self->_fieldLevelCapabilities, v37, v38))
  {
    v56 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v59 = objc_msgSend_count(self->_fieldLevelCapabilities, v57, v58);
    v61 = (void *)objc_msgSend_initWithCapacity_(v56, v60, v59);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v62 = self->_fieldLevelCapabilities;
    v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v74, v86, 16);
    if (v64)
    {
      v67 = v64;
      v68 = *(_QWORD *)v75;
      do
      {
        for (k = 0; k != v67; ++k)
        {
          if (*(_QWORD *)v75 != v68)
            objc_enumerationMutation(v62);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v74 + 1) + 8 * k), v65, v66, (_QWORD)v74);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v61, v71, (uint64_t)v70);

        }
        v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v74, v86, 16);
      }
      while (v67);
    }

    objc_msgSend_setObject_forKey_(v6, v72, (uint64_t)v61, CFSTR("fieldLevelCapabilities"));
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  CKDPSupportedCapabilitiesCapability *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  const char *v29;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    while (!*((_BYTE *)a3 + *v6))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v22);
            *(_QWORD *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_45;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_47;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_45:
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v20) = 0;
LABEL_47:
          self->_version = v20;
          goto LABEL_42;
        case 2u:
          v25 = (CKDPSupportedCapabilitiesCapability *)objc_alloc_init(MEMORY[0x1E0C94C60]);
          objc_storeStrong((id *)&self->_time, v25);
          if (!PBReaderPlaceMark() || (CKDPDateReadFrom() & 1) == 0)
            goto LABEL_49;
          goto LABEL_41;
        case 3u:
          v25 = (CKDPSupportedCapabilitiesCapability *)objc_alloc_init(MEMORY[0x1E0C94C70]);
          v26 = 8;
          goto LABEL_33;
        case 4u:
          v25 = (CKDPSupportedCapabilitiesCapability *)objc_alloc_init(MEMORY[0x1E0C94C70]);
          v26 = 40;
LABEL_33:
          objc_storeStrong((id *)((char *)&self->super.super.isa + v26), v25);
          if (!PBReaderPlaceMark() || (CKDPIdentifierReadFrom() & 1) == 0)
            goto LABEL_49;
          goto LABEL_41;
        case 5u:
          v25 = objc_alloc_init(CKDPSupportedCapabilitiesCapability);
          objc_msgSend_addZoneLevelCapabilities_(self, v27, (uint64_t)v25);
          goto LABEL_39;
        case 6u:
          v25 = objc_alloc_init(CKDPSupportedCapabilitiesCapability);
          objc_msgSend_addRecordLevelCapabilities_(self, v28, (uint64_t)v25);
          goto LABEL_39;
        case 7u:
          v25 = objc_alloc_init(CKDPSupportedCapabilitiesCapability);
          objc_msgSend_addFieldLevelCapabilities_(self, v29, (uint64_t)v25);
LABEL_39:
          if (!PBReaderPlaceMark() || !sub_1BEAD0ADC(v25, (uint64_t)a3))
          {
LABEL_49:

            LOBYTE(v24) = 0;
            return v24;
          }
LABEL_41:
          PBReaderRecallMark();

LABEL_42:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_48;
          break;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          goto LABEL_42;
      }
    }
  }
LABEL_48:
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  NSMutableArray *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  NSMutableArray *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_time)
    PBDataWriterWriteSubmessage();
  if (self->_deviceIdentifier)
    PBDataWriterWriteSubmessage();
  if (self->_userIdentifier)
    PBDataWriterWriteSubmessage();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = self->_zoneLevelCapabilities;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v34, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v34, v40, 16);
    }
    while (v8);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = self->_recordLevelCapabilities;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v30, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v30, v39, 16);
    }
    while (v15);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = self->_fieldLevelCapabilities;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v26, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v26, v38, 16);
    }
    while (v22);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  CKDPDate *time;
  CKDPIdentifier *deviceIdentifier;
  CKDPIdentifier *userIdentifier;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
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
  const char *v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  const char *v36;
  id v37;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[12] = self->_version;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  time = self->_time;
  v37 = v4;
  if (time)
    objc_msgSend_setTime_(v4, v5, (uint64_t)time);
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
    objc_msgSend_setDeviceIdentifier_(v37, v5, (uint64_t)deviceIdentifier);
  userIdentifier = self->_userIdentifier;
  if (userIdentifier)
    objc_msgSend_setUserIdentifier_(v37, v5, (uint64_t)userIdentifier);
  if (objc_msgSend_zoneLevelCapabilitiesCount(self, v5, (uint64_t)userIdentifier))
  {
    objc_msgSend_clearZoneLevelCapabilities(v37, v9, v10);
    v13 = objc_msgSend_zoneLevelCapabilitiesCount(self, v11, v12);
    if (v13)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend_zoneLevelCapabilitiesAtIndex_(self, v9, i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addZoneLevelCapabilities_(v37, v17, (uint64_t)v16);

      }
    }
  }
  if (objc_msgSend_recordLevelCapabilitiesCount(self, v9, v10))
  {
    objc_msgSend_clearRecordLevelCapabilities(v37, v18, v19);
    v22 = objc_msgSend_recordLevelCapabilitiesCount(self, v20, v21);
    if (v22)
    {
      v23 = v22;
      for (j = 0; j != v23; ++j)
      {
        objc_msgSend_recordLevelCapabilitiesAtIndex_(self, v18, j);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addRecordLevelCapabilities_(v37, v26, (uint64_t)v25);

      }
    }
  }
  if (objc_msgSend_fieldLevelCapabilitiesCount(self, v18, v19))
  {
    objc_msgSend_clearFieldLevelCapabilities(v37, v27, v28);
    v31 = objc_msgSend_fieldLevelCapabilitiesCount(self, v29, v30);
    if (v31)
    {
      v33 = v31;
      for (k = 0; k != v33; ++k)
      {
        objc_msgSend_fieldLevelCapabilitiesAtIndex_(self, v32, k);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addFieldLevelCapabilities_(v37, v36, (uint64_t)v35);

      }
    }
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
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  const char *v29;
  NSMutableArray *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  const char *v38;
  NSMutableArray *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  const char *v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (_QWORD *)v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 48) = self->_version;
    *(_BYTE *)(v10 + 64) |= 1u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_time, v11, (uint64_t)a3);
  v14 = (void *)v12[4];
  v12[4] = v13;

  v16 = objc_msgSend_copyWithZone_(self->_deviceIdentifier, v15, (uint64_t)a3);
  v17 = (void *)v12[1];
  v12[1] = v16;

  v19 = objc_msgSend_copyWithZone_(self->_userIdentifier, v18, (uint64_t)a3);
  v20 = (void *)v12[5];
  v12[5] = v19;

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v21 = self->_zoneLevelCapabilities;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v57, v63, 16);
  if (v23)
  {
    v25 = v23;
    v26 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v58 != v26)
          objc_enumerationMutation(v21);
        v28 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v57 + 1) + 8 * i), v24, (uint64_t)a3);
        objc_msgSend_addZoneLevelCapabilities_(v12, v29, (uint64_t)v28);

      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v57, v63, 16);
    }
    while (v25);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v30 = self->_recordLevelCapabilities;
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v53, v62, 16);
  if (v32)
  {
    v34 = v32;
    v35 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v54 != v35)
          objc_enumerationMutation(v30);
        v37 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v53 + 1) + 8 * j), v33, (uint64_t)a3);
        objc_msgSend_addRecordLevelCapabilities_(v12, v38, (uint64_t)v37);

      }
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v53, v62, 16);
    }
    while (v34);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v39 = self->_fieldLevelCapabilities;
  v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v49, v61, 16);
  if (v41)
  {
    v43 = v41;
    v44 = *(_QWORD *)v50;
    do
    {
      for (k = 0; k != v43; ++k)
      {
        if (*(_QWORD *)v50 != v44)
          objc_enumerationMutation(v39);
        v46 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v49 + 1) + 8 * k), v42, (uint64_t)a3, (_QWORD)v49);
        objc_msgSend_addFieldLevelCapabilities_(v12, v47, (uint64_t)v46);

      }
      v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v42, (uint64_t)&v49, v61, 16);
    }
    while (v43);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPDate *time;
  uint64_t v9;
  CKDPIdentifier *deviceIdentifier;
  uint64_t v11;
  CKDPIdentifier *userIdentifier;
  uint64_t v13;
  NSMutableArray *zoneLevelCapabilities;
  uint64_t v15;
  NSMutableArray *recordLevelCapabilities;
  uint64_t v17;
  NSMutableArray *fieldLevelCapabilities;
  uint64_t v19;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[8] & 1) == 0 || self->_version != *((_DWORD *)v4 + 12))
      goto LABEL_19;
  }
  else if ((v4[8] & 1) != 0)
  {
LABEL_19:
    isEqual = 0;
    goto LABEL_20;
  }
  time = self->_time;
  v9 = v4[4];
  if ((unint64_t)time | v9 && !objc_msgSend_isEqual_(time, v7, v9))
    goto LABEL_19;
  deviceIdentifier = self->_deviceIdentifier;
  v11 = v4[1];
  if ((unint64_t)deviceIdentifier | v11)
  {
    if (!objc_msgSend_isEqual_(deviceIdentifier, v7, v11))
      goto LABEL_19;
  }
  userIdentifier = self->_userIdentifier;
  v13 = v4[5];
  if ((unint64_t)userIdentifier | v13)
  {
    if (!objc_msgSend_isEqual_(userIdentifier, v7, v13))
      goto LABEL_19;
  }
  zoneLevelCapabilities = self->_zoneLevelCapabilities;
  v15 = v4[7];
  if ((unint64_t)zoneLevelCapabilities | v15)
  {
    if (!objc_msgSend_isEqual_(zoneLevelCapabilities, v7, v15))
      goto LABEL_19;
  }
  recordLevelCapabilities = self->_recordLevelCapabilities;
  v17 = v4[3];
  if ((unint64_t)recordLevelCapabilities | v17)
  {
    if (!objc_msgSend_isEqual_(recordLevelCapabilities, v7, v17))
      goto LABEL_19;
  }
  fieldLevelCapabilities = self->_fieldLevelCapabilities;
  v19 = v4[2];
  if ((unint64_t)fieldLevelCapabilities | v19)
    isEqual = objc_msgSend_isEqual_(fieldLevelCapabilities, v7, v19);
  else
    isEqual = 1;
LABEL_20:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_version;
  else
    v4 = 0;
  v5 = objc_msgSend_hash(self->_time, a2, v2) ^ v4;
  v8 = objc_msgSend_hash(self->_deviceIdentifier, v6, v7);
  v11 = v5 ^ v8 ^ objc_msgSend_hash(self->_userIdentifier, v9, v10);
  v14 = objc_msgSend_hash(self->_zoneLevelCapabilities, v12, v13);
  v17 = v14 ^ objc_msgSend_hash(self->_recordLevelCapabilities, v15, v16);
  return v11 ^ v17 ^ objc_msgSend_hash(self->_fieldLevelCapabilities, v18, v19);
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  const char *v5;
  id v6;
  CKDPDate *time;
  uint64_t v8;
  CKDPIdentifier *deviceIdentifier;
  uint64_t v10;
  CKDPIdentifier *userIdentifier;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6 = v4;
  if ((v4[16] & 1) != 0)
  {
    self->_version = v4[12];
    *(_BYTE *)&self->_has |= 1u;
  }
  time = self->_time;
  v8 = *((_QWORD *)v6 + 4);
  if (time)
  {
    if (v8)
      objc_msgSend_mergeFrom_(time, v5, v8);
  }
  else if (v8)
  {
    objc_msgSend_setTime_(self, v5, v8);
  }
  deviceIdentifier = self->_deviceIdentifier;
  v10 = *((_QWORD *)v6 + 1);
  if (deviceIdentifier)
  {
    if (v10)
      objc_msgSend_mergeFrom_(deviceIdentifier, v5, v10);
  }
  else if (v10)
  {
    objc_msgSend_setDeviceIdentifier_(self, v5, v10);
  }
  userIdentifier = self->_userIdentifier;
  v12 = *((_QWORD *)v6 + 5);
  if (userIdentifier)
  {
    if (v12)
      objc_msgSend_mergeFrom_(userIdentifier, v5, v12);
  }
  else if (v12)
  {
    objc_msgSend_setUserIdentifier_(self, v5, v12);
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v13 = *((id *)v6 + 7);
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v42, v48, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(v13);
        objc_msgSend_addZoneLevelCapabilities_(self, v16, *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v42, v48, 16);
    }
    while (v17);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v20 = *((id *)v6 + 3);
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v38, v47, 16);
  if (v22)
  {
    v24 = v22;
    v25 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v39 != v25)
          objc_enumerationMutation(v20);
        objc_msgSend_addRecordLevelCapabilities_(self, v23, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v38, v47, 16);
    }
    while (v24);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = *((id *)v6 + 2);
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v34, v46, 16);
  if (v29)
  {
    v31 = v29;
    v32 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(v27);
        objc_msgSend_addFieldLevelCapabilities_(self, v30, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k), (_QWORD)v34);
      }
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v34, v46, 16);
    }
    while (v31);
  }

}

- (CKDPDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (CKDPIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (CKDPIdentifier)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_userIdentifier, a3);
}

- (NSMutableArray)zoneLevelCapabilities
{
  return self->_zoneLevelCapabilities;
}

- (void)setZoneLevelCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_zoneLevelCapabilities, a3);
}

- (NSMutableArray)recordLevelCapabilities
{
  return self->_recordLevelCapabilities;
}

- (void)setRecordLevelCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_recordLevelCapabilities, a3);
}

- (NSMutableArray)fieldLevelCapabilities
{
  return self->_fieldLevelCapabilities;
}

- (void)setFieldLevelCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_fieldLevelCapabilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneLevelCapabilities, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_recordLevelCapabilities, 0);
  objc_storeStrong((id *)&self->_fieldLevelCapabilities, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
