@implementation DOCThumbnailGenerator

- (id)thumbnailForNode:(id)a3 descriptor:(id)a4
{
  return -[DOCThumbnailGenerator thumbnailForNode:descriptor:forceFetch:](self, "thumbnailForNode:descriptor:forceFetch:", a3, a4, 0);
}

void __37__DOCThumbnailGenerator_endBatching___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v6, "thumbnail", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "fetchWithOptions:", objc_msgSend(v6, "fetchOptions"));

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

- (id)_thumbnailFallbackForNode:(id)a3 descriptor:(id)a4 currentThumbnail:(id)a5
{
  uint64_t v5;
  id v9;
  id v10;
  DOCThumbnailGenerator *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSMapTable *v20;
  double v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  id v60;
  id v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  _BOOL4 v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  id *obj;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *value;
  void *key;
  NSMapEnumerator enumerator;

  v80 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  objc_msgSend(v9, "size");
  v13 = v12;
  objc_msgSend(v9, "scale");
  v15 = v14;
  objc_msgSend(v9, "size");
  v17 = v16;
  objc_msgSend(v9, "scale");
  v19 = v18;
  memset(&enumerator, 0, sizeof(enumerator));
  -[DOCThumbnailCache cachedThumbnailNodes](v11->_thumbnailCache, "cachedThumbnailNodes");
  v20 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  NSEnumerateMapTable(&enumerator, v20);
  obj = (id *)&v11->super.isa;
  v77 = v10;
  v21 = v17 * v19 + v13 * v15;

  v22 = 0;
  v23 = 0;
  value = 0;
  key = 0;
LABEL_2:
  v78 = v22;
  v79 = v23;
  while (1)
  {
    do
    {
      if (!NSNextMapEnumeratorPair(&enumerator, &key, &value))
        goto LABEL_19;
      v24 = key;

      v25 = value;
      v26 = objc_msgSend(v9, "style");
      v27 = objc_msgSend(v25, "style");
      objc_msgSend(v80, "thumbnailIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "nodeThumbnailIdentifier");
      v29 = objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v28, "isEqual:", v29);

      objc_msgSend(v80, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "node");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v29) = objc_msgSend(v30, "isEqual:", v32);

      v33 = objc_msgSend(v25, "isRepresentativeIcon");
      v34 = v5 | v29;
      if (v26 != v27)
        v34 = 0;
      v23 = v25;
      v22 = v24;
    }
    while ((v34 & v33) != 1);
    objc_msgSend(v9, "size");
    v36 = v35;
    v38 = v37;
    objc_msgSend(v25, "size");
    if (v36 == v40 && v38 == v39)
    {
      objc_msgSend(v9, "scale");
      v42 = v41;
      objc_msgSend(v25, "scale");
      v44 = v42 == v43 ? v5 : 0;
      if (v44 == 1)
        break;
    }
    if (!v79)
    {
      v61 = v25;
      goto LABEL_17;
    }
    objc_msgSend(v25, "size");
    v46 = v45;
    objc_msgSend(v25, "scale");
    v48 = v47;
    objc_msgSend(v25, "size");
    v50 = v49;
    objc_msgSend(v25, "scale");
    v52 = v51;
    objc_msgSend(v79, "size");
    v54 = v53;
    objc_msgSend(v79, "scale");
    v56 = v55;
    objc_msgSend(v79, "size");
    v58 = v57;
    objc_msgSend(v79, "scale");
    v23 = v25;
    v22 = v24;
    if (vabdd_f64(v50 * v52 + v46 * v48, v21) < vabdd_f64(v58 * v59 + v54 * v56, v21))
    {
      v60 = v25;

LABEL_17:
      v22 = v24;

      v23 = v25;
      goto LABEL_2;
    }
  }
  v23 = v25;

  v22 = v24;
  v78 = v22;
  v79 = v23;
LABEL_19:
  NSEndMapTableEnumeration(&enumerator);
  if (!v79)
  {
LABEL_26:
    v67 = 1;
    goto LABEL_33;
  }
  if (v79 == v77)
  {
    objc_msgSend(v77, "fallback");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v73, "isRepresentativeIcon"))
      v74 = v73;
    else
      v74 = 0;
    v5 = v74;
    goto LABEL_32;
  }
  objc_msgSend(v9, "size");
  v63 = v62;
  v65 = v64;
  objc_msgSend(v79, "size");
  v67 = 1;
  if (v63 == v68 && v65 == v66)
  {
    objc_msgSend(v9, "scale");
    v70 = v69;
    objc_msgSend(v79, "scale");
    if (v70 == v71)
    {
      objc_msgSend(v79, "thumbnailImage");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (v72)
      {
        objc_msgSend(v79, "setFallback:", 0);
        objc_msgSend(obj[1], "cachedThumbnailNodes");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "removeObjectForKey:", v78);
LABEL_32:

        v67 = v79 != v77;
        goto LABEL_33;
      }
      goto LABEL_26;
    }
  }
LABEL_33:

  objc_sync_exit(obj);
  if (v67)
    v5 = v79;

  return (id)v5;
}

- (id)_thumbnailForNode:(id)a3 descriptor:(id)a4 forceFetch:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  DOCThumbnailKey *v10;
  void *v11;
  DOCThumbnailKey *v12;
  void *v13;
  DOCThumbnailGenerator *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  DOCThumbnailGenerator *v20;
  void *v21;
  DOCNodeThumbnail *v22;
  DOCNodeThumbnail *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  DOCThumbnailGenerator *v28;
  void *v29;
  void *v30;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = [DOCThumbnailKey alloc];
  objc_msgSend(v8, "thumbnailIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[DOCThumbnailKey initWithPrimaryKey:descriptor:](v10, "initWithPrimaryKey:descriptor:", v11, v9);

  -[DOCThumbnailGenerator _alternateThumbnailKeyForNode:descriptor:](self, "_alternateThumbnailKeyForNode:descriptor:", v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self;
  objc_sync_enter(v14);
  -[DOCThumbnailCache cachedThumbnailNodes](v14->_thumbnailCache, "cachedThumbnailNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[DOCThumbnailCache cachedThumbnailNodes](v14->_thumbnailCache, "cachedThumbnailNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v14);

  -[DOCThumbnailGenerator _thumbnailFallbackForNode:descriptor:currentThumbnail:](v14, "_thumbnailFallbackForNode:descriptor:currentThumbnail:", v8, v9, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    -[DOCThumbnailGenerator iconForNode:descriptor:](v14, "iconForNode:descriptor:", v8, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      goto LABEL_5;
LABEL_11:
    v23 = -[DOCNodeThumbnail initWithGenerator:node:descriptor:fallback:]([DOCNodeThumbnail alloc], "initWithGenerator:node:descriptor:fallback:", v14, v8, v9, v18);
    -[DOCThumbnailGenerator _currentNodeThumbnailsBatch](v14, "_currentNodeThumbnailsBatch");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v5)
      v26 = 2;
    else
      v26 = 0;
    if (v24)
    {
      v27 = (void *)objc_opt_new();
      objc_msgSend(v27, "setThumbnail:", v23);
      objc_msgSend(v27, "setFetchOptions:", v26);
      objc_msgSend(v25, "addObject:", v27);

    }
    else
    {
      -[DOCNodeThumbnail fetchWithOptions:](v23, "fetchWithOptions:", v26);
    }
    v28 = v14;
    objc_sync_enter(v28);
    -[DOCThumbnailCache cachedThumbnailNodes](v14->_thumbnailCache, "cachedThumbnailNodes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v23, v12);

    -[DOCThumbnailCache cachedThumbnailNodes](v14->_thumbnailCache, "cachedThumbnailNodes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKey:", v23, v13);

    objc_sync_exit(v28);
    v22 = v23;

    goto LABEL_18;
  }
  if (!v16)
    goto LABEL_11;
LABEL_5:
  objc_msgSend(v16, "setFallback:", v18);
  objc_msgSend(v8, "thumbnailIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateNodeThumbnailIdentifierTo:", v19);

  if (v5)
    objc_msgSend(v16, "fetchWithOptions:", 3);
  if (v13)
  {
    v20 = v14;
    objc_sync_enter(v20);
    -[DOCThumbnailCache cachedThumbnailNodes](v14->_thumbnailCache, "cachedThumbnailNodes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v16, v13);

    objc_sync_exit(v20);
  }
  v22 = v16;
LABEL_18:

  return v22;
}

- (id)iconForNode:(id)a3 descriptor:(id)a4
{
  void *v4;
  DOCIconPromise *v5;

  +[DOCThumbnailRequest iconRequestForNode:descriptor:thumbnailGenerator:](DOCThumbnailRequest, "iconRequestForNode:descriptor:thumbnailGenerator:", a3, a4, self->_thumbnailGenerator);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DOCIconPromise initWithRequest:]([DOCIconPromise alloc], "initWithRequest:", v4);

  return v5;
}

- (id)_alternateThumbnailKeyForNode:(id)a3 descriptor:(id)a4
{
  id v5;
  id v6;
  id v7;
  DOCThumbnailKey *v8;
  DOCThumbnailKey *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "fpfs_fpItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v7 && v7 != v6)
  {
    v9 = [DOCThumbnailKey alloc];
    objc_msgSend(v7, "thumbnailIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[DOCThumbnailKey initWithPrimaryKey:descriptor:](v9, "initWithPrimaryKey:descriptor:", v10, v5);

  }
  return v8;
}

- (void)markThumbnailAsRecentlyUsed:(id)a3
{
  DOCThumbnailCache *thumbnailCache;
  id v4;
  void *v5;
  id v6;

  thumbnailCache = self->_thumbnailCache;
  v4 = a3;
  -[DOCThumbnailCache recentlyUsedNodes](thumbnailCache, "recentlyUsedNodes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v4, v5);

}

- (id)_currentNodeThumbnailsBatch
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DOCThumbnailGeneratorNodeThumbnailsBatchKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)thumbnailForNode:(id)a3 descriptor:(id)a4 forceFetch:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CGSize v25;
  CGSize v26;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "size");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v10, "minimumSize");
  v16 = v15;
  objc_msgSend(v10, "scale");
  v18 = v17;
  if (v12 <= 0.0 || v14 <= 0.0 || v17 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25.width = v12;
    v25.height = v14;
    NSStringFromCGSize(v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailGenerator.m"), 114, CFSTR("Expected size and scale to be non-zero, got %@ @ %fx"), v22, *(_QWORD *)&v18);

  }
  if (v16 > v12 || v16 > v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26.width = v12;
    v26.height = v14;
    NSStringFromCGSize(v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailGenerator.m"), 115, CFSTR("Expected minimum size should be smaller or equal to maximum size, got %f for %@"), *(_QWORD *)&v16, v24);

  }
  -[DOCThumbnailGenerator _thumbnailForNode:descriptor:forceFetch:](self, "_thumbnailForNode:descriptor:forceFetch:", v9, v10, v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (QLThumbnailGenerator)thumbnailGenerator
{
  return self->_thumbnailGenerator;
}

+ (DOCThumbnailGenerator)sharedGenerator
{
  if (sharedGenerator_onceToken != -1)
    dispatch_once(&sharedGenerator_onceToken, &__block_literal_global);
  return (DOCThumbnailGenerator *)(id)sharedGenerator_sharedGenerator;
}

- (void)performInBatch:(id)a3
{
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  if (v6)
  {
    -[DOCThumbnailGenerator startBatching](self, "startBatching");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6[2]();
      -[DOCThumbnailGenerator endBatching:](self, "endBatching:", v5);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailGenerator.m"), 312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("batchingBlock != nil"));
  }

}

- (void)endBatching:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  QLThumbnailGenerator *thumbnailGenerator;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "threadDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DOCThumbnailActiveBatchingTokensKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setInvalidated:", 1);
    objc_msgSend(v8, "compact");
    if (!objc_msgSend(v8, "count"))
      goto LABEL_6;
    v9 = 0;
    while ((id)objc_msgSend(v8, "pointerAtIndex:", v9) != v5)
    {
      if (++v9 >= (unint64_t)objc_msgSend(v8, "count"))
        goto LABEL_6;
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailGenerator.m"), 363, CFSTR("an inactive batchingToken provided to endBatching:"));

    }
    else
    {
      objc_msgSend(v8, "removePointerAtIndex:", v9);
    }
    if (!objc_msgSend(v8, "count"))
    {
      -[DOCThumbnailGenerator _endCurrentThumbnailsBatch](self, "_endCurrentThumbnailsBatch");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailGenerator.m"), 374, CFSTR("ending a batch without starting one"));

      }
      if (objc_msgSend(v11, "count"))
      {
        thumbnailGenerator = self->_thumbnailGenerator;
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __37__DOCThumbnailGenerator_endBatching___block_invoke;
        v14[3] = &unk_24D72AA38;
        v15 = v11;
        -[QLThumbnailGenerator performInBatch:](thumbnailGenerator, "performInBatch:", v14);

      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailGenerator.m"), 345, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("batchingToken != nil"));
  }

}

- (id)_endCurrentThumbnailsBatch
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DOCThumbnailGeneratorNodeThumbnailsBatchKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("DOCThumbnailGeneratorNodeThumbnailsBatchKey"));
  return v5;
}

- (id)startBatching
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DOCThumbnailGeneratorNodeThumbnailsBatchKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DOCThumbnailActiveBatchingTokensKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCThumbnailGenerator.m"), 329, CFSTR("starting a batch while already in a batch"));

    }
    v8 = objc_opt_new();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("DOCThumbnailGeneratorNodeThumbnailsBatchKey"));
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("DOCThumbnailActiveBatchingTokensKey"));
    v7 = (void *)v9;
    v6 = (void *)v8;
  }
  v10 = (void *)objc_opt_new();
  objc_msgSend(v7, "addPointer:", v10);

  return v10;
}

void __40__DOCThumbnailGenerator_sharedGenerator__block_invoke()
{
  DOCThumbnailGenerator *v0;
  void *v1;

  v0 = objc_alloc_init(DOCThumbnailGenerator);
  v1 = (void *)sharedGenerator_sharedGenerator;
  sharedGenerator_sharedGenerator = (uint64_t)v0;

}

- (DOCThumbnailGenerator)init
{
  DOCThumbnailGenerator *v2;
  uint64_t v3;
  QLThumbnailGenerator *thumbnailGenerator;
  uint64_t v5;
  DOCThumbnailCache *thumbnailCache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DOCThumbnailGenerator;
  v2 = -[DOCThumbnailGenerator init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDE5EF8], "sharedGenerator");
    v3 = objc_claimAutoreleasedReturnValue();
    thumbnailGenerator = v2->_thumbnailGenerator;
    v2->_thumbnailGenerator = (QLThumbnailGenerator *)v3;

    v5 = objc_opt_new();
    thumbnailCache = v2->_thumbnailCache;
    v2->_thumbnailCache = (DOCThumbnailCache *)v5;

  }
  return v2;
}

+ (void)setMaximumCachedThumbnailCount:(unint64_t)a3
{
  maxCachedNodes = a3;
}

- (id)iconForURL:(id)a3 descriptor:(id)a4
{
  void *v4;
  DOCIconPromise *v5;

  +[DOCThumbnailRequest iconRequestForURL:descriptor:thumbnailGenerator:](DOCThumbnailRequest, "iconRequestForURL:descriptor:thumbnailGenerator:", a3, a4, self->_thumbnailGenerator);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DOCIconPromise initWithRequest:]([DOCIconPromise alloc], "initWithRequest:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_thumbnailCache, 0);
}

@end
