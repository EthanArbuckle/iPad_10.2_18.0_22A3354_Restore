@implementation ATXBiomeStreamInspector

+ (void)makeJSONRepresentationForStreamWithBlock:(id)a3
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v6 = v5 + -7200.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7 + -86400.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v10 = v9 + -604800.0;
  v11 = (void *)objc_opt_class();
  v31 = (id)objc_opt_new();
  objc_msgSend(v31, "publisherFromStartTime:", v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_opt_new();
  objc_msgSend(v30, "publisherFromStartTime:", v6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "genericEventPublisherFromStartTime:", v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_opt_new();
  objc_msgSend(v28, "publisherFromStartTime:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "App");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "InFocus");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "atx_publisherFromStartTime:", v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "App");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "Intent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "atx_publisherFromStartTime:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UserFocus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "InferredMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "atx_publisherFromStartTime:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "makeJSONRepresentationForStreamWithBlock:blendingPublisher:clientPublisher:uiPublisher:spotlightUIPublisher:appLaunchPublisher:appIntentPublisher:inferredModePublisher:", v4, v34, v33, v32, v12, v20, v14, v19);

}

+ (void)makeJSONRepresentationForStreamWithBlock:(id)a3 blendingPublisher:(id)a4 clientPublisher:(id)a5 uiPublisher:(id)a6 spotlightUIPublisher:(id)a7 appLaunchPublisher:(id)a8 appIntentPublisher:(id)a9 inferredModePublisher:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(a1, "_makeStreamJSONForStream:publisher:maxNumEvents:callback:", CFSTR("blending"), v16, 500, v30);
  objc_autoreleasePoolPop(v23);
  v24 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(a1, "_makeStreamJSONForStream:publisher:maxNumEvents:callback:", CFSTR("clientModel"), v17, 250, v30);
  objc_autoreleasePoolPop(v24);
  v25 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(a1, "_makeStreamJSONForStream:publisher:maxNumEvents:callback:", CFSTR("ui"), v18, 2000, v30);
  objc_autoreleasePoolPop(v25);
  v26 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(a1, "_makeStreamJSONForStream:publisher:maxNumEvents:callback:", CFSTR("spotlightUI"), v19, 1000, v30);
  objc_autoreleasePoolPop(v26);
  v27 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(a1, "_makeStreamJSONForStream:publisher:maxNumEvents:callback:", CFSTR("appLaunch"), v20, 500, v30);
  objc_autoreleasePoolPop(v27);
  v28 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(a1, "_makeStreamJSONForStream:publisher:maxNumEvents:callback:", CFSTR("appIntent"), v21, 500, v30);
  objc_autoreleasePoolPop(v28);
  v29 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(a1, "_makeStreamJSONForStream:publisher:maxNumEvents:callback:", CFSTR("inferredMode"), v22, 500, v30);
  objc_autoreleasePoolPop(v29);

}

+ (void)_makeStreamJSONForStream:(id)a3 publisher:(id)a4 maxNumEvents:(unint64_t)a5 callback:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, id, void *);
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, id, void *))a6;
  v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v12, "setDateStyle:", 1);
  objc_msgSend(v12, "setTimeStyle:", 1);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__14;
  v24 = __Block_byref_object_dispose__14;
  v25 = (id)objc_opt_new();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__ATXBiomeStreamInspector__makeStreamJSONForStream_publisher_maxNumEvents_callback___block_invoke_2;
  v16[3] = &unk_1E82DD178;
  v13 = v12;
  v17 = v13;
  v18 = &v20;
  v19 = a5;
  v14 = (id)objc_msgSend(v10, "sinkWithCompletion:receiveInput:", &__block_literal_global_32, v16);
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v21[5], 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v9, v15);

  _Block_object_dispose(&v20, 8);
}

void __84__ATXBiomeStreamInspector__makeStreamJSONForStream_publisher_maxNumEvents_callback___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
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
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *context;
  id v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  context = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v3, "eventBody");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = CFSTR("timestamp");
  v4 = (void *)a1[4];
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "timestamp");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v7;
  v25[1] = CFSTR("timestampRaw");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "timestamp");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v9;
  v25[2] = CFSTR("data_size");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "frame");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend(v22, "json");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v16, "JSONObjectWithData:options:error:", v17, 2, &v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v24;

    if (v19)
    {
      objc_msgSend(v19, "localizedDescription");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      printf("JSON deserialization error occurs: %s", (const char *)objc_msgSend(v20, "UTF8String"));

    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_msgSend(v3, "dataType"), "description");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Event class %@ does not support JSON output"), v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("event"));

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count") == a1[6])
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "removeObjectAtIndex:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v15);

  objc_autoreleasePoolPop(context);
}

@end
