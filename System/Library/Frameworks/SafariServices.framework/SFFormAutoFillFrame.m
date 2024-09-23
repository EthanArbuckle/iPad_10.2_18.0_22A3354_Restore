@implementation SFFormAutoFillFrame

+ (id)autoFillFrameWithWebProcessPlugInFrame:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWebProcessPlugInFrame:", v4);

  return v5;
}

- (SFFormAutoFillFrame)initWithWebProcessPlugInFrame:(id)a3
{
  id v5;
  SFFormAutoFillFrame *v6;
  SFFormAutoFillFrame *v7;
  SFFormAutoFillFrame *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFFormAutoFillFrame;
  v6 = -[SFFormAutoFillFrame init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_plugInFrame, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SFFormAutoFillFrame *v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;

  v4 = (SFFormAutoFillFrame *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = (isKindOfClass & 1) != 0 && self->_plugInFrame == v4->_plugInFrame;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[WKWebProcessPlugInFrame hash](self->_plugInFrame, "hash");
}

- (id)_pageContoller
{
  void *v2;
  void *v3;

  -[WKWebProcessPlugInFrame _browserContextController](self->_plugInFrame, "_browserContextController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFWebProcessPlugInPageController pageControllerForBrowserContextController:](_SFWebProcessPlugInPageController, "pageControllerForBrowserContextController:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_formMetadataController
{
  void *v2;
  void *v3;

  -[SFFormAutoFillFrame _pageContoller](self, "_pageContoller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "formMetadataController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (OpaqueFormAutoFillFrame)frameRef
{
  return (OpaqueFormAutoFillFrame *)self->_plugInFrame;
}

- (id)pageMainFrame
{
  void *v3;
  WKWebProcessPlugInFrame *v4;
  SFFormAutoFillFrame *v5;
  SFFormAutoFillFrame *v6;

  -[SFFormAutoFillFrame _pageContoller](self, "_pageContoller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainFrame");
  v4 = (WKWebProcessPlugInFrame *)objc_claimAutoreleasedReturnValue();

  if (v4 == self->_plugInFrame)
  {
    v5 = self;
  }
  else
  {
    +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", v4);
    v5 = (SFFormAutoFillFrame *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (OpaqueJSContext)jsContextForMetadataControllerScriptWorld
{
  void *v3;
  void *v4;
  void *v5;
  OpaqueJSContext *v6;

  -[SFFormAutoFillFrame _formMetadataController](self, "_formMetadataController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scriptWorld");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WKWebProcessPlugInFrame jsContextForWorld:](self->_plugInFrame, "jsContextForWorld:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (OpaqueJSContext *)objc_msgSend(v5, "JSGlobalContextRef");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)containsAnyFormElements
{
  return -[WKWebProcessPlugInFrame containsAnyFormElements](self->_plugInFrame, "containsAnyFormElements");
}

- (OpaqueJSValue)jsWrapperInMetadataControllerScriptWorldForNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  OpaqueJSValue *v7;
  void *v8;

  objc_msgSend(a3, "nodeHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFormAutoFillFrame _formMetadataController](self, "_formMetadataController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scriptWorld");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v4 && v6)
  {
    -[WKWebProcessPlugInFrame jsNodeForNodeHandle:inWorld:](self->_plugInFrame, "jsNodeForNodeHandle:inWorld:", v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (OpaqueJSValue *)objc_msgSend(v8, "JSValueRef");

  }
  return v7;
}

- (id)committedURL
{
  return (id)-[WKWebProcessPlugInFrame URL](self->_plugInFrame, "URL");
}

- (void)enumerateChildFramesUsingBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WKWebProcessPlugInFrame childFrames](self->_plugInFrame, "childFrames", 0);
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
        +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (WKWebProcessPlugInFrame)plugInFrame
{
  return self->_plugInFrame;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugInFrame, 0);
}

@end
