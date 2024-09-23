@implementation CKDPZoneCryptoFeatureRequirements

- (int)minimumSchemaVersion
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_minimumSchemaVersion;
  else
    return 1;
}

- (void)setMinimumSchemaVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_minimumSchemaVersion = a3;
}

- (void)setHasMinimumSchemaVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumSchemaVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRevision:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_revision = a3;
}

- (void)setHasRevision:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRevision
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasRequiredZoneCryptoFeatures
{
  return self->_requiredZoneCryptoFeatures != 0;
}

- (BOOL)hasRequiredRecordCryptoFeatures
{
  return self->_requiredRecordCryptoFeatures != 0;
}

- (BOOL)hasRequiredFieldCryptoFeatures
{
  return self->_requiredFieldCryptoFeatures != 0;
}

- (BOOL)hasPermittedZoneCryptoFeatures
{
  return self->_permittedZoneCryptoFeatures != 0;
}

- (BOOL)hasPermittedRecordCryptoFeatures
{
  return self->_permittedRecordCryptoFeatures != 0;
}

- (BOOL)hasPermittedFieldCryptoFeatures
{
  return self->_permittedFieldCryptoFeatures != 0;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (BOOL)hasRequiredAdopterFeatures
{
  return self->_requiredAdopterFeatures != 0;
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
  v11.super_class = (Class)CKDPZoneCryptoFeatureRequirements;
  -[CKDPZoneCryptoFeatureRequirements description](&v11, sel_description);
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
  char has;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  CKDPZoneCryptoFeatureSet *requiredZoneCryptoFeatures;
  void *v13;
  const char *v14;
  CKDPRecordCryptoFeatureSet *requiredRecordCryptoFeatures;
  void *v16;
  const char *v17;
  CKDPFieldCryptoFeatureSet *requiredFieldCryptoFeatures;
  void *v19;
  const char *v20;
  CKDPZonePermittedCryptoFeatureSet *permittedZoneCryptoFeatures;
  void *v22;
  const char *v23;
  CKDPRecordPermittedCryptoFeatureSet *permittedRecordCryptoFeatures;
  void *v25;
  const char *v26;
  CKDPFieldPermittedCryptoFeatureSet *permittedFieldCryptoFeatures;
  void *v28;
  const char *v29;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  void *v31;
  const char *v32;
  CKDPAdopterFeatureSet *requiredAdopterFeatures;
  void *v34;
  const char *v35;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_minimumSchemaVersion);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("minimumSchemaVersion"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_revision);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, CFSTR("revision"));

  }
  requiredZoneCryptoFeatures = self->_requiredZoneCryptoFeatures;
  if (requiredZoneCryptoFeatures)
  {
    objc_msgSend_dictionaryRepresentation(requiredZoneCryptoFeatures, v4, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, CFSTR("requiredZoneCryptoFeatures"));

  }
  requiredRecordCryptoFeatures = self->_requiredRecordCryptoFeatures;
  if (requiredRecordCryptoFeatures)
  {
    objc_msgSend_dictionaryRepresentation(requiredRecordCryptoFeatures, v4, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, CFSTR("requiredRecordCryptoFeatures"));

  }
  requiredFieldCryptoFeatures = self->_requiredFieldCryptoFeatures;
  if (requiredFieldCryptoFeatures)
  {
    objc_msgSend_dictionaryRepresentation(requiredFieldCryptoFeatures, v4, v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)v19, CFSTR("requiredFieldCryptoFeatures"));

  }
  permittedZoneCryptoFeatures = self->_permittedZoneCryptoFeatures;
  if (permittedZoneCryptoFeatures)
  {
    objc_msgSend_dictionaryRepresentation(permittedZoneCryptoFeatures, v4, v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v23, (uint64_t)v22, CFSTR("permittedZoneCryptoFeatures"));

  }
  permittedRecordCryptoFeatures = self->_permittedRecordCryptoFeatures;
  if (permittedRecordCryptoFeatures)
  {
    objc_msgSend_dictionaryRepresentation(permittedRecordCryptoFeatures, v4, v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v26, (uint64_t)v25, CFSTR("permittedRecordCryptoFeatures"));

  }
  permittedFieldCryptoFeatures = self->_permittedFieldCryptoFeatures;
  if (permittedFieldCryptoFeatures)
  {
    objc_msgSend_dictionaryRepresentation(permittedFieldCryptoFeatures, v4, v5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v28, CFSTR("permittedFieldCryptoFeatures"));

  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v32, (uint64_t)v31, CFSTR("zoneIdentifier"));

  }
  requiredAdopterFeatures = self->_requiredAdopterFeatures;
  if (requiredAdopterFeatures)
  {
    objc_msgSend_dictionaryRepresentation(requiredAdopterFeatures, v4, v5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v35, (uint64_t)v34, CFSTR("requiredAdopterFeatures"));

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
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  CKDPZoneCryptoFeatureSet *v30;
  uint64_t v31;

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
              goto LABEL_60;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_62;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_60:
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v20) = 0;
LABEL_62:
          v31 = 8;
          goto LABEL_67;
        case 2u:
          v25 = 0;
          v26 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            v27 = *v4;
            v28 = *(_QWORD *)((char *)a3 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v28);
              *(_QWORD *)((char *)a3 + v27) = v28 + 1;
              v20 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v20) = 0;
LABEL_66:
          v31 = 72;
LABEL_67:
          *(_DWORD *)((char *)&self->super.super.isa + v31) = v20;
          goto LABEL_68;
        case 3u:
          v30 = objc_alloc_init(CKDPZoneCryptoFeatureSet);
          objc_storeStrong((id *)&self->_requiredZoneCryptoFeatures, v30);
          if (!PBReaderPlaceMark() || (sub_1BEC0815C((uint64_t)v30, (uint64_t)a3) & 1) == 0)
            goto LABEL_70;
          goto LABEL_58;
        case 4u:
          v30 = objc_alloc_init(CKDPRecordCryptoFeatureSet);
          objc_storeStrong((id *)&self->_requiredRecordCryptoFeatures, v30);
          if (!PBReaderPlaceMark() || (sub_1BEC67BD4((uint64_t)v30, (uint64_t)a3) & 1) == 0)
            goto LABEL_70;
          goto LABEL_58;
        case 5u:
          v30 = objc_alloc_init(CKDPFieldCryptoFeatureSet);
          objc_storeStrong((id *)&self->_requiredFieldCryptoFeatures, v30);
          if (!PBReaderPlaceMark() || !sub_1BEB62908((uint64_t)v30, (uint64_t)a3))
            goto LABEL_70;
          goto LABEL_58;
        case 6u:
          v30 = objc_alloc_init(CKDPZonePermittedCryptoFeatureSet);
          objc_storeStrong((id *)&self->_permittedZoneCryptoFeatures, v30);
          if (!PBReaderPlaceMark() || (sub_1BEAFE658((uint64_t)v30, (uint64_t)a3) & 1) == 0)
            goto LABEL_70;
          goto LABEL_58;
        case 7u:
          v30 = objc_alloc_init(CKDPRecordPermittedCryptoFeatureSet);
          objc_storeStrong((id *)&self->_permittedRecordCryptoFeatures, v30);
          if (!PBReaderPlaceMark() || (sub_1BEAE5C98((uint64_t)v30, (uint64_t)a3) & 1) == 0)
            goto LABEL_70;
          goto LABEL_58;
        case 8u:
          v30 = objc_alloc_init(CKDPFieldPermittedCryptoFeatureSet);
          objc_storeStrong((id *)&self->_permittedFieldCryptoFeatures, v30);
          if (!PBReaderPlaceMark() || (sub_1BEBACD28((uint64_t)v30, (uint64_t)a3) & 1) == 0)
            goto LABEL_70;
          goto LABEL_58;
        case 9u:
          v30 = (CKDPZoneCryptoFeatureSet *)objc_alloc_init(MEMORY[0x1E0C94C98]);
          objc_storeStrong((id *)&self->_zoneIdentifier, v30);
          if (!PBReaderPlaceMark() || (CKDPRecordZoneIdentifierReadFrom() & 1) == 0)
            goto LABEL_70;
          goto LABEL_58;
        case 0xAu:
          v30 = objc_alloc_init(CKDPAdopterFeatureSet);
          objc_storeStrong((id *)&self->_requiredAdopterFeatures, v30);
          if (!PBReaderPlaceMark() || (sub_1BEAF4AAC((uint64_t)v30, (uint64_t)a3) & 1) == 0)
          {
LABEL_70:

            LOBYTE(v24) = 0;
            return v24;
          }
LABEL_58:
          PBReaderRecallMark();

LABEL_68:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_69;
          break;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          goto LABEL_68;
      }
    }
  }
LABEL_69:
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_requiredZoneCryptoFeatures)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_requiredRecordCryptoFeatures)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_requiredFieldCryptoFeatures)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_permittedZoneCryptoFeatures)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_permittedRecordCryptoFeatures)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_permittedFieldCryptoFeatures)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_requiredAdopterFeatures)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  char has;
  CKDPZoneCryptoFeatureSet *requiredZoneCryptoFeatures;
  CKDPRecordCryptoFeatureSet *requiredRecordCryptoFeatures;
  CKDPFieldCryptoFeatureSet *requiredFieldCryptoFeatures;
  CKDPZonePermittedCryptoFeatureSet *permittedZoneCryptoFeatures;
  CKDPRecordPermittedCryptoFeatureSet *permittedRecordCryptoFeatures;
  CKDPFieldPermittedCryptoFeatureSet *permittedFieldCryptoFeatures;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  CKDPAdopterFeatureSet *requiredAdopterFeatures;
  _DWORD *v15;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = self->_minimumSchemaVersion;
    *((_BYTE *)v4 + 88) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[18] = self->_revision;
    *((_BYTE *)v4 + 88) |= 2u;
  }
  requiredZoneCryptoFeatures = self->_requiredZoneCryptoFeatures;
  v15 = v4;
  if (requiredZoneCryptoFeatures)
  {
    objc_msgSend_setRequiredZoneCryptoFeatures_(v4, v5, (uint64_t)requiredZoneCryptoFeatures);
    v4 = v15;
  }
  requiredRecordCryptoFeatures = self->_requiredRecordCryptoFeatures;
  if (requiredRecordCryptoFeatures)
  {
    objc_msgSend_setRequiredRecordCryptoFeatures_(v15, v5, (uint64_t)requiredRecordCryptoFeatures);
    v4 = v15;
  }
  requiredFieldCryptoFeatures = self->_requiredFieldCryptoFeatures;
  if (requiredFieldCryptoFeatures)
  {
    objc_msgSend_setRequiredFieldCryptoFeatures_(v15, v5, (uint64_t)requiredFieldCryptoFeatures);
    v4 = v15;
  }
  permittedZoneCryptoFeatures = self->_permittedZoneCryptoFeatures;
  if (permittedZoneCryptoFeatures)
  {
    objc_msgSend_setPermittedZoneCryptoFeatures_(v15, v5, (uint64_t)permittedZoneCryptoFeatures);
    v4 = v15;
  }
  permittedRecordCryptoFeatures = self->_permittedRecordCryptoFeatures;
  if (permittedRecordCryptoFeatures)
  {
    objc_msgSend_setPermittedRecordCryptoFeatures_(v15, v5, (uint64_t)permittedRecordCryptoFeatures);
    v4 = v15;
  }
  permittedFieldCryptoFeatures = self->_permittedFieldCryptoFeatures;
  if (permittedFieldCryptoFeatures)
  {
    objc_msgSend_setPermittedFieldCryptoFeatures_(v15, v5, (uint64_t)permittedFieldCryptoFeatures);
    v4 = v15;
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v15, v5, (uint64_t)zoneIdentifier);
    v4 = v15;
  }
  requiredAdopterFeatures = self->_requiredAdopterFeatures;
  if (requiredAdopterFeatures)
  {
    objc_msgSend_setRequiredAdopterFeatures_(v15, v5, (uint64_t)requiredAdopterFeatures);
    v4 = v15;
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
  char has;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (_QWORD *)v10;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v10 + 8) = self->_minimumSchemaVersion;
    *(_BYTE *)(v10 + 88) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 72) = self->_revision;
    *(_BYTE *)(v10 + 88) |= 2u;
  }
  v14 = objc_msgSend_copyWithZone_(self->_requiredZoneCryptoFeatures, v11, (uint64_t)a3);
  v15 = (void *)v12[8];
  v12[8] = v14;

  v17 = objc_msgSend_copyWithZone_(self->_requiredRecordCryptoFeatures, v16, (uint64_t)a3);
  v18 = (void *)v12[7];
  v12[7] = v17;

  v20 = objc_msgSend_copyWithZone_(self->_requiredFieldCryptoFeatures, v19, (uint64_t)a3);
  v21 = (void *)v12[6];
  v12[6] = v20;

  v23 = objc_msgSend_copyWithZone_(self->_permittedZoneCryptoFeatures, v22, (uint64_t)a3);
  v24 = (void *)v12[4];
  v12[4] = v23;

  v26 = objc_msgSend_copyWithZone_(self->_permittedRecordCryptoFeatures, v25, (uint64_t)a3);
  v27 = (void *)v12[3];
  v12[3] = v26;

  v29 = objc_msgSend_copyWithZone_(self->_permittedFieldCryptoFeatures, v28, (uint64_t)a3);
  v30 = (void *)v12[2];
  v12[2] = v29;

  v32 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v31, (uint64_t)a3);
  v33 = (void *)v12[10];
  v12[10] = v32;

  v35 = objc_msgSend_copyWithZone_(self->_requiredAdopterFeatures, v34, (uint64_t)a3);
  v36 = (void *)v12[5];
  v12[5] = v35;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPZoneCryptoFeatureSet *requiredZoneCryptoFeatures;
  uint64_t v9;
  CKDPRecordCryptoFeatureSet *requiredRecordCryptoFeatures;
  uint64_t v11;
  CKDPFieldCryptoFeatureSet *requiredFieldCryptoFeatures;
  uint64_t v13;
  CKDPZonePermittedCryptoFeatureSet *permittedZoneCryptoFeatures;
  uint64_t v15;
  CKDPRecordPermittedCryptoFeatureSet *permittedRecordCryptoFeatures;
  uint64_t v17;
  CKDPFieldPermittedCryptoFeatureSet *permittedFieldCryptoFeatures;
  uint64_t v19;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v21;
  CKDPAdopterFeatureSet *requiredAdopterFeatures;
  uint64_t v23;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_28;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[11] & 1) == 0 || self->_minimumSchemaVersion != *((_DWORD *)v4 + 2))
      goto LABEL_28;
  }
  else if ((v4[11] & 1) != 0)
  {
LABEL_28:
    isEqual = 0;
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[11] & 2) == 0 || self->_revision != *((_DWORD *)v4 + 18))
      goto LABEL_28;
  }
  else if ((v4[11] & 2) != 0)
  {
    goto LABEL_28;
  }
  requiredZoneCryptoFeatures = self->_requiredZoneCryptoFeatures;
  v9 = v4[8];
  if ((unint64_t)requiredZoneCryptoFeatures | v9
    && !objc_msgSend_isEqual_(requiredZoneCryptoFeatures, v7, v9))
  {
    goto LABEL_28;
  }
  requiredRecordCryptoFeatures = self->_requiredRecordCryptoFeatures;
  v11 = v4[7];
  if ((unint64_t)requiredRecordCryptoFeatures | v11)
  {
    if (!objc_msgSend_isEqual_(requiredRecordCryptoFeatures, v7, v11))
      goto LABEL_28;
  }
  requiredFieldCryptoFeatures = self->_requiredFieldCryptoFeatures;
  v13 = v4[6];
  if ((unint64_t)requiredFieldCryptoFeatures | v13)
  {
    if (!objc_msgSend_isEqual_(requiredFieldCryptoFeatures, v7, v13))
      goto LABEL_28;
  }
  permittedZoneCryptoFeatures = self->_permittedZoneCryptoFeatures;
  v15 = v4[4];
  if ((unint64_t)permittedZoneCryptoFeatures | v15)
  {
    if (!objc_msgSend_isEqual_(permittedZoneCryptoFeatures, v7, v15))
      goto LABEL_28;
  }
  permittedRecordCryptoFeatures = self->_permittedRecordCryptoFeatures;
  v17 = v4[3];
  if ((unint64_t)permittedRecordCryptoFeatures | v17)
  {
    if (!objc_msgSend_isEqual_(permittedRecordCryptoFeatures, v7, v17))
      goto LABEL_28;
  }
  permittedFieldCryptoFeatures = self->_permittedFieldCryptoFeatures;
  v19 = v4[2];
  if ((unint64_t)permittedFieldCryptoFeatures | v19)
  {
    if (!objc_msgSend_isEqual_(permittedFieldCryptoFeatures, v7, v19))
      goto LABEL_28;
  }
  zoneIdentifier = self->_zoneIdentifier;
  v21 = v4[10];
  if ((unint64_t)zoneIdentifier | v21)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v21))
      goto LABEL_28;
  }
  requiredAdopterFeatures = self->_requiredAdopterFeatures;
  v23 = v4[5];
  if ((unint64_t)requiredAdopterFeatures | v23)
    isEqual = objc_msgSend_isEqual_(requiredAdopterFeatures, v7, v23);
  else
    isEqual = 1;
LABEL_29:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
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
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_minimumSchemaVersion;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_revision;
LABEL_6:
  v6 = v5 ^ v4 ^ objc_msgSend_hash(self->_requiredZoneCryptoFeatures, a2, v2);
  v9 = objc_msgSend_hash(self->_requiredRecordCryptoFeatures, v7, v8);
  v12 = v6 ^ v9 ^ objc_msgSend_hash(self->_requiredFieldCryptoFeatures, v10, v11);
  v15 = objc_msgSend_hash(self->_permittedZoneCryptoFeatures, v13, v14);
  v18 = v15 ^ objc_msgSend_hash(self->_permittedRecordCryptoFeatures, v16, v17);
  v21 = v12 ^ v18 ^ objc_msgSend_hash(self->_permittedFieldCryptoFeatures, v19, v20);
  v24 = objc_msgSend_hash(self->_zoneIdentifier, v22, v23);
  return v21 ^ v24 ^ objc_msgSend_hash(self->_requiredAdopterFeatures, v25, v26);
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;
  char v6;
  CKDPZoneCryptoFeatureSet *requiredZoneCryptoFeatures;
  uint64_t v8;
  CKDPRecordCryptoFeatureSet *requiredRecordCryptoFeatures;
  uint64_t v10;
  CKDPFieldCryptoFeatureSet *requiredFieldCryptoFeatures;
  uint64_t v12;
  CKDPZonePermittedCryptoFeatureSet *permittedZoneCryptoFeatures;
  uint64_t v14;
  CKDPRecordPermittedCryptoFeatureSet *permittedRecordCryptoFeatures;
  uint64_t v16;
  CKDPFieldPermittedCryptoFeatureSet *permittedFieldCryptoFeatures;
  uint64_t v18;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v20;
  CKDPAdopterFeatureSet *requiredAdopterFeatures;
  uint64_t v22;
  int *v23;

  v4 = (int *)a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 88);
  if ((v6 & 1) != 0)
  {
    self->_minimumSchemaVersion = v4[2];
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 88);
  }
  if ((v6 & 2) != 0)
  {
    self->_revision = v4[18];
    *(_BYTE *)&self->_has |= 2u;
  }
  requiredZoneCryptoFeatures = self->_requiredZoneCryptoFeatures;
  v8 = *((_QWORD *)v5 + 8);
  v23 = v5;
  if (requiredZoneCryptoFeatures)
  {
    if (!v8)
      goto LABEL_11;
    objc_msgSend_mergeFrom_(requiredZoneCryptoFeatures, (const char *)v5, v8);
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    objc_msgSend_setRequiredZoneCryptoFeatures_(self, (const char *)v5, v8);
  }
  v5 = v23;
LABEL_11:
  requiredRecordCryptoFeatures = self->_requiredRecordCryptoFeatures;
  v10 = *((_QWORD *)v5 + 7);
  if (requiredRecordCryptoFeatures)
  {
    if (!v10)
      goto LABEL_17;
    objc_msgSend_mergeFrom_(requiredRecordCryptoFeatures, (const char *)v5, v10);
  }
  else
  {
    if (!v10)
      goto LABEL_17;
    objc_msgSend_setRequiredRecordCryptoFeatures_(self, (const char *)v5, v10);
  }
  v5 = v23;
LABEL_17:
  requiredFieldCryptoFeatures = self->_requiredFieldCryptoFeatures;
  v12 = *((_QWORD *)v5 + 6);
  if (requiredFieldCryptoFeatures)
  {
    if (!v12)
      goto LABEL_23;
    objc_msgSend_mergeFrom_(requiredFieldCryptoFeatures, (const char *)v5, v12);
  }
  else
  {
    if (!v12)
      goto LABEL_23;
    objc_msgSend_setRequiredFieldCryptoFeatures_(self, (const char *)v5, v12);
  }
  v5 = v23;
LABEL_23:
  permittedZoneCryptoFeatures = self->_permittedZoneCryptoFeatures;
  v14 = *((_QWORD *)v5 + 4);
  if (permittedZoneCryptoFeatures)
  {
    if (!v14)
      goto LABEL_29;
    objc_msgSend_mergeFrom_(permittedZoneCryptoFeatures, (const char *)v5, v14);
  }
  else
  {
    if (!v14)
      goto LABEL_29;
    objc_msgSend_setPermittedZoneCryptoFeatures_(self, (const char *)v5, v14);
  }
  v5 = v23;
LABEL_29:
  permittedRecordCryptoFeatures = self->_permittedRecordCryptoFeatures;
  v16 = *((_QWORD *)v5 + 3);
  if (permittedRecordCryptoFeatures)
  {
    if (!v16)
      goto LABEL_35;
    objc_msgSend_mergeFrom_(permittedRecordCryptoFeatures, (const char *)v5, v16);
  }
  else
  {
    if (!v16)
      goto LABEL_35;
    objc_msgSend_setPermittedRecordCryptoFeatures_(self, (const char *)v5, v16);
  }
  v5 = v23;
LABEL_35:
  permittedFieldCryptoFeatures = self->_permittedFieldCryptoFeatures;
  v18 = *((_QWORD *)v5 + 2);
  if (permittedFieldCryptoFeatures)
  {
    if (!v18)
      goto LABEL_41;
    objc_msgSend_mergeFrom_(permittedFieldCryptoFeatures, (const char *)v5, v18);
  }
  else
  {
    if (!v18)
      goto LABEL_41;
    objc_msgSend_setPermittedFieldCryptoFeatures_(self, (const char *)v5, v18);
  }
  v5 = v23;
LABEL_41:
  zoneIdentifier = self->_zoneIdentifier;
  v20 = *((_QWORD *)v5 + 10);
  if (zoneIdentifier)
  {
    if (!v20)
      goto LABEL_47;
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v5, v20);
  }
  else
  {
    if (!v20)
      goto LABEL_47;
    objc_msgSend_setZoneIdentifier_(self, (const char *)v5, v20);
  }
  v5 = v23;
LABEL_47:
  requiredAdopterFeatures = self->_requiredAdopterFeatures;
  v22 = *((_QWORD *)v5 + 5);
  if (requiredAdopterFeatures)
  {
    if (v22)
    {
      objc_msgSend_mergeFrom_(requiredAdopterFeatures, (const char *)v5, v22);
LABEL_52:
      v5 = v23;
    }
  }
  else if (v22)
  {
    objc_msgSend_setRequiredAdopterFeatures_(self, (const char *)v5, v22);
    goto LABEL_52;
  }

}

- (int)revision
{
  return self->_revision;
}

- (CKDPZoneCryptoFeatureSet)requiredZoneCryptoFeatures
{
  return self->_requiredZoneCryptoFeatures;
}

- (void)setRequiredZoneCryptoFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_requiredZoneCryptoFeatures, a3);
}

- (CKDPRecordCryptoFeatureSet)requiredRecordCryptoFeatures
{
  return self->_requiredRecordCryptoFeatures;
}

- (void)setRequiredRecordCryptoFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_requiredRecordCryptoFeatures, a3);
}

- (CKDPFieldCryptoFeatureSet)requiredFieldCryptoFeatures
{
  return self->_requiredFieldCryptoFeatures;
}

- (void)setRequiredFieldCryptoFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_requiredFieldCryptoFeatures, a3);
}

- (CKDPZonePermittedCryptoFeatureSet)permittedZoneCryptoFeatures
{
  return self->_permittedZoneCryptoFeatures;
}

- (void)setPermittedZoneCryptoFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_permittedZoneCryptoFeatures, a3);
}

- (CKDPRecordPermittedCryptoFeatureSet)permittedRecordCryptoFeatures
{
  return self->_permittedRecordCryptoFeatures;
}

- (void)setPermittedRecordCryptoFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_permittedRecordCryptoFeatures, a3);
}

- (CKDPFieldPermittedCryptoFeatureSet)permittedFieldCryptoFeatures
{
  return self->_permittedFieldCryptoFeatures;
}

- (void)setPermittedFieldCryptoFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_permittedFieldCryptoFeatures, a3);
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIdentifier, a3);
}

- (CKDPAdopterFeatureSet)requiredAdopterFeatures
{
  return self->_requiredAdopterFeatures;
}

- (void)setRequiredAdopterFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_requiredAdopterFeatures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_requiredZoneCryptoFeatures, 0);
  objc_storeStrong((id *)&self->_requiredRecordCryptoFeatures, 0);
  objc_storeStrong((id *)&self->_requiredFieldCryptoFeatures, 0);
  objc_storeStrong((id *)&self->_requiredAdopterFeatures, 0);
  objc_storeStrong((id *)&self->_permittedZoneCryptoFeatures, 0);
  objc_storeStrong((id *)&self->_permittedRecordCryptoFeatures, 0);
  objc_storeStrong((id *)&self->_permittedFieldCryptoFeatures, 0);
}

@end
