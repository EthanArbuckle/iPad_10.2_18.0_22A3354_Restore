@implementation DDMLScannerRunEmbeddingAndModelWithString

void ___DDMLScannerRunEmbeddingAndModelWithString_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[DDMLTaggerModel currentTaggerModel](DDMLTaggerModel, "currentTaggerModel");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void ___DDMLScannerRunEmbeddingAndModelWithString_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  float v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t j;
  float v24;
  float v25;
  void *v26;
  float v27;
  float v28;
  double v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setString:", v8);

  objc_msgSend(v7, "setRange:", a3, a4);
  v40 = v7;
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  v9 = (void *)objc_opt_new();
  v10 = *(void **)(a1 + 48);
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = ___DDMLScannerRunEmbeddingAndModelWithString_block_invoke_3;
  v57[3] = &unk_1E3C954D8;
  v59 = *(_QWORD *)(a1 + 64);
  v11 = v9;
  v58 = v11;
  objc_msgSend(v10, "enumerateTokenVectorsInRange:usingBlock:", a3, a4, v57);
  v12 = objc_msgSend(v11, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 64))
  {
    v14 = 0;
    do
    {
      objc_msgSend(v13, "addObject:", &unk_1E3C9FE80);
      ++v14;
    }
    while (v14 < *(_QWORD *)(a1 + 64));
  }
  v39 = a1;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v11;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v54;
    v15 = (float)v12;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v54 != v42)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
        if (v19)
        {
          v20 = v19;
          v21 = 0;
          v22 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v50 != v22)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "floatValue", v39);
              v25 = v24;
              objc_msgSend(v13, "objectAtIndexedSubscript:", v21 + j);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "floatValue");
              v28 = v27;

              *(float *)&v29 = (float)(v25 / v15) + v28;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:atIndexedSubscript:", v30, v21 + j);

            }
            v21 += j;
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
          }
          while (v20);
        }

      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    }
    while (v43);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v31 = v13;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
  v33 = v39;
  if (v32)
  {
    v34 = v32;
    v35 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(v31);
        v37 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
        v44 = 0;
        objc_msgSend(v37, "floatValue", v39);
        v44 = v38;
        objc_msgSend(*(id *)(v33 + 56), "appendBytes:length:", &v44, 4);
      }
      v34 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v60, 16);
    }
    while (v34);
  }

}

void ___DDMLScannerRunEmbeddingAndModelWithString_block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "count") != *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<DDMLToken *> *_DDMLScannerRunEmbeddingAndModelWithString(NLContextualEmbedding *__strong, MRLNeuralNetworkRef, NSString *__strong)_block_invoke_3");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("DDMLScanner.m"), 878, CFSTR("tokenVector has unexpected dimensions"));

  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

@end
