@implementation DMCEnrollmentFlowControllerBase

- (DMCEnrollmentFlowControllerBase)init
{
  DMCEnrollmentFlowControllerBase *v2;
  uint64_t v3;
  NSMutableArray *stepQueue;
  id v5;
  double v6;
  double v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  DMCHangDetectionQueue *workerQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DMCEnrollmentFlowControllerBase;
  v2 = -[DMCEnrollmentFlowControllerBase init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    stepQueue = v2->_stepQueue;
    v2->_stepQueue = (NSMutableArray *)v3;

    v5 = objc_alloc(MEMORY[0x24BE2A800]);
    objc_msgSend(MEMORY[0x24BE2A7F0], "enrollmentStepTimeoutThresholdWithDefaultValue:", 10.0);
    v7 = v6;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "initWithQoS:hangThreshold:owner:", 25, v9, v7);
    workerQueue = v2->_workerQueue;
    v2->_workerQueue = (DMCHangDetectionQueue *)v10;

    -[DMCHangDetectionQueue setShouldDumpStackshot:](v2->_workerQueue, "setShouldDumpStackshot:", 1);
  }
  return v2;
}

- (void)_appendSteps:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DMCEnrollmentFlowControllerBase workerQueue](self, "workerQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__DMCEnrollmentFlowControllerBase__appendSteps___block_invoke;
  v7[3] = &unk_24DBE3B60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "queueBlock:", v7);

}

void __48__DMCEnrollmentFlowControllerBase__appendSteps___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stepQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));

}

- (void)_pollNextStep
{
  void *v3;
  _QWORD v4[5];

  -[DMCEnrollmentFlowControllerBase workerQueue](self, "workerQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__DMCEnrollmentFlowControllerBase__pollNextStep__block_invoke;
  v4[3] = &unk_24DBE3370;
  v4[4] = self;
  objc_msgSend(v3, "queueBlock:", v4);

}

uint64_t __48__DMCEnrollmentFlowControllerBase__pollNextStep__block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "nextStepIndex");
  objc_msgSend(*(id *)(a1 + 32), "stepQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = *(void **)(a1 + 32);
  if (v2 >= v4)
    return objc_msgSend(v5, "_workerQueue_flowCompleted");
  objc_msgSend(v5, "stepQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "nextStepIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "setNextStepIndex:", objc_msgSend(*(id *)(a1 + 32), "nextStepIndex") + 1);
  return objc_msgSend(*(id *)(a1 + 32), "_workerQueue_performFlowStep:", v8);
}

- (void)_resetToInitialSteps
{
  void *v3;
  _QWORD v4[5];

  -[DMCEnrollmentFlowControllerBase workerQueue](self, "workerQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__DMCEnrollmentFlowControllerBase__resetToInitialSteps__block_invoke;
  v4[3] = &unk_24DBE3370;
  v4[4] = self;
  objc_msgSend(v3, "queueBlock:", v4);

}

uint64_t __55__DMCEnrollmentFlowControllerBase__resetToInitialSteps__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "stepQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "setNextStepIndex:", 0);
}

- (void)_jumpToStep:(unint64_t)a3
{
  void *v5;
  _QWORD v6[6];

  -[DMCEnrollmentFlowControllerBase workerQueue](self, "workerQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__DMCEnrollmentFlowControllerBase__jumpToStep___block_invoke;
  v6[3] = &unk_24DBE3E40;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "queueBlock:", v6);

}

uint64_t __47__DMCEnrollmentFlowControllerBase__jumpToStep___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "stepQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "indexOfObject:", v3);

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "stepQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count");

    objc_msgSend(*(id *)(a1 + 32), "stepQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setNextStepIndex:", v4);
}

- (DMCHangDetectionQueue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workerQueue, a3);
}

- (unint64_t)currentStep
{
  return self->_currentStep;
}

- (void)setCurrentStep:(unint64_t)a3
{
  self->_currentStep = a3;
}

- (unint64_t)nextStepIndex
{
  return self->_nextStepIndex;
}

- (void)setNextStepIndex:(unint64_t)a3
{
  self->_nextStepIndex = a3;
}

- (NSMutableArray)stepQueue
{
  return self->_stepQueue;
}

- (void)setStepQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stepQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepQueue, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

@end
