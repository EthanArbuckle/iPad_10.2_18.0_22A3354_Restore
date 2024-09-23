@implementation HMDLogEventWeekBasedFilter

- (HMDLogEventWeekBasedFilter)initWithDateProvider:(id)a3
{
  id v5;
  HMDLogEventWeekBasedFilter *v6;
  HMDLogEventWeekBasedFilter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLogEventWeekBasedFilter;
  v6 = -[HMDLogEventWeekBasedFilter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dateProvider, a3);

  return v7;
}

- (unint64_t)resultHashWithEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v18;
  uint64_t v19;

  v4 = (void *)MEMORY[0x24BDBCEC8];
  v5 = a3;
  objc_msgSend(v5, "sampledUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hm_convertToData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDLogEventWeekBasedFilter dateProvider](self, "dateProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startOfCurrentWeek");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");

  v19 = v11;
  objc_msgSend(v8, "appendBytes:length:", &v19, 8);
  objc_msgSend(v5, "sampledCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v13);

  objc_msgSend(v5, "sampledData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appendData:", v14);
  objc_msgSend(v8, "hm_generateSHA256");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v15, "getBytes:length:", &v18, 8);
  v16 = v18;

  return v16;
}

- (BOOL)isEventInSample:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v4, "enableEventFilterSpecifying"))
  {
    v5 = v4;
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_2557E2168))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      v8 = -[HMDLogEventWeekBasedFilter resultHashWithEvent:](self, "resultHashWithEvent:", v7) % 7 + 1;
      -[HMDLogEventWeekBasedFilter dateProvider](self, "dateProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "currentDayNumberOfWeek");

      v11 = v8 == v10;
    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
}

@end
