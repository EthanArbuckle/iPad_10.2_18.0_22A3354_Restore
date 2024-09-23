@implementation IKJSImpression

- (id)asPrivateIKJSImpression
{
  IKJSImpression *v3;

  if (-[IKJSImpression conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01F9370))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

+ (id)impressionsMapForViewElements:(id)a3 appContext:(id)a4 timestamp:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "impressionsMapForViewElements:appContext:timestamp:existingImpressionsMap:", v8, v7, a5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)impressionsMapForViewElements:(id)a3 appContext:(id)a4 timestamp:(int64_t)a5 existingImpressionsMap:(id)a6
{
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  IKJSImpression *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  IKJSImpression *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v47;
  uint64_t v48;
  int64_t v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v55 = a4;
  v10 = a6;
  v11 = 0x1E0C99000uLL;
  v54 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v47 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v57 = v12;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v9;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (v51)
  {
    v13 = *(_QWORD *)v69;
    v48 = *(_QWORD *)v69;
    v49 = a5;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v69 != v13)
          objc_enumerationMutation(obj);
        v52 = v14;
        v15 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v14);
        if (objc_msgSend(v15, "isImpressionable", v47))
        {
          v58 = objc_alloc_init(*(Class *)(v11 + 3592));
          objc_msgSend(v15, "impressionableAttributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v53 = v16;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v65;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v65 != v19)
                  objc_enumerationMutation(v53);
                v21 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
                objc_msgSend(v53, "objectForKey:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                _KeyedDictionaryObject(v57, v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                _KeyFromElement(v15);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKey:", v24);
                v25 = (IKJSImpression *)objc_claimAutoreleasedReturnValue();

                if (!v25)
                {
                  v25 = -[IKJSImpression initWithAppContext:data:index:queueTag:]([IKJSImpression alloc], "initWithAppContext:data:index:queueTag:", v55, v22, _IndexForElement(v15), v21);
                  _KeyFromElement(v15);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "setObject:forKey:", v25, v26);

                  objc_opt_class();
                  _KeyedDictionaryObject(v54, v21);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "addObject:", v25);

                }
                -[IKJSImpression addTimestamp:](v25, "addTimestamp:", a5);
                objc_msgSend(v58, "setObject:forKey:", v25, v21);

                v11 = 0x1E0C99000uLL;
              }
              v18 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
            }
            while (v18);
          }
          objc_msgSend(v15, "parent");
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = v58;
          if (v28)
          {
            v30 = (void *)v28;
            do
            {
              if (objc_msgSend(v30, "isImpressionable"))
              {
                objc_msgSend(v29, "allKeys");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = 0u;
                v61 = 0u;
                v62 = 0u;
                v63 = 0u;
                v56 = v31;
                v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
                if (v32)
                {
                  v33 = v32;
                  v59 = *(_QWORD *)v61;
                  do
                  {
                    for (j = 0; j != v33; ++j)
                    {
                      if (*(_QWORD *)v61 != v59)
                        objc_enumerationMutation(v56);
                      v35 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
                      objc_msgSend(v30, "impressionableAttributes");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v36, "objectForKey:", v35);
                      v37 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v37)
                      {
                        objc_opt_class();
                        _KeyedDictionaryObject(v57, v35);
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "objectForKey:", v35);
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        _KeyFromElement(v30);
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v38, "objectForKey:", v40);
                        v41 = (IKJSImpression *)objc_claimAutoreleasedReturnValue();

                        if (!v41)
                        {
                          v41 = -[IKJSImpression initWithAppContext:data:index:queueTag:]([IKJSImpression alloc], "initWithAppContext:data:index:queueTag:", v55, v37, _IndexForElement(v30), v35);
                          _KeyFromElement(v30);
                          v42 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v38, "setObject:forKey:", v41, v42);

                          objc_opt_class();
                          _KeyedDictionaryObject(v54, v35);
                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v43, "addObject:", v41);

                        }
                        -[IKJSImpression addChild:](v41, "addChild:", v39);
                        objc_msgSend(v29, "setObject:forKey:", v41, v35);

                        v11 = 0x1E0C99000;
                      }

                    }
                    v33 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
                  }
                  while (v33);
                }

              }
              objc_msgSend(v30, "parent");
              v44 = objc_claimAutoreleasedReturnValue();

              v30 = (void *)v44;
            }
            while (v44);
          }

          v13 = v48;
          a5 = v49;
        }
        v14 = v52 + 1;
      }
      while (v52 + 1 != v51);
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    }
    while (v51);
  }

  v45 = (void *)objc_msgSend(v54, "copy");
  return v45;
}

- (IKJSImpression)initWithAppContext:(id)a3 data:(id)a4 index:(unint64_t)a5 queueTag:(id)a6
{
  id v11;
  id v12;
  IKJSImpression *v13;
  IKJSImpression *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)IKJSImpression;
  v13 = -[IKJSObject initWithAppContext:](&v16, sel_initWithAppContext_, a3);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_metricsData, a4);
    objc_storeStrong((id *)&v14->_metricsTag, a6);
    if (a5 != 0x7FFFFFFFFFFFFFFFLL)
      v14->_indexInParent = a5;
  }

  return v14;
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
  int64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSImpression data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSImpression mutableTimestamps](self, "mutableTimestamps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSImpression parent](self, "parent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSImpression mutableChildren](self, "mutableChildren");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IKJSImpression index](self, "index");
  -[IKJSImpression impressionQueueTag](self, "impressionQueueTag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, data [%@ %p] timestamps [%@] parent [%p] children [%@] index [%ld] tag [%@]>"), v5, self, v6, self, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSArray)timestamps
{
  void *v3;
  void *v4;
  void *v5;

  -[IKJSImpression mutableTimestamps](self, "mutableTimestamps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IKJSImpression mutableTimestamps](self, "mutableTimestamps");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v5;
}

- (NSArray)children
{
  void *v3;
  void *v4;
  void *v5;

  -[IKJSImpression mutableChildren](self, "mutableChildren");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IKJSImpression mutableChildren](self, "mutableChildren");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v5;
}

- (id)parent
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[IKJSImpression parentImpression](self, "parentImpression");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)linkReferences
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[IKJSImpression children](self, "children", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        -[IKJSObject appContext](self, "appContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "jsContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "virtualMachine");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "addManagedReference:withOwner:", v8, self);
        objc_msgSend(v11, "addManagedReference:withOwner:", self, v8);
        objc_msgSend(v8, "linkReferences");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)addTimestamp:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    -[IKJSImpression mutableTimestamps](self, "mutableTimestamps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[IKJSImpression setMutableTimestamps:](self, "setMutableTimestamps:", v6);

    }
    -[IKJSImpression mutableTimestamps](self, "mutableTimestamps");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);

  }
}

- (void)addChild:(id)a3
{
  id v4;
  void *v5;
  id v6;
  IKJSImpression *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    -[IKJSImpression mutableChildren](self, "mutableChildren");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[IKJSImpression setMutableChildren:](self, "setMutableChildren:", v6);

    }
    objc_msgSend(v9, "parentImpression");
    v7 = (IKJSImpression *)objc_claimAutoreleasedReturnValue();

    v4 = v9;
    if (v7 != self)
    {
      objc_msgSend(v9, "setParentImpression:", self);
      -[IKJSImpression mutableChildren](self, "mutableChildren");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      v4 = v9;
    }
  }

}

- (IKJSImpression)parentImpression
{
  return (IKJSImpression *)objc_loadWeakRetained((id *)&self->_parentImpression);
}

- (void)setParentImpression:(id)a3
{
  objc_storeWeak((id *)&self->_parentImpression, a3);
}

- (NSString)metricsTag
{
  return self->_metricsTag;
}

- (void)setMetricsTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)metricsData
{
  return self->_metricsData;
}

- (void)setMetricsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableArray)mutableTimestamps
{
  return self->_mutableTimestamps;
}

- (void)setMutableTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_mutableTimestamps, a3);
}

- (NSMutableArray)mutableChildren
{
  return self->_mutableChildren;
}

- (void)setMutableChildren:(id)a3
{
  objc_storeStrong((id *)&self->_mutableChildren, a3);
}

- (int64_t)indexInParent
{
  return self->_indexInParent;
}

- (void)setIndexInParent:(int64_t)a3
{
  self->_indexInParent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableChildren, 0);
  objc_storeStrong((id *)&self->_mutableTimestamps, 0);
  objc_storeStrong((id *)&self->_metricsData, 0);
  objc_storeStrong((id *)&self->_metricsTag, 0);
  objc_destroyWeak((id *)&self->_parentImpression);
}

@end
