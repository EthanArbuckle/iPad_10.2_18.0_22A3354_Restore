@implementation FBKDownloadableFilePromisesSelectVisible

BOOL __FBKDownloadableFilePromisesSelectVisible_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a2;
  objc_msgSend(v2, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4 && (unint64_t)(objc_msgSend(v2, "status") - 13) >= 3)
  {
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_msgSend(v2, "status");
    if (v6 == v7)
      v5 = v8 > 1;
    else
      v5 = v8 > 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
