@implementation ATXUnifiedActivityBiomeStream

- (id)initFromTimeBasedTransitionStream:(id)a3 appLaunchBasedTransitionStream:(id)a4 heuristicTransitionStream:(id)a5 userFocusTransitionStream:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXUnifiedActivityBiomeStream *v15;
  id *p_isa;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXUnifiedActivityBiomeStream;
  v15 = -[ATXUnifiedActivityBiomeStream init](&v18, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_timeBasedInferredActivityStream, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (ATXUnifiedActivityBiomeStream)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXUnifiedActivityBiomeStream *v7;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[ATXUnifiedActivityBiomeStream initFromTimeBasedTransitionStream:appLaunchBasedTransitionStream:heuristicTransitionStream:userFocusTransitionStream:](self, "initFromTimeBasedTransitionStream:appLaunchBasedTransitionStream:heuristicTransitionStream:userFocusTransitionStream:", v3, v4, v5, v6);

  return v7;
}

- (id)efficientCurrentMode
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__74;
  v26 = __Block_byref_object_dispose__74;
  v27 = 0;
  -[ATXUserFocusComputedActivityBiomeStream transitionPublisherFromStartTime:endTime:maxEvents:lastN:reversed:](self->_userFocusComputedActivityStream, "transitionPublisherFromStartTime:endTime:maxEvents:lastN:reversed:", 0, 0, &unk_1E83CD6F0, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v20[4] = &v22;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke;
  v21[3] = &unk_1E82DCE78;
  v21[4] = self;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_14;
  v20[3] = &unk_1E82E6D18;
  v5 = (id)objc_msgSend(v3, "sinkWithCompletion:receiveInput:", v21, v20);

  v6 = (void *)v23[5];
  if (v6 && objc_msgSend(v6, "isEntryEvent"))
  {
    objc_msgSend((id)v23[5], "mode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__74;
    v18 = __Block_byref_object_dispose__74;
    v19 = 0;
    -[ATXHeuristicInferredActivityBiomeStream transitionPublisherFromStartTime:endTime:maxEvents:lastN:reversed:](self->_heuristicInferredActivityStream, "transitionPublisherFromStartTime:endTime:maxEvents:lastN:reversed:", 0, 0, &unk_1E83CD6F0, 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = &v14;
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_2;
    v13[3] = &unk_1E82DCE78;
    v13[4] = self;
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_16;
    v12[3] = &unk_1E82E6D18;
    v9 = (id)objc_msgSend(v8, "sinkWithCompletion:receiveInput:", v13, v12);

    v10 = (void *)v15[5];
    if (v10 && objc_msgSend(v10, "isEntryEvent"))
    {
      objc_msgSend((id)v15[5], "mode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    _Block_object_dispose(&v14, 8);

  }
  _Block_object_dispose(&v22, 8);

  return v7;
}

void __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    __atxlog_handle_modes();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_cold_1(a1, v3);

  }
}

void __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_14(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    __atxlog_handle_modes();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_2_cold_1(a1, v3);

  }
}

void __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_16(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)transitionPublisherFromStartTime:(double)a3
{
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
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  -[ATXTimeBasedInferredActivityBiomeStream transitionPublisherFromStartTime:](self->_timeBasedInferredActivityStream, "transitionPublisherFromStartTime:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C9AA60], "bpsPublisher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v6;
  -[ATXAppLaunchBasedInferredActivityBiomeStream transitionPublisherFromStartTime:](self->_appLaunchInferredActivityStream, "transitionPublisherFromStartTime:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C9AA60], "bpsPublisher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v8;
  -[ATXHeuristicInferredActivityBiomeStream transitionPublisherFromStartTime:](self->_heuristicInferredActivityStream, "transitionPublisherFromStartTime:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C9AA60], "bpsPublisher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[2] = v10;
  -[ATXUserFocusComputedActivityBiomeStream transitionPublisherFromStartTime:](self->_userFocusComputedActivityStream, "transitionPublisherFromStartTime:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C9AA60], "bpsPublisher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)

  if (!v9)
  if (!v7)

  if (!v5)
  -[ATXUnifiedActivityBiomeStream _mergeTransitionPublishers:](self, "_mergeTransitionPublishers:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "combineTransitions:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_mergeTransitionPublishers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 1)
    {
      v6 = v5;
    }
    else
    {
      objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXUnifiedActivityBiomeStream _mergeTransitionPublisher:withOthers:](self, "_mergeTransitionPublisher:withOthers:", v5, v7);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C9AA60], "bpsPublisher");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_mergeTransitionPublisher:(id)a3 withOthers:(id)a4
{
  return (id)objc_msgSend(a3, "orderedMergeWithOthers:comparator:", a4, &__block_literal_global_163);
}

uint64_t __70__ATXUnifiedActivityBiomeStream__mergeTransitionPublisher_withOthers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "transitionTime");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "transitionTime");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isEntryEvent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isEntryEvent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "compare:", v12);

  }
  return v10;
}

- (id)sessionPublisherFromStartTime:(double)a3
{
  void *v3;
  void *v4;

  -[ATXUnifiedActivityBiomeStream transitionPublisherFromStartTime:](self, "transitionPublisherFromStartTime:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXUnifiedActivityStreamConversions sessionPublisherFromTransitionPublisher:](_ATXUnifiedActivityStreamConversions, "sessionPublisherFromTransitionPublisher:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFocusComputedActivityStream, 0);
  objc_storeStrong((id *)&self->_heuristicInferredActivityStream, 0);
  objc_storeStrong((id *)&self->_appLaunchInferredActivityStream, 0);
  objc_storeStrong((id *)&self->_timeBasedInferredActivityStream, 0);
}

void __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_cold_1(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (objc_class *)OUTLINED_FUNCTION_3_5();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v6, v7, "%@ - error fetching last activity transition from ATXUserFocusComputedActivityBiomeStream: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

void __53__ATXUnifiedActivityBiomeStream_efficientCurrentMode__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = (objc_class *)OUTLINED_FUNCTION_3_5();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v6, v7, "%@ - error fetching last activity transition from ATXHeuristicInferredActivityBiomeStream: %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

@end
