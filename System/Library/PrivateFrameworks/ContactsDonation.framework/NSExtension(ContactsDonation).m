@implementation NSExtension(ContactsDonation)

- (id)_cnd_requestWithInputItems:()ContactsDonation
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BE192C0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "completionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "beginExtensionRequestWithInputItems:completion:", v5, v7);

  objc_msgSend(v6, "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addFailureBlock:", &__block_literal_global_3);

  return v8;
}

@end
