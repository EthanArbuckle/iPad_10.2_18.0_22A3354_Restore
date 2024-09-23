@implementation FPTrashOperation

- (id)replicateForItems:(id)a3
{
  id v3;
  FPTrashOperation *v4;

  v3 = a3;
  v4 = -[FPTrashOperation initWithItems:]([FPTrashOperation alloc], "initWithItems:", v3);

  return v4;
}

- (FPTrashOperation)initWithItems:(id)a3
{
  FPTrashOperation *v3;
  FPTrashOperation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FPTrashOperation;
  v3 = -[FPTransformOperation initWithItemsOfDifferentProviders:action:](&v6, sel_initWithItemsOfDifferentProviders_action_, a3, CFSTR("Trash"));
  v4 = v3;
  if (v3)
    -[FPActionOperation setSetupRemoteOperationService:](v3, "setSetupRemoteOperationService:", 1);
  return v4;
}

- (void)subclassPreflightWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v5 = a3;
  -[FPActionOperation remoteServiceProxy](self, "remoteServiceProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPTransformOperation items](self, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fp_itemIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__FPTrashOperation_subclassPreflightWithCompletion___block_invoke;
  v10[3] = &unk_1E444ECA0;
  v11 = v5;
  v12 = a2;
  v10[4] = self;
  v9 = v5;
  objc_msgSend(v6, "preflightTrashItemIDs:completionHandler:", v8, v10);

}

uint64_t __52__FPTrashOperation_subclassPreflightWithCompletion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__FPTrashOperation_subclassPreflightWithCompletion___block_invoke_2;
  v5[3] = &unk_1E444D7B0;
  v2 = a1[5];
  v3 = a1[6];
  v6 = (id)a1[4];
  v7 = v3;
  return objc_msgSend(v6, "tryRecoveringFromPreflightErrors:recoveryHandler:completion:", a2, v5, v2);
}

uint64_t __52__FPTrashOperation_subclassPreflightWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a2;
  if (!a3)
    goto LABEL_5;
  if (a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("FPActionOperation.m"), 1219, CFSTR("UNREACHABLE: invalid index for error: %@"), v5);

LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v6 = 1;
LABEL_6:

  return v6;
}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setTrashed:", 1);
  objc_msgSend(v4, "setParentItemIdentifier:", CFSTR("NSFileProviderTrashContainerItemIdentifier"));

  return 1073741828;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[FPTransformOperation items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fp_annotatedErrorWithItems:variant:", v8, CFSTR("Remove"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)FPTrashOperation;
  -[FPTransformOperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v7, v9);

}

- (id)fp_prettyDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[FPTransformOperation items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_itemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FPAbbreviatedArrayDescription(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("trash items %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)presendNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[FPActionOperation stitcher](self, "stitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");

  -[FPActionOperation stitcher](self, "stitcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPTransformOperation items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trashItems:", v5);

  -[FPActionOperation stitcher](self, "stitcher");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flush");

}

@end
