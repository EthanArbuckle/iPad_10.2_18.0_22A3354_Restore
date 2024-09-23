@implementation HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent

- (HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent)initWithEndedHomeCount:(id)a3 coreLocationCount:(id)a4 coreLocationEndedHomeCount:(id)a5 coreLocationEndedNonHome:(id)a6 coreLocationEndedNotMakingProgress:(id)a7 coreLocationResume:(id)a8 coreLocationEndDateUpdated:(id)a9 coreLocationVisitExit:(id)a10 coreLocationVisitEntry:(id)a11 maxCoreLocationStateEndOffset:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *v22;
  HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *v23;
  id obj;
  id v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  obj = a4;
  v33 = a4;
  v32 = a5;
  v26 = a6;
  v31 = a6;
  v30 = a7;
  v27 = a8;
  v29 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent;
  v22 = -[HMMLogEvent init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_endedHomeCount, a3);
    objc_storeStrong((id *)&v23->_coreLocationCount, obj);
    objc_storeStrong((id *)&v23->_coreLocationEndedHomeCount, a5);
    objc_storeStrong((id *)&v23->_coreLocationEndedNonHome, v26);
    objc_storeStrong((id *)&v23->_coreLocationEndedNotMakingProgress, a7);
    objc_storeStrong((id *)&v23->_coreLocationResume, v27);
    objc_storeStrong((id *)&v23->_coreLocationEndDateUpdated, a9);
    objc_storeStrong((id *)&v23->_coreLocationVisitExit, a10);
    objc_storeStrong((id *)&v23->_coreLocationVisitEntry, a11);
    objc_storeStrong((id *)&v23->_maxCoreLocationStateEndOffset, a12);
  }

  return v23;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.homed.HomeAS.HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent");
}

- (NSDictionary)coreAnalyticsEventDictionary
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
  _QWORD v14[9];
  _QWORD v15[11];

  v15[9] = *MEMORY[0x24BDAC8D0];
  -[HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent endedHomeCount](self, "endedHomeCount", CFSTR("endedHomeCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("coreLocationCount");
  -[HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent coreLocationCount](self, "coreLocationCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("coreLocationEndedHomeCount");
  -[HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent coreLocationEndedHomeCount](self, "coreLocationEndedHomeCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v5;
  v14[3] = CFSTR("coreLocationEndedNonHome");
  -[HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent coreLocationEndedNonHome](self, "coreLocationEndedNonHome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v6;
  v14[4] = CFSTR("coreLocationResume");
  -[HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent coreLocationResume](self, "coreLocationResume");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v7;
  v14[5] = CFSTR("coreLocationEndDateUpdated");
  -[HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent coreLocationEndDateUpdated](self, "coreLocationEndDateUpdated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v8;
  v14[6] = CFSTR("coreLocationVisitExit");
  -[HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent coreLocationVisitExit](self, "coreLocationVisitExit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v9;
  v14[7] = CFSTR("coreLocationVisitEntry");
  -[HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent coreLocationVisitEntry](self, "coreLocationVisitEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v10;
  v14[8] = CFSTR("maxCoreLocationStateEndOffset");
  -[HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent maxCoreLocationStateEndOffset](self, "maxCoreLocationStateEndOffset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSNumber)endedHomeCount
{
  return self->_endedHomeCount;
}

- (NSNumber)coreLocationCount
{
  return self->_coreLocationCount;
}

- (NSNumber)coreLocationEndedHomeCount
{
  return self->_coreLocationEndedHomeCount;
}

- (NSNumber)coreLocationEndedNonHome
{
  return self->_coreLocationEndedNonHome;
}

- (NSNumber)coreLocationEndedNotMakingProgress
{
  return self->_coreLocationEndedNotMakingProgress;
}

- (NSNumber)coreLocationResume
{
  return self->_coreLocationResume;
}

- (NSNumber)coreLocationEndDateUpdated
{
  return self->_coreLocationEndDateUpdated;
}

- (NSNumber)coreLocationVisitExit
{
  return self->_coreLocationVisitExit;
}

- (NSNumber)coreLocationVisitEntry
{
  return self->_coreLocationVisitEntry;
}

- (NSNumber)maxCoreLocationStateEndOffset
{
  return self->_maxCoreLocationStateEndOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxCoreLocationStateEndOffset, 0);
  objc_storeStrong((id *)&self->_coreLocationVisitEntry, 0);
  objc_storeStrong((id *)&self->_coreLocationVisitExit, 0);
  objc_storeStrong((id *)&self->_coreLocationEndDateUpdated, 0);
  objc_storeStrong((id *)&self->_coreLocationResume, 0);
  objc_storeStrong((id *)&self->_coreLocationEndedNotMakingProgress, 0);
  objc_storeStrong((id *)&self->_coreLocationEndedNonHome, 0);
  objc_storeStrong((id *)&self->_coreLocationEndedHomeCount, 0);
  objc_storeStrong((id *)&self->_coreLocationCount, 0);
  objc_storeStrong((id *)&self->_endedHomeCount, 0);
}

@end
