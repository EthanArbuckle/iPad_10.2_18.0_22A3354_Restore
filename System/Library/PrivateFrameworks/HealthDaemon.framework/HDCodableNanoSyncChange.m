@implementation HDCodableNanoSyncChange

- (void)setObjectType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_objectType = a3;
}

- (void)setObjects:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 requiredAnchorMap:(id)a5
{
  int64_t end;
  int64_t start;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  end = a4.end;
  start = a4.start;
  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  -[HDCodableNanoSyncChange clearObjectDatas](self, "clearObjectDatas");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1BCCACAC4]();
        objc_msgSend(v16, "data");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          -[HDCodableNanoSyncChange addObjectData:](self, "addObjectData:", v18);

        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  -[HDCodableNanoSyncChange setStartAnchor:](self, "setStartAnchor:", start);
  -[HDCodableNanoSyncChange setEndAnchor:](self, "setEndAnchor:", end);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__HDCodableNanoSyncChange_NanoSyncSupport__setObjects_syncAnchorRange_requiredAnchorMap___block_invoke;
  v19[3] = &unk_1E6CEB578;
  v19[4] = self;
  objc_msgSend(v10, "enumerateAnchorsAndEntityIdentifiersWithBlock:", v19);

}

- (void)clearObjectDatas
{
  -[NSMutableArray removeAllObjects](self->_objectDatas, "removeAllObjects");
}

- (void)addObjectData:(id)a3
{
  id v4;
  NSMutableArray *objectDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  objectDatas = self->_objectDatas;
  v8 = v4;
  if (!objectDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_objectDatas;
    self->_objectDatas = v6;

    v4 = v8;
    objectDatas = self->_objectDatas;
  }
  -[NSMutableArray addObject:](objectDatas, "addObject:", v4);

}

- (void)setStartAnchor:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_startAnchor = a3;
}

- (void)setEndAnchor:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endAnchor = a3;
}

- (void)setSequenceNumber:(int64_t)a3 done:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[HDCodableNanoSyncChange setSequence:](self, "setSequence:", a3);
  -[HDCodableNanoSyncChange setComplete:](self, "setComplete:", v4);
}

- (void)setSequence:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sequence = a3;
}

- (void)setComplete:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_complete = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    PBDataWriterWriteInt64Field();
LABEL_5:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_objectDatas;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteDataField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_requiredAnchors;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  v16 = (char)self->_has;
  if ((v16 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v16 = (char)self->_has;
    if ((v16 & 2) == 0)
    {
LABEL_21:
      if ((v16 & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_22:
    PBDataWriterWriteBOOLField();
LABEL_23:
  if (self->_entityIdentifier)
    PBDataWriterWriteSubmessage();
  if (self->_version)
    PBDataWriterWriteSubmessage();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_requiredAnchors, 0);
  objc_storeStrong((id *)&self->_objectDatas, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (id)nanoSyncDescription
{
  HDSyncEntityIdentifier *v3;
  void *v4;
  HDSyncEntityIdentifier *v5;
  __CFString *v6;
  void *v7;

  v3 = [HDSyncEntityIdentifier alloc];
  -[HDCodableNanoSyncChange entityIdentifier](self, "entityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDSyncEntityIdentifier initWithCodableEntityIdentifier:](v3, "initWithCodableEntityIdentifier:", v4);

  if (self->_speculative)
  {
    v6 = CFSTR("spec");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld -> %lld"), self->_startAnchor, self->_endAnchor);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __89__HDCodableNanoSyncChange_NanoSyncSupport__setObjects_syncAnchorRange_requiredAnchorMap___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  HDCodableNanoSyncAnchor *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = objc_alloc_init(HDCodableNanoSyncAnchor);
  -[HDCodableNanoSyncAnchor setAnchor:](v5, "setAnchor:", a3);
  objc_msgSend(v10, "codableEntityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNanoSyncAnchor setEntityIdentifier:](v5, "setEntityIdentifier:", v6);

  objc_msgSend(v10, "schemaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = HDBuiltinSyncEntityClassForType(objc_msgSend(v10, "entityIdentifier"));
    if (v8)
    {
      v9 = v8;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[HDCodableNanoSyncAnchor setObjectType:](v5, "setObjectType:", objc_msgSend(v9, "nanoSyncObjectType"));
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addRequiredAnchors:", v5);

}

- (void)addRequiredAnchors:(id)a3
{
  id v4;
  NSMutableArray *requiredAnchors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  requiredAnchors = self->_requiredAnchors;
  v8 = v4;
  if (!requiredAnchors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_requiredAnchors;
    self->_requiredAnchors = v6;

    v4 = v8;
    requiredAnchors = self->_requiredAnchors;
  }
  -[NSMutableArray addObject:](requiredAnchors, "addObject:", v4);

}

- (HDSyncAnchorRange)syncAnchorRange
{
  int64_t v2;
  int64_t v3;
  HDSyncAnchorRange result;

  if ((~*(_BYTE *)&self->_has & 5) != 0)
    v2 = HDSyncAnchorRangeMake(-1, -1);
  else
    v2 = HDSyncAnchorRangeMake(self->_startAnchor, self->_endAnchor);
  result.end = v3;
  result.start = v2;
  return result;
}

- (NSNumber)sequenceNumber
{
  void *v3;

  if (-[HDCodableNanoSyncChange hasSequence](self, "hasSequence"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDCodableNanoSyncChange sequence](self, "sequence"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (BOOL)hasSequence
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int64_t)sequence
{
  return self->_sequence;
}

- (BOOL)isSpeculative
{
  return self->_speculative;
}

- (BOOL)done
{
  return !-[HDCodableNanoSyncChange hasComplete](self, "hasComplete")
      || -[HDCodableNanoSyncChange complete](self, "complete");
}

- (BOOL)hasComplete
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)complete
{
  return self->_complete;
}

- (int)objectType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_objectType;
  else
    return 1;
}

- (void)setHasObjectType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasObjectType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)objectTypeAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((a3 - 1) < 0x32 && ((0x3EF9FF2FFFFFFuLL >> v3) & 1) != 0)
  {
    v4 = off_1E6CF3A98[v3];
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

- (void)setHasStartAnchor:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartAnchor
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasEndAnchor:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndAnchor
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)objectDatasCount
{
  return -[NSMutableArray count](self->_objectDatas, "count");
}

- (id)objectDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_objectDatas, "objectAtIndex:", a3);
}

+ (Class)objectDataType
{
  return (Class)objc_opt_class();
}

- (void)clearRequiredAnchors
{
  -[NSMutableArray removeAllObjects](self->_requiredAnchors, "removeAllObjects");
}

- (unint64_t)requiredAnchorsCount
{
  return -[NSMutableArray count](self->_requiredAnchors, "count");
}

- (id)requiredAnchorsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_requiredAnchors, "objectAtIndex:", a3);
}

+ (Class)requiredAnchorsType
{
  return (Class)objc_opt_class();
}

- (void)setSpeculative:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_speculative = a3;
}

- (void)setHasSpeculative:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSpeculative
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasSequence:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setHasComplete:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEntityIdentifier
{
  return self->_entityIdentifier != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
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
  v8.super_class = (Class)HDCodableNanoSyncChange;
  -[HDCodableNanoSyncChange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNanoSyncChange dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v8;
  NSMutableArray *objectDatas;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  void *v18;
  HDCodableEntityIdentifier *entityIdentifier;
  void *v20;
  HDCodableSyncVersionRange *version;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = self->_objectType - 1;
    if (v5 < 0x32 && ((0x3EF9FF2FFFFFFuLL >> v5) & 1) != 0)
    {
      v6 = off_1E6CF3A98[v5];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_objectType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("objectType"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_startAnchor);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("startAnchor"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_endAnchor);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("endAnchor"));

  }
  objectDatas = self->_objectDatas;
  if (objectDatas)
    objc_msgSend(v3, "setObject:forKey:", objectDatas, CFSTR("objectData"));
  if (-[NSMutableArray count](self->_requiredAnchors, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_requiredAnchors, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = self->_requiredAnchors;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("requiredAnchors"));
  }
  v17 = (char)self->_has;
  if ((v17 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_speculative);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("speculative"));

    v17 = (char)self->_has;
    if ((v17 & 2) == 0)
    {
LABEL_24:
      if ((v17 & 0x10) == 0)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sequence);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("sequence"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_complete);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("complete"));

  }
LABEL_26:
  entityIdentifier = self->_entityIdentifier;
  if (entityIdentifier)
  {
    -[HDCodableEntityIdentifier dictionaryRepresentation](entityIdentifier, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("entityIdentifier"));

  }
  version = self->_version;
  if (version)
  {
    -[HDCodableSyncVersionRange dictionaryRepresentation](version, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("version"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNanoSyncChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_23:
    v4[3] = self->_startAnchor;
    *((_BYTE *)v4 + 76) |= 4u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 12) = self->_objectType;
  *((_BYTE *)v4 + 76) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_23;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    v4[1] = self->_endAnchor;
    *((_BYTE *)v4 + 76) |= 1u;
  }
LABEL_5:
  v16 = v4;
  if (-[HDCodableNanoSyncChange objectDatasCount](self, "objectDatasCount"))
  {
    objc_msgSend(v16, "clearObjectDatas");
    v6 = -[HDCodableNanoSyncChange objectDatasCount](self, "objectDatasCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[HDCodableNanoSyncChange objectDataAtIndex:](self, "objectDataAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObjectData:", v9);

      }
    }
  }
  if (-[HDCodableNanoSyncChange requiredAnchorsCount](self, "requiredAnchorsCount"))
  {
    objc_msgSend(v16, "clearRequiredAnchors");
    v10 = -[HDCodableNanoSyncChange requiredAnchorsCount](self, "requiredAnchorsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[HDCodableNanoSyncChange requiredAnchorsAtIndex:](self, "requiredAnchorsAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addRequiredAnchors:", v13);

      }
    }
  }
  v14 = (char)self->_has;
  v15 = v16;
  if ((v14 & 0x20) != 0)
  {
    *((_BYTE *)v16 + 73) = self->_speculative;
    *((_BYTE *)v16 + 76) |= 0x20u;
    v14 = (char)self->_has;
    if ((v14 & 2) == 0)
    {
LABEL_15:
      if ((v14 & 0x10) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  *((_QWORD *)v16 + 2) = self->_sequence;
  *((_BYTE *)v16 + 76) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    *((_BYTE *)v16 + 72) = self->_complete;
    *((_BYTE *)v16 + 76) |= 0x10u;
  }
LABEL_17:
  if (self->_entityIdentifier)
  {
    objc_msgSend(v16, "setEntityIdentifier:");
    v15 = v16;
  }
  if (self->_version)
  {
    objc_msgSend(v16, "setVersion:");
    v15 = v16;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  char v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_objectType;
    *(_BYTE *)(v5 + 76) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 24) = self->_startAnchor;
  *(_BYTE *)(v5 + 76) |= 4u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 8) = self->_endAnchor;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
LABEL_5:
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = self->_objectDatas;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addObjectData:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = self->_requiredAnchors;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend((id)v6, "addRequiredAnchors:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v16);
  }

  v20 = (char)self->_has;
  if ((v20 & 0x20) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_21;
LABEL_28:
    *(_QWORD *)(v6 + 16) = self->_sequence;
    *(_BYTE *)(v6 + 76) |= 2u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  *(_BYTE *)(v6 + 73) = self->_speculative;
  *(_BYTE *)(v6 + 76) |= 0x20u;
  v20 = (char)self->_has;
  if ((v20 & 2) != 0)
    goto LABEL_28;
LABEL_21:
  if ((v20 & 0x10) != 0)
  {
LABEL_22:
    *(_BYTE *)(v6 + 72) = self->_complete;
    *(_BYTE *)(v6 + 76) |= 0x10u;
  }
LABEL_23:
  v21 = -[HDCodableEntityIdentifier copyWithZone:](self->_entityIdentifier, "copyWithZone:", a3, (_QWORD)v26);
  v22 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v21;

  v23 = -[HDCodableSyncVersionRange copyWithZone:](self->_version, "copyWithZone:", a3);
  v24 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v23;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *objectDatas;
  NSMutableArray *requiredAnchors;
  HDCodableEntityIdentifier *entityIdentifier;
  HDCodableSyncVersionRange *version;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 8) == 0 || self->_objectType != *((_DWORD *)v4 + 12))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0 || self->_startAnchor != *((_QWORD *)v4 + 3))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_endAnchor != *((_QWORD *)v4 + 1))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_46;
  }
  objectDatas = self->_objectDatas;
  if ((unint64_t)objectDatas | *((_QWORD *)v4 + 5)
    && !-[NSMutableArray isEqual:](objectDatas, "isEqual:"))
  {
    goto LABEL_46;
  }
  requiredAnchors = self->_requiredAnchors;
  if ((unint64_t)requiredAnchors | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](requiredAnchors, "isEqual:"))
      goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x20) == 0)
      goto LABEL_46;
    if (self->_speculative)
    {
      if (!*((_BYTE *)v4 + 73))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 73))
    {
      goto LABEL_46;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_sequence != *((_QWORD *)v4 + 2))
      goto LABEL_46;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
    {
      if (self->_complete)
      {
        if (!*((_BYTE *)v4 + 72))
          goto LABEL_46;
        goto LABEL_42;
      }
      if (!*((_BYTE *)v4 + 72))
        goto LABEL_42;
    }
LABEL_46:
    v9 = 0;
    goto LABEL_47;
  }
  if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
    goto LABEL_46;
LABEL_42:
  entityIdentifier = self->_entityIdentifier;
  if ((unint64_t)entityIdentifier | *((_QWORD *)v4 + 4)
    && !-[HDCodableEntityIdentifier isEqual:](entityIdentifier, "isEqual:"))
  {
    goto LABEL_46;
  }
  version = self->_version;
  if ((unint64_t)version | *((_QWORD *)v4 + 8))
    v9 = -[HDCodableSyncVersionRange isEqual:](version, "isEqual:");
  else
    v9 = 1;
LABEL_47:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_objectType;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_startAnchor;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_endAnchor;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[NSMutableArray hash](self->_objectDatas, "hash");
  v7 = -[NSMutableArray hash](self->_requiredAnchors, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_10;
LABEL_13:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_11;
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  v8 = 2654435761 * self->_speculative;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_13;
LABEL_10:
  v9 = 2654435761 * self->_sequence;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_14;
LABEL_11:
  v10 = 2654435761 * self->_complete;
LABEL_15:
  v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  v12 = v9 ^ v10 ^ -[HDCodableEntityIdentifier hash](self->_entityIdentifier, "hash");
  return v11 ^ v12 ^ -[HDCodableSyncVersionRange hash](self->_version, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  char v17;
  HDCodableEntityIdentifier *entityIdentifier;
  uint64_t v19;
  HDCodableSyncVersionRange *version;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 76);
  if ((v6 & 8) != 0)
  {
    self->_objectType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)v4 + 76);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_startAnchor = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
LABEL_4:
    self->_endAnchor = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = *((id *)v4 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        -[HDCodableNanoSyncChange addObjectData:](self, "addObjectData:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v9);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = *((id *)v5 + 7);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        -[HDCodableNanoSyncChange addRequiredAnchors:](self, "addRequiredAnchors:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), (_QWORD)v22);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v14);
  }

  v17 = *((_BYTE *)v5 + 76);
  if ((v17 & 0x20) != 0)
  {
    self->_speculative = *((_BYTE *)v5 + 73);
    *(_BYTE *)&self->_has |= 0x20u;
    v17 = *((_BYTE *)v5 + 76);
    if ((v17 & 2) == 0)
    {
LABEL_21:
      if ((v17 & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)v5 + 76) & 2) == 0)
  {
    goto LABEL_21;
  }
  self->_sequence = *((_QWORD *)v5 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v5 + 76) & 0x10) != 0)
  {
LABEL_22:
    self->_complete = *((_BYTE *)v5 + 72);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_23:
  entityIdentifier = self->_entityIdentifier;
  v19 = *((_QWORD *)v5 + 4);
  if (entityIdentifier)
  {
    if (v19)
      -[HDCodableEntityIdentifier mergeFrom:](entityIdentifier, "mergeFrom:");
  }
  else if (v19)
  {
    -[HDCodableNanoSyncChange setEntityIdentifier:](self, "setEntityIdentifier:");
  }
  version = self->_version;
  v21 = *((_QWORD *)v5 + 8);
  if (version)
  {
    if (v21)
      -[HDCodableSyncVersionRange mergeFrom:](version, "mergeFrom:");
  }
  else if (v21)
  {
    -[HDCodableNanoSyncChange setVersion:](self, "setVersion:");
  }

}

- (int64_t)startAnchor
{
  return self->_startAnchor;
}

- (int64_t)endAnchor
{
  return self->_endAnchor;
}

- (NSMutableArray)objectDatas
{
  return self->_objectDatas;
}

- (void)setObjectDatas:(id)a3
{
  objc_storeStrong((id *)&self->_objectDatas, a3);
}

- (NSMutableArray)requiredAnchors
{
  return self->_requiredAnchors;
}

- (void)setRequiredAnchors:(id)a3
{
  objc_storeStrong((id *)&self->_requiredAnchors, a3);
}

- (BOOL)speculative
{
  return self->_speculative;
}

- (HDCodableEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_entityIdentifier, a3);
}

- (HDCodableSyncVersionRange)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- ($2825F4736939C4A6D3AD43837233062D)versionRange
{
  void *v2;
  $2825F4736939C4A6D3AD43837233062D v3;

  -[HDCodableNanoSyncChange version](self, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ($2825F4736939C4A6D3AD43837233062D)objc_msgSend(v2, "syncVersionRange");

  return v3;
}

+ (id)changeWithNanoSyncEntityClass:(Class)a3 version:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = objc_alloc_init((Class)a1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setObjectType:", -[objc_class nanoSyncObjectType](a3, "nanoSyncObjectType"));
  -[objc_class syncEntityIdentifier](a3, "syncEntityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "codableEntityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntityIdentifier:", v8);

  +[HDCodableSyncVersionRange versionRangeWithSyncVersionRange:](HDCodableSyncVersionRange, "versionRangeWithSyncVersionRange:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVersion:", v9);

  return v6;
}

- (id)syncEntityIdentifier
{
  HDSyncEntityIdentifier *v2;

  if (self->_entityIdentifier)
  {
    v2 = -[HDSyncEntityIdentifier initWithCodableEntityIdentifier:]([HDSyncEntityIdentifier alloc], "initWithCodableEntityIdentifier:", self->_entityIdentifier);
  }
  else if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(HDNanoSyncEntityClassForObjectType(self->_objectType), "syncEntityIdentifier");
    v2 = (HDSyncEntityIdentifier *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (Class)syncEntityClassForProfile:(id)a3
{
  id v4;
  HDSyncEntityIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (self->_entityIdentifier)
  {
    v5 = -[HDSyncEntityIdentifier initWithCodableEntityIdentifier:]([HDSyncEntityIdentifier alloc], "initWithCodableEntityIdentifier:", self->_entityIdentifier);
    objc_msgSend(v4, "syncEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allSyncEntitiesByIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    HDNanoSyncEntityClassForObjectType(self->_objectType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return (Class)v8;
}

- (id)speculativeCopy
{
  HDCodableNanoSyncChange *v3;

  v3 = objc_alloc_init(HDCodableNanoSyncChange);
  -[HDCodableNanoSyncChange copyTo:](self, "copyTo:", v3);
  -[HDCodableNanoSyncChange setSpeculative:](v3, "setSpeculative:", 1);
  -[HDCodableNanoSyncChange clearRequiredAnchors](v3, "clearRequiredAnchors");
  -[HDCodableNanoSyncChange setHasStartAnchor:](v3, "setHasStartAnchor:", 0);
  -[HDCodableNanoSyncChange setHasEndAnchor:](v3, "setHasEndAnchor:", 0);
  return v3;
}

- (void)setVersionRange:(id)a3
{
  uint64_t var1;
  void *v6;
  id v7;

  var1 = a3.var1;
  -[HDCodableNanoSyncChange version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMinimum:", a3);

  -[HDCodableNanoSyncChange version](self, "version");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrent:", var1);

}

- (id)requiredAnchorMapWithProfile:(id)a3 error:(id *)a4
{
  HDSyncAnchorMap *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  HDSyncEntityIdentifier *v13;
  HDSyncEntityIdentifier *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id *v20;
  NSMutableArray *obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v6 = objc_alloc_init(HDSyncAnchorMap);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_requiredAnchors;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v20 = a4;
    v9 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "anchor");
        objc_msgSend(v11, "entityIdentifier");
        v13 = (HDSyncEntityIdentifier *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          goto LABEL_8;
        v14 = [HDSyncEntityIdentifier alloc];
        objc_msgSend(v11, "entityIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[HDSyncEntityIdentifier initWithCodableEntityIdentifier:](v14, "initWithCodableEntityIdentifier:", v15);

        objc_msgSend(v22, "syncEngine");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "allSyncEntitiesByIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend(v17, "objectForKeyedSubscript:", v13);

        if (!v18)
LABEL_8:
          v18 = HDNanoSyncEntityClassForObjectType(objc_msgSend(v11, "objectType"));
        if (!objc_msgSend(v11, "hasAnchor") || v12 < 0 || !v18)
        {

          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", v20, 3, CFSTR("invalid required anchor %@"), v11);
          v6 = 0;
          goto LABEL_16;
        }
        -[HDSyncAnchorMap setAnchor:forSyncEntity:](v6, "setAnchor:forSyncEntity:", objc_msgSend(v11, "anchor"), v18);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_16:

  return v6;
}

- (id)decodedObjectsForProfile:(id)a3 error:(id *)a4
{
  objc_class *v6;
  objc_class *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = -[HDCodableNanoSyncChange syncEntityClassForProfile:](self, "syncEntityClassForProfile:", a3);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("No sync entity found for %@"), self);
    goto LABEL_14;
  }
  v7 = v6;
  if (!-[NSMutableArray count](self->_objectDatas, "count"))
  {
LABEL_14:
    v8 = 0;
    return v8;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_objectDatas;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[objc_class decodeSyncObjectWithData:](v7, "decodeSyncObjectWithData:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

@end
