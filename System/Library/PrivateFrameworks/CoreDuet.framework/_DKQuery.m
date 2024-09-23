@implementation _DKQuery

- (NSString)clientName
{
  return self->_clientName;
}

+ (id)predicateForSpotlightEventsWithBundleID:(uint64_t)a1
{
  void *v2;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  v25 = a2;
  objc_opt_self();
  +[_DKSystemEventStreams appActivityStream](_DKSystemEventStreams, "appActivityStream");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v23;
  +[_DKSystemEventStreams appIntentsStream](_DKSystemEventStreams, "appIntentsStream");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v2;
  +[_DKSystemEventStreams appLocationActivityStream](_DKSystemEventStreams, "appLocationActivityStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v4;
  +[_CDPortraitStreams entityStream](_CDPortraitStreams, "entityStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v6;
  +[_CDPortraitStreams topicStream](_CDPortraitStreams, "topicStream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v8;
  +[_DKSystemEventStreams safariHistoryStream](_DKSystemEventStreams, "safariHistoryStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForEventsWithStreamNames:](_DKQuery, "predicateForEventsWithStreamNames:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3880];
  +[_DKSource intentsSourceID](_DKSource, "intentsSourceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v13;
  +[_DKSource spotlightSourceID](_DKSource, "spotlightSourceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithFormat:", CFSTR("source.bundleID == %@ AND source.sourceID IN %@"), v25, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB3528];
  v26[0] = v21;
  v26[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "andPredicateWithSubpredicates:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)predicateForEventsWithStreamNames:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(streamName IN %@)"), a3);
}

+ (id)predicateForEventsWithStreamName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(streamName == %@)"), a3);
}

+ (id)predicateForEventsWithStringValue:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("(valueInteger = %@ AND valueString = %@)"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForEventsWithSourceID:(id)a3 bundleID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    objc_msgSend(a1, "predicateForEventsWithBundleID:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3528];
    v14[0] = v7;
    objc_msgSend(a1, "predicateForEventsWithSourceID:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "andPredicateWithSubpredicates:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  else
  {
    objc_msgSend(a1, "predicateForEventsWithSourceID:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
}

+ (id)predicateForEventsWithSourceID:(id)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source.sourceID = %@"), a3);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForEventsWithBundleID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source.bundleID = %@"), a3);
}

+ (id)predicateForSpotlightEventsWithDomainIdentifiers:(void *)a3 bundleID:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a2;
  objc_opt_self();
  +[_DKQuery predicateForSpotlightEventsWithBundleID:]((uint64_t)_DKQuery, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKQuery predicateForEventsWithSourceGroupIDs:](_DKQuery, "predicateForEventsWithSourceGroupIDs:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  v12[0] = v6;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateForEventsWithSourceGroupIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = v3;
    obj = v3;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    v7 = 0x1E0CB3000uLL;
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(obj);
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source.groupID BEGINSWITH %@"), *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          if ((unint64_t)objc_msgSend(v5, "count") >= 0x385)
          {
            objc_msgSend(*(id *)(v7 + 1320), "orPredicateWithSubpredicates:", v5);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v13 = v4;
            v14 = v7;
            v15 = objc_claimAutoreleasedReturnValue();

            v5 = (void *)v15;
            v7 = v14;
            v4 = v13;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(*(id *)(v7 + 1320), "orPredicateWithSubpredicates:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v16);

    }
    objc_msgSend(*(id *)(v7 + 1320), "orPredicateWithSubpredicates:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tracker, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

+ (id)predicateForEventsWithNullSourceDeviceID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source == NULL || source.deviceID == NULL"));
}

- (id)tracker
{
  return objc_getProperty(self, a2, 24, 1);
}

- (BOOL)executeConcurrently
{
  return self->_executeConcurrently;
}

+ (id)executableQueryForQuery:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE0EDA48))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)setExecuteConcurrently:(BOOL)a3
{
  self->_executeConcurrently = a3;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (_DKQuery)initWithCoder:(id)a3
{
  id v4;
  _DKQuery *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DKQuery;
  v5 = -[_DKQuery init](&v9, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      _CDCurrentOrXPCProcessName();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKQuery setClientName:](v5, "setClientName:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DKQuery setClientName:](v5, "setClientName:", v7);

    }
    -[_DKQuery setExecuteConcurrently:](v5, "setExecuteConcurrently:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("executeConcurrently")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[_DKQuery executeConcurrently](self, "executeConcurrently"), CFSTR("executeConcurrently"));

}

+ (id)predicateForEventsWithIntegerValue:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("valueInteger = %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForEventsExcludingIntegerValue:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("valueInteger != %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForObjectWithUUID:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "predicateWithFormat:", CFSTR("(uuidHash == %@ AND uuid == %@)"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForObjectsWithUUIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "hash"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v14);

        objc_msgSend(v11, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(uuidHash IN %@ AND uuid IN %@)"), v4, v5, (_QWORD)v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)predicateForEventsWithStartDateAfter:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate >= %@)"), a3);
}

+ (id)predicateForEventsWithStartInDateRangeFrom:(id)a3 to:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((startDate >= %@) AND (startDate <= %@))"), a3, a4);
}

+ (id)predicateForEventsWithStartInDateRangeFromAfter:(id)a3 to:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((startDate > %@) AND (startDate <= %@))"), a3, a4);
}

+ (id)predicateForEventsWithEndInDateRangeFrom:(id)a3 to:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((endDate >= %@) AND (endDate <= %@))"), a3, a4);
}

+ (id)predicateForEventsWithStartOrEndInDateRangeWithFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "predicateForEventsWithStartInDateRangeFrom:to:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForEventsWithEndInDateRangeFrom:to:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  v14[0] = v8;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "orPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)predicateForEventsWithStartAndEndInDateRangeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "predicateForEventsWithStartInDateRangeFrom:to:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForEventsWithEndInDateRangeFrom:to:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  v14[0] = v8;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)predicateForEventsWithStartDateOrCreationDateBefore:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate < %@ OR startDate < %@"), a3, a3);
}

+ (id)predicateForEventsContainingDateRangeFrom:(id)a3 to:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((startDate <= %@) AND (endDate >= %@))"), a3, a4);
}

+ (id)predicateForEventsIntersectingDateRangeFrom:(id)a3 to:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((startDate <= %@) AND (endDate >= %@))"), a4, a3);
}

+ (id)predicateForEventsWithDayOfWeek:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDayOfWeek == %@ || endDayOfWeek == %@)"), v3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(endDayOfWeek > startDayOfWeek AND  startDayOfWeek < %@ AND  endDayOfWeek > %@)"), v3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(endDayOfWeek < startDayOfWeek AND  startDayOfWeek > %@ AND endDayOfWeek < %@)"), v3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForEventsBetweenStartSecondOfDay:(unint64_t)a3 endSecondOfDay:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startSecondOfDay >= %@ AND startSecondOfDay <= %@) OR  (endSecondOfDay >= %@ AND endSecondOfDay <= %@)"), v5, v6, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForEventsWithMinimumDuration:(double)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("((endDate.timeIntervalSinceReferenceDate - startDate.timeIntervalSinceReferenceDate) >= %@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForEventsWithLocalCreationInDateRangeFrom:(id)a3 toBefore:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((localCreationDate >= %@) AND (localCreationDate < %@))"), a3, a4);
}

+ (id)predicateForEventsWithLocalCreationInDateRangeFromAfter:(id)a3 to:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((localCreationDate > %@) AND (localCreationDate <= %@))"), a3, a4);
}

+ (id)localCreationDateSortDescriptorAscending:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localCreationDate"), a3);
}

+ (id)predicateForEventsWithCreationInDateRangeFrom:(id)a3 toBefore:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((creationDate >= %@) AND (creationDate < %@))"), a3, a4);
}

+ (id)predicateForEventsWithCreationInDateRangeFromAfter:(id)a3 to:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((creationDate > %@) AND (creationDate <= %@))"), a3, a4);
}

+ (id)predicateForEventsWithCategoryValue:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForEventsWithIntegerValue:", objc_msgSend(a3, "integerValue"));
}

+ (id)predicateForEventsWithIdentifierValue:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForEventsWithStringValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForEventsWithQuantityValue:(id)a3
{
  objc_msgSend(a3, "doubleValue");
  return (id)objc_msgSend(a1, "predicateForEventsWithDoubleValue:");
}

+ (id)predicateForEventsWithDoubleValue:(double)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("valueDouble = %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForEventsWithDoubleValueBetween:(double)a3 and:(double)a4
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3 >= a4)
    v4 = a4;
  else
    v4 = a3;
  if (a3 >= a4)
    v5 = a3;
  else
    v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 > 2.22507386e-308)
  {
    v7 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("valueDouble >= %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
  if (v5 < 1.79769313e308)
  {
    v10 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("valueDouble <= %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);

  }
  if (objc_msgSend(v6, "count"))
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)predicateForEventsWithStringValueInValues:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "hash"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(valueInteger IN %@ AND valueString IN %@)"), v5, v6, (_QWORD)v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)structuredMetadataKeyPathForMetadataKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3
    && (+[_DKMetadataPersistenceLookupTable keyToAttribute](),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKeyedSubscript:", v3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("structuredMetadata.%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "structuredMetadataKeyPathForMetadataKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), v5);
    else
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY customMetadata.name = %@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)predicateForObjectsWithStructuredMetadataKey:(void *)a3 andValue:
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_self();
  if (v4
    && (objc_msgSend(v6, "structuredMetadataKeyPathForMetadataKey:", v4), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    if (v5)
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), v7, v5);
    else
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 andValue:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  +[_DKQuery predicateForObjectsWithStructuredMetadataKey:andValue:]((uint64_t)_DKQuery, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[_DKQuery predicateForObjectsWithMetadataKey:andValue:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

  }
  return v6;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 inValues:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(a1, "structuredMetadataKeyPathForMetadataKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), v9, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[_DKQuery predicateForObjectsWithMetadataKey:andValue:].cold.1((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);

      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 andStringValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[_DKQuery predicateForObjectsWithStructuredMetadataKey:andValue:]((uint64_t)a1, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8
    || (objc_msgSend(a1, "predicateForObjectsWithMetadataKey:", v6), v8 = (id)objc_claimAutoreleasedReturnValue(), !v7))
  {
    v8 = v8;
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3880];
    v11 = (void *)MEMORY[0x1E0CB3940];
    +[_CDHashUtilities md5ForString:](_CDHashUtilities, "md5ForString:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@S"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("ANY customMetadata.valueHash == %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3528];
    v18[0] = v8;
    v18[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 likeStringValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "structuredMetadataKeyPathForMetadataKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K LIKE %@"), v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[_DKQuery predicateForObjectsWithMetadataKey:andValue:].cold.1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

    v9 = 0;
  }

  return v9;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 andIntegerValue:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForObjectsWithStructuredMetadataKey:andValue:]((uint64_t)a1, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8
    || (objc_msgSend(a1, "predicateForObjectsWithMetadataKey:", v6), v8 = (id)objc_claimAutoreleasedReturnValue(), !a4))
  {
    v8 = v8;
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3880];
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@I"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("ANY customMetadata.valueHash == %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3528];
    v18[0] = v14;
    v18[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 andDoubleValue:(double)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKQuery predicateForObjectsWithStructuredMetadataKey:andValue:]((uint64_t)a1, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8
    || (objc_msgSend(a1, "predicateForObjectsWithMetadataKey:", v6),
        v8 = (id)objc_claimAutoreleasedReturnValue(),
        a4 == 0.0))
  {
    v8 = v8;
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3880];
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@D"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("ANY customMetadata.valueHash = %@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3528];
    v18[0] = v14;
    v18[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)predicateForObjectsWithMetadataKey:(id)a3 andDoubleValueBetween:(double)a4 andValue:(double)a5
{
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "predicateForObjectsWithMetadataKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 >= a5)
    v10 = a5;
  else
    v10 = a4;
  if (a4 >= a5)
    a5 = a4;
  objc_msgSend(a1, "structuredMetadataKeyPathForMetadataKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 <= 2.22507386e-308)
  {
    v15 = 0;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (!v11)
    {
      objc_msgSend(v12, "predicateWithFormat:", CFSTR("ANY customMetadata.doubleValue >= %@"), v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (a5 < 1.79769313e308)
        goto LABEL_14;
LABEL_18:
      if (v15)
      {
        v19 = 0;
LABEL_21:
        v20 = (void *)MEMORY[0x1E0CB3528];
        v31[0] = v9;
        v31[1] = v15;
        v21 = (void *)MEMORY[0x1E0C99D20];
        v22 = v31;
        v23 = 2;
        goto LABEL_22;
      }
LABEL_25:
      v25 = v9;
      goto LABEL_26;
    }
    objc_msgSend(v12, "predicateWithFormat:", CFSTR("%K >= %@"), v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a5 >= 1.79769313e308)
    goto LABEL_18;
  if (!v11)
  {
LABEL_14:
    v18 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "predicateWithFormat:", CFSTR("ANY customMetadata.doubleValue <= %@"), v17, v29);
    goto LABEL_15;
  }
  v16 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateWithFormat:", CFSTR("%K <= %@"), v11, v17);
LABEL_15:
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15 || !v19)
  {
    if (v15)
      goto LABEL_21;
    if (v19)
    {
      v26 = (void *)MEMORY[0x1E0CB3528];
      v30[0] = v9;
      v30[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "andPredicateWithSubpredicates:", v27);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_26;
    }
    goto LABEL_25;
  }
  v20 = (void *)MEMORY[0x1E0CB3528];
  v32[0] = v9;
  v32[1] = v15;
  v32[2] = v19;
  v21 = (void *)MEMORY[0x1E0C99D20];
  v22 = v32;
  v23 = 3;
LABEL_22:
  objc_msgSend(v21, "arrayWithObjects:count:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "andPredicateWithSubpredicates:", v24);
  v25 = (id)objc_claimAutoreleasedReturnValue();

LABEL_26:
  return v25;
}

+ (id)startDateSortDescriptorAscending:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), a3);
}

+ (id)endDateSortDescriptorAscending:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), a3);
}

+ (id)creationDateSortDescriptorAscending:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), a3);
}

+ (id)predicateForEventsWithSourceID:(id)a3 bundleID:(id)a4 groupIDs:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(a1, "predicateForEventsWithSourceID:bundleID:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    +[_DKQuery predicateForEventsWithSourceGroupIDs:](_DKQuery, "predicateForEventsWithSourceGroupIDs:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3528];
    v15[0] = v9;
    v15[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v9;
  }

  return v13;
}

+ (id)predicateForEventsWithSourceID:(id)a3 bundleID:(id)a4 itemIDs:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v8 = (void *)MEMORY[0x1E0CB3880];
    v9 = a4;
    v10 = a3;
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("source.itemID IN %@"), a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3528];
    v20[0] = v11;
    objc_msgSend(a1, "predicateForEventsWithSourceID:bundleID:", v10, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v20[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
  else
  {
    v17 = a4;
    v18 = a3;
    objc_msgSend(a1, "predicateForEventsWithSourceID:bundleID:", v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    return v19;
  }
}

+ (id)predicateForEventsWithSourceDeviceIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "UUIDString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source.deviceID IN %@"), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)predicateForEventsWithNoSource
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("source == NULL"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)queryNotExecutableError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Query is not executable");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduet.knowledge"), 3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setTracker:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

+ (id)predicateForSpotlightEventsWithItemIdentifiers:(void *)a3 bundleID:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = (void *)MEMORY[0x1E0CB3880];
  +[_DKSource intentsSourceID](_DKSource, "intentsSourceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v7;
  +[_DKSource spotlightSourceID](_DKSource, "spotlightSourceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("source.itemID IN %@ AND source.bundleID == %@ AND source.sourceID IN %@"), v4, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v10, 0);
  v12 = 0x1E0CB3000;
  if (v4 && v5 && objc_msgSend(v4, "count"))
  {
    +[_DKSystemEventStreams appActivityStream](_DKSystemEventStreams, "appActivityStream");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v14;
    +[_DKSystemEventStreams appLocationActivityStream](_DKSystemEventStreams, "appLocationActivityStream");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    +[_DKQuery predicateForEventsWithStreamNames:](_DKQuery, "predicateForEventsWithStreamNames:", v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForEventsWithStringValue:](_DKQuery, "predicateForEventsWithStringValue:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKApplicationActivityMetadataKey itemRelatedUniqueIdentifier](_DKApplicationActivityMetadataKey, "itemRelatedUniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKQuery predicateForObjectsWithMetadataKey:inValues:](_DKQuery, "predicateForObjectsWithMetadataKey:inValues:", v19, v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3528];
    v27[0] = v17;
    v27[1] = v18;
    v27[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "andPredicateWithSubpredicates:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0x1E0CB3000uLL;
    objc_msgSend(v11, "addObject:", v23);

  }
  objc_msgSend(*(id *)(v12 + 1320), "orPredicateWithSubpredicates:", v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)predicateForSpotlightEventsWithBundleID:(void *)a3 sinceDate:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a2;
  objc_opt_self();
  +[_DKQuery predicateForSpotlightEventsWithBundleID:]((uint64_t)_DKQuery, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKQuery predicateForEventsWithStartDateAfter:](_DKQuery, "predicateForEventsWithStartDateAfter:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  v12[0] = v7;
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)predicateForObjectsWithMetadataKey:(uint64_t)a3 andValue:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DDBE000, a2, a3, "Invalid key provided to predicateForObjectsWithMetadataKey: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
