@implementation HMDUserActivityType3ScheduleFactory

- (id)scheduleFromBiomeEvent:(id)a3
{
  id v3;
  void *v4;
  HMDUserActivityType3Schedule *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  id v12;
  void *v13;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "eventBody");
    v5 = (HMDUserActivityType3Schedule *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "eventBody");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "state") - 2;
      if (v7 > 3)
        v8 = 0;
      else
        v8 = qword_2226A09C8[v7];

      objc_msgSend(v4, "eventBody");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "changeReason") - 1;
      if (v10 > 5)
        v11 = 0;
      else
        v11 = qword_2226A09E8[v10];

      v12 = objc_alloc(MEMORY[0x24BDBCE60]);
      objc_msgSend(v4, "timestamp");
      v13 = (void *)objc_msgSend(v12, "initWithTimeIntervalSinceReferenceDate:");
      v5 = -[HMDUserActivityType3Schedule initWithState:stateChangedReason:stateChangedTime:]([HMDUserActivityType3Schedule alloc], "initWithState:stateChangedReason:stateChangedTime:", v8, v11, v13);
      -[HMDUserActivityType3Schedule setBiomeEvent:](v5, "setBiomeEvent:", v4);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
