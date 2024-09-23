@implementation CPLSharedRecordMerger

- (CPLSharedRecordMerger)initWithMapping:(id)a3
{
  id v5;
  CPLSharedRecordMerger *v6;
  CPLSharedRecordMerger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLSharedRecordMerger;
  v6 = -[CPLSharedRecordMerger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapping, a3);

  return v7;
}

- (void)mergeRecord:(id)a3 isSharedRecord:(BOOL)a4 inPrivateRecord:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  CPLSharedRecordMerger *v43;
  id v44;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "recordChangeData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    objc_msgSend(v8, "recordChangeData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v10)
    {
      v13 = v10;
    }
    else
    {
      objc_msgSend(v8, "recordChangeData");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    objc_msgSend(v8, "sharingRecordChangeData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
  }
  if ((objc_msgSend(v9, "isMasterChange") & 1) == 0)
  {
    if (objc_msgSend(v9, "supportsResources"))
    {
      objc_msgSend(v9, "propertiesForChangeType:", 8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __68__CPLSharedRecordMerger_mergeRecord_isSharedRecord_inPrivateRecord___block_invoke;
    v41[3] = &unk_1E60D7488;
    v42 = v15;
    v43 = self;
    v44 = v9;
    v16 = v15;
    objc_msgSend(v44, "cplCopyPropertiesFromObject:withCopyBlock:", v8, v41);

  }
  objc_msgSend(v9, "setRecordChangeData:", v11);
  objc_msgSend(v9, "setSharingRecordChangeData:", v12);
  v17 = objc_msgSend(v9, "inTrash");
  if (!v6)
  {
    if (v17)
    {
      objc_msgSend(v9, "dateDeleted");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateDeleted");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
      v27 = v25;
      v28 = v27;
      if (v26)
        v29 = v26;
      else
        v29 = v27;
      v30 = v29;

      objc_msgSend(v9, "setDateDeleted:", v30);
    }
    else
    {
      objc_msgSend(v9, "setDateDeleted:", 0);
    }
    objc_msgSend(v9, "recordModificationDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recordModificationDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v31;
    v34 = v32;
    if (v33)
      goto LABEL_32;
LABEL_33:
    v39 = v34;
    v34 = v39;
    goto LABEL_34;
  }
  if (v17)
  {
    objc_msgSend(v9, "dateDeleted");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateDeleted");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18;
    v21 = v19;
    v22 = v21;
    if (v20)
    {
      if (v21)
      {
        objc_msgSend(v20, "laterDate:", v21);
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = v20;
      }
    }
    else
    {
      v23 = v21;
    }
    v35 = v23;

    objc_msgSend(v9, "setDateDeleted:", v35);
  }
  else
  {
    objc_msgSend(v9, "setDateDeleted:", 0);
  }
  objc_msgSend(v9, "recordModificationDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordModificationDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v36;
  v38 = v37;
  v34 = v38;
  if (!v33)
    goto LABEL_33;
  if (!v38)
  {
LABEL_32:
    v39 = v33;
    v33 = v39;
    goto LABEL_34;
  }
  objc_msgSend(v33, "laterDate:", v38);
  v39 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:
  v40 = v39;

  objc_msgSend(v9, "setRecordModificationDate:", v40);
}

- (CPLSharedRecordPropertyMapping)mapping
{
  return self->_mapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapping, 0);
}

uint64_t __68__CPLSharedRecordMerger_mergeRecord_isSharedRecord_inPrivateRecord___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, char *a6)
{
  id v10;
  id v11;
  id v12;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  if (sel_recordModificationDate == a6)
  {
    objc_msgSend(v10, "recordModificationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordModificationDate");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if ((v16 || !v17) && (!v16 || !v17 || objc_msgSend(v16, "compare:", v17) != -1))
    {

LABEL_21:
      v19 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v10, "setRecordModificationDate:", v18);

  }
  else if (sel_recordChangeData != a6 && sel_sharingRecordChangeData != a6 && sel_sharingScopeIdentifier != a6)
  {
    v15 = *(void **)(a1 + 32);
    if (v15)
    {
      if ((objc_msgSend(v15, "containsObject:", v12) & 1) != 0)
        goto LABEL_21;
    }
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "shouldUpdatePropertyOnPrivateRecord:recordClass:", v12, objc_opt_class()) & 1) == 0)goto LABEL_21;
  }
  v19 = 1;
LABEL_22:

  return v19;
}

@end
