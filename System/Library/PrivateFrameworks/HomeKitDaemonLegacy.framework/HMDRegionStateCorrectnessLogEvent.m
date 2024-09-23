@implementation HMDRegionStateCorrectnessLogEvent

- (HMDRegionStateCorrectnessLogEvent)initWithReason:(unint64_t)a3 firstAccessoryReachable:(BOOL)a4 regionStateAtHome:(int64_t)a5 regionStateNearByHome:(int64_t)a6 isStateCorrect:(BOOL)a7
{
  HMDRegionStateCorrectnessLogEvent *result;
  BOOL v12;
  BOOL v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HMDRegionStateCorrectnessLogEvent;
  result = -[HMMLogEvent init](&v14, sel_init, a3);
  if (result)
  {
    if (a5)
      v12 = a6 == 0;
    else
      v12 = 1;
    v13 = v12;
    result->_firstAccessoryReachable = a4;
    result->_regionStateAtHome = a5 == 1;
    result->_regionStateNearByHome = a6 == 1;
    result->_regionStateUnknown = v13;
    result->_isStateCorrect = a7;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.regionStateCorrectness");
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
  void *v13;
  void *v14;
  _QWORD v16[11];
  _QWORD v17[12];

  v17[11] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("firstAccessoryReachable_INT");
  if (-[HMDRegionStateCorrectnessLogEvent firstAccessoryReachable](self, "firstAccessoryReachable"))
    v3 = &unk_1E8B35118;
  else
    v3 = &unk_1E8B35130;
  v17[0] = v3;
  v16[1] = CFSTR("firstAccessoryReachable_BOOL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDRegionStateCorrectnessLogEvent firstAccessoryReachable](self, "firstAccessoryReachable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  v16[2] = CFSTR("regionStateAtHome_INT");
  if (-[HMDRegionStateCorrectnessLogEvent regionStateAtHome](self, "regionStateAtHome"))
    v5 = &unk_1E8B35118;
  else
    v5 = &unk_1E8B35130;
  v17[2] = v5;
  v16[3] = CFSTR("regionStateAtHome_BOOL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDRegionStateCorrectnessLogEvent regionStateAtHome](self, "regionStateAtHome"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v6;
  v16[4] = CFSTR("regionStateNearByHome_INT");
  if (-[HMDRegionStateCorrectnessLogEvent regionStateNearByHome](self, "regionStateNearByHome"))
    v7 = &unk_1E8B35118;
  else
    v7 = &unk_1E8B35130;
  v17[4] = v7;
  v16[5] = CFSTR("regionStateNearByHome_BOOL");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDRegionStateCorrectnessLogEvent regionStateNearByHome](self, "regionStateNearByHome"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v8;
  v16[6] = CFSTR("regionStateUnknown_INT");
  if (-[HMDRegionStateCorrectnessLogEvent regionStateUnknown](self, "regionStateUnknown"))
    v9 = &unk_1E8B35118;
  else
    v9 = &unk_1E8B35130;
  v17[6] = v9;
  v16[7] = CFSTR("regionStateUnknown_Bool");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDRegionStateCorrectnessLogEvent regionStateUnknown](self, "regionStateUnknown"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v10;
  v16[8] = CFSTR("isStateCorrect_INT");
  if (-[HMDRegionStateCorrectnessLogEvent isStateCorrect](self, "isStateCorrect"))
    v11 = &unk_1E8B35118;
  else
    v11 = &unk_1E8B35130;
  v17[8] = v11;
  v16[9] = CFSTR("isStateCorrect_Bool");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDRegionStateCorrectnessLogEvent isStateCorrect](self, "isStateCorrect"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v12;
  v16[10] = CFSTR("isStateIncorrect_INT");
  if (-[HMDRegionStateCorrectnessLogEvent isStateCorrect](self, "isStateCorrect"))
    v13 = &unk_1E8B35130;
  else
    v13 = &unk_1E8B35118;
  v17[10] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v14;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (BOOL)firstAccessoryReachable
{
  return self->_firstAccessoryReachable;
}

- (BOOL)regionStateAtHome
{
  return self->_regionStateAtHome;
}

- (BOOL)regionStateNearByHome
{
  return self->_regionStateNearByHome;
}

- (BOOL)regionStateUnknown
{
  return self->_regionStateUnknown;
}

- (BOOL)isStateCorrect
{
  return self->_isStateCorrect;
}

+ (id)updateWithFirstAccessory:(int64_t)a3 nearbyHome:(int64_t)a4
{
  uint64_t v4;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  if (a3 == 1 && a4 == 1)
    goto LABEL_3;
  if (a3 == 1 && a4 == 2 || a3 == 1 && !a4)
    goto LABEL_8;
  if (a3 == 2 && a4 == 1)
  {
LABEL_3:
    v4 = 1;
    return -[HMDRegionStateCorrectnessLogEvent initWithReason:firstAccessoryReachable:regionStateAtHome:regionStateNearByHome:isStateCorrect:]([HMDRegionStateCorrectnessLogEvent alloc], "initWithReason:firstAccessoryReachable:regionStateAtHome:regionStateNearByHome:isStateCorrect:", 0, 1, a3, a4, v4);
  }
  v6 = a4 == 2 || a4 == 0;
  v7 = v6;
  if (a3 == 2 && v7 || !a3 && a4 == 1)
  {
LABEL_8:
    v4 = 0;
    return -[HMDRegionStateCorrectnessLogEvent initWithReason:firstAccessoryReachable:regionStateAtHome:regionStateNearByHome:isStateCorrect:]([HMDRegionStateCorrectnessLogEvent alloc], "initWithReason:firstAccessoryReachable:regionStateAtHome:regionStateNearByHome:isStateCorrect:", 0, 1, a3, a4, v4);
  }
  if (a3)
    v8 = 0;
  else
    v8 = a4 == 2;
  v4 = !v8 && (a4 | a3) == 0;
  return -[HMDRegionStateCorrectnessLogEvent initWithReason:firstAccessoryReachable:regionStateAtHome:regionStateNearByHome:isStateCorrect:]([HMDRegionStateCorrectnessLogEvent alloc], "initWithReason:firstAccessoryReachable:regionStateAtHome:regionStateNearByHome:isStateCorrect:", 0, 1, a3, a4, v4);
}

+ (id)updateWithRegion:(int64_t)a3 nearbyHome:(int64_t)a4 accessoryReachable:(BOOL)a5
{
  uint64_t v5;
  BOOL v7;

  if (a3 == 1 && a4 == 1)
    goto LABEL_3;
  if (a3 == 1 && a4 == 2 || a3 == 1 && !a4)
    goto LABEL_8;
  if (a3 == 2 && (unint64_t)(a4 - 1) < 2)
  {
LABEL_3:
    v5 = 1;
    return -[HMDRegionStateCorrectnessLogEvent initWithReason:firstAccessoryReachable:regionStateAtHome:regionStateNearByHome:isStateCorrect:]([HMDRegionStateCorrectnessLogEvent alloc], "initWithReason:firstAccessoryReachable:regionStateAtHome:regionStateNearByHome:isStateCorrect:", 1, a5, a3, a4, v5);
  }
  if (a3 == 2 && !a4 || !a3 && a4 == 1)
  {
LABEL_8:
    v5 = 0;
    return -[HMDRegionStateCorrectnessLogEvent initWithReason:firstAccessoryReachable:regionStateAtHome:regionStateNearByHome:isStateCorrect:]([HMDRegionStateCorrectnessLogEvent alloc], "initWithReason:firstAccessoryReachable:regionStateAtHome:regionStateNearByHome:isStateCorrect:", 1, a5, a3, a4, v5);
  }
  if (a3)
    v7 = 0;
  else
    v7 = a4 == 2;
  v5 = !v7 && (a4 | a3) == 0;
  return -[HMDRegionStateCorrectnessLogEvent initWithReason:firstAccessoryReachable:regionStateAtHome:regionStateNearByHome:isStateCorrect:]([HMDRegionStateCorrectnessLogEvent alloc], "initWithReason:firstAccessoryReachable:regionStateAtHome:regionStateNearByHome:isStateCorrect:", 1, a5, a3, a4, v5);
}

@end
