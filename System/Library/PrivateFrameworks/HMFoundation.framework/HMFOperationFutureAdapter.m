@implementation HMFOperationFutureAdapter

- (void)_handleFinishedOperation:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  int v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v10 = v3;
    v5 = objc_msgSend(v3, "isCancelled");
    v6 = *(void **)(a1 + 8);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "rejectWithError:", v7);

      v4 = v10;
      if ((v8 & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
    v9 = objc_msgSend(*(id *)(a1 + 8), "fulfillWithValue:", v10);
    v4 = v10;
    if (v9)
    {
LABEL_6:
      objc_msgSend(v4, "removeObserver:forKeyPath:context:", a1, CFSTR("isFinished"), HMFOperationFutureAdapterKVOContext);
      v4 = v10;
    }
  }
LABEL_7:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  void *v10;
  int v11;
  void *v12;

  v9 = a4;
  if ((void *)HMFOperationFutureAdapterKVOContext == a6)
  {
    v12 = v9;
    objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    v9 = v12;
    if (v11)
    {
      -[HMFOperationFutureAdapter _handleFinishedOperation:]((uint64_t)self, v12);
      v9 = v12;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
  objc_storeStrong((id *)&self->_promise, 0);
}

@end
