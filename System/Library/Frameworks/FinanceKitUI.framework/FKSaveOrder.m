@implementation FKSaveOrder

+ (void)saveOrderAtURL:(id)a3 completion:(id)a4
{
  void *v5;
  void (**v6)(id, uint64_t, id);
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;

  v5 = (void *)MEMORY[0x24BDBCE50];
  v11 = 0;
  v6 = (void (**)(id, uint64_t, id))a4;
  objc_msgSend(v5, "dataWithContentsOfURL:options:error:", a3, 1, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (v10)
    +[SaveOrderProvider saveOrderWithData:completionHandler:](_TtC12FinanceKitUI17SaveOrderProvider, "saveOrderWithData:completionHandler:", v7, v6);
  else
    v6[2](v6, 1, v8);

}

@end
