@implementation DKBiomeQuery

uint64_t __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "valueForKey:", CFSTR("dkEvent"));
}

void __40___DKBiomeQuery_executeBiomeQueryError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __40___DKBiomeQuery_executeBiomeQueryError___block_invoke_cold_1((uint64_t)v2, v3);

}

uint64_t __54___DKBiomeQuery_duetExclusiveStreamsFromEventStreams___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "canShimDuetStreamNamed:", v3) ^ 1;

  return v4;
}

uint64_t __55___DKBiomeQuery_biomeExclusiveStreamsFromEventStreams___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "canShimDuetStreamNamed:", v3);

  return v4;
}

id __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  NSUInteger v6;
  uint64_t v7;
  NSRange v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSRange v14;
  NSRange v15;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD **)(a1 + 32);
  if (v5[4] || v5[3])
  {
    v6 = objc_msgSend(v3, "count");
    v7 = *(_QWORD *)(a1 + 32);
    v14.length = *(_QWORD *)(v7 + 24);
    v14.location = *(_QWORD *)(v7 + 32);
    v15.location = 0;
    v15.length = v6;
    v8 = NSIntersectionRange(v14, v15);
    if (v8.length)
    {
      objc_msgSend(v4, "sortedArrayUsingDescriptors:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8.length == v6)
      {
        v11 = v9;
      }
      else
      {
        objc_msgSend(v9, "subarrayWithRange:", v8.location, v8.length);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    objc_msgSend(v3, "sortedArrayUsingDescriptors:", v5[5]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

id __38___DKBiomeQuery__publisherForStreams___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)MEMORY[0x193FEE914]();
  objc_msgSend(v2, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bpsPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

id __33___DKBiomeQuery_bmdkEventStreams__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(getBMDKEventStreamClass()), "initWithDKStreamIdentifier:contentProtection:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB2AC0]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

uint64_t __44___DKBiomeQuery_deletionPredicateFromArray___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

id __38___DKBiomeQuery__publisherForStreams___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  objc_class *BMDKEventClass;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x193FEE914]();
  BMDKEventClass = getBMDKEventClass();
  if (-[objc_class instancesRespondToSelector:](BMDKEventClass, "instancesRespondToSelector:", sel_initWithData_dataVersion_decodeMetadata_))
  {
    v6 = [BMDKEventClass alloc];
    objc_msgSend(v3, "eventBodyData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithData:dataVersion:decodeMetadata:", v7, objc_msgSend(v3, "eventBodyDataVersion"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 65));

  }
  else
  {
    objc_msgSend(v3, "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "dkEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocalCreationDate:", v10);

  v11 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "filterExcludedMetadataWithDKEvent:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDkEvent:", v12);

  objc_autoreleasePoolPop(v4);
  return v11;
}

uint64_t __38___DKBiomeQuery__publisherForStreams___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = (void *)MEMORY[0x193FEE914]();
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "evaluateWithObject:", v3);
  objc_autoreleasePoolPop(v4);

  return v5;
}

id __38___DKBiomeQuery__publisherForStreams___block_invoke_418(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x193FEE914]();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "unsignedIntegerValue") + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
  }

  return v7;
}

id __38___DKBiomeQuery__publisherForStreams___block_invoke_2_421(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  v3 = (void *)MEMORY[0x193FEE914]();
  v4 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithStartDate:endDate:", v5, v6);

  objc_autoreleasePoolPop(v3);
  return v7;
}

id __38___DKBiomeQuery__publisherForStreams___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *context;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  context = (void *)MEMORY[0x193FEE914]();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v3, "valueForKeyPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "containsObject:", v11))
            objc_msgSend(v5, "addObject:", v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) == 5)
  {
    objc_msgSend(v3, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v14);
    v16 = v15;

    objc_msgSend(v3, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("startDate"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CFSTR("duration");
  }
  else
  {
    objc_msgSend(v5, "valueForKey:", CFSTR("description"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_pas_componentsJoinedByString:", CFSTR("-"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = CFSTR("__groupByKey__");
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v19);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v4);
  objc_autoreleasePoolPop(context);

  return v21;
}

uint64_t __38___DKBiomeQuery__publisherForStreams___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("__groupByKey__"));
}

id __38___DKBiomeQuery__publisherForStreams___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x193FEE914]();
  v8 = (void *)objc_msgSend(v5, "mutableCopy");
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "addEntriesFromDictionary:", v6);
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("__groupByKey__"));
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v9 == 6)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("endDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v10, "laterDate:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("endDate"));

LABEL_10:
      goto LABEL_11;
    }
    v14 = CFSTR("endDate");
    v12 = v8;
    v13 = v11;
LABEL_9:
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v14);
    goto LABEL_10;
  }
  if (v9 == 4)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
    v13 = v11;
    v14 = CFSTR("count");
    goto LABEL_9;
  }
LABEL_11:
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v8);

  objc_autoreleasePoolPop(v7);
  return v16;
}

id __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(v4, "addObject:", a3);
  return v4;
}

uint64_t __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dkEvent");
}

BOOL __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _BOOL8 result;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  result = v2 <= v4 && v4 < *(_QWORD *)(v1 + 24) + v2;
  *(_QWORD *)(v3 + 24) = v4 + 1;
  return result;
}

id __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(v4, "addObject:", a3);
  return v4;
}

id __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "bpsPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    objc_msgSend(v3, "mapWithTransform:", &__block_literal_global_454_0);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

uint64_t __68___DKBiomeQuery__publisherForQueryReturningIndividualResults_error___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dkEvent");
}

uint64_t __40___DKBiomeQuery_executeBiomeQueryError___block_invoke_462(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

uint64_t __38___DKBiomeQuery_executeDeletionQuery___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  objc_class *BMDKEventClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v5 = a2;
  v6 = (void *)MEMORY[0x193FEE914]();
  BMDKEventClass = getBMDKEventClass();
  if (-[objc_class instancesRespondToSelector:](BMDKEventClass, "instancesRespondToSelector:", sel_initWithData_dataVersion_decodeMetadata_))
  {
    v8 = [BMDKEventClass alloc];
    objc_msgSend(v5, "eventBodyData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithData:dataVersion:decodeMetadata:", v9, objc_msgSend(v5, "eventBodyDataVersion"), *(unsigned __int8 *)(a1[4] + 65));

  }
  else
  {
    objc_msgSend(v5, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v10, "dkEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocalCreationDate:", v12);

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setDkEvent:", v11);
  v14 = *(void **)(a1[4] + 16);
  if (v14 && !objc_msgSend(v14, "evaluateWithObject:", v13))
  {
    v17 = 0;
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    v15 = *(_QWORD *)(a1[4] + 24);
    if (v15)
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      v17 = 1;
      if (v16 >= v15)
        *a3 = 1;
    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

void __40___DKBiomeQuery_executeBiomeQueryError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_DEBUG, "_DKBiomeQuery publisher sink completion: %@", (uint8_t *)&v2, 0xCu);
}

@end
