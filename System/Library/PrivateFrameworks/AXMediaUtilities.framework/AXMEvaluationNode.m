@implementation AXMEvaluationNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMEvaluationNode)initWithCoder:(id)a3
{
  id v4;
  AXMEvaluationNode *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXMEvaluationNode;
  v5 = -[AXMVisionEngineNode initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    -[AXMEvaluationNode setPriority:](v5, "setPriority:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priority")));
    if (!-[AXMEvaluationNode priority](v5, "priority"))
      -[AXMEvaluationNode setPriority:](v5, "setPriority:", objc_msgSend((id)objc_opt_class(), "defaultPriority"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minimumConfidence"));
    -[AXMEvaluationNode setMinimumConfidence:](v5, "setMinimumConfidence:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXMEvaluationNode;
  v4 = a3;
  -[AXMVisionEngineNode encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMEvaluationNode priority](self, "priority", v5.receiver, v5.super_class), CFSTR("priority"));
  -[AXMEvaluationNode minimumConfidence](self, "minimumConfidence");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("minimumConfidence"));

}

- (void)nodeInitialize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMEvaluationNode;
  -[AXMVisionEngineNode nodeInitialize](&v3, sel_nodeInitialize);
  self->_priority = objc_msgSend((id)objc_opt_class(), "defaultPriority");
  self->_effectivePriority = 0;
  self->_minimumConfidence = 0.0;
}

+ (CGSize)preferredModelInputSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (BOOL)isANEDeviceAvailable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  MLAllComputeDevicesSoft();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;

          v5 = v9;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5 != 0;
}

+ (void)configureForRunningOnANEIfPossibleWithRequest:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  MLAllComputeDevicesSoft();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
  {
    v7 = v4;
    goto LABEL_13;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;

        v7 = v11;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  }
  while (v6);

  if (v7)
  {
    objc_msgSend(v3, "setComputeDevice:forComputeStage:", v7, *MEMORY[0x1E0CEE290], (_QWORD)v12);
LABEL_13:

  }
}

+ (unint64_t)defaultPriority
{
  return 15;
}

- (void)boostEffectivePriority
{
  self->_effectivePriority += -[AXMEvaluationNode priority](self, "priority");
}

- (void)resetEffectivePriority
{
  self->_effectivePriority = 0;
}

- (void)setMinimumConfidence:(double)a3
{
  self->_minimumConfidence = fmax(fmin(a3, 1.0), 0.0);
}

- (BOOL)shouldEvaluate:(id)a3
{
  return 1;
}

- (BOOL)evaluateRequests:(id)a3 withContext:(id)a4 requestHandlerOptions:(id)a5 metrics:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v14)
    objc_msgSend(v13, "visionImageRequestHandlerWithOptions:", v14);
  else
    objc_msgSend(v13, "visionImageRequestHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &__block_literal_global_27);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    -[AXMEvaluationNode _diagnosticNameForRequests:metrics:](self, "_diagnosticNameForRequests:metrics:", v12, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __86__AXMEvaluationNode_evaluateRequests_withContext_requestHandlerOptions_metrics_error___block_invoke_2;
    v23[3] = &unk_1E625EF20;
    v26 = &v27;
    v24 = v16;
    v25 = v12;
    objc_msgSend(v15, "measure:tryExecute:", v17, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*((_BYTE *)v28 + 24))
    {
      AXMediaLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[AXMTraitDetectorNode evaluate:metrics:].cold.2((uint64_t)v18, v19);

      if (a7)
        *a7 = objc_retainAutorelease(v18);
    }
    v20 = *((_BYTE *)v28 + 24) != 0;

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    AXMediaLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:].cold.1(v21);

    v20 = 0;
  }

  return v20;
}

uint64_t __86__AXMEvaluationNode_evaluateRequests_withContext_requestHandlerOptions_metrics_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setModelFileBackingStore:", 1);
}

id __86__AXMEvaluationNode_evaluateRequests_withContext_requestHandlerOptions_metrics_error___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  id v7;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v7 = 0;
  v4 = objc_msgSend(v2, "performRequests:error:", v3, &v7);
  v5 = v7;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
  return v5;
}

- (id)_diagnosticNameForRequests:(id)a3 metrics:(id)a4
{
  id v5;
  __CFString *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(a4, "measurementsEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("Vision:"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendFormat:](v6, "appendFormat:", CFSTR("%@|"), v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = CFSTR("VN PerformRequests");
  }

  return v6;
}

- (double)minimumConfidence
{
  return self->_minimumConfidence;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)effectivePriority
{
  return self->_effectivePriority;
}

- (void)setEffectivePriority:(unint64_t)a3
{
  self->_effectivePriority = a3;
}

- (void)evaluateRequests:(os_log_t)log withContext:requestHandlerOptions:metrics:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. requestHandler was nil", v1, 2u);
}

@end
