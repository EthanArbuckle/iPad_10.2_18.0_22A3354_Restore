@implementation SCNScene(AVTExtensionMRR)

+ (uint64_t)avt_rootObjectForSceneAtURL:()AVTExtensionMRR options:error:
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = (void *)objc_msgSend(a3, "pathExtension");
  if (!objc_msgSend(v8, "hasPrefix:", CFSTR("scn")))
    return objc_msgSend(MEMORY[0x1E0CD5A10], "sceneWithURL:options:error:", a3, a4, a5);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 1, a5);
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("scnz")))
    v9 = (void *)objc_msgSend(v9, "scn_uncompressedDataUsingCompressionAlgorithm:", 517);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD59B0]), "initForReadingWithData:secure:", v9, 0);
  objc_msgSend(v10, "setDocumentURL:", a3);
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0), *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v10, "finishDecoding");

  return v13;
}

+ (id)avt_newSceneWithURL:()AVTExtensionMRR options:error:
{
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1DF0D6DC8]();
  v10 = (void *)objc_msgSend(a1, "avt_rootObjectForSceneAtURL:options:error:", a3, a4, a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_alloc_init((Class)a1);
      v12 = (void *)objc_msgSend(v11, "rootNode");
      v13 = (void *)objc_msgSend(v10, "childNodes");
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v21 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v18, "removeFromParentNode");
            objc_msgSend(v12, "addChildNode:", v18);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v15);
      }
    }
    else
    {
      v11 = 0;
    }
  }
  objc_autoreleasePoolPop(v9);
  return v11;
}

+ (id)avt_rootNodeForSceneAtURL:()AVTExtensionMRR options:error:
{
  void *v9;
  void *v10;
  id v11;
  id v12;

  v9 = (void *)MEMORY[0x1DF0D6DC8]();
  v10 = (void *)objc_msgSend(a1, "avt_rootObjectForSceneAtURL:options:error:", a3, a4, a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (id)objc_msgSend(v10, "rootNode");
    v12 = v11;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  objc_autoreleasePoolPop(v9);
  return v11;
}

+ (id)avt_nodeNamed:()AVTExtensionMRR forSceneAtURL:options:error:
{
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v11 = (void *)MEMORY[0x1DF0D6DC8]();
  v12 = (void *)objc_msgSend(a1, "avt_rootObjectForSceneAtURL:options:error:", a4, a5, a6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v12, "rootNode");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
      goto LABEL_6;
    }
  }
  v13 = (void *)objc_msgSend(v12, "childNodeWithName:recursively:", a3, 1);
  v14 = v13;
  objc_msgSend(v13, "removeFromParentNode");
LABEL_6:
  objc_autoreleasePoolPop(v11);
  return v13;
}

- (uint64_t)avt_writeByArchivingRootNodeInsteadOfScene:()AVTExtensionMRR toURL:options:error:
{
  void *v11;
  int v12;
  void *v13;

  v11 = (void *)objc_msgSend(a4, "pathExtension");
  v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("scn"));
  if (!a3 || !v12)
    return objc_msgSend(a1, "writeToURL:options:delegate:progressHandler:", a4, a5, 0, 0);
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CD59A8], "archivedDataWithRootObject:options:", objc_msgSend(a1, "rootNode"), a5);
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("scnz")))
    v13 = (void *)objc_msgSend(v13, "scn_compressedDataUsingCompressionAlgorithm:", 517);
  return objc_msgSend(v13, "writeToURL:options:error:", a4, 1, a6);
}

@end
