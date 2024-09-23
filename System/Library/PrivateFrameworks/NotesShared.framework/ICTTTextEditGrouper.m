@implementation ICTTTextEditGrouper

- (ICTTTextEditGrouper)initWithNote:(id)a3
{
  id v5;
  ICTTTextEditGrouper *v6;
  ICTTTextEditGrouper *v7;
  uint64_t v8;
  NSMutableDictionary *userIDForReplicaID;
  uint64_t v10;
  NSMutableDictionary *trustsTimestampsFromReplicaID;
  uint64_t v12;
  NSMutableDictionary *checkmarkReplicaIDForUserID;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICTTTextEditGrouper;
  v6 = -[ICTTTextEditGrouper init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_note, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    userIDForReplicaID = v7->_userIDForReplicaID;
    v7->_userIDForReplicaID = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    trustsTimestampsFromReplicaID = v7->_trustsTimestampsFromReplicaID;
    v7->_trustsTimestampsFromReplicaID = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    checkmarkReplicaIDForUserID = v7->_checkmarkReplicaIDForUserID;
    v7->_checkmarkReplicaIDForUserID = (NSMutableDictionary *)v12;

  }
  return v7;
}

- (id)groupedEditsForEdits:(id)a3 inAttributedString:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[5];
  id v57;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICTTTextEditGrouper includesTableEdits](self, "includesTableEdits");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __63__ICTTTextEditGrouper_groupedEditsForEdits_inAttributedString___block_invoke;
    v56[3] = &unk_1E76CD4D8;
    v56[4] = self;
    v57 = v7;
    objc_msgSend(v6, "ic_flatMap:", v56);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v10;
  }
  v51 = v7;
  if (-[ICTTTextEditGrouper includesCheckmarkEdits](self, "includesCheckmarkEdits"))
  {
    v54[0] = v9;
    v54[1] = 3221225472;
    v54[2] = __63__ICTTTextEditGrouper_groupedEditsForEdits_inAttributedString___block_invoke_2;
    v54[3] = &unk_1E76CD4D8;
    v54[4] = self;
    v55 = v7;
    objc_msgSend(v6, "ic_flatMap:", v54);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v11;
  }
  -[ICTTTextEditGrouper filter](self, "filter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allowedAttachmentIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v52[0] = v9;
    v52[1] = 3221225472;
    v52[2] = __63__ICTTTextEditGrouper_groupedEditsForEdits_inAttributedString___block_invoke_3;
    v52[3] = &unk_1E76CD4D8;
    v52[4] = self;
    v14 = v51;
    v53 = v51;
    objc_msgSend(v6, "ic_flatMap:", v52);
    v15 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v15;
  }
  else
  {
    v14 = v51;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unknown");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v17 = 0;
    v18 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (++v18 >= objc_msgSend(v6, "count"))
      {
        v20 = 0;
      }
      else
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "string");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v19, "range");
      v24 = v23;
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v21, "ic_range:onlyContainsCharacterSet:", v22, v24, v25);

      if (-[ICTTTextEditGrouper joinsWhitespaceAndNewlineGaps](self, "joinsWhitespaceAndNewlineGaps") && v26)
      {
        v27 = objc_msgSend(v19, "range");
        v17 = v27 + v28;
        v14 = v51;
      }
      else
      {
        objc_msgSend(v19, "replicaID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTTTextEditGrouper userIDForReplicaID:](self, "userIDForReplicaID:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_msgSend(v30, "isEqual:", v50);
        v32 = !-[ICTTTextEditGrouper joinsTextGaps](self, "joinsTextGaps") && v17 < objc_msgSend(v19, "range");
        v33 = objc_msgSend(v19, "range");
        v35 = v34;
        v38 = v33 == objc_msgSend(v20, "range") && v35 == v36;
        if (!v31 || v32 || v38)
        {
          v39 = v49;
          v14 = v51;
          if (objc_msgSend(v49, "count"))
          {
            -[ICTTTextEditGrouper editGroupForEdits:userID:inAttributedString:](self, "editGroupForEdits:userID:inAttributedString:", v49, v50, v51);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "addObject:", v40);

          }
          objc_msgSend(v49, "removeAllObjects");
          v41 = v30;

          v50 = v41;
        }
        else
        {
          v14 = v51;
          v39 = v49;
        }
        -[ICTTTextEditGrouper filteredEditForEdit:inAttributedString:](self, "filteredEditForEdit:inAttributedString:", v19, v14);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "ic_addNonNilObject:", v42);
        v43 = objc_msgSend(v42, "range");
        v17 = v43 + v44;

      }
    }
    while (v18 < objc_msgSend(v6, "count"));
  }
  if (objc_msgSend(v49, "count"))
  {
    -[ICTTTextEditGrouper editGroupForEdits:userID:inAttributedString:](self, "editGroupForEdits:userID:inAttributedString:", v49, v50, v14);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addObject:", v45);

  }
  v46 = (void *)objc_msgSend(v48, "copy");

  return v46;
}

uint64_t __63__ICTTTextEditGrouper_groupedEditsForEdits_inAttributedString___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "editsByAddingTableEditsToEdit:inAttributedString:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __63__ICTTTextEditGrouper_groupedEditsForEdits_inAttributedString___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "editsByAddingCheckmarkEditsToEdit:inAttributedString:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __63__ICTTTextEditGrouper_groupedEditsForEdits_inAttributedString___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "editsByAddingAllowedAttachmentEditsToEdit:inAttributedString:", a2, *(_QWORD *)(a1 + 40));
}

- (id)groupedEdits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[ICTTTextEditGrouper note](self, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ICTTTextEditGrouper note](self, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiAttributedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v10 = (void *)MEMORY[0x1E0C9AA60];
      return v10;
    }
    -[ICTTTextEditGrouper note](self, "note");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uiAttributedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "edits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTTextEditGrouper note](self, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uiAttributedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTTTextEditGrouper groupedEditsForEdits:inAttributedString:](self, "groupedEditsForEdits:inAttributedString:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (id)userIDForReplicaID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ICTTTextEditGrouper userIDForReplicaID](self, "userIDForReplicaID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[ICTTTextEditGrouper note](self, "note");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userIDForReplicaID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTTTextEditGrouper userIDForReplicaID](self, "userIDForReplicaID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v4);

  }
  return v6;
}

- (BOOL)trustsTimestampsFromReplicaID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[ICTTTextEditGrouper trustsTimestampsFromReplicaID](self, "trustsTimestampsFromReplicaID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[ICTTTextEditGrouper note](self, "note");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "trustsTimestampsFromReplicaID:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTTTextEditGrouper trustsTimestampsFromReplicaID](self, "trustsTimestampsFromReplicaID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v4);

  }
  v10 = objc_msgSend(v6, "BOOLValue");

  return v10;
}

- (id)filteredEditForEdit:(id)a3 inAttributedString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  ICTTTextEdit *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  ICTTTextEdit *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;

  v5 = a3;
  objc_msgSend(v5, "replicaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEditGrouper userIDForReplicaID:](self, "userIDForReplicaID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTTTextEditGrouper filter](self, "filter");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_5;
  v9 = (void *)v8;
  -[ICTTTextEditGrouper filter](self, "filter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "allowsMissingUsers"))
  {

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "CR_unknown");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqual:", v12);

  if ((v13 & 1) == 0)
  {
LABEL_5:
    -[ICTTTextEditGrouper filter](self, "filter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allowedUserIDs");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[ICTTTextEditGrouper filter](self, "filter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allowedUserIDs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "containsObject:", v7);

      if (!v19)
        goto LABEL_7;
    }
    else
    {

    }
    objc_msgSend(v5, "replicaID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ICTTTextEditGrouper trustsTimestampsFromReplicaID:](self, "trustsTimestampsFromReplicaID:", v21))
    {
      objc_msgSend(v5, "timestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[ICTTTextEditGrouper filter](self, "filter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "fromDate");
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)v24;
          -[ICTTTextEditGrouper filter](self, "filter");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "fromDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v22, "ic_isEarlierThanDate:", v27);

          if ((v28 & 1) != 0)
            goto LABEL_21;
        }
        else
        {

        }
        -[ICTTTextEditGrouper filter](self, "filter");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "toDate");
        v32 = objc_claimAutoreleasedReturnValue();
        if (v32)
        {
          v33 = (void *)v32;
          -[ICTTTextEditGrouper filter](self, "filter");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "toDate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v22, "ic_isLaterThanDate:", v35);

          if ((v36 & 1) != 0)
          {
LABEL_21:
            v20 = 0;
LABEL_24:

            goto LABEL_25;
          }
        }
        else
        {

        }
LABEL_23:
        v37 = [ICTTTextEdit alloc];
        objc_msgSend(v5, "replicaID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v5, "range");
        v20 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v37, "initWithTimestamp:replicaID:range:", v22, v38, v39, v40);

        goto LABEL_24;
      }
    }
    else
    {

    }
    -[ICTTTextEditGrouper filter](self, "filter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[ICTTTextEditGrouper filter](self, "filter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "allowsMissingTimestamps");

      v22 = 0;
      v20 = 0;
      if (!v30)
        goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_7:
  v20 = 0;
LABEL_25:

  return v20;
}

- (id)editGroupForEdits:(id)a3 userID:(id)a4 inAttributedString:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ICTTTextEditGroup *v13;
  void *v14;
  ICTTTextEditGroup *v15;

  v7 = a4;
  v8 = a3;
  -[ICTTTextEditGrouper latestTimestampForEdits:](self, "latestTimestampForEdits:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICTTTextEditGrouper rangeForEdits:](self, "rangeForEdits:", v8);
  v12 = v11;
  v13 = [ICTTTextEditGroup alloc];
  v14 = (void *)objc_msgSend(v8, "copy");

  v15 = -[ICTTTextEditGroup initWithEdits:latestTimestamp:userID:range:](v13, "initWithEdits:latestTimestamp:userID:range:", v14, v9, v7, v10, v12);
  return v15;
}

- (id)latestTimestampForEdits:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "timestamp");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = v10;
          if (!v6)
          {

LABEL_11:
            objc_msgSend(v9, "timestamp");
            v15 = objc_claimAutoreleasedReturnValue();

            v6 = (void *)v15;
            continue;
          }
          objc_msgSend(v9, "timestamp");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "timeIntervalSinceDate:", v6);
          v14 = v13;

          if (v14 > 0.0)
            goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (!v5)
        goto LABEL_16;
    }
  }
  v6 = 0;
LABEL_16:

  return v6;
}

- (_NSRange)rangeForEdits:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t i;
  uint64_t location;
  NSUInteger length;
  NSRange v12;
  NSRange v13;
  NSUInteger v14;
  NSUInteger v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  NSRange v22;
  _NSRange result;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        location = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "range");
        v12.location = location;
        v12.length = length;
        if (v6)
        {
          v22.location = v8;
          v22.length = v6;
          v13 = NSUnionRange(v22, v12);
          length = v13.length;
          location = v13.location;
        }
        v8 = location;
        v6 = length;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v14 = v8;
  v15 = v6;
  result.length = v15;
  result.location = v14;
  return result;
}

- (id)editsByAddingCheckmarkEditsToEdit:(id)a3 inAttributedString:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  ICTTTextEditGrouper *v21;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a4;
  objc_msgSend(v7, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = ICTTAttributeNameParagraphStyle;
  v11 = objc_msgSend(v6, "range");
  v13 = v12;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__ICTTTextEditGrouper_editsByAddingCheckmarkEditsToEdit_inAttributedString___block_invoke;
  v18[3] = &unk_1E76CD500;
  v19 = v6;
  v20 = v9;
  v21 = self;
  v14 = v9;
  v15 = v6;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v10, v11, v13, 0, v18);

  v16 = (void *)objc_msgSend(v14, "copy");
  return v16;
}

void __76__ICTTTextEditGrouper_editsByAddingCheckmarkEditsToEdit_inAttributedString___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  ICTTTextEdit *v7;
  void *v8;
  void *v9;
  ICTTTextEdit *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  ICTTTextEdit *v30;
  uint64_t v31;
  id v32;

  v32 = a2;
  v7 = [ICTTTextEdit alloc];
  objc_msgSend(a1[4], "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "replicaID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v7, "initWithTimestamp:replicaID:range:", v8, v9, a3, a4);

  objc_msgSend(a1[5], "addObject:", v10);
  objc_msgSend(v32, "todo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1[6], "note");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "todo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userIDForChecklistItemWithIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(a1[6], "checkmarkReplicaIDForUserID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v31 = a4;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      v21 = v20;

      objc_msgSend(a1[6], "userIDForReplicaID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, v21);

      objc_msgSend(a1[6], "trustsTimestampsFromReplicaID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v21);

      objc_msgSend(a1[6], "checkmarkReplicaIDForUserID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v21, v16);

      objc_msgSend(a1[6], "note");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "todo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "uuid");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "UUIDString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timestampForChecklistItemWithIdentifier:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = -[ICTTTextEdit initWithTimestamp:replicaID:range:]([ICTTTextEdit alloc], "initWithTimestamp:replicaID:range:", v29, v21, a3, v31);
      objc_msgSend(a1[5], "addObject:", v30);

    }
  }

}

- (id)editsByAddingTableEditsToEdit:(id)a3 inAttributedString:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  ICTTTextEditGrouper *v19;
  id v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a4;
  objc_msgSend(v7, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "range");
  v12 = v11;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke;
  v17[3] = &unk_1E76CD600;
  v18 = v6;
  v19 = self;
  v20 = v9;
  v13 = v9;
  v14 = v6;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), v10, v12, 0, v17);

  v15 = (void *)objc_msgSend(v13, "copy");
  return v15;
}

void __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  ICTTTextEdit *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[6];
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  ICTTTextEdit *v43;

  v7 = a2;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__38;
  v42 = __Block_byref_object_dispose__38;
  v8 = [ICTTTextEdit alloc];
  objc_msgSend(a1[4], "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "replicaID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v8, "initWithTimestamp:replicaID:range:", v9, v10, a3, a4);

  v11 = a1[5];
  objc_msgSend((id)v39[5], "replicaID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userIDForReplicaID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1[5], "note");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "managedObjectContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentInContext:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  objc_opt_class();
  objc_msgSend(v16, "attachmentModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "table");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_20;
  v30[3] = &unk_1E76CD578;
  v22 = v19;
  v23 = a1[5];
  v31 = v22;
  v32 = v23;
  v24 = v13;
  v33 = v24;
  v35 = &v38;
  v36 = a3;
  v37 = a4;
  v25 = v20;
  v34 = v25;
  objc_msgSend(v22, "enumerateColumnsWithBlock:", v30);
  objc_msgSend(v25, "allValues");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v21;
  v29[1] = 3221225472;
  v29[2] = __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_4;
  v29[3] = &__block_descriptor_48_e36___ICTTTextEdit_16__0__ICTTTextEdit_8l;
  v29[4] = a3;
  v29[5] = a4;
  objc_msgSend(v26, "ic_map:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "sortedArrayUsingComparator:", &__block_literal_global_50);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[6], "addObject:", v39[5]);
  objc_msgSend(a1[6], "addObjectsFromArray:", v28);

  _Block_object_dispose(&v38, 8);
}

void __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7[2];
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_2;
  v8[3] = &unk_1E76CD550;
  v9 = v4;
  v10 = v3;
  v5 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v14 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 56);
  v6 = v7[0];
  v13 = *(_OWORD *)v7;
  v7[0] = v3;
  objc_msgSend(v9, "enumerateRowsWithBlock:", v8);

}

void __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10[2];
  _QWORD v11[5];
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;

  objc_msgSend(*(id *)(a1 + 32), "mergeableStringForColumnID:rowID:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ic_range");
  v7 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_3;
  v11[3] = &unk_1E76CD528;
  v8 = *(void **)(a1 + 56);
  v11[4] = *(_QWORD *)(a1 + 48);
  v12 = v3;
  v13 = v8;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 64);
  v15 = *(_OWORD *)(a1 + 80);
  v9 = v10[0];
  v14 = *(_OWORD *)v10;
  v10[0] = v3;
  objc_msgSend(v10[0], "enumerateEditsInRange:usingBlock:", v5, v7, v11);

}

void __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  ICTTTextEdit *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;

  v27 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredEditForEdit:inAttributedString:", v27, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "joinsWhitespaceAndNewlineGaps") & 1) != 0)
      goto LABEL_4;
    objc_msgSend(*(id *)(a1 + 40), "attributedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "range");
    objc_msgSend(v7, "substringWithRange:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ic_trimmedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
LABEL_4:
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v5, "replicaID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userIDForReplicaID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "isEqual:", *(_QWORD *)(a1 + 48)))
      {
        v16 = [ICTTTextEdit alloc];
        objc_msgSend(v27, "timestamp");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "replicaID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v16, "initWithTimestamp:replicaID:range:", v17, v18, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timestamp");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
          goto LABEL_8;
        v23 = (void *)v22;
        objc_msgSend(v5, "timestamp");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timestamp");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "ic_isLaterThanDate:", v25);

        if (v26)
LABEL_8:
          objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v5, v15);
      }

    }
  }

}

ICTTTextEdit *__72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  ICTTTextEdit *v4;
  void *v5;
  void *v6;
  ICTTTextEdit *v7;

  v3 = a2;
  v4 = [ICTTTextEdit alloc];
  objc_msgSend(v3, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replicaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v4, "initWithTimestamp:replicaID:range:", v5, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return v7;
}

uint64_t __72__ICTTTextEditGrouper_editsByAddingTableEditsToEdit_inAttributedString___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "timestamp");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v5, "timestamp"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    objc_msgSend(v4, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "compare:", v10);

  }
  else
  {
    objc_msgSend(v4, "timestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(v5, "timestamp");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        v11 = -1;
      else
        v11 = 0;
    }
  }

  return v11;
}

- (id)editsByAddingAllowedAttachmentEditsToEdit:(id)a3 inAttributedString:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a4;
  objc_msgSend(v7, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC10F8];
  v11 = objc_msgSend(v6, "range");
  v13 = v12;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__ICTTTextEditGrouper_editsByAddingAllowedAttachmentEditsToEdit_inAttributedString___block_invoke;
  v18[3] = &unk_1E76CD628;
  v18[4] = self;
  v19 = v6;
  v20 = v9;
  v14 = v9;
  v15 = v6;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v10, v11, v13, 0, v18);

  v16 = (void *)objc_msgSend(v14, "copy");
  return v16;
}

void __84__ICTTTextEditGrouper_editsByAddingAllowedAttachmentEditsToEdit_inAttributedString___block_invoke(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  ICTTTextEdit *v13;
  void *v14;
  void *v15;
  ICTTTextEdit *v16;
  id v17;

  ICProtocolCast();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "attachmentIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(a1[4], "filter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allowedAttachmentIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attachmentIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if (v12)
    {
      v13 = [ICTTTextEdit alloc];
      objc_msgSend(a1[5], "timestamp");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "replicaID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[ICTTTextEdit initWithTimestamp:replicaID:range:](v13, "initWithTimestamp:replicaID:range:", v14, v15, a3, a4);

      objc_msgSend(a1[6], "addObject:", v16);
    }
  }

}

- (NSMutableDictionary)userIDForReplicaID
{
  return self->_userIDForReplicaID;
}

- (NSMutableDictionary)trustsTimestampsFromReplicaID
{
  return self->_trustsTimestampsFromReplicaID;
}

- (ICNote)note
{
  return self->_note;
}

- (ICTTTextEditFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)includesTableEdits
{
  return self->_includesTableEdits;
}

- (void)setIncludesTableEdits:(BOOL)a3
{
  self->_includesTableEdits = a3;
}

- (BOOL)includesCheckmarkEdits
{
  return self->_includesCheckmarkEdits;
}

- (void)setIncludesCheckmarkEdits:(BOOL)a3
{
  self->_includesCheckmarkEdits = a3;
}

- (BOOL)joinsTextGaps
{
  return self->_joinsTextGaps;
}

- (void)setJoinsTextGaps:(BOOL)a3
{
  self->_joinsTextGaps = a3;
}

- (BOOL)joinsWhitespaceAndNewlineGaps
{
  return self->_joinsWhitespaceAndNewlineGaps;
}

- (void)setJoinsWhitespaceAndNewlineGaps:(BOOL)a3
{
  self->_joinsWhitespaceAndNewlineGaps = a3;
}

- (NSMutableDictionary)checkmarkReplicaIDForUserID
{
  return self->_checkmarkReplicaIDForUserID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkReplicaIDForUserID, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_trustsTimestampsFromReplicaID, 0);
  objc_storeStrong((id *)&self->_userIDForReplicaID, 0);
}

@end
