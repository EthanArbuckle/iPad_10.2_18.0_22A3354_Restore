@implementation HFServiceGroupItem

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  objc_msgSend(v7, "hf_homeKitObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  if (!v10)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v10;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

LABEL_7:
    v12 = 0;
  }

  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValueSource:serviceGroup:", v6, v12);
  return v15;
}

- (HFServiceGroupItem)initWithValueSource:(id)a3 serviceGroup:(id)a4
{
  id v7;
  id v8;
  HFServiceGroupItem *v9;
  HFServiceGroupItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFServiceGroupItem;
  v9 = -[HFServiceGroupItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_valueSource, a3);
    objc_storeStrong((id *)&v10->_serviceGroup, a4);
  }

  return v10;
}

- (HFServiceGroupItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceGroupItem.m"), 40, CFSTR("Use -initWithValueSource:serviceGroup:"));

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFServiceGroupItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFServiceGroupItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[HFServiceGroupItem serviceGroup](self, "serviceGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithValueSource:serviceGroup:", v4, v6);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceGroupItem serviceGroup](self, "serviceGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItem latestResults](self, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFServiceGroupItem _buildServiceItems](self, "_buildServiceItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "updateWithOptions:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "na_safeAddObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }

  v14 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "combineAllFutures:ignoringErrors:scheduler:", v7, 1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __50__HFServiceGroupItem__subclass_updateWithOptions___block_invoke;
  v24[3] = &unk_1EA72A028;
  v24[4] = self;
  v25 = v8;
  v26 = v4;
  v17 = v5;
  v27 = v17;
  v18 = v4;
  v19 = v8;
  v20 = (id)objc_msgSend(v16, "addCompletionBlock:", v24);
  v21 = v27;
  v22 = v17;

  return v22;
}

void __50__HFServiceGroupItem__subclass_updateWithOptions___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  char v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t k;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id *v76;
  id obj;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "serviceGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_serviceNameComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("serviceNameComponents"));
    objc_msgSend(v9, "composedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

  }
  v75 = v9;
  objc_msgSend(a1[4], "_buildControlItemsForServiceItems:", a1[5]);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "objectForKeyedSubscript:", HFItemUpdateOptionPreviousResults);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("childItems"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  v73 = v16;
  v74 = (void *)v11;
  objc_msgSend(v16, "na_setByDiffingWithSet:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("childItems"));

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v76 = a1;
  v18 = a1[5];
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v95 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "latestResults");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          objc_msgSend(v81, "unionSet:", v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
    }
    while (v20);
  }

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v81, CFSTR("dependentHomeKitObjects"));
  v25 = v76;
  objc_msgSend(v76[4], "_unanimousValueForResultsKey:inServiceItems:", CFSTR("hidden"), v76[5]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = objc_msgSend(v26, "BOOLValue");
  v28 = objc_msgSend(v76[5], "count");
  objc_msgSend(v76[4], "serviceGroup");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "hf_isSupported");

  if ((v30 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v45, CFSTR("hidden"));
LABEL_58:

    goto LABEL_59;
  }
  if (v28)
    v27 = v27;
  else
    v27 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, CFSTR("hidden"));

  if ((v27 & 1) == 0)
  {
    v70 = v26;
    v71 = v6;
    v72 = v5;
    objc_msgSend(v76[4], "_mergedIconDescriptorForServiceItems:", v76[5]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, CFSTR("icon"));

    objc_msgSend(v76[4], "_unanimousValueForResultsKey:inServiceItems:", CFSTR("state"), v76[5]);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v33)
      v35 = (void *)v33;
    else
      v35 = &unk_1EA7CD000;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("state"));

    objc_msgSend(v76[4], "_mostCommonValueForResultsKey:inServiceItems:", CFSTR("roomIdentifier"), v76[5]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("roomIdentifier"));

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v37 = v76[5];
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v91;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v91 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * j), "latestResults");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("dateAdded"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v43)
          {
            objc_msgSend(v80, "earlierDate:", v43);
            v44 = objc_claimAutoreleasedReturnValue();

            v80 = (void *)v44;
          }

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
      }
      while (v39);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v80, "isEqualToDate:", v46);

    if ((v47 & 1) == 0)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v80, CFSTR("dateAdded"));
    objc_msgSend(v76[4], "_mostCommonValueInServiceItems:valueProvider:", v76[5], &__block_literal_global_180);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_safeSetObject:forKey:");
    v48 = v76[5];
    objc_msgSend(v76[4], "_sortDescriptorsForServiceItems");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "sortedArrayUsingDescriptors:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    obj = v50;
    v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
    if (v79)
    {
      v78 = *(_QWORD *)v87;
      do
      {
        for (k = 0; k != v79; ++k)
        {
          if (*(_QWORD *)v87 != v78)
            objc_enumerationMutation(obj);
          v52 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * k);
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          objc_msgSend(v52, "latestResults");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v83;
            do
            {
              for (m = 0; m != v55; ++m)
              {
                if (*(_QWORD *)v83 != v56)
                  objc_enumerationMutation(v53);
                v58 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * m);
                objc_msgSend(v7, "objectForKeyedSubscript:", v58);
                v59 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v59)
                {
                  objc_msgSend(v52, "latestResults");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "objectForKeyedSubscript:", v58);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", v61, v58);

                }
              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
            }
            while (v55);
          }

        }
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
      }
      while (v79);
    }

    v25 = v76;
    objc_msgSend(v76[4], "serviceGroup");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "hf_hasSetFavorite");

    v6 = v71;
    if (v63)
    {
      v64 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v76[4], "serviceGroup");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "numberWithBool:", objc_msgSend(v65, "hf_isFavorite"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v66, CFSTR("isFavorite"));

    }
    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, CFSTR("isFavorite"));
    }
    v5 = v72;
    v26 = v70;
    v45 = v80;

    goto LABEL_58;
  }
LABEL_59:
  v67 = v25[7];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "finishWithResult:", v68);

}

id __50__HFServiceGroupItem__subclass_updateWithOptions___block_invoke_15(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("badge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqual:", &unk_1EA7CD018))
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (BOOL)isItemGroup
{
  return 1;
}

- (unint64_t)numberOfItemsContainedWithinGroup
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HFServiceGroupItem serviceGroup](self, "serviceGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (BOOL)isContainedWithinItemGroup
{
  return 0;
}

- (id)_buildServiceItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HFServiceGroupItem serviceGroup](self, "serviceGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__HFServiceGroupItem__buildServiceItems__block_invoke;
  v9[3] = &unk_1EA729278;
  v9[4] = self;
  objc_msgSend(v6, "na_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __40__HFServiceGroupItem__buildServiceItems__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceItem serviceItemForService:valueSource:](HFServiceItem, "serviceItemForService:valueSource:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_buildControlItemsForServiceItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(uint64_t, void *);
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  id obj;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  _QWORD v41[6];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "anyObject", v4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "latestResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __56__HFServiceGroupItem__buildControlItemsForServiceItems___block_invoke;
    v50[3] = &unk_1EA7292E0;
    v50[4] = self;
    objc_msgSend(v6, "na_map:", v50);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v4;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v36)
    {
      v34 = *(_QWORD *)v47;
      v9 = __56__HFServiceGroupItem__buildControlItemsForServiceItems___block_invoke_2;
      v10 = &unk_1EA729308;
      v11 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v47 != v34)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          if (v13 != v35)
          {
            v37 = i;
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 0u;
            v43 = 0u;
            v44 = 0u;
            v45 = 0u;
            objc_msgSend(v13, "latestResults");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("childItems"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v40 = v15;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v43;
              do
              {
                v19 = 0;
                v38 = v17;
                do
                {
                  if (*(_QWORD *)v43 != v18)
                    objc_enumerationMutation(v40);
                  v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v19);
                  v41[0] = v11;
                  v41[1] = 3221225472;
                  v41[2] = v9;
                  v41[3] = v10;
                  v41[4] = self;
                  v41[5] = v20;
                  objc_msgSend(v8, "na_firstObjectPassingTest:", v41);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v21)
                  {
                    if (objc_msgSend((id)objc_opt_class(), "_isControlItem:identicalToControlItem:", v21, v20))
                    {
                      objc_msgSend(v39, "addObject:", v21);
                    }
                    else
                    {
                      v22 = v18;
                      v23 = v8;
                      v24 = v10;
                      v25 = v9;
                      objc_msgSend(v20, "characteristicOptions");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "characteristicOptions");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v26, "optionsByIntersectingWithOptions:", v27);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v21, "canCopyWithCharacteristicOptions:", v28))
                      {
                        -[HFServiceGroupItem _aggregatedValueSource](self, "_aggregatedValueSource");
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        v30 = (void *)objc_msgSend(v21, "copyWithCharacteristicOptions:valueSource:", v28, v29);

                        objc_msgSend(v39, "addObject:", v30);
                      }

                      v11 = MEMORY[0x1E0C809B0];
                      v9 = v25;
                      v10 = v24;
                      v8 = v23;
                      v18 = v22;
                      v17 = v38;
                    }
                  }

                  ++v19;
                }
                while (v17 != v19);
                v17 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
              }
              while (v17);
            }

            v8 = v39;
            i = v37;
          }
        }
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v36);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

id __56__HFServiceGroupItem__buildControlItemsForServiceItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_aggregatedValueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "copyWithValueSource:", v4);

  return v5;
}

uint64_t __56__HFServiceGroupItem__buildControlItemsForServiceItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = objc_msgSend((id)objc_opt_class(), "_isControlItem:similarToControlItem:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

+ (BOOL)_isControlItem:(id)a3 similarToControlItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v5, "characteristicOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1EA7CD018);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristicOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", &unk_1EA7CD018);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "intersectsSet:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_isControlItem:(id)a3 identicalToControlItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v5, "characteristicOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristicOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_aggregatedValueSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HFSimpleAggregatedCharacteristicValueSource *v7;
  void *v8;
  void *v9;
  void *v10;
  HFSimpleAggregatedCharacteristicValueSource *v11;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HFServiceGroupItem serviceGroup](self, "serviceGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  -[HFServiceGroupItem valueSource](self, "valueSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceGroupItem serviceGroup](self, "serviceGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_serviceDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:services:primaryServiceDescriptor:](v7, "initWithValueSource:services:primaryServiceDescriptor:", v8, v6, v10);

  return v11;
}

- (id)primaryStateControlItem
{
  void *v2;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ is deprecated and should no longer be used!"), v2);

  return 0;
}

- (id)incrementalStateControlItem
{
  void *v2;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ is deprecated and should no longer be used!"), v2);

  return 0;
}

- (id)allControlItems
{
  void *v2;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ is deprecated and should no longer be used!"), v2);

  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)controlPanelItems
{
  void *v2;

  NSStringFromSelector(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ is deprecated and should no longer be used!"), v2);

  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)containsActions
{
  void *v2;
  char v3;

  -[HFServiceGroupItem _buildServiceItems](self, "_buildServiceItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_29_4);

  return v3;
}

uint64_t __37__HFServiceGroupItem_containsActions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsActions");
}

- (BOOL)actionsMayRequireDeviceUnlock
{
  void *v2;
  char v3;

  -[HFServiceGroupItem _buildServiceItems](self, "_buildServiceItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_30_3);

  return v3;
}

uint64_t __51__HFServiceGroupItem_actionsMayRequireDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actionsMayRequireDeviceUnlock");
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[HFServiceGroupItem serviceGroup](self, "serviceGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v10);
        -[HFServiceGroupItem valueSource](self, "valueSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[HFServiceItem serviceItemForService:valueSource:](HFServiceItem, "serviceItemForService:valueSource:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "currentStateActionBuildersForHome:", v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v27, "addObject:", v14);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

  v15 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "combineAllFutures:ignoringErrors:scheduler:", v27, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __56__HFServiceGroupItem_currentStateActionBuildersForHome___block_invoke;
  v30[3] = &unk_1EA730B78;
  v19 = v26;
  v31 = v19;
  v20 = (id)objc_msgSend(v17, "addSuccessBlock:", v30);
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __56__HFServiceGroupItem_currentStateActionBuildersForHome___block_invoke_2;
  v28[3] = &unk_1EA726968;
  v21 = v19;
  v29 = v21;
  v22 = (id)objc_msgSend(v17, "addFailureBlock:", v28);
  v23 = v29;
  v24 = v21;

  return v24;
}

void __56__HFServiceGroupItem_currentStateActionBuildersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "unionSet:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v4);
}

uint64_t __56__HFServiceGroupItem_currentStateActionBuildersForHome___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (HMHome)home
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HFServiceGroupItem serviceGroup](self, "serviceGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v5;
}

- (NSSet)services
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HFServiceGroupItem serviceGroup](self, "serviceGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  if (v4)
  {
    -[HFServiceGroupItem serviceGroup](self, "serviceGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "services");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v8;
}

- (id)accessories
{
  void *v2;
  void *v3;

  -[HFServiceGroupItem services](self, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_34_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __33__HFServiceGroupItem_accessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4;
  HFServiceGroupBuilder *v5;
  void *v6;
  HFServiceGroupBuilder *v7;

  v4 = a3;
  v5 = [HFServiceGroupBuilder alloc];
  -[HFServiceGroupItem homeKitObject](self, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFServiceGroupBuilder initWithExistingObject:inHome:](v5, "initWithExistingObject:inHome:", v6, v4);

  return v7;
}

+ (id)_combinedWriteErrorForError:(id)a3 serviceGroupTitle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("HFOperationChangeValuesForMultipleServices"), CFSTR("HFErrorUserInfoOperationKey"));
  if (v6)
  {
    v11 = CFSTR("HFErrorHandlerOptionFailedItemName");
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("HFErrorUserInfoOptionsKey"));

  }
  objc_msgSend(v5, "hf_errorWithAddedUserInfo:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_unanimousValueForResultsKey:(id)a3 inServiceItems:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "latestResults", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          if (v9)
          {
            if (!objc_msgSend(v9, "isEqual:", v13))
            {

              v14 = 0;
              goto LABEL_16;
            }
          }
          else
          {
            v9 = v13;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v9 = v9;
  v14 = v9;
LABEL_16:

  return v14;
}

- (double)_averageNumericalValueForResultsKey:(id)a3 inServiceItems:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v7)
    goto LABEL_13;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v19;
  v11 = 0.0;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "latestResults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          ++v9;
          objc_msgSend(v14, "doubleValue");
          v11 = v11 + v15;
        }
      }

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v8);
  if (v9 >= 1)
    v16 = v11 / (double)v9;
  else
LABEL_13:
    v16 = 1.79769313e308;

  return v16;
}

- (id)_mostCommonValueForResultsKey:(id)a3 inServiceItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__HFServiceGroupItem__mostCommonValueForResultsKey_inServiceItems___block_invoke;
  v10[3] = &unk_1EA730C48;
  v11 = v6;
  v7 = v6;
  -[HFServiceGroupItem _mostCommonValueInServiceItems:valueProvider:](self, "_mostCommonValueInServiceItems:valueProvider:", a4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __67__HFServiceGroupItem__mostCommonValueForResultsKey_inServiceItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_highestIntegerValueForResultsKey:(id)a3 inServiceItems:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = 0xFFFFFFFF80000000;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "latestResults");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "integerValue") > v10)
          v10 = objc_msgSend(v13, "integerValue");

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0xFFFFFFFF80000000;
  }

  return v10;
}

- (id)_mergedIconDescriptorForServiceItems:(id)a3
{
  id v4;
  HFImageIconDescriptor *v5;
  void *v6;
  HFImageIconDescriptor *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HFImageIconDescriptor *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HFImageIconDescriptor *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  HFImageIconDescriptor *v26;
  uint64_t v27;
  HFImageIconDescriptor *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HFImageIconDescriptor *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HFImageIconDescriptor initWithImageIdentifier:]([HFImageIconDescriptor alloc], "initWithImageIdentifier:", CFSTR("HFImageIconIdentifierGeneric"));
  objc_msgSend(v4, "na_map:", &__block_literal_global_38_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v7 = (HFImageIconDescriptor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "na_map:", &__block_literal_global_39_4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_map:", &__block_literal_global_40_8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") >= 2 && objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serviceType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "anyObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "serviceSubtype");
      v13 = v9;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFServiceIconFactory defaultIconDescriptorForServiceType:serviceSubtype:](HFServiceIconFactory, "defaultIconDescriptorForServiceType:serviceSubtype:", v11, v14);
      v7 = (HFImageIconDescriptor *)objc_claimAutoreleasedReturnValue();

      v9 = v13;
    }
    else
    {
      -[HFServiceGroupItem _mostCommonValueInServiceItems:valueProvider:](self, "_mostCommonValueInServiceItems:valueProvider:", v4, &__block_literal_global_42_4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __59__HFServiceGroupItem__mergedIconDescriptorForServiceItems___block_invoke_5;
        v39[3] = &unk_1EA730C48;
        v40 = v15;
        objc_msgSend(v4, "na_map:", v39);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          v33 = v8;
          objc_msgSend(v17, "anyObject");
          v18 = (HFImageIconDescriptor *)(id)objc_claimAutoreleasedReturnValue();
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v17;
          objc_msgSend(v17, "na_setByRemovingObjectsFromSet:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
          v34 = v18;
          v22 = v18;
          if (v21)
          {
            v23 = v21;
            v24 = *(_QWORD *)v36;
            v22 = v34;
            v30 = v16;
            v31 = v9;
            while (2)
            {
              v25 = 0;
              v26 = v22;
              do
              {
                if (*(_QWORD *)v36 != v24)
                  objc_enumerationMutation(v20);
                if (!v26
                  || (v27 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v25), (objc_opt_respondsToSelector() & 1) == 0))
                {

                  v22 = 0;
                  v16 = v30;
                  v9 = v31;
                  goto LABEL_20;
                }
                -[HFImageIconDescriptor iconDescriptorByMergingWithIconDescriptor:](v26, "iconDescriptorByMergingWithIconDescriptor:", v27);
                v22 = (HFImageIconDescriptor *)objc_claimAutoreleasedReturnValue();

                ++v25;
                v26 = v22;
              }
              while (v23 != v25);
              v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
              v16 = v30;
              v9 = v31;
              if (v23)
                continue;
              break;
            }
          }
LABEL_20:

          if (v22)
            v28 = v22;
          else
            v28 = v5;
          v7 = v28;

          v17 = v32;
          v8 = v33;
        }
        else
        {
          if (!objc_msgSend(v17, "count"))
            NSLog(CFSTR("We have a most common icon identifier, but no icon descriptor. Our logic in this method must be wrong"));
          v7 = v5;
        }

      }
      else
      {
        v7 = v5;
      }

    }
  }

  return v7;
}

id __59__HFServiceGroupItem__mergedIconDescriptorForServiceItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("icon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __59__HFServiceGroupItem__mergedIconDescriptorForServiceItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_accessoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __59__HFServiceGroupItem__mergedIconDescriptorForServiceItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_serviceDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __59__HFServiceGroupItem__mergedIconDescriptorForServiceItems___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("icon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __59__HFServiceGroupItem__mergedIconDescriptorForServiceItems___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("icon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)_mostCommonValueInServiceItems:(id)a3 valueProvider:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  if (v5)
  {
    objc_msgSend(a3, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_48_3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__HFServiceGroupItem__mostCommonValueInServiceItems_valueProvider___block_invoke_2;
    v11[3] = &unk_1EA73B3A8;
    v12 = v5;
    objc_msgSend(v7, "na_map:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_firstMostCommonObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __67__HFServiceGroupItem__mostCommonValueInServiceItems_valueProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __67__HFServiceGroupItem__mostCommonValueInServiceItems_valueProvider___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_sortDescriptorsForServiceItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:comparator:", 0, 0, &__block_literal_global_50_8);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:comparator:", 0, 0, &__block_literal_global_53_3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:comparator:", 0, 0, &__block_literal_global_54_3);
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __53__HFServiceGroupItem__sortDescriptorsForServiceItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("priority"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = &unk_1EA7CD030;
  v9 = v8;

  objc_msgSend(v4, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("priority"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = &unk_1EA7CD030;
  v14 = v13;

  v15 = objc_msgSend(v9, "compare:", v14);
  return v15;
}

uint64_t __53__HFServiceGroupItem__sortDescriptorsForServiceItems__block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorDescription"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "latestResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("errorDescription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = -1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("errorDescription"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

    v11 = 0;
  }
  else
  {
    objc_msgSend(v5, "latestResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("errorDescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15 != 0;

  }
LABEL_8:

  return v11;
}

uint64_t __53__HFServiceGroupItem__sortDescriptorsForServiceItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subPriority"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = &unk_1EA7CD048;
  v9 = v8;

  objc_msgSend(v4, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("subPriority"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = &unk_1EA7CD048;
  v14 = v13;

  v15 = objc_msgSend(v9, "compare:", v14);
  return v15;
}

- (id)namingComponentForHomeKitObject
{
  void *v2;
  void *v3;

  -[HFServiceGroupItem serviceGroup](self, "serviceGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNamingComponents namingComponentFromServiceGroup:](HFNamingComponents, "namingComponentFromServiceGroup:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HMServiceGroup)serviceGroup
{
  return self->_serviceGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceGroup, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
}

@end
