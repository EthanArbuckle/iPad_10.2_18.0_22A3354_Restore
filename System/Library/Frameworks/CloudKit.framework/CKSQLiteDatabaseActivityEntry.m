@implementation CKSQLiteDatabaseActivityEntry

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  objc_msgSend_groupID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedIntValue(v5, v6, v7, v8);
  objc_msgSend_databaseID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_unsignedIntValue(v13, v14, v15, v16) | (v9 << 16);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  char isEqualToString;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;

  v4 = a3;
  objc_msgSend_databaseID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseID(v4, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v12;
  isEqualToString = 0;
  if (v8 && v12)
  {
    if (objc_msgSend_isEqualToNumber_(v8, v13, v12, v14))
    {
      objc_msgSend_groupID(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_groupID(v4, v21, v22, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v24;
      isEqualToString = 0;
      if (v20 && v24)
      {
        if (objc_msgSend_isEqualToNumber_(v20, v25, v24, v26))
        {
          objc_msgSend_tableName(self, v28, v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_tableName(v4, v32, v33, v34);
          v35 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)v35;
          if (v31 == (void *)v35)
          {
            isEqualToString = 1;
          }
          else
          {
            isEqualToString = 0;
            if (v31 && v35)
              isEqualToString = objc_msgSend_isEqualToString_(v31, v36, v35, v37);
          }

        }
        else
        {
          isEqualToString = 0;
        }
      }

    }
    else
    {
      isEqualToString = 0;
    }
  }

  return isEqualToString;
}

- (id)targetDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend_tableName(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_groupName(self, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v10;
  if (v5)
    objc_msgSend_stringWithFormat_(v6, v11, (uint64_t)CFSTR("group=%@%@%@"), v12, v10, CFSTR(" table="), v5);
  else
    objc_msgSend_stringWithFormat_(v6, v11, (uint64_t)CFSTR("group=%@%@%@"), v12, v10, &stru_1E1F66ED0, &stru_1E1F66ED0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSNumber)activityID
{
  return self->_activityID;
}

- (void)setActivityID:(id)a3
{
  objc_storeStrong((id *)&self->_activityID, a3);
}

- (NSNumber)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(id)a3
{
  objc_storeStrong((id *)&self->_databaseID, a3);
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
  objc_storeStrong((id *)&self->_tableName, a3);
}

- (NSDate)activityEarliestDate
{
  return self->_activityEarliestDate;
}

- (void)setActivityEarliestDate:(id)a3
{
  objc_storeStrong((id *)&self->_activityEarliestDate, a3);
}

- (NSNumber)coalescingInterval
{
  return self->_coalescingInterval;
}

- (void)setCoalescingInterval:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingInterval, a3);
}

- (NSNumber)separationInterval
{
  return self->_separationInterval;
}

- (void)setSeparationInterval:(id)a3
{
  objc_storeStrong((id *)&self->_separationInterval, a3);
}

- (NSDate)activityLatestDate
{
  return self->_activityLatestDate;
}

- (void)setActivityLatestDate:(id)a3
{
  objc_storeStrong((id *)&self->_activityLatestDate, a3);
}

- (NSDate)activityNotBeforeDate
{
  return self->_activityNotBeforeDate;
}

- (void)setActivityNotBeforeDate:(id)a3
{
  objc_storeStrong((id *)&self->_activityNotBeforeDate, a3);
}

- (NSDate)activityStartDate
{
  return self->_activityStartDate;
}

- (void)setActivityStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_activityStartDate, a3);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_activityStartDate, 0);
  objc_storeStrong((id *)&self->_activityNotBeforeDate, 0);
  objc_storeStrong((id *)&self->_activityLatestDate, 0);
  objc_storeStrong((id *)&self->_separationInterval, 0);
  objc_storeStrong((id *)&self->_coalescingInterval, 0);
  objc_storeStrong((id *)&self->_activityEarliestDate, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
  objc_storeStrong((id *)&self->_activityID, 0);
}

@end
