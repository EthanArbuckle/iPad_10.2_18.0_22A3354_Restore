@implementation HUMediaSystemEditorUtilities

+ (BOOL)wouldPairingAccessoriesNecessitateConfiguration:(id)a3
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  if ((objc_msgSend(v3, "na_any:", &__block_literal_global_213) & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_msgSend(v3, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __80__HUMediaSystemEditorUtilities_wouldPairingAccessoriesNecessitateConfiguration___block_invoke_2;
    v11[3] = &unk_1E6F4E5D8;
    v7 = v5;
    v12 = v7;
    if (objc_msgSend(v3, "na_all:", v11))
    {
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __80__HUMediaSystemEditorUtilities_wouldPairingAccessoriesNecessitateConfiguration___block_invoke_3;
      v9[3] = &unk_1E6F4E5D8;
      v10 = v7;
      v4 = objc_msgSend(v3, "na_all:", v9) ^ 1;

    }
    else
    {
      LOBYTE(v4) = 1;
    }

  }
  return v4;
}

uint64_t __80__HUMediaSystemEditorUtilities_wouldPairingAccessoriesNecessitateConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_needsSoftwareUpdateToSupportBeingAddedToMediaSystem");
}

BOOL __80__HUMediaSystemEditorUtilities_wouldPairingAccessoriesNecessitateConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "remoteLoginHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggedInAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteLoginHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "loggedInAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:options:", v9, 1) == 0;

  return v10;
}

uint64_t __80__HUMediaSystemEditorUtilities_wouldPairingAccessoriesNecessitateConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

@end
