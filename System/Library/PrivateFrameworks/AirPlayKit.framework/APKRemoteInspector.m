@implementation APKRemoteInspector

- (APKRemoteInspector)initWithName:(id)a3
{
  id v4;
  APKRemoteInspector *v5;
  JSContext *v6;
  JSContext *context;
  void *v8;
  void *v9;
  APKRemoteInspectorDOMAgent *v10;
  APKRemoteInspectorDOMAgent *DOMAgent;
  APKRemoteInspectorDOMAgent *v12;
  void *v13;
  APKRemoteInspectorCSSAgent *v14;
  APKRemoteInspectorCSSAgent *CSSAgent;
  APKRemoteInspectorCSSAgent *v16;
  void *v17;
  APKRemoteInspectorNetworkAgent *v18;
  APKRemoteInspectorNetworkAgent *networkAgent;
  APKRemoteInspectorNetworkAgent *v20;
  void *v21;
  APKRemoteInspectorPageAgent *v22;
  APKRemoteInspectorPageAgent *pageAgent;
  APKRemoteInspectorPageAgent *v24;
  void *v26;
  id v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)APKRemoteInspector;
  v5 = -[APKRemoteInspector init](&v28, sel_init);
  if (v5)
  {
    JSRemoteInspectorGetInspectionEnabledByDefault();
    JSRemoteInspectorSetInspectionEnabledByDefault();
    v6 = (JSContext *)objc_alloc_init(MEMORY[0x24BDDA720]);
    context = v5->_context;
    v5->_context = v6;

    -[JSContext setName:](v5->_context, "setName:", v4);
    -[JSContext _setITMLDebuggableType](v5->_context, "_setITMLDebuggableType");
    -[JSContext _setDebuggerRunLoop:](v5->_context, "_setDebuggerRunLoop:", CFRunLoopGetCurrent());
    -[JSContext _setRemoteInspectionEnabled:](v5->_context, "_setRemoteInspectionEnabled:", 1);
    JSRemoteInspectorSetInspectionEnabledByDefault();
    -[JSContext _inspector](v5->_context, "_inspector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "domEventDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[APKRemoteInspectorDOMAgent initWithDispatcher:]([APKRemoteInspectorDOMAgent alloc], "initWithDispatcher:", v26);
    v27 = v4;
    DOMAgent = v5->_DOMAgent;
    v5->_DOMAgent = v10;
    v12 = v10;

    objc_msgSend(v9, "cssEventDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[APKRemoteInspectorCSSAgent initWithDispatcher:]([APKRemoteInspectorCSSAgent alloc], "initWithDispatcher:", v13);
    CSSAgent = v5->_CSSAgent;
    v5->_CSSAgent = v14;
    v16 = v14;

    objc_msgSend(v9, "networkEventDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[APKRemoteInspectorNetworkAgent initWithDispatcher:]([APKRemoteInspectorNetworkAgent alloc], "initWithDispatcher:", v17);
    networkAgent = v5->_networkAgent;
    v5->_networkAgent = v18;
    v20 = v18;

    objc_msgSend(v9, "pageEventDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[APKRemoteInspectorPageAgent initWithDispatcher:]([APKRemoteInspectorPageAgent alloc], "initWithDispatcher:", v21);
    pageAgent = v5->_pageAgent;
    v5->_pageAgent = v22;
    v24 = v22;

    objc_msgSend(v9, "setDOMHandler:", v12);
    objc_msgSend(v9, "setCSSHandler:", v16);

    objc_msgSend(v9, "setNetworkHandler:", v20);
    objc_msgSend(v9, "setPageHandler:", v24);

    v4 = v27;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[JSContext _inspector](self->_context, "_inspector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDOMHandler:", 0);
  objc_msgSend(v4, "setCSSHandler:", 0);
  objc_msgSend(v4, "setNetworkHandler:", 0);
  objc_msgSend(v4, "setPageHandler:", 0);

  v5.receiver = self;
  v5.super_class = (Class)APKRemoteInspector;
  -[APKRemoteInspector dealloc](&v5, sel_dealloc);
}

- (BOOL)isConnected
{
  void *v2;
  void *v3;
  char v4;

  -[APKRemoteInspector context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inspector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "connected");

  return v4;
}

+ (id)nodeWithIdentifier:(int)a3 name:(id)a4 type:(int64_t)a5 value:(id)a6
{
  uint64_t v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;

  v8 = *(_QWORD *)&a3;
  v9 = (objc_class *)MEMORY[0x24BEC2768];
  v10 = a6;
  v11 = a4;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithNodeId:nodeType:nodeName:localName:nodeValue:", v8, a5, v11, v11, v10);

  return v12;
}

+ (id)styleWithProperties:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x24BEC2758]);
        objc_msgSend(v5, "objectForKey:", v10, (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithName:value:", v10, v12);

        objc_msgSend(v4, "addObject:", v13);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_1);
  v14 = objc_alloc(MEMORY[0x24BEC2760]);
  v15 = (void *)objc_msgSend(v14, "initWithCssProperties:shorthandEntries:", v4, MEMORY[0x24BDBD1A8]);

  return v15;
}

uint64_t __42__APKRemoteInspector_styleWithProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)computedStyleWithName:(id)a3 value:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BEC2750];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithName:value:", v7, v6);

  return v8;
}

+ (id)resourceWithURL:(id)a3 type:(int64_t)a4 MIMEType:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (objc_class *)MEMORY[0x24BEC2778];
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithUrl:type:mimeType:", v9, a4, v8);

  return v10;
}

- (JSContext)context
{
  return self->_context;
}

- (APKRemoteInspectorCSSAgent)CSSAgent
{
  return self->_CSSAgent;
}

- (APKRemoteInspectorDOMAgent)DOMAgent
{
  return self->_DOMAgent;
}

- (APKRemoteInspectorNetworkAgent)networkAgent
{
  return self->_networkAgent;
}

- (APKRemoteInspectorPageAgent)pageAgent
{
  return self->_pageAgent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageAgent, 0);
  objc_storeStrong((id *)&self->_networkAgent, 0);
  objc_storeStrong((id *)&self->_DOMAgent, 0);
  objc_storeStrong((id *)&self->_CSSAgent, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
