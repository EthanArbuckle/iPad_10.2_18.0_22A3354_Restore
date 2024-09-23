@implementation IKViewElementStyleComposer

+ (IKViewElementStyleComposer)styleComposerWithDefaultStyleComposer:(id)a3 parentStyleComposer:(id)a4 styleList:(id)a5 elementStyleOverrides:(id)a6
{
  IKViewElementStyleComposer *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  if (a3 || a4 || a5 || a6)
  {
    v10 = a6;
    v11 = a5;
    v12 = a4;
    v13 = a3;
    v9 = -[IKViewElementStyleComposer initWithDefaultStyleComposer:parentStyleComposer:styleList:elementStyleOverrides:]([IKViewElementStyleComposer alloc], "initWithDefaultStyleComposer:parentStyleComposer:styleList:elementStyleOverrides:", v13, v12, v11, v10);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (IKViewElementStyleComposer)initWithDefaultStyleComposer:(id)a3 parentStyleComposer:(id)a4 styleList:(id)a5 elementStyleOverrides:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IKViewElementStyleComposer *v15;
  char v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IKViewElementStyleComposer;
  v15 = -[IKViewElementStyleComposer init](&v18, sel_init);
  if (v15)
  {
    if ((objc_msgSend(v11, "requiresMediaQueryEvaluation") & 1) != 0
      || (objc_msgSend(v12, "requiresMediaQueryEvaluation") & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      v16 = objc_msgSend(v13, "requiresMediaQueryEvaluation");
    }
    v15->_requiresMediaQueryEvaluation = v16;
    objc_storeStrong((id *)&v15->_defaultStyleComposer, a3);
    objc_storeStrong((id *)&v15->_parentStyleComposer, a4);
    objc_storeStrong((id *)&v15->_styleList, a5);
    objc_storeStrong((id *)&v15->_elementStyleOverrides, a6);
    if (!v15->_requiresMediaQueryEvaluation)
      -[IKViewElementStyleComposer _composeWithMediaQueryEvaluator:](v15, "_composeWithMediaQueryEvaluator:", 0);
  }

  return v15;
}

- (id)composedStyleWithMediaQueryEvaluator:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!-[IKViewElementStyleComposer isCompositionDone](self, "isCompositionDone"))
    -[IKViewElementStyleComposer _composeWithMediaQueryEvaluator:](self, "_composeWithMediaQueryEvaluator:", v4);
  -[IKViewElementStyleComposer composedStyle](self, "composedStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setNeedsRecomposition
{
  void *v3;
  id v4;

  if (-[IKViewElementStyleComposer requiresMediaQueryEvaluation](self, "requiresMediaQueryEvaluation"))
  {
    -[IKViewElementStyleComposer setComposedSansDefaultStyle:](self, "setComposedSansDefaultStyle:", 0);
    -[IKViewElementStyleComposer setComposedStyle:](self, "setComposedStyle:", 0);
    self->_compositionDone = 0;
    -[IKViewElementStyleComposer styleList](self, "styleList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsReresolution");

    -[IKViewElementStyleComposer defaultStyleComposer](self, "defaultStyleComposer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsRecomposition");

  }
}

- (id)consolidatedDefaultStyleList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKViewElementStyleComposer styleList](self, "styleList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IKViewElementStyleComposer styleList](self, "styleList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[IKViewElementStyleComposer defaultStyleComposer](self, "defaultStyleComposer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "consolidatedDefaultStyleList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  return v3;
}

- (id)composedSansDefaultStyleWithMediaQueryEvaluator:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!-[IKViewElementStyleComposer isCompositionDone](self, "isCompositionDone"))
    -[IKViewElementStyleComposer _composeWithMediaQueryEvaluator:](self, "_composeWithMediaQueryEvaluator:", v4);
  -[IKViewElementStyleComposer composedSansDefaultStyle](self, "composedSansDefaultStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_composeWithMediaQueryEvaluator:(id)a3
{
  id v4;
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
  IKViewElementStyleComposer *v15;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[IKViewElementStyleComposer isCompositionDone](self, "isCompositionDone"))
  {
    -[IKViewElementStyleComposer parentStyleComposer](self, "parentStyleComposer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "composedSansDefaultStyleWithMediaQueryEvaluator:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKViewElementStyleComposer styleList](self, "styleList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resolvedStyleWithMediaQueryEvaluator:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[IKViewElementStyleComposer elementStyleOverrides](self, "elementStyleOverrides");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IKViewElementStyle elementStyleWithParentStyle:elementStyle:elementStyleOverrides:](IKViewElementStyle, "elementStyleWithParentStyle:elementStyle:elementStyleOverrides:", v6, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKViewElementStyleComposer setComposedSansDefaultStyle:](self, "setComposedSansDefaultStyle:", v10);
    -[IKViewElementStyleComposer defaultStyleComposer](self, "defaultStyleComposer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "composedStyleWithMediaQueryEvaluator:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (v10)
      {
        v17[0] = v12;
        v17[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[IKViewElementStyle elementStyleWithSelector:aggregatingStyles:](IKViewElementStyle, "elementStyleWithSelector:aggregatingStyles:", 0, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[IKViewElementStyleComposer setComposedStyle:](self, "setComposedStyle:", v14);

LABEL_8:
        self->_compositionDone = 1;

        goto LABEL_9;
      }
      v15 = self;
      v16 = v12;
    }
    else
    {
      v15 = self;
      v16 = v10;
    }
    -[IKViewElementStyleComposer setComposedStyle:](v15, "setComposedStyle:", v16);
    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)requiresMediaQueryEvaluation
{
  return self->_requiresMediaQueryEvaluation;
}

- (IKViewElementStyleComposer)defaultStyleComposer
{
  return self->_defaultStyleComposer;
}

- (IKViewElementStyleComposer)parentStyleComposer
{
  return self->_parentStyleComposer;
}

- (IKStyleList)styleList
{
  return self->_styleList;
}

- (IKViewElementStyle)elementStyleOverrides
{
  return self->_elementStyleOverrides;
}

- (BOOL)isCompositionDone
{
  return self->_compositionDone;
}

- (IKViewElementStyle)composedSansDefaultStyle
{
  return self->_composedSansDefaultStyle;
}

- (void)setComposedSansDefaultStyle:(id)a3
{
  objc_storeStrong((id *)&self->_composedSansDefaultStyle, a3);
}

- (IKViewElementStyle)composedStyle
{
  return self->_composedStyle;
}

- (void)setComposedStyle:(id)a3
{
  objc_storeStrong((id *)&self->_composedStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedStyle, 0);
  objc_storeStrong((id *)&self->_composedSansDefaultStyle, 0);
  objc_storeStrong((id *)&self->_elementStyleOverrides, 0);
  objc_storeStrong((id *)&self->_styleList, 0);
  objc_storeStrong((id *)&self->_parentStyleComposer, 0);
  objc_storeStrong((id *)&self->_defaultStyleComposer, 0);
}

@end
