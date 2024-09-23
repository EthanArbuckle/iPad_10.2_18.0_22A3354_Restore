@implementation BLSAlwaysOnSession

- (BLSAlwaysOnSession)initWithEnvironment:(id)a3
{
  id v4;
  BLSAlwaysOnSession *v5;
  BLSAlwaysOnSession *v6;
  BLSFrameSpecifierModel *v7;
  BLSFrameSpecifierModel *model;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLSAlwaysOnSession;
  v5 = -[BLSAlwaysOnSession init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = objc_alloc_init(BLSFrameSpecifierModel);
    model = v6->_model;
    v6->_model = v7;

  }
  return v6;
}

- (NSString)description
{
  void *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_model, CFSTR("model"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(WeakRetained, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%p:%@>"), WeakRetained, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("environment"));

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)specifierForPresentationDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BLSAlwaysOnSession model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierAtPresentationDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)desiredFidelityForDateInterval:(id)a3 timelines:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  uint64_t v12;
  NSObject *v13;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  -[BLSAlwaysOnSession environment](self, "environment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v12 = +[BLSAlwaysOnTimeline requestedFidelityForTimelines:inDateInterval:](BLSAlwaysOnTimeline, "requestedFidelityForTimelines:inDateInterval:", v9, v8);
    bls_scenes_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[BLSAlwaysOnSession desiredFidelityForDateInterval:timelines:withCompletion:].cold.2(v12, (uint64_t)v9, v13);
  }
  else
  {
    bls_environment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BLSAlwaysOnSession desiredFidelityForDateInterval:timelines:withCompletion:].cold.1(v11);
    v12 = 1;
  }

  v10[2](v10, v12);
}

- (void)performFrameSpecifiersRequest:(id)a3 timelines:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BLSFrameSpecifierModel *v14;
  void *v15;
  void *v16;
  BLSAlwaysOnDateSpecifier *v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  BLSAlwaysOnDateSpecifier *v22;
  void *v23;
  unint64_t v24;
  double v25;
  double v26;
  os_log_type_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BLSAlwaysOnSession environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previousPresentationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSAlwaysOnSession specifierForPresentationDate:](self, "specifierForPresentationDate:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v11;
  if (v7)
  {
    v12 = v11;
    v36 = v10;
    v13 = objc_msgSend(v6, "shouldReset");
    if ((_DWORD)v13)
    {
      v14 = objc_alloc_init(BLSFrameSpecifierModel);
      -[BLSAlwaysOnSession setModel:](self, "setModel:", v14);

    }
    +[BLSAlwaysOnTimeline constructFrameSpecifiersForTimelines:dateInterval:shouldConstructStartSpecifier:framesPerSecond:previousSpecifier:](BLSAlwaysOnTimeline, "constructFrameSpecifiersForTimelines:dateInterval:shouldConstructStartSpecifier:framesPerSecond:previousSpecifier:", v7, v9, v13, v12, 30.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSAlwaysOnSession model](self, "model");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSpecifiers:", v15);

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -10.0);
    v17 = (BLSAlwaysOnDateSpecifier *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isBeforeDate:", v17);

    if (v19)
    {
      bls_environment_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[BLSAlwaysOnSession performFrameSpecifiersRequest:timelines:].cold.2(v9, v20);
    }
    else
    {
      -[BLSAlwaysOnSession model](self, "model");
      v20 = objc_claimAutoreleasedReturnValue();
      -[NSObject purgeAllButOneSpecifiersBeforeDate:](v20, "purgeAllButOneSpecifiersBeforeDate:", v17);
    }

    objc_msgSend(v15, "bs_map:", &__block_literal_global_6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    if (v24 < 0xB)
    {
      v27 = OS_LOG_TYPE_INFO;
    }
    else
    {
      v25 = (double)v24;
      objc_msgSend(v9, "duration");
      if (v25 / v26 <= 4.0)
        v27 = OS_LOG_TYPE_INFO;
      else
        v27 = OS_LOG_TYPE_FAULT;
    }
    bls_scenes_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, v27))
    {
      -[BLSAlwaysOnSession model](self, "model");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v9;
      v30 = objc_msgSend(v33, "specifierCount");
      objc_msgSend(v23, "bls_boundedDescriptionWithMax:transformer:", 8, &__block_literal_global_13);
      v35 = v7;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bls_boundedDescriptionWithMax:", 1);
      v34 = v8;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v39 = v30;
      v9 = v29;
      v40 = 2114;
      v41 = v31;
      v42 = 2114;
      v43 = v32;
      _os_log_impl(&dword_1B0C75000, v28, v27, "performFrameSpecifiersRequest model.specifierCount:%lu dateSpecifers:%{public}@ for frameSpecifiers:%{public}@", buf, 0x20u);

      v8 = v34;
      v7 = v35;
    }

    v10 = v36;
  }
  else
  {
    bls_environment_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BLSAlwaysOnSession performFrameSpecifiersRequest:timelines:].cold.1(v8);

    v22 = [BLSAlwaysOnDateSpecifier alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[BLSAlwaysOnDateSpecifier initWithDate:fidelity:](v22, "initWithDate:fidelity:", v15, 0);
    v44[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "completeWithDateSpecifiers:", v23);

}

BLSAlwaysOnDateSpecifier *__62__BLSAlwaysOnSession_performFrameSpecifiersRequest_timelines___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BLSAlwaysOnDateSpecifier *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BLSAlwaysOnDateSpecifier *v7;

  v2 = a2;
  v3 = [BLSAlwaysOnDateSpecifier alloc];
  objc_msgSend(v2, "presentationInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "requestedFidelity");

  v7 = -[BLSAlwaysOnDateSpecifier initWithDate:fidelity:](v3, "initWithDate:fidelity:", v5, v6);
  return v7;
}

id __62__BLSAlwaysOnSession_performFrameSpecifiersRequest_timelines___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "fidelity");

  NSStringAbbreviatedFromBLSUpdateFidelity(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ – %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BLSBacklightSceneEnvironment)environment
{
  return (BLSBacklightSceneEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (BLSFrameSpecifierModel)model
{
  return (BLSFrameSpecifierModel *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_environment);
}

- (void)desiredFidelityForDateInterval:(void *)a1 timelines:withCompletion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1B0C75000, v2, v3, "performDesiredFidelityRequest desiredFidelity:Minutes - nil timeline array returned by delegate:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_4();
}

- (void)desiredFidelityForDateInterval:(uint64_t)a1 timelines:(uint64_t)a2 withCompletion:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromBLSUpdateFidelity(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  v7 = 2114;
  v8 = a2;
  _os_log_debug_impl(&dword_1B0C75000, a3, OS_LOG_TYPE_DEBUG, "performDesiredFidelityRequest desiredFidelity:%{public}@ for timelines:%{public}@", v6, 0x16u);

}

- (void)performFrameSpecifiersRequest:(void *)a1 timelines:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_1B0C75000, v2, v3, "nil timeline array returned by delegate:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_4();
}

- (void)performFrameSpecifiersRequest:(void *)a1 timelines:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bls_shortLoggingString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1B0C75000, a2, OS_LOG_TYPE_ERROR, "performFrameSpecifiersRequest: start of dateInterval %{public}@ is more than ten seconds ago so not purging", v4, 0xCu);

  OUTLINED_FUNCTION_1_4();
}

@end
