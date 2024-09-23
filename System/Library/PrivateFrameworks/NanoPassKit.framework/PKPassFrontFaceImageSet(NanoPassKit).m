@implementation PKPassFrontFaceImageSet(NanoPassKit)

- (void)memoryMapImageData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x2199B65AC]();
  objc_msgSend(a1, "faceImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "npkImageByMemoryMappingDataWithTemporaryFilePrefix:", CFSTR("npkFrontFaceImage-faceImage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFaceImage:", v4);

  objc_msgSend(a1, "faceShadowImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "npkImageByMemoryMappingDataWithTemporaryFilePrefix:", CFSTR("npkFrontFaceImage-faceShadowImage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setFaceShadowImage:", v6);

  objc_autoreleasePoolPop(v2);
}

+ (uint64_t)isDrawnUsingAssetOptions:()NanoPassKit forPass:
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "_bundleForPass:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "isDrawnUsingAssetOptions:fromBundle:", a3, v6);

  return v7;
}

+ (uint64_t)isDrawnUsingAssetOptions:()NanoPassKit fromBundle:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a1, "_assetNamesForAssetOption:", a3);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (!objc_msgSend(a1, "_containsAssetForImageName:fromBundle:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), v6, (_QWORD)v14))
        {
          v12 = 0;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

+ (id)_bundleForPass:()NanoPassKit
{
  void *v3;
  void *v4;

  if (a3)
  {
    NPKURLForPass(a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)_containsAssetForImageName:()NanoPassKit fromBundle:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("pdf"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6EB60], "URLForImageNamed:inBundle:scale:", v5, v6, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10 != 0;
}

+ (id)_assetNamesForAssetOption:()NanoPassKit
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = v4;
  if ((a3 & 1) == 0)
  {
    if ((a3 & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v5, "addObject:", *MEMORY[0x24BE6F4F8]);
    if ((a3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v4, "addObject:", *MEMORY[0x24BE6F4E8]);
  if ((a3 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((a3 & 4) != 0)
LABEL_4:
    objc_msgSend(v5, "addObject:", *MEMORY[0x24BE6F4E0]);
LABEL_5:
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

@end
