@implementation HFUpdateDateAddedForApplicationDataContainer

void __HFUpdateDateAddedForApplicationDataContainer_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "applicationData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateApplicationData:completionHandler:", v4, v3);

}

@end
