@implementation FCUserAgentHeaderValue

void __FCUserAgentHeaderValue_block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.news.widget"));

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("AppleNewsWidget/%@ Version/%@"), v4, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.newsd"));

    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
    v11 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v11;
    if (v9)
      objc_msgSend(v10, "stringWithFormat:", CFSTR("AppleNewsAgent/%@ Version/%@"), v4, v11);
    else
      objc_msgSend(v10, "stringWithFormat:", CFSTR("AppleNews/%@ Version/%@"), v4, v11);
  }
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_1ED0F8708;
  qword_1ED0F8708 = v12;

}

@end
