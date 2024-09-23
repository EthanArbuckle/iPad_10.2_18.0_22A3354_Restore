@implementation AXMVisionEngine

- (AXMVisionEngine)initWithIdentifier:(id)a3
{
  id v4;
  AXMVisionEngine *v5;
  AXMVisionEngine *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXMVisionEngine;
  v5 = -[AXMVisionEngine init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AXMVisionEngine _commonInit](v5, "_commonInit");
    -[AXMVisionEngine setIdentifier:](v6, "setIdentifier:", v4);
  }

  return v6;
}

- (void)_commonInit
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  NSMutableArray *v6;
  NSMutableArray *queue_sourceNodes;
  NSMutableArray *v8;
  NSMutableArray *queue_evaluationNodes;
  NSMutableArray *v10;
  NSMutableArray *queue_resultHandlers;
  AXMImageRegistrationNode *v12;
  AXMImageRegistrationNode *queue_imageRegistrationNode;
  AXMService *v14;
  void *v15;
  AXMTaskDispatcher *v16;
  AXMSequenceRequestManager *v17;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("AXMVisionEngine", v3);
  queue = self->_queue;
  self->_queue = v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  queue_sourceNodes = self->_queue_sourceNodes;
  self->_queue_sourceNodes = v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  queue_evaluationNodes = self->_queue_evaluationNodes;
  self->_queue_evaluationNodes = v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  queue_resultHandlers = self->_queue_resultHandlers;
  self->_queue_resultHandlers = v10;

  v12 = -[AXMVisionEngineNode initWithIdentifier:]([AXMImageRegistrationNode alloc], "initWithIdentifier:", CFSTR("AXMImgRegistration"));
  queue_imageRegistrationNode = self->_queue_imageRegistrationNode;
  self->_queue_imageRegistrationNode = v12;

  if ((AXMIsRunningInServiceProcess() & 1) == 0)
  {
    v14 = objc_alloc_init(AXMService);
    -[AXMVisionEngine setAxMediaUtilsService:](self, "setAxMediaUtilsService:", v14);

    -[AXMVisionEngine axMediaUtilsService](self, "axMediaUtilsService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", self);

  }
  *(_OWORD *)&self->_maximumQueueSize = xmmword_1B0EFF820;
  v16 = -[AXMTaskDispatcher initWithIdentifier:delegate:]([AXMTaskDispatcher alloc], "initWithIdentifier:delegate:", CFSTR("AXMVisionEngine"), self);
  -[AXMVisionEngine setTaskDispatcher:](self, "setTaskDispatcher:", v16);

  v17 = objc_alloc_init(AXMSequenceRequestManager);
  -[AXMVisionEngine setSequenceRequestManager:](self, "setSequenceRequestManager:", v17);

}

- (BOOL)isEqual:(id)a3
{
  AXMVisionEngine *v4;
  BOOL v5;

  v4 = (AXMVisionEngine *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[AXMVisionEngine isEqualToEngine:](self, "isEqualToEngine:", v4);
  }

  return v5;
}

- (BOOL)isEqualToEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;

  v4 = a3;
  if (v4)
  {
    -[AXMVisionEngine identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[AXMVisionEngine sourceNodes](self, "sourceNodes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      objc_msgSend(v4, "sourceNodes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == objc_msgSend(v9, "count"))
      {
        -[AXMVisionEngine evaluationNodes](self, "evaluationNodes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");
        objc_msgSend(v4, "evaluationNodes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11 == objc_msgSend(v12, "count");

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[AXMVisionEngine identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AXMVisionEngine sourceNodes](self, "sourceNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") ^ v4;
  -[AXMVisionEngine evaluationNodes](self, "evaluationNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "count");

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionEngine)initWithCoder:(id)a3
{
  id v4;
  AXMVisionEngine *v5;
  AXMVisionEngine *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)AXMVisionEngine;
  v5 = -[AXMVisionEngine init](&v29, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AXMVisionEngine _commonInit](v5, "_commonInit");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionEngine setIdentifier:](v6, "setIdentifier:", v7);

    -[AXMVisionEngine setMaximumQueueSize:](v6, "setMaximumQueueSize:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("QueueSize")));
    -[AXMVisionEngine setDiagnosticsEnabled:](v6, "setDiagnosticsEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("diagnosticsEnabled")));
    -[AXMVisionEngine setPrioritySchedulingEnabled:](v6, "setPrioritySchedulingEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prioritySchedulingEnabled")));
    -[AXMVisionEngine setPrioritySchedulingAllowMultipleNodeExecution:](v6, "setPrioritySchedulingAllowMultipleNodeExecution:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prioritySchedulingAllowMultipleNodeExecution")));
    -[AXMVisionEngine setThresholdPriority:](v6, "setThresholdPriority:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("thresholdPriority")));
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    AXMSecureCodingClasses();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("SourceNodes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          -[AXMVisionEngine addSourceNode:](v6, "addSourceNode:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v11);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    AXMSecureCodingClasses();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("EvaluationNodes"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          -[AXMVisionEngine addEvaluationNode:](v6, "addEvaluationNode:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v19++));
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
      }
      while (v17);
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[AXMVisionEngine identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("Identifier"));

  -[AXMVisionEngine sourceNodes](self, "sourceNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("SourceNodes"));

  -[AXMVisionEngine evaluationNodes](self, "evaluationNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("EvaluationNodes"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[AXMVisionEngine maximumQueueSize](self, "maximumQueueSize"), CFSTR("QueueSize"));
  objc_msgSend(v7, "encodeBool:forKey:", -[AXMVisionEngine areDiagnosticsEnabled](self, "areDiagnosticsEnabled"), CFSTR("diagnosticsEnabled"));
  objc_msgSend(v7, "encodeBool:forKey:", -[AXMVisionEngine prioritySchedulingEnabled](self, "prioritySchedulingEnabled"), CFSTR("prioritySchedulingEnabled"));
  objc_msgSend(v7, "encodeBool:forKey:", -[AXMVisionEngine prioritySchedulingAllowMultipleNodeExecution](self, "prioritySchedulingAllowMultipleNodeExecution"), CFSTR("prioritySchedulingAllowMultipleNodeExecution"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[AXMVisionEngine thresholdPriority](self, "thresholdPriority"), CFSTR("thresholdPriority"));

}

- (BOOL)_queue_shouldContinueWithoutResultHandlers:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[AXMVisionEngine isCachingEnabled](self, "isCachingEnabled"))
  {
    objc_msgSend(v4, "cacheKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_queue_remotelyEvaluateWithSource:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  AXMediaLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1B0E3B000, v8, OS_LOG_TYPE_INFO, "Queueing remote evaluation of %@", buf, 0xCu);
  }

  v9 = (void *)MEMORY[0x1B5E128FC]();
  if (self->_queue_shouldNotifyServiceOfEngineConfigChange)
  {
    self->_queue_shouldNotifyServiceOfEngineConfigChange = 0;
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke;
  v14[3] = &unk_1E625CEF8;
  v14[4] = self;
  v12 = v6;
  v15 = v12;
  v13 = v7;
  v16 = v13;
  v17 = v10;
  dispatch_async(v11, v14);

  objc_autoreleasePoolPop(v9);
}

void __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "axMediaUtilsService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke_2;
  v9[3] = &unk_1E625CED0;
  v7 = v3;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v8;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v2, "visionEngine:evaluateSource:context:options:result:", v4, v7, v5, v6, v9);

}

void __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  AXMediaLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1B0E3B000, v7, OS_LOG_TYPE_INFO, "Received remote evaluation for %@", buf, 0xCu);
  }

  if (v6)
  {
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke_2_cold_1();

  }
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v11 = *(NSObject **)(v9 + 8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke_48;
  v14[3] = &unk_1E625CEA8;
  v14[4] = v9;
  v15 = v10;
  v16 = v5;
  v17 = v6;
  v12 = v6;
  v13 = v5;
  dispatch_async(v11, v14);

}

uint64_t __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke_48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleEvaluatedContext:result:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (BOOL)_queue_shouldEvaluateNode:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "shouldEvaluate:", v6))
    goto LABEL_43;
  if (objc_msgSend(v6, "detectText"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
  }
  if (objc_msgSend(v6, "detectScenes"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
  }
  if (objc_msgSend(v6, "detectObjects"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
  }
  if (objc_msgSend(v6, "detectNSFW"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
  }
  if (objc_msgSend(v6, "detectSignificantEvents"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
  }
  if (objc_msgSend(v6, "detectModelClassifications"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
  }
  if (objc_msgSend(v6, "detectCaptions"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
  }
  if (objc_msgSend(v6, "detectFaces"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
  }
  if (objc_msgSend(v6, "detectTraits"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
  }
  if (objc_msgSend(v6, "detectHorizon"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
  }
  if (objc_msgSend(v6, "detectRectangles"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
  }
  if (objc_msgSend(v6, "detectProminentObjects"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
  }
  if (objc_msgSend(v6, "detectIconClass"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_42;
  }
  if (objc_msgSend(v6, "detectBrailleEdges") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || objc_msgSend(v6, "detectAXElements") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || objc_msgSend(v6, "detectAesthetics") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || objc_msgSend(v6, "detectMADCaptions") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || objc_msgSend(v6, "detectMADScenes") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || objc_msgSend(v6, "detectMADFace") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || objc_msgSend(v6, "detectMADText") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_42:
    v7 = 1;
  }
  else
  {
LABEL_43:
    v7 = 0;
  }

  return v7;
}

- (id)_queue_activeEvaluationNodesForOptions:(id)a3 applyPriorityScheduling:(BOOL)a4 prioritySchedulingAllowMultipleNodeExecution:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  NSObject *v30;
  void *v32;
  _BOOL4 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  unint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v33 = a5;
  v5 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = self->_queue_evaluationNodes;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v14, "isEnabled")
          && -[AXMVisionEngine _queue_shouldEvaluateNode:withOptions:](self, "_queue_shouldEvaluateNode:withOptions:", v14, v7))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v11);
  }

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    AXMediaLogEnginePriority();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = -[AXMVisionEngine thresholdPriority](self, "thresholdPriority");
      *(_DWORD *)buf = 134217984;
      v43 = v16;
      _os_log_impl(&dword_1B0E3B000, v15, OS_LOG_TYPE_DEFAULT, "engine threshold priority: %ld", buf, 0xCu);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v17);
          v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          objc_msgSend(v23, "boostEffectivePriority");
          AXMediaLogEnginePriority();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend((id)objc_opt_class(), "title");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v23, "effectivePriority");
            *(_DWORD *)buf = 134218498;
            v43 = (unint64_t)v23;
            v44 = 2112;
            v45 = v25;
            v46 = 2048;
            v47 = v26;
            _os_log_impl(&dword_1B0E3B000, v24, OS_LOG_TYPE_DEFAULT, "   node <%p> :'%@'. boosted priority:%ld", buf, 0x20u);

          }
          v27 = objc_msgSend(v23, "effectivePriority");
          if (v27 >= -[AXMVisionEngine thresholdPriority](self, "thresholdPriority"))
          {
            if (v33)
            {
              objc_msgSend(v32, "addObject:", v23);
            }
            else if (v20)
            {
              v28 = objc_msgSend(v23, "effectivePriority");
              if (v28 > objc_msgSend(v20, "effectivePriority"))
              {
                v29 = v23;

                v20 = v29;
              }
            }
            else
            {
              v20 = v23;
            }
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
      }
      while (v19);

      if (!v33 && v20)
        objc_msgSend(v32, "addObject:", v20);
    }
    else
    {

      v20 = 0;
    }
    objc_msgSend(v32, "enumerateObjectsUsingBlock:", &__block_literal_global_5);
    v8 = v32;

    AXMediaLogEnginePriority();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = (unint64_t)v8;
      _os_log_impl(&dword_1B0E3B000, v30, OS_LOG_TYPE_DEFAULT, "highest priority node(s): %@", buf, 0xCu);
    }

  }
  return v8;
}

uint64_t __127__AXMVisionEngine__queue_activeEvaluationNodesForOptions_applyPriorityScheduling_prioritySchedulingAllowMultipleNodeExecution___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetEffectivePriority");
}

- (void)_queue_logEvaluatedResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "features");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "features");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v4, "features");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v31 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "description");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if (v14)
                objc_msgSend(v8, "addObject:", v14);

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
          }
          while (v11);
        }

        AXMediaLogResults();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[AXMVisionEngine _queue_logEvaluatedResult:].cold.4();

        AXMediaLogResults();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[AXMVisionEngine _queue_logEvaluatedResult:].cold.6(v4);

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v17 = v8;
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v27 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
              AXMediaLogResults();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v35 = v22;
                _os_log_debug_impl(&dword_1B0E3B000, v23, OS_LOG_TYPE_DEBUG, "  %@", buf, 0xCu);
              }

            }
            v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
          }
          while (v19);
        }

        AXMediaLogResults();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[AXMVisionEngine _queue_logEvaluatedResult:].cold.5(v4, v24);

        AXMediaLogResults();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          -[AXMVisionEngine _queue_logEvaluatedResult:].cold.4();

      }
      else
      {
        AXMediaLogResults();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[AXMVisionEngine _queue_logEvaluatedResult:].cold.3();
      }
    }
    else
    {
      AXMediaLogResults();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[AXMVisionEngine _queue_logEvaluatedResult:].cold.2();
    }
  }
  else
  {
    AXMediaLogResults();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[AXMVisionEngine _queue_logEvaluatedResult:].cold.1();
  }

}

- (BOOL)_queue_activeEvaluationNodesExclusivelyUseVisionFramework:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "requiresVisionFramework", (_QWORD)v10))
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (void)_queue_evaluateWithSource:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *queue;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  NSObject *group;
  _QWORD v31[4];
  id v32;
  AXMVisionEngine *v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  AXMVisionEngine *v44;
  id v45;
  _QWORD block[4];
  id v47;
  AXMVisionEngine *v48;
  id v49;
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1B5E128FC]();
  group = dispatch_group_create();
  if ((objc_msgSend(v7, "sourceProvidesResults") & 1) == 0)
  {
    objc_msgSend(v7, "analysisOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionEngine _queue_activeEvaluationNodesForOptions:applyPriorityScheduling:prioritySchedulingAllowMultipleNodeExecution:](self, "_queue_activeEvaluationNodesForOptions:applyPriorityScheduling:prioritySchedulingAllowMultipleNodeExecution:", v9, -[AXMVisionEngine prioritySchedulingEnabled](self, "prioritySchedulingEnabled"), -[AXMVisionEngine prioritySchedulingAllowMultipleNodeExecution](self, "prioritySchedulingAllowMultipleNodeExecution"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[AXMVisionEngine prioritySchedulingEnabled](self, "prioritySchedulingEnabled")
      && !-[AXMVisionEngine prioritySchedulingAllowMultipleNodeExecution](self, "prioritySchedulingAllowMultipleNodeExecution")&& (unint64_t)objc_msgSend(v10, "count") >= 2)
    {
      AXMediaLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[AXMVisionEngine _queue_evaluateWithSource:context:].cold.1();

    }
    if (objc_msgSend(v10, "count"))
    {
      AXMediaLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "analysisOptions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v13;
        _os_log_impl(&dword_1B0E3B000, v12, OS_LOG_TYPE_INFO, "Will begin image evaluation. %@", buf, 0xCu);

      }
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_78;
      block[3] = &unk_1E625CEA8;
      v28 = v7;
      v15 = v7;
      v47 = v15;
      v48 = self;
      v27 = v10;
      v16 = v10;
      v49 = v16;
      v29 = v6;
      v50 = v6;
      dispatch_group_async(group, queue, block);
      if (-[AXMVisionEngine imageRegistrationFilteringEnabled](self, "imageRegistrationFilteringEnabled"))
      {
        v17 = self->_queue;
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_3;
        v42[3] = &unk_1E625CFD0;
        v45 = &__block_literal_global_73;
        v43 = v15;
        v44 = self;
        dispatch_group_async(group, v17, v42);

      }
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v39 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
            v24 = self->_queue;
            v34[0] = MEMORY[0x1E0C809B0];
            v34[1] = 3221225472;
            v34[2] = __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_4;
            v34[3] = &unk_1E625CFF8;
            v34[4] = self;
            v35 = v15;
            v36 = v23;
            v37 = &__block_literal_global_73;
            dispatch_group_async(group, v24, v34);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
        }
        while (v20);
      }

      v6 = v29;
      v10 = v27;
      v7 = v28;
    }

  }
  v25 = self->_queue;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_81;
  v31[3] = &unk_1E625CB18;
  v26 = v7;
  v32 = v26;
  v33 = self;
  dispatch_group_notify(group, v25, v31);

  objc_autoreleasePoolPop(v8);
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a2;
  v5 = a3;
  AXMediaLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_cold_1();

  objc_msgSend(v4, "pipelineMetric");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Evaluate %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_76;
  v14[3] = &unk_1E625CF80;
  v15 = v4;
  v16 = v5;
  v12 = v5;
  v13 = v4;
  objc_msgSend(v7, "measure:execute:", v11, v14);

}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    AXMediaLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_76_cold_1(a1, (id *)(a1 + 32), v5);

  }
  else if (objc_msgSend(*(id *)(a1 + 40), "validateVisionKitSoftLinkSymbols"))
  {
    objc_msgSend(*(id *)(a1 + 40), "evaluate:metrics:", *(_QWORD *)(a1 + 32), v3);
  }

}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_78(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "pipelineMetric");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_2;
  v6[3] = &unk_1E625CFA8;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "measure:execute:", CFSTR("Create Image"), v6);

}

uint64_t __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEvaluationExclusivelyUsesVisionFramework:", objc_msgSend(*(id *)(a1 + 40), "_queue_activeEvaluationNodesExclusivelyUseVisionFramework:", *(_QWORD *)(a1 + 48)));
  return objc_msgSend(*(id *)(a1 + 56), "produceImage:", *(_QWORD *)(a1 + 32));
}

uint64_t __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], *(_QWORD *)(a1[5] + 32));
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "imageRegistrationFilteringEnabled")
    || (v2 = objc_msgSend(*(id *)(a1 + 40), "imageRegistrationState"),
        v2 >= objc_msgSend(*(id *)(a1 + 32), "minimumImageRegistrationSignalLevel")))
  {
    AXMediaLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_4_cold_2(a1);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_4_cold_1((id *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "auxiliaryDetectors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    while (objc_msgSend(v6, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "removeAllAuxiliaryDetectors");
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

      objc_msgSend(*(id *)(a1 + 40), "auxiliaryDetectors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v12, "copy");

    }
  }
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_81(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "result");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "disableResultLogging") & 1) == 0)
  {
    AXMediaLogResults();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

    if (v3)
      objc_msgSend(*(id *)(a1 + 40), "_queue_logEvaluatedResult:", v8);
  }
  v6 = a1 + 32;
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(v6 + 8);
  objc_msgSend(v4, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_queue_handleEvaluatedContext:result:error:", v4, v8, v7);

}

- (void)_queue_handleEvaluatedContext:(id)a3 result:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _AXMVisionEngineAnalysisTask *queue_currentTask;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "didFinishProcessingContext");
  if (-[AXMVisionEngine isCachingEnabled](self, "isCachingEnabled"))
  {
    objc_msgSend(v8, "cacheKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[AXMVisionEngine cache](self, "cache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cacheKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setResult:forKey:", v9, v13);

    }
  }
  objc_msgSend(v9, "features");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v10)
  {
    AXMediaLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[AXMVisionEngine _queue_handleEvaluatedContext:result:error:].cold.2();

    objc_msgSend(v8, "resultHandlers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionEngine _invokeResultHandlers:withError:](self, "_invokeResultHandlers:withError:", v17, v10);
LABEL_13:

    goto LABEL_14;
  }
  if (v15 > 0 || objc_msgSend(v8, "shouldCallCompletionHandlersForEmptyResultSet"))
  {
    AXMediaLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[AXMVisionEngine _queue_handleEvaluatedContext:result:error:].cold.1();

    objc_msgSend(v8, "resultHandlers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionEngine _invokeResultHandlers:withResult:](self, "_invokeResultHandlers:withResult:", v17, v9);
    goto LABEL_13;
  }
LABEL_14:
  -[AXMTask markAsComplete:](self->_queue_currentTask, "markAsComplete:", v10 == 0);
  queue_currentTask = self->_queue_currentTask;
  self->_queue_currentTask = 0;

}

- (NSArray)sourceNodes
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__AXMVisionEngine_sourceNodes__block_invoke;
  v5[3] = &unk_1E625CA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __30__AXMVisionEngine_sourceNodes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)canAddSourceNode:(id)a3
{
  return objc_msgSend((id)objc_opt_class(), "isSupported");
}

- (BOOL)canAddSourceNodeClass:(Class)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[objc_class isSupported](a3, "isSupported");
  else
    return 0;
}

- (void)addSourceNode:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  AXMVisionEngine *v9;

  v4 = a3;
  if (-[AXMVisionEngine canAddSourceNode:](self, "canAddSourceNode:", v4))
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__AXMVisionEngine_addSourceNode___block_invoke;
    v7[3] = &unk_1E625CB18;
    v8 = v4;
    v9 = self;
    dispatch_sync(queue, v7);

  }
  else
  {
    AXMediaLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[AXMVisionEngine addSourceNode:].cold.1();

  }
}

uint64_t __33__AXMVisionEngine_addSourceNode___block_invoke(uint64_t a1)
{
  NSObject *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isConnected"))
  {
    AXMediaLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __33__AXMVisionEngine_addSourceNode___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "connect:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", *(_QWORD *)(a1 + 32));
}

- (void)insertSourceNode:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  NSObject *queue;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  AXMVisionEngine *v11;
  int64_t v12;

  v6 = a3;
  if (-[AXMVisionEngine canAddSourceNode:](self, "canAddSourceNode:", v6))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__AXMVisionEngine_insertSourceNode_atIndex___block_invoke;
    block[3] = &unk_1E625D020;
    v10 = v6;
    v11 = self;
    v12 = a4;
    dispatch_sync(queue, block);

  }
  else
  {
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[AXMVisionEngine addSourceNode:].cold.1();

  }
}

uint64_t __44__AXMVisionEngine_insertSourceNode_atIndex___block_invoke(uint64_t a1)
{
  NSObject *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isConnected"))
  {
    AXMediaLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __33__AXMVisionEngine_addSourceNode___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "connect:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "insertObject:atIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)removeSourceNode:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  AXMVisionEngine *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AXMVisionEngine_removeSourceNode___block_invoke;
  block[3] = &unk_1E625CB18;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __36__AXMVisionEngine_removeSourceNode___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "disconnect");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)removeAllSourceNodes
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__AXMVisionEngine_removeAllSourceNodes__block_invoke;
  block[3] = &unk_1E625CCC0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __39__AXMVisionEngine_removeAllSourceNodes__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "disconnect", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (NSArray)evaluationNodes
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__AXMVisionEngine_evaluationNodes__block_invoke;
  v5[3] = &unk_1E625CA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __34__AXMVisionEngine_evaluationNodes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)canAddEvaluationNode:(id)a3
{
  return objc_msgSend((id)objc_opt_class(), "isSupported");
}

- (BOOL)canAddEvaluationNodeClass:(Class)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[objc_class isSupported](a3, "isSupported");
  else
    return 0;
}

- (void)addEvaluationNode:(id)a3
{
  id v4;
  NSObject *queue;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  AXMVisionEngine *v9;

  v4 = a3;
  if (-[AXMVisionEngine canAddEvaluationNode:](self, "canAddEvaluationNode:", v4))
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__AXMVisionEngine_addEvaluationNode___block_invoke;
    v7[3] = &unk_1E625CB18;
    v8 = v4;
    v9 = self;
    dispatch_sync(queue, v7);

  }
  else
  {
    AXMediaLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXMVisionEngine addEvaluationNode:].cold.1();

  }
}

uint64_t __37__AXMVisionEngine_addEvaluationNode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  char isKindOfClass;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isConnected"))
  {
    AXMediaLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __33__AXMVisionEngine_addSourceNode___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "connect:", *(_QWORD *)(a1 + 40));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  if ((isKindOfClass & 1) != 0)
    return objc_msgSend(v5, "insertObject:atIndex:", v4, 0);
  else
    return objc_msgSend(v5, "addObject:", v4);
}

- (void)insertEvaluationNode:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  NSObject *queue;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  AXMVisionEngine *v11;
  int64_t v12;

  v6 = a3;
  if (-[AXMVisionEngine canAddEvaluationNode:](self, "canAddEvaluationNode:", v6))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__AXMVisionEngine_insertEvaluationNode_atIndex___block_invoke;
    block[3] = &unk_1E625D020;
    v10 = v6;
    v11 = self;
    v12 = a4;
    dispatch_sync(queue, block);

  }
  else
  {
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[AXMVisionEngine insertEvaluationNode:atIndex:].cold.1();

  }
}

uint64_t __48__AXMVisionEngine_insertEvaluationNode_atIndex___block_invoke(uint64_t a1)
{
  NSObject *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isConnected"))
  {
    AXMediaLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __33__AXMVisionEngine_addSourceNode___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "connect:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "insertObject:atIndex:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

- (void)removeEvaluationNode:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  AXMVisionEngine *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AXMVisionEngine_removeEvaluationNode___block_invoke;
  block[3] = &unk_1E625CB18;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __40__AXMVisionEngine_removeEvaluationNode___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "disconnect");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)removeAllEvaluationNodes
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AXMVisionEngine_removeAllEvaluationNodes__block_invoke;
  block[3] = &unk_1E625CCC0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __43__AXMVisionEngine_removeAllEvaluationNodes__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "disconnect", (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

- (void)addSourceNodes:(id)a3 evaluationNodes:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        -[AXMVisionEngine addSourceNode:](self, "addSourceNode:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[AXMVisionEngine addEvaluationNode:](self, "addEvaluationNode:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (id)sourceNodeWithIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AXMVisionEngine_sourceNodeWithIdentifier___block_invoke;
  block[3] = &unk_1E625D048;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __44__AXMVisionEngine_sourceNodeWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_sourceNodeWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)evaluationNodeWithIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AXMVisionEngine_evaluationNodeWithIdentifier___block_invoke;
  block[3] = &unk_1E625D048;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __48__AXMVisionEngine_evaluationNodeWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_evaluationNodeWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_queue_sourceNodeWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_queue_sourceNodes;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_queue_evaluationNodeWithIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_queue_evaluationNodes;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)makeUniqueIdentifierForNode:(Class)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AXMVisionEngine_makeUniqueIdentifierForNode___block_invoke;
  block[3] = &unk_1E625D070;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__AXMVisionEngine_makeUniqueIdentifierForNode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_makeUniqueIdentifierForNode:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_queue_makeUniqueIdentifierForNode:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("AXM"), &stru_1E6260C18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Node"), &stru_1E6260C18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = 1;
  do
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld"), v6, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    ++v8;
  }
  while (-[AXMVisionEngine _queue_nodeIdentifierExists:](self, "_queue_nodeIdentifierExists:", v7));

  return v7;
}

- (BOOL)nodeIdentifierExists:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AXMVisionEngine_nodeIdentifierExists___block_invoke;
  block[3] = &unk_1E625D048;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __40__AXMVisionEngine_nodeIdentifierExists___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_nodeIdentifierExists:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_nodeIdentifierExists:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = self->_queue_sourceNodes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v4);

      if ((v11 & 1) != 0)
        goto LABEL_18;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_queue_evaluationNodes;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
LABEL_11:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "identifier", (_QWORD)v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", v4);

      if ((v16 & 1) != 0)
        break;
      if (v12 == ++v14)
      {
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
          goto LABEL_11;
        goto LABEL_19;
      }
    }
LABEL_18:
    LOBYTE(v12) = 1;
  }
LABEL_19:

  return v12;
}

- (id)resultHandlers
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__AXMVisionEngine_resultHandlers__block_invoke;
  v5[3] = &unk_1E625CA50;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__AXMVisionEngine_resultHandlers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addResultHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __36__AXMVisionEngine_addResultHandler___block_invoke;
    block[3] = &unk_1E625C480;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

uint64_t __36__AXMVisionEngine_addResultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addResultHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_addResultHandler:(id)a3
{
  NSMutableArray *queue_resultHandlers;
  id v4;

  queue_resultHandlers = self->_queue_resultHandlers;
  v4 = (id)MEMORY[0x1B5E12AE8](a3, a2);
  -[NSMutableArray addObject:](queue_resultHandlers, "addObject:", v4);

}

- (void)removeResultHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __39__AXMVisionEngine_removeResultHandler___block_invoke;
    block[3] = &unk_1E625C480;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

uint64_t __39__AXMVisionEngine_removeResultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeResultHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_removeResultHandler:(id)a3
{
  NSMutableArray *queue_resultHandlers;
  id v4;

  queue_resultHandlers = self->_queue_resultHandlers;
  v4 = (id)MEMORY[0x1B5E12AE8](a3, a2);
  -[NSMutableArray removeObject:](queue_resultHandlers, "removeObject:", v4);

}

- (void)removeAllResultHandlers
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AXMVisionEngine_removeAllResultHandlers__block_invoke;
  block[3] = &unk_1E625CCC0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __42__AXMVisionEngine_removeAllResultHandlers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllResultHandlers");
}

- (void)_queue_removeAllResultHandlers
{
  -[NSMutableArray removeAllObjects](self->_queue_resultHandlers, "removeAllObjects");
}

- (void)_invokeResultHandlers:(id)a3 withError:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_invokeResultHandlers:(id)a3 withResult:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)isCachingEnabled
{
  void *v2;
  BOOL v3;

  -[AXMVisionEngine cache](self, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)cacheSize
{
  void *v2;
  int64_t v3;

  -[AXMVisionEngine cache](self, "cache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cacheSize");

  return v3;
}

- (void)enableResultCachingWithCacheSize:(int64_t)a3
{
  AXMVisionEngineCache *v4;

  v4 = -[AXMVisionEngineCache initWithCacheSize:]([AXMVisionEngineCache alloc], "initWithCacheSize:", a3);
  -[AXMVisionEngine setCache:](self, "setCache:", v4);

}

- (void)disableResultCaching
{
  -[AXMVisionEngine setCache:](self, "setCache:", 0);
}

- (void)updateEngineConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    dispatch_get_global_queue(2, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__AXMVisionEngine_updateEngineConfiguration___block_invoke;
    v6[3] = &unk_1E625D098;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __45__AXMVisionEngine_updateEngineConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AXMVisionEngine_updateEngineConfiguration___block_invoke_2;
  block[3] = &unk_1E625CCC0;
  block[4] = v2;
  dispatch_async(v3, block);
}

void __45__AXMVisionEngine_updateEngineConfiguration___block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__AXMVisionEngine_updateEngineConfiguration___block_invoke_3;
  block[3] = &unk_1E625CCC0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __45__AXMVisionEngine_updateEngineConfiguration___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("VisionEngineConfigurationDidChange"), *(_QWORD *)(a1 + 32));

}

- (void)prewarmEngine
{
  NSObject *v2;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_94);

}

- (void)purgeResources:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (!v4)
    v4 = (id)objc_msgSend(&__block_literal_global_95_0, "copy");
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__AXMVisionEngine_purgeResources___block_invoke_2;
  v7[3] = &unk_1E625C480;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __34__AXMVisionEngine_purgeResources___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  id v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "requiresVisionFramework") & 1) != 0)
        {

          v29 = 0;
          v30 = (uint64_t)&v29;
          v31 = 0x2020000000;
          v6 = (id *)getVNRequestHandlerCleanupOption_AllPipelinesSymbolLoc_ptr;
          v32 = (void *)getVNRequestHandlerCleanupOption_AllPipelinesSymbolLoc_ptr;
          if (!getVNRequestHandlerCleanupOption_AllPipelinesSymbolLoc_ptr)
          {
            v7 = (void *)VisionLibrary_3();
            v6 = (id *)dlsym(v7, "VNRequestHandlerCleanupOption_AllPipelines");
            *(_QWORD *)(v30 + 24) = v6;
            getVNRequestHandlerCleanupOption_AllPipelinesSymbolLoc_ptr = (uint64_t)v6;
          }
          _Block_object_dispose(&v29, 8);
          if (!v6)
            goto LABEL_25;
          v8 = *v6;
          v38[0] = v8;
          v29 = 0;
          v30 = (uint64_t)&v29;
          v31 = 0x2020000000;
          v9 = (id *)getVNCleanupLevel_CompleteSymbolLoc_ptr;
          v32 = (void *)getVNCleanupLevel_CompleteSymbolLoc_ptr;
          if (!getVNCleanupLevel_CompleteSymbolLoc_ptr)
          {
            v10 = (void *)VisionLibrary_3();
            v9 = (id *)dlsym(v10, "VNCleanupLevel_Complete");
            *(_QWORD *)(v30 + 24) = v9;
            getVNCleanupLevel_CompleteSymbolLoc_ptr = (uint64_t)v9;
          }
          _Block_object_dispose(&v29, 8);
          if (!v9)
            goto LABEL_25;
          v11 = *v9;
          v39 = v11;
          v29 = 0;
          v30 = (uint64_t)&v29;
          v31 = 0x2020000000;
          v12 = (id *)getVNRequestHandlerCleanupOption_ImageBuffersSymbolLoc_ptr;
          v32 = (void *)getVNRequestHandlerCleanupOption_ImageBuffersSymbolLoc_ptr;
          if (!getVNRequestHandlerCleanupOption_ImageBuffersSymbolLoc_ptr)
          {
            v13 = (void *)VisionLibrary_3();
            v12 = (id *)dlsym(v13, "VNRequestHandlerCleanupOption_ImageBuffers");
            *(_QWORD *)(v30 + 24) = v12;
            getVNRequestHandlerCleanupOption_ImageBuffersSymbolLoc_ptr = (uint64_t)v12;
          }
          _Block_object_dispose(&v29, 8);
          if (!v12)
            goto LABEL_25;
          v14 = *v12;
          v38[1] = v14;
          v29 = 0;
          v30 = (uint64_t)&v29;
          v31 = 0x2020000000;
          v15 = (id *)getVNCleanupPurgeAllSymbolLoc_ptr;
          v32 = (void *)getVNCleanupPurgeAllSymbolLoc_ptr;
          if (!getVNCleanupPurgeAllSymbolLoc_ptr)
          {
            v16 = (void *)VisionLibrary_3();
            v15 = (id *)dlsym(v16, "VNCleanupPurgeAll");
            *(_QWORD *)(v30 + 24) = v15;
            getVNCleanupPurgeAllSymbolLoc_ptr = (uint64_t)v15;
          }
          _Block_object_dispose(&v29, 8);
          if (!v15)
          {
LABEL_25:
            __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
            __break(1u);
          }
          v40 = *v15;
          v17 = (void *)MEMORY[0x1E0C99D80];
          v18 = v40;
          objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", &v39, v38, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = 0;
          v35 = &v34;
          v36 = 0x2050000000;
          v20 = (void *)getVNImageRequestHandlerClass_softClass;
          v37 = getVNImageRequestHandlerClass_softClass;
          v21 = MEMORY[0x1E0C809B0];
          if (!getVNImageRequestHandlerClass_softClass)
          {
            v29 = MEMORY[0x1E0C809B0];
            v30 = 3221225472;
            v31 = (uint64_t)__getVNImageRequestHandlerClass_block_invoke;
            v32 = &unk_1E625C4E8;
            v33 = &v34;
            __getVNImageRequestHandlerClass_block_invoke((uint64_t)&v29);
            v20 = (void *)v35[3];
          }
          v22 = objc_retainAutorelease(v20);
          _Block_object_dispose(&v34, 8);
          v23[0] = v21;
          v23[1] = 3221225472;
          v23[2] = __34__AXMVisionEngine_purgeResources___block_invoke_3;
          v23[3] = &unk_1E625D100;
          v24 = *(id *)(a1 + 40);
          objc_msgSend(v22, "requestForcedCleanupWithOptions:completion:", v19, v23);

          return;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
      if (v3)
        continue;
      break;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __34__AXMVisionEngine_purgeResources___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)axmDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  unint64_t thresholdPriority;
  int64_t maximumQueueSize;
  NSString *identifier;
  int64_t v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_prioritySchedulingEnabled)
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  maximumQueueSize = self->_maximumQueueSize;
  thresholdPriority = self->_thresholdPriority;
  identifier = self->_identifier;
  v10 = -[AXMVisionEngine cacheSize](self, "cacheSize");
  if (-[AXMVisionEngine areDiagnosticsEnabled](self, "areDiagnosticsEnabled"))
    v11 = CFSTR("Y");
  else
    v11 = CFSTR("N");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: ID:'%@' [PriorSched:%@ threshhold:%lu] maxQueueSize:%ld cacheSize:%ld metrics:%@"), v5, self, identifier, v6, thresholdPriority, maximumQueueSize, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)axmAppendRecursiveDescription:(id)a3 withIndentation:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "axmIndentationString:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMVisionEngine axmDescription](self, "axmDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@%@\n"), v7, v8);

  -[AXMVisionEngine sourceNodes](self, "sourceNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("%@Source Nodes:\n"), v7);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v14++), "axmAppendRecursiveDescription:withIndentation:", v6, a4 + 1);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v12);
    }

  }
  -[AXMVisionEngine evaluationNodes](self, "evaluationNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("%@Evaluation Nodes:\n"), v7);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      v20 = a4 + 1;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "axmAppendRecursiveDescription:withIndentation:", v6, v20);
        }
        while (v18 != v21);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v18);
    }

  }
}

- (void)dispatcher:(id)a3 handleTask:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  AXMVisionEngine *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__AXMVisionEngine_dispatcher_handleTask___block_invoke;
  v8[3] = &unk_1E625CB18;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __41__AXMVisionEngine_dispatcher_handleTask___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  NSObject *v10;

  v2 = *(void **)(a1 + 32);
  v3 = v2;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sequenceRequestManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSequenceRequestManager:", v6);

  objc_msgSend(v5, "addResultHandlers:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  objc_msgSend(v5, "resultHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {

  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "_queue_shouldContinueWithoutResultHandlers:", v5);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v3, "markAsComplete:", 0);
      goto LABEL_13;
    }
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v9 + 56))
  {
    AXMediaLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __41__AXMVisionEngine_dispatcher_handleTask___block_invoke_cold_1();

    v9 = *(_QWORD *)(a1 + 40);
  }
  objc_storeStrong((id *)(v9 + 56), v2);
  objc_msgSend(v5, "willBeginProcessingContext");
  if (objc_msgSend(v4, "shouldProcessRemotely") && (AXMIsRunningInServiceProcess() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_queue_remotelyEvaluateWithSource:context:", v4, v5);
  else
    objc_msgSend(*(id *)(a1 + 40), "_queue_evaluateWithSource:context:", v4, v5);
LABEL_13:

}

- (void)axMediaUtilitiesService:(id)a3 eventOccurred:(int64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__AXMVisionEngine_axMediaUtilitiesService_eventOccurred___block_invoke;
  v5[3] = &unk_1E625D128;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

void __57__AXMVisionEngine_axMediaUtilitiesService_eventOccurred___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  AXMediaLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v9[0] = 67109120;
    v9[1] = v3;
    _os_log_impl(&dword_1B0E3B000, v2, OS_LOG_TYPE_DEFAULT, "AXMVisionEngine: event occurred: %d", (uint8_t *)v9, 8u);
  }

  if ((unint64_t)(*(_QWORD *)(a1 + 40) - 1) <= 2)
  {
    AXMediaLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_1B0E3B000, v4, OS_LOG_TYPE_DEFAULT, "AXMVisionEngine: service indicated it went invalid. clearing client-side tasks", (uint8_t *)v9, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "taskDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "unscheduleAllTasks");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "markAsComplete:", 0);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 56);
    *(_QWORD *)(v7 + 56) = 0;

  }
}

- (void)triggerWithSource:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  int64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1B5E128FC]();
  if (v7)
  {
    if (v6)
    {
      if ((objc_msgSend(v7, "sourceProvidesResults") & 1) == 0)
      {
        v9 = -[AXMVisionEngine maximumQueueSize](self, "maximumQueueSize");
        -[AXMVisionEngine taskDispatcher](self, "taskDispatcher");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9)
        {
          v12 = objc_msgSend(v10, "count");
          v13 = -[AXMVisionEngine maximumQueueSize](self, "maximumQueueSize");

          if (v12 >= v13)
          {
            AXMediaLogCommon();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v35 = -[AXMVisionEngine maximumQueueSize](self, "maximumQueueSize");
              _os_log_impl(&dword_1B0E3B000, v14, OS_LOG_TYPE_DEFAULT, "AXMVisionEngine: ignoring task since queue is full (maximumQueueSize = %ld)", buf, 0xCu);
            }

            -[AXMVisionEngine _invokeFullQueueResultHandlersForContext:](self, "_invokeFullQueueResultHandlersForContext:", v7);
            goto LABEL_29;
          }
        }
        else
        {
          v28 = v7;
          v29 = v6;
          objc_msgSend(v10, "unscheduleAllTasks");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v18 = v17;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v31;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v31 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * i);
                objc_msgSend(v23, "context");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v24, "sourceProvidesResults"))
                {
                  -[AXMVisionEngine taskDispatcher](self, "taskDispatcher");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "scheduleTask:", v23);

                }
                else
                {
                  AXMediaLogCommon();
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B0E3B000, v26, OS_LOG_TYPE_DEFAULT, "AXMVisionEngine: canceling queued task to replace with newer incoming task", buf, 2u);
                  }

                  objc_msgSend(v23, "context");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  -[AXMVisionEngine _invokeFullQueueResultHandlersForContext:](self, "_invokeFullQueueResultHandlersForContext:", v25);
                }

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
            }
            while (v20);
          }

          v7 = v28;
          v6 = v29;
        }
      }
      +[_AXMVisionEngineAnalysisTask itemWithSource:context:](_AXMVisionEngineAnalysisTask, "itemWithSource:context:", v6, v7);
      v16 = objc_claimAutoreleasedReturnValue();
      -[AXMVisionEngine taskDispatcher](self, "taskDispatcher");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "scheduleTask:", v16);

LABEL_28:
      goto LABEL_29;
    }
LABEL_12:
    AXMediaLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[AXMVisionEngine triggerWithSource:context:].cold.1();
    goto LABEL_28;
  }
  AXMediaLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    -[AXMVisionEngine triggerWithSource:context:].cold.2();

  if (!v6)
    goto LABEL_12;
LABEL_29:
  objc_autoreleasePoolPop(v8);

}

- (void)_invokeFullQueueResultHandlersForContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "shouldCallCompletionHandlersForEngineBusyError"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resultHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

    _AXMMakeError(1, CFSTR("Engine queue is at capacity"), v6, v7, v8, v9, v10, v11, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionEngine _invokeResultHandlers:withError:](self, "_invokeResultHandlers:withError:", v4, v12);

  }
}

- (BOOL)engineWillAcceptTiggerWithSource:(id)a3
{
  void *v4;
  uint64_t v5;
  BOOL v6;

  -[AXMVisionEngine taskDispatcher](self, "taskDispatcher", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = v5 < -[AXMVisionEngine maximumQueueSize](self, "maximumQueueSize")
    || -[AXMVisionEngine maximumQueueSize](self, "maximumQueueSize") == 0;

  return v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (int64_t)maximumQueueSize
{
  return self->_maximumQueueSize;
}

- (void)setMaximumQueueSize:(int64_t)a3
{
  self->_maximumQueueSize = a3;
}

- (BOOL)prioritySchedulingEnabled
{
  return self->_prioritySchedulingEnabled;
}

- (void)setPrioritySchedulingEnabled:(BOOL)a3
{
  self->_prioritySchedulingEnabled = a3;
}

- (BOOL)prioritySchedulingAllowMultipleNodeExecution
{
  return self->_prioritySchedulingAllowMultipleNodeExecution;
}

- (void)setPrioritySchedulingAllowMultipleNodeExecution:(BOOL)a3
{
  self->_prioritySchedulingAllowMultipleNodeExecution = a3;
}

- (unint64_t)thresholdPriority
{
  return self->_thresholdPriority;
}

- (void)setThresholdPriority:(unint64_t)a3
{
  self->_thresholdPriority = a3;
}

- (BOOL)imageRegistrationFilteringEnabled
{
  return self->_imageRegistrationFilteringEnabled;
}

- (void)setImageRegistrationFilteringEnabled:(BOOL)a3
{
  self->_imageRegistrationFilteringEnabled = a3;
}

- (int64_t)minimumImageRegistrationSignalLevel
{
  return self->_minimumImageRegistrationSignalLevel;
}

- (void)setMinimumImageRegistrationSignalLevel:(int64_t)a3
{
  self->_minimumImageRegistrationSignalLevel = a3;
}

- (AXMVisionEngineCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (BOOL)areDiagnosticsEnabled
{
  return self->_diagnosticsEnabled;
}

- (void)setDiagnosticsEnabled:(BOOL)a3
{
  self->_diagnosticsEnabled = a3;
}

- (BOOL)disableResultLogging
{
  return self->_disableResultLogging;
}

- (void)setDisableResultLogging:(BOOL)a3
{
  self->_disableResultLogging = a3;
}

- (AXMService)axMediaUtilsService
{
  return self->_axMediaUtilsService;
}

- (void)setAxMediaUtilsService:(id)a3
{
  objc_storeStrong((id *)&self->_axMediaUtilsService, a3);
}

- (AXMTaskDispatcher)taskDispatcher
{
  return self->_taskDispatcher;
}

- (void)setTaskDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_taskDispatcher, a3);
}

- (AXMSequenceRequestManager)sequenceRequestManager
{
  return self->_sequenceRequestManager;
}

- (void)setSequenceRequestManager:(id)a3
{
  objc_storeStrong((id *)&self->_sequenceRequestManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceRequestManager, 0);
  objc_storeStrong((id *)&self->_taskDispatcher, 0);
  objc_storeStrong((id *)&self->_axMediaUtilsService, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue_currentTask, 0);
  objc_storeStrong((id *)&self->_queue_resultHandlers, 0);
  objc_storeStrong((id *)&self->_queue_imageRegistrationNode, 0);
  objc_storeStrong((id *)&self->_queue_evaluationNodes, 0);
  objc_storeStrong((id *)&self->_queue_sourceNodes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __61__AXMVisionEngine__queue_remotelyEvaluateWithSource_context___block_invoke_2_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_3_0(&dword_1B0E3B000, v1, (uint64_t)v1, "Recived error for remote evaluation: %@\nSource: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_logEvaluatedResult:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1B0E3B000, v0, v1, "Did not produce result features. Result was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_logEvaluatedResult:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1B0E3B000, v0, v1, "Did not produce result features. Features was nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_logEvaluatedResult:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1B0E3B000, v0, v1, "Did not produce result features. Feature list was empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_logEvaluatedResult:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1B0E3B000, v0, v1, "------------------------------------------------------", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_logEvaluatedResult:(void *)a1 .cold.5(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "detectedFeatureDescriptionWithOptions:", MEMORY[0x1E0C9AA70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "detectedTextDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_DEBUG, "Resulting speakable description. [features:'%@'] [text:'%@']", v6, 0x16u);

  OUTLINED_FUNCTION_9();
}

- (void)_queue_logEvaluatedResult:(void *)a1 .cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "features");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "count");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_2(&dword_1B0E3B000, v2, v3, "Did produce result with %lu features:", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)_queue_evaluateWithSource:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "With priority scheduling, there can be at most 1 evaluation node per cycle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)objc_opt_class(), "title");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_2(&dword_1B0E3B000, v1, v2, "Will run detector: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_7();
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_76_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a2, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_0(&dword_1B0E3B000, a3, v8, "Will not run detector '%@' due to previous error set in context: %@", v9);

  OUTLINED_FUNCTION_9();
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_4_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_2(&dword_1B0E3B000, v2, v3, "Finish evalute block: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __53__AXMVisionEngine__queue_evaluateWithSource_context___block_invoke_4_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_2(&dword_1B0E3B000, v2, v3, "Start evalute block: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

- (void)_queue_handleEvaluatedContext:result:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_1B0E3B000, v0, v1, "Invoking remote result handler for result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_handleEvaluatedContext:result:error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1B0E3B000, v0, OS_LOG_TYPE_DEBUG, "Invoking remote result handler for error: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)addSourceNode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1B0E3B000, v0, v1, "Cannot add source node. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __33__AXMVisionEngine_addSourceNode___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Cannot add a node that is already connected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)addEvaluationNode:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1B0E3B000, v0, OS_LOG_TYPE_ERROR, "Cannot add evaluation node. %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)insertEvaluationNode:atIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1B0E3B000, v0, v1, "Cannot add evaluation node. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __41__AXMVisionEngine_dispatcher_handleTask___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "Current task is not nil but we're resetting it", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)triggerWithSource:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "A source must be provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)triggerWithSource:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B0E3B000, v0, v1, "A context must be provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
