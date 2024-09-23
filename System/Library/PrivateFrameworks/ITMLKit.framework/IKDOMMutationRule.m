@implementation IKDOMMutationRule

+ (id)mutationRuleWithDOMElement:(id)a3 mutable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "nodeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("specialize")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("generalize")))
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDOMElement:mutable:", v6, v4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (IKDOMMutationRule)initWithDOMElement:(id)a3 mutable:(BOOL)a4
{
  IKDOMMutationRule *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IKDOMMutationRule;
  result = -[IKDOMConditional initWithDOMElement:](&v6, sel_initWithDOMElement_, a3);
  if (result)
    result->_mutable = a4;
  return result;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int64_t v11;

  v4 = a3;
  -[IKDOMConditional domElement](self, "domElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tagName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("specialize"));

  objc_msgSend(v4, "domElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "tagName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("specialize"));

  v11 = -1;
  if (!v10)
    v11 = 1;
  if (v7 != v10)
    return v11;
  else
    return 0;
}

- (void)applyOnDOMElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  int v41;
  IKDOMMutationRule *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v40 = v4;
  objc_msgSend(v4, "childElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v49 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v11, "getAttribute:", CFSTR("tag"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length"))
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v8);
  }

  -[IKDOMConditional domElement](self, "domElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ownerDocument");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKDOMConditional domElement](self, "domElement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tagName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("specialize"));

  v39 = v14;
  v41 = v17;
  if (-[IKDOMMutationRule isMutable](self, "isMutable"))
  {
    if (v17)
      v18 = CFSTR("generalize");
    else
      v18 = CFSTR("specialize");
    objc_msgSend(v14, "createElement:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDOMConditional domElement](self, "domElement");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "getAttribute:", CFSTR("state"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "length"))
      objc_msgSend(v19, "setAttributeValue:withName:", v21, CFSTR("notInState"));
    -[IKDOMConditional domElement](self, "domElement");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "getAttribute:", CFSTR("notInState"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v23, "length"))
      objc_msgSend(v19, "setAttributeValue:withName:", v23, CFSTR("state"));
    v43 = v19;

  }
  else
  {
    v43 = 0;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = self;
  -[IKDOMConditional domElement](self, "domElement");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "childElements");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v45 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v30, "getAttribute:", CFSTR("tag"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v31);
          v32 = objc_claimAutoreleasedReturnValue();
          if (v32)
          {
            v33 = (void *)v32;
            v34 = (void *)objc_opt_class();
            if (v41)
              objc_msgSend(v34, "_applySpecializationOnDOMElement:withDOMElement:", v33, v30);
            else
              objc_msgSend(v34, "_applyGeneralizationOnDOMElement:withDOMElement:", v33, v30);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35 == v33)
            {
              v36 = v43;
              if (v43)
              {
                v37 = v30;
LABEL_35:
                v38 = (id)objc_msgSend(v36, "appendChild:", v37);
              }
            }
            else
            {
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, v31);
              v36 = v43;
              if (v43)
              {
                v37 = v33;
                goto LABEL_35;
              }
            }

          }
        }

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v27);
  }

  if (v43)
    -[IKDOMConditional mutateWithDOMElement:](v42, "mutateWithDOMElement:", v43);

}

+ (id)_applySpecializationOnDOMElement:(id)a3 withDOMElement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "nodeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("placeholder"));

  if (v8)
  {
    objc_msgSend(v5, "parentNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloneNode:", 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v9, "replaceChild::", v10, v5);
    v12 = v5;
    v5 = (id)v10;
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v5, "nodeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodeName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getAttribute:", CFSTR("class"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsSeparatedByCharactersInSet:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v17);

    }
    objc_msgSend(v6, "getAttribute:", CFSTR("class"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsSeparatedByCharactersInSet:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v20);

    }
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR(" "));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAttributeValue:withName:", v22, CFSTR("class"));

    }
    else
    {
      objc_msgSend(v5, "setAttributeValue:withName:", 0, CFSTR("class"));
    }

    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

+ (id)_applyGeneralizationOnDOMElement:(id)a3 withDOMElement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "nodeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("placeholder"));

  if (v8)
  {
    objc_msgSend(v5, "parentNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloneNode:", 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v9, "replaceChild::", v10, v5);
    v12 = v5;
    v5 = (id)v10;
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v5, "nodeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nodeName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getAttribute:", CFSTR("class"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsSeparatedByCharactersInSet:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v17);

    }
    objc_msgSend(v6, "getAttribute:", CFSTR("class"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
    {
      v19 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsSeparatedByCharactersInSet:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setWithArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "minusSet:", v22);

    }
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "allObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR(" "));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAttributeValue:withName:", v24, CFSTR("class"));

    }
    else
    {
      objc_msgSend(v5, "setAttributeValue:withName:", 0, CFSTR("class"));
    }

    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (BOOL)isMutable
{
  return self->_mutable;
}

@end
