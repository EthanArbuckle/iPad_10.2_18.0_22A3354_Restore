@implementation HMDUserActivityHomeAwayReport

- (HMDUserActivityHomeAwayReport)initWithUser:(id)a3 state:(unint64_t)a4 fromDevice:(id)a5 reason:(unint64_t)a6
{
  return -[HMDUserActivityHomeAwayReport initWithUser:state:fromDevice:reason:changedTimestamp:lastUpdatedTimeStamp:](self, "initWithUser:state:fromDevice:reason:changedTimestamp:lastUpdatedTimeStamp:", a3, a4, a5, a6, 0, 0);
}

- (HMDUserActivityHomeAwayReport)initWithUser:(id)a3 state:(unint64_t)a4 fromDevice:(id)a5 reason:(unint64_t)a6 changedTimestamp:(id)a7 lastUpdatedTimeStamp:(id)a8
{
  id v15;
  HMDUserActivityHomeAwayReport *v16;
  HMDUserActivityHomeAwayReport *v17;
  objc_super v19;

  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDUserActivityHomeAwayReport;
  v16 = -[HMDUserActivityReport initWithUser:withReason:changedTimestamp:lastUpdateTimestamp:](&v19, sel_initWithUser_withReason_changedTimestamp_lastUpdateTimestamp_, a3, a6, a7, a8);
  v17 = v16;
  if (v16)
  {
    v16->_state = a4;
    objc_storeStrong((id *)&v16->_sourceDevice, a5);
  }

  return v17;
}

- (id)initFromMessagePayload:(id)a3 withUser:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  HMDUserActivityHomeAwayReport *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("HAS.HA.S"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDUserActivityHomeAwayReport;
    v9 = -[HMDUserActivityReport initFromMessagePayload:withUser:](&v12, sel_initFromMessagePayload_withUser_, v6, v7);
    if (v9)
      v9[5] = objc_msgSend(v8, "unsignedIntValue");
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
        v10.super_class = (Class)HMDUserActivityHomeAwayReport,
        -[HMDUserActivityReport isEqual:](&v10, sel_isEqual_, v6)))
  {
    v7 = -[HMDUserActivityHomeAwayReport state](self, "state");
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
  return 1;
}

- (id)serializedRemoteMessagePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDUserActivityHomeAwayReport;
  -[HMDUserActivityReport serializedRemoteMessagePayload](&v8, sel_serializedRemoteMessagePayload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDUserActivityHomeAwayReport state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("HAS.HA.S"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (id)copyReportWithChangedTimestamp:(id)a3
{
  id v4;
  HMDUserActivityHomeAwayReport *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  HMDUserActivityHomeAwayReport *v11;

  v4 = a3;
  v5 = [HMDUserActivityHomeAwayReport alloc];
  -[HMDUserActivityReport user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDUserActivityHomeAwayReport state](self, "state");
  -[HMDUserActivityHomeAwayReport sourceDevice](self, "sourceDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDUserActivityReport reason](self, "reason");
  -[HMDUserActivityReport lastUpdateTimestamp](self, "lastUpdateTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDUserActivityHomeAwayReport initWithUser:state:fromDevice:reason:changedTimestamp:lastUpdatedTimeStamp:](v5, "initWithUser:state:fromDevice:reason:changedTimestamp:lastUpdatedTimeStamp:", v6, v7, v8, v9, v4, v10);

  return v11;
}

- (id)copyReportWithLastUpdateTimestamp:(id)a3 reason:(unint64_t)a4
{
  id v6;
  HMDUserActivityHomeAwayReport *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  HMDUserActivityHomeAwayReport *v12;

  v6 = a3;
  v7 = [HMDUserActivityHomeAwayReport alloc];
  -[HMDUserActivityReport user](self, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDUserActivityHomeAwayReport state](self, "state");
  -[HMDUserActivityHomeAwayReport sourceDevice](self, "sourceDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityReport changedTimestamp](self, "changedTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDUserActivityHomeAwayReport initWithUser:state:fromDevice:reason:changedTimestamp:lastUpdatedTimeStamp:](v7, "initWithUser:state:fromDevice:reason:changedTimestamp:lastUpdatedTimeStamp:", v8, v9, v10, a4, v11, v6);

  return v12;
}

- (unint64_t)state
{
  return self->_state;
}

- (HMDDevice)sourceDevice
{
  return self->_sourceDevice;
}

- (void)setSourceDevice:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDevice, 0);
}

@end
