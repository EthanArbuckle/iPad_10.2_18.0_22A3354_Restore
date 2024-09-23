@implementation AMSMutableBinaryPromise

- (BOOL)finishWithError:(id)a3
{
  return -[AMSMutableBinaryPromise finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, a3);
}

- (BOOL)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = a3;
  v6 = a4;
  LOBYTE(v4) = objc_msgSend((id)objc_opt_class(), "finishPromise:withSuccess:error:", self, v4, v6);

  return v4;
}

- (BOOL)finishWithSuccess
{
  return -[AMSMutableBinaryPromise finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
}

+ (BOOL)finishPromise:(id)a3 withSuccess:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "backingPromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "finishWithResult:", v7);

  objc_msgSend(v5, "stopRetainingSelf");
  return v8;
}

+ (BOOL)finishPromise:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v7 = (void *)MEMORY[0x1E0C9AAB0];
  if (!a4)
    v7 = 0;
  v8 = v7;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "backingPromise");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "finishWithResult:error:", v8, v9);

  objc_msgSend(v10, "stopRetainingSelf");
  return v12;
}

- (BOOL)cancel
{
  return objc_msgSend((id)objc_opt_class(), "cancelPromise:", self);
}

- (BOOL)finishWithPromise:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = objc_msgSend((id)objc_opt_class(), "finishPromise:withPromise:", self, v4);

  return (char)self;
}

+ (BOOL)cancelPromise:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "backingPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cancel");

  objc_msgSend(v3, "stopRetainingSelf");
  return v5;
}

+ (BOOL)finishPromise:(id)a3 withError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "backingPromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "finishWithError:", v5);

  objc_msgSend(v6, "stopRetainingSelf");
  return v8;
}

+ (BOOL)finishPromise:(id)a3 withPromise:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__AMSMutableBinaryPromise_finishPromise_withPromise___block_invoke;
  v10[3] = &unk_1E25441C8;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "addFinishBlock:", v10);
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __53__AMSMutableBinaryPromise_finishPromise_withPromise___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
