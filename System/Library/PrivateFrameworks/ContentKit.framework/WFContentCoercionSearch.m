@implementation WFContentCoercionSearch

+ (id)searchForCoercingItem:(id)a3 toItemClass:(Class)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc((Class)a1);
  +[WFContentCoercionNode coercionNodeWithItem:parent:](WFContentCoercionNode, "coercionNodeWithItem:parent:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = a4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithStartNode:goalItemClasses:goalType:options:", v11, v12, 0, v8);

  return v13;
}

+ (id)searchForCoercingItem:(id)a3 toItemClasses:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  +[WFContentCoercionNode coercionNodeWithItem:parent:](WFContentCoercionNode, "coercionNodeWithItem:parent:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithStartNode:goalItemClasses:goalType:options:", v12, v9, 0, v8);
  return v13;
}

+ (id)searchForCoercingItem:(id)a3 toType:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  +[WFContentCoercionNode coercionNodeWithItem:parent:](WFContentCoercionNode, "coercionNodeWithItem:parent:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithStartNode:goalItemClasses:goalType:options:", v12, 0, v9, v8);
  return v13;
}

- (WFContentCoercionSearch)initWithStartNode:(id)a3 goalItemClasses:(id)a4 goalType:(id)a5 options:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFContentCoercionSearch *v15;
  WFContentCoercionSearch *v16;
  uint64_t v17;
  NSMutableArray *agenda;
  WFContentCoercionSearch *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[WFContentCoercionSearch init](self, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_startNode, a3);
    objc_storeStrong((id *)&v16->_goalItemClasses, a4);
    objc_storeStrong((id *)&v16->_goalType, a5);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v11);
    v17 = objc_claimAutoreleasedReturnValue();
    agenda = v16->_agenda;
    v16->_agenda = (NSMutableArray *)v17;

    objc_storeStrong((id *)&v16->_options, a6);
    v19 = v16;
  }

  return v16;
}

- (BOOL)isCoercionPathAllowedForNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;

  objc_msgSend(a3, "coercionPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentCoercionSearch goalType](self, "goalType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[WFContentItemRegistry sharedRegistry](WFContentItemRegistry, "sharedRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentCoercionSearch goalType](self, "goalType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "contentItemClassForType:", v7);

    if (v8)
    {
      objc_msgSend(v4, "orderedSetByAddingObject:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
    }
  }
  -[WFContentCoercionSearch options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "coercionPathIsDisallowed:", v4) ^ 1;

  return v11;
}

- (BOOL)goalTest:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFContentCoercionSearch goalType](self, "goalType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v23 = 0uLL;
    v24 = 0uLL;
    v21 = 0uLL;
    v22 = 0uLL;
    objc_msgSend(v4, "supportedTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      v10 = *MEMORY[0x24BDF8350];
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "conformsToType:", v5) & 1) != 0)
          break;
        if (objc_msgSend(v5, "conformsToType:", v12))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v5, "isCoreType"))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && objc_msgSend(v12, "isCoreType")
                && !objc_msgSend(v12, "isEqualToUTType:", v10))
              {
                break;
              }
            }
          }
        }
        if (v8 == ++v11)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_16;
        }
      }
LABEL_26:
      LOBYTE(v13) = 1;
      goto LABEL_27;
    }
LABEL_16:
    LOBYTE(v13) = 0;
  }
  else
  {
    v19 = 0uLL;
    v20 = 0uLL;
    *((_QWORD *)&v17 + 1) = 0;
    v18 = 0uLL;
    -[WFContentCoercionSearch goalItemClasses](self, "goalItemClasses", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v18;
LABEL_19:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v6);
        if ((objc_msgSend((id)objc_opt_class(), "isSubclassOfClass:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15)) & 1) != 0)
          goto LABEL_26;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v13)
            goto LABEL_19;
          break;
        }
      }
    }
  }
LABEL_27:

  return v13;
}

- (id)nextPathNode
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  WFContentCoercionSearch *v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t j;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id obj;
  WFContentCoercionSearch *v42;
  uint64_t v43;
  os_log_t log;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  os_log_t v54;
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  -[WFContentCoercionSearch agenda](self, "agenda");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
    goto LABEL_27;
  v42 = self;
  v4 = (void *)MEMORY[0x24BDAC760];
  v40 = v3;
  while (1)
  {
    objc_msgSend(v3, "objectAtIndex:", 0, v39);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectAtIndex:", 0);
    objc_msgSend(v5, "itemOrItemClass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFContentCoercionSearch goalTest:](v42, "goalTest:", v6);

    if (v7)
      break;
    -[WFContentCoercionSearch options](v42, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentCoercionSearch goalType](v42, "goalType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "successorsWithOptions:goalType:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v4;
    v53[1] = 3221225472;
    v53[2] = __39__WFContentCoercionSearch_nextPathNode__block_invoke;
    v53[3] = &unk_24C4E31A8;
    v39 = v5;
    log = (os_log_t)v5;
    v54 = log;
    objc_msgSend(v11, "if_map:", v53);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObjectsFromArray:", v12);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (!v13)
      goto LABEL_25;
    v14 = v13;
    v15 = v42;
    v43 = *(_QWORD *)v50;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v50 != v43)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v17, "itemOrItemClass", v39);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_opt_class();
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        -[NSObject itemOrItemClassPath](log, "itemOrItemClassPath");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        if (v21)
        {
          v22 = v21;
          v23 = 0;
          v24 = *(_QWORD *)v46;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v46 != v24)
                objc_enumerationMutation(v20);
              v23 |= objc_opt_class() == v19;
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
          }
          while (v22);

          v15 = v42;
          if ((v23 & 1) != 0)
          {
            objc_msgSend(v40, "removeObject:", v17);
            goto LABEL_23;
          }
        }
        else
        {

        }
        if (-[WFContentCoercionSearch goalTest:](v15, "goalTest:", v18)
          && -[WFContentCoercionSearch isCoercionPathAllowedForNode:](v15, "isCoercionPathAllowedForNode:", v17))
        {
          getWFContentGraphLogObject();
          v26 = objc_claimAutoreleasedReturnValue();
          v3 = v40;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            -[WFContentCoercionSearch startNode](v15, "startNode");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "itemOrItemClass");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFContentCoercionSearch goalItemClasses](v15, "goalItemClasses");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if (!v29)
            {
              -[WFContentCoercionSearch goalType](v15, "goalType");
              i = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)i, "typeDescription");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v17, "itemOrItemClassPath");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v58 = "-[WFContentCoercionSearch nextPathNode]";
            v59 = 2112;
            v60 = v28;
            v61 = 2112;
            v62 = v30;
            v63 = 2112;
            v64 = v31;
            _os_log_impl(&dword_20BBAD000, v26, OS_LOG_TYPE_INFO, "%s Found coercion path from %@ to %@: %@", buf, 0x2Au);

            if (!v29)
            {

            }
          }

          objc_msgSend(v40, "removeObject:", v17);
          v5 = v17;

          goto LABEL_35;
        }
LABEL_23:

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      if (v14)
        continue;
      break;
    }
LABEL_25:

    v5 = v39;
    v3 = v40;
    v4 = (void *)MEMORY[0x24BDAC760];
LABEL_26:

    if (!objc_msgSend(v3, "count"))
    {
LABEL_27:
      v5 = 0;
      goto LABEL_36;
    }
  }
  if (!-[WFContentCoercionSearch isCoercionPathAllowedForNode:](v42, "isCoercionPathAllowedForNode:", v5))
    goto LABEL_26;
  getWFContentGraphLogObject();
  log = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    -[WFContentCoercionSearch startNode](v42, "startNode");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "itemOrItemClass");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentCoercionSearch goalItemClasses](v42, "goalItemClasses");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (!v36)
    {
      -[WFContentCoercionSearch goalType](v42, "goalType");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "typeDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "itemOrItemClassPath");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v58 = "-[WFContentCoercionSearch nextPathNode]";
    v59 = 2112;
    v60 = v35;
    v61 = 2114;
    v62 = v37;
    v63 = 2112;
    v64 = v38;
    _os_log_impl(&dword_20BBAD000, log, OS_LOG_TYPE_INFO, "%s Found coercion path from %@ to %{public}@: %@", buf, 0x2Au);

    if (!v36)
    {

    }
  }
LABEL_35:

LABEL_36:
  return v5;
}

- (id)badCoercionError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFContentCoercionSearch startNode](self, "startNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemOrItemClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();

  -[WFContentCoercionSearch goalItemClasses](self, "goalItemClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFContentCoercionSearch goalItemClasses](self, "goalItemClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "badCoercionErrorForItemClasses:", v7);
  }
  else
  {
    -[WFContentCoercionSearch goalType](self, "goalType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "badCoercionErrorForType:", v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)runCoercion:(id)a3
{
  -[WFContentCoercionSearch continueCoercionWithContentItems:error:handler:](self, "continueCoercionWithContentItems:error:handler:", 0, 0, a3);
}

- (void)continueCoercionWithContentItems:(id)a3 error:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void (*v12)(void);
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    v12 = (void (*)(void))*((_QWORD *)v10 + 2);
LABEL_3:
    v12();
    goto LABEL_11;
  }
  if (v9 && !+[WFContentItem errorIsBadCoercionError:](WFContentItem, "errorIsBadCoercionError:", v9))
  {
    v12 = (void (*)(void))v11[2];
    goto LABEL_3;
  }
  -[WFContentCoercionSearch nextPathNode](self, "nextPathNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[WFContentCoercionSearch options](self, "options");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __74__WFContentCoercionSearch_continueCoercionWithContentItems_error_handler___block_invoke;
    v16[3] = &unk_24C4E3180;
    v16[4] = self;
    v17 = v11;
    objc_msgSend(v13, "runCoercionWithOptions:completionHandler:", v14, v16);

  }
  else
  {
    -[WFContentCoercionSearch badCoercionError](self, "badCoercionError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, _QWORD, void *))v11[2])(v11, 0, v15);

  }
LABEL_11:

}

- (id)runCoercionSynchronouslyWithError:(id *)a3
{
  return -[WFContentCoercionSearch continueCoercionWithContentItems:error:](self, "continueCoercionWithContentItems:error:", 0, a3);
}

- (id)continueCoercionWithContentItems:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else if (a4
         && *a4
         && !+[WFContentItem errorIsBadCoercionError:](WFContentItem, "errorIsBadCoercionError:"))
  {
    v8 = 0;
  }
  else
  {
    -[WFContentCoercionSearch nextPathNode](self, "nextPathNode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[WFContentCoercionSearch options](self, "options");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "runCoercionSynchronouslyWithOptions:error:", v10, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFContentCoercionSearch continueCoercionWithContentItems:error:](self, "continueCoercionWithContentItems:error:", v11, a4);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else if (a4)
    {
      -[WFContentCoercionSearch badCoercionError](self, "badCoercionError");
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (WFCoercionOptions)options
{
  return self->_options;
}

- (WFContentCoercionNode)startNode
{
  return self->_startNode;
}

- (NSArray)goalItemClasses
{
  return self->_goalItemClasses;
}

- (WFType)goalType
{
  return self->_goalType;
}

- (NSMutableOrderedSet)visitedStates
{
  return self->_visitedStates;
}

- (NSMutableArray)agenda
{
  return self->_agenda;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agenda, 0);
  objc_storeStrong((id *)&self->_visitedStates, 0);
  objc_storeStrong((id *)&self->_goalType, 0);
  objc_storeStrong((id *)&self->_goalItemClasses, 0);
  objc_storeStrong((id *)&self->_startNode, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

uint64_t __74__WFContentCoercionSearch_continueCoercionWithContentItems_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "continueCoercionWithContentItems:error:handler:", a2, a3, *(_QWORD *)(a1 + 40));
}

WFContentCoercionNode *__39__WFContentCoercionSearch_nextPathNode__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFContentCoercionNode coercionNodeWithItemOrItemClass:parent:](WFContentCoercionNode, "coercionNodeWithItemOrItemClass:parent:", a2, *(_QWORD *)(a1 + 32));
}

@end
