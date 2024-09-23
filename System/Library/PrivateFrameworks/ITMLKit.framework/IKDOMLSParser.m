@implementation IKDOMLSParser

- (id)parse:(id)a3
{
  id v4;
  void *v5;
  IKDOMDocument *v6;
  IKDOMDocument *v7;
  void *v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "stringData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    v7 = [IKDOMDocument alloc];
    -[IKJSObject appContext](self, "appContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v6 = -[IKDOMDocument initWithAppContext:input:error:](v7, "initWithAppContext:input:error:", v8, v4, &v15);
    v9 = v15;

    if (v9)
    {
      objc_msgSend(v9, "description");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_8;
  }
  objc_msgSend(v4, "byteStream");
  v6 = (IKDOMDocument *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_4;
  v10 = CFSTR("Input not specified");
LABEL_8:
  if (-[__CFString length](v10, "length"))
  {
    -[IKJSObject appContext](self, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMLSException exceptionWithAppContext:code:](IKDOMLSException, "exceptionWithAppContext:code:", v12, 81);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setException:withErrorMessage:", v13, v10);

  }
  return v6;
}

- (id)parseWithContext:(id)a3 :(id)a4 :(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  int isKindOfClass;
  char v12;
  char v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  xmlDoc *v26;
  xmlNode *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  xmlNode *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  xmlNodePtr i;
  xmlNode *v47;
  void *v48;
  void *v49;
  int64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  id v61;
  uint64_t v62;
  id v63;
  xmlDoc *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  xmlNodePtr lst;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "parentNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();
  if (!v9)
    goto LABEL_10;
  v13 = v12;
  if (!objc_msgSend(v9, "nodePtr"))
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = a5 != 2;
  }
  else
  {
    objc_opt_class();
    v42 = objc_opt_isKindOfClass();
    v14 = a5 != 2;
    if ((v42 & 1) == 0)
    {
LABEL_10:
      -[IKJSObject appContext](self, "appContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IKJSObject appContext](self, "appContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKDOMException exceptionWithAppContext:code:](IKDOMException, "exceptionWithAppContext:code:", v16, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "nodeName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Invalid action: %ld on node: %@"), a5, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setException:withErrorMessage:", v17, v20);

      v21 = 0;
      goto LABEL_11;
    }
  }
  if ((v14 & isKindOfClass & 1) != 0 || (unint64_t)(a5 - 3) <= 0xFFFFFFFFFFFFFFFDLL && v13 & 1 | (v10 == 0))
    goto LABEL_10;
  objc_msgSend((id)objc_opt_class(), "_dataFromInput:", v8);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    objc_msgSend(v9, "ownerDocument");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (xmlDoc *)objc_msgSend(v25, "nodePtr");
    lst = 0;
    v27 = xmlNewDocNode(v26, 0, (const xmlChar *)"fake", 0);
    xmlSetGenericErrorFunc((void *)*MEMORY[0x1E0C80C10], MEMORY[0x1E0C83478]);
    v28 = objc_retainAutorelease(v24);
    if (xmlParseInNodeContext(v27, (const char *)objc_msgSend(v28, "bytes"), objc_msgSend(v28, "length"), 4096, &lst) == XML_ERR_INVALID_CHAR)
    {
      objc_msgSend(v8, "stringData");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v8, "stringData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "ik_stringByTrimmingControlChars");
        v64 = v26;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "dataUsingEncoding:", 4);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v28;
        v34 = v27;
        v35 = v25;
        v36 = (void *)v32;

        v26 = v64;
        v37 = v36;
        v25 = v35;
        v27 = v34;
        v28 = objc_retainAutorelease(v37);
        xmlParseInNodeContext(v27, (const char *)objc_msgSend(v28, "bytes"), objc_msgSend(v28, "length"), 4096, &lst);
      }
    }
    xmlSetGenericErrorFunc(0, 0);
    if (xmlGetLastError())
    {
      -[IKJSObject appContext](self, "appContext");
      v38 = objc_claimAutoreleasedReturnValue();
      -[IKJSObject appContext](self, "appContext");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)v38;
      +[IKDOMLSException exceptionWithAppContext:code:](IKDOMLSException, "exceptionWithAppContext:code:", v39, 81);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setException:withErrorMessage:", v41, CFSTR("XML parse failure"));
      v21 = 0;
    }
    else
    {
      v63 = v28;
      v65 = v25;
      for (i = xmlNewDocFragment(v26); ; xmlAddChild(i, v47))
      {
        v47 = lst;
        if (!lst)
          break;
        lst = lst->next;
        xmlUnlinkNode(v47);
      }
      IKXMLStripSpaces((uint64_t)i);
      -[IKJSObject appContext](self, "appContext");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v48, i);
      v62 = objc_claimAutoreleasedReturnValue();

      if (i->children)
      {
        -[IKJSObject appContext](self, "appContext");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v49, i->children);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = 0;
      }
      v50 = a5 - 1;
      if ((unint64_t)(a5 - 1) >= 2)
        v51 = v10;
      else
        v51 = v9;
      v52 = v51;
      v39 = v52;
      v25 = v65;
      switch(v50)
      {
        case 0:
          v53 = 0;
          v40 = (void *)v62;
          v54 = v62;
          v55 = 0;
          goto LABEL_45;
        case 1:
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          objc_msgSend(v52, "childNodesAsArray");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
          if (v57)
          {
            v58 = v57;
            v59 = *(_QWORD *)v67;
            do
            {
              for (j = 0; j != v58; ++j)
              {
                if (*(_QWORD *)v67 != v59)
                  objc_enumerationMutation(v56);
                v61 = (id)objc_msgSend(v39, "performDOMOperation:newNode:refNode:", 2, 0, *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j));
              }
              v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
            }
            while (v58);
          }

          v40 = (void *)v62;
          objc_msgSend(v39, "performDOMOperation:newNode:refNode:", 0, v62, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v63;
          v25 = v65;
          break;
        case 2:
          v53 = 1;
          goto LABEL_44;
        case 3:
          v53 = 0;
          goto LABEL_44;
        case 4:
          v53 = 2;
LABEL_44:
          v40 = (void *)v62;
          v54 = v62;
          v55 = v9;
LABEL_45:
          objc_msgSend(v52, "performDOMOperation:newNode:refNode:", v53, v54, v55);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
          v41 = 0;
          v40 = (void *)v62;
          break;
      }
      objc_msgSend(v39, "childrenUpdatedWithUpdatedChildNodes:notify:", v41, 1);
    }

    xmlSetTreeDoc(v27, 0);
    xmlFreeNode(v27);

  }
  else
  {
    -[IKJSObject appContext](self, "appContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMLSException exceptionWithAppContext:code:](IKDOMLSException, "exceptionWithAppContext:code:", v44, 81);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setException:withErrorMessage:", v45, CFSTR("Input not specified"));

    v21 = 0;
    v28 = 0;
  }

LABEL_11:
  return v21;
}

- (int64_t)appendAsChildrenAction
{
  return 1;
}

- (int64_t)replaceChildrenAction
{
  return 2;
}

- (int64_t)insertBeforeAction
{
  return 3;
}

- (int64_t)insertAfterAction
{
  return 4;
}

- (int64_t)replaceAction
{
  return 5;
}

+ (id)_dataFromInput:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "byteStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "byteStream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "stringData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "stringData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataUsingEncoding:", 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

@end
