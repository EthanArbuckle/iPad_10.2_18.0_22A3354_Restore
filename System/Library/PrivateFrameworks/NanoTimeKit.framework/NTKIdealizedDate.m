@implementation NTKIdealizedDate

void __NTKIdealizedDate_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;

  _UpdateIdealizedDate();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0DC4838], 0, v4, &__block_literal_global_5_3);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0C99690], 0, v4, &__block_literal_global_6_0);

}

@end
