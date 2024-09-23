@implementation CPLPullSessionRevertRecords

- (CPLPullSessionRevertRecords)initWithStore:(id)a3 revertedChangesBatch:(id)a4
{
  id v7;
  CPLPullSessionRevertRecords *v8;
  CPLPullSessionRevertRecords *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPLPullSessionRevertRecords;
  v8 = -[CPLChangeSessionUpdate initWithStore:](&v11, sel_initWithStore_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_revertedChangesBatch, a4);

  return v9;
}

- (CPLPullSessionRevertRecords)initWithCoder:(id)a3
{
  id v4;
  CPLPullSessionRevertRecords *v5;
  uint64_t v6;
  CPLChangeBatch *revertedChangesBatch;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLPullSessionRevertRecords;
  v5 = -[CPLChangeSessionUpdate initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rrb"));
    v6 = objc_claimAutoreleasedReturnValue();
    revertedChangesBatch = v5->_revertedChangesBatch;
    v5->_revertedChangesBatch = (CPLChangeBatch *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLPullSessionRevertRecords;
  v4 = a3;
  -[CPLChangeSessionUpdate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_revertedChangesBatch, CFSTR("rrb"), v5.receiver, v5.super_class);

}

- (BOOL)applyToStore:(id)a3 error:(id *)a4
{
  id v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  CPLChangeBatch *revertedChangesBatch;
  void *v11;
  CPLChangeBatch *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  CPLChangeBatch *v25;
  char v26;
  CPLPullSessionRevertRecords *v28;
  void *v29;
  id *v30;
  CPLChangeBatch *obj;
  void *v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  id v41;
  uint8_t v42[128];
  uint8_t buf[4];
  CPLChangeBatch *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CPLPullSessionRevertRecords;
  v41 = 0;
  v7 = -[CPLChangeSessionUpdate applyToStore:error:](&v40, sel_applyToStore_error_, v6, &v41);
  v8 = v41;
  if (!v7)
  {
    v26 = 0;
    if (!a4)
      goto LABEL_26;
    goto LABEL_24;
  }
  v30 = a4;
  if (!_CPLSilentLogging)
  {
    __CPLPushSessionOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      revertedChangesBatch = self->_revertedChangesBatch;
      *(_DWORD *)buf = 138412290;
      v44 = revertedChangesBatch;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Client acknowledged reverted records %@", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "quarantinedRecords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v6;
  objc_msgSend(v6, "idMapping");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v28 = self;
  v12 = self->_revertedChangesBatch;
  v13 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v37;
    obj = v12;
LABEL_8:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v16);
      v18 = (void *)MEMORY[0x1B5E08BF0]();
      objc_msgSend(v17, "scopedIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v8;
      v20 = objc_msgSend(v11, "removeQuarantinedRecordWithScopedIdentifier:notify:error:", v19, 0, &v35);
      v21 = v35;

      if ((v20 & 1) == 0)
        break;
      if ((objc_msgSend(v17, "isDelete") & 1) != 0)
      {
        objc_msgSend(v17, "scopedIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v21;
        v23 = objc_msgSend(v32, "addDeleteEventForRecordWithLocalScopedIdentifier:direction:error:", v22, 0, &v34);
        v8 = v34;

        objc_autoreleasePoolPop(v18);
        if (!v23)
        {
          v26 = 0;
          v21 = v8;
LABEL_22:
          v6 = v29;
          v24 = obj;
          goto LABEL_23;
        }
      }
      else
      {
        objc_autoreleasePoolPop(v18);
        v8 = v21;
      }
      if (v14 == ++v16)
      {
        v12 = obj;
        v14 = -[CPLChangeBatch countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        if (v14)
          goto LABEL_8;
        goto LABEL_18;
      }
    }
    objc_autoreleasePoolPop(v18);
    v26 = 0;
    goto LABEL_22;
  }
LABEL_18:

  v6 = v29;
  objc_msgSend(v29, "revertRecords");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v28->_revertedChangesBatch;
  v33 = v8;
  v26 = objc_msgSend(v24, "deleteRecordsToRevertFromBatch:error:", v25, &v33);
  v21 = v33;

LABEL_23:
  v8 = v21;
  a4 = v30;
  if (v30)
  {
LABEL_24:
    if ((v26 & 1) == 0)
      *a4 = objc_retainAutorelease(v8);
  }
LABEL_26:

  return v26;
}

- (BOOL)discardFromStore:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLPullSessionRevertRecords;
  return -[CPLChangeSessionUpdate discardFromStore:error:](&v5, sel_discardFromStore_error_, a3, a4);
}

- (id)storageForStatusInStore:(id)a3
{
  return (id)objc_msgSend(a3, "revertRecords");
}

- (id)statusDescription
{
  return -[CPLChangeBatch summaryDescription](self->_revertedChangesBatch, "summaryDescription");
}

- (CPLChangeBatch)revertedChangesBatch
{
  return self->_revertedChangesBatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revertedChangesBatch, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
