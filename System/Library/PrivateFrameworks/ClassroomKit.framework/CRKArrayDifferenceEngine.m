@implementation CRKArrayDifferenceEngine

- (CRKArrayDifferenceEngine)initWithObject:(id)a3 keyPath:(id)a4 configuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKArrayDifferenceEngine *v11;
  CRKArrayDifferenceEngine *v12;
  uint64_t v13;
  NSString *mKeyPath;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CRKArrayDifferenceEngine;
  v11 = -[CRKArrayDifferenceEngine init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->mObject, v8);
    v13 = objc_msgSend(v9, "copy");
    mKeyPath = v12->mKeyPath;
    v12->mKeyPath = (NSString *)v13;

    objc_storeStrong((id *)&v12->_configuration, a5);
  }

  return v12;
}

+ (id)identityConfiguration
{
  return (id)objc_opt_new();
}

+ (id)configurationWithIncomingItemsIdentifierFunction:(id)a3 publishedItemsIdentifierFunction:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setIncomingItemsIdentifierFunction:", v6);

  objc_msgSend(v7, "setPublishedItemsIdentifierFunction:", v5);
  return v7;
}

- (void)updateWithNewArray:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  CRKArrayDifferenceEngine *v14;
  void *v15;
  void (**v16)(void *, _QWORD);
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  CRKArrayDifferenceEngine *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t (**v77)(_QWORD, _QWORD, _QWORD);
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  SEL v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  CRKArrayDifferenceEngine *v108;
  _QWORD v109[4];
  id v110;
  void (**v111)(void *, _QWORD);
  id v112;
  _QWORD v113[4];
  id v114;
  id v115;
  CRKArrayDifferenceEngine *v116;
  id v117;
  id v118;
  id v119;
  id v120;
  _QWORD v121[4];
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _QWORD v127[4];
  id v128;
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mObject);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKArrayDifferenceEngine.m"), 104, CFSTR("client must ensure that the object to be updated is kept alive"));

  }
  objc_msgSend(WeakRetained, "mutableArrayValueForKeyPath:", self->mKeyPath);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKArrayDifferenceEngine configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "incomingItemsIdentifierFunction");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v108 = self;
  v97 = v5;
  v102 = WeakRetained;
  v106 = v7;
  v90 = a2;
  if (v9)
  {
    v11 = (void *)v9;
    -[CRKArrayDifferenceEngine configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "publishedItemsIdentifierFunction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = self;
      -[CRKArrayDifferenceEngine configuration](self, "configuration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "incomingItemsIdentifierFunction");
      v16 = (void (**)(void *, _QWORD))objc_claimAutoreleasedReturnValue();

      -[CRKArrayDifferenceEngine configuration](v14, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "publishedItemsIdentifierFunction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v127[0] = v10;
      v127[1] = 3221225472;
      v127[2] = __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke;
      v127[3] = &unk_24D9C8AA8;
      v19 = v18;
      v128 = v19;
      objc_msgSend(v7, "crk_mapUsingBlock:", v127);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v20);
      v103 = (id)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v103, "count");
      if (v21 != objc_msgSend(v20, "count"))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", a2, v108, CFSTR("CRKArrayDifferenceEngine.m"), 127, CFSTR("identifiers are not unique in the published array: %@"), v7);

      }
      v22 = (void *)objc_opt_new();
      v123 = 0u;
      v124 = 0u;
      v125 = 0u;
      v126 = 0u;
      v23 = v5;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v123, v129, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v124;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v124 != v26)
              objc_enumerationMutation(v23);
            v28 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * i);
            v16[2](v16, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, v29);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v123, v129, 16);
        }
        while (v25);
      }

      v30 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v22, "allKeys");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setWithArray:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v32;
      v34 = objc_msgSend(v33, "count");
      if (v34 != objc_msgSend(v22, "count"))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "handleFailureInMethod:object:file:lineNumber:description:", v90, v108, CFSTR("CRKArrayDifferenceEngine.m"), 135, CFSTR("identifiers are not unique in the incoming array: %@"), v23);

      }
      v10 = MEMORY[0x24BDAC760];
      v121[0] = MEMORY[0x24BDAC760];
      v121[1] = 3221225472;
      v121[2] = __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke_2;
      v121[3] = &unk_24D9C9538;
      v122 = v22;
      v35 = v22;
      v36 = (void *)MEMORY[0x219A226E8](v121);
      objc_msgSend(v103, "setByIntersectingSet:", v33);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = v103;
      v39 = v97;
      v40 = v106;
      v41 = v33;
      goto LABEL_23;
    }
  }
  else
  {

  }
  -[CRKArrayDifferenceEngine configuration](self, "configuration");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "incomingItemsIdentifierFunction");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKArrayDifferenceEngine.m"), 143, CFSTR("both identifier functions must be NULL or both must be non-NULL"));

  }
  -[CRKArrayDifferenceEngine configuration](self, "configuration");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "publishedItemsIdentifierFunction");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKArrayDifferenceEngine.m"), 144, CFSTR("both identifier functions must be NULL or both must be non-NULL"));

  }
  +[CRKPointerSet setWithArray:](CRKPointerSet, "setWithArray:", v7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v5;
  +[CRKPointerSet setWithArray:](CRKPointerSet, "setWithArray:", v5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_opt_new();
  v19 = &__block_literal_global_67;
  v36 = &__block_literal_global_67;
  v16 = (void (**)(void *, _QWORD))&__block_literal_global_67;
  v40 = v7;
LABEL_23:
  objc_msgSend(v41, "setBySubtractingSet:", v38);
  v100 = v41;
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v38;
  objc_msgSend(v38, "setBySubtractingSet:", v41);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_opt_new();
  v48 = (void *)objc_opt_new();
  v113[0] = v10;
  v113[1] = 3221225472;
  v113[2] = __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke_3;
  v113[3] = &unk_24D9C9560;
  v99 = v19;
  v119 = v99;
  v49 = v46;
  v114 = v49;
  v50 = v47;
  v115 = v50;
  v116 = v108;
  v51 = v37;
  v117 = v51;
  v52 = v36;
  v120 = v52;
  v105 = v48;
  v118 = v105;
  objc_msgSend(v40, "enumerateObjectsUsingBlock:", v113);
  v53 = v40;
  if (objc_msgSend(v50, "count"))
    objc_msgSend(v40, "removeObjectsAtIndexes:", v50);
  v98 = v50;
  v54 = v101;
  v55 = v39;
  v56 = v102;
  if (objc_msgSend(v101, "count") || objc_msgSend(v105, "count"))
  {
    v94 = v52;
    v95 = v49;
    v96 = v51;
    v57 = v108;
    -[CRKArrayDifferenceEngine configuration](v108, "configuration");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "liftingFunction");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (!v59)
      v59 = &__block_literal_global_67;
    v61 = (void *)MEMORY[0x219A226E8](v59);

    v109[0] = MEMORY[0x24BDAC760];
    v109[1] = 3221225472;
    v109[2] = __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke_4;
    v109[3] = &unk_24D9C9588;
    v110 = v101;
    v111 = v16;
    v93 = v61;
    v112 = v93;
    objc_msgSend(v55, "crk_mapUsingBlock:", v109);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKArrayDifferenceEngine configuration](v108, "configuration");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "publishedItemsComparator");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      v65 = v105;
      v92 = v62;
      objc_msgSend(v65, "addObjectsFromArray:", v62);
      -[CRKArrayDifferenceEngine configuration](v108, "configuration");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "publishedItemsComparator");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = v65;
      objc_msgSend(v65, "sortedArrayUsingComparator:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v53);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v69, "count"))
      {
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v107 = v68;
        do
        {
          if (v70 >= objc_msgSend(v68, "count"))
            break;
          v73 = v69;
          objc_msgSend(v69, "objectAtIndexedSubscript:", v71);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "objectAtIndexedSubscript:", v70);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRKArrayDifferenceEngine configuration](v57, "configuration");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "publishedItemsComparator");
          v77 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v78 = ((uint64_t (**)(_QWORD, void *, void *))v77)[2](v77, v74, v75);

          if ((unint64_t)(v78 + 1) > 1)
          {
            objc_msgSend(v106, "insertObject:atIndex:", v75, v72);
            ++v70;
          }
          else
          {
            ++v71;
          }
          ++v72;

          v69 = v73;
          v68 = v107;
          v57 = v108;
        }
        while (v71 < objc_msgSend(v73, "count"));
      }
      else
      {
        v71 = 0;
        v70 = 0;
      }
      if (v70 < objc_msgSend(v68, "count"))
      {
        if (v71 != objc_msgSend(v69, "count"))
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "handleFailureInMethod:object:file:lineNumber:description:", v90, v57, CFSTR("CRKArrayDifferenceEngine.m"), 223, CFSTR("we must have exhausted the original elements, otherwise the merge pass above is busted"));

        }
        objc_msgSend(v68, "subarrayWithRange:", v70, objc_msgSend(v68, "count") - v70);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", objc_msgSend(v106, "count"), objc_msgSend(v81, "count"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "insertObjects:atIndexes:", v81, v82);

      }
      v55 = v97;
      v54 = v101;
      v56 = v102;
      v53 = v106;
      v52 = v94;
      v79 = v91;
      v80 = v92;
    }
    else
    {
      if (objc_msgSend(v105, "count"))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "handleFailureInMethod:object:file:lineNumber:description:", v90, v108, CFSTR("CRKArrayDifferenceEngine.m"), 195, CFSTR("should not have any items to reinsert when comparator is NULL"));

      }
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", objc_msgSend(v40, "count"), objc_msgSend(v62, "count"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "insertObjects:atIndexes:", v62, v79);
      v80 = v62;
      v52 = v94;
    }

    v49 = v95;
    v51 = v96;
  }

}

uint64_t __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

void __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t (**v12)(_QWORD, _QWORD, _QWORD);
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  id v21;

  v21 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    objc_msgSend(*(id *)(a1 + 48), "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateBlock");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(*(id *)(a1 + 56), "containsObject:", v5);

      if (v9)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "configuration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateBlock");
        v12 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v13 = ((uint64_t (**)(_QWORD, id, void *))v12)[2](v12, v21, v10);

        objc_msgSend(*(id *)(a1 + 48), "configuration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "publishedItemsComparator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 && v13)
        {
          objc_msgSend(*(id *)(a1 + 64), "addObject:", v21);
          objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
        }
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 48), "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateBlock");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "publishedItemsComparator");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        v20 = objc_msgSend(*(id *)(a1 + 56), "containsObject:", v5);

        if (!v20)
          goto LABEL_12;
        objc_msgSend(*(id *)(a1 + 64), "addObject:", v21);
        goto LABEL_2;
      }

    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_2:
  objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
LABEL_12:

}

id __47__CRKArrayDifferenceEngine_updateWithNewArray___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = (void *)a1[4];
  (*(void (**)(void))(a1[5] + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    (*(void (**)(void))(a1[6] + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CRKArrayDifferenceConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->mKeyPath, 0);
  objc_destroyWeak((id *)&self->mObject);
}

@end
