@implementation NSUserActivity

void __81__NSUserActivity_MediaPlayerAdditions___setExternalMediaContentBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    (*((void (**)(id, id, void *, _QWORD, _QWORD))v7 + 2))(v7, v9, v8, 0, 0);

}

void __74__NSUserActivity_MediaPlayerAdditions__setExternalMediaContentIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    (*((void (**)(id, id, void *, _QWORD, _QWORD))v7 + 2))(v7, v9, v8, 0, 0);

}

@end
