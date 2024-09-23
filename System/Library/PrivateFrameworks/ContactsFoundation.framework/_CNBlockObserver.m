@implementation _CNBlockObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enforcement, 0);
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_resultBlock, 0);
}

- (_CNBlockObserver)initWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CNBlockObserver *v11;
  uint64_t v12;
  id resultBlock;
  uint64_t v14;
  id completionBlock;
  uint64_t v16;
  id failureBlock;
  CNObservableContractEnforcement *v18;
  CNObservableContractEnforcement *enforcement;
  _CNBlockObserver *v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_CNBlockObserver;
  v11 = -[_CNBlockObserver init](&v22, sel_init);
  if (v11)
  {
    if (!v8)
      v8 = &__block_literal_global_85;
    if (!v9)
      v9 = &__block_literal_global_2_3;
    if (!v10)
      v10 = &__block_literal_global_4_4;
    v12 = objc_msgSend(v8, "copy");
    resultBlock = v11->_resultBlock;
    v11->_resultBlock = (id)v12;

    v14 = objc_msgSend(v9, "copy");
    completionBlock = v11->_completionBlock;
    v11->_completionBlock = (id)v14;

    v16 = objc_msgSend(v10, "copy");
    failureBlock = v11->_failureBlock;
    v11->_failureBlock = (id)v16;

    v18 = objc_alloc_init(CNObservableContractEnforcement);
    enforcement = v11->_enforcement;
    v11->_enforcement = v18;

    v20 = v11;
  }

  return v11;
}

- (void)observerDidReceiveResult:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;

  v4 = a3;
  v5 = +[CNObservableContractEnforcement shouldSwizzleNilResults](CNObservableContractEnforcement, "shouldSwizzleNilResults");
  if (!v4 && v5)
  {
    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CNBehaviorSubject observerDidReceiveResult:].cold.2(v6);

    +[CNObservable os_log_protocol](CNObservable, "os_log_protocol");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CNBehaviorSubject observerDidReceiveResult:].cold.1(v7);

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[CNObservableContractEnforcement observerDidReceiveResult:](self->_enforcement, "observerDidReceiveResult:", v4);
  (*((void (**)(void))self->_resultBlock + 2))();

}

- (void)observerDidFailWithError:(id)a3
{
  CNObservableContractEnforcement *enforcement;
  id v5;

  enforcement = self->_enforcement;
  v5 = a3;
  -[CNObservableContractEnforcement observerDidFailWithError:](enforcement, "observerDidFailWithError:", v5);
  (*((void (**)(void))self->_failureBlock + 2))();

}

- (void)observerDidComplete
{
  -[CNObservableContractEnforcement observerDidComplete](self->_enforcement, "observerDidComplete");
  (*((void (**)(void))self->_completionBlock + 2))();
}

@end
