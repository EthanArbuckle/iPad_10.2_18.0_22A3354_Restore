@implementation CNRetry

- (CNRetry)init
{
  return -[CNRetry initWithDelegate:](self, "initWithDelegate:", 0);
}

- (CNRetry)initWithDelegate:(id)a3
{
  id v4;
  CNRetry *v5;
  CNRetry *v6;
  CNRetry *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNRetry;
  v5 = -[CNRetry init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (id)performAndWait:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  char *v47;
  char *v48;
  uint64_t v49;

  v4 = (void (**)(_QWORD))a3;
  -[CNRetry delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNRetry delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "maximumNumberOfAttemptsForRetry:", self);

    v49 = v8;
    if (v8 < 1)
    {
LABEL_3:
      +[CNFoundationError errorWithCode:userInfo:](CNFoundationError, "errorWithCode:userInfo:", 12, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
  }
  else
  {
    v49 = 3;
  }
  v9 = 0;
  v47 = sel_retry_delayAfterException_onAttempt_;
  v48 = sel_retry_shouldContinueAfterException_onAttempt_;
  v11 = 1;
  do
  {
    -[CNRetry delegate](self, "delegate", v47, v48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[CNRetry delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "retry:willBeginAttempt:", self, v11);

    }
    v15 = 1;
    v4[2](v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isSuccess"))
    {
      -[CNRetry delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        -[CNRetry delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "value");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "retry:didSucceedWithResult:", self, v19);

      }
      goto LABEL_28;
    }
    objc_msgSend(v10, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNFoundationError errorWithCode:underlyingError:](CNFoundationError, "errorWithCode:underlyingError:", 12, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    -[CNRetry delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      -[CNRetry delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "error");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "retry:shouldContinueAfterError:onAttempt:", self, v25, v11);

      v15 = v26;
    }
    -[CNRetry delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_opt_respondsToSelector();

    v29 = 0.0;
    if ((v28 & 1) != 0)
    {
      -[CNRetry delegate](self, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "error");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "retry:delayAfterError:onAttempt:", self, v31, v11);
      v29 = v32;

    }
    v9 = (void *)v21;
    if (v29 != 0.0)
    {
      -[CNRetry delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) != 0)
      {
        -[CNRetry delegate](self, "delegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "retry:willDelayFor:afterAttempt:", self, v11, v29);

      }
      +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "schedulerProvider");
      v37 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v37, "immediateScheduler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (id)objc_msgSend(v38, "afterDelay:performBlock:", &__block_literal_global_21, v29);

      -[CNRetry delegate](self, "delegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v37) = objc_opt_respondsToSelector();

      if ((v37 & 1) != 0)
      {
        -[CNRetry delegate](self, "delegate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "retry:didDelayFor:afterAttempt:", self, v11, v29);

      }
    }
    -[CNRetry delegate](self, "delegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_opt_respondsToSelector();

    if ((v43 & 1) != 0)
    {
      -[CNRetry delegate](self, "delegate");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "retry:didCompleteAttempt:", self, v11);

    }
    if (v11 < v49)
      v45 = v15;
    else
      v45 = 0;
    ++v11;
  }
  while ((v45 & 1) != 0);
  if (!v9)
    goto LABEL_3;
LABEL_4:
  +[CNResult failureWithError:](CNResult, "failureWithError:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v10;
}

- (CNRetryDelegate)delegate
{
  return (CNRetryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
