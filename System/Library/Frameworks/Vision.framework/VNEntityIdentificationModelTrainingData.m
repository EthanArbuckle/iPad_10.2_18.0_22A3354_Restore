@implementation VNEntityIdentificationModelTrainingData

- (VNEntityIdentificationModelTrainingData)initWithModelConfiguration:(id)a3
{
  id v4;
  VNEntityIdentificationModelTrainingData *v5;
  void *v6;
  uint64_t v7;
  VNRequestSpecifier *entityPrintOriginatingRequestSpecifier;
  NSMutableArray *v9;
  NSMutableArray *entityUniqueIdentifiers;
  NSMutableDictionary *v11;
  NSMutableDictionary *serialNumberForEntityUniqueIdentifier;
  NSMutableDictionary *v13;
  NSMutableDictionary *observationsForSerialNumber;
  uint64_t v15;
  NSMutableIndexSet *availableSerialNumbers;
  NSDate *v17;
  NSDate *lastModificationDate;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VNEntityIdentificationModelTrainingData;
  v5 = -[VNEntityIdentificationModelTrainingData init](&v20, sel_init);
  if (v5)
  {
    v5->_maximumEntities = objc_msgSend(v4, "maximumEntities");
    objc_msgSend(v4, "entityPrintOriginatingRequestSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    entityPrintOriginatingRequestSpecifier = v5->_entityPrintOriginatingRequestSpecifier;
    v5->_entityPrintOriginatingRequestSpecifier = (VNRequestSpecifier *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    entityUniqueIdentifiers = v5->_entityUniqueIdentifiers;
    v5->_entityUniqueIdentifiers = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    serialNumberForEntityUniqueIdentifier = v5->_serialNumberForEntityUniqueIdentifier;
    v5->_serialNumberForEntityUniqueIdentifier = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observationsForSerialNumber = v5->_observationsForSerialNumber;
    v5->_observationsForSerialNumber = v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 1, v5->_maximumEntities);
    availableSerialNumbers = v5->_availableSerialNumbers;
    v5->_availableSerialNumbers = (NSMutableIndexSet *)v15;

    v17 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    lastModificationDate = v5->_lastModificationDate;
    v5->_lastModificationDate = v17;

  }
  return v5;
}

- (unint64_t)entityCount
{
  return -[NSMutableArray count](self->_entityUniqueIdentifiers, "count");
}

- (id)uniqueIdentifierOfEntityAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_entityUniqueIdentifiers, "objectAtIndex:", a3);
}

- (unint64_t)indexOfEntityWithUniqueIdentifier:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->_entityUniqueIdentifiers, "indexOfObject:", a3);
}

- (unint64_t)observationCountForEntityAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[NSMutableArray objectAtIndex:](self->_entityUniqueIdentifiers, "objectAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_serialNumberForEntityUniqueIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_observationsForSerialNumber, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)observationAtIndex:(unint64_t)a3 forEntityAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSMutableArray objectAtIndex:](self->_entityUniqueIdentifiers, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_serialNumberForEntityUniqueIdentifier, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_observationsForSerialNumber, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)addObservations:(id)a3 toEntityWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a4;
  v9 = a3;
  -[VNEntityIdentificationModelTrainingData entityPrintOriginatingRequestSpecifier](self, "entityPrintOriginatingRequestSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNEntityIdentificationModelTrainingData _uniqueObservationsForObservations:forEntityWithUniqueIdentifier:inRegisteredState:compatibleWithOriginatingRequestSpecifier:error:]((id *)&self->super.isa, v9, v8, 0, v10, (uint64_t)a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    LOBYTE(self) = 0;
    goto LABEL_11;
  }
  v12 = v11;
  v13 = v8;
  if (self)
  {
    v14 = objc_msgSend(v12, "count");
    if (!v14)
    {
LABEL_8:
      LOBYTE(self) = 1;
      goto LABEL_9;
    }
    v15 = v14;
    -[VNEntityIdentificationModelTrainingData _serialNumberForEntityWithUniqueIdentifier:error:]((id *)&self->super.isa, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
LABEL_5:
      -[NSMutableDictionary objectForKeyedSubscript:](self->_observationsForSerialNumber, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observationsForSerialNumber, "setObject:forKeyedSubscript:", v17, v16);
      }
      objc_msgSend(v17, "addObjectsFromArray:", v12);
      -[VNEntityIdentificationModelTrainingData _handleDataModification](self);

      goto LABEL_8;
    }
    if (-[NSMutableDictionary count](self->_serialNumberForEntityUniqueIdentifier, "count") >= self->_maximumEntities)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The model has reached the maximum entity limit of %lu"), self->_maximumEntities);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(9, v20, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v19 = -[NSMutableIndexSet firstIndex](self->_availableSerialNumbers, "firstIndex");
      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a5)
        {
          VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(9, CFSTR("entity serial numbers have been exhausted"), 0);
          LOBYTE(self) = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        }
      }
      else
      {
        v21 = v19;
        -[NSMutableIndexSet removeIndex:](self->_availableSerialNumbers, "removeIndex:", v19);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v16 = (void *)v22;
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_serialNumberForEntityUniqueIdentifier, "setObject:forKeyedSubscript:", v22, v13);
          -[NSMutableArray addObject:](self->_entityUniqueIdentifiers, "addObject:", v13);
          goto LABEL_5;
        }
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_9:

LABEL_11:
  return (char)self;
}

- (BOOL)removeObservations:(id)a3 fromEntityWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v8 = a3;
  v9 = a4;
  -[VNEntityIdentificationModelTrainingData _serialNumberForEntityWithUniqueIdentifier:error:]((id *)&self->super.isa, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[VNEntityIdentificationModelTrainingData entityPrintOriginatingRequestSpecifier](self, "entityPrintOriginatingRequestSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNEntityIdentificationModelTrainingData _uniqueObservationsForObservations:forEntityWithUniqueIdentifier:inRegisteredState:compatibleWithOriginatingRequestSpecifier:error:]((id *)&self->super.isa, v8, v9, 1, v11, (uint64_t)a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12 != 0;
    if (v12)
    {
      v14 = v12;
      v15 = v10;
      if (self && objc_msgSend(v14, "count"))
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_observationsForSerialNumber, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = objc_msgSend(v16, "count");
          objc_msgSend(v17, "removeObjectsInArray:", v14);
          if (objc_msgSend(v17, "count") != v18)
            -[VNEntityIdentificationModelTrainingData _handleDataModification](self);
        }

      }
    }

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)removeAllObservationsFromEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[VNEntityIdentificationModelTrainingData _serialNumberForEntityWithUniqueIdentifier:error:]((id *)&self->super.isa, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && self)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_observationsForSerialNumber, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "count"))
    {
      objc_msgSend(v7, "removeAllObjects");
      -[VNEntityIdentificationModelTrainingData _handleDataModification](self);
    }

  }
  return 1;
}

- (BOOL)removeEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  -[VNEntityIdentificationModelTrainingData _serialNumberForEntityWithUniqueIdentifier:error:]((id *)&self->super.isa, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_observationsForSerialNumber, "removeObjectForKey:", v6);
    -[NSMutableDictionary removeObjectForKey:](self->_serialNumberForEntityUniqueIdentifier, "removeObjectForKey:", v5);
    -[NSMutableArray removeObject:](self->_entityUniqueIdentifiers, "removeObject:", v5);
    -[NSMutableIndexSet addIndex:](self->_availableSerialNumbers, "addIndex:", objc_msgSend(v6, "unsignedIntegerValue"));
    -[VNEntityIdentificationModelTrainingData _handleDataModification](self);
  }

  return 1;
}

- (BOOL)validateWithCanceller:(id)a3 error:(id *)a4
{
  uint64_t v6;
  BOOL result;
  id v8;

  v6 = -[NSMutableArray count](self->_entityUniqueIdentifiers, "count", a3);
  if (v6 == -[NSMutableDictionary count](self->_serialNumberForEntityUniqueIdentifier, "count")
    && v6 == -[NSMutableDictionary count](self->_observationsForSerialNumber, "count"))
  {
    return 1;
  }
  if (!a4)
    return 0;
  VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, CFSTR("entity and observation data counts are out-of-sync"), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a4 = v8;
  return result;
}

- (id)entityIdentificationModel:(id)a3 uniqueIdentifierOfEntityAtIndex:(unint64_t)a4
{
  return -[VNEntityIdentificationModelTrainingData uniqueIdentifierOfEntityAtIndex:](self, "uniqueIdentifierOfEntityAtIndex:", a4);
}

- (unint64_t)entityIdentificationModel:(id)a3 indexOfEntityWithUniqueIdentifier:(id)a4
{
  return -[VNEntityIdentificationModelTrainingData indexOfEntityWithUniqueIdentifier:](self, "indexOfEntityWithUniqueIdentifier:", a4);
}

- (unint64_t)entityIdentificationModel:(id)a3 numberOfObservationsForEntityAtIndex:(unint64_t)a4
{
  return -[VNEntityIdentificationModelTrainingData observationCountForEntityAtIndex:](self, "observationCountForEntityAtIndex:", a4);
}

- (id)entityIdentificationModel:(id)a3 observationAtIndex:(unint64_t)a4 forEntityAtIndex:(unint64_t)a5
{
  return -[VNEntityIdentificationModelTrainingData observationAtIndex:forEntityAtIndex:](self, "observationAtIndex:forEntityAtIndex:", a4, a5);
}

- (unint64_t)lastDataChangeSequenceNumberForEntityIdentificationModel:(id)a3
{
  return self->_lastDataChangeSequenceNumber;
}

- (id)lastModificationDateForEntityIdentificationModel:(id)a3
{
  return self->_lastModificationDate;
}

- (VNRequestSpecifier)entityPrintOriginatingRequestSpecifier
{
  return (VNRequestSpecifier *)objc_getProperty(self, a2, 24, 1);
}

- (VNEntityIdentificationModelTrainingDataDelegate)delegate
{
  return (VNEntityIdentificationModelTrainingDataDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)lastModificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_availableSerialNumbers, 0);
  objc_storeStrong((id *)&self->_observationsForSerialNumber, 0);
  objc_storeStrong((id *)&self->_serialNumberForEntityUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_entityUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_entityPrintOriginatingRequestSpecifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)_serialNumberForEntityWithUniqueIdentifier:(id *)a1 error:(void *)a2
{
  id v3;
  id *v4;
  id *v5;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v3);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    a1 = v4;
    if (v4)
      v5 = v4;

  }
  return a1;
}

- (void)_handleDataModification
{
  id v2;
  void *v3;
  id v4;

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v3 = (void *)a1[8];
    a1[8] = v2;

    ++a1[9];
    objc_msgSend(a1, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityIdentificationModelTrainingDataWasModified:", a1);

  }
}

- (id)_uniqueObservationsForObservations:(void *)a3 forEntityWithUniqueIdentifier:(int)a4 inRegisteredState:(void *)a5 compatibleWithOriginatingRequestSpecifier:(uint64_t)a6 error:
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  id v33;
  id v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a5;
  if (a1)
  {
    v14 = objc_msgSend(v11, "count");
    if (v14)
    {
      v34 = v13;
      v35 = v12;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", v14);
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v33 = v11;
      v16 = v11;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v42;
        obj = v16;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v42 != v19)
              objc_enumerationMutation(obj);
            v21 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(a1, "entityPrintOriginatingRequestSpecifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = +[VNEntityIdentificationModel validateAceptableObservation:forEntityPrintOriginatingRequestSpecifier:error:](VNEntityIdentificationModel, "validateAceptableObservation:forEntityPrintOriginatingRequestSpecifier:error:", v21, v22, a6);

            if (!v23)
            {
              v26 = 0;
              v11 = v33;
              v13 = v34;
              v12 = v35;
              goto LABEL_26;
            }
            objc_msgSend(v15, "addObject:", v21);
          }
          v16 = obj;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
          if (v18)
            continue;
          break;
        }
      }

      v12 = v35;
      -[VNEntityIdentificationModelTrainingData _serialNumberForEntityWithUniqueIdentifier:error:](a1, v35);
      v24 = objc_claimAutoreleasedReturnValue();
      obj = (id)v24;
      if (v24)
      {
        objc_msgSend(a1[6], "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = (void *)MEMORY[0x1E0C9AA60];
      }
      v11 = v33;
      v13 = v34;
      if (a4)
      {
        v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v25);
        objc_msgSend(v15, "intersectSet:", v27);
      }
      else
      {
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v27 = v25;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v38 != v30)
                objc_enumerationMutation(v27);
              objc_msgSend(v15, "removeObject:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v29);
        }
      }

      objc_msgSend(v15, "array");
      v26 = (id)objc_claimAutoreleasedReturnValue();

LABEL_26:
    }
    else
    {
      v26 = v11;
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

@end
