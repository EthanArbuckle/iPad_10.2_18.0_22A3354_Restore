@implementation GetProperties

void __GetProperties_block_invoke()
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
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  +[NSBundle mainBundle](&off_254DF2768, "mainBundle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pathForResource:ofType:", CFSTR("EmulatedController"), CFSTR("plist"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("~/Downloads/"), "stringByAppendingPathComponent:", CFSTR("EmulatedController.plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByStandardizingPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(CFSTR("/tmp/"), "stringByAppendingPathComponent:", CFSTR("EmulatedController.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByStandardizingPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[NSMutableArray array](&off_254DEBB20, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v0)
    objc_msgSend(v5, "addObject:", v0);
  if (v2)
    objc_msgSend(v6, "addObject:", v2);
  if (v4)
    objc_msgSend(v6, "addObject:", v4);
  v7 = (void *)objc_msgSend(v6, "copy");
  +[NSFileManager defaultManager](&off_254E13A20, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v14 && objc_msgSend(v8, "fileExistsAtPath:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i)))
        {
          +[NSDictionary dictionaryWithContentsOfFile:](&off_254DEBCC0, "dictionaryWithContentsOfFile:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)GetProperties_properties;
          GetProperties_properties = v15;

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

@end
