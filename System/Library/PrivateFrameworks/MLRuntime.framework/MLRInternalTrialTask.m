@implementation MLRInternalTrialTask

- (MLRInternalTrialTask)initWithEvaluationState:(id)a3 runtimeEvaluation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  MLRInternalTrialTask *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "hasPluginId"))
    v9 = objc_msgSend(v8, "pluginProjectId");
  else
    v9 = 0;
  v10 = -[MLRInternalTrialTask initWithEvaluationState:runtimeEvaluation:pluginProjectId:](self, "initWithEvaluationState:runtimeEvaluation:pluginProjectId:", v6, v8, v9);

  return v10;
}

- (MLRInternalTrialTask)initWithEvaluationState:(id)a3 runtimeEvaluation:(id)a4 pluginProjectId:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  MLRTrialTaskSchedulingPolicy *v10;
  MLRInternalTrialTask *v11;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  v10 = -[MLRTrialTaskSchedulingPolicy initWithTRIMLRuntimeEvaluation:]([MLRTrialTaskSchedulingPolicy alloc], "initWithTRIMLRuntimeEvaluation:", v8);

  v11 = -[MLRInternalTrialTask initWithEvaluationState:schedulingPolicy:pluginProjectId:](self, "initWithEvaluationState:schedulingPolicy:pluginProjectId:", v9, v10, v5);
  return v11;
}

- (MLRInternalTrialTask)initWithEvaluationState:(id)a3 schedulingPolicy:(id)a4 pluginProjectId:(int)a5
{
  id v9;
  id v10;
  uint64_t v11;
  MLRInternalTrialTask *v12;
  MLRInternalTrialTask *v13;
  MLRInternalTrialTask *v14;
  void *v15;
  void *v16;
  void *v17;
  void *evaluationID;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *v22;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = objc_opt_class();
  v12 = 0;
  if (v9 && v11)
  {
    v24.receiver = self;
    v24.super_class = (Class)MLRInternalTrialTask;
    v13 = -[MLRInternalTrialTask init](&v24, sel_init);
    v14 = v13;
    if (!v13)
    {
LABEL_10:
      self = v14;
      v12 = self;
      goto LABEL_11;
    }
    objc_storeStrong((id *)&v13->_evaluationState, a3);
    objc_storeStrong((id *)&v14->_policy, a4);
    v14->_projectId = a5;
    objc_msgSend(v9, "experimentIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rolloutIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "experimentId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v15, "experimentId");
      evaluationID = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v15;
    }
    else
    {
      objc_msgSend(v16, "rolloutId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        evaluationID = v14->_evaluationID;
        v14->_evaluationID = (NSString *)CFSTR("Unknown");
        goto LABEL_9;
      }
      objc_msgSend(v16, "rolloutId");
      evaluationID = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v16;
    }
    objc_msgSend(evaluationID, "stringByAppendingFormat:", CFSTR("_%d"), objc_msgSend(v19, "deploymentId"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v14->_evaluationID;
    v14->_evaluationID = (NSString *)v21;

LABEL_9:
    goto LABEL_10;
  }
LABEL_11:

  return v12;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@, %@, %ld)"), v5, self->_evaluationState, self->_policy, self->_projectId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  TRIFactorsState *evaluationState;
  id v5;

  evaluationState = self->_evaluationState;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", evaluationState, CFSTR("evaluationState"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_projectId, CFSTR("projectId"));

}

- (MLRInternalTrialTask)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  MLRInternalTrialTask *v8;

  v4 = a3;
  if (objc_opt_class())
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("evaluationState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("projectId"));
      v7 = (void *)objc_opt_new();
      self = -[MLRInternalTrialTask initWithEvaluationState:runtimeEvaluation:pluginProjectId:](self, "initWithEvaluationState:runtimeEvaluation:pluginProjectId:", v5, v7, v6);

      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (TRIFactorsState)evaluationState
{
  return self->_evaluationState;
}

- (MLRTrialTaskSchedulingPolicy)policy
{
  return self->_policy;
}

- (int)projectId
{
  return self->_projectId;
}

- (NSString)evaluationID
{
  return self->_evaluationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluationID, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_evaluationState, 0);
}

@end
