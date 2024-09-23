@implementation HDCloudSyncSession

- (id)excludedSyncStores
{
  return self->_excludedSyncStores;
}

- (void)setExcludedSyncStores:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *excludedSyncStores;
  id v7;

  v4 = a3;
  -[HDSyncSession syncStore](self, "syncStore");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObject:", v7);
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();

  excludedSyncStores = self->_excludedSyncStores;
  self->_excludedSyncStores = v5;

}

- (id)excludedSyncIdentities
{
  return self->_excludedSyncIdentities;
}

- (void)setExcludedSyncIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_excludedSyncIdentities, a3);
}

- (id)newChangeWithSyncEntityClass:(Class)a3 version:(id)a4
{
  +[HDCodableNanoSyncChange changeWithNanoSyncEntityClass:version:](HDCodableNanoSyncChange, "changeWithNanoSyncEntityClass:version:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)maxEncodedBytesPerCodableChangeForSyncEntityClass:(Class)a3
{
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    return 0x20000;
  else
    return -[HDCloudSyncSession maxEncodedBytesPerChangeSetForSyncEntityClass:](self, "maxEncodedBytesPerChangeSetForSyncEntityClass:", a3);
}

- (int64_t)maxEncodedBytesPerChangeSetForSyncEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3)
    return 3145728;
  else
    return 0x80000;
}

- (id)syncPredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HDSyncPredicate *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HDSyncPredicate *v26;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)HDCloudSyncSession;
  -[HDSyncSession syncPredicate](&v29, sel_syncPredicate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSyncSession syncStore](self, "syncStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shardPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKDateMin();
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shardPredicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HKDateMax();
  v14 = objc_claimAutoreleasedReturnValue();

  v28 = v4;
  if (!(v9 | v14))
  {
    v17 = 0;
    goto LABEL_11;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB3588]);
  v16 = v15;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v17 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:", v18, v14);
      goto LABEL_10;
    }
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:", v18, v19);

    if (v9)
      goto LABEL_11;
LABEL_10:

    goto LABEL_11;
  }
  if (!v14)
  {
    v18 = (void *)v9;
    goto LABEL_9;
  }
  v17 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v9, v14);
LABEL_11:
  v20 = [HDSyncPredicate alloc];
  objc_msgSend(v3, "excludedSyncProvenances");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "includedObjectTypes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultMaximumObjectAge");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultMaximumTombstoneAge");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maximumObjectAgeByType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[HDSyncPredicate initWithExcludedSyncProvenances:dateInterval:includedObjectTypes:defaultMaximumObjectAge:defaultMaximumTombstoneAge:maximumObjectAgeByType:](v20, "initWithExcludedSyncProvenances:dateInterval:includedObjectTypes:defaultMaximumObjectAge:defaultMaximumTombstoneAge:maximumObjectAgeByType:", v21, v17, v22, v23, v24, v25);

  return v26;
}

- (BOOL)requiresSyncForChangesFromAnchorRangeMap:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDSyncSession syncStore](self, "syncStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryOrderedSyncEntities");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v15 = 0;
        v16 = 0;
        v15 = HDSyncAnchorRangeMake(-1, -1);
        v16 = v11;
        objc_msgSend(v10, "syncEntityIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "getAnchorRange:forSyncEntityIdentifier:", &v15, v12);

        if (v13 && v16 > v15)
        {
          LOBYTE(v7) = 1;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

- (HDCloudSyncSequenceRecord)sequenceRecord
{
  return self->_sequenceRecord;
}

- (void)setSequenceRecord:(id)a3
{
  objc_storeStrong((id *)&self->_sequenceRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceRecord, 0);
  objc_storeStrong((id *)&self->_excludedSyncIdentities, 0);
  objc_storeStrong((id *)&self->_filteredOrderedSyncEntities, 0);
  objc_storeStrong((id *)&self->_excludedSyncStores, 0);
}

@end
