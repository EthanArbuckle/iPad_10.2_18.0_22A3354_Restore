@implementation VNPersonsModelData

- (VNPersonsModelData)initWithConfiguration:(id)a3
{
  id v4;
  VNPersonsModelData *v5;
  NSMutableArray *v6;
  NSMutableArray *personUniqueIdentifiers;
  NSMutableDictionary *v8;
  NSMutableDictionary *personUniqueIdentifierToSerialNumberMapping;
  NSMutableDictionary *v10;
  NSMutableDictionary *serialNumberToFaceObservationsMapping;
  uint64_t v12;
  NSMutableIndexSet *availablePersonSerialNumbers;
  NSDate *v14;
  NSDate *lastModificationDate;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNPersonsModelData;
  v5 = -[VNPersonsModelData init](&v17, sel_init);
  if (v5)
  {
    v5->_maximumIdentities = objc_msgSend(v4, "maximumIdentities");
    v5->_faceprintRequestRevision = objc_msgSend(v4, "faceprintRequestRevision");
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    personUniqueIdentifiers = v5->_personUniqueIdentifiers;
    v5->_personUniqueIdentifiers = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    personUniqueIdentifierToSerialNumberMapping = v5->_personUniqueIdentifierToSerialNumberMapping;
    v5->_personUniqueIdentifierToSerialNumberMapping = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    serialNumberToFaceObservationsMapping = v5->_serialNumberToFaceObservationsMapping;
    v5->_serialNumberToFaceObservationsMapping = v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 1, v5->_maximumIdentities);
    availablePersonSerialNumbers = v5->_availablePersonSerialNumbers;
    v5->_availablePersonSerialNumbers = (NSMutableIndexSet *)v12;

    v14 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    lastModificationDate = v5->_lastModificationDate;
    v5->_lastModificationDate = v14;

  }
  return v5;
}

- (void)_modelWasModified
{
  NSDate *v3;
  NSDate *lastModificationDate;
  id v5;

  v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  lastModificationDate = self->_lastModificationDate;
  self->_lastModificationDate = v3;

  -[VNPersonsModelData delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v5, "personsModelDataWasModified:", self);

}

- (id)_requestNewIdentitySerialNumberAndReturnError:(id *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (-[NSMutableDictionary count](self->_personUniqueIdentifierToSerialNumberMapping, "count") >= self->_maximumIdentities)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The model has reached the maximum identity limit of %lu"), self->_maximumIdentities);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      VNPersonsModelErrorWithLocalizedDescription(5, v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_7:
    v7 = 0;
    return v7;
  }
  v5 = -[NSMutableIndexSet firstIndex](self->_availablePersonSerialNumbers, "firstIndex");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v5;
    -[NSMutableIndexSet removeIndex:](self->_availablePersonSerialNumbers, "removeIndex:", v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if (!a3)
    goto LABEL_7;
  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("identity serial numbers have been exhausted"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  *a3 = v6;
  return v7;
}

- (id)_uniqueFaceObservationsWithRegistrationState:(BOOL)a3 forFaceObservations:(id)a4 withExpectedFaceprintRequestRevision:(unint64_t)a5 ofPersonWithUniqueIdentifier:(id)a6 error:(id *)a7
{
  _BOOL4 v10;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  _BOOL4 v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v10 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v30 = a6;
  v31 = v12;
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    v29 = v10;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", v13);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v15 = v12;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v37 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v19, "VNPersonsModelFaceprintWithRequestRevision:error:", a5, a7);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            v24 = 0;
            goto LABEL_22;
          }
          objc_msgSend(v14, "addObject:", v19);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (v16)
          continue;
        break;
      }
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_personUniqueIdentifierToSerialNumberMapping, "objectForKeyedSubscript:", v30);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_serialNumberToFaceObservationsMapping, "objectForKeyedSubscript:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v29)
    {
      v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v21);
      objc_msgSend(v14, "intersectSet:", v23);
    }
    else
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v23 = v21;
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v33 != v26)
              objc_enumerationMutation(v23);
            objc_msgSend(v14, "removeObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        }
        while (v25);
      }
    }

    objc_msgSend(v14, "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v24;
}

- (BOOL)_addUniqueFaceObservations:(id)a3 toPersonWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "count");
  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_personUniqueIdentifierToSerialNumberMapping, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[VNPersonsModelData _requestNewIdentitySerialNumberAndReturnError:](self, "_requestNewIdentitySerialNumberAndReturnError:", a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v13 = 0;
        goto LABEL_9;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_personUniqueIdentifierToSerialNumberMapping, "setObject:forKeyedSubscript:", v11, v9);
      -[NSMutableArray addObject:](self->_personUniqueIdentifiers, "addObject:", v9);
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_serialNumberToFaceObservationsMapping, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_serialNumberToFaceObservationsMapping, "setObject:forKeyedSubscript:");
    }
    objc_msgSend(v12, "addObjectsFromArray:", v8);
    -[VNPersonsModelData _modelWasModified](self, "_modelWasModified");

  }
  v13 = 1;
LABEL_9:

  return v13;
}

- (void)_removeAllFaceObservationsFromIdentityWithSerialNumber:(id)a3
{
  id v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_serialNumberToFaceObservationsMapping, "objectForKeyedSubscript:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "removeAllObjects");
    -[VNPersonsModelData _modelWasModified](self, "_modelWasModified");
  }

}

- (void)_removePersonWithUniqueIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_personUniqueIdentifierToSerialNumberMapping, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VNPersonsModelData _removeAllFaceObservationsFromIdentityWithSerialNumber:](self, "_removeAllFaceObservationsFromIdentityWithSerialNumber:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_serialNumberToFaceObservationsMapping, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_personUniqueIdentifierToSerialNumberMapping, "removeObjectForKey:", v6);
    -[NSMutableArray removeObject:](self->_personUniqueIdentifiers, "removeObject:", v6);
    v5 = objc_msgSend(v4, "unsignedIntegerValue");
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", -[NSMutableIndexSet containsIndex:](self->_availablePersonSerialNumbers, "containsIndex:", v5) ^ 1, CFSTR("available person serial numbers is corrupt"));
    -[NSMutableIndexSet addIndex:](self->_availablePersonSerialNumbers, "addIndex:", v5);
    -[VNPersonsModelData _modelWasModified](self, "_modelWasModified");
  }

}

- (void)_removeExistingFaceObservations:(id)a3 fromIdentityWithSerialNumber:(id)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;

  v9 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_serialNumberToFaceObservationsMapping, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "count");
    objc_msgSend(v7, "removeObjectsInArray:", v9);
    if (objc_msgSend(v7, "count") < v8)
      -[VNPersonsModelData _modelWasModified](self, "_modelWasModified");
  }

}

- (void)_removeExistingFaceObservations:(id)a3 fromPersonWithUniqueIdentifier:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_personUniqueIdentifierToSerialNumberMapping, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[VNPersonsModelData _removeExistingFaceObservations:fromIdentityWithSerialNumber:](self, "_removeExistingFaceObservations:fromIdentityWithSerialNumber:", v7, v6);

}

- (id)_accessToMutableFaceObservationsForPersonAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NSMutableArray objectAtIndex:](self->_personUniqueIdentifiers, "objectAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_personUniqueIdentifierToSerialNumberMapping, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_serialNumberToFaceObservationsMapping, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)addFaceObservations:(id)a3 toPersonWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t faceprintRequestRevision;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  faceprintRequestRevision = self->_faceprintRequestRevision;
  if (!faceprintRequestRevision)
  {
    if (!objc_msgSend(v8, "count"))
    {
      v12 = 1;
      goto LABEL_9;
    }
    objc_msgSend(v8, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "VNPersonsModelFaceprintWithRequestRevision:error:", 0, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v12 = 0;
      goto LABEL_9;
    }
    faceprintRequestRevision = objc_msgSend(v14, "requestRevision");

  }
  -[VNPersonsModelData _uniqueFaceObservationsWithRegistrationState:forFaceObservations:withExpectedFaceprintRequestRevision:ofPersonWithUniqueIdentifier:error:](self, "_uniqueFaceObservationsWithRegistrationState:forFaceObservations:withExpectedFaceprintRequestRevision:ofPersonWithUniqueIdentifier:error:", 0, v8, faceprintRequestRevision, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    self->_faceprintRequestRevision = faceprintRequestRevision;
    v12 = -[VNPersonsModelData _addUniqueFaceObservations:toPersonWithUniqueIdentifier:error:](self, "_addUniqueFaceObservations:toPersonWithUniqueIdentifier:error:", v11, v9, a5);
  }
  else
  {
    v12 = 0;
  }

LABEL_9:
  return v12;
}

- (BOOL)removeFaceObservations:(id)a3 fromPersonWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  -[VNPersonsModelData _uniqueFaceObservationsWithRegistrationState:forFaceObservations:withExpectedFaceprintRequestRevision:ofPersonWithUniqueIdentifier:error:](self, "_uniqueFaceObservationsWithRegistrationState:forFaceObservations:withExpectedFaceprintRequestRevision:ofPersonWithUniqueIdentifier:error:", 1, a3, 0, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[VNPersonsModelData _removeExistingFaceObservations:fromPersonWithUniqueIdentifier:](self, "_removeExistingFaceObservations:fromPersonWithUniqueIdentifier:", v9, v8);

  return v9 != 0;
}

- (BOOL)removeAllFaceObservationsFromPersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_personUniqueIdentifierToSerialNumberMapping, "objectForKeyedSubscript:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[VNPersonsModelData _removeAllFaceObservationsFromIdentityWithSerialNumber:](self, "_removeAllFaceObservationsFromIdentityWithSerialNumber:", v5);

  return 1;
}

- (BOOL)removePersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  -[VNPersonsModelData _removePersonWithUniqueIdentifier:](self, "_removePersonWithUniqueIdentifier:", a3, a4);
  return 1;
}

- (unint64_t)numberOfPersonsInPersonsModel:(id)a3
{
  return -[NSMutableArray count](self->_personUniqueIdentifiers, "count", a3);
}

- (id)personsModel:(id)a3 uniqueIdentifierOfPersonAtIndex:(unint64_t)a4
{
  -[NSMutableArray objectAtIndex:](self->_personUniqueIdentifiers, "objectAtIndex:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)personsModel:(id)a3 indexOfPersonWithUniqueIdentifier:(id)a4
{
  return -[NSMutableArray indexOfObject:](self->_personUniqueIdentifiers, "indexOfObject:", a4);
}

- (unint64_t)personsModel:(id)a3 numberOfFaceObservationsForPersonAtIndex:(unint64_t)a4
{
  void *v4;
  unint64_t v5;

  -[VNPersonsModelData _accessToMutableFaceObservationsForPersonAtIndex:](self, "_accessToMutableFaceObservationsForPersonAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)personsModel:(id)a3 faceObservationAtIndex:(unint64_t)a4 forPersonAtIndex:(unint64_t)a5
{
  void *v6;
  void *v7;

  -[VNPersonsModelData _accessToMutableFaceObservationsForPersonAtIndex:](self, "_accessToMutableFaceObservationsForPersonAtIndex:", a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)faceModelPersonsCount
{
  return -[NSMutableArray count](self->_personUniqueIdentifiers, "count");
}

- (id)faceModelUniqueIdentifierOfPersonAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_personUniqueIdentifiers, "objectAtIndex:", a3);
}

- (unint64_t)faceModelIndexOfPersonWithUniqueIdentifier:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->_personUniqueIdentifiers, "indexOfObject:", a3);
}

- (unint64_t)faceModelNumberOfFaceObservationsForPersonAtIndex:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[VNPersonsModelData _accessToMutableFaceObservationsForPersonAtIndex:](self, "_accessToMutableFaceObservationsForPersonAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)faceModelFaceObservationAtIndex:(unint64_t)a3 forPersonAtIndex:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[VNPersonsModelData _accessToMutableFaceObservationsForPersonAtIndex:](self, "_accessToMutableFaceObservationsForPersonAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VNPersonsModelDataDelegate)delegate
{
  return (VNPersonsModelDataDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (unint64_t)faceprintRequestRevision
{
  return self->_faceprintRequestRevision;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_availablePersonSerialNumbers, 0);
  objc_storeStrong((id *)&self->_serialNumberToFaceObservationsMapping, 0);
  objc_storeStrong((id *)&self->_personUniqueIdentifierToSerialNumberMapping, 0);
  objc_storeStrong((id *)&self->_personUniqueIdentifiers, 0);
}

@end
