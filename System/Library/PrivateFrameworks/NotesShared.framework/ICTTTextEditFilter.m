@implementation ICTTTextEditFilter

- (ICTTTextEditFilter)init
{
  ICTTTextEditFilter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICTTTextEditFilter;
  result = -[ICTTTextEditFilter init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_allowsMissingTimestamps = 257;
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEditFilter allowedUserIDs](self, "allowedUserIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEditFilter allowedAttachmentIDs](self, "allowedAttachmentIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICTTTextEditFilter allowsMissingTimestamps](self, "allowsMissingTimestamps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICTTTextEditFilter allowsMissingUsers](self, "allowsMissingUsers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEditFilter fromDate](self, "fromDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEditFilter toDate](self, "toDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, allowedUserIDs: %@, allowedAttachmentIDs: %@, allowsMissingTimestamps: %@, allowsMissingUsers: %@, fromDate: %@, toDate: %@>"), v5, self, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  BOOL v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  BOOL v21;
  unint64_t v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  unint64_t v39;
  int v40;
  void *v41;
  void *v42;

  if (a3 != self)
  {
    v4 = a3;
    objc_opt_class();
    ICDynamicCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICTTTextEditFilter allowedUserIDs](self, "allowedUserIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allowedUserIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v6)
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;
    if (v8 == v7)
      v11 = 0;
    else
      v11 = v7;
    v12 = v11;
    if (v10 | v12)
    {
      v13 = (void *)v12;
      if (v10)
        v14 = v12 == 0;
      else
        v14 = 1;
      if (v14)
        goto LABEL_31;
      v15 = objc_msgSend((id)v10, "isEqual:", v12);

      if (!v15)
      {
        LOBYTE(v22) = 0;
LABEL_58:

        return v22;
      }
    }
    -[ICTTTextEditFilter allowedAttachmentIDs](self, "allowedAttachmentIDs");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allowedAttachmentIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v10)
      v16 = 0;
    else
      v16 = (void *)v10;
    v17 = v16;
    if (v8 == v13)
      v18 = 0;
    else
      v18 = v13;
    v19 = v18;
    if (v17 | v19)
    {
      v20 = (void *)v19;
      if (v17)
        v21 = v19 == 0;
      else
        v21 = 1;
      if (v21)
        goto LABEL_26;
      LODWORD(v22) = objc_msgSend((id)v17, "isEqual:", v19);

      if (!(_DWORD)v22)
        goto LABEL_57;
    }
    v23 = objc_msgSend(v5, "allowsMissingTimestamps");
    if (v23 != -[ICTTTextEditFilter allowsMissingTimestamps](self, "allowsMissingTimestamps")
      || (v24 = objc_msgSend(v5, "allowsMissingUsers"),
          v24 != -[ICTTTextEditFilter allowsMissingUsers](self, "allowsMissingUsers")))
    {
LABEL_31:
      LOBYTE(v22) = 0;
LABEL_57:

      goto LABEL_58;
    }
    -[ICTTTextEditFilter fromDate](self, "fromDate");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fromDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v17)
      v25 = 0;
    else
      v25 = (void *)v17;
    v22 = v25;
    if (v8 == v20)
      v26 = 0;
    else
      v26 = v20;
    v27 = v26;
    if (!(v22 | v27))
      goto LABEL_43;
    v28 = (void *)v27;
    v29 = (void *)v22;
    LOBYTE(v22) = 0;
    v42 = v29;
    if (!v29 || !v27)
    {
LABEL_55:

      goto LABEL_56;
    }
    v30 = (void *)v27;
    v40 = objc_msgSend(v29, "isEqual:", v27);

    if (v40)
    {
LABEL_43:
      -[ICTTTextEditFilter toDate](self, "toDate");
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "toDate");
      v32 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v31;
      if (v8 == (void *)v31)
        v33 = 0;
      else
        v33 = (void *)v31;
      v39 = v33;
      v41 = (void *)v32;
      if (v8 == (void *)v32)
        v34 = 0;
      else
        v34 = (void *)v32;
      v35 = v34;
      v36 = (void *)v35;
      if (v39 | v35)
      {
        LOBYTE(v22) = 0;
        v37 = (void *)v39;
        if (v39 && v35)
          LOBYTE(v22) = objc_msgSend((id)v39, "isEqual:", v35);
      }
      else
      {
        v37 = (void *)v39;
        LOBYTE(v22) = 1;
      }

      v28 = v41;
      goto LABEL_55;
    }
LABEL_26:
    LOBYTE(v22) = 0;
LABEL_56:

    goto LABEL_57;
  }
  LOBYTE(v22) = 1;
  return v22;
}

- (unint64_t)hash
{
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  objc_class *v13;
  void *v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[ICTTTextEditFilter allowedUserIDs](self, "allowedUserIDs");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v6 += ICHashWithObject(*(void **)(*((_QWORD *)&v32 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v9);
  }

  -[ICTTTextEditFilter allowedAttachmentIDs](self, "allowedAttachmentIDs");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        v15 += ICHashWithObject(*(void **)(*((_QWORD *)&v32 + 1) + 8 * j));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v18);
  }

  -[ICTTTextEditFilter allowsMissingTimestamps](self, "allowsMissingTimestamps");
  -[ICTTTextEditFilter allowsMissingUsers](self, "allowsMissingUsers");
  -[ICTTTextEditFilter fromDate](self, "fromDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hash");
  -[ICTTTextEditFilter toDate](self, "toDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hash");
  v30 = ICHashWithHashKeys(v6, v23, v24, v25, v26, v27, v28, v29, v15);

  return v30;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICTTTextEditFilter *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[ICTTTextEditFilter init](+[ICTTTextEditFilter allocWithZone:](ICTTTextEditFilter, "allocWithZone:", a3), "init");
  -[ICTTTextEditFilter allowedUserIDs](self, "allowedUserIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEditFilter setAllowedUserIDs:](v4, "setAllowedUserIDs:", v5);

  -[ICTTTextEditFilter allowedAttachmentIDs](self, "allowedAttachmentIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEditFilter setAllowedAttachmentIDs:](v4, "setAllowedAttachmentIDs:", v6);

  -[ICTTTextEditFilter setAllowsMissingTimestamps:](v4, "setAllowsMissingTimestamps:", -[ICTTTextEditFilter allowsMissingTimestamps](self, "allowsMissingTimestamps"));
  -[ICTTTextEditFilter setAllowsMissingUsers:](v4, "setAllowsMissingUsers:", -[ICTTTextEditFilter allowsMissingUsers](self, "allowsMissingUsers"));
  -[ICTTTextEditFilter fromDate](self, "fromDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEditFilter setFromDate:](v4, "setFromDate:", v7);

  -[ICTTTextEditFilter toDate](self, "toDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTTTextEditFilter setToDate:](v4, "setToDate:", v8);

  return v4;
}

- (NSSet)allowedUserIDs
{
  return self->_allowedUserIDs;
}

- (void)setAllowedUserIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)allowedAttachmentIDs
{
  return self->_allowedAttachmentIDs;
}

- (void)setAllowedAttachmentIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)allowsMissingTimestamps
{
  return self->_allowsMissingTimestamps;
}

- (void)setAllowsMissingTimestamps:(BOOL)a3
{
  self->_allowsMissingTimestamps = a3;
}

- (BOOL)allowsMissingUsers
{
  return self->_allowsMissingUsers;
}

- (void)setAllowsMissingUsers:(BOOL)a3
{
  self->_allowsMissingUsers = a3;
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (void)setFromDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void)setToDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
  objc_storeStrong((id *)&self->_allowedAttachmentIDs, 0);
  objc_storeStrong((id *)&self->_allowedUserIDs, 0);
}

@end
