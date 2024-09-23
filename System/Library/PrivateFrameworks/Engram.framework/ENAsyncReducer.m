@implementation ENAsyncReducer

- (ENAsyncReducer)initWithInput:(id)a3 initialValue:(id)a4
{
  id v7;
  id v8;
  ENAsyncReducer *v9;
  ENAsyncReducer *v10;
  uint64_t v11;
  CUTResult *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ENAsyncReducer;
  v9 = -[ENAsyncReducer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_input, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D13220]), "initWithSuccess:", v8);
    v12 = v10->_result;
    v10->_result = (CUTResult *)v11;

  }
  return v10;
}

- (void)reduceWithCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[ENAsyncReducer setCompletionBlock:](self, "setCompletionBlock:", a3);
  +[ENLog utilities](ENLog, "utilities");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[ENAsyncReducer input](self, "input");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v12 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D4CF8000, v4, OS_LOG_TYPE_INFO, "Reduce {input: %ld}", buf, 0xCu);

  }
  -[ENAsyncReducer reducerBlock](self, "reducerBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ENAsyncReducer input](self, "input");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAsyncReducer result](self, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1D4D03BB0;
    v10[3] = &unk_1E987B730;
    v10[4] = self;
    -[ENAsyncReducer _reduceWithPending:visited:currentResult:completion:](self, "_reduceWithPending:visited:currentResult:completion:", v7, MEMORY[0x1E0C9AA60], v8, v10);

  }
  else
  {
    +[ENLog utilities](ENLog, "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4CF8000, v9, OS_LOG_TYPE_DEFAULT, "Missing reduce block -- Done", buf, 2u);
    }

    -[ENAsyncReducer result](self, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAsyncReducer _completeWithResult:](self, "_completeWithResult:", v7);
  }

}

- (void)_completeWithResult:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);

  v4 = a3;
  -[ENAsyncReducer setResult:](self, "setResult:", v4);
  -[ENAsyncReducer completionBlock](self, "completionBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);

  -[ENAsyncReducer setCompletionBlock:](self, "setCompletionBlock:", 0);
  -[ENAsyncReducer setReducerBlock:](self, "setReducerBlock:", 0);
}

- (void)_reduceWithPending:(id)a3 visited:(id)a4 currentResult:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  ENAsyncReducerState *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(_QWORD, _QWORD);
  id v27;
  uint8_t buf[8];
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subarrayWithRange:", 1, objc_msgSend(v10, "count") - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObject:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(ENAsyncReducerState);
    -[ENAsyncReducerState setVisitedItems:](v17, "setVisitedItems:", v11);
    -[ENAsyncReducerState setPendingItems:](v17, "setPendingItems:", v15);
    -[ENAsyncReducerState setCurrentItem:](v17, "setCurrentItem:", v14);
    v18 = objc_msgSend(v12, "state");
    v27 = v11;
    if (v18 == 1)
    {
      -[ENAsyncReducerState setCurrentResult:](v17, "setCurrentResult:", 0);
    }
    else if (!v18)
    {
      objc_msgSend(v12, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENAsyncReducerState setCurrentResult:](v17, "setCurrentResult:", v19);

    }
    v21 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = sub_1D4D03FB4;
    v35[3] = &unk_1E987B758;
    v22 = v13;
    v36 = v22;
    -[ENAsyncReducerState setCancelBlock:](v17, "setCancelBlock:", v35);
    v33[0] = v21;
    v33[1] = 3221225472;
    v33[2] = sub_1D4D0401C;
    v33[3] = &unk_1E987B780;
    v23 = v22;
    v34 = v23;
    -[ENAsyncReducerState setStopBlock:](v17, "setStopBlock:", v33);
    v29[0] = v21;
    v29[1] = 3221225472;
    v29[2] = sub_1D4D04084;
    v29[3] = &unk_1E987B7A8;
    v29[4] = self;
    v30 = v15;
    v31 = v16;
    v32 = v23;
    v24 = v16;
    v25 = v15;
    -[ENAsyncReducerState setContinueBlock:](v17, "setContinueBlock:", v29);
    -[ENAsyncReducer reducerBlock](self, "reducerBlock");
    v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, ENAsyncReducerState *))v26)[2](v26, v17);

    v11 = v27;
  }
  else
  {
    +[ENLog utilities](ENLog, "utilities");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4CF8000, v20, OS_LOG_TYPE_INFO, "No more items -- Done", buf, 2u);
    }

    (*((void (**)(id, id))v13 + 2))(v13, v12);
  }

}

- (NSArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (CUTResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (id)reducerBlock
{
  return self->_reducerBlock;
}

- (void)setReducerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_reducerBlock, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end
