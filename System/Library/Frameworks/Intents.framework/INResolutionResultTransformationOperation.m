@implementation INResolutionResultTransformationOperation

- (INResolutionResultTransformationOperation)initWithResult:(id)a3 intent:(id)a4 intentSlotDescription:(id)a5 optionsProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  INResolutionResultTransformationOperation *v15;
  INResolutionResultTransformationOperation *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)INResolutionResultTransformationOperation;
  v15 = -[INResolutionResultTransformationOperation init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_result, a3);
    objc_storeStrong((id *)&v16->_intent, a4);
    objc_storeStrong((id *)&v16->_intentSlotDescription, a5);
    objc_storeStrong((id *)&v16->_optionsProvider, a6);
  }

  return v16;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  self->_executing = 1;
  -[INResolutionResultTransformationOperation result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INResolutionResultTransformationOperation intent](self, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INResolutionResultTransformationOperation intentSlotDescription](self, "intentSlotDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INResolutionResultTransformationOperation optionsProvider](self, "optionsProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__INResolutionResultTransformationOperation_start__block_invoke;
  v7[3] = &unk_1E22908D8;
  v7[4] = self;
  objc_msgSend(v3, "transformResolutionResultForIntent:intentSlotDescription:withOptionsProvider:completion:", v4, v5, v6, v7);

}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (INIntentResolutionResultDataProviding)result
{
  return self->_result;
}

- (INIntent)intent
{
  return self->_intent;
}

- (INIntentSlotDescription)intentSlotDescription
{
  return self->_intentSlotDescription;
}

- (INIntentParameterOptionsProviding)optionsProvider
{
  return self->_optionsProvider;
}

- (id)returnBlock
{
  return self->_returnBlock;
}

- (void)setReturnBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_returnBlock, 0);
  objc_storeStrong((id *)&self->_optionsProvider, 0);
  objc_storeStrong((id *)&self->_intentSlotDescription, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

void __50__INResolutionResultTransformationOperation_start__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void (**v6)(void);
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("executing"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 249) = 0;
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("executing"));
  objc_msgSend(*(id *)(a1 + 32), "returnBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "returnBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("finished"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 248) = 1;
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("finished"));
  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

  }
}

@end
