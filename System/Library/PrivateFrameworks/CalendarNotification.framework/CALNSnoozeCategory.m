@implementation CALNSnoozeCategory

- (CALNSnoozeCategory)initWithSuffix:(id)a3 timedExpirationInterval:(double)a4 leeway:(double)a5 relativeToEnd:(BOOL)a6 validForAllDay:(BOOL)a7 actions:(id)a8
{
  id v15;
  id v16;
  CALNSnoozeCategory *v17;
  CALNSnoozeCategory *v18;
  objc_super v20;

  v15 = a3;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)CALNSnoozeCategory;
  v17 = -[CALNSnoozeCategory init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_suffix, a3);
    v18->_timedExpirationInterval = a4;
    v18->_leeway = a5;
    v18->_relativeToEnd = a6;
    v18->_validForAllDay = a7;
    objc_storeStrong((id *)&v18->_actions, a8);
  }

  return v18;
}

- (id)expirationDateForEventWithStartDate:(id)a3 endDate:(id)a4 isAllDay:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  double timedExpirationInterval;
  void *v12;
  double v13;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5 || (timedExpirationInterval = self->_timedExpirationInterval, timedExpirationInterval == -1000000000.0))
  {
    v12 = 0;
  }
  else
  {
    v13 = -timedExpirationInterval;
    if (!self->_relativeToEnd)
      v9 = v8;
    objc_msgSend(v9, "dateByAddingTimeInterval:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)snoozeCategoryForEventWithStartDate:(id)a3 endDate:(id)a4 now:(id)a5 isAllDay:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  double v24;
  _BOOL4 v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1, "snoozeCategories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v12);
  v15 = v14;
  objc_msgSend(v11, "timeIntervalSinceDate:", v12);
  v17 = v16;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = v13;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (v6)
        {
          if (*(_BYTE *)(v23 + 17))
            goto LABEL_17;
        }
        else
        {
          v24 = *(double *)(v23 + 8);
          if (v24 == -1000000000.0 || (*(_BYTE *)(v23 + 16) ? (v25 = v17 <= v24) : (v25 = v15 <= v24), !v25))
          {
LABEL_17:
            v26 = (id)v23;
            goto LABEL_18;
          }
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v20)
        continue;
      break;
    }
  }
  v26 = 0;
LABEL_18:

  return v26;
}

+ (id)snoozeCategories
{
  if (snoozeCategories_onceToken != -1)
    dispatch_once(&snoozeCategories_onceToken, &__block_literal_global_23);
  return (id)snoozeCategories_categories;
}

void __38__CALNSnoozeCategory_snoozeCategories__block_invoke()
{
  CALNSnoozeCategory *v0;
  CALNSnoozeCategory *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v0 = [CALNSnoozeCategory alloc];
  v1 = -[CALNSnoozeCategory initWithSuffix:timedExpirationInterval:leeway:relativeToEnd:validForAllDay:actions:](v0, "initWithSuffix:timedExpirationInterval:leeway:relativeToEnd:validForAllDay:actions:", &stru_24D4856D0, 0, 1, MEMORY[0x24BDBD1A8], -1000000000.0, 0.0);
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)snoozeCategories_categories;
  snoozeCategories_categories = v2;

}

- (NSString)suffix
{
  return self->_suffix;
}

- (NSArray)actions
{
  return self->_actions;
}

- (double)leeway
{
  return self->_leeway;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
}

@end
