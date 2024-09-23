@implementation _ATXNotificationGroupBaseRanker

- (id)_initialGroupComparisonValue:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "isCommunicationGroup");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
}

- (int64_t)compareGroups:(id)a3 group2:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[_ATXNotificationGroupBaseRanker _initialGroupComparisonValue:](self, "_initialGroupComparisonValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXNotificationGroupBaseRanker _initialGroupComparisonValue:](self, "_initialGroupComparisonValue:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  if (!v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "priority");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "priority");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "compare:", v14);

  }
  return v10;
}

- (id)rankNotificationGroups:(id)a3 modeId:(id)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65___ATXNotificationGroupBaseRanker_rankNotificationGroups_modeId___block_invoke;
  v5[3] = &unk_1E4D5BE48;
  v5[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)rankerId
{
  return CFSTR("_ATXNotificationGroupBaseRanker");
}

@end
