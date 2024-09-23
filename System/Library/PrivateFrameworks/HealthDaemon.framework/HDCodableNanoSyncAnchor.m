@implementation HDCodableNanoSyncAnchor

- (void)setAnchor:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_anchor = a3;
}

- (void)setObjectType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_objectType = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_entityIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (id)nanoSyncDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  if (-[HDCodableNanoSyncAnchor hasEntityIdentifier](self, "hasEntityIdentifier"))
  {
    -[HDCodableNanoSyncAnchor entityIdentifier](self, "entityIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "identifier");

    -[HDCodableNanoSyncAnchor entityIdentifier](self, "entityIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "schema");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 || (v14 = (objc_class *)HDBuiltinSyncEntityClassForType(v4)) == 0)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[HDCodableNanoSyncAnchor entityIdentifier](self, "entityIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "schema");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("HDSyncEntityType");
      if (v9)
        v11 = (const __CFString *)v9;
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@(%ld) %lld"), v11, v4, self->_anchor);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "hasPrefix:", CFSTR("HD")))
      {
        objc_msgSend(v15, "substringFromIndex:", objc_msgSend(CFSTR("HD"), "length"));
        v16 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v16;
      }
      if (objc_msgSend(v15, "hasSuffix:", CFSTR("SyncEntity")))
      {
        objc_msgSend(v15, "substringToIndex:", objc_msgSend(v15, "length") - objc_msgSend(CFSTR("SyncEntity"), "length"));
        v17 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v17;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%ld) %lld"), v15, v4, self->_anchor);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %lld"), CFSTR("(null)"), self->_anchor);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_objectType;
    *(_BYTE *)(v5 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_anchor;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v8 = -[HDCodableEntityIdentifier copyWithZone:](self->_entityIdentifier, "copyWithZone:", a3);
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (int64_t)anchor
{
  return self->_anchor;
}

- (int)objectType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_objectType;
  else
    return 1;
}

- (BOOL)hasAnchor
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasObjectType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasObjectType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)objectTypeAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((a3 - 1) < 0x32 && ((0x3EF9FF2FFFFFFuLL >> v3) & 1) != 0)
  {
    v4 = off_1E6CECA70[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsObjectType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CategorySamples")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QuantitySamples")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Workouts")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ActivityCaches")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LegacyAchievements")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserCharacteristics")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Deprecated7")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ObjectAssociations")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnitPreferences")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Sources")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Authorizations")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Devices")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Correlations")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DataTypeSourceOrder")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MedicalID")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NanoUserDefaults")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProtectedNanoUserDefaults")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LocationSeriesSamples")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DeletedSamples")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LegacyAchievementKeyValue")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ActivityAchievementsKeyValue")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BinarySamples")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDADocumentSamples")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FHIRResources")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ClinicalGateways")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MedicationOrders")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MedicationDispenseRecords")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MedicationRecords")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DiagnosticTestResults")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DiagnosticTestReports")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VaccinationRecords")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConditionRecords")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AllergyRecords")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProcedureRecords")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ClinicalAccounts")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserDefaults")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ClinicalDeletedAccounts")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AccountOwners")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownRecords")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OnboardingCompletions")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ECGSamples")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SleepSchedules")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QuantityDerivedCategorySamples")) & 1) != 0)
  {
    v4 = 49;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TypedObjectAssociations")))
  {
    v4 = 50;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setHasAnchor:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEntityIdentifier
{
  return self->_entityIdentifier != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableNanoSyncAnchor;
  -[HDCodableNanoSyncAnchor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNanoSyncAnchor dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  __CFString *v6;
  void *v7;
  HDCodableEntityIdentifier *entityIdentifier;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = self->_objectType - 1;
    if (v5 < 0x32 && ((0x3EF9FF2FFFFFFuLL >> v5) & 1) != 0)
    {
      v6 = off_1E6CECA70[v5];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_objectType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("objectType"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_anchor);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("anchor"));

  }
  entityIdentifier = self->_entityIdentifier;
  if (entityIdentifier)
  {
    -[HDCodableEntityIdentifier dictionaryRepresentation](entityIdentifier, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("entityIdentifier"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNanoSyncAnchorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[6] = self->_objectType;
    *((_BYTE *)v4 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_anchor;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  if (self->_entityIdentifier)
  {
    v6 = v4;
    objc_msgSend(v4, "setEntityIdentifier:");
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableEntityIdentifier *entityIdentifier;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_objectType != *((_DWORD *)v4 + 6))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_anchor != *((_QWORD *)v4 + 1))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_14;
  }
  entityIdentifier = self->_entityIdentifier;
  if ((unint64_t)entityIdentifier | *((_QWORD *)v4 + 2))
    v6 = -[HDCodableEntityIdentifier isEqual:](entityIdentifier, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_objectType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[HDCodableEntityIdentifier hash](self->_entityIdentifier, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_anchor;
  return v3 ^ v2 ^ -[HDCodableEntityIdentifier hash](self->_entityIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  HDCodableEntityIdentifier *entityIdentifier;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 28);
  if ((v6 & 2) != 0)
  {
    self->_objectType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 28);
  }
  if ((v6 & 1) != 0)
  {
    self->_anchor = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  entityIdentifier = self->_entityIdentifier;
  v8 = v5[2];
  if (entityIdentifier)
  {
    if (v8)
    {
      v9 = v5;
      -[HDCodableEntityIdentifier mergeFrom:](entityIdentifier, "mergeFrom:");
LABEL_10:
      v5 = v9;
    }
  }
  else if (v8)
  {
    v9 = v5;
    -[HDCodableNanoSyncAnchor setEntityIdentifier:](self, "setEntityIdentifier:");
    goto LABEL_10;
  }

}

- (HDCodableEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_entityIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end
