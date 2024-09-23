@implementation IKStyleList

- (IKStyleList)initWithClassSelector:(id)a3 styles:(id)a4 baseStyleList:(id)a5
{
  id v8;
  id v9;
  id v10;
  IKStyleList *v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  NSArray *styles;
  uint64_t v21;
  NSString *classSelector;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)IKStyleList;
  v11 = -[IKStyleList init](&v28, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "requiresMediaQueryEvaluation");
    v11->_requiresMediaQueryEvaluation = v12;
    if ((v12 & 1) == 0)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = v9;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "mediaQueryList", (_QWORD)v24);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              v11->_requiresMediaQueryEvaluation = 1;
              goto LABEL_13;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v15)
            continue;
          break;
        }
      }
LABEL_13:

    }
    objc_storeStrong((id *)&v11->_baseStyleList, a5);
    v19 = objc_msgSend(v9, "copy");
    styles = v11->_styles;
    v11->_styles = (NSArray *)v19;

    v21 = objc_msgSend(v8, "copy");
    classSelector = v11->_classSelector;
    v11->_classSelector = (NSString *)v21;

    if (!v11->_requiresMediaQueryEvaluation)
      -[IKStyleList _resolveWithMediaQueryEvaluator:](v11, "_resolveWithMediaQueryEvaluator:", 0);
  }

  return v11;
}

- (id)resolvedStyleWithMediaQueryEvaluator:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!-[IKStyleList isResolutionDone](self, "isResolutionDone"))
    -[IKStyleList _resolveWithMediaQueryEvaluator:](self, "_resolveWithMediaQueryEvaluator:", v4);
  -[IKStyleList resolvedStyle](self, "resolvedStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setNeedsReresolution
{
  id v3;

  if (-[IKStyleList requiresMediaQueryEvaluation](self, "requiresMediaQueryEvaluation"))
  {
    -[IKStyleList setResolvedStyle:](self, "setResolvedStyle:", 0);
    -[IKStyleList setResolutionDone:](self, "setResolutionDone:", 0);
    -[IKStyleList baseStyleList](self, "baseStyleList");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsReresolution");

  }
}

- (void)_resolveWithMediaQueryEvaluator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[IKStyleList isResolutionDone](self, "isResolutionDone"))
  {
    v5 = (void *)MEMORY[0x1E0C99DE8];
    -[IKStyleList styles](self, "styles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count") + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKStyleList baseStyleList](self, "baseStyleList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resolvedStyleWithMediaQueryEvaluator:", v4);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v7, "addObject:", v9);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[IKStyleList styles](self, "styles", v9, self, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "mediaQueryList");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            objc_msgSend(v15, "mediaQueryList");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v4, "evaluateStyleMediaQueryList:", v18);

            if (!v19)
              continue;
          }
          objc_msgSend(v7, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v7, "count"))
    {
      +[IKViewElementStyle elementStyleWithSelector:aggregatingStyles:](IKViewElementStyle, "elementStyleWithSelector:aggregatingStyles:", 0, v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v22, "setResolvedStyle:", v20);
    objc_msgSend(v22, "setResolutionDone:", 1);

  }
}

- (BOOL)requiresMediaQueryEvaluation
{
  return self->_requiresMediaQueryEvaluation;
}

- (NSString)classSelector
{
  return self->_classSelector;
}

- (IKStyleList)baseStyleList
{
  return self->_baseStyleList;
}

- (NSArray)styles
{
  return self->_styles;
}

- (IKViewElementStyle)resolvedStyle
{
  return self->_resolvedStyle;
}

- (void)setResolvedStyle:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedStyle, a3);
}

- (BOOL)isResolutionDone
{
  return self->_resolutionDone;
}

- (void)setResolutionDone:(BOOL)a3
{
  self->_resolutionDone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedStyle, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_baseStyleList, 0);
  objc_storeStrong((id *)&self->_classSelector, 0);
}

@end
