@implementation CNAutocompleteFetchBlockDelegate

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[CNAutocompleteFetchBlockDelegate resultHandler](self, "resultHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CNAutocompleteFetchBlockDelegate resultHandler](self, "resultHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[CNAutocompleteFetchBlockDelegate finishHandler](self, "finishHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNAutocompleteFetchBlockDelegate finishHandler](self, "finishHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[CNAutocompleteFetchBlockDelegate errorHandler](self, "errorHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CNAutocompleteFetchBlockDelegate errorHandler](self, "errorHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[CNAutocompleteFetchBlockDelegate beganNetworkActivityHandler](self, "beganNetworkActivityHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNAutocompleteFetchBlockDelegate beganNetworkActivityHandler](self, "beganNetworkActivityHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (void)autocompleteFetchDidEndNetworkActivity:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[CNAutocompleteFetchBlockDelegate endedNetworkActivityHandler](self, "endedNetworkActivityHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNAutocompleteFetchBlockDelegate endedNetworkActivityHandler](self, "endedNetworkActivityHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (BOOL)autocompleteFetch:(id)a3 shouldExpectSupplementalResultsForRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  char v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CNAutocompleteFetchBlockDelegate supplementalResultHandler](self, "supplementalResultHandler");
  v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v12 = ((uint64_t (**)(_QWORD, id, id, id))v11)[2](v11, v10, v9, v8);

  return v12;
}

- (id)autocompleteFetch:(id)a3 willAdjustResults:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;

  v5 = a4;
  -[CNAutocompleteFetchBlockDelegate adjustmentHandler](self, "adjustmentHandler");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v6)[2](v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)autocompleteFetch:(id)a3 willSortResults:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a4;
  -[CNAutocompleteFetchBlockDelegate willSortHandler](self, "willSortHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNAutocompleteFetchBlockDelegate willSortHandler](self, "willSortHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v7);

  }
}

- (id)resultComparatorForAutocompleteFetch:(id)a3
{
  void *v4;
  void (**v5)(void);
  void *v6;

  -[CNAutocompleteFetchBlockDelegate comparatorHandler](self, "comparatorHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNAutocompleteFetchBlockDelegate comparatorHandler](self, "comparatorHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v3;
  void *v4;
  objc_super v6;

  if (sel_autocompleteFetch_didReceiveResults_ == a3)
  {
    -[CNAutocompleteFetchBlockDelegate resultHandler](self, "resultHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v3 = v4 != 0;

    return v3;
  }
  if (sel_autocompleteFetchDidFinish_ == a3)
  {
    -[CNAutocompleteFetchBlockDelegate finishHandler](self, "finishHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (sel_autocompleteFetch_didFailWithError_ == a3)
  {
    -[CNAutocompleteFetchBlockDelegate errorHandler](self, "errorHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (sel_autocompleteFetchDidBeginNetworkActivity_ == a3)
  {
    -[CNAutocompleteFetchBlockDelegate beganNetworkActivityHandler](self, "beganNetworkActivityHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (sel_autocompleteFetchDidEndNetworkActivity_ == a3)
  {
    -[CNAutocompleteFetchBlockDelegate endedNetworkActivityHandler](self, "endedNetworkActivityHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (sel_autocompleteFetch_shouldExpectSupplementalResultsForRequest_completionHandler_ == a3)
  {
    -[CNAutocompleteFetchBlockDelegate supplementalResultHandler](self, "supplementalResultHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (sel_autocompleteFetch_willAdjustResults_ == a3)
  {
    -[CNAutocompleteFetchBlockDelegate adjustmentHandler](self, "adjustmentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (sel_autocompleteFetch_willSortResults_ == a3)
  {
    -[CNAutocompleteFetchBlockDelegate willSortHandler](self, "willSortHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (sel_resultComparatorForAutocompleteFetch_ == a3)
  {
    -[CNAutocompleteFetchBlockDelegate comparatorHandler](self, "comparatorHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v6.receiver = self;
  v6.super_class = (Class)CNAutocompleteFetchBlockDelegate;
  return -[CNAutocompleteFetchBlockDelegate respondsToSelector:](&v6, sel_respondsToSelector_);
}

- (id)resultHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setResultHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)finishHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setFinishHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)beganNetworkActivityHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setBeganNetworkActivityHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)endedNetworkActivityHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setEndedNetworkActivityHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)supplementalResultHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setSupplementalResultHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (id)adjustmentHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setAdjustmentHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (id)willSortHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setWillSortHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (id)comparatorHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setComparatorHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_comparatorHandler, 0);
  objc_storeStrong(&self->_willSortHandler, 0);
  objc_storeStrong(&self->_adjustmentHandler, 0);
  objc_storeStrong(&self->_supplementalResultHandler, 0);
  objc_storeStrong(&self->_endedNetworkActivityHandler, 0);
  objc_storeStrong(&self->_beganNetworkActivityHandler, 0);
  objc_storeStrong(&self->_finishHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_resultHandler, 0);
}

@end
