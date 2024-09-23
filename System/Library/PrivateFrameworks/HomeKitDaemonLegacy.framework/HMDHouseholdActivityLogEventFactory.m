@implementation HMDHouseholdActivityLogEventFactory

- (HMDHouseholdActivityLogEventFactory)initWithContributors:(id)a3
{
  id v5;
  HMDHouseholdActivityLogEventFactory *v6;
  HMDHouseholdActivityLogEventFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHouseholdActivityLogEventFactory;
  v6 = -[HMDHouseholdActivityLogEventFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contributors, a3);

  return v7;
}

- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  id v6;
  id v7;
  HMDHouseholdActivityLogEvent *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [HMDHouseholdActivityLogEvent alloc];
  -[HMDHouseholdActivityLogEventFactory contributors](self, "contributors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDHouseholdActivityLogEvent initPopulatedFromDate:homeUUID:contributors:](v8, "initPopulatedFromDate:homeUUID:contributors:", v6, v7, v9);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)serializeLogEvents:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "serializedMetric");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)logEventsFromDictionary:(id)a3
{
  id v4;
  HMDHouseholdActivityLogEvent *v5;
  void *v6;
  HMDHouseholdActivityLogEvent *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HMDHouseholdActivityLogEvent alloc];
  -[HMDHouseholdActivityLogEventFactory contributors](self, "contributors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDHouseholdActivityLogEvent initWithDictionary:contributors:](v5, "initWithDictionary:contributors:", v4, v6);

  if (v7)
  {
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        if (v16)
          objc_msgSend(v8, "addObject:", v16, (_QWORD)v21);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v11);
  }

  -[HMDHouseholdActivityLogEventFactory contributors](self, "contributors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHouseholdActivityLogEvent coalescedEventFromHouseholdActivityLogEvents:homeUUID:contributors:](HMDHouseholdActivityLogEvent, "coalescedEventFromHouseholdActivityLogEvents:homeUUID:contributors:", v8, v7, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDHouseholdActivityLogEventFactory contributors](self, "contributors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "deleteCountersBeforeDate:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDHouseholdActivityLogEventFactory contributors](self, "contributors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "deleteCountersAfterDate:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)contributors
{
  return self->_contributors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contributors, 0);
}

@end
