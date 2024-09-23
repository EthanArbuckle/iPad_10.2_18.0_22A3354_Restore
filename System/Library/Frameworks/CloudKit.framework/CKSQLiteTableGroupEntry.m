@implementation CKSQLiteTableGroupEntry

- (CKSQLiteTableGroupEntry)initWithName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKSQLiteTableGroupEntry *v11;
  uint64_t v12;
  NSString *name;

  v4 = a3;
  v11 = (CKSQLiteTableGroupEntry *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    v12 = objc_msgSend_copy(v4, v8, v9, v10);
    name = v11->_name;
    v11->_name = (NSString *)v12;

  }
  return v11;
}

- (id)description
{
  uint64_t v2;

  return (id)objc_msgSend_descriptionOfEntry_(CKSQLiteTOCTableGroupTable, a2, (uint64_t)self, v2);
}

- (void)deleteTables:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  CKSQLiteTableGroupEntry *v36;
  id v37;
  id v38;

  v4 = a3;
  objc_msgSend_tocTableGroup(v4, v5, v6, v7);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTable(v31, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTableGroupTable(v31, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_groupID(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocEntriesWithGroupID_error_(v11, v20, (uint64_t)v19, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_18A6F3540;
  v32[3] = &unk_1E1F61D28;
  v33 = v21;
  v34 = v4;
  v35 = v22;
  v36 = self;
  v37 = v11;
  v38 = v15;
  v23 = v15;
  v24 = v11;
  v25 = v22;
  v26 = v4;
  v27 = v21;
  v30 = (id)objc_msgSend_performDatabaseTransaction_(v26, v28, (uint64_t)v32, v29);

}

+ (double)expirationTime
{
  return 2592000.0;
}

- (BOOL)isExpired
{
  uint64_t v2;
  uint64_t v3;
  NSString *v5;
  Class v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  BOOL v20;

  objc_msgSend_creatingClass(self, a2, v2, v3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = NSClassFromString(v5);
  objc_msgSend_expirationTime(v6, v7, v8, v9);
  if (v6)
  {
    v14 = v13 * 1.05;
    if (v13 * 1.05 <= 0.0)
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend_lastUsed(self, v10, v11, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceNow(v15, v16, v17, v18);
      v20 = v14 + v19 < 0.0;

    }
  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsed, a3);
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSString)creatingClass
{
  return self->_creatingClass;
}

- (void)setCreatingClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)groupData
{
  return self->_groupData;
}

- (void)setGroupData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupData, 0);
  objc_storeStrong((id *)&self->_creatingClass, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
