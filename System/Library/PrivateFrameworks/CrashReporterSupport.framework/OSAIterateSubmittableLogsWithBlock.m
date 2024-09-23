@implementation OSAIterateSubmittableLogsWithBlock

void __OSAIterateSubmittableLogsWithBlock_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("synced")))
  {
    objc_msgSend(v6, "URLByDeletingPathExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathExtension");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
