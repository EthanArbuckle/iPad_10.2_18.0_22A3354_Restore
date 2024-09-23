@implementation IKDOMNode

- (id)ik_nodePath
{
  IKDOMNode *v4;
  void *v5;
  __int128 v6;
  unint64_t v7;
  IKDOMNode *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[IKDOMNode nodeType](self, "nodeType") == 9)
    return 0;
  v4 = self;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", -[IKDOMNode ITMLID](v4, "ITMLID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = 0x1E9F4A000uLL;
    *(_QWORD *)&v6 = 138412546;
    v22 = v6;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      -[IKDOMNode parentNode](v4, "parentNode");
      v8 = (IKDOMNode *)objc_claimAutoreleasedReturnValue();
      -[IKDOMNode childNodesAsArray](v8, "childNodesAsArray");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "indexOfObject:", v4);

      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {

        v16 = 0;
        goto LABEL_19;
      }
      ITMLKitGetLogObject(1);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v13 = v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[IKDOMNode tagName](v4, "tagName");
        }
        else
        {
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v22;
        v24 = v15;
        v25 = 2048;
        v26 = v10;
        _os_log_debug_impl(&dword_1D95F2000, v11, OS_LOG_TYPE_DEBUG, "%@ is %lu", buf, 0x16u);

        v7 = v13;
      }

      objc_msgSend(v5, "indexPathByAddingIndex:", v10);
      v12 = objc_claimAutoreleasedReturnValue();

      v4 = v8;
      v5 = (void *)v12;
      if (!v8)
      {
        v5 = (void *)v12;
        break;
      }
    }
  }
  v17 = v5;
  objc_msgSend(v5, "indexPathByAddingIndex:", 0, v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = &buf[-((8 * objc_msgSend(v5, "length") + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  if (objc_msgSend(v5, "length"))
  {
    v19 = 0;
    v20 = -1;
    do
    {
      v21 = objc_msgSend(v5, "indexAtPosition:", v19);
      *(_QWORD *)&v18[8 * objc_msgSend(v5, "length") + 8 * v20] = v21;
      ++v19;
      --v20;
    }
    while (objc_msgSend(v5, "length") > v19);
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v18, objc_msgSend(v5, "length"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v16;
}

- (id)ik_nodeWithId:(int64_t)a3
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__19;
  v10 = __Block_byref_object_dispose__19;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__IKDOMNode_IKJSInspector__ik_nodeWithId___block_invoke;
  v5[3] = &unk_1E9F4E2D8;
  v5[4] = &v6;
  v5[5] = a3;
  -[IKDOMNode _enumerateNodesWithBlock:](self, "_enumerateNodesWithBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

BOOL __42__IKDOMNode_IKJSInspector__ik_nodeWithId___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2;
  v5 = objc_msgSend(v4, "ITMLID");
  v6 = *(_QWORD *)(a1 + 40);
  if (v5 == v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

  return v5 == v6;
}

- (id)ik_nodesWithIds:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__IKDOMNode_IKJSInspector__ik_nodesWithIds___block_invoke;
  v11[3] = &unk_1E9F4E300;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  -[IKDOMNode _enumerateNodesWithBlock:](self, "_enumerateNodesWithBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

uint64_t __44__IKDOMNode_IKJSInspector__ik_nodesWithIds___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "ITMLID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  return 0;
}

- (id)ik_pathsForSearchQuery:(id)a3 compareOptions:(unint64_t)a4 currentPath:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t i;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  int v24;
  char v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  IKDOMNode *v33;
  BOOL v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", 0);
  v10 = objc_claimAutoreleasedReturnValue();
  -[IKDOMNode nodeName](self, "nodeName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "rangeOfString:options:", v8, a4);

  -[IKDOMNode nodeValue](self, "nodeValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[IKDOMNode nodeValue](self, "nodeValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v14, "rangeOfString:options:", v8, a4) != 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v34 = 0;
  }

  objc_opt_class();
  v35 = (void *)v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IKDOMNode _attributes](self, "_attributes");
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v37)
    {
      v33 = self;
      v36 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v39 != v36)
            objc_enumerationMutation(v15);
          v17 = v9;
          v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "rangeOfString:options:", v8, a4, v33);
          objc_msgSend(v15, "objectForKey:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "objectForKey:", v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "rangeOfString:options:", v8, a4) == 0x7FFFFFFFFFFFFFFFLL;

          }
          else
          {
            v22 = 1;
          }

          if (v19 != 0x7FFFFFFFFFFFFFFFLL || !v22)
          {
            v24 = 1;
            v9 = v17;
            goto LABEL_22;
          }
          v9 = v17;
        }
        v37 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v37)
          continue;
        break;
      }
      v24 = 0;
LABEL_22:
      self = v33;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }
  v25 = v12 != 0x7FFFFFFFFFFFFFFFLL || v34;
  if ((v25 & 1) != 0 || v24)
  {
    objc_msgSend(v9, "indexPathByAddingIndex:", -[IKDOMNode ITMLID](self, "ITMLID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v26);

  }
  -[IKDOMNode childNodesAsArray](self, "childNodesAsArray");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "count"))
  {
    v28 = 0;
    do
    {
      objc_msgSend(v27, "objectAtIndex:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "indexPathByAddingIndex:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "ik_pathsForSearchQuery:compareOptions:currentPath:", v8, a4, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "unionOrderedSet:", v31);

      ++v28;
    }
    while (objc_msgSend(v27, "count") > v28);
  }

  return v35;
}

- (id)asPrivateIKJSDOMNode
{
  IKDOMNode *v3;

  if (-[IKDOMNode conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01EA200))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

+ (id)activeDOMNodePtrs
{
  if (activeDOMNodePtrs_onceToken != -1)
    dispatch_once(&activeDOMNodePtrs_onceToken, &__block_literal_global_31);
  return (id)activeDOMNodePtrs_activeDOMNodePtrs;
}

void __30__IKDOMNode_activeDOMNodePtrs__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!activeDOMNodePtrs_activeDOMNodePtrs)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v0 = objc_claimAutoreleasedReturnValue();
    v1 = (void *)activeDOMNodePtrs_activeDOMNodePtrs;
    activeDOMNodePtrs_activeDOMNodePtrs = v0;

  }
}

+ (void)setup
{
  if (setup_onceToken != -1)
    dispatch_once(&setup_onceToken, &__block_literal_global_86);
}

+ (IKDOMNode)nodeWithAppContext:(id)a3 nodePtr:(_xmlNode *)a4
{
  id v6;
  void *v7;
  unsigned __int32 v8;

  v6 = a3;
  if (!a4)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  objc_msgSend(a1, "nodeForNodePtr:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = a4->type - 1;
    if (v8 <= 0xA && ((0x58Fu >> v8) & 1) != 0)
    {
      v7 = (void *)objc_msgSend(objc_alloc(*off_1E9F4F660[v8]), "initWithAppContext:xmlNode:", v6, a4);
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_6:

  return (IKDOMNode *)v7;
}

+ (id)nodeForNodePtr:(_xmlNode *)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v3 = a3->_private;
    objc_msgSend(a1, "activeDOMNodePtrs");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsObject:", v5))
      v6 = v3;
    else
      v6 = 0;

    objc_sync_exit(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (IKDOMNode)initWithAppContext:(id)a3 xmlNode:(_xmlNode *)a4
{
  id v6;
  IKDOMNode *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  IKDOMNodeData *jsNodeData;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  JSManagedValue *managedSelf;
  void *v21;
  objc_super v23;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IKDOMNode;
  v7 = -[IKJSObject initWithAppContext:](&v23, sel_initWithAppContext_, v6);
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "activeDOMNodePtrs");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    objc_sync_exit(v8);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v11;

    v7->_nodePtr = a4;
    a4->_private = v7;
    +[IKDOMNodeData jsNodeDataForNode:](IKDOMNodeData, "jsNodeDataForNode:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    jsNodeData = v7->_jsNodeData;
    v7->_jsNodeData = (IKDOMNodeData *)v13;

    v15 = (void *)MEMORY[0x1E0CBE0F8];
    v16 = (void *)MEMORY[0x1E0CBE108];
    objc_msgSend(v6, "jsContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueWithObject:inContext:", v7, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "managedValueWithValue:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    managedSelf = v7->_managedSelf;
    v7->_managedSelf = (JSManagedValue *)v19;

    -[IKDOMNode _linkManagedObjects](v7, "_linkManagedObjects");
    -[IKDOMNode ownerDocument](v7, "ownerDocument");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setITMLIDForNode:", v7);

  }
  return v7;
}

- (void)dealloc
{
  id v3;
  void *v4;
  _xmlNode *v5;
  void *v6;
  objc_super v7;

  objc_msgSend((id)objc_opt_class(), "activeDOMNodePtrs");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v4);

  objc_sync_exit(v3);
  v5 = -[IKDOMNode nodePtr](self, "nodePtr");
  -[IKDOMNode managedParent](self, "managedParent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && v5)
  {
    if (v5->type == XML_DOCUMENT_NODE)
    {
      xmlFreeDoc((xmlDocPtr)v5);
    }
    else
    {
      xmlSetTreeDoc(v5, 0);
      xmlFreeNode(v5);
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)IKDOMNode;
  -[IKDOMNode dealloc](&v7, sel_dealloc);
}

- (NSString)description
{
  _xmlNode *v3;
  xmlNode *v4;
  xmlBuffer *v5;
  xmlBuffer *v6;
  id v7;
  const xmlChar *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v3)
  {
    v4 = v3;
    v5 = xmlBufferCreate();
    if (v5)
    {
      v6 = v5;
      if (xmlNodeDump(v5, 0, v4, 0, 0))
      {
        v7 = objc_alloc(MEMORY[0x1E0CB3940]);
        v8 = xmlBufferContent(v6);
        v9 = (void *)objc_msgSend(v7, "initWithBytes:length:encoding:", v8, xmlBufferLength(v6), 4);
        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
          v11 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v11;
        }
      }
      else
      {
        v9 = 0;
      }
      xmlBufferFree(v6);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %p nodeptr is destroyed"), objc_opt_class(), self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v9;
}

- (id)childNodesAsArray
{
  _xmlNode *v3;
  _xmlNode *children;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v3)
    children = v3->children;
  else
    children = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (children)
  {
    v6 = (void *)objc_opt_class();
    -[IKJSObject appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nodeWithAppContext:nodePtr:", v7, children);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v5, "addObject:", v8);
    children = children->next;

  }
  if (!objc_msgSend(v5, "count"))
  {

    v5 = 0;
  }
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

- (NSString)nodeName
{
  return 0;
}

- (NSString)nodeValue
{
  return 0;
}

- (void)setNodeValue:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[IKJSObject appContext](self, "appContext", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMException exceptionWithAppContext:code:](IKDOMException, "exceptionWithAppContext:code:", v4, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setException:withErrorMessage:", v5, CFSTR("Node value can't be set on base node."));

}

- (int64_t)nodeType
{
  return 0;
}

- (IKDOMNode)parentNode
{
  _xmlNode *v3;
  _xmlNode *parent;
  void *v5;
  void *v6;

  v3 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v3)
    parent = v3->parent;
  else
    parent = 0;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v5, parent);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKDOMNode *)v6;
}

- (IKDOMNodeList)childNodes
{
  void *v3;
  void *v4;
  IKDOMNodeList *v5;
  IKDOMNodeList *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[IKDOMNode managedChildNodeList](self, "managedChildNodeList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toObjectOfClass:", objc_opt_class());
  v5 = (IKDOMNodeList *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [IKDOMNodeList alloc];
    -[IKJSObject appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[IKDOMNodeList initWithAppContext:contextNode:evaluationBlock:](v6, "initWithAppContext:contextNode:evaluationBlock:", v7, self, &__block_literal_global_113_0);

    -[IKJSObject appContext](self, "appContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "jsContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0CBE0F8];
    objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", v5, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "managedValueWithValue:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "virtualMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addManagedReference:withOwner:", v12, self);

    -[IKDOMNode setManagedChildNodeList:](self, "setManagedChildNodeList:", v12);
  }
  return v5;
}

uint64_t __23__IKDOMNode_childNodes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "childNodesAsArray");
}

- (IKDOMNode)firstChild
{
  _xmlNode *v3;
  _xmlNode *children;
  void *v5;
  void *v6;

  v3 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v3)
    children = v3->children;
  else
    children = 0;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v5, children);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKDOMNode *)v6;
}

- (IKDOMNode)lastChild
{
  _xmlNode *v3;
  _xmlNode *last;
  void *v5;
  void *v6;

  v3 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v3)
    last = v3->last;
  else
    last = 0;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v5, last);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKDOMNode *)v6;
}

- (IKDOMNode)previousSibling
{
  _xmlNode *v3;
  _xmlNode *prev;
  void *v5;
  void *v6;

  v3 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v3)
    prev = v3->prev;
  else
    prev = 0;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v5, prev);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKDOMNode *)v6;
}

- (IKDOMNode)nextSibling
{
  _xmlNode *v3;
  _xmlNode *next;
  void *v5;
  void *v6;

  v3 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v3)
    next = v3->next;
  else
    next = 0;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v5, next);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKDOMNode *)v6;
}

- (IKDOMDocument)ownerDocument
{
  _xmlNode *v3;
  _xmlDoc *doc;
  void *v5;
  void *v6;

  v3 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v3)
    doc = v3->doc;
  else
    doc = 0;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v5, doc);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKDOMDocument *)v6;
}

- (NSString)textContent
{
  return 0;
}

- (void)setTextContent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[IKJSObject appContext](self, "appContext", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMException exceptionWithAppContext:code:](IKDOMException, "exceptionWithAppContext:code:", v4, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setException:withErrorMessage:", v5, CFSTR("Text conent can't be set on base node."));

}

- (id)insertBefore:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[IKDOMNode _validateDOMOperation:newNode:refNode:](self, "_validateDOMOperation:newNode:refNode:", 1, v6, v7))
  {
    if (objc_msgSend(v6, "nodeType") == 11)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v6, "parentNode");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v8;
    -[IKDOMNode performDOMOperation:newNode:refNode:](self, "performDOMOperation:newNode:refNode:", 1, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "childrenUpdatedWithUpdatedChildNodes:notify:", 0, 1);
    -[IKDOMNode childrenUpdatedWithUpdatedChildNodes:notify:](self, "childrenUpdatedWithUpdatedChildNodes:notify:", v11, 1);
    objc_msgSend(v11, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)replaceChild:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[IKDOMNode _validateDOMOperation:newNode:refNode:](self, "_validateDOMOperation:newNode:refNode:", 2, v6, v7))
  {
    if (objc_msgSend(v6, "nodeType") == 11)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v6, "parentNode");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v8;
    -[IKDOMNode performDOMOperation:newNode:refNode:](self, "performDOMOperation:newNode:refNode:", 2, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "childrenUpdatedWithUpdatedChildNodes:notify:", 0, 1);
    -[IKDOMNode childrenUpdatedWithUpdatedChildNodes:notify:](self, "childrenUpdatedWithUpdatedChildNodes:notify:", v11, 1);
    v9 = v7;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)removeChild:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = 0;
  if (-[IKDOMNode _validateDOMOperation:newNode:refNode:](self, "_validateDOMOperation:newNode:refNode:", 2, 0, v4))
  {
    v6 = -[IKDOMNode performDOMOperation:newNode:refNode:](self, "performDOMOperation:newNode:refNode:", 2, 0, v4);
    -[IKDOMNode childrenUpdatedWithUpdatedChildNodes:notify:](self, "childrenUpdatedWithUpdatedChildNodes:notify:", 0, 1);
    v5 = v4;
  }

  return v5;
}

- (id)appendChild:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = 0;
  if (-[IKDOMNode _validateDOMOperation:newNode:refNode:](self, "_validateDOMOperation:newNode:refNode:", 0, v4, 0))
  {
    if (objc_msgSend(v4, "nodeType") == 11)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(v4, "parentNode");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    -[IKDOMNode performDOMOperation:newNode:refNode:](self, "performDOMOperation:newNode:refNode:", 1, v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "childrenUpdatedWithUpdatedChildNodes:notify:", 0, 1);
    -[IKDOMNode childrenUpdatedWithUpdatedChildNodes:notify:](self, "childrenUpdatedWithUpdatedChildNodes:notify:", v8, 1);
    objc_msgSend(v8, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)hasChildNodes
{
  _xmlNode *v2;

  v2 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v2)
    LOBYTE(v2) = v2->children != 0;
  return (char)v2;
}

- (id)cloneNode:(BOOL)a3
{
  _BOOL4 v3;
  _xmlNode *v5;
  _xmlNode *v6;
  xmlNode *v7;
  xmlNode *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v5 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v5 && (v6 = v5, (v7 = xmlCopyNode(v5, v3)) != 0))
  {
    v8 = v7;
    xmlSetTreeDoc(v7, v6->doc);
    v9 = (void *)objc_opt_class();
    -[IKJSObject appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nodeWithAppContext:nodePtr:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (BOOL)isSameNode:(id)a3
{
  IKDOMNode *v4;
  _xmlNode *v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;

  v4 = (IKDOMNode *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[IKDOMNode nodePtr](self, "nodePtr");
      v6 = -[IKDOMNode nodePtr](v4, "nodePtr");
      if (v5)
        v7 = v5 == (_xmlNode *)v6;
      else
        v7 = 0;
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)getFeature:(id)a3 :(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CBE108];
  -[IKJSObject appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueWithObject:inContext:", self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "toObjectOfClass:", objc_opt_class());
  v11 = (objc_class *)objc_claimAutoreleasedReturnValue();

  -[IKDOMNode jsNodeData](self, "jsNodeData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11)
  {
    objc_msgSend(v12, "featureForName:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      -[IKDOMNode nodeName](self, "nodeName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = +[IKViewElementFactory elementClassByTagName:](IKViewElementFactory, "elementClassByTagName:", v14);
      if (!v11)
        goto LABEL_4;
      -[IKDOMNode nodeName](self, "nodeName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class supportedFeaturesForElementName:](v11, "supportedFeaturesForElementName:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", v5);

      if (!v18
        || (+[IKDOMFeatureFactory featureForName:withDOMNode:](IKDOMFeatureFactory, "featureForName:withDOMNode:", v5, self), (v19 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v11 = 0;
        goto LABEL_4;
      }
      v20 = (void *)v19;
      objc_msgSend(v13, "setFeature:forName:", v19, v5);

      v14 = v20;
    }
    objc_msgSend((id)objc_opt_class(), "makeFeatureJSObjectForFeature:", v14);
    v11 = (objc_class *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v5);
LABEL_4:

  }
  return v11;
}

- (void)adoptFeatureWithName:(id)a3 fromDOMNode:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = (void *)MEMORY[0x1E0CBE108];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueWithObject:inContext:", v7, v10);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "jsNodeData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CBE108];
  -[IKJSObject appContext](self, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "jsContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueWithObject:inContext:", self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKDOMNode jsNodeData](self, "jsNodeData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v8);

  objc_msgSend(v11, "featureForName:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFeature:forName:", v18, v8);

}

- (BOOL)contains:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[IKDOMNode childNodesAsArray](self, "childNodesAsArray", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * i) == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (JSValue)dataItem
{
  return -[JSManagedValue value](self->_managedDataItem, "value");
}

- (void)setDataItem:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "isNull") & 1) != 0 || objc_msgSend(v8, "isUndefined"))
  {

LABEL_4:
    v8 = 0;
    v4 = 0;
    v5 = 1;
    goto LABEL_5;
  }
  if (!v8)
    goto LABEL_4;
  if (!objc_msgSend(v8, "ikdt_isObject") || objc_msgSend(v8, "ikdt_isArray"))
  {
    -[IKJSObject appContext](self, "appContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setException:withErrorMessage:", 0, CFSTR("data item must be an non-array object"));

  }
  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:andOwner:", v8, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
LABEL_5:
  objc_storeStrong((id *)&self->_managedDataItem, v4);
  if ((v5 & 1) == 0)

  -[IKDOMNode jsNodeData](self, "jsNodeData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataResolved:", 0);

  -[IKDOMNode updatedAndMark:notify:](self, "updatedAndMark:notify:", 1, 0);
}

- (void)addEventListener:(id)a3 :(id)a4 :(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _IKDOMNodeEventListener *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a5;
  v16 = a3;
  v8 = a4;
  v9 = objc_msgSend(v16, "length");
  if (v8 && v9)
  {
    objc_msgSend((id)objc_opt_class(), "_eventListenerMapKeyForType:useCapture:", v16, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[IKDOMNode _searchEventListener:key:destroy:](self, "_searchEventListener:key:destroy:", v8, v10, 0))
    {
      -[IKDOMNode eventListenersMap](self, "eventListenersMap");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKDOMNode setEventListenersMap:](self, "setEventListenersMap:", v11);
      }
      objc_msgSend(v11, "objectForKey:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v12, v10);
      }
      v13 = -[_IKDOMNodeEventListener initWithListener:forNode:]([_IKDOMNodeEventListener alloc], "initWithListener:forNode:", v8, self);
      objc_msgSend(v12, "addObject:", v13);
      -[IKJSObject appContext](self, "appContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "webInspectorController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "didAddEventListenerForDOMNode:", self);

    }
  }

}

- (void)removeEventListener:(id)a3 :(id)a4 :(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v13 = a3;
  v8 = a4;
  v9 = objc_msgSend(v13, "length");
  if (v8 && v9)
  {
    -[IKJSObject appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "webInspectorController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "willRemoveEventListenerForDOMNode:", self);

    objc_msgSend((id)objc_opt_class(), "_eventListenerMapKeyForType:useCapture:", v13, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDOMNode _searchEventListener:key:destroy:](self, "_searchEventListener:key:destroy:", v8, v12, 1);

  }
}

- (BOOL)dispatchEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_msgSend(v4, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(v4, "setTarget:", self);
  +[IKDOMEventDispatcher sharedInstance](IKDOMEventDispatcher, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "dispatchEvent:", v4);

  return v7;
}

+ (id)ITMLIDStringforITMLID:(unint64_t)a3
{
  return (id)objc_msgSend(CFSTR("id_"), "stringByAppendingFormat:", CFSTR("%lu"), a3);
}

+ (int64_t)ITMLIDForITMLIDString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = ITMLIDForITMLIDString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&ITMLIDForITMLIDString__onceToken, &__block_literal_global_128);
  v5 = (void *)ITMLIDForITMLIDString__numberFormatter;
  objc_msgSend(v4, "substringFromIndex:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "numberFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

uint64_t __35__IKDOMNode_ITMLIDForITMLIDString___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)ITMLIDForITMLIDString__numberFormatter;
  ITMLIDForITMLIDString__numberFormatter = (uint64_t)v0;

  return objc_msgSend((id)ITMLIDForITMLIDString__numberFormatter, "setNumberStyle:", 1);
}

+ (void)handleNodeParentDidChange:(_xmlNode *)a3
{
  void *v3;
  id v4;

  +[IKDOMNode nodeForNodePtr:](IKDOMNode, "nodeForNodePtr:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "_linkManagedObjects");
    v3 = v4;
  }

}

- (_xmlNode)nodePtr
{
  return self->_nodePtr;
}

- (void)enumerateEventListenersUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[IKDOMNode eventListenersMap](self, "eventListenersMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__IKDOMNode_enumerateEventListenersUsingBlock___block_invoke;
  v9[3] = &unk_1E9F4F5C8;
  v10 = v6;
  v11 = v4;
  v7 = v4;
  v8 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __47__IKDOMNode_enumerateEventListenersUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  int v7;
  char v8;
  const __CFString *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  char v18;

  v6 = a2;
  v7 = objc_msgSend(v6, "hasSuffix:", CFSTR("_capture"));
  v8 = v7;
  if (v7)
    v9 = CFSTR("_capture");
  else
    v9 = CFSTR("_targetAndBubble");
  objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "rangeOfString:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__IKDOMNode_enumerateEventListenersUsingBlock___block_invoke_2;
  v14[3] = &unk_1E9F4F5A0;
  v11 = *(id *)(a1 + 40);
  v15 = v10;
  v16 = v11;
  v18 = v8;
  v17 = a4;
  v12 = v10;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

}

uint64_t __47__IKDOMNode_enumerateEventListenersUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*a4)
    **(_BYTE **)(a1 + 48) = 1;
  return result;
}

- (void)enumerateEventListernersForType:(id)a3 xmlAttribute:(id)a4 phase:(int64_t)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _IKDOMNodeEventListener *, _BYTE *);
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _IKDOMNodeEventListener *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  void (**v26)(id, _IKDOMNodeEventListener *, _BYTE *);
  _QWORD v27[5];
  id v28;
  char v29;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _IKDOMNodeEventListener *, _BYTE *))a6;
  v29 = 0;
  v13 = MEMORY[0x1E0C809B0];
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) != 2)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IKDOMNode getAttribute:](self, "getAttribute:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(v14, "length"))
  {
    v15 = (void *)MEMORY[0x1E0CBE108];
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __75__IKDOMNode_enumerateEventListernersForType_xmlAttribute_phase_usingBlock___block_invoke;
    v27[3] = &unk_1E9F4F5F0;
    v27[4] = self;
    v28 = v14;
    v16 = (void *)MEMORY[0x1DF092410](v27);
    -[IKJSObject appContext](self, "appContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "jsContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueWithObject:inContext:", v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = -[_IKDOMNodeEventListener initWithListener:forNode:]([_IKDOMNodeEventListener alloc], "initWithListener:forNode:", v19, 0);
    v12[2](v12, v20, &v29);

    v13 = MEMORY[0x1E0C809B0];
  }

  if (!v29)
  {
LABEL_8:
    objc_msgSend((id)objc_opt_class(), "_eventListenerMapKeyForType:useCapture:", v10, a5 == 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDOMNode eventListenersMap](self, "eventListenersMap");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");

    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __75__IKDOMNode_enumerateEventListernersForType_xmlAttribute_phase_usingBlock___block_invoke_2;
    v25[3] = &unk_1E9F4F618;
    v26 = v12;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v25);

  }
}

void __75__IKDOMNode_enumerateEventListernersForType_xmlAttribute_phase_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CBE0F0];
  v4 = a2;
  objc_msgSend(v3, "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", *(_QWORD *)(a1 + 32), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Function"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 40);
  v14[0] = CFSTR("event");
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constructWithArguments:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = v6;
  v13[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v10, "invokeMethod:withArguments:", CFSTR("call"), v11);
}

uint64_t __75__IKDOMNode_enumerateEventListernersForType_xmlAttribute_phase_usingBlock___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)updatedAndMark:(BOOL)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  IKDOMNode *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v5 = a3;
  if (a4)
    -[IKDOMNode _notifyUpdatesToDOMObservers](self, "_notifyUpdatesToDOMObservers");
  v7 = self;
  -[IKDOMNode parentNode](v7, "parentNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v7;
  if (v8)
  {
    v11 = v7;
    do
    {
      v9 = v11;
      objc_msgSend(v11, "parentNode");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v4)
        objc_msgSend(v11, "_notifyUpdatesToDOMObservers");
      objc_msgSend(v11, "parentNode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v10);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[IKDOMNode _updatedAndMark:withDocument:](v7, "_updatedAndMark:withDocument:", v5, v11);

}

- (void)childrenUpdatedWithUpdatedChildNodes:(id)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  IKDOMNode *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  if (v4)
  {
    objc_msgSend(v11, "makeObjectsPerformSelector:", sel__notifyUpdatesToDOMObservers);
    -[IKDOMNode _notifyUpdatesToDOMObservers](self, "_notifyUpdatesToDOMObservers");
  }
  v6 = self;
  -[IKDOMNode parentNode](v6, "parentNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6;
  if (v7)
  {
    v8 = v6;
    do
    {
      v9 = v8;
      objc_msgSend(v8, "parentNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
        objc_msgSend(v8, "_notifyUpdatesToDOMObservers");
      objc_msgSend(v8, "parentNode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (v10);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[IKDOMNode _childrenUpdatedWithUpdatedChildNodes:withDocument:](v6, "_childrenUpdatedWithUpdatedChildNodes:withDocument:", v11, v8);

}

- (BOOL)clearUpdates
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[IKDOMNode jsNodeData](self, "jsNodeData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsUpdates");
  if (v4)
  {
    objc_msgSend(v3, "setUpdated:", 0);
    objc_msgSend(v3, "setSubtreeUpdated:", 0);
    objc_msgSend(v3, "setChildrenUpdated:", 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[IKDOMNode childNodesAsArray](self, "childNodesAsArray", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "clearUpdates");
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  return v4;
}

- (id)performDOMOperation:(unint64_t)a3 newNode:(id)a4 refNode:(id)a5
{
  id v8;
  id v9;
  void *v10;
  xmlNode *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _xmlNode *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _xmlNode *i;
  void *v20;
  void *v21;
  uint64_t v22;
  _xmlNode *v23;
  _xmlNode *v24;
  void *v25;
  void *v26;
  void *v27;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (xmlNode *)objc_msgSend(v9, "nodePtr");
  v12 = objc_msgSend(v8, "nodePtr");
  v13 = v12;
  if (a3 == 2 && !v8)
  {
    xmlUnlinkNode(v11);
    +[IKDOMNode handleNodeParentDidChange:](IKDOMNode, "handleNodeParentDidChange:", v11);
    goto LABEL_18;
  }
  v14 = *(_DWORD *)(v12 + 8);
  if (a3 <= 1 && !v11)
  {
    if (v14 == 11)
    {
      if (*(_QWORD *)(v12 + 24))
      {
        do
        {
          v15 = -[IKDOMNode _appendNode:](self, "_appendNode:");
          -[IKJSObject appContext](self, "appContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v16, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

        }
        while (*(_QWORD *)(v13 + 24));
      }
      goto LABEL_18;
    }
    v23 = -[IKDOMNode _appendNode:](self, "_appendNode:", v12);
LABEL_17:
    v24 = v23;
    -[IKJSObject appContext](self, "appContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v25, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v26);

    goto LABEL_18;
  }
  if (v14 != 11)
  {
    v23 = -[IKDOMNode _insertNode:refNode:operation:](self, "_insertNode:refNode:operation:", v12, v11, a3);
    goto LABEL_17;
  }
  v18 = *(_QWORD *)(v12 + 24);
  if (v18)
  {
    for (i = -[IKDOMNode _insertNode:refNode:operation:](self, "_insertNode:refNode:operation:", v18, v11, a3);
          ;
          i = -[IKDOMNode _insertNode:refNode:operation:](self, "_insertNode:refNode:operation:", v22, i, 0))
    {
      -[IKJSObject appContext](self, "appContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v20, i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v21);

      v22 = *(_QWORD *)(v13 + 24);
      if (!v22)
        break;
    }
  }
LABEL_18:
  v27 = (void *)objc_msgSend(v10, "copy");

  return v27;
}

- (void)addDOMObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[IKDOMNode domObservers](self, "domObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDOMNode setDomObservers:](self, "setDomObservers:", v6);

  }
  -[IKDOMNode domObservers](self, "domObservers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)removeDOMObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[IKDOMNode domObservers](self, "domObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[IKDOMNode domObservers](self, "domObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    -[IKDOMNode setDomObservers:](self, "setDomObservers:", 0);
}

- (id)nodesForXPath:(id)a3 error:(id *)a4
{
  id v6;
  _xmlNode *v7;
  xmlNode *v8;
  xmlDoc *doc;
  xmlXPathContextPtr v10;
  xmlXPathContext *v11;
  void *v12;
  xmlXPathObjectPtr v13;
  xmlNodeSetPtr nodesetval;
  int nodeNr;
  uint64_t v16;
  xmlNodePtr v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  xmlXPathObject *v23;
  void *v24;

  v6 = a3;
  v7 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v7 && (v8 = v7, (doc = v7->doc) != 0) && (v10 = xmlXPathNewContext(doc)) != 0)
  {
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->userData = v12;
    v11->error = (xmlStructuredErrorFunc)IKXPathErrorCallback;
    v11->node = v8;
    v13 = xmlXPathEval((const xmlChar *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), v11);
    if (v13)
    {
      nodesetval = v13->nodesetval;
      if (nodesetval)
      {
        v23 = v13;
        v24 = v12;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        a4 = (id *)objc_claimAutoreleasedReturnValue();
        nodeNr = nodesetval->nodeNr;
        if (nodesetval->nodeNr >= 1)
        {
          v16 = 0;
          do
          {
            v17 = nodesetval->nodeTab[v16];
            if (v17)
            {
              -[IKJSObject appContext](self, "appContext");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v18, v17);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
                objc_msgSend(a4, "addObject:", v19);

              nodeNr = nodesetval->nodeNr;
            }
            ++v16;
          }
          while (v16 < nodeNr);
        }
        if (!objc_msgSend(a4, "count"))
        {

          a4 = 0;
        }
        v13 = v23;
        v12 = v24;
      }
      else
      {
        a4 = 0;
      }
      xmlXPathFreeObject(v13);
    }
    else if (a4)
    {
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v20, *MEMORY[0x1E0CB2D50], 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 202, v21);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
    xmlXPathFreeContext(v11);

  }
  else
  {
    a4 = 0;
  }

  return a4;
}

- (id)toStringWithError:(id *)a3
{
  _xmlNode *v4;
  xmlBufferPtr v5;
  xmlBuffer *v6;
  xmlNode *v7;
  void *v8;
  id v9;
  const xmlChar *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (!v4)
    return v4;
  v5 = xmlBufferCreate();
  if (v5)
  {
    v6 = v5;
    v7 = xmlCopyNode(v4, 1);
    v12[0] = CFSTR("itmlID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _SantizedAttributesFromXmlNode(v7, v8);

    if (xmlNodeDump(v6, v4->doc, v7, 0, 1) < 1)
    {
      v4 = 0;
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      v10 = xmlBufferContent(v6);
      v4 = (_xmlNode *)objc_msgSend(v9, "initWithBytes:length:encoding:", v10, xmlBufferLength(v6), 4);
    }
    xmlBufferFree(v6);
    xmlFreeNode(v7);
    return v4;
  }
  if (a3)
    *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 204, 0);
  return 0;
}

- (id)children
{
  IKDOMHTMLCollection *v3;
  void *v4;
  IKDOMHTMLCollection *v5;

  v3 = [IKDOMHTMLCollection alloc];
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IKDOMHTMLCollection initWithAppContext:node:](v3, "initWithAppContext:node:", v4, self);

  return v5;
}

- (id)firstElementChild
{
  _xmlNode *v3;
  _xmlNode *i;
  void *v5;
  void *v6;

  v3 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v3)
  {
    for (i = v3->children; i; i = i->next)
    {
      if (i->type == XML_ELEMENT_NODE)
        break;
    }
  }
  else
  {
    i = 0;
  }
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v5, i);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)lastElementChild
{
  _xmlNode *v3;
  _xmlNode *i;
  void *v5;
  void *v6;

  v3 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v3)
  {
    for (i = v3->last; i; i = i->prev)
    {
      if (i->type == XML_ELEMENT_NODE)
        break;
    }
  }
  else
  {
    i = 0;
  }
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v5, i);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)childElementCount
{
  unint64_t result;
  uint64_t v3;

  result = -[IKDOMNode nodePtr](self, "nodePtr");
  if (result)
  {
    v3 = *(_QWORD *)(result + 24);
    if (v3)
    {
      result = 0;
      do
      {
        if (*(_DWORD *)(v3 + 8) == 1)
          ++result;
        v3 = *(_QWORD *)(v3 + 48);
      }
      while (v3);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (id)_eventListenerMapKeyForType:(id)a3 useCapture:(BOOL)a4
{
  const __CFString *v5;

  if (a4)
    v5 = CFSTR("_capture");
  else
    v5 = CFSTR("_targetAndBubble");
  return (id)objc_msgSend(a3, "stringByAppendingString:", v5);
}

- (BOOL)_searchEventListener:(id)a3 key:(id)a4 destroy:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, _BYTE *);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0x7FFFFFFFFFFFFFFFLL;
  -[IKDOMNode eventListenersMap](self, "eventListenersMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __46__IKDOMNode__searchEventListener_key_destroy___block_invoke;
  v20 = &unk_1E9F4F640;
  v12 = v8;
  v21 = v12;
  v22 = &v23;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v17);
  v13 = v24[3];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    objc_msgSend(v11, "removeObjectAtIndex:", v17, v18, v19, v20);
    v13 = v24[3];
  }
  v15 = v13 != 0x7FFFFFFFFFFFFFFFLL;

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __46__IKDOMNode__searchEventListener_key_destroy___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;

  objc_msgSend(a2, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)_linkManagedObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsContext");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "virtualMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDOMNode parentNode](self, "parentNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IKDOMNode managedSelf](self, "managedSelf");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addManagedReference:withOwner:", v6, v5);

    objc_msgSend(v5, "managedSelf");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addManagedReference:withOwner:", v7, self);

    -[IKDOMNode managedParent](self, "managedParent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[IKDOMNode managedSelf](self, "managedSelf");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKDOMNode managedParent](self, "managedParent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeManagedReference:withOwner:", v9, v11);

      -[IKDOMNode managedParent](self, "managedParent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeManagedReference:withOwner:", v12, self);

    }
    objc_msgSend(v5, "managedSelf");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDOMNode setManagedParent:](self, "setManagedParent:", v13);

    -[IKDOMNode managedOwnerDocument](self, "managedOwnerDocument");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[IKDOMNode managedOwnerDocument](self, "managedOwnerDocument");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeManagedReference:withOwner:", v15, self);

      -[IKDOMNode setManagedOwnerDocument:](self, "setManagedOwnerDocument:", 0);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[IKDOMNode managedOwnerDocument](self, "managedOwnerDocument");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[IKDOMNode managedOwnerDocument](self, "managedOwnerDocument");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "removeManagedReference:withOwner:", v17, self);

      }
      -[IKDOMNode ownerDocument](self, "ownerDocument");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKDOMNode setManagedOwnerDocument:](self, "setManagedOwnerDocument:", v18);

      -[IKDOMNode managedOwnerDocument](self, "managedOwnerDocument");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addManagedReference:withOwner:", v19, self);

      -[IKDOMNode managedParent](self, "managedParent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[IKDOMNode managedSelf](self, "managedSelf");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKDOMNode managedParent](self, "managedParent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "removeManagedReference:withOwner:", v21, v23);

        -[IKDOMNode managedParent](self, "managedParent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "removeManagedReference:withOwner:", v24, self);

      }
      -[IKDOMNode setManagedParent:](self, "setManagedParent:", 0);
    }
  }

}

- (BOOL)_validateDOMOperation:(unint64_t)a3 newNode:(id)a4 refNode:(id)a5
{
  id v8;
  id v9;
  _xmlNode *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;

  v8 = a5;
  v9 = a4;
  v10 = -[IKDOMNode nodePtr](self, "nodePtr");
  v11 = objc_msgSend(v8, "nodePtr");

  v12 = objc_msgSend(v9, "nodePtr");
  if (a3 == 2 && !v9)
  {
    if (v11 && v10)
    {
      if (*(_xmlNode **)(v11 + 40) != v10)
      {
        v13 = CFSTR("Node to be removed is not one of the children.");
LABEL_20:
        v22 = 8;
        goto LABEL_26;
      }
      goto LABEL_31;
    }
    ITMLKitGetLogObject(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    goto LABEL_24;
  }
  if (a3 > 1 || v11)
  {
    if (v11 && v12 && v10)
    {
      if (*(_xmlNode **)(v11 + 40) != v10)
      {
        v13 = CFSTR("Reference node is not one of the children.");
        goto LABEL_20;
      }
      if (*(_xmlDoc **)(v12 + 64) == v10->doc)
      {
LABEL_31:
        LOBYTE(v23) = 1;
        return v23;
      }
      v13 = CFSTR("Node to be added doesn't belong to the same document.");
      goto LABEL_30;
    }
    ITMLKitGetLogObject(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
LABEL_24:
      -[IKDOMNode _validateDOMOperation:newNode:refNode:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_25:

    v13 = 0;
    v22 = 0;
    goto LABEL_26;
  }
  if (!v12 || !v10)
  {
    ITMLKitGetLogObject(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    goto LABEL_25;
  }
  if (*(_xmlDoc **)(v12 + 64) == v10->doc)
    goto LABEL_31;
  v13 = CFSTR("Node to be appended doesn't belong to the same document.");
LABEL_30:
  v22 = 4;
LABEL_26:
  v23 = -[__CFString length](v13, "length");
  if (v23)
  {
    -[IKJSObject appContext](self, "appContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMException exceptionWithAppContext:code:](IKDOMException, "exceptionWithAppContext:code:", v25, v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setException:withErrorMessage:", v26, v13);

    LOBYTE(v23) = 0;
  }
  return v23;
}

- (_xmlNode)_insertNode:(_xmlNode *)a3 refNode:(_xmlNode *)a4 operation:(unint64_t)a5
{
  _xmlNode *v6;
  _xmlNode *parent;
  xmlNode *v8;
  xmlNodePtr Sibling;

  v6 = a3;
  parent = a3->parent;
  if (a5 != 2)
  {
    if (parent)
      xmlUnlinkNode(a3);
    if (a5 == 1)
    {
      Sibling = xmlAddPrevSibling(a4, v6);
    }
    else
    {
      if (a5)
        goto LABEL_12;
      Sibling = xmlAddNextSibling(a4, v6);
    }
    v6 = Sibling;
    goto LABEL_12;
  }
  if (parent)
    xmlUnlinkNode(a3);
  v8 = xmlReplaceNode(a4, v6);
  xmlUnlinkNode(v8);
  +[IKDOMNode handleNodeParentDidChange:](IKDOMNode, "handleNodeParentDidChange:", v8);
LABEL_12:
  +[IKDOMNode handleNodeParentDidChange:](IKDOMNode, "handleNodeParentDidChange:", v6);
  return v6;
}

- (_xmlNode)_appendNode:(_xmlNode *)a3
{
  _xmlNode *v5;

  xmlUnlinkNode(a3);
  v5 = xmlAddChild(-[IKDOMNode nodePtr](self, "nodePtr"), a3);
  +[IKDOMNode handleNodeParentDidChange:](IKDOMNode, "handleNodeParentDidChange:", v5);
  return v5;
}

- (void)_notifyUpdatesToDOMObservers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[IKDOMNode domObservers](self, "domObservers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "domDidUpdateForContextNode:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updatedAndMark:(BOOL)a3 withDocument:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(a4, "markUpdated"))
  {
    -[IKDOMNode jsNodeData](self, "jsNodeData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
      objc_msgSend(v6, "setUpdated:", 1);
    else
      objc_msgSend(v6, "setSubtreeUpdated:", 1);

    -[IKDOMNode _markSubtreeUpdatesForAncestorsOfNode:](self, "_markSubtreeUpdatesForAncestorsOfNode:", self);
  }
}

- (void)_childrenUpdatedWithUpdatedChildNodes:(id)a3 withDocument:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(a4, "markUpdated"))
  {
    -[IKDOMNode jsNodeData](self, "jsNodeData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setChildrenUpdated:", 1);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "jsNodeData", (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setUpdated:", 1);
          objc_msgSend(v13, "setDataResolved:", 0);
          objc_msgSend(v13, "setPrototypesResolved:", 0);
          objc_msgSend(v13, "setRulesParsed:", 0);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    -[IKDOMNode _markSubtreeUpdatesForAncestorsOfNode:](self, "_markSubtreeUpdatesForAncestorsOfNode:", self);
  }

}

- (void)_markSubtreeUpdatesForAncestorsOfNode:(id)a3
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;

  -[IKDOMNode parentNode](self, "parentNode", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    do
    {
      objc_msgSend(v3, "jsNodeData");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSubtreeUpdated:", 1);

      objc_msgSend(v3, "parentNode");
      v7 = objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v6 = (void *)v7;
      v3 = (void *)v7;
    }
    while ((isKindOfClass & 1) != 0);
  }
  else
  {
    v6 = v3;
  }

}

- (BOOL)_enumerateNodesWithBlock:(id)a3
{
  uint64_t (**v4)(id, IKDOMNode *);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, IKDOMNode *))a3;
  if ((v4[2](v4, self) & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[IKDOMNode childNodesAsArray](self, "childNodesAsArray", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_enumerateNodesWithBlock:", v4) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v5;
}

- (IKDOMDocument)managedOwnerDocument
{
  return self->_managedOwnerDocument;
}

- (void)setManagedOwnerDocument:(id)a3
{
  objc_storeStrong((id *)&self->_managedOwnerDocument, a3);
}

- (JSManagedValue)managedParent
{
  return self->_managedParent;
}

- (void)setManagedParent:(id)a3
{
  objc_storeStrong((id *)&self->_managedParent, a3);
}

- (JSManagedValue)managedChildNodeList
{
  return self->_managedChildNodeList;
}

- (void)setManagedChildNodeList:(id)a3
{
  objc_storeStrong((id *)&self->_managedChildNodeList, a3);
}

- (NSMutableDictionary)eventListenersMap
{
  return self->_eventListenersMap;
}

- (void)setEventListenersMap:(id)a3
{
  objc_storeStrong((id *)&self->_eventListenersMap, a3);
}

- (NSHashTable)domObservers
{
  return self->_domObservers;
}

- (void)setDomObservers:(id)a3
{
  objc_storeStrong((id *)&self->_domObservers, a3);
}

- (int64_t)ITMLID
{
  return self->_ITMLID;
}

- (void)setITMLID:(int64_t)a3
{
  self->_ITMLID = a3;
}

- (IKDOMNodeData)jsNodeData
{
  return self->_jsNodeData;
}

- (JSManagedValue)managedSelf
{
  return self->_managedSelf;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_managedSelf, 0);
  objc_storeStrong((id *)&self->_jsNodeData, 0);
  objc_storeStrong((id *)&self->_domObservers, 0);
  objc_storeStrong((id *)&self->_eventListenersMap, 0);
  objc_storeStrong((id *)&self->_managedChildNodeList, 0);
  objc_storeStrong((id *)&self->_managedParent, 0);
  objc_storeStrong((id *)&self->_managedOwnerDocument, 0);
  objc_storeStrong((id *)&self->_managedDataItem, 0);
}

- (void)_validateDOMOperation:(uint64_t)a3 newNode:(uint64_t)a4 refNode:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1D95F2000, a1, a3, "Invalid arguments to adopt node", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

@end
