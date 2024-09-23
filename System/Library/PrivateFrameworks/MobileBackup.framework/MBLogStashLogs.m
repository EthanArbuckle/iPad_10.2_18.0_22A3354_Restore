@implementation MBLogStashLogs

uint64_t __MBLogStashLogs_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", *(_QWORD *)(a1 + 32));
}

uint64_t __MBLogStashLogs_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (v8)
  {
    v9 = objc_msgSend(v5, "compare:", v4);

  }
  else
  {
    objc_msgSend(v5, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "intValue");
    objc_msgSend(v4, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    if (v11 >= v13)
      v14 = 0;
    else
      v14 = -1;
    if (v13 < v11)
      v9 = 1;
    else
      v9 = v14;
  }

  return v9;
}

@end
