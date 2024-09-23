@implementation GEOApplicationIdentifierOrProcessName

void __GEOApplicationIdentifierOrProcessName_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AAE0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("FMWK"));
    v4 = v10;
    if (v3)
    {

      v4 = 0;
    }
  }
  else
  {
    v4 = v10;
  }
  v11 = v4;
  if (objc_msgSend(v4, "length"))
  {
    v5 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processName");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  v12 = v5;
  v8 = objc_msgSend(v5, "copy");
  v9 = (void *)qword_1ECDBC590;
  qword_1ECDBC590 = v8;

}

@end
