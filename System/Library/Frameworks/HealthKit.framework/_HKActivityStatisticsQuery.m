@implementation _HKActivityStatisticsQuery

- (_HKActivityStatisticsQuery)initWithStartDate:(id)a3 endDate:(id)a4 moveIntervalComponents:(id)a5 exerciseIntervalComponents:(id)a6 initialQueryResultsHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  id *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)_HKActivityStatisticsQuery;
  v18 = -[HKQuery _initWithObjectType:predicate:](&v27, sel__initWithObjectType_predicate_, 0, 0);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong(v18 + 20, a3);
    objc_storeStrong(v19 + 21, a4);
    v20 = objc_msgSend(v15, "copy");
    v21 = v19[22];
    v19[22] = (id)v20;

    v22 = objc_msgSend(v16, "copy");
    v23 = v19[23];
    v19[23] = (id)v22;

    v24 = objc_msgSend(v17, "copy");
    v25 = v19[25];
    v19[25] = (id)v24;

    v19[26] = (id)0x4014000000000000;
  }

  return (_HKActivityStatisticsQuery *)v19;
}

- (void)setQueryUpdateHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  -[HKQuery queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52___HKActivityStatisticsQuery_setQueryUpdateHandler___block_invoke;
  block[3] = &unk_1E37E66E8;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(v6, block);

}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3CEFF0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____HKActivityStatisticsQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverResult_query_, 0, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKActivityStatisticsQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setStartDate:", self->_startDate, v5.receiver, v5.super_class);
  objc_msgSend(v4, "setEndDate:", self->_endDate);
  objc_msgSend(v4, "setMoveIntervalComponents:", self->_moveIntervalComponents);
  objc_msgSend(v4, "setExerciseIntervalComponents:", self->_exerciseIntervalComponents);
  objc_msgSend(v4, "setUpdateInterval:", self->_updateInterval);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id initialQueryResultsHandler;
  id queryUpdateHandler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKActivityStatisticsQuery;
  -[HKQuery queue_queryDidDeactivate:](&v6, sel_queue_queryDidDeactivate_, a3);
  initialQueryResultsHandler = self->_initialQueryResultsHandler;
  self->_initialQueryResultsHandler = 0;

  queryUpdateHandler = self->_queryUpdateHandler;
  self->_queryUpdateHandler = 0;

}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return self->_queryUpdateHandler == 0;
}

- (void)queue_validate
{
  void *v3;
  _QWORD *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKActivityStatisticsQuery;
  -[HKQuery queue_validate](&v5, sel_queue_validate);
  -[_HKActivityStatisticsQuery _validateIntervalComponents:](self, "_validateIntervalComponents:", self->_moveIntervalComponents);
  -[_HKActivityStatisticsQuery _validateIntervalComponents:](self, "_validateIntervalComponents:", self->_exerciseIntervalComponents);
  -[HKQuery objectType](self, "objectType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (_QWORD *)MEMORY[0x1E0C99778];
  if (v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ cannot have an objectType"), objc_opt_class());
  if (!self->_initialQueryResultsHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v4, CFSTR("%@ initialQueryResultsHandler cannot be nil"), objc_opt_class());
}

- (void)_validateIntervalComponents:(id)a3
{
  id v3;
  double v4;
  id v5;

  v3 = a3;
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ interval components cannot be nil"), objc_opt_class());
    v3 = 0;
  }
  if (objc_msgSend(v3, "hk_maxComponentValue") < 1 || (objc_msgSend(v5, "hk_approximateDuration"), v4 <= 0.0))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ statistics interval must be greater than zero: %@"), objc_opt_class(), v5);

}

- (void)queue_deliverError:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id *v7;
  id *v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  if (self->_deliveredInitial)
  {
    v5 = _Block_copy(self->_queryUpdateHandler);
    if (v5)
    {
      -[HKQuery clientQueue](self, "clientQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __49___HKActivityStatisticsQuery_queue_deliverError___block_invoke;
      v13[3] = &unk_1E37E6710;
      v7 = &v15;
      v5 = v5;
      v15 = v5;
      v13[4] = self;
      v8 = &v14;
      v14 = v4;
      v9 = v13;
LABEL_6:
      dispatch_async(v6, v9);

    }
  }
  else
  {
    v5 = _Block_copy(self->_initialQueryResultsHandler);
    if (v5)
    {
      -[HKQuery clientQueue](self, "clientQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __49___HKActivityStatisticsQuery_queue_deliverError___block_invoke_2;
      v10[3] = &unk_1E37E6710;
      v7 = &v12;
      v5 = v5;
      v12 = v5;
      v10[4] = self;
      v8 = &v11;
      v11 = v4;
      v9 = v10;
      goto LABEL_6;
    }
  }

}

- (void)client_deliverResult:(id)a3 query:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HKQuery queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___HKActivityStatisticsQuery_client_deliverResult_query___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (id)queryUpdateHandler
{
  return self->_queryUpdateHandler;
}

- (id)initialQueryResultsHandler
{
  return self->_initialQueryResultsHandler;
}

- (void)setInitialQueryResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (double)_updateInterval
{
  return self->_updateInterval;
}

- (void)_setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialQueryResultsHandler, 0);
  objc_storeStrong(&self->_queryUpdateHandler, 0);
  objc_storeStrong((id *)&self->_exerciseIntervalComponents, 0);
  objc_storeStrong((id *)&self->_moveIntervalComponents, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
