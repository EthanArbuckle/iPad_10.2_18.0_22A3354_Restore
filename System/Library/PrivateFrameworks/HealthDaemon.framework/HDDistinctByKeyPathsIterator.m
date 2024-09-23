@implementation HDDistinctByKeyPathsIterator

- (HDDistinctByKeyPathsIterator)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDDistinctByKeyPathsIterator)initWithSourceIterator:(id)a3 keyPaths:(id)a4
{
  id v8;
  id v9;
  void *v10;
  HDDistinctByKeyPathsIterator *v11;
  HDDistinctByKeyPathsIterator *v12;
  uint64_t v13;
  NSArray *keyPaths;
  NSMutableSet *v15;
  NSMutableSet *seenValues;
  void *v18;
  void *v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDistinctByKeyPathsIterator.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceIterator"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDistinctByKeyPathsIterator.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPaths"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)HDDistinctByKeyPathsIterator;
  v11 = -[HDDistinctByKeyPathsIterator init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceIterator, a3);
    v13 = objc_msgSend(v10, "copy");
    keyPaths = v12->_keyPaths;
    v12->_keyPaths = (NSArray *)v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    seenValues = v12->_seenValues;
    v12->_seenValues = v15;

  }
  return v12;
}

- (BOOL)advanceWithError:(id *)a3
{
  NSUInteger v5;
  int v6;
  BOOL v7;
  BOOL v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = -[NSArray count](self->_keyPaths, "count");
  v6 = -[HDSampleIterator advanceWithError:](self->_sourceIterator, "advanceWithError:", a3);
  if (v5)
    v7 = 0;
  else
    v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    while (1)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = self->_keyPaths;
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            -[HDSampleIterator sample](self->_sourceIterator, "sample");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "uniqueIdentifierForDistinctByKeyPath:error:", v15, a3);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v17)
            {
              v7 = 0;
              goto LABEL_20;
            }
            objc_msgSend(v9, "addObject:", v17);

          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v12)
            continue;
          break;
        }
      }

      v10 = (NSArray *)objc_msgSend(v9, "copy");
      if ((-[NSMutableSet containsObject:](self->_seenValues, "containsObject:", v10) & 1) == 0)
        break;

      v7 = 0;
      if ((-[HDSampleIterator advanceWithError:](self->_sourceIterator, "advanceWithError:", a3) & 1) == 0)
        return v7;
    }
    -[NSMutableSet addObject:](self->_seenValues, "addObject:", v10);
    v7 = 1;
LABEL_20:

  }
  return v7;
}

- (id)object
{
  return (id)-[HDSampleIterator object](self->_sourceIterator, "object");
}

- (HKSample)sample
{
  return (HKSample *)-[HDSampleIterator sample](self->_sourceIterator, "sample");
}

- (int64_t)objectID
{
  return -[HDSampleIterator objectID](self->_sourceIterator, "objectID");
}

- (HKDeletedObject)deletedObject
{
  return (HKDeletedObject *)-[HDSampleIterator deletedObject](self->_sourceIterator, "deletedObject");
}

- (id)copyWithZone:(_NSZone *)a3
{
  HDDistinctByKeyPathsIterator *v5;
  void *v6;
  HDDistinctByKeyPathsIterator *v7;
  uint64_t v8;
  NSMutableSet *seenValues;

  v5 = +[HDDistinctByKeyPathsIterator allocWithZone:](HDDistinctByKeyPathsIterator, "allocWithZone:");
  v6 = (void *)-[HDSampleIterator copyWithZone:](self->_sourceIterator, "copyWithZone:", a3);
  v7 = -[HDDistinctByKeyPathsIterator initWithSourceIterator:keyPaths:](v5, "initWithSourceIterator:keyPaths:", v6, self->_keyPaths);

  v8 = -[NSMutableSet mutableCopy](self->_seenValues, "mutableCopy");
  seenValues = v7->_seenValues;
  v7->_seenValues = (NSMutableSet *)v8;

  return v7;
}

- (BOOL)restoreIteratorStateFromData:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSMutableSet *v15;
  NSMutableSet *seenValues;
  id v17;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3710];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initForReadingFromData:error:", v7, a4);

  if (v8)
  {
    objc_msgSend(v8, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceIteratorState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (-[HDSampleIterator restoreIteratorStateFromData:error:](self->_sourceIterator, "restoreIteratorStateFromData:error:", v9, a4))
      {
        v10 = (void *)MEMORY[0x1E0C99E60];
        v19[0] = objc_opt_class();
        v19[1] = objc_opt_class();
        v19[2] = objc_opt_class();
        v19[3] = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setWithArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v12, CFSTR("SeenValues"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v13 != 0;
        if (v13)
        {
          v15 = (NSMutableSet *)objc_msgSend(v13, "mutableCopy");
          seenValues = self->_seenValues;
          self->_seenValues = v15;
        }
        else
        {
          objc_msgSend(v8, "error");
          seenValues = (NSMutableSet *)(id)objc_claimAutoreleasedReturnValue();
          if (seenValues)
          {
            if (a4)
              *a4 = objc_retainAutorelease(seenValues);
            else
              _HKLogDroppedError();
          }

        }
        goto LABEL_19;
      }
    }
    else
    {
      objc_msgSend(v8, "error");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v17);
        else
          _HKLogDroppedError();
      }

    }
    v14 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v14 = 0;
LABEL_20:

  return v14;
}

- (id)iteratorStateData
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[HDSampleIterator iteratorStateData](self->_sourceIterator, "iteratorStateData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeObject:forKey:", v4, CFSTR("SourceIteratorState"));

  objc_msgSend(v3, "encodeObject:forKey:", self->_seenValues, CFSTR("SeenValues"));
  objc_msgSend(v3, "encodedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seenValues, 0);
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_sourceIterator, 0);
}

@end
