@implementation RWIProtocolDOMNode(IKJSInspector)

+ (id)ik_nodeFromDOMNode:()IKJSInspector depth:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "ik_nodeFromDOMNode:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(v5, "childNodesAsArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v9 = 0;
      if (a4 == -1)
        v10 = 0xFFFFFFFFLL;
      else
        v10 = (a4 - 1);
      do
      {
        v11 = (void *)objc_opt_class();
        objc_msgSend(v7, "objectAtIndex:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ik_nodeFromDOMNode:depth:", v12, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

        ++v9;
      }
      while (v9 < objc_msgSend(v7, "count"));
    }
    objc_msgSend(v6, "setChildren:", v8);
    if (objc_msgSend(v5, "nodeType") == 9)
    {
      objc_msgSend(v5, "documentURI");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14)
        v16 = (const __CFString *)v14;
      else
        v16 = CFSTR("myscheme://mydomain.com/default.html");
      objc_msgSend(v6, "setDocumentURL:", v16);

      objc_msgSend(v6, "setXmlVersion:", CFSTR("1.0"));
    }

  }
  return v6;
}

+ (id)ik_nodeFromDOMNode:()IKJSInspector
{
  id v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  __CFString *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "nodeValue");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = &stru_1E9F50578;
  v6 = (void *)MEMORY[0x1E0DD9620];
  v7 = objc_msgSend(v3, "ITMLID");
  v8 = objc_msgSend(v3, "nodeType");
  objc_msgSend(v3, "nodeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nodeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safe_initWithNodeId:nodeType:nodeName:localName:nodeValue:", v7, v8, v9, v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "nodeType") == 1)
  {
    objc_msgSend(v3, "_attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      v25 = v5;
      v26 = v3;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v12, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            +[IKDOMElement _filteredAttributes](IKDOMElement, "_filteredAttributes");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "containsObject:", v19);

            if ((v21 & 1) == 0)
            {
              objc_msgSend(v13, "addObject:", v19);
              objc_msgSend(v12, "objectForKey:", v19);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v22);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v16);
      }

      v5 = v25;
      v3 = v26;
    }
    objc_msgSend(v11, "setAttributes:", v13);

  }
  objc_msgSend(v3, "childNodesAsArray");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setChildNodeCount:", objc_msgSend(v23, "count"));

  return v11;
}

- (id)ik_attributesDictionary
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKDOMElement _filteredAttributes](IKDOMElement, "_filteredAttributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "containsObject:", v5);

      if ((v7 & 1) == 0)
      {
        objc_msgSend(v3, "objectAtIndex:", v4 + 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v8, v5);

      }
      v4 += 2;
    }
    while (objc_msgSend(v3, "count") > v4);
  }

  return v2;
}

- (void)ik_setAttributeValue:()IKJSInspector name:
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[IKDOMElement _filteredAttributes](IKDOMElement, "_filteredAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if ((v9 & 1) == 0)
  {
    ITMLKitGetLogObject(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v17 = 138412802;
      v18 = v7;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = a1;
      _os_log_debug_impl(&dword_1D95F2000, v10, OS_LOG_TYPE_DEBUG, "Setting %@ = %@ on %@", (uint8_t *)&v17, 0x20u);
    }

    objc_msgSend(a1, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if (objc_msgSend(v12, "count"))
    {
      v13 = 0;
      while (1)
      {
        objc_msgSend(v12, "objectAtIndex:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v7);

        if (v15)
          break;
        v13 += 2;
        if (objc_msgSend(v12, "count") <= v13)
          goto LABEL_8;
      }
      v16 = v13 & 0xFFFFFFFE | 1;
      objc_msgSend(v12, "removeObjectAtIndex:", v16);
      objc_msgSend(v12, "insertObject:atIndex:", v6, v16);
    }
    else
    {
LABEL_8:
      objc_msgSend(v12, "addObject:", v7);
      objc_msgSend(v12, "addObject:", v6);
    }
    objc_msgSend(a1, "setAttributes:", v12);

  }
}

- (void)ik_removeAttributeNamed:()IKJSInspector
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  objc_msgSend(a1, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", v9);

      if (v8)
        break;
      v6 += 2;
      if (objc_msgSend(v5, "count") <= v6)
        goto LABEL_7;
    }
    objc_msgSend(v5, "removeObjectAtIndex:", v6 & 0xFFFFFFFE | 1);
    objc_msgSend(v5, "removeObjectAtIndex:", v6);
  }
LABEL_7:
  objc_msgSend(a1, "setAttributes:", v5);

}

- (void)ik_removeChildWithId:()IKJSInspector
{
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;

  objc_msgSend(a1, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(v9, "count"))
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "nodeId");

      if (v8 == a3)
        break;
      if (objc_msgSend(v9, "count") <= (unint64_t)++v6)
        goto LABEL_7;
    }
    objc_msgSend(v9, "removeObjectAtIndex:", v6);
    objc_msgSend(a1, "setChildNodeCount:", objc_msgSend(a1, "childNodeCount") - 1);
    objc_msgSend(a1, "setChildren:", v9);
  }
LABEL_7:

}

- (void)ik_insertChild:()IKJSInspector before:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(a1, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v6)
  {
    if (objc_msgSend(v8, "count"))
    {
      v9 = 0;
      while (1)
      {
        objc_msgSend(v8, "objectAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "nodeId");
        if (v11 == objc_msgSend(v6, "intValue"))
          break;

        if (objc_msgSend(v8, "count") <= (unint64_t)++v9)
          goto LABEL_9;
      }
      objc_msgSend(v8, "insertObject:atIndex:", v12, v9);

    }
  }
  else
  {
    objc_msgSend(v8, "addObject:", v12);
  }
LABEL_9:
  objc_msgSend(a1, "setChildren:", v8);

}

- (id)ik_description
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "nodeId");
  objc_msgSend(a1, "nodeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p, id: %i, name: %@, type: %i>"), v4, a1, v5, v6, objc_msgSend(a1, "nodeType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ik_nodeWithNodeId:()IKJSInspector
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "nodeId") == (_DWORD)a3)
    return a1;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "children", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "ik_nodeWithNodeId:", a3);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;

          return v12;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }

  return 0;
}

- (uint64_t)ik_updateWithDOMNode:()IKJSInspector dispatcher:
{
  return objc_msgSend(a1, "ik_updateWithDOMNode:fullfillChildren:dispatcher:", a3, 0, a4);
}

- (void)ik_updateWithDOMNode:()IKJSInspector fullfillChildren:dispatcher:
{
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  char v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  IKDiffEvaluator *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t m;
  void *v78;
  NSObject *v79;
  void *v80;
  unint64_t v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  NSObject *v89;
  NSObject *v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  int v94;
  int *v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  IKDiffEvaluator *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  char v121[4];
  int v122;
  char v123[24];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  void *v127;
  uint8_t buf[4];
  void *v129;
  __int16 v130;
  void *v131;
  __int16 v132;
  void *v133;
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v104 = a5;
  objc_msgSend(v8, "nodeValue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E9F50578;
  objc_msgSend(a1, "setNodeValue:", v11);

  objc_msgSend(a1, "setNodeType:", objc_msgSend(v8, "nodeType"));
  objc_msgSend(v8, "nodeName");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1E9F50578;
  objc_msgSend(a1, "setNodeName:", v14);

  objc_msgSend(v8, "nodeName");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = &stru_1E9F50578;
  objc_msgSend(a1, "setLocalName:", v17);

  if (objc_msgSend(v8, "nodeType") == 1)
  {
    v94 = a4;
    v96 = v8;
    objc_msgSend(v8, "_attributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ik_attributesDictionary");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v118;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v118 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
          +[IKDOMElement _filteredAttributes](IKDOMElement, "_filteredAttributes");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "containsObject:", v24);

          if ((v26 & 1) == 0)
          {
            objc_msgSend(v102, "objectForKey:", v24);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKey:", v24);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v27, "isEqualToString:", v28) & 1) == 0)
            {
              ITMLKitGetLogObject(1);
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(a1, "ik_description");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v129 = v99;
                v130 = 2112;
                v131 = v24;
                v132 = 2112;
                v133 = v28;
                _os_log_debug_impl(&dword_1D95F2000, v29, OS_LOG_TYPE_DEBUG, "Updating attribute for %@: %@ = %@", buf, 0x20u);

              }
              objc_msgSend(a1, "ik_setAttributeValue:name:", v28, v24);
              objc_msgSend(v104, "safe_attributeModifiedWithNodeId:name:value:", objc_msgSend(a1, "nodeId"), v24, v28);
              if (objc_msgSend(v24, "isEqualToString:", CFSTR("style")))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1, "nodeId"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v127 = v30;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v127, 1);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "safe_inlineStyleInvalidatedWithNodeIds:", v31);

              }
            }

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v117, v134, 16);
      }
      while (v21);
    }

    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    objc_msgSend(v102, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v113, v126, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v114;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v114 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
          objc_msgSend(v19, "allKeys");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "containsObject:", v37);

          if ((v39 & 1) == 0)
          {
            ITMLKitGetLogObject(1);
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(a1, "ik_description");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v129 = v37;
              v130 = 2112;
              v131 = v41;
              _os_log_debug_impl(&dword_1D95F2000, v40, OS_LOG_TYPE_DEBUG, "Removing attribute (%@) for %@", buf, 0x16u);

            }
            objc_msgSend(a1, "ik_removeAttributeNamed:", v37);
            objc_msgSend(v104, "safe_attributeRemovedWithNodeId:name:", objc_msgSend(a1, "nodeId"), v37);
          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v113, v126, 16);
      }
      while (v34);
    }

    v8 = v96;
    a4 = v94;
  }
  objc_msgSend(a1, "children");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42 || a4)
  {
    objc_msgSend(a1, "children");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(a1, "children");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v44, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v8, "childNodesAsArray");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "mutableCopy");

    v48 = -[IKDiffEvaluator initWithObjects:oldObjects:hashing:]([IKDiffEvaluator alloc], "initWithObjects:oldObjects:hashing:", v47, v45, &__block_literal_global_1);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDiffEvaluator addedIndexes](v48, "addedIndexes");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      -[IKDiffEvaluator addedIndexes](v48, "addedIndexes");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addIndexes:", v51);

    }
    v101 = v49;
    v103 = a1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDiffEvaluator movedIndexesByNewIndex](v48, "movedIndexesByNewIndex");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v100 = v48;
    if (v52)
    {
      v53 = v47;
      v54 = v45;
      v97 = v8;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      -[IKDiffEvaluator movedIndexesByNewIndex](v48, "movedIndexesByNewIndex");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v109, v125, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v110;
        do
        {
          for (k = 0; k != v57; ++k)
          {
            if (*(_QWORD *)v110 != v58)
              objc_enumerationMutation(v55);
            v60 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * k);
            objc_msgSend(v101, "addIndex:", objc_msgSend(v60, "unsignedIntegerValue"));
            -[IKDiffEvaluator movedIndexesByNewIndex](v48, "movedIndexesByNewIndex");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "objectForKey:", v60);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v62, "unsignedIntegerValue");

            objc_msgSend(v54, "objectAtIndex:", v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "objectAtIndex:", objc_msgSend(v60, "unsignedIntegerValue"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v63) = objc_msgSend(v64, "nodeId");
            if (objc_msgSend(v65, "ITMLID") == (int)v63)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v64, "nodeId"));
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "setObject:forKey:", v64, v66);

            }
            v48 = v100;
          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v109, v125, 16);
        }
        while (v57);
      }

      v8 = v97;
      v45 = v54;
      v47 = v53;
    }
    -[IKDiffEvaluator removedIndexes](v48, "removedIndexes");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      v68 = v47;
      -[IKDiffEvaluator removedIndexes](v100, "removedIndexes");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectsAtIndexes:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      -[IKDiffEvaluator removedIndexes](v100, "removedIndexes");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v45;
      objc_msgSend(v45, "removeObjectsAtIndexes:", v71);

      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v73 = v70;
      v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v105, v124, 16);
      if (v74)
      {
        v75 = v74;
        v76 = *(_QWORD *)v106;
        do
        {
          for (m = 0; m != v75; ++m)
          {
            if (*(_QWORD *)v106 != v76)
              objc_enumerationMutation(v73);
            v78 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * m);
            ITMLKitGetLogObject(1);
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
              -[RWIProtocolDOMNode(IKJSInspector) ik_updateWithDOMNode:fullfillChildren:dispatcher:].cold.5((uint64_t)buf, (uint64_t)v103);

            objc_msgSend(v104, "safe_childNodeRemovedWithParentNodeId:nodeId:", objc_msgSend(v103, "nodeId"), objc_msgSend(v78, "nodeId"));
          }
          v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v105, v124, 16);
        }
        while (v75);
      }

      v45 = v72;
      v47 = v68;
    }
    a1 = v103;
    v80 = v101;
    if (objc_msgSend(v47, "count"))
    {
      v81 = 0;
      v95 = &v122;
      do
      {
        objc_msgSend(v47, "objectAtIndex:", v81, v95);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (v81 >= objc_msgSend(v45, "count"))
        {
          if (objc_msgSend(v80, "containsIndex:", v81))
          {
            v83 = 0;
LABEL_76:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v82, "ITMLID"));
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "objectForKey:", v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();

            if (v86)
            {
              objc_msgSend(v86, "ik_updateWithDOMNode:dispatcher:", v82, v104);
              v83 = v86;
              if (v81)
                goto LABEL_78;
LABEL_82:
              v88 = 0;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DD9620], "ik_nodeFromDOMNode:", v82);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              ITMLKitGetLogObject(1);
              v89 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
                -[RWIProtocolDOMNode(IKJSInspector) ik_updateWithDOMNode:fullfillChildren:dispatcher:].cold.3((uint64_t)v123, (uint64_t)v83);

              if (!v81)
                goto LABEL_82;
LABEL_78:
              objc_msgSend(v45, "objectAtIndex:", v81 - 1);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = objc_msgSend(v87, "nodeId");

            }
            v80 = v101;
            objc_msgSend(v104, "safe_childNodeInsertedWithParentNodeId:previousNodeId:node:", objc_msgSend(v103, "nodeId"), v88, v83);
            objc_msgSend(v45, "insertObject:atIndex:", v83, v81);
LABEL_84:

          }
        }
        else
        {
          objc_msgSend(v45, "objectAtIndex:", v81);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v80, "containsIndex:", v81) & 1) != 0)
            goto LABEL_76;
          if (v83)
          {
            ITMLKitGetLogObject(1);
            v84 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
              -[RWIProtocolDOMNode(IKJSInspector) ik_updateWithDOMNode:fullfillChildren:dispatcher:].cold.4((uint64_t)v121, (uint64_t)v83);

            objc_msgSend(v83, "ik_updateWithDOMNode:dispatcher:", v82, v104);
            goto LABEL_84;
          }
        }

        ++v81;
      }
      while (v81 < objc_msgSend(v47, "count"));
    }
    objc_msgSend(v103, "setChildren:", v45);
    ITMLKitGetLogObject(1);
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
      -[RWIProtocolDOMNode(IKJSInspector) ik_updateWithDOMNode:fullfillChildren:dispatcher:].cold.2(v103);

  }
  objc_msgSend(v8, "childNodesAsArray");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "count");

  if (objc_msgSend(a1, "childNodeCount") != (_DWORD)v92)
  {
    ITMLKitGetLogObject(1);
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
      -[RWIProtocolDOMNode(IKJSInspector) ik_updateWithDOMNode:fullfillChildren:dispatcher:].cold.1(a1);

    objc_msgSend(a1, "setChildNodeCount:", v92);
    objc_msgSend(v104, "safe_childNodeCountUpdatedWithNodeId:childNodeCount:", objc_msgSend(a1, "nodeId"), v92);
  }

}

- (void)ik_updateWithDOMNode:()IKJSInspector fullfillChildren:dispatcher:.cold.1(void *a1)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  objc_msgSend(a1, "ik_description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "childNodeCount");
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x18u);

  OUTLINED_FUNCTION_1_0();
}

- (void)ik_updateWithDOMNode:()IKJSInspector fullfillChildren:dispatcher:.cold.2(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  objc_msgSend(a1, "ik_description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x16u);

  OUTLINED_FUNCTION_1_0();
}

- (void)ik_updateWithDOMNode:()IKJSInspector fullfillChildren:dispatcher:.cold.3(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1, a2), "ik_description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_0_0(&dword_1D95F2000, v5, v6, "Newly added node: %@");

  OUTLINED_FUNCTION_3_1();
}

- (void)ik_updateWithDOMNode:()IKJSInspector fullfillChildren:dispatcher:.cold.4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1, a2), "ik_description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_0_0(&dword_1D95F2000, v5, v6, "Updating node: %@");

  OUTLINED_FUNCTION_3_1();
}

- (void)ik_updateWithDOMNode:()IKJSInspector fullfillChildren:dispatcher:.cold.5(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1, a2), "ik_description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_0_0(&dword_1D95F2000, v5, v6, "Removed %@");

  OUTLINED_FUNCTION_3_1();
}

@end
