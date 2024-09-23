@implementation NSArray

void __50__NSArray_AVTExtension__avt_mutableContainersCopy__block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  v7 = a2;
  v3 = objc_opt_respondsToSelector();
  v4 = *(void **)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v7, "avt_mutableContainersCopy");
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v5;
  }
  else
  {
    v6 = v7;
  }
  v8 = v6;
  objc_msgSend(v4, "addObject:", v6);

}

@end
