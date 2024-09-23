@implementation HMDUserActivityReport

- (HMDUserActivityReport)initWithUser:(id)a3 withReason:(unint64_t)a4 changedTimestamp:(id)a5 lastUpdateTimestamp:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDUserActivityReport *v14;
  HMDUserActivityReport *v15;
  void *v16;
  NSDate *v17;
  NSDate *changedTimestamp;
  uint64_t v19;
  objc_super v21;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDUserActivityReport;
  v14 = -[HMDUserActivityReport init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_user, a3);
    v15->_reason = a4;
    v16 = v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v15->_lastUpdateTimestamp, v16);
    if (v13)
    {
      if (v12)
      {
LABEL_6:
        v17 = (NSDate *)v12;
        changedTimestamp = v15->_changedTimestamp;
        v15->_changedTimestamp = v17;
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {

      if (v12)
        goto LABEL_6;
    }
    -[HMDUserActivityReport changedTimestampFromReason:lastUpdateTimestamp:](v15, "changedTimestampFromReason:lastUpdateTimestamp:", a4, v15->_lastUpdateTimestamp);
    v19 = objc_claimAutoreleasedReturnValue();
    changedTimestamp = v15->_changedTimestamp;
    v15->_changedTimestamp = (NSDate *)v19;
    goto LABEL_9;
  }
LABEL_10:

  return v15;
}

- (id)changedTimestampFromReason:(unint64_t)a3 lastUpdateTimestamp:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v6 = v5;
  if (a3 == 11 || a3 == 4)
    v7 = v5;
  else
    v7 = 0;

  return v7;
}

- (id)initFromMessagePayload:(id)a3 withUser:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  HMDUserActivityReport *v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("HAS.reason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (v10 = objc_msgSend(v8, "unsignedIntegerValue")) != 0)
  {
    v11 = v10;
    objc_msgSend(v6, "hmf_dateForKey:", CFSTR("HAS.changedTimestamp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_dateForKey:", CFSTR("HAS.lastUpdatedTimestamp"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v12)
      v14 = v12;
    else
      v14 = v13;
    self = -[HMDUserActivityReport initWithUser:withReason:changedTimestamp:lastUpdateTimestamp:](self, "initWithUser:withReason:changedTimestamp:lastUpdateTimestamp:", v7, v11, v14, v13);

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_10;
  v7 = -[HMDUserActivityReport contributorType](self, "contributorType");
  if (v7 != objc_msgSend(v6, "contributorType"))
    goto LABEL_10;
  -[HMDUserActivityReport user](self, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HMFEqualObjects();

  if (!v10)
    goto LABEL_10;
  v11 = -[HMDUserActivityReport reason](self, "reason");
  if (v11 != objc_msgSend(v6, "reason"))
    goto LABEL_10;
  -[HMDUserActivityReport changedTimestamp](self, "changedTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = HMFEqualObjects();

  if (v14)
  {
    -[HMDUserActivityReport lastUpdateTimestamp](self, "lastUpdateTimestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastUpdateTimestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HMFEqualObjects();

  }
  else
  {
LABEL_10:
    v17 = 0;
  }

  return v17;
}

- (unint64_t)contributorType
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)serializedRemoteMessagePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCED8];
  v14[0] = CFSTR("HAS.contributorType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityReport contributorType](self, "contributorType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("HAS.reason");
  v15[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityReport reason](self, "reason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDUserActivityReport changedTimestamp](self, "changedTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDUserActivityReport changedTimestamp](self, "changedTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("HAS.changedTimestamp"));

  }
  -[HMDUserActivityReport lastUpdateTimestamp](self, "lastUpdateTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDUserActivityReport lastUpdateTimestamp](self, "lastUpdateTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("HAS.lastUpdatedTimestamp"));

  }
  v12 = (void *)objc_msgSend(v7, "copy");

  return v12;
}

- (id)copyReportWithChangedTimestamp:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)copyReportWithLastUpdateTimestamp:(id)a3 reason:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (HMDUser)user
{
  return self->_user;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSDate)changedTimestamp
{
  return self->_changedTimestamp;
}

- (NSDate)lastUpdateTimestamp
{
  return self->_lastUpdateTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_changedTimestamp, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end
