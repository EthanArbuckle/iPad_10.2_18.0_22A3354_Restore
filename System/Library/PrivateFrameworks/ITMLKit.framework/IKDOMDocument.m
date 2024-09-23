@implementation IKDOMDocument

- (id)asPrivateIKJSDOMDocument
{
  IKDOMDocument *v3;

  if (-[IKDOMDocument conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01EB758))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (IKDOMDocument)initWithAppContext:(id)a3
{
  id v4;
  IKDOMDocument *v5;

  v4 = a3;
  v5 = -[IKDOMNode initWithAppContext:xmlNode:](self, "initWithAppContext:xmlNode:", v4, xmlNewDoc((const xmlChar *)"1.0"));

  return v5;
}

- (IKDOMDocument)initWithAppContext:(id)a3 xmlStr:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  IKDOMDocument *v11;
  IKDOMDocument *v12;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend((id)objc_opt_class(), "_documentWithXMLStr:lsInput:error:", v9, 0, a5);

  if (v10)
  {
    self = -[IKDOMNode initWithAppContext:xmlNode:](self, "initWithAppContext:xmlNode:", v8, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (IKDOMDocument)initWithAppContext:(id)a3 input:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  IKDOMDocument *v11;
  IKDOMDocument *v12;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend((id)objc_opt_class(), "_documentWithXMLStr:lsInput:error:", 0, v9, a5);

  if (v10)
  {
    self = -[IKDOMNode initWithAppContext:xmlNode:](self, "initWithAppContext:xmlNode:", v8, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (IKDOMDocument)initWithAppContext:(id)a3 qualifiedName:(id)a4
{
  id v6;
  id v7;
  xmlDoc *v8;
  IKDOMDocument *v9;
  void *v10;
  void *v11;
  xmlNode *v12;
  xmlNodePtr v13;
  objc_super v15;

  v6 = a4;
  v7 = a3;
  v8 = xmlNewDoc(0);
  v15.receiver = self;
  v15.super_class = (Class)IKDOMDocument;
  v9 = -[IKDOMNode initWithAppContext:xmlNode:](&v15, sel_initWithAppContext_xmlNode_, v7, v8);

  if (v9)
  {
    -[IKDOMDocument createElement:](v9, "createElement:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = (xmlNode *)objc_msgSend(v10, "nodePtr");
      v13 = xmlDocSetRootElement(v8, v12);
      if (v13)
        +[IKDOMNode handleNodeParentDidChange:](IKDOMNode, "handleNodeParentDidChange:", v13);
      +[IKDOMNode handleNodeParentDidChange:](IKDOMNode, "handleNodeParentDidChange:", v12);
    }

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (self->__requestLoader)
  {
    -[IKJSObject appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "webInspectorController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKDOMDocument _requestLoader](self, "_requestLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterLoaderWithIdentifier:", v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)IKDOMDocument;
  -[IKDOMNode dealloc](&v7, sel_dealloc);
}

- (void)setAppBridge:(id)a3
{
  IKDOMDocument *v3;
  IKJSDOMDocumentAppBridge **p_appBridge;
  id v5;
  $474D0CB196FAC0BCE7C3BD3052AF5647 *p_appBridgeFlags;

  v3 = self;
  p_appBridge = &self->_appBridge;
  v5 = a3;
  objc_storeWeak((id *)p_appBridge, v5);
  p_appBridgeFlags = &v3->_appBridgeFlags;
  v3->_appBridgeFlags.hasSetNeedsUpdate = objc_opt_respondsToSelector() & 1;
  v3->_appBridgeFlags.hasSnapshotImpressions = objc_opt_respondsToSelector() & 1;
  v3->_appBridgeFlags.hasRecordedImpressions = objc_opt_respondsToSelector() & 1;
  v3->_appBridgeFlags.hasRecordedImpressionsCallback = objc_opt_respondsToSelector() & 1;
  v3->_appBridgeFlags.hasRecordedImpressionsMatchingCallback = objc_opt_respondsToSelector() & 1;
  v3->_appBridgeFlags.hasImpressionsMatchingTag = objc_opt_respondsToSelector() & 1;
  v3->_appBridgeFlags.hasScrollToTop = objc_opt_respondsToSelector() & 1;
  LOBYTE(v3) = objc_opt_respondsToSelector();

  p_appBridgeFlags->hasRunTest = v3 & 1;
}

- (void)prepareForPresentationWithExtraInfo:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[IKDOMDocument isEmbeddedScriptExecuted](self, "isEmbeddedScriptExecuted"))
    -[IKDOMDocument _executeEmbeddedScriptWithExtraInfo:](self, "_executeEmbeddedScriptWithExtraInfo:", v4);

}

- (BOOL)markUpdated
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  -[IKDOMDocument appBridge](self, "appBridge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[IKDOMDocument appBridge](self, "appBridge");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1F01E7338) & 1) != 0)
    {
      -[IKDOMDocument appBridge](self, "appBridge");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "_isUpdateAllowed");

      if (!v6)
      {
        LOBYTE(v3) = 0;
        return (char)v3;
      }
    }
    else
    {

    }
    -[IKDOMNode jsNodeData](self, "jsNodeData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isUpdated");

    if ((v8 & 1) != 0)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      -[IKDOMNode jsNodeData](self, "jsNodeData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = 1;
      objc_msgSend(v9, "setUpdated:", 1);

      -[IKJSObject appContext](self, "appContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __28__IKDOMDocument_markUpdated__block_invoke;
      v12[3] = &unk_1E9F4C1C0;
      v12[4] = self;
      objc_msgSend(v10, "addPostEvaluateBlock:", v12);

    }
  }
  return (char)v3;
}

uint64_t __28__IKDOMDocument_markUpdated__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "appBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateForDocument:", *(_QWORD *)(a1 + 32));

  return objc_msgSend((id)objc_opt_class(), "_resetUpdatesForNode:", *(_QWORD *)(a1 + 32));
}

- (void)setNavigationDocument:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CBE108];
    v5 = a3;
    -[IKJSObject appContext](self, "appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "jsContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueWithObject:inContext:", v5, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[IKJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v8, CFSTR("navigationDocument"));

}

- (IKDOMImplementation)implementation
{
  IKDOMImplementation *v3;
  void *v4;
  IKDOMImplementation *v5;

  v3 = [IKDOMImplementation alloc];
  -[IKJSObject appContext](self, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IKJSObject initWithAppContext:](v3, "initWithAppContext:", v4);

  return v5;
}

- (IKDOMElement)documentElement
{
  _xmlNode *v3;
  xmlNodePtr RootElement;
  xmlNodePtr v5;
  void *v6;
  void *v7;

  v3 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v3 && (RootElement = xmlDocGetRootElement((const xmlDoc *)v3)) != 0)
  {
    v5 = RootElement;
    -[IKJSObject appContext](self, "appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (IKDOMElement *)v7;
}

- (NSString)inputEncoding
{
  return 0;
}

- (NSString)xmlEncoding
{
  return 0;
}

- (BOOL)xmlStandalone
{
  return 0;
}

- (NSString)xmlVersion
{
  return (NSString *)CFSTR("1.0");
}

- (BOOL)strictErrorChecking
{
  return 0;
}

- (id)createElement:(id)a3
{
  id v4;
  _xmlNode *v5;
  void *v6;
  xmlNodePtr v7;
  void *v8;

  v4 = a3;
  v5 = -[IKDOMNode nodePtr](self, "nodePtr");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 0;
    if (objc_msgSend(v4, "length") && v5)
    {
      v7 = xmlNewDocNode((xmlDocPtr)v5, 0, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), 0);
      -[IKJSObject appContext](self, "appContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v8, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)createDocumentFragment
{
  _xmlNode *v3;
  xmlNodePtr v4;
  void *v5;
  void *v6;

  v3 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v3)
  {
    v4 = xmlNewDocFragment((xmlDocPtr)v3);
    -[IKJSObject appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)createTextNode:(id)a3
{
  id v4;
  _xmlNode *v5;
  const xmlDoc *v6;
  void *v7;
  void *v8;
  xmlNodePtr v9;
  void *v10;

  v4 = a3;
  v5 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v5)
  {
    v6 = (const xmlDoc *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v4, "length"))
        v7 = v4;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = xmlNewDocText(v6, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    -[IKJSObject appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v10, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)createComment:(id)a3
{
  id v4;
  _xmlNode *v5;
  xmlDoc *v6;
  void *v7;
  void *v8;
  xmlNodePtr v9;
  void *v10;

  v4 = a3;
  v5 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v5)
  {
    v6 = (xmlDoc *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v4, "length"))
        v7 = v4;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = xmlNewDocComment(v6, (const xmlChar *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    -[IKJSObject appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v10, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)createCDATASection:(id)a3
{
  id v4;
  _xmlNode *v5;
  xmlDoc *v6;
  void *v7;
  void *v8;
  const char *v9;
  const xmlChar *v10;
  int v11;
  xmlNodePtr v12;
  void *v13;

  v4 = a3;
  v5 = -[IKDOMNode nodePtr](self, "nodePtr");
  if (v5)
  {
    v6 = (xmlDoc *)v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v4, "length"))
        v7 = v4;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    v10 = (const xmlChar *)v9;
    if (v9)
      v11 = strlen(v9);
    else
      v11 = 0;
    v12 = xmlNewCDataBlock(v6, v10, v11);
    -[IKJSObject appContext](self, "appContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v13, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getElementsByTagName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("//"), "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[IKDOMNodeList nodeListWithAppContext:contextNode:xpath:](IKDOMNodeList, "nodeListWithAppContext:contextNode:xpath:", v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getElementById:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v16;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("//*[@id='%@']"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  -[IKDOMNode nodesForXPath:error:](self, "nodesForXPath:error:", v4, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;

  if (v6)
  {
    ITMLKitGetLogObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[IKDOMDocument getElementById:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  objc_msgSend(v5, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)adoptNode:(id)a3
{
  id v4;
  _xmlNode *v5;
  uint64_t v6;
  xmlNode *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;

  v4 = a3;
  v5 = -[IKDOMNode nodePtr](self, "nodePtr");
  v6 = objc_msgSend(v4, "nodePtr");
  if (v5 && (v7 = (xmlNode *)v6) != 0)
  {
    if (*(_DWORD *)(v6 + 8) != 9)
    {
      objc_msgSend(v4, "parentNode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "childrenUpdatedWithUpdatedChildNodes:notify:", 0, 1);

      xmlUnlinkNode(v7);
      xmlSetTreeDoc(v7, (xmlDocPtr)v5);
      -[IKDOMDocument _updateITMLIDRecursivelyForNodePtr:](self, "_updateITMLIDRecursivelyForNodePtr:", v7);
      +[IKDOMNode handleNodeParentDidChange:](IKDOMNode, "handleNodeParentDidChange:", v7);
      v12 = v4;
      goto LABEL_10;
    }
    -[IKJSObject appContext](self, "appContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKJSObject appContext](self, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKDOMException exceptionWithAppContext:code:](IKDOMException, "exceptionWithAppContext:code:", v9, 9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setException:withErrorMessage:", v10, CFSTR("Cannot adopt document"));

  }
  else
  {
    ITMLKitGetLogObject(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[IKDOMDocument adoptNode:].cold.1(v11);

  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (id)createExpression:(id)a3 :(id)a4
{
  id v6;
  id v7;
  IKDOMXPathExpression *v8;
  void *v9;
  id v10;
  IKDOMXPathExpression *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = [IKDOMXPathExpression alloc];
  -[IKJSObject appContext](self, "appContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __35__IKDOMDocument_createExpression::__block_invoke;
  v13[3] = &unk_1E9F4CD88;
  objc_copyWeak(&v15, &location);
  v10 = v6;
  v14 = v10;
  v11 = -[IKDOMXPathExpression initWithAppContext:evaluatingBlock:](v8, "initWithAppContext:evaluatingBlock:", v9, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

id __35__IKDOMDocument_createExpression::__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  void *v8;

  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "evaluate:::::", *(_QWORD *)(a1 + 32), v6, 0, a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)evaluate:(id)a3 :(id)a4 :(id)a5 :(int64_t)a6 :(id)a7
{
  id v12;
  IKDOMDocument *v13;
  id v14;
  id v15;
  id *v16;
  uint64_t *v17;
  IKDOMDocument *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  IKDOMXPathResult *v28;
  void *v29;
  IKDOMXPathResult *v30;
  uint64_t v32;
  uint64_t v33;

  v12 = a3;
  v13 = (IKDOMDocument *)a4;
  v14 = a5;
  v15 = a7;
  if (v13)
  {
    v33 = 0;
    v16 = (id *)&v33;
    v17 = &v33;
    v18 = v13;
  }
  else
  {
    v32 = 0;
    v16 = (id *)&v32;
    v17 = &v32;
    v18 = self;
  }
  -[IKDOMNode nodesForXPath:error:](v18, "nodesForXPath:error:", v12, v17, v32, v33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *v16;
  if (v20)
  {
    ITMLKitGetLogObject(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[IKDOMDocument getElementById:].cold.1((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);

  }
  v28 = [IKDOMXPathResult alloc];
  -[IKJSObject appContext](self, "appContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[IKDOMXPathResult initWithAppContext:type:nodes:](v28, "initWithAppContext:type:nodes:", v29, a6, v19);

  return v30;
}

- (void)setNeedsUpdate
{
  id v3;

  if (self->_appBridgeFlags.hasSetNeedsUpdate)
  {
    -[IKDOMDocument appBridge](self, "appBridge");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsUpdateForDocument:", self);

  }
}

- (void)replace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[IKDOMDocument documentElement](self, "documentElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[IKPreference logDocumentXML](IKPreference, "logDocumentXML"))
  {
    ITMLKitGetLogObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[IKDOMDocument replace:].cold.1((uint64_t)v4, v7);

  }
  -[IKDOMDocument adoptNode:](self, "adoptNode:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = -[IKDOMNode replaceChild::](self, "replaceChild::", v6, v5);

}

- (IKJSNavigationDocument)navigationDocument
{
  void *v2;
  void *v3;

  -[IKJSObject jsValueForProperty:](self, "jsValueForProperty:", CFSTR("navigationDocument"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toObjectOfClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKJSNavigationDocument *)v3;
}

- (void)runTest:(id)a3 :(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (self->_appBridgeFlags.hasRunTest)
  {
    -[IKJSObject appContext](self, "appContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __26__IKDOMDocument_runTest::__block_invoke;
    v9[3] = &unk_1E9F4CDB0;
    v9[4] = self;
    v10 = v6;
    v11 = v7;
    objc_msgSend(v8, "addPostEvaluateBlock:", v9);

  }
}

void __26__IKDOMDocument_runTest::__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appBridge");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "runTestWithName:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)scrollToTop
{
  void *v3;
  _QWORD v4[5];

  if (self->_appBridgeFlags.hasScrollToTop)
  {
    -[IKJSObject appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __28__IKDOMDocument_scrollToTop__block_invoke;
    v4[3] = &unk_1E9F4C1C0;
    v4[4] = self;
    objc_msgSend(v3, "addPostEvaluateBlock:", v4);

  }
}

void __28__IKDOMDocument_scrollToTop__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "appBridge");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scrollToTop");

}

- (id)snapshotImpressions
{
  void *v2;
  void *v3;

  if (self->_appBridgeFlags.hasSnapshotImpressions)
  {
    -[IKDOMDocument appBridge](self, "appBridge");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "snapshotImpressions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)recordedImpressions:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isBoolean"))
    v5 = objc_msgSend(v4, "toBool");
  else
    v5 = 1;
  if (self->_appBridgeFlags.hasRecordedImpressions)
  {
    -[IKDOMDocument appBridge](self, "appBridge");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordedImpressions:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)matchingImpressions:(id)a3 :(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isBoolean"))
    v8 = objc_msgSend(v7, "toBool");
  else
    v8 = 1;
  if (self->_appBridgeFlags.hasImpressionsMatchingTag)
  {
    -[IKDOMDocument appBridge](self, "appBridge");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "impressionsMatching:reset:", v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)recordedImpressions:(id)a3 :(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  if (self->_appBridgeFlags.hasRecordedImpressionsCallback)
  {
    if (objc_msgSend(v6, "isBoolean"))
      v8 = objc_msgSend(v6, "toBool");
    else
      v8 = 1;
    objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "virtualMachine");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addManagedReference:withOwner:", v9, self);
    objc_initWeak(&location, self);
    -[IKDOMDocument appBridge](self, "appBridge");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __38__IKDOMDocument_recordedImpressions::__block_invoke;
    v15[3] = &unk_1E9F4CDD8;
    objc_copyWeak(&v18, &location);
    v13 = v9;
    v16 = v13;
    v14 = v11;
    v17 = v14;
    objc_msgSend(v12, "recordedImpressions:completion:", v8, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
}

void __38__IKDOMDocument_recordedImpressions::__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v5, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v6, "callWithArguments:", v7);

      objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), WeakRetained);
    }
  }

}

- (void)recordedImpressionsMatching:(id)a3 :(id)a4 :(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_appBridgeFlags.hasRecordedImpressionsMatchingCallback)
  {
    if (objc_msgSend(v9, "isBoolean"))
      v11 = objc_msgSend(v9, "toBool");
    else
      v11 = 1;
    objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "virtualMachine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addManagedReference:withOwner:", v12, self);
    objc_initWeak(&location, self);
    -[IKDOMDocument appBridge](self, "appBridge");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__IKDOMDocument_recordedImpressionsMatching_::__block_invoke;
    v18[3] = &unk_1E9F4CDD8;
    objc_copyWeak(&v21, &location);
    v16 = v12;
    v19 = v16;
    v17 = v14;
    v20 = v17;
    objc_msgSend(v15, "recordedImpressionsMatching:reset:completion:", v8, v11, v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
}

void __47__IKDOMDocument_recordedImpressionsMatching_::__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v5, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v6, "callWithArguments:", v7);

      objc_msgSend(*(id *)(a1 + 40), "removeManagedReference:withOwner:", *(_QWORD *)(a1 + 32), WeakRetained);
    }
  }

}

- (id)nodeName
{
  return CFSTR("#document");
}

- (int64_t)nodeType
{
  return 9;
}

+ (void)_resetUpdatesForNode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "jsNodeData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isUpdated") & 1) != 0
    || (objc_msgSend(v5, "isChildrenUpdated") & 1) != 0
    || objc_msgSend(v5, "isSubtreeUpdated"))
  {
    objc_msgSend(v5, "setUpdated:", 0);
    objc_msgSend(v5, "setChildrenUpdated:", 0);
    objc_msgSend(v5, "setSubtreeUpdated:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "documentElement");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
      {
        v19[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "childElements");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(a1, "_resetUpdatesForNode:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (IKNetworkRequestLoader)_requestLoader
{
  IKNetworkRequestLoader *requestLoader;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  IKNetworkRequestLoader *v12;
  IKNetworkRequestLoader *v13;

  requestLoader = self->__requestLoader;
  if (!requestLoader)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[IKDOMDocument documentElement](self, "documentElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ik_templateName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%f"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKJSObject appContext](self, "appContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "webInspectorController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerLoaderWithIdentifier:", v9);
    v12 = (IKNetworkRequestLoader *)objc_claimAutoreleasedReturnValue();
    v13 = self->__requestLoader;
    self->__requestLoader = v12;

    requestLoader = self->__requestLoader;
  }
  return requestLoader;
}

- (void)setITMLIDForNode:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend(v8, "nodePtr");
  v5 = self->_itmlIDSequence + 1;
  self->_itmlIDSequence = v5;
  objc_msgSend(v8, "setITMLID:", v5);
  if (v4 && *(_DWORD *)(v4 + 8) == 1)
  {
    v6 = v8;
    +[IKDOMNode ITMLIDStringforITMLID:](IKDOMNode, "ITMLIDStringforITMLID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttributeValue:withName:", v7, CFSTR("itmlID"));

  }
}

- (void)swapITMLIDForNode:(id)a3 withITMLIDForNode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "getAttribute:", CFSTR("itmlID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "getAttribute:", CFSTR("itmlID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAttributeValue:withName:", v7, CFSTR("itmlID"));
      objc_msgSend(v5, "setAttributeValue:withName:", v6, CFSTR("itmlID"));

    }
  }

}

+ (_xmlDoc)_documentWithXMLStr:(id)a3 lsInput:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  xmlDocPtr Memory;
  xmlDocPtr v15;
  xmlNodePtr RootElement;
  xmlErrorPtr LastError;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    v10 = v7;
  }
  else
  {
    objc_msgSend(v8, "stringData");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v9, "byteStream");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v9, "byteStream");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  xmlSetGenericErrorFunc((void *)*MEMORY[0x1E0C80C10], MEMORY[0x1E0C83478]);
  v13 = objc_retainAutorelease(v12);
  Memory = xmlReadMemory((const char *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 0, 0, 4096);
  if (Memory)
  {
    v15 = Memory;
    xmlSetGenericErrorFunc(0, 0);
LABEL_9:
    RootElement = xmlDocGetRootElement(v15);
    IKXMLStripSpaces((uint64_t)RootElement);
    goto LABEL_20;
  }
  LastError = xmlGetLastError();
  if (LastError->domain != 1 || !v11 || LastError->code != 9)
    goto LABEL_17;
  objc_msgSend(v11, "ik_stringByTrimmingControlChars");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dataUsingEncoding:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v19, "length"))
  {
    v13 = v19;
LABEL_17:
    xmlSetGenericErrorFunc(0, 0);
    goto LABEL_18;
  }
  v13 = objc_retainAutorelease(v19);
  v15 = xmlReadMemory((const char *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 0, 0, 4096);
  xmlSetGenericErrorFunc(0, 0);
  if (v15)
    goto LABEL_9;
LABEL_18:
  v15 = 0;
  if (a5)
    *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 200, 0);
LABEL_20:

  return v15;
}

- (void)_updateITMLIDRecursivelyForNodePtr:(_xmlNode *)a3
{
  xmlElementType type;
  _xmlNode *i;
  id v8;

  +[IKDOMNode nodeForNodePtr:](IKDOMNode, "nodeForNodePtr:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[IKDOMDocument setITMLIDForNode:](self, "setITMLIDForNode:", v8);
  type = a3->type;
  if (type == XML_DOCUMENT_FRAG_NODE || type == XML_ELEMENT_NODE)
  {
    for (i = a3->children; i; i = i->next)
      -[IKDOMDocument _updateITMLIDRecursivelyForNodePtr:](self, "_updateITMLIDRecursivelyForNodePtr:", i);
  }

}

- (void)_executeEmbeddedScriptWithExtraInfo:(id)a3
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
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  IKDOMDocument *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[IKDOMDocument documentElement](self, "documentElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v11, "nodeName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("head"));

        if (v13)
        {
          v14 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      if (v8)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v14, "childElements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v16)
  {
    v17 = v16;
    v41 = self;
    v18 = v4;
    v19 = *(_QWORD *)v43;
LABEL_13:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v19)
        objc_enumerationMutation(v15);
      v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v20);
      objc_msgSend(v21, "nodeName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("script"));

      if ((v23 & 1) != 0)
        break;
      if (v17 == ++v20)
      {
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        if (v17)
          goto LABEL_13;
        v24 = v15;
        v4 = v18;
        goto LABEL_31;
      }
    }
    v24 = v21;

    v4 = v18;
    if (!v24)
      goto LABEL_32;
    objc_msgSend(v24, "textContent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "getAttribute:", CFSTR("src"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBE0F0], "currentContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "length");
    if (v28)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      __53__IKDOMDocument__executeEmbeddedScriptWithExtraInfo___block_invoke(v28, v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("script_%@"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v32, "isUndefined"))
      {
LABEL_30:

        objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", v41, v27);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = v38;
        v50[1] = v18;
        v4 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (id)objc_msgSend(v32, "invokeMethod:withArguments:", CFSTR("call"), v39);

        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("function %@(extraInfo) { \n%@\n }"), v31, v25);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v26);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (id)objc_msgSend(v27, "evaluateScript:withSourceURL:", v33, v34);

      }
      else
      {
        v37 = (id)objc_msgSend(v27, "evaluateScript:withSourceURL:", v33, 0);
      }
      objc_msgSend(v27, "objectForKeyedSubscript:", v31);
      v36 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("Function"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = CFSTR("extraInfo");
      v51[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constructWithArguments:", v33);
      v36 = objc_claimAutoreleasedReturnValue();
    }

    v32 = (void *)v36;
    goto LABEL_30;
  }
  v24 = v15;
LABEL_31:

LABEL_32:
}

id __53__IKDOMDocument__executeEmbeddedScriptWithExtraInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  CC_SHA1_CTX c;
  unsigned __int8 md[20];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(v2, "dataUsingEncoding:", 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&c, 0, sizeof(c));
    CC_SHA1_Init(&c);
    v4 = objc_retainAutorelease(v3);
    CC_SHA1((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), md);
    v5 = (void *)objc_opt_new();
    for (i = 0; i != 20; ++i)
      objc_msgSend(v5, "appendFormat:", CFSTR("%02x"), md[i]);
    v7 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (IKJSDOMDocumentAppBridge)appBridge
{
  return (IKJSDOMDocumentAppBridge *)objc_loadWeakRetained((id *)&self->_appBridge);
}

- (BOOL)isEmbeddedScriptExecuted
{
  return self->_embeddedScriptExecuted;
}

- (void)setEmbeddedScriptExecuted:(BOOL)a3
{
  self->_embeddedScriptExecuted = a3;
}

- (unint64_t)itmlIDSequence
{
  return self->_itmlIDSequence;
}

- (void)setItmlIDSequence:(unint64_t)a3
{
  self->_itmlIDSequence = a3;
}

- (NSString)_documentURI
{
  return self->__documentURI;
}

- (void)_setDocumentURI:(id)a3
{
  objc_storeStrong((id *)&self->__documentURI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__documentURI, 0);
  objc_destroyWeak((id *)&self->_appBridge);
  objc_storeStrong((id *)&self->__requestLoader, 0);
}

- (void)getElementById:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D95F2000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)adoptNode:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D95F2000, log, OS_LOG_TYPE_ERROR, "Invalid arguments to adopt node", v1, 2u);
}

- (void)replace:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_DEBUG, "ITML: Replacing current document with XML: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

@end
