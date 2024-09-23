@implementation MLRTrialTaskSchedulingPolicy

- (MLRTrialTaskSchedulingPolicy)initWithTRIMLRuntimeEvaluation:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  MLRTrialTaskSchedulingPolicy *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = a3;
  if (objc_msgSend(v4, "hasSchedulingPolicy") && (objc_msgSend(v4, "hasEvaluationId") & 1) != 0)
  {
    objc_msgSend(v4, "schedulingPolicy");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "evaluationId");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
    {
      if (v6)
      {
        if (-[NSObject hasMaxEvaluations](v5, "hasMaxEvaluations"))
          v8 = -[NSObject maxEvaluations](v5, "maxEvaluations");
        else
          v8 = -1;
        v32 = 0.0;
        if (-[NSObject hasPeriodicIntervalSeconds](v5, "hasPeriodicIntervalSeconds"))
          v32 = (double)-[NSObject periodicIntervalSeconds](v5, "periodicIntervalSeconds");
        if ((-[NSObject hasStartsAfter](v5, "hasStartsAfter") & 1) != 0)
        {
          -[NSObject startsAfter](v5, "startsAfter");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "date");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if ((-[NSObject hasEndsAt](v5, "hasEndsAt") & 1) != 0)
        {
          -[NSObject endsAt](v5, "endsAt");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "date");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        self = -[MLRTrialTaskSchedulingPolicy initWithMaxEvaluations:periodicIntervalSeconds:startAfterDate:endAtDate:taskID:](self, "initWithMaxEvaluations:periodicIntervalSeconds:startAfterDate:endAtDate:taskID:", v8, v34, v36, v7, v32);

        v16 = self;
        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MLRTrialTaskSchedulingPolicy initWithTRIMLRuntimeEvaluation:].cold.2(v17, v25, v26, v27, v28, v29, v30, v31);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MLRTrialTaskSchedulingPolicy initWithTRIMLRuntimeEvaluation:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    }

    v16 = 0;
LABEL_25:

    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MLRTrialTaskSchedulingPolicy initWithTRIMLRuntimeEvaluation:].cold.3(v5, v9, v10, v11, v12, v13, v14, v15);
  v16 = 0;
LABEL_26:

  return v16;
}

- (MLRTrialTaskSchedulingPolicy)initWithMaxEvaluations:(unint64_t)a3 periodicIntervalSeconds:(double)a4 startAfterDate:(id)a5 endAtDate:(id)a6 taskID:(id)a7
{
  id v13;
  id v14;
  id v15;
  MLRTrialTaskSchedulingPolicy *v16;
  MLRTrialTaskSchedulingPolicy *v17;
  unint64_t v18;
  double v19;
  objc_super v21;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MLRTrialTaskSchedulingPolicy;
  v16 = -[MLRTrialTaskSchedulingPolicy init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    if (a3)
      v18 = a3;
    else
      v18 = -1;
    v16->_maxPerformCount = v18;
    v19 = 21600.0;
    if (a4 >= 21600.0)
      v19 = a4;
    v16->_minInterval = v19;
    objc_storeStrong((id *)&v16->_startAfterDate, a5);
    objc_storeStrong((id *)&v17->_endAtDate, a6);
    objc_storeStrong((id *)&v17->_taskID, a7);
  }

  return v17;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%lu, %f, %@, %@)"), v5, self->_maxPerformCount, *(_QWORD *)&self->_minInterval, self->_startAfterDate, self->_endAtDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)maxPerformCount
{
  return self->_maxPerformCount;
}

- (double)minInterval
{
  return self->_minInterval;
}

- (NSDate)startAfterDate
{
  return self->_startAfterDate;
}

- (NSDate)endAtDate
{
  return self->_endAtDate;
}

- (NSString)taskID
{
  return self->_taskID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_endAtDate, 0);
  objc_storeStrong((id *)&self->_startAfterDate, 0);
}

- (void)initWithTRIMLRuntimeEvaluation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2112F5000, a1, a3, "policy cannot be nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithTRIMLRuntimeEvaluation:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2112F5000, a1, a3, "taskID cannot be nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithTRIMLRuntimeEvaluation:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2112F5000, a1, a3, "Evaluation cannot be nil.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
