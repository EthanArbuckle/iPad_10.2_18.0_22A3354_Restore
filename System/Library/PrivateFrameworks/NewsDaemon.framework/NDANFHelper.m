@implementation NDANFHelper

- (id)manifestFromANFDocumentData:(id)a3
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2050000000;
  v3 = (void *)getSXContextClass_softClass;
  v44 = getSXContextClass_softClass;
  if (!getSXContextClass_softClass)
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __getSXContextClass_block_invoke;
    v40[3] = &unk_1E9BD9DF0;
    v40[4] = &v41;
    __getSXContextClass_block_invoke((uint64_t)v40);
    v3 = (void *)v42[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v41, 8);
  v5 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:shareURL:JSONData:resourceDataSource:host:error:", v7, 0, v33, 0, 0, &v39);
  v31 = v39;

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", v31);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v8, "documentController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "orderedImageIdentifiers");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v36;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v14);
          objc_msgSend(v8, "documentController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "imageResourceForIdentifier:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "URL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "fc_safelyAddObject:", v18);

          objc_msgSend(v8, "documentController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "allResourcesForImageIdentifier:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "URL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "fc_safelyAddObject:", v22);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v12);
    }

    objc_msgSend(v8, "documentController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "requiredNonImageResourceURLs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_alloc(MEMORY[0x1E0D58900]);
    -[NDANFHelper _resourceIDsFromURLs:](self, "_resourceIDsFromURLs:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDANFHelper _resourceIDsFromURLs:](self, "_resourceIDsFromURLs:", v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDANFHelper _resourceIDsFromURLs:](self, "_resourceIDsFromURLs:", v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v25, "initWithNonImageResourceIDs:optimalImageResourceIDs:smallestImageResourceIDs:", v26, v27, v28);

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)_resourceIDsFromURLs:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__NDANFHelper__resourceIDsFromURLs___block_invoke;
  v4[3] = &unk_1E9BD9DC8;
  v4[4] = self;
  objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __36__NDANFHelper__resourceIDsFromURLs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resourceIDFromURL:", a2);
}

- (id)_resourceIDFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("asset")))
  {
    objc_msgSend(v3, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
