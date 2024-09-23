@implementation HMDUserActivityType4Report

- (HMDUserActivityType4Report)initWithUser:(id)a3 state:(unint64_t)a4 withReason:(unint64_t)a5
{
  return -[HMDUserActivityType4Report initWithUser:state:withReason:changedTimestamp:lastUpdateTimestamp:](self, "initWithUser:state:withReason:changedTimestamp:lastUpdateTimestamp:", a3, a4, a5, 0, 0);
}

- (HMDUserActivityType4Report)initWithUser:(id)a3 state:(unint64_t)a4 withReason:(unint64_t)a5 changedTimestamp:(id)a6 lastUpdateTimestamp:(id)a7
{
  HMDUserActivityType4Report *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDUserActivityType4Report;
  result = -[HMDUserActivityReport initWithUser:withReason:changedTimestamp:lastUpdateTimestamp:](&v9, sel_initWithUser_withReason_changedTimestamp_lastUpdateTimestamp_, a3, a5, a6, a7);
  if (result)
    result->_state = a4;
  return result;
}

- (id)initFromMessagePayload:(id)a3 withUser:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  HMDUserActivityType4Report *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("HAS.V.UV"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDUserActivityType4Report;
    v9 = -[HMDUserActivityReport initFromMessagePayload:withUser:](&v12, sel_initFromMessagePayload_withUser_, v6, v7);
    if (v9)
      v9[5] = objc_msgSend(v8, "integerValue");
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v10.receiver = self,
        v10.super_class = (Class)HMDUserActivityType4Report,
        -[HMDUserActivityReport isEqual:](&v10, sel_isEqual_, v6)))
  {
    v7 = -[HMDUserActivityType4Report state](self, "state");
    v8 = v7 == objc_msgSend(v6, "state");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)contributorType
{
  return 4;
}

- (id)serializedRemoteMessagePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDUserActivityType4Report;
  -[HMDUserActivityReport serializedRemoteMessagePayload](&v8, sel_serializedRemoteMessagePayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityType4Report state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("HAS.V.UV"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (id)copyReportWithChangedTimestamp:(id)a3
{
  id v4;
  HMDUserActivityType4Report *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  HMDUserActivityType4Report *v10;

  v4 = a3;
  v5 = [HMDUserActivityType4Report alloc];
  -[HMDUserActivityReport user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDUserActivityType4Report state](self, "state");
  v8 = -[HMDUserActivityReport reason](self, "reason");
  -[HMDUserActivityReport lastUpdateTimestamp](self, "lastUpdateTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDUserActivityType4Report initWithUser:state:withReason:changedTimestamp:lastUpdateTimestamp:](v5, "initWithUser:state:withReason:changedTimestamp:lastUpdateTimestamp:", v6, v7, v8, v4, v9);

  return v10;
}

- (id)copyReportWithLastUpdateTimestamp:(id)a3 reason:(unint64_t)a4
{
  id v6;
  HMDUserActivityType4Report *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  HMDUserActivityType4Report *v11;

  v6 = a3;
  v7 = [HMDUserActivityType4Report alloc];
  -[HMDUserActivityReport user](self, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDUserActivityType4Report state](self, "state");
  -[HMDUserActivityReport changedTimestamp](self, "changedTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDUserActivityType4Report initWithUser:state:withReason:changedTimestamp:lastUpdateTimestamp:](v7, "initWithUser:state:withReason:changedTimestamp:lastUpdateTimestamp:", v8, v9, a4, v10, v6);

  return v11;
}

- (unint64_t)state
{
  return self->_state;
}

@end
