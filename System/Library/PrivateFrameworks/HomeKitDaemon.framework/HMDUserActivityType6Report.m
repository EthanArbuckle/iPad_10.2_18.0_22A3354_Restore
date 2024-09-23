@implementation HMDUserActivityType6Report

- (HMDUserActivityType6Report)initWithUser:(id)a3 state:(unint64_t)a4 stateEnd:(id)a5 withReason:(unint64_t)a6
{
  return -[HMDUserActivityType6Report initWithUser:state:stateEnd:withReason:changedTimestamp:lastUpdateTimestamp:](self, "initWithUser:state:stateEnd:withReason:changedTimestamp:lastUpdateTimestamp:", a3, a4, a5, a6, 0, 0);
}

- (HMDUserActivityType6Report)initWithUser:(id)a3 state:(unint64_t)a4 stateEnd:(id)a5 withReason:(unint64_t)a6 changedTimestamp:(id)a7 lastUpdateTimestamp:(id)a8
{
  id v15;
  HMDUserActivityType6Report *v16;
  HMDUserActivityType6Report *v17;
  objc_super v19;

  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDUserActivityType6Report;
  v16 = -[HMDUserActivityReport initWithUser:withReason:changedTimestamp:lastUpdateTimestamp:](&v19, sel_initWithUser_withReason_changedTimestamp_lastUpdateTimestamp_, a3, a6, a7, a8);
  v17 = v16;
  if (v16)
  {
    v16->_state = a4;
    objc_storeStrong((id *)&v16->_stateEnd, a5);
  }

  return v17;
}

- (id)initFromMessagePayload:(id)a3 withUser:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  HMDUserActivityType6Report *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("HAS.T6.S"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "hmf_dateForKey:", CFSTR("HAS.T6.SE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)HMDUserActivityType6Report;
    v10 = -[HMDUserActivityReport initFromMessagePayload:withUser:](&v13, sel_initFromMessagePayload_withUser_, v6, v7);
    if (v10)
    {
      *((_QWORD *)v10 + 5) = objc_msgSend(v8, "unsignedIntValue");
      objc_storeStrong((id *)v10 + 6, v9);
    }
    self = (HMDUserActivityType6Report *)v10;

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)contributorType
{
  return 3;
}

- (id)serializedRemoteMessagePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDUserActivityType6Report;
  -[HMDUserActivityReport serializedRemoteMessagePayload](&v9, sel_serializedRemoteMessagePayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityType6Report state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("HAS.T6.S"));

  -[HMDUserActivityType6Report stateEnd](self, "stateEnd");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("HAS.T6.SE"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v12.receiver = self,
        v12.super_class = (Class)HMDUserActivityType6Report,
        -[HMDUserActivityReport isEqual:](&v12, sel_isEqual_, v4))
    && (v7 = -[HMDUserActivityType6Report state](self, "state"), v7 == objc_msgSend(v6, "state")))
  {
    -[HMDUserActivityType6Report stateEnd](self, "stateEnd");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stateEnd");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = HMFEqualObjects();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyReportWithChangedTimestamp:(id)a3
{
  id v4;
  HMDUserActivityType6Report *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  HMDUserActivityType6Report *v11;

  v4 = a3;
  v5 = [HMDUserActivityType6Report alloc];
  -[HMDUserActivityReport user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDUserActivityType6Report state](self, "state");
  -[HMDUserActivityType6Report stateEnd](self, "stateEnd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDUserActivityReport reason](self, "reason");
  -[HMDUserActivityReport lastUpdateTimestamp](self, "lastUpdateTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDUserActivityType6Report initWithUser:state:stateEnd:withReason:changedTimestamp:lastUpdateTimestamp:](v5, "initWithUser:state:stateEnd:withReason:changedTimestamp:lastUpdateTimestamp:", v6, v7, v8, v9, v4, v10);

  return v11;
}

- (id)copyReportWithLastUpdateTimestamp:(id)a3 reason:(unint64_t)a4
{
  id v6;
  HMDUserActivityType6Report *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  HMDUserActivityType6Report *v12;

  v6 = a3;
  v7 = [HMDUserActivityType6Report alloc];
  -[HMDUserActivityReport user](self, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDUserActivityType6Report state](self, "state");
  -[HMDUserActivityType6Report stateEnd](self, "stateEnd");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityReport changedTimestamp](self, "changedTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDUserActivityType6Report initWithUser:state:stateEnd:withReason:changedTimestamp:lastUpdateTimestamp:](v7, "initWithUser:state:stateEnd:withReason:changedTimestamp:lastUpdateTimestamp:", v8, v9, v10, a4, v11, v6);

  return v12;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSDate)stateEnd
{
  return self->_stateEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateEnd, 0);
}

@end
