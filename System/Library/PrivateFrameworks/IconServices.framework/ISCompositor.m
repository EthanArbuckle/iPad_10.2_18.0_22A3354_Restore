@implementation ISCompositor

- (ISCompositor)init
{
  ISCompositor *v2;
  uint64_t v3;
  NSMutableArray *elements;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISCompositor;
  v2 = -[ISCompositor init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    elements = v2->_elements;
    v2->_elements = (NSMutableArray *)v3;

    v2->_renderingMode = 1;
  }
  return v2;
}

- (void)dealloc
{
  CIContext *sharedCIContext;
  objc_super v4;

  sharedCIContext = self->_sharedCIContext;
  if (sharedCIContext)
    -[CIContext clearCaches](sharedCIContext, "clearCaches");
  v4.receiver = self;
  v4.super_class = (Class)ISCompositor;
  -[ISCompositor dealloc](&v4, sel_dealloc);
}

- (CIContext)sharedCIContext
{
  CIContext *sharedCIContext;
  CIContext *v4;
  CIContext *v5;

  sharedCIContext = self->_sharedCIContext;
  if (!sharedCIContext)
  {
    objc_msgSend(MEMORY[0x1E0C9DD90], "_IS_sharedIconCompositorContext");
    v4 = (CIContext *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sharedCIContext;
    self->_sharedCIContext = v4;

    sharedCIContext = self->_sharedCIContext;
  }
  return sharedCIContext;
}

- (void)addElementWithRecipe:(id)a3 resources:(id)a4
{
  id v6;
  id v7;
  _ISCompositorElement *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_ISCompositorElement initWithRecipe:resources:]([_ISCompositorElement alloc], "initWithRecipe:resources:", v7, v6);

  -[ISCompositor addElement:](self, "addElement:", v8);
}

- (void)addElement:(id)a3
{
  -[NSMutableArray addObject:](self->_elements, "addObject:", a3);
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D3A7B0], "bitmapContextWithSize:scale:preset:", 0, a3.width, a3.height, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISCompositor drawInContext:](self, "drawInContext:", v5);
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D3A7C0]);
  v8 = objc_msgSend(v6, "CGImage");
  objc_msgSend(v6, "scale");
  v9 = (void *)objc_msgSend(v7, "initWithCGImage:scale:", v8);

  return v9;
}

- (void)reset
{
  NSMutableArray *v3;
  NSMutableArray *elements;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  elements = self->_elements;
  self->_elements = v3;

}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

- (void)setRenderingMode:(unint64_t)a3
{
  self->_renderingMode = a3;
}

- (NSMutableArray)elements
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setElements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_sharedCIContext, 0);
}

- (ISCompositor)initWithRecipe:(id)a3
{
  id v4;
  ISCompositor *v5;
  _ISCompositorElement *v6;
  _ISCompositorElement *v7;
  void *v8;

  v4 = a3;
  v5 = -[ISCompositor init](self, "init");
  if (v5)
  {
    v6 = [_ISCompositorElement alloc];
    v7 = -[_ISCompositorElement initWithRecipe:resources:](v6, "initWithRecipe:resources:", v4, MEMORY[0x1E0C9AA70]);
    -[ISCompositor elements](v5, "elements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);

  }
  return v5;
}

- (void)setRecipe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _ISCompositorElement *v7;
  _ISCompositorElement *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  -[ISCompositor elements](self, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "setRecipe:", v4);
    }
    else
    {
      _ISDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ISCompositor(Convenience) setRecipe:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    }
  }
  else
  {
    v7 = [_ISCompositorElement alloc];
    v8 = -[_ISCompositorElement initWithRecipe:resources:](v7, "initWithRecipe:resources:", v4, MEMORY[0x1E0C9AA70]);
    -[ISCompositor elements](self, "elements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);

  }
}

- (ISCompositorRecipe)recipe
{
  void *v2;
  void *v3;
  void *v4;

  -[ISCompositor elements](self, "elements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ISCompositorRecipe *)v4;
}

- (void)setResource:(id)a3 named:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ISGenericRecipe *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  -[ISCompositor elements](self, "elements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc_init(ISGenericRecipe);
    -[ISCompositor setRecipe:](self, "setRecipe:", v10);

    -[ISCompositor elements](self, "elements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "setResource:forName:", v6, v7);
  }
  else
  {
    _ISDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ISCompositor(Convenience) setResource:named:].cold.1((uint64_t)v7, v12, v13);

  }
}

- (void)addResourcesFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[ISCompositor elements](self, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "addResourcesFromDictionary:", v4);
  }
  else
  {
    _ISDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ISCompositor(Convenience) addResourcesFromDictionary:].cold.1(v4, v7);

  }
}

- (void)clearResources
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  -[ISCompositor elements](self, "elements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "clearResources");
  }
  else
  {
    _ISDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ISCompositor(Convenience) clearResources].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
}

- (void)drawInContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  ISCompositor *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double x;
  double y;
  double width;
  double height;
  void *v39;
  const void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  uint64_t v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;
  CGRect v59;
  CGRect v60;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[ISCompositor renderingMode](self, "renderingMode")
    || -[ISCompositor renderingMode](self, "renderingMode") == 1
    || -[ISCompositor renderingMode](self, "renderingMode") == 2)
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[ISCompositor elements](self, "elements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v53 != v8)
            objc_enumerationMutation(v5);
          -[ISCompositor drawElement:inContext:](self, "drawElement:inContext:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i), v4);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v7);
    }
    goto LABEL_31;
  }
  objc_msgSend(v4, "bounds");
  v11 = v10;
  v13 = v12;
  v41 = v4;
  objc_msgSend(v4, "scale");
  v15 = v14;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[ISCompositor elements](self, "elements");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (!v16)
  {
    v5 = 0;
    goto LABEL_28;
  }
  v17 = v16;
  v5 = 0;
  v18 = *(_QWORD *)v49;
  v42 = *MEMORY[0x1E0C9E190];
  v43 = *MEMORY[0x1E0C9E1F8];
  do
  {
    for (j = 0; j != v17; ++j)
    {
      if (*(_QWORD *)v49 != v18)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
      objc_msgSend(v20, "recipe");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "layerTreeForSize:scale:", v11, v13, v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v22, "effect");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "resourceProvider");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISCompositor filterForLayer:scale:resourceProvider:](self, "filterForLayer:scale:resourceProvider:", v22, v24, v15);
        v25 = (id)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v5, "outputImage");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "outputImage");
          v27 = self;
          v28 = v17;
          v29 = v18;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "filterWithBackgroundImage:inputImage:", v26, v30);
          v45 = objc_claimAutoreleasedReturnValue();

          v18 = v29;
          v17 = v28;
          self = v27;

          v5 = (void *)v45;
          goto LABEL_24;
        }
      }
      else
      {
        v25 = 0;
      }
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceOverCompositing"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "outputImage");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setValue:forKey:", v32, v43);

        objc_msgSend(v5, "outputImage");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setValue:forKey:", v33, v42);

        v5 = v31;
      }
      else
      {
        v25 = v25;
        v5 = v25;
      }
LABEL_24:

    }
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  }
  while (v17);
LABEL_28:

  objc_msgSend(v5, "outputImage");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeScale(&v47, v15, v15);
  v46 = v47;
  v59.origin.x = 0.0;
  v59.origin.y = 0.0;
  v59.size.width = v11;
  v59.size.height = v13;
  v60 = CGRectApplyAffineTransform(v59, &v46);
  x = v60.origin.x;
  y = v60.origin.y;
  width = v60.size.width;
  height = v60.size.height;
  -[ISCompositor sharedCIContext](self, "sharedCIContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (const void *)objc_msgSend(v39, "createCGImage:fromRect:", v34, x, y, width, height);

  v4 = v41;
  if (v40)
  {
    objc_msgSend(v41, "drawCGImage:inRect:", v40, 0.0, 0.0, v11, v13);
    CFRelease(v40);
  }

LABEL_31:
}

- (id)filterForLayer:(id)a3 scale:(double)a4 resourceProvider:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *i;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  CGFloat v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v88;
  void *v89;
  uint64_t v90;
  id obj;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  id v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v104;
  void *v105;
  uint64_t v106;
  CGAffineTransform v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  CGAffineTransform v112;
  CGAffineTransform v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  _QWORD v120[3];
  CGRect v121;
  CGRect v122;

  v120[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v104 = a5;
  objc_opt_class();
  v96 = v7;
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v7, "content"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v8))
  {
    v92 = 0;
    goto LABEL_38;
  }
  v9 = v7;
  objc_msgSend(v9, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v9, "content");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v104, "resourceNamed:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v12;
    v12 = (void *)v13;

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v88 = v12;
    if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EEB8C9C0))
    {
      v120[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 1);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v12, "conformsToProtocol:", &unk_1EEB98528))
      {
        v19 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_14;
      }
      objc_msgSend(v12, "resourceStack");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v18;
LABEL_14:
    objc_msgSend(v9, "backgroundColor", v88);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIConstantColorGenerator"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "backgroundColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ciColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forKey:", v22, *MEMORY[0x1E0C9E1C0]);

    }
    else
    {
      v15 = 0;
    }
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    obj = v19;
    v97 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v119, 16);
    if (v97)
    {
      v23 = *(_QWORD *)v115;
      v24 = *MEMORY[0x1E0C9E1F8];
      v93 = *MEMORY[0x1E0C9E280];
      v94 = *MEMORY[0x1E0C9E268];
      v25 = 0x1E0C9D000uLL;
      v90 = *MEMORY[0x1E0C9E190];
      v101 = *MEMORY[0x1E0C9E1F8];
      do
      {
        for (i = 0; i != v97; i = (char *)i + 1)
        {
          if (*(_QWORD *)v115 != v23)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "size");
          objc_msgSend(v27, "imageForSize:scale:");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImage:", objc_msgSend(v28, "CGImage"));
            objc_msgSend(*(id *)(v25 + 3512), "filterWithName:", CFSTR("CILanczosScaleTransform"));
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = (void *)v29;
            objc_msgSend(v105, "setValue:forKey:", v29, v24);
            objc_msgSend(v9, "size");
            v31 = v30 * a4;
            objc_msgSend(v9, "size");
            v33 = v32 * a4;
            objc_msgSend(v28, "pixelSize");
            v36 = 1.0;
            if (v34 != v31 || v35 != v33)
            {
              v38 = v31 / v34;
              v39 = v33 / v35;
              if (v38 >= v39)
                v36 = v39;
              else
                v36 = v38;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "setValue:forKey:", v40, v94);

            objc_msgSend(v28, "pixelSize");
            v42 = v41;
            v44 = v43;
            CGAffineTransformMakeScale(&v113, v36, v36);
            v45 = (v31 - (v44 * v113.c + v113.a * v42)) * 0.5;
            v46 = (v33 - (v44 * v113.d + v113.b * v42)) * 0.5;
            objc_msgSend(*(id *)(v25 + 3512), "filterWithName:", CFSTR("CIAffineTransform"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            memset(&v112, 0, sizeof(v112));
            objc_msgSend(v9, "position");
            v49 = v45 + v48 * a4;
            objc_msgSend(v9, "position");
            CGAffineTransformMakeTranslation(&v112, v49, v46 + v50 * a4);
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v112, "{CGAffineTransform=dddddd}");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setValue:forKey:", v51, v93);
            objc_msgSend(v105, "outputImage");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setValue:forKey:", v52, v101);

            if (v15)
            {
              objc_msgSend(*(id *)(v25 + 3512), "filterWithName:", CFSTR("CISourceOverCompositing"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "outputImage");
              v54 = v9;
              v55 = v23;
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "setValue:forKey:", v56, v101);

              objc_msgSend(v15, "outputImage");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "setValue:forKey:", v57, v90);

              v23 = v55;
              v9 = v54;

              v15 = v53;
            }
            else
            {
              v15 = v47;
            }

            v24 = v101;
            v25 = 0x1E0C9D000;
          }

        }
        v97 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v119, 16);
      }
      while (v97);
    }

    v7 = v96;
    v16 = v89;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIConstantColorGenerator"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ciColor");
  v16 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValue:forKey:", v17, *MEMORY[0x1E0C9E1C0]);

LABEL_37:
  v92 = v15;

LABEL_38:
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  objc_msgSend(v7, "sublayers");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
  if (!v106)
  {

    v59 = 0;
LABEL_54:
    v75 = v92;
    goto LABEL_55;
  }
  v59 = 0;
  v102 = *(_QWORD *)v109;
  v60 = *MEMORY[0x1E0C9E1F8];
  v100 = *MEMORY[0x1E0C9E280];
  v95 = *MEMORY[0x1E0C9E190];
  v98 = v58;
  do
  {
    for (j = 0; j != v106; ++j)
    {
      if (*(_QWORD *)v109 != v102)
        objc_enumerationMutation(v98);
      -[ISCompositor filterForLayer:scale:resourceProvider:](self, "filterForLayer:scale:resourceProvider:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * j), v104, a4);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CICrop"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&v112, 0, sizeof(v112));
        CGAffineTransformMakeScale(&v112, a4, a4);
        objc_msgSend(v7, "frame");
        v107 = v112;
        v122 = CGRectApplyAffineTransform(v121, &v107);
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:", v122.origin.x, v122.origin.y, v122.size.width, v122.size.height);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setValue:forKey:", v64, CFSTR("inputRectangle"));

        objc_msgSend(v62, "outputImage");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setValue:forKey:", v65, v60);

        objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIAffineTransform"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        memset(&v107, 0, sizeof(v107));
        objc_msgSend(v7, "position");
        v68 = v67 * a4;
        objc_msgSend(v7, "position");
        CGAffineTransformMakeTranslation(&v107, v68, v69 * a4);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v107, "{CGAffineTransform=dddddd}");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setValue:forKey:", v70, v100);
        objc_msgSend(v63, "outputImage");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setValue:forKey:", v71, v60);

        if (v59)
        {
          objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceOverCompositing"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "outputImage");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setValue:forKey:", v73, v60);

          objc_msgSend(v59, "outputImage");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setValue:forKey:", v74, v95);

          v7 = v96;
          v59 = v72;
        }
        else
        {
          v59 = v66;
        }

      }
    }
    v106 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
  }
  while (v106);

  if (!v59)
    goto LABEL_54;
  v75 = v92;
  if (v92)
  {
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceOverCompositing"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "outputImage");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setValue:forKey:", v77, v60);

    objc_msgSend(v92, "outputImage");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setValue:forKey:", v78, v95);

    goto LABEL_57;
  }
LABEL_55:
  objc_msgSend(v59, "outputImage");
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v79)
    goto LABEL_58;
  v59 = v59;
  v76 = v59;
LABEL_57:

  v75 = v76;
LABEL_58:
  v80 = v96;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v81 = v96;
    objc_msgSend(v81, "mask");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISCompositor filterForLayer:scale:resourceProvider:](self, "filterForLayer:scale:resourceProvider:", v82, v104, a4);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    if (v83 && v75)
    {
      objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceInCompositing"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "outputImage");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setValue:forKey:", v85, *MEMORY[0x1E0C9E1F8]);

      objc_msgSend(v83, "outputImage");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setValue:forKey:", v86, *MEMORY[0x1E0C9E190]);

      v75 = v84;
    }

    v80 = v96;
  }

  return v75;
}

- (BOOL)canUseCoreImage
{
  return -[ISCompositor renderingMode](self, "renderingMode") == 2
      || -[ISCompositor renderingMode](self, "renderingMode") == 3;
}

- (BOOL)canUseCoreImageForEffects
{
  unint64_t v3;

  v3 = -[ISCompositor renderingMode](self, "renderingMode");
  if (v3 != 1)
    LOBYTE(v3) = -[ISCompositor renderingMode](self, "renderingMode") == 2
              || -[ISCompositor renderingMode](self, "renderingMode") == 3;
  return v3;
}

- (void)drawElement:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double x;
  double y;
  double width;
  double height;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGRect v48;
  CGRect v49;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "scale");
  v13 = v12;
  objc_msgSend(v6, "recipe");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layerTreeForSize:scale:", v9, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0;
LABEL_8:
    objc_msgSend(v6, "resourceProvider");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISCompositor drawLayer:resourceProvider:inContext:](self, "drawLayer:resourceProvider:inContext:", v15, v37, v7);
    goto LABEL_9;
  }
  objc_msgSend(v15, "effect");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16 || !-[ISCompositor canUseCoreImageForEffects](self, "canUseCoreImageForEffects"))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0D3A7B0], "bitmapContextWithSize:scale:preset:", 0, v9, v11, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourceProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISCompositor drawLayer:resourceProvider:inContext:](self, "drawLayer:resourceProvider:inContext:", v15, v18, v17);

  v19 = objc_alloc(MEMORY[0x1E0C9DDC8]);
  objc_msgSend(v17, "image");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "initWithCGImage:", objc_msgSend(v20, "CGImage"));

  v22 = objc_alloc(MEMORY[0x1E0C9DDC8]);
  objc_msgSend(v7, "image");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "initWithCGImage:", objc_msgSend(v23, "CGImage"));

  objc_msgSend(v16, "filterWithBackgroundImage:inputImage:", v24, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "outputImage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeScale(&v47, v13, v13);
  v46 = v47;
  v48.origin.x = 0.0;
  v48.origin.y = 0.0;
  v48.size.width = v9;
  v48.size.height = v11;
  v49 = CGRectApplyAffineTransform(v48, &v46);
  if (v26)
  {
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    height = v49.size.height;
    -[ISCompositor sharedCIContext](self, "sharedCIContext");
    v45 = v25;
    v31 = (void *)v24;
    v32 = v17;
    v33 = (void *)v21;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (const void *)objc_msgSend(v34, "createCGImage:fromRect:", v26, x, y, width, height);

    v36 = v33;
    v37 = v32;
    v38 = v31;
    v39 = v45;
    if (v35)
    {
      objc_msgSend(v7, "drawCGImage:inRect:", v35, 0.0, 0.0, v9, v11);
      CFRelease(v35);
    }
  }
  else
  {
    objc_msgSend(v6, "resourceProvider", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
    v40 = v25;
    v41 = (void *)v24;
    v42 = v17;
    v43 = (void *)v21;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISCompositor drawLayer:resourceProvider:inContext:](self, "drawLayer:resourceProvider:inContext:", v15, v44, v7);

    v36 = v43;
    v37 = v42;
    v38 = v41;
    v39 = v40;
    v26 = 0;
  }

LABEL_9:
}

- (id)scaledImageFromContent:(id)a3 size:(CGSize)a4 scale:(double)a5 needsScaled:(BOOL *)a6
{
  double height;
  double width;
  void *v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  const void *v49;
  uint64_t v50;
  CGAffineTransform v52;
  _OWORD v53[3];

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "imageForSize:scale:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ISCompositor canUseCoreImage](self, "canUseCoreImage");
  if (v12)
  {
    v13 = width * a5;
    v14 = height * a5;
    objc_msgSend(v11, "pixelSize");
    if (v15 != v13 || v16 != v14)
    {
      v18 = v13 / v15;
      v19 = v14 / v16;
      v20 = v18 >= v19 ? v19 : v18;
      if (v20 != 1.0)
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImage:", objc_msgSend(v11, "CGImage"));
        objc_msgSend(v11, "pixelSize");
        v23 = v20 * v22;
        objc_msgSend(v11, "pixelSize");
        v25 = v20 * v24;
        objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIAffineClamp"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *MEMORY[0x1E0C9E1F8];
        objc_msgSend(v26, "setValue:forKey:", v21, *MEMORY[0x1E0C9E1F8]);
        v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v53[0] = *MEMORY[0x1E0C9BAA8];
        v53[1] = v28;
        v53[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v53, "{CGAffineTransform=dddddd}");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setValue:forKey:", v29, *MEMORY[0x1E0C9E280]);

        if (_os_feature_enabled_simple_impl())
        {
          _ISDefaultLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            -[ISCompositor(Rendering) scaledImageFromContent:size:scale:needsScaled:].cold.1(v30);

          objc_msgSend(v26, "outputImage");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          CGAffineTransformMakeScale(&v52, v20, v20);
          objc_msgSend(v31, "imageByApplyingTransform:highQualityDownsample:", &v52, 1);
          v32 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CILanczosScaleTransform"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "outputImage");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setValue:forKey:", v33, v27);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setValue:forKey:", v34, *MEMORY[0x1E0C9E268]);

          objc_msgSend(v31, "outputImage");
          v32 = objc_claimAutoreleasedReturnValue();
        }
        v35 = (void *)v32;

        objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CICrop"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGRect:", 0.0, 0.0, v23, v25);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setValue:forKey:", v37, CFSTR("inputRectangle"));

        objc_msgSend(v36, "setValue:forKey:", v35, v27);
        objc_msgSend(v36, "outputImage");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (v38)
        {
          objc_msgSend(v38, "extent");
          v41 = v40;
          v43 = v42;
          v45 = v44;
          v47 = v46;
          -[ISCompositor sharedCIContext](self, "sharedCIContext");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (const void *)objc_msgSend(v48, "createCGImage:fromRect:", v39, v41, v43, v45, v47);

          if (v49)
          {
            objc_msgSend(v11, "CGImage");
            if (CGImageGetProperty() == *MEMORY[0x1E0C9AE50])
              CGImageSetProperty();
            v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7C0]), "initWithCGImage:scale:", v49, a5);

            CFRelease(v49);
            v11 = (void *)v50;
          }
        }

      }
    }
  }
  if (a6)
    *a6 = !v12;
  return v11;
}

- (id)maskImageForLayer:(id)a3 size:(CGSize)a4 scale:(double)a5 resourceProvider:(id)a6
{
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  objc_msgSend(a3, "mask");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D3A7B0], "bitmapContextWithSize:scale:preset:", 0, width, height, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISCompositor drawLayer:resourceProvider:inContext:](self, "drawLayer:resourceProvider:inContext:", v12, v11, v13);
    objc_msgSend(v13, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)drawLayer:(id)a3 resourceProvider:(id)a4 inContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGAffineTransform *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  id v43;
  void *v44;
  char isKindOfClass;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  char v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  ISCompositor *v80;
  id v81;
  unint64_t v82;
  void *v83;
  int a_low;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  _BOOL4 v97;
  id v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  double x;
  double y;
  double width;
  double height;
  void *v114;
  const void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  void *v121;
  __int128 v122;
  void *v123;
  __int128 v124;
  uint64_t v125;
  id obj[2];
  id obja;
  CGAffineTransform v128;
  CGAffineTransform v129;
  CGAffineTransform v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  CGAffineTransform v139;
  CGAffineTransform t1;
  CGAffineTransform v141;
  CGAffineTransform v142;
  CGAffineTransform v143;
  CGAffineTransform v144;
  CGAffineTransform v145;
  CGAffineTransform v146;
  CGAffineTransform v147;
  CGAffineTransform v148;
  CGAffineTransform v149;
  CGAffineTransform v150;
  CGAffineTransform v151;
  CGAffineTransform v152;
  CGAffineTransform v153;
  CGAffineTransform v154;
  CGAffineTransform t2;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  CGAffineTransform v162;
  _BYTE v163[128];
  _BYTE v164[128];
  _QWORD v165[3];
  CGRect v166;
  CGRect v167;

  v165[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "pushState");
  objc_msgSend(v10, "scale");
  v12 = v11;
  objc_msgSend(v8, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v124 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)obj = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v162.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v162.c = v124;
  v122 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v162.tx = v122;
  objc_msgSend(v10, "scale");
  v22 = v21;
  if (v10)
  {
    objc_msgSend(v10, "transform");
    v23 = *(double *)&v161;
    objc_msgSend(v10, "transform");
    v24 = *((double *)&v158 + 1);
  }
  else
  {
    v161 = 0u;
    v160 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v24 = 0.0;
    v23 = 0.0;
  }
  v25 = v23 / v22;
  v26 = v24 / v22;
  if (objc_msgSend(v8, "flipped") == 3)
  {
    *(_OWORD *)&t2.a = *(_OWORD *)obj;
    *(_OWORD *)&t2.c = v124;
    *(_OWORD *)&t2.tx = v122;
    CGAffineTransformTranslate(&v162, &t2, v22 * v25, v22 * v26);
    v154 = v162;
    CGAffineTransformScale(&t2, &v154, -1.0, -1.0);
    v162 = t2;
    v154 = t2;
    CGAffineTransformTranslate(&t2, &v154, -((v18 + v25) * v22), -((v20 + v26) * v22));
    v162 = t2;
    if (v10)
      objc_msgSend(v10, "transform");
    else
      memset(&v152, 0, sizeof(v152));
    CGAffineTransformTranslate(&v153, &v152, -v14, -v16);
    v151 = v153;
    v27 = &v151;
  }
  else if (objc_msgSend(v8, "flipped") == 1)
  {
    v154 = v162;
    CGAffineTransformTranslate(&t2, &v154, 0.0, v22 * v26);
    v162 = t2;
    v154 = t2;
    CGAffineTransformScale(&t2, &v154, 1.0, -1.0);
    v162 = t2;
    v154 = t2;
    CGAffineTransformTranslate(&t2, &v154, 0.0, -((v20 + v26) * v22));
    v162 = t2;
    if (v10)
      objc_msgSend(v10, "transform");
    else
      memset(&v149, 0, sizeof(v149));
    CGAffineTransformTranslate(&v150, &v149, v14, -v16);
    v148 = v150;
    v27 = &v148;
  }
  else if (objc_msgSend(v8, "flipped") == 2)
  {
    v154 = v162;
    CGAffineTransformTranslate(&t2, &v154, v22 * v25, 0.0);
    v162 = t2;
    v154 = t2;
    CGAffineTransformScale(&t2, &v154, -1.0, 1.0);
    v162 = t2;
    v154 = t2;
    CGAffineTransformTranslate(&t2, &v154, -((v18 + v25) * v22), 0.0);
    v162 = t2;
    if (v10)
      objc_msgSend(v10, "transform");
    else
      memset(&v146, 0, sizeof(v146));
    CGAffineTransformTranslate(&v147, &v146, -v14, v16);
    v145 = v147;
    v27 = &v145;
  }
  else
  {
    if (v10)
      objc_msgSend(v10, "transform");
    else
      memset(&v143, 0, sizeof(v143));
    CGAffineTransformTranslate(&v144, &v143, v14, v16);
    v142 = v144;
    v27 = &v142;
  }
  objc_msgSend(v10, "setTransform:", v27);
  if (v10)
    objc_msgSend(v10, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  t2 = v162;
  CGAffineTransformConcat(&v141, &t1, &t2);
  v139 = v141;
  objc_msgSend(v10, "setTransform:", &v139);
  objc_msgSend(v8, "bounds");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[ISCompositor maskImageForLayer:size:scale:resourceProvider:](self, "maskImageForLayer:size:scale:resourceProvider:", v8, v9, v32, v34, v12);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clipToMaskCGImage:inRect:", objc_msgSend(v36, "CGImage"), v29, v31, v33, v35);
  v37 = v10;
  v121 = v36;
  if (v36
    || (objc_msgSend(v8, "effect"), v38 = (void *)objc_claimAutoreleasedReturnValue(), v38, v39 = v37, v38))
  {
    v40 = (void *)MEMORY[0x1E0D3A7B0];
    objc_msgSend(v37, "scale");
    objc_msgSend(v40, "bitmapContextWithSize:scale:preset:", objc_msgSend(v37, "preset"), v33, v35, v41);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  v123 = v37;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "content");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = v8;
      objc_msgSend(v43, "content");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      objc_msgSend(v43, "content");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v9, "resourceNamed:", v46);
        v47 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        v59 = objc_opt_isKindOfClass();

        objc_msgSend(v43, "content");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v59 & 1) == 0)
        {
LABEL_51:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v39, "setFillColor:", v46);
            objc_msgSend(v39, "fillRect:", v29, v31, v33, v35);
            goto LABEL_81;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v165[0] = v46;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 1);
            v60 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (!objc_msgSend(v46, "conformsToProtocol:", &unk_1EEB98528))
            {
              v64 = (void *)MEMORY[0x1E0C9AA60];
              goto LABEL_64;
            }
            objc_msgSend(v46, "resourceStack");
            v60 = objc_claimAutoreleasedReturnValue();
          }
          v64 = (void *)v60;
LABEL_64:
          v116 = v46;
          v120 = v8;
          v66 = v43;
          objc_msgSend(v43, "backgroundColor", v116, v10);
          v67 = (void *)objc_claimAutoreleasedReturnValue();

          if (v67)
          {
            objc_msgSend(v43, "backgroundColor");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setFillColor:", v68);

            objc_msgSend(v39, "fillRect:", v29, v31, v33, v35);
          }
          v69 = objc_msgSend(v43, "acceptSymbol");
          v135 = 0u;
          v136 = 0u;
          v137 = 0u;
          v138 = 0u;
          obja = v64;
          v70 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v135, v164, 16);
          if (v70)
          {
            v71 = v70;
            v72 = v66;
            v73 = *(_QWORD *)v136;
            v74 = 0x1E0D3A000uLL;
            do
            {
              v75 = 0;
              v125 = v71;
              do
              {
                if (*(_QWORD *)v136 != v73)
                  objc_enumerationMutation(obja);
                v76 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * v75);
                objc_opt_class();
                if (v69 & 1 | ((objc_opt_isKindOfClass() & 1) == 0))
                {
                  LOBYTE(t2.a) = 0;
                  objc_msgSend(v72, "size");
                  -[ISCompositor scaledImageFromContent:size:scale:needsScaled:](self, "scaledImageFromContent:size:scale:needsScaled:", v76, &t2);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  v78 = v77;
                  if (v77)
                  {
                    v79 = v73;
                    v80 = self;
                    v81 = v9;
                    v82 = v74;
                    v83 = v72;
                    a_low = LOBYTE(t2.a);
                    v85 = objc_msgSend(v77, "CGImage");
                    if (a_low)
                      objc_msgSend(v39, "drawCGImage:inRect:", v85, v29, v31, v33, v35);
                    else
                      objc_msgSend(v39, "drawCGImage:centeredInRect:", v85, v29, v31, v33, v35);
                    v72 = v83;
                    v74 = v82;
                    v9 = v81;
                    self = v80;
                    v73 = v79;
                    v71 = v125;
                  }

                }
                ++v75;
              }
              while (v71 != v75);
              v71 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v135, v164, 16);
            }
            while (v71);
          }

          v10 = v118;
          v8 = v120;
          v46 = v117;
          goto LABEL_81;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          objc_msgSend(v46, "name");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "resourceNamed:", v65);
          v48 = objc_claimAutoreleasedReturnValue();

          goto LABEL_34;
        }
        objc_msgSend(v9, "resourceForKey:", v46);
        v47 = objc_claimAutoreleasedReturnValue();
      }
      v48 = v47;
LABEL_34:

      v46 = (void *)v48;
      goto LABEL_51;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = v8;
    objc_msgSend(v49, "text");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resourceNamed:", v46);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = v50;

      v46 = v51;
    }
    if (ISIsResourceKey(v46))
    {

      v46 = 0;
    }
    else if (v46)
    {
      objc_msgSend(v39, "pushState");
      objc_msgSend(v49, "color");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setStrokeColor:", v57);

      objc_msgSend(v49, "fontName");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "fontSize");
      objc_msgSend(v39, "drawText:fontName:fontSize:inRect:", v46, v58);

      objc_msgSend(v39, "popState");
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_82;
    v119 = v8;
    v52 = v8;
    objc_msgSend(v52, "symbol");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "resourceNamed:", v53);
      v54 = objc_claimAutoreleasedReturnValue();

      v53 = (void *)v54;
    }
    objc_opt_class();
    v55 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v56 = v53;
    else
      v56 = 0;
    v61 = objc_alloc_init(MEMORY[0x1E0D3A7F8]);
    objc_msgSend(v52, "fontSize");
    objc_msgSend(v61, "setPointSize:");
    objc_msgSend(v61, "setScale:", v12);
    objc_msgSend(v61, "setSymbolSize:", objc_msgSend(v52, "symbolSize"));
    objc_msgSend(v61, "setSymbolWeight:", objc_msgSend(v52, "symbolWeight"));
    v46 = v56;
    objc_msgSend(v56, "imageForDescriptor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      objc_msgSend(v39, "pushState");
      objc_msgSend(v52, "color");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setStrokeColor:", v63);

      objc_msgSend(v39, "drawSymbolImage:centeredInRect:", v62, v29, v31, v33, v35);
      objc_msgSend(v39, "popState");
    }

    v8 = v119;
    v10 = v55;
  }
LABEL_81:

LABEL_82:
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  objc_msgSend(v8, "sublayers");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v131, v163, 16);
  if (v87)
  {
    v88 = v87;
    v89 = *(_QWORD *)v132;
    do
    {
      for (i = 0; i != v88; ++i)
      {
        if (*(_QWORD *)v132 != v89)
          objc_enumerationMutation(v86);
        v91 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
        objc_msgSend(v39, "pushState");
        objc_msgSend(v39, "setBlendMode:", objc_msgSend(v91, "blendMode"));
        -[ISCompositor drawLayer:resourceProvider:inContext:](self, "drawLayer:resourceProvider:inContext:", v91, v9, v39);
        objc_msgSend(v39, "popState");
      }
      v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v131, v163, 16);
    }
    while (v88);
  }

  v92 = v123;
  if (v39 != v123)
  {
    objc_msgSend(v8, "effect");
    v93 = objc_claimAutoreleasedReturnValue();
    if (v93)
    {
      v94 = (void *)v93;
      objc_msgSend(v8, "superlayer");
      v95 = objc_claimAutoreleasedReturnValue();
      if (v95)
      {
        v96 = (void *)v95;
        v97 = -[ISCompositor canUseCoreImageForEffects](self, "canUseCoreImageForEffects");

        if (v97)
        {
          v98 = objc_alloc(MEMORY[0x1E0C9DDC8]);
          objc_msgSend(v39, "image");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = (void *)objc_msgSend(v98, "initWithCGImage:", objc_msgSend(v99, "CGImage"));

          objc_msgSend(v123, "pushState");
          objc_msgSend(v123, "bounds");
          v102 = v101;
          objc_msgSend(v123, "scale");
          v104 = v103 * v102;
          if (v10)
            objc_msgSend(v123, "transform");
          else
            memset(&v129, 0, sizeof(v129));
          t2.c = 0.0;
          t2.a = 1.0;
          t2.b = 0.0;
          *(_OWORD *)&t2.d = xmmword_1AA977330;
          t2.ty = v104;
          CGAffineTransformConcat(&v130, &v129, &t2);
          v128 = v130;
          objc_msgSend(v123, "setTransform:", &v128);
          objc_msgSend(v123, "imageFromRect:", v29, v31, v33, v35);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "popState");
          v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCGImage:", objc_msgSend(v105, "CGImage"));
          objc_msgSend(v8, "effect");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "filterWithBackgroundImage:inputImage:", v106, v100);
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          if (v108)
          {
            objc_msgSend(v108, "outputImage");
            v109 = objc_claimAutoreleasedReturnValue();

            memset(&t2, 0, sizeof(t2));
            CGAffineTransformMakeScale(&t2, v12, v12);
            v154 = t2;
            v166.origin.x = 0.0;
            v166.origin.y = 0.0;
            v166.size.width = v33;
            v166.size.height = v35;
            v167 = CGRectApplyAffineTransform(v166, &v154);
            x = v167.origin.x;
            y = v167.origin.y;
            width = v167.size.width;
            height = v167.size.height;
            -[ISCompositor sharedCIContext](self, "sharedCIContext");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = (const void *)objc_msgSend(v114, "createCGImage:fromRect:", v109, x, y, width, height);

            v92 = v123;
            if (v115)
            {
              objc_msgSend(v123, "drawCGImage:centeredInRect:", v115, v29, v31, v33, v35);
              CFRelease(v115);
            }
            v100 = (void *)v109;
            goto LABEL_105;
          }
        }
        else
        {
          v100 = 0;
        }
        v92 = v123;
LABEL_104:
        objc_msgSend(v39, "image");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "drawCGImage:centeredInRect:", objc_msgSend(v108, "CGImage"), v29, v31, v33, v35);
LABEL_105:

        goto LABEL_106;
      }

    }
    v100 = 0;
    goto LABEL_104;
  }
LABEL_106:
  objc_msgSend(v92, "popState");

}

@end
