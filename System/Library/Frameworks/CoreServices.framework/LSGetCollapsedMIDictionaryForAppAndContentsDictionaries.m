@implementation LSGetCollapsedMIDictionaryForAppAndContentsDictionaries

void ___LSGetCollapsedMIDictionaryForAppAndContentsDictionaries_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ApplicationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PluginKitPlugin")))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKey:", v7, v3);
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CoreServices")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("Internal")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("User")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("System")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("SystemAppPlaceholder")) & 1) != 0
         || objc_msgSend(v4, "isEqualToString:", CFSTR("VPNPlugin")))
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v6 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v5, "setObject:forKey:", v6, v3);

  }
}

void ___LSGetCollapsedMIDictionaryForAppAndContentsDictionaries_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("PluginOwnerBundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_LSBundlePlugins"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(v12, "setObject:forKey:", v5, v13);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("_LSBundlePlugins"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKey:", v8, v6);

  }
}

@end
