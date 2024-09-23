@implementation FCAMSBag

void __15__FCAMSBag_bag__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  objc_opt_self();
  v0 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(MEMORY[0x1E0CFDB20], "bagKeySet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerBagKeySet:forProfile:profileVersion:", v1, CFSTR("AppleNews"), CFSTR("1"));

  v2 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(MEMORY[0x1E0CFDC00], "bagKeySet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerBagKeySet:forProfile:profileVersion:", v3, CFSTR("AppleNews"), CFSTR("1"));

  v4 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(MEMORY[0x1E0CFDBE8], "bagKeySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerBagKeySet:forProfile:profileVersion:", v5, CFSTR("AppleNews"), CFSTR("1"));

  v6 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(MEMORY[0x1E0CFDC68], "bagKeySet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerBagKeySet:forProfile:profileVersion:", v7, CFSTR("AppleNews"), CFSTR("1"));

  v8 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(MEMORY[0x1E0CFDB60], "bagKeySet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerBagKeySet:forProfile:profileVersion:", v9, CFSTR("AppleNews"), CFSTR("1"));

  v10 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(MEMORY[0x1E0CFDB58], "bagKeySet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerBagKeySet:forProfile:profileVersion:", v11, CFSTR("AppleNews"), CFSTR("1"));

  v12 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(MEMORY[0x1E0CFDA50], "bagKeySet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerBagKeySet:forProfile:profileVersion:", v13, CFSTR("AppleNews"), CFSTR("1"));

  v14 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(MEMORY[0x1E0CFDC80], "bagKeySet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerBagKeySet:forProfile:profileVersion:", v15, CFSTR("AppleNews"), CFSTR("1"));

  v16 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(MEMORY[0x1E0CFDB50], "bagKeySet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerBagKeySet:forProfile:profileVersion:", v17, CFSTR("AppleNews"), CFSTR("1"));

  v18 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(MEMORY[0x1E0CFDAF8], "bagKeySet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerBagKeySet:forProfile:profileVersion:", v19, CFSTR("AppleNews"), CFSTR("1"));

  objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", CFSTR("AppleNews"), CFSTR("1"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)_MergedGlobals_207;
  _MergedGlobals_207 = v20;

}

+ (id)bag
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __15__FCAMSBag_bag__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0F87B0 != -1)
    dispatch_once(&qword_1ED0F87B0, block);
  return (id)_MergedGlobals_207;
}

@end
