@implementation FPFetchRegularItemThumbnailsOperation

- (FPFetchRegularItemThumbnailsOperation)initWithDictionary:(id)a3 desiredSizeToScale:(CGSize)a4 itemManager:(id)a5
{
  double height;
  double width;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  FPFetchRegularItemThumbnailsOperation *v16;
  FPFetchRegularItemThumbnailsOperation *v17;
  FPFetchRegularItemThumbnailsOperation *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_super v24;
  NSSize v25;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a5;
  objc_msgSend(v11, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  v15 = objc_msgSend(v14, "count");
  if (v12 && v15 && width >= 1.0 && height >= 1.0)
  {
    v24.receiver = self;
    v24.super_class = (Class)FPFetchRegularItemThumbnailsOperation;
    v16 = -[FPOperation init](&v24, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_dictionary, a3);
      v17->_desiredSizeToScale.width = width;
      v17->_desiredSizeToScale.height = height;
      objc_storeStrong((id *)&v17->_itemManager, a5);
    }
    self = v17;
    v18 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_class();
    objc_msgSend(v11, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25.width = width;
    v25.height = height;
    NSStringFromSize(v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPFetchThumbnailsOperation.m"), 206, CFSTR("invalid parameter to initialize %@ (regularItems:%@, desiredSizeToScale:%@, itemManager:%@)"), v20, v21, v22, v12);

    v18 = 0;
  }

  return v18;
}

- (void)main
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 304), "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_shortDescriptionExpandingAtMost:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v5, "[DEBUG] fetching regular thumbnails for %@", (uint8_t *)&v6);

}

void __45__FPFetchRegularItemThumbnailsOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;

  if (!a2 || a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a3);
  }
  else
  {
    objc_msgSend(a2, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startOperation:toFetchThumbnailsWithDictionary:size:completionHandler:", *(double *)(*(_QWORD *)(a1 + 32) + 312), *(double *)(*(_QWORD *)(a1 + 32) + 320));

  }
}

uint64_t __45__FPFetchRegularItemThumbnailsOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(void);

  v11 = (void (**)(void))a5;
  v8 = a4;
  v9 = a3;
  -[FPFetchRegularItemThumbnailsOperation delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "operation:didReceiveProgressInfo:error:", self, v9, v8);

  v11[2]();
}

- (FPOperationProgressDelegate)delegate
{
  return (FPOperationProgressDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
