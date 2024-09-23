@implementation TDVectorGlyphReader

- (void)dealloc
{
  objc_super v3;

  if (self->_svgDocument)
  {
    CGSVGDocumentRelease();
    self->_svgDocument = 0;
  }
  if (self->_drawingSymbol)
  {
    CGSVGDocumentRelease();
    self->_drawingSymbol = 0;
  }

  v3.receiver = self;
  v3.super_class = (Class)TDVectorGlyphReader;
  -[TDVectorGlyphReader dealloc](&v3, sel_dealloc);
}

- (TDVectorGlyphReader)initWithURL:(id)a3 error:(id *)a4
{
  return -[TDVectorGlyphReader initWithURL:platform:error:](self, "initWithURL:platform:error:", a3, CUICurrentPlatform(), a4);
}

- (TDVectorGlyphReader)initWithURL:(id)a3 platform:(int64_t)a4 error:(id *)a5
{
  TDVectorGlyphReader *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TDVectorGlyphReader;
  v8 = -[TDVectorGlyphReader init](&v14, sel_init);
  if (v8)
  {
    v8->_fileURL = (NSURL *)a3;
    v8->_platform = a4;
    v9 = CUICurrentPlatform();
    if ((unint64_t)(v9 - 3) <= 1)
      v8->_platform = v9;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", a3, 8, a5);
    if (!v10
      || (v11 = (void *)v10,
          v12 = -[TDVectorGlyphReader _commonInitWithData:platform:error:](v8, "_commonInitWithData:platform:error:", v10, a4, a5), v11, !v12))
    {

      return 0;
    }
  }
  return v8;
}

- (TDVectorGlyphReader)initWithData:(id)a3 error:(id *)a4
{
  return -[TDVectorGlyphReader initWithData:platform:error:](self, "initWithData:platform:error:", a3, CUICurrentPlatform(), a4);
}

- (TDVectorGlyphReader)initWithData:(id)a3 platform:(int64_t)a4 error:(id *)a5
{
  TDVectorGlyphReader *v6;
  TDVectorGlyphReader *v9;
  uint64_t v10;
  objc_super v12;

  v6 = self;
  if (!a3)
  {
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NULL data received by -[TDVectorGlyphReader initWithData:error:]"), a4);
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v10, *MEMORY[0x24BDD0FC8], 0));
    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)TDVectorGlyphReader;
  v9 = -[TDVectorGlyphReader init](&v12, sel_init);
  v6 = v9;
  if (v9
    && !-[TDVectorGlyphReader _commonInitWithData:platform:error:](v9, "_commonInitWithData:platform:error:", a3, a4, a5))
  {
LABEL_7:

    return 0;
  }
  return v6;
}

- (BOOL)_commonInitWithData:(id)a3 platform:(int64_t)a4 error:(id *)a5
{
  double v7;
  CGSVGDocument *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  uint64_t v15;

  self->_lock._os_unfair_lock_opaque = 0;
  v7 = 0.0;
  if ((unint64_t)a4 <= 5)
    v7 = dbl_226EC0800[a4];
  self->_defaultPointSize = v7;
  if (!a3)
  {
    if (self->_svgDocument)
      goto LABEL_5;
LABEL_17:
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to parse SVG Data from %@"), self->_fileURL);
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x24BDD0FC8], 0));
    NSLog(CFSTR("%@"), v15);
    return 0;
  }
  v8 = (CGSVGDocument *)CGSVGDocumentCreateFromData();
  self->_svgDocument = v8;
  if (!v8)
    goto LABEL_17;
LABEL_5:
  -[TDVectorGlyphReader _readSVGNodesError:](self, "_readSVGNodesError:", a5);
  if (!a5 || !*a5)
  {
    v9 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", CFSTR("Baseline-M"));
    v10 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", CFSTR("Capline-M"));
    if (v9)
    {
      if (v10)
      {
        if (CGSVGNodeGetType() == 2 && CGSVGNodeGetType() == 2)
        {
          CGSVGNodeGetBoundingBoxWithOptions();
          v12 = v11;
          CGSVGNodeGetBoundingBoxWithOptions();
          if (fabs(v12) != INFINITY && fabs(v13) != INFINITY)
            self->_sourcePointSize = round((v12 - v13) / 0.704589844);
        }
      }
    }
    if (self->_sourcePointSize >= 0.00000011920929)
      return 1;
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Symbol image file has too small a point size"), *MEMORY[0x24BDD0FC8], 0));
    NSLog(CFSTR("%@"), CFSTR("Symbol image file has too small a point size"));
  }
  return 0;
}

- (BOOL)_readSVGNodesError:(id *)a3
{
  id v4;
  NSDictionary *v5;
  id v6;
  id v7;
  NSDictionary *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  float v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t ChildWithStringIdentifier;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  uint64_t v26;
  uint64_t ChildCount;
  BOOL v28;
  char v29;
  NSDictionary *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (self->_vectorGlyphNodes && self->_vectorGlyphRotateAnchorNodes)
    return 1;
  v4 = objc_alloc(MEMORY[0x24BDBCED8]);
  if (__CUIVectorGlyphNodeIDs_onceToken != -1)
    dispatch_once(&__CUIVectorGlyphNodeIDs_onceToken, &__block_literal_global_309);
  v5 = (NSDictionary *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend((id)__CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs, "count"));
  v6 = objc_alloc(MEMORY[0x24BDBCED8]);
  if (__CUIVectorGlyphNodeIDs_onceToken != -1)
    dispatch_once(&__CUIVectorGlyphNodeIDs_onceToken, &__block_literal_global_309);
  v32 = (NSDictionary *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend((id)__CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs, "count"));
  v7 = objc_alloc(MEMORY[0x24BDBCED8]);
  if (CUIVectorGlyphGuideIDs_onceToken != -1)
    dispatch_once(&CUIVectorGlyphGuideIDs_onceToken, &__block_literal_global_310);
  v8 = (NSDictionary *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend((id)CUIVectorGlyphGuideIDs__CUIVectorGlyphGuideIDs, "count"));
  if (self->_svgDocument)
  {
    CGSVGDocumentGetRootNode();
    if (CGSVGNodeFindChildWithStringIdentifier()
      && CGSVGNodeGetType() == 2
      && CGSVGShapeNodeGetPrimitive() == 10001)
    {
      v9 = (id)CGSVGShapeNodeCopyText();
      v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("Template v."));
      if (v11)
      {
        v12 = (void *)objc_msgSend(v9, "substringFromIndex:", v10 + v11);

        v9 = v12;
      }
      objc_msgSend(v9, "floatValue");
      if (((LODWORD(v13) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E)
        self->_templateVersion = v13;

    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    if (__CUIVectorGlyphNodeIDs_onceToken != -1)
      dispatch_once(&__CUIVectorGlyphNodeIDs_onceToken, &__block_literal_global_309);
    v14 = (void *)__CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs;
    v15 = objc_msgSend((id)__CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          ChildWithStringIdentifier = CGSVGNodeFindChildWithStringIdentifier();
          if (ChildWithStringIdentifier)
          {
            -[NSDictionary setObject:forKey:](v5, "setObject:forKey:", ChildWithStringIdentifier, v18);
            if (self->_templateVersion >= 6.0)
            {
              objc_msgSend(v18, "stringByAppendingString:", CFSTR("-rotate-anchor"));
              v20 = CGSVGNodeFindChildWithStringIdentifier();
              if (v20)
                -[NSDictionary setObject:forKey:](v32, "setObject:forKey:", v20, v18);
            }
          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v15);
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    if (CUIVectorGlyphGuideIDs_onceToken != -1)
      dispatch_once(&CUIVectorGlyphGuideIDs_onceToken, &__block_literal_global_310);
    v21 = (void *)CUIVectorGlyphGuideIDs__CUIVectorGlyphGuideIDs;
    v22 = objc_msgSend((id)CUIVectorGlyphGuideIDs__CUIVectorGlyphGuideIDs, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v21);
          v25 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
          v26 = CGSVGNodeFindChildWithStringIdentifier();
          if (v26)
            -[NSDictionary setObject:forKey:](v8, "setObject:forKey:", v26, v25);
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v22);
    }
    if (self->_templateVersion >= 5.0 && CGSVGNodeFindChildWithStringIdentifier())
    {
      ChildCount = CGSVGNodeGetChildCount();
      v33 = 0;
      v34 = &v33;
      v35 = 0x2020000000;
      v28 = CGSVGNodeGetType() != 1 || ChildCount == 0;
      v29 = !v28;
      v36 = v29;
      if (!v28)
      {
        CGSVGNodeEnumerate();
        if (*((_BYTE *)v34 + 24))
          self->_layerTreeNode = (CGSVGNode *)CGSVGNodeRetain();
      }
      _Block_object_dispose(&v33, 8);
    }
  }
  self->_vectorGlyphNodes = v5;
  self->_vectorGlyphRotateAnchorNodes = v32;
  self->_guideNodes = v8;
  -[TDVectorGlyphReader _calcInterpolatability](self, "_calcInterpolatability");
  if (-[TDVectorGlyphReader _validateVectorGlyphsWithError:](self, "_validateVectorGlyphsWithError:", a3))
    return 1;
  -[NSDictionary removeAllObjects](v5, "removeAllObjects");
  -[NSDictionary removeAllObjects](v32, "removeAllObjects");
  -[NSDictionary removeAllObjects](v8, "removeAllObjects");
  return 0;
}

uint64_t __42__TDVectorGlyphReader__readSVGNodesError___block_invoke(uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  uint64_t v5;

  if (!a3)
  {
    v5 = result;
    result = CGSVGNodeGetType();
    if ((_DWORD)result != 1)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)_validateVectorGlyphsWithError:(id *)a3
{
  float templateVersion;
  _QWORD *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSDictionary *guideNodes;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  id v35;
  BOOL v36;
  id v37;
  id v38;
  BOOL v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  NSDictionary *vectorGlyphNodes;
  id v51;
  _QWORD *v52;
  float v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t *v57;
  void *v58;
  id v59;
  BOOL v60;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  _QWORD v71[6];
  _QWORD v72[6];
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  void (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  uint64_t v78;

  v73 = 0;
  v74 = &v73;
  v75 = 0x3052000000;
  v76 = __Block_byref_object_copy_;
  v77 = __Block_byref_object_dispose_;
  v78 = 0;
  templateVersion = self->_templateVersion;
  v5 = (_QWORD *)MEMORY[0x24BDD0FC8];
  if (templateVersion <= 6.0)
  {
    v6 = 1;
    while (1)
    {
      v7 = -[TDVectorGlyphReader _caplineNodeIDForGlyphSize:](self, "_caplineNodeIDForGlyphSize:", v6);
      v8 = -[TDVectorGlyphReader _baselineNodeIDForGlyphSize:](self, "_baselineNodeIDForGlyphSize:", v6);
      v9 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v8);
      v10 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v7);
      if (!v9)
      {
        v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Symbol image file '%@' is missing a baseline guide for %@ "), self->_fileURL, v8);
        v15 = objc_alloc(MEMORY[0x24BDD1540]);
        v16 = objc_msgSend(v15, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v14, *v5));
        goto LABEL_10;
      }
      if (!v10)
        break;
      if (++v6 == 4)
        goto LABEL_11;
    }
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Symbol image file '%@' is missing a capline guide for %@ "), self->_fileURL, v7);
    v18 = objc_alloc(MEMORY[0x24BDD1540]);
    v16 = objc_msgSend(v18, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v17, *v5));
LABEL_10:
    v74[5] = v16;
LABEL_11:
    guideNodes = self->_guideNodes;
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __54__TDVectorGlyphReader__validateVectorGlyphsWithError___block_invoke;
    v72[3] = &unk_24EF2BAF8;
    v72[4] = self;
    v72[5] = &v73;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](guideNodes, "enumerateKeysAndObjectsUsingBlock:", v72);
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Template format %.1f is newer than the version that this software supports (%.1f)"), templateVersion, 0x4018000000000000);
    v12 = objc_alloc(MEMORY[0x24BDD1540]);
    v13 = objc_msgSend(v12, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v11, *v5));
    v74[5] = v13;
  }
  if (self->_templateVersion < 3.0)
    goto LABEL_79;
  v20 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", 1, 1, 4);
  v21 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", 1, 1, 5);
  v22 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v20);
  v69 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v21);
  v23 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", 4, 1, 4);
  v24 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", 4, 1, 5);
  v25 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v23);
  v26 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v24);
  v27 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", 9, 1, 4);
  v28 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", 9, 1, 5);
  v29 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v27);
  v30 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v28);
  v31 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", 4, 2, 4);
  v32 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", 4, 2, 5);
  v68 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v31);
  v67 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v32);
  v66 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", CFSTR("left-margin"));
  v65 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", CFSTR("right-margin"));
  if (!self->_isInterpolatable)
  {
    if (v68 && v67 || v66 && v65)
    {
      v40 = 2;
    }
    else
    {
      if (!v25 || !v26)
        goto LABEL_77;
      v40 = 1;
    }
    v41 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 4, v40));
LABEL_43:
    if (v41)
      goto LABEL_79;
    v38 = v22;
    v39 = 1;
    v36 = 1;
    goto LABEL_45;
  }
  if (v22 && v69 && v25 && v26 && v29 && v30)
  {
    v33 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 1, 1));
    v34 = v33 != 0;
    v35 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 4, 1));
    v36 = v35 != 0;
    v37 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 9, 1));
    v38 = v22;
    v39 = v37 != 0;
    if (v33 && v35 && v37)
      goto LABEL_79;
    goto LABEL_46;
  }
  if (v22 || v69 || !v25 || !v26 || v29 || v30)
  {
    if (v68 && v67 || v66 && v65)
    {
      v41 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 4, 2));
      goto LABEL_43;
    }
LABEL_77:
    v48 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Symbol image file '%@' is missing margin guides: interpolatable margins on Ultralight-S, Regular-S, and Black-S, or fixed margins on Regular-M or Regular-S are required."), self->_fileURL);
    v49 = objc_alloc(MEMORY[0x24BDD1540]);
    v47 = objc_msgSend(v49, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v48, *MEMORY[0x24BDD0FC8]));
LABEL_78:
    v74[5] = v47;
    goto LABEL_79;
  }
  if (-[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 4, 1)))
  {
    goto LABEL_79;
  }
  v38 = 0;
  v36 = 0;
  v39 = 1;
LABEL_45:
  v34 = 1;
LABEL_46:
  if (v38 && v69 && v25 && v26 && v29 && v30)
  {
    v42 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Symbol image file '%@' has interpolatable margin guides for missing glyphs: margins on Ultralight-S, Regular-S, and Black-S but"), self->_fileURL);
    if (!v34)
      v42 = (void *)objc_msgSend(v42, "stringByAppendingString:", CFSTR(" Ultralight-S"));
    if (!v36)
      v42 = (void *)objc_msgSend(v42, "stringByAppendingString:", CFSTR(" Regular-S"));
    if (!v39)
      v42 = (void *)objc_msgSend(v42, "stringByAppendingString:", CFSTR(" Black-S"));
    v43 = objc_msgSend(v42, "stringByAppendingString:", CFSTR(" glyphs are missing."));
    goto LABEL_72;
  }
  if (!v38 && !v69 && v25 && v26 && !v29 && !v30)
  {
    v44 = CFSTR("Symbol image file '%@' has fixed margin guides for a glyph which is absent: fixed margins found for Regular-S but no corresponding glyph exists.");
LABEL_71:
    v43 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v44, self->_fileURL);
LABEL_72:
    v45 = v43;
    if (!v43)
      goto LABEL_79;
    v46 = objc_alloc(MEMORY[0x24BDD1540]);
    v47 = objc_msgSend(v46, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v45, *MEMORY[0x24BDD0FC8]));
    goto LABEL_78;
  }
  if (v68 && v67 || v66 && v65)
  {
    v44 = CFSTR("Symbol image file '%@' has fixed margin guides for a glyph which is absent: fixed margins found for Regular-M but no corresponding glyph exists.");
    goto LABEL_71;
  }
LABEL_79:
  if (templateVersion <= 6.0)
  {
    vectorGlyphNodes = self->_vectorGlyphNodes;
    v71[0] = MEMORY[0x24BDAC760];
    v71[1] = 3221225472;
    v71[2] = __54__TDVectorGlyphReader__validateVectorGlyphsWithError___block_invoke_2;
    v71[3] = &unk_24EF2BAF8;
    v71[4] = self;
    v71[5] = &v73;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](vectorGlyphNodes, "enumerateKeysAndObjectsUsingBlock:", v71);
  }
  v51 = -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 4, 2);
  v52 = (_QWORD *)MEMORY[0x24BDD0FC8];
  if (!-[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", v51))
  {
    -[TDVectorGlyphReader templateVersion](self, "templateVersion");
    if (v53 < 3.0
      || (v62 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 1, 1)), v63 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 4, 1)), v64 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 9, 1)), !v62)|| !v63|| !v64|| !CUISVGNodeCanBeRepresentedAsPath()|| !CUISVGNodeCanBeRepresentedAsPath()|| (CUISVGNodeCanBeRepresentedAsPath() & 1) == 0)
    {
      v54 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Symbol image file '%@' must have a glyph for Regular weight Medium size"), self->_fileURL);
      v55 = objc_alloc(MEMORY[0x24BDD1540]);
      v56 = objc_msgSend(v55, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v54, *v52));
      v74[5] = v56;
    }
  }
  v57 = v74;
  v58 = (void *)v74[5];
  if (v58)
  {
    if (a3)
    {
      *a3 = v58;
      v58 = (void *)v57[5];
    }
    NSLog(CFSTR("%@"), objc_msgSend((id)objc_msgSend(v58, "userInfo"), "objectForKey:", *v52));
    v59 = (id)v74[5];
    v60 = 0;
  }
  else
  {
    v60 = templateVersion <= 6.0;
  }
  _Block_object_dispose(&v73, 8);
  return v60;
}

uint64_t __54__TDVectorGlyphReader__validateVectorGlyphsWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v8;
  id v9;

  result = CGSVGNodeGetType();
  if ((_DWORD)result != 2)
  {
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Symbol image file '%@' has guide object %@ of the wrong type, it must be a shape"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), a2);
    v9 = objc_alloc(MEMORY[0x24BDD1540]);
    result = objc_msgSend(v9, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v8, *MEMORY[0x24BDD0FC8]));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

uint64_t __54__TDVectorGlyphReader__validateVectorGlyphsWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t Type;
  double v9;
  double v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  Type = CGSVGNodeGetType();
  if ((_DWORD)Type != 1)
  {
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Symbol image file '%@' has glyph node %@ that is not a group got type:'%d' expected:'%d'"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), a2, Type, 1);
LABEL_10:
    v13 = v12;
    v14 = objc_alloc(MEMORY[0x24BDD1540]);
    result = objc_msgSend(v14, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v13, *MEMORY[0x24BDD0FC8]));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    goto LABEL_11;
  }
  if (!CGSVGNodeGetChildCount())
  {
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Symbol image file '%@' has glyph node %@ that contains no content"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), a2, v15, v16);
    goto LABEL_10;
  }
  CGSVGNodeGetBoundingBoxWithOptions();
  if (v10 <= 0.0 || v9 <= 0.0)
  {
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Symbol image file '%@' has glyph node %@ that is zero size width || height"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), a2, v15, v16);
    goto LABEL_10;
  }
  result = __ValidateGlyphNode(a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if ((result & 1) == 0)
LABEL_11:
    *a4 = 1;
  return result;
}

- (unint64_t)numberOfVectorGlyphs
{
  os_unfair_lock_s *p_lock;
  NSDictionary *vectorGlyphNodes;
  unint64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  vectorGlyphNodes = self->_vectorGlyphNodes;
  if (!vectorGlyphNodes)
  {
    -[TDVectorGlyphReader _readSVGNodesError:](self, "_readSVGNodesError:", 0);
    vectorGlyphNodes = self->_vectorGlyphNodes;
  }
  v5 = -[NSDictionary count](vectorGlyphNodes, "count");
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (double)_sourcePointSize
{
  return self->_sourcePointSize;
}

- (double)defaultPointSize
{
  return self->_defaultPointSize;
}

- (id)_glyphNodeIDForWeight:(int64_t)a3 size:(int64_t)a4
{
  int64_t v4;
  __CFString **v5;

  switch(a4)
  {
    case 3:
      v4 = a3 - 1;
      if ((unint64_t)(a3 - 1) < 9)
      {
        v5 = off_24EF2BE00;
        return v5[v4];
      }
      break;
    case 2:
      v4 = a3 - 1;
      if ((unint64_t)(a3 - 1) < 9)
      {
        v5 = off_24EF2BDB8;
        return v5[v4];
      }
      break;
    case 1:
      v4 = a3 - 1;
      if ((unint64_t)(a3 - 1) < 9)
      {
        v5 = off_24EF2BD70;
        return v5[v4];
      }
      break;
  }
  return 0;
}

- (id)_baselineNodeIDForGlyphSize:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return off_24EF2BE48[a3 - 1];
}

- (id)_caplineNodeIDForGlyphSize:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return off_24EF2BE60[a3 - 1];
}

- (id)_marginNodeIDForWeight:(int64_t)a3 size:(int64_t)a4 direction:(int64_t)a5
{
  id v6;
  __CFString *v7;

  v6 = -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", a3, a4);
  if (!v6)
    return 0;
  if (a5 == 4)
  {
    v7 = CFSTR("left-margin");
    return (id)-[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR("-%@"), v6);
  }
  if (a5 != 5)
    return 0;
  v7 = CFSTR("right-margin");
  return (id)-[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", CFSTR("-%@"), v6);
}

- (CGSVGDocument)vectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4 error:(id *)a5
{
  float templateVersion;
  os_unfair_lock_s *p_lock;
  uint64_t v11;
  uint64_t v12;
  CGSVGDocument *v13;
  uint64_t v14;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat a;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  CGFloat tx;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  CGFloat v37;
  uint64_t Attribute;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  int Transform;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  id v51;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGFloat MidY;
  uint64_t v58;
  CGFloat v59;
  CGFloat v60;
  NSMutableDictionary *vectorGlyphWithWeightSize;
  double v62;
  uint64_t v63;
  os_unfair_lock_s *v64;
  double v65;
  double v66;
  id v67;
  double v68;
  CGFloat ty;
  double v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t, uint64_t, int);
  void *v78;
  void *v79;
  BOOL v80;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v83;
  CGAffineTransform v84;
  _BYTE v85[128];
  uint64_t v86;
  CGRect v87;
  CGRect v88;

  v86 = *MEMORY[0x24BDAC8D0];
  templateVersion = self->_templateVersion;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)(a3 - 1) > 8 || (unint64_t)(a4 - 1) > 2)
  {
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s called with invalid weight %d or invalid size %d for file '%@'"), "-[TDVectorGlyphReader vectorGlyphWithWeight:size:error:]", a3, a4, self->_fileURL);
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v14, *MEMORY[0x24BDD0FC8], 0));
    NSLog(CFSTR("%@"), v14);
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.%d"), a3, a4);
  v12 = -[NSMutableDictionary objectForKey:](self->_vectorGlyphWithWeightSize, "objectForKey:", v11);
  if (!v12)
  {
    if (!self->_vectorGlyphNodes && !-[TDVectorGlyphReader _readSVGNodesError:](self, "_readSVGNodesError:", a5))
    {
      os_unfair_lock_unlock(p_lock);
      return 0;
    }
    v16 = -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", a3, a4);
    if (!-[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", v16)
      && (!-[TDVectorGlyphReader isInterpolatableForWeight:size:](self, "isInterpolatableForWeight:size:", a3, a4)
       || !-[TDVectorGlyphReader interpolatedSymbolForWeight:size:](self, "interpolatedSymbolForWeight:size:", a3, a4)))
    {
      goto LABEL_8;
    }
    memset(&v84, 0, sizeof(v84));
    -[TDVectorGlyphReader defaultPointSize](self, "defaultPointSize");
    v18 = v17;
    -[TDVectorGlyphReader _sourcePointSize](self, "_sourcePointSize");
    v20 = v18 / v19;
    if (self->_platform == 4)
      v20 = v20 * 0.94634;
    v70 = v20;
    CGAffineTransformMakeScale(&v83, v20, v20);
    a = v83.a;
    b = v83.b;
    c = v83.c;
    d = v83.d;
    tx = v83.tx;
    ty = v83.ty;
    CGSVGNodeGetBoundingBoxWithOptions();
    v27 = v26;
    v29 = v28;
    CGSVGDocumentGetRootNode();
    if (CGSVGNodeGetParent())
    {
      CGSVGNodeGetBoundingBoxWithOptions();
      v27 = v30;
      v29 = v31;
    }
    v67 = v16;
    v63 = v11;
    v64 = p_lock;
    t1.a = a;
    t1.b = b;
    t1.c = c;
    t1.d = d;
    t1.tx = tx;
    t1.ty = ty;
    CGAffineTransformTranslate(&v83, &t1, -v27, -v29);
    v33 = v83.a;
    v32 = v83.b;
    v35 = v83.c;
    v34 = v83.d;
    v37 = v83.tx;
    v36 = v83.ty;
    Attribute = CGSVGNodeFindAttribute();
    v39 = v36;
    v40 = v37;
    v41 = v34;
    v42 = v35;
    v43 = v32;
    v44 = v33;
    if (Attribute)
    {
      Transform = CGSVGAttributeGetTransform();
      v39 = v36;
      v40 = v37;
      v41 = v34;
      v42 = v35;
      v43 = v32;
      v44 = v33;
      if (Transform)
      {
        t1 = v84;
        t2.a = v33;
        t2.b = v32;
        t2.c = v35;
        t2.d = v34;
        t2.tx = v37;
        t2.ty = v36;
        CGAffineTransformConcat(&v83, &t1, &t2);
        v44 = v83.a;
        v43 = v83.b;
        v42 = v83.c;
        v41 = v83.d;
        v40 = v83.tx;
        v39 = v83.ty;
      }
    }
    v62 = v37;
    v83.a = v44;
    v83.b = v43;
    v83.c = v42;
    v83.d = v41;
    v83.tx = v40;
    v83.ty = v39;
    CGSVGAttributeCreateWithTransform();
    v13 = (CGSVGDocument *)CGSVGDocumentCreate();
    v46 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    objc_msgSend(v46, "addObject:", CFSTR("defaults"));
    v75 = MEMORY[0x24BDAC760];
    v76 = 3221225472;
    v77 = __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke;
    v78 = &unk_24EF2BB60;
    v80 = templateVersion >= 5.0;
    v79 = v46;
    CGSVGNodeEnumerate();
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v72 != v49)
            objc_enumerationMutation(v46);
          objc_msgSend(CFSTR("."), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i));
          if (CGSVGDocumentGetNamedStyle() && CGSVGAttributeMapCopy())
          {
            CGSVGDocumentAddNamedStyle();
            CGSVGAttributeMapRelease();
          }
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
      }
      while (v48);
    }
    CGSVGDocumentGetRootNode();
    CGSVGNodeCopy();
    CGSVGNodeSetAttribute();
    CGSVGAttributeRelease();
    CGSVGNodeSetStringIdentifier();
    CGSVGNodeAddChild();
    CGSVGNodeRelease();
    v51 = -[NSDictionary objectForKey:](self->_vectorGlyphRotateAnchorNodes, "objectForKey:", v67);
    t1.a = 0.0;
    t1.b = 0.0;
    if (v51)
    {
      CGSVGNodeGetBoundingBox();
      v68 = v32;
      x = v87.origin.x;
      y = v87.origin.y;
      v65 = v33;
      width = v87.size.width;
      v66 = v34;
      height = v87.size.height;
      MidX = CGRectGetMidX(v87);
      v88.origin.x = x;
      v88.origin.y = y;
      v88.size.width = width;
      v88.size.height = height;
      MidY = CGRectGetMidY(v88);
      t1.a = v62 + v35 * MidY + v65 * MidX;
      t1.b = v36 + v66 * MidY + v68 * MidX;
      v58 = v63;
      p_lock = v64;
    }
    else
    {
      v58 = v63;
      p_lock = v64;
      if (!-[TDVectorGlyphReader interpolatedRotateAnchorForWeight:size:scaleFactor:point:](self, "interpolatedRotateAnchorForWeight:size:scaleFactor:point:", a3, a4, &t1, v70))goto LABEL_39;
      CGSVGNodeGetBoundingBoxWithOptions();
      memset(&v83, 0, sizeof(v83));
      CGAffineTransformMakeTranslation(&v83, v59, v60);
      *(float64x2_t *)&t1.a = vaddq_f64(*(float64x2_t *)&v83.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v83.c, t1.b), *(float64x2_t *)&v83.a, t1.a));
    }
    CGSVGNodeCreate();
    CGSVGNodeSetStringIdentifier();
    CGSVGAttributeCreateWithFloat();
    CGSVGAttributeCreateWithFloat();
    CGSVGNodeSetAttribute();
    CGSVGNodeSetAttribute();
    CGSVGAttributeRelease();
    CGSVGAttributeRelease();
    CGSVGNodeAddChild();
    CGSVGNodeRelease();
LABEL_39:
    if (self->_layerTreeNode && templateVersion >= 5.0)
    {
      CGSVGNodeCopy();
      CGSVGNodeAddChild();
      CGSVGNodeSetStringIdentifier();
      CGSVGNodeRelease();
    }
    CGSVGNodeEnumerate();
    CGSVGNodeEnumerate();
    vectorGlyphWithWeightSize = self->_vectorGlyphWithWeightSize;
    if (!vectorGlyphWithWeightSize)
    {
      vectorGlyphWithWeightSize = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      self->_vectorGlyphWithWeightSize = vectorGlyphWithWeightSize;
    }
    -[NSMutableDictionary setObject:forKey:](vectorGlyphWithWeightSize, "setObject:forKey:", v13, v58);
    goto LABEL_9;
  }
  v13 = (CGSVGDocument *)v12;
  CGSVGDocumentRetain();
LABEL_9:
  os_unfair_lock_unlock(p_lock);
  return v13;
}

void __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  int Type;
  void *v5;
  id v6;

  if (!a3)
  {
    Type = CGSVGNodeGetType();
    if (Type == 2 || Type == 1 && *(_BYTE *)(a1 + 40))
    {
      if (CGSVGNodeFindAttribute())
      {
        v6 = (id)CGSVGAttributeCopyString();
        v5 = (void *)objc_msgSend((id)objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" ")), "mutableCopy");
        objc_msgSend(v5, "removeObjectsAtIndexes:", objc_msgSend(v5, "indexesOfObjectsPassingTest:", &__block_literal_global));
        objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);

      }
    }
  }
}

uint64_t __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("SFSymbolsPreview"));
}

uint64_t __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_3(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const void *v10;
  void *v11;
  uint64_t AttributeMap;
  uint64_t v13;
  _QWORD v14[18];

  if (!a3)
  {
    v14[10] = v6;
    v14[11] = v5;
    v14[16] = v3;
    v14[17] = v4;
    v7 = result;
    result = CGSVGNodeGetType();
    if ((_DWORD)result == 2 || (_DWORD)result == 1 && *(_BYTE *)(v7 + 32))
    {
      if (CGSVGNodeFindAttribute())
      {
        v8 = (void *)CGSVGAttributeCopyString();
        v9 = (void *)objc_msgSend((id)objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(" ")), "mutableCopy");
        objc_msgSend(v9, "removeObjectsAtIndexes:", objc_msgSend(v9, "indexesOfObjectsPassingTest:", &__block_literal_global_145));
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" "));
        v10 = (const void *)CGSVGAttributeCreateWithString();
        CGSVGNodeSetAttribute();

        CFRelease(v10);
      }
      v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      AttributeMap = CGSVGNodeGetAttributeMap();
      v13 = MEMORY[0x24BDAC760];
      v14[5] = MEMORY[0x24BDAC760];
      v14[6] = 3221225472;
      v14[7] = __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_5;
      v14[8] = &unk_24EF2BBA8;
      v14[9] = v11;
      CGSVGAttributeMapEnumerate();
      v14[0] = v13;
      v14[1] = 3221225472;
      v14[2] = __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_6;
      v14[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
      v14[4] = AttributeMap;
      return objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);
    }
  }
  return result;
}

uint64_t __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("SFSymbolsPreview"));
}

void __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_5(uint64_t a1)
{
  id v2;

  v2 = (id)CGSVGAtomCopyString();
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("-sfsymbols-")))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

uint64_t __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_6()
{
  CGSVGAtomFromString();
  return CGSVGAttributeMapRemoveAttribute();
}

uint64_t __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_7(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  if (!a3)
  {
    result = CGSVGNodeGetType();
    if ((_DWORD)result == 2)
    {
      result = CGSVGNodeGetAttributeMap();
      if (result)
      {
        result = CGSVGAttributeMapGetAttribute();
        if (result)
          return CGSVGAttributeGetFloat();
      }
    }
  }
  return result;
}

- (BOOL)vectorGlyphExistsWithWeight:(int64_t)a3 size:(int64_t)a4 error:(id *)a5
{
  os_unfair_lock_s *p_lock;
  BOOL v10;
  uint64_t v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)(a3 - 1) > 8 || (unint64_t)(a4 - 1) > 2)
  {
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s called with invalid weight %d or invalid size %d for file '%@'"), "-[TDVectorGlyphReader vectorGlyphExistsWithWeight:size:error:]", a3, a4, self->_fileURL);
    if (a5)
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x24BDD0FC8], 0));
    NSLog(CFSTR("%@"), v11);
    v10 = 0;
  }
  else
  {
    if (!self->_vectorGlyphNodes)
      -[TDVectorGlyphReader _readSVGNodesError:](self, "_readSVGNodesError:", a5);
    v10 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", a3, a4)) != 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (double)baselineForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat MidY;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double result;
  CGRect v48;
  CGRect v49;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)(a3 - 1) > 8)
  {
    NSLog(CFSTR("%s called with invalid weight %d or invalid size %d file '%@'"), "-[TDVectorGlyphReader baselineForVectorGlyphWithWeight:size:]", a3, a4, self->_fileURL);
    v20 = 0.0;
  }
  else
  {
    v8 = -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", a3, a4);
    v9 = -[TDVectorGlyphReader _baselineNodeIDForGlyphSize:](self, "_baselineNodeIDForGlyphSize:", a4);
    v10 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", v8);
    v11 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v9);
    -[TDVectorGlyphReader defaultPointSize](self, "defaultPointSize");
    v13 = v12;
    -[TDVectorGlyphReader _sourcePointSize](self, "_sourcePointSize");
    v15 = v14;
    if (v10 && v11 && CGSVGNodeGetType() == 2)
    {
      CGSVGNodeGetBoundingBoxWithOptions();
      v17 = v16;
      v19 = v18;
      CGSVGNodeGetBoundingBoxWithOptions();
      v20 = v13 * ((v17 + v19 - CGRectGetMidY(v48)) / v15);
    }
    else
    {
      v20 = 0.0;
      if (self->_isInterpolatable)
      {
        v21 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 1, 1));
        v22 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 4, 1));
        v23 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 9, 1));
        v24 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", -[TDVectorGlyphReader _baselineNodeIDForGlyphSize:](self, "_baselineNodeIDForGlyphSize:", 1));
        if (v21)
        {
          if (v22 && v23 && v24 && CGSVGNodeGetType() == 2)
          {
            CGSVGNodeGetBoundingBoxWithOptions();
            v26 = v25;
            v28 = v27;
            CGSVGNodeGetBoundingBoxWithOptions();
            v30 = v29;
            v32 = v31;
            CGSVGNodeGetBoundingBoxWithOptions();
            v34 = v33;
            v36 = v35;
            CGSVGNodeGetBoundingBoxWithOptions();
            MidY = CGRectGetMidY(v49);
            v38 = v13 * ((v26 + v28 - MidY) / v15);
            v39 = v13 * ((v30 + v32 - MidY) / v15);
            v40 = v13 * ((v34 + v36 - MidY) / v15);
            objc_msgSend(MEMORY[0x24BE28CB0], "scalarsForGlyphWeight:glyphSize:", a3, a4);
            v42 = v41;
            v44 = v43;
            objc_msgSend(MEMORY[0x24BE28CB0], "transformForGlyphSize:", a4);
            v20 = v46 * (v39 + (v38 - v39) * v42 + (v40 - v39) * v44) - v13 * v45;
          }
        }
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  result = v20 * 0.94634;
  if (self->_platform != 4)
    return v20;
  return result;
}

- (double)capHeightForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double result;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)(a3 - 1) > 8)
  {
    NSLog(CFSTR("%s called with invalid weight %d or invalid size %d file '%@"), "-[TDVectorGlyphReader capHeightForVectorGlyphWithWeight:size:]", a3, a4, self->_fileURL);
    v16 = 0.0;
  }
  else
  {
    v8 = -[TDVectorGlyphReader _caplineNodeIDForGlyphSize:](self, "_caplineNodeIDForGlyphSize:", a4);
    v9 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", -[TDVectorGlyphReader _baselineNodeIDForGlyphSize:](self, "_baselineNodeIDForGlyphSize:", a4));
    v10 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v8);
    if (!v9 || (v11 = v10) == 0)
    {
      v12 = -[TDVectorGlyphReader _caplineNodeIDForGlyphSize:](self, "_caplineNodeIDForGlyphSize:", 1);
      v9 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", -[TDVectorGlyphReader _baselineNodeIDForGlyphSize:](self, "_baselineNodeIDForGlyphSize:", 1));
      v11 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v12);
    }
    -[TDVectorGlyphReader defaultPointSize](self, "defaultPointSize");
    v14 = v13;
    -[TDVectorGlyphReader _sourcePointSize](self, "_sourcePointSize");
    v16 = 0.0;
    if (v9)
    {
      if (v11)
      {
        v17 = v15;
        if (CGSVGNodeGetType() == 2 && CGSVGNodeGetType() == 2)
        {
          CGSVGNodeGetBoundingBoxWithOptions();
          v19 = v18;
          CGSVGNodeGetBoundingBoxWithOptions();
          if (fabs(v19) == INFINITY || fabs(v20) == INFINITY)
            NSLog(CFSTR("%s got invalid baseline and capline bounding boxes for file '%@ weight %d or invalid size %d "), "-[TDVectorGlyphReader capHeightForVectorGlyphWithWeight:size:]", self->_fileURL, a3, a4);
          else
            v16 = v14 * ((v19 - v20) / v17);
        }
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  result = v16 * 0.94634;
  if (self->_platform != 4)
    return v16;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)alignmentRectInsetsForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  char v24;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v24 = 0;
  -[TDVectorGlyphReader _fixedAlignmentRectInsetsForVectorGlyphWithWeight:size:foundExactMargins:](self, "_fixedAlignmentRectInsetsForVectorGlyphWithWeight:size:foundExactMargins:", a3, a4, &v24);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (CUIEdgeInsetsValid())
  {
    if (!self->_isInterpolatable || v24 != 0)
      goto LABEL_11;
  }
  else if (!self->_isInterpolatable)
  {
    -[TDVectorGlyphReader defaultPointSize](self, "defaultPointSize");
    CUIEdgeInsetsMake();
    goto LABEL_10;
  }
  -[TDVectorGlyphReader _interpolatedAlignmentRectInsetsForVectorGlyphWithWeight:size:](self, "_interpolatedAlignmentRectInsetsForVectorGlyphWithWeight:size:", a3, a4);
LABEL_10:
  v8 = v16;
  v10 = v17;
  v12 = v18;
  v14 = v19;
LABEL_11:
  if (self->_platform == 4)
  {
    v10 = v10 * 0.94634;
    v12 = v12 * 0.94634;
    v14 = v14 * 0.94634;
    v8 = v8 * 0.94634;
  }
  v20 = v8;
  v21 = v10;
  v22 = v12;
  v23 = v14;
  result.var3 = v23;
  result.var2 = v22;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_interpolatedAlignmentRectInsetsForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
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
  BOOL v25;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  char v44;
  __int16 v45;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v45 = 0;
  v44 = 0;
  -[TDVectorGlyphReader _fixedAlignmentRectInsetsForVectorGlyphWithWeight:size:foundExactMargins:](self, "_fixedAlignmentRectInsetsForVectorGlyphWithWeight:size:foundExactMargins:", 1, 1, (char *)&v45 + 1);
  v8 = v7;
  v42 = v9;
  v43 = v10;
  v12 = v11;
  -[TDVectorGlyphReader _fixedAlignmentRectInsetsForVectorGlyphWithWeight:size:foundExactMargins:](self, "_fixedAlignmentRectInsetsForVectorGlyphWithWeight:size:foundExactMargins:", 4, 1, &v45);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[TDVectorGlyphReader _fixedAlignmentRectInsetsForVectorGlyphWithWeight:size:foundExactMargins:](self, "_fixedAlignmentRectInsetsForVectorGlyphWithWeight:size:foundExactMargins:", 9, 1, &v44);
  if (HIBYTE(v45))
    v25 = v45 == 0;
  else
    v25 = 1;
  if (!v25 && v44 != 0)
  {
    v27 = v22;
    v28 = v24;
    v41 = v23;
    v39 = v21;
    objc_msgSend(MEMORY[0x24BE28CB0], "scalarsForGlyphWeight:glyphSize:", a3, a4);
    v40 = v12;
    v30 = v29;
    v38 = v8;
    v32 = v31;
    objc_msgSend(MEMORY[0x24BE28CB0], "transformForGlyphSize:", a4);
    v16 = (v16 + (v42 - v16) * v30 + (v27 - v16) * v32) * v33;
    v20 = (v20 + (v43 - v20) * v30 + (v28 - v20) * v32) * v33;
    v14 = (v14 + (v38 - v14) * v30 + (v39 - v14) * v32) * v33;
    v18 = (v18 + (v40 - v18) * v30 + (v41 - v18) * v32) * v33;
  }
  v34 = v14;
  v35 = v16;
  v36 = v18;
  v37 = v20;
  result.var3 = v37;
  result.var2 = v36;
  result.var1 = v35;
  result.var0 = v34;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_fixedAlignmentRectInsetsForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4 foundExactMargins:(BOOL *)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  os_unfair_lock_s *p_lock;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  CGFloat v27;
  CGFloat v28;
  double height;
  __int128 v30;
  double v31;
  CGFloat x;
  CGFloat y;
  __int128 v34;
  double width;
  float v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  double rect;
  CGAffineTransform v54;
  CGAffineTransform v55;
  double v56;
  uint64_t v57;
  double v58;
  double v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v9 = *MEMORY[0x24BE28B20];
  v10 = *(double *)(MEMORY[0x24BE28B20] + 8);
  v11 = *(double *)(MEMORY[0x24BE28B20] + 16);
  v12 = *(double *)(MEMORY[0x24BE28B20] + 24);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)(a3 - 1) <= 8)
  {
    v14 = -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", a3, a4);
    v15 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", a3, a4, 4);
    v16 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", a3, a4, 5);
    v17 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v15);
    v18 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v16);
    v19 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", v14);
    -[TDVectorGlyphReader defaultPointSize](self, "defaultPointSize");
    -[TDVectorGlyphReader _sourcePointSize](self, "_sourcePointSize");
    if (!v17)
      goto LABEL_7;
    if (v18 && v19)
    {
      if (a5)
        *a5 = 1;
    }
    else
    {
LABEL_7:
      v20 = -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 4, 2);
      v21 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", 4, 2, 4);
      v22 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", 4, 2, 5);
      v17 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v21);
      v18 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v22);
      v19 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", v20);
    }
    if (!v17 || !v18 || !v19)
    {
      v23 = -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 4, 1);
      v24 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", 4, 1, 4);
      v25 = -[TDVectorGlyphReader _marginNodeIDForWeight:size:direction:](self, "_marginNodeIDForWeight:size:direction:", 4, 1, 5);
      v17 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v24);
      v18 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", v25);
      v19 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", v23);
    }
    if (!v17 || !v18)
    {
      v26 = -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 4, 2);
      v17 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", CFSTR("left-margin"));
      v18 = -[NSDictionary objectForKey:](self->_guideNodes, "objectForKey:", CFSTR("right-margin"));
      v19 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", v26);
    }
    if (v17 && v18)
    {
      if (CGSVGShapeNodeGetPrimitive() == 32)
      {
        v58 = 0.0;
        v59 = 0.0;
        v57 = 0;
        v56 = 0.0;
        CGSVGShapeNodeGetLineGeometry();
        v27 = 0.0;
        v28 = 0.0;
        height = 0.0 - 0.0;
        CGSVGNodeGetParent();
        if (!CGSVGNodeFindAttribute())
        {
          v31 = 0.5;
LABEL_24:
          if (CGSVGShapeNodeGetPrimitive() == 32)
          {
            v58 = 0.0;
            v59 = 0.0;
            v57 = 0;
            v56 = 0.0;
            CGSVGShapeNodeGetLineGeometry();
            y = v58;
            x = v59;
            rect = v56 - v58;
            CGSVGNodeGetParent();
            if (!CGSVGNodeFindAttribute())
            {
              width = 0.5;
              goto LABEL_31;
            }
            v34 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
            *(_OWORD *)&v55.a = *MEMORY[0x24BDBD8B8];
            *(_OWORD *)&v55.c = v34;
            *(_OWORD *)&v55.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
            width = 0.5;
            if (!CGSVGAttributeGetTransform())
            {
LABEL_31:
              -[TDVectorGlyphReader templateVersion](self, "templateVersion");
              if (v36 >= 2.0)
              {
                if (v19)
                {
                  CGSVGNodeGetBoundingBoxWithOptions();
                  v51 = v38;
                  v52 = v37;
                  v49 = v40;
                  v50 = v39;
                  v66.origin.x = v28;
                  v66.origin.y = v27;
                  v66.size.width = v31;
                  v66.size.height = height;
                  if (!CGRectIsNull(v66))
                  {
                    v67.origin.y = v51;
                    v67.origin.x = v52;
                    v67.size.height = v49;
                    v67.size.width = v50;
                    CGRectGetMinX(v67);
                    v68.origin.x = v28;
                    v68.origin.y = v27;
                    v68.size.width = v31;
                    v68.size.height = height;
                    CGRectGetMinX(v68);
                  }
                  v69.origin.x = x;
                  v69.origin.y = y;
                  v69.size.width = width;
                  v69.size.height = rect;
                  if (!CGRectIsNull(v69))
                  {
                    v70.origin.x = x;
                    v70.origin.y = y;
                    v70.size.width = width;
                    v70.size.height = rect;
                    CGRectGetMinX(v70);
                    v71.origin.x = v52;
                    v71.origin.y = v51;
                    v71.size.height = v49;
                    v71.size.width = v50;
                    CGRectGetMaxX(v71);
                  }
                }
              }
              else
              {
                v64.origin.x = v28;
                v64.origin.y = v27;
                v64.size.width = v31;
                v64.size.height = height;
                CGRectIsEmpty(v64);
                v65.origin.x = x;
                v65.origin.y = y;
                v65.size.width = width;
                v65.size.height = rect;
                CGRectIsEmpty(v65);
              }
              CUIEdgeInsetsMake();
              v9 = v41;
              v10 = v42;
              v11 = v43;
              v12 = v44;
              goto LABEL_39;
            }
            v54 = v55;
            v62.size.width = 0.5;
            v62.origin.x = x;
            v62.origin.y = y;
            v62.size.height = rect;
            v63 = CGRectApplyAffineTransform(v62, &v54);
          }
          else
          {
            CGSVGNodeGetBoundingBoxWithOptions();
          }
          x = v63.origin.x;
          y = v63.origin.y;
          width = v63.size.width;
          rect = v63.size.height;
          goto LABEL_31;
        }
        v30 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
        *(_OWORD *)&v55.a = *MEMORY[0x24BDBD8B8];
        *(_OWORD *)&v55.c = v30;
        *(_OWORD *)&v55.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
        v31 = 0.5;
        if (!CGSVGAttributeGetTransform())
          goto LABEL_24;
        v54 = v55;
        v60.size.width = 0.5;
        v60.origin.x = 0.0;
        v60.origin.y = 0.0;
        v60.size.height = 0.0 - 0.0;
        v61 = CGRectApplyAffineTransform(v60, &v54);
      }
      else
      {
        CGSVGNodeGetBoundingBoxWithOptions();
      }
      v28 = v61.origin.x;
      v27 = v61.origin.y;
      v31 = v61.size.width;
      height = v61.size.height;
      goto LABEL_24;
    }
  }
LABEL_39:
  os_unfair_lock_unlock(p_lock);
  v45 = v9;
  v46 = v10;
  v47 = v11;
  v48 = v12;
  result.var3 = v48;
  result.var2 = v47;
  result.var1 = v46;
  result.var0 = v45;
  return result;
}

- (void)_calcInterpolatability
{
  id v3;
  id v4;
  id v5;

  if (self->_templateVersion >= 3.0)
  {
    v3 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 4, 1));
    v4 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 1, 1));
    v5 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 9, 1));
    if (v4)
    {
      if (v3
        && v5
        && CUISVGNodeCanBeRepresentedAsPath()
        && CUISVGNodeCanBeRepresentedAsPath())
      {
        if (CUISVGNodeCanBeRepresentedAsPath())
          self->_isInterpolatable = __nodesAreInterpolationCompatible((uint64_t)v4, (uint64_t)v3);
      }
    }
  }
}

- (BOOL)isInterpolatableForWeight:(int64_t)a3 size:(int64_t)a4
{
  if (!self->_vectorGlyphNodes)
    -[TDVectorGlyphReader _readSVGNodesError:](self, "_readSVGNodesError:", 0, a4);
  return self->_isInterpolatable;
}

- (CGSVGNode)interpolatedSymbolForWeight:(int64_t)a3 size:(int64_t)a4
{
  id v7;
  id v8;
  id v9;
  CGSVGNode *v10;
  uint64_t v11;
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

  if (!-[TDVectorGlyphReader isInterpolatableForWeight:size:](self, "isInterpolatableForWeight:size:"))
    return 0;
  v7 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 4, 1));
  v8 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 1, 1));
  v9 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 9, 1));
  v10 = 0;
  if (v8)
  {
    if (v7)
    {
      v11 = (uint64_t)v9;
      if (v9)
      {
        v10 = (CGSVGNode *)CGSVGNodeCopy();
        objc_msgSend(MEMORY[0x24BE28CB0], "scalarsForGlyphWeight:glyphSize:", a3, a4);
        v13 = v12;
        v15 = v14;
        objc_msgSend(MEMORY[0x24BE28CB0], "transformForGlyphSize:", a4);
        v17 = v16;
        v19 = v18;
        -[TDVectorGlyphReader defaultPointSize](self, "defaultPointSize");
        v21 = v20;
        -[TDVectorGlyphReader _sourcePointSize](self, "_sourcePointSize");
        __interpolateChildShapes(v13, v15, v17, v19, v21, (uint64_t)v10, (uint64_t)v8, (uint64_t)v7, v11);
        CFAutorelease(v10);
      }
    }
  }
  return v10;
}

+ (CGPoint)_anchorInOutlineCoordinateSpaceForAnchor:(CGSVGNode *)a3 glyph:(CGSVGNode *)a4
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MinY;
  double MidX;
  double v22;
  double v23;
  double MinX;
  CGPoint result;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  CGSVGNodeGetBoundingBoxWithOptions();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  CGSVGNodeGetBoundingBoxWithOptions();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  MinX = CGRectGetMinX(v26);
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  MinY = CGRectGetMinY(v27);
  v28.origin.x = v13;
  v28.origin.y = v15;
  v28.size.width = v17;
  v28.size.height = v19;
  MidX = CGRectGetMidX(v28);
  v29.origin.x = v13;
  v29.origin.y = v15;
  v29.size.width = v17;
  v29.size.height = v19;
  v22 = CGRectGetMidY(v29) - MinY;
  v23 = MidX - MinX;
  result.y = v22;
  result.x = v23;
  return result;
}

- (BOOL)interpolatedRotateAnchorForWeight:(int64_t)a3 size:(int64_t)a4 scaleFactor:(double)a5 point:(CGPoint *)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BOOL v20;
  BOOL v24;
  BOOL v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;

  v11 = -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 4, 1);
  v12 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", v11);
  v13 = -[NSDictionary objectForKey:](self->_vectorGlyphRotateAnchorNodes, "objectForKey:", v11);
  v14 = -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 1, 1);
  v15 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", v14);
  v16 = -[NSDictionary objectForKey:](self->_vectorGlyphRotateAnchorNodes, "objectForKey:", v14);
  v17 = -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", 9, 1);
  v18 = -[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", v17);
  v19 = -[NSDictionary objectForKey:](self->_vectorGlyphRotateAnchorNodes, "objectForKey:", v17);
  if (v15)
    v20 = v12 == 0;
  else
    v20 = 1;
  v24 = v20 || v18 == 0 || v13 == 0 || v16 == 0 || v19 == 0;
  v25 = !v24;
  if (!v24)
  {
    v26 = v19;
    objc_msgSend(MEMORY[0x24BE28CB0], "scalarsForGlyphWeight:glyphSize:", a3, a4);
    v28 = v27;
    v30 = v29;
    objc_msgSend(MEMORY[0x24BE28CB0], "transformForGlyphSize:", a4);
    v32 = v31;
    +[TDVectorGlyphReader _anchorInOutlineCoordinateSpaceForAnchor:glyph:](TDVectorGlyphReader, "_anchorInOutlineCoordinateSpaceForAnchor:glyph:", v16, v15);
    v34 = v33;
    v36 = v35;
    +[TDVectorGlyphReader _anchorInOutlineCoordinateSpaceForAnchor:glyph:](TDVectorGlyphReader, "_anchorInOutlineCoordinateSpaceForAnchor:glyph:", v13, v12);
    v38 = v37;
    v40 = v39;
    +[TDVectorGlyphReader _anchorInOutlineCoordinateSpaceForAnchor:glyph:](TDVectorGlyphReader, "_anchorInOutlineCoordinateSpaceForAnchor:glyph:", v26, v18);
    a6->x = v32 * (v38 + v28 * (v34 - v38) + v30 * (v41 - v38)) * a5;
    a6->y = v32 * (v40 + v28 * (v36 - v40) + v30 * (v42 - v40)) * a5;
  }
  return v25;
}

- (CGSize)canvasSizeForWeight:(int64_t)a3 size:(int64_t)a4
{
  double v4;
  double v5;
  CGSize result;

  if (-[TDVectorGlyphReader vectorGlyphWithWeight:size:error:](self, "vectorGlyphWithWeight:size:error:", a3, a4, 0))
  {
    CGSVGDocumentGetCanvasSize();
  }
  else
  {
    v4 = *MEMORY[0x24BDBF148];
    v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)containsWideGamutContent
{
  os_unfair_lock_s *p_lock;
  char v3;

  if (!self->_svgDocument)
    return 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v3 = CGSVGDocumentContainsWideGamutContent();
  os_unfair_lock_unlock(p_lock);
  return v3;
}

- (id)_layerNamesForRenderingMode:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  float templateVersion;
  uint64_t v8;
  _QWORD v10[12];
  BOOL v11;

  v5 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  if (self->_svgDocument)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    CGSVGDocumentGetRootNode();
    templateVersion = self->_templateVersion;
    v8 = MEMORY[0x24BDAC760];
    v10[6] = MEMORY[0x24BDAC760];
    v10[7] = 3221225472;
    v10[8] = __51__TDVectorGlyphReader__layerNamesForRenderingMode___block_invoke;
    v10[9] = &unk_24EF2BC30;
    v11 = templateVersion >= 5.0;
    v10[10] = a3;
    v10[11] = v5;
    CGSVGNodeEnumerate();
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __51__TDVectorGlyphReader__layerNamesForRenderingMode___block_invoke_2;
    v10[3] = &unk_24EF2BC58;
    v10[4] = a3;
    v10[5] = objc_msgSend(v5, "count");
    objc_msgSend(v5, "sortUsingComparator:", v10);
    os_unfair_lock_unlock(p_lock);
  }
  return v5;
}

void __51__TDVectorGlyphReader__layerNamesForRenderingMode___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  int Type;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    Type = CGSVGNodeGetType();
    if (Type == 2 || Type == 1 && *(_BYTE *)(a1 + 48))
    {
      if (CGSVGNodeFindAttribute())
      {
        v5 = (void *)CGSVGAttributeCopyString();
        v6 = (void *)objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
        v12 = 0u;
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v13;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v13 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
              if (objc_msgSend(v11, "hasPrefix:", *(_QWORD *)(a1 + 32)))
                objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          }
          while (v8);
        }

      }
    }
  }
}

uint64_t __51__TDVectorGlyphReader__layerNamesForRenderingMode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;

  if (*(_QWORD *)(a1 + 40) <= 9uLL)
    return objc_msgSend(a2, "compare:", a3);
  v6 = objc_msgSend(a2, "rangeOfString:", *(_QWORD *)(a1 + 32));
  v8 = v7;
  v9 = objc_msgSend(a3, "rangeOfString:", *(_QWORD *)(a1 + 32));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v9 == 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(a2, "compare:", a3);
  v13 = v9;
  v14 = v10;
  v15 = (void *)objc_msgSend(a2, "stringByReplacingCharactersInRange:withString:", v6, v8, &stru_24EF2D4A8);
  v16 = (void *)objc_msgSend(a3, "stringByReplacingCharactersInRange:withString:", v13, v14, &stru_24EF2D4A8);
  v17 = objc_msgSend(v15, "integerValue");
  v18 = objc_msgSend(v16, "integerValue");
  if (v17 < v18)
    return -1;
  else
    return v17 > v18;
}

- (id)monochromeLayerNodeNames
{
  return -[TDVectorGlyphReader _layerNamesForRenderingMode:](self, "_layerNamesForRenderingMode:", CFSTR("monochrome-"));
}

- (id)multicolorLayerNodeNames
{
  return -[TDVectorGlyphReader _layerNamesForRenderingMode:](self, "_layerNamesForRenderingMode:", CFSTR("multicolor-"));
}

- (id)hierarchicalLayerNodeNames
{
  return -[TDVectorGlyphReader _layerNamesForRenderingMode:](self, "_layerNamesForRenderingMode:", CFSTR("hierarchical-"));
}

- (BOOL)containsHierarchicalLayers
{
  float v3;

  -[TDVectorGlyphReader templateVersion](self, "templateVersion");
  return v3 >= 3.0
      && objc_msgSend(-[TDVectorGlyphReader hierarchicalLayerNodeNames](self, "hierarchicalLayerNodeNames"), "count") != 0;
}

- (BOOL)containsMulticolorLayers
{
  float v3;

  -[TDVectorGlyphReader templateVersion](self, "templateVersion");
  return v3 >= 2.1
      && objc_msgSend(-[TDVectorGlyphReader multicolorLayerNodeNames](self, "multicolorLayerNodeNames"), "count") != 0;
}

- (id)_pathForLayerNamed:(id)a3 inDocument:(CGSVGDocument *)a4
{
  uint64_t ChildCount;
  void *v6;
  uint64_t v7;
  __int128 *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if (!a4)
    return 0;
  CGSVGDocumentGetRootNode();
  CGSVGNodeGetChildAtIndex();
  ChildCount = CGSVGNodeGetChildCount();
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (ChildCount)
  {
    v7 = 0;
    v8 = (__int128 *)MEMORY[0x24BDBD8B8];
    do
    {
      CGSVGNodeGetChildAtIndex();
      if (CGSVGNodeGetType() == 2 && CGSVGNodeFindAttribute())
      {
        v9 = (void *)CGSVGAttributeCopyString();
        if (objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(" ")), "containsObject:", a3))
        {
          v12 = *v8;
          v13 = v8[1];
          v14 = v8[2];
          v10 = (void *)CUICreatePathFromSVGNode();
          objc_msgSend(v6, "addObject:", v10, v12, v13, v14);

        }
      }
      ++v7;
    }
    while (ChildCount != v7);
  }
  return (id)objc_msgSend(MEMORY[0x24BE28CB8], "createConcatenatingPaths:", v6);
}

- (id)createMonochromeLayerGroupForSymbol:(CGSVGDocument *)a3 layerNames:(id)a4
{
  float templateVersion;
  BOOL v7;
  void *v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  CGSVGDocumentGetRootNode();
  CGSVGNodeFindChildWithCStringIdentifier();
  templateVersion = self->_templateVersion;
  if (self->_layerTreeNode)
    v7 = templateVersion < 5.0;
  else
    v7 = 1;
  if (v7)
  {
    if (templateVersion >= 4.0 && objc_msgSend(a4, "count"))
      return (id)objc_msgSend(MEMORY[0x24BE28CA8], "createLayerGroupWithLayerNames:delegate:", a4, self);
    v11 = -[TDVectorGlyphReader pathForLayerNamed:](self, "pathForLayerNamed:", 0);
    -[TDVectorGlyphReader strokeWidthForLayerNamed:](self, "strokeWidthForLayerNamed:", 0);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28CA8]), "_initWithName:index:shape:strokeWidth:attributes:style:delegate:", CFSTR("monochrome-0"), 0, v11, 0, 0, self, v12);
    v14 = objc_alloc(MEMORY[0x24BE28CA8]);
    v15[0] = v13;
    v10 = (void *)objc_msgSend(v14, "_initWithName:index:sublayers:attributes:style:delegate:", CFSTR("root"), 0, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1), 0, 0, self);

  }
  else
  {
    v9 = (void *)CUICreateSubpathsFromSVGNode();
    v10 = (void *)objc_msgSend(MEMORY[0x24BE28CA8], "createLayerGroupWithLayerTree:layerNames:shapes:delegate:", self->_layerTreeNode, a4, v9, self);

  }
  return v10;
}

- (void)drawInContext:(CGContext *)a3 atPointSize:(double)a4 scaleFactor:(double)a5 weight:(int64_t)a6 size:(int64_t)a7
{
  CGSVGDocument *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  CGColorRef ConstantColor;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (a3 && a4 > 0.0)
  {
    v11 = -[TDVectorGlyphReader vectorGlyphWithWeight:size:error:](self, "vectorGlyphWithWeight:size:error:", a6, a7, 0);
    v12 = -[TDVectorGlyphReader monochromeLayerNodeNames](self, "monochromeLayerNodeNames");
    os_unfair_lock_lock(&self->_lock);
    -[TDVectorGlyphReader defaultPointSize](self, "defaultPointSize");
    self->_drawingPointSize = a4;
    self->_drawingScale = a4 * a5 / v13;
    self->_drawingSymbol = (CGSVGDocument *)CGSVGDocumentRetain();
    if (v11)
    {
      CGSVGDocumentGetCanvasSize();
      v15 = v14;
      v17 = v16;
      v18 = -[TDVectorGlyphReader createMonochromeLayerGroupForSymbol:layerNames:](self, "createMonochromeLayerGroupForSymbol:layerNames:", v11, v12);
      ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x24BDBF200]);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v25 = v18;
      v20 = (void *)objc_msgSend(v18, "sublayers");
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v27;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v27 != v23)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v24++), "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:", a3, ConstantColor, 0, self->_drawingScale, v15, v17, INFINITY, INFINITY);
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v22);
      }

    }
    CGSVGDocumentRelease();
    self->_drawingPointSize = 0.0;
    self->_drawingScale = 0.0;
    self->_drawingSymbol = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)canDrawWithWeight:(int64_t)a3 size:(int64_t)a4
{
  os_unfair_lock_s *p_lock;
  BOOL isInterpolatable;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  isInterpolatable = 0;
  if ((unint64_t)(a3 - 1) <= 8 && (unint64_t)(a4 - 1) <= 2)
  {
    if (!self->_vectorGlyphNodes)
      -[TDVectorGlyphReader _readSVGNodesError:](self, "_readSVGNodesError:", 0);
    if (-[NSDictionary objectForKey:](self->_vectorGlyphNodes, "objectForKey:", -[TDVectorGlyphReader _glyphNodeIDForWeight:size:](self, "_glyphNodeIDForWeight:size:", a3, a4)))
    {
      isInterpolatable = 1;
    }
    else
    {
      isInterpolatable = self->_isInterpolatable;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return isInterpolatable;
}

+ (id)vectorGlyphReaderWithURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "vectorGlyphReaderWithURL:platform:error:", a3, CUICurrentPlatform(), a4);
}

+ (id)vectorGlyphReaderWithURL:(id)a3 platform:(int64_t)a4 error:(id *)a5
{
  TDVectorGlyphReader *v8;
  TDVectorGlyphReader *v9;
  TDVectorGlyphReader *v10;

  if (__onceToken != -1)
    dispatch_once(&__onceToken, &__block_literal_global_182);
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  v8 = (TDVectorGlyphReader *)objc_msgSend((id)__instanceCache, "objectForKey:", a3);
  if (v8)
  {
    v9 = v8;
    v10 = v8;
  }
  else
  {
    v9 = -[TDVectorGlyphReader initWithURL:platform:error:]([TDVectorGlyphReader alloc], "initWithURL:platform:error:", a3, a4, a5);
    if (v9)
      objc_msgSend((id)__instanceCache, "setObject:forKey:", v9, a3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
  return v9;
}

uint64_t __63__TDVectorGlyphReader_vectorGlyphReaderWithURL_platform_error___block_invoke()
{
  __instanceCache = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCE40]);
  objc_msgSend((id)__instanceCache, "setName:", CFSTR("com.apple.corethemedefinition-VectoryGlyphCache"));
  objc_msgSend((id)__instanceCache, "setEvictsObjectsWithDiscardedContent:", 0);
  return objc_msgSend((id)__instanceCache, "setCountLimit:", 1500);
}

+ (void)clearInstanceCache
{
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  objc_msgSend((id)__instanceCache, "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
}

- (double)scale
{
  return self->_drawingScale;
}

- (double)_requestedPointSizeRatio
{
  double drawingPointSize;
  double v3;
  BOOL v4;
  double result;

  drawingPointSize = self->_drawingPointSize;
  -[TDVectorGlyphReader defaultPointSize](self, "defaultPointSize");
  v4 = v3 < 1.0 || drawingPointSize < 1.0;
  result = drawingPointSize / v3;
  if (v4)
    return 1.0;
  return result;
}

- (float)templateVersion
{
  return self->_templateVersion;
}

- (CGSize)referenceCanvasSize
{
  double v2;
  double v3;
  CGSize result;

  if (self->_drawingSymbol)
  {
    CGSVGDocumentGetCanvasSize();
  }
  else
  {
    v2 = *MEMORY[0x24BDBF148];
    v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)pathForLayerNamed:(id)a3
{
  void *v4;
  id v5;

  if (!self->_drawingSymbol || !self->_isInterpolatable)
    return 0;
  if (a3)
    return -[TDVectorGlyphReader _pathForLayerNamed:inDocument:](self, "_pathForLayerNamed:inDocument:");
  CGSVGDocumentGetRootNode();
  CGSVGNodeFindChildWithCStringIdentifier();
  v4 = (void *)CUICreatePathFromSVGNode();
  v5 = v4;
  return v4;
}

- (CGSVGAttributeMap)styleForLayerName:(id)a3
{
  if (!a3 || !self->_drawingSymbol)
    return 0;
  objc_msgSend(CFSTR("."), "stringByAppendingString:");
  return (CGSVGAttributeMap *)CGSVGDocumentGetNamedStyle();
}

- (double)strokeWidthForLayerNamed:(id)a3
{
  if (-[TDVectorGlyphReader attributesForLayerNamed:](self, "attributesForLayerNamed:", a3)
    && CGSVGAttributeMapGetAttribute())
  {
    CGSVGAttributeGetFloat();
  }
  return 0.0;
}

- (CGSVGAttributeMap)attributesForLayerNamed:(id)a3
{
  float v4;
  float v5;
  uint64_t ChildCount;
  uint64_t v7;
  uint64_t i;
  void *v9;
  CGSVGAttributeMap *AttributeMap;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;

  if (a3)
  {
    -[TDVectorGlyphReader templateVersion](self, "templateVersion");
    v5 = v4;
    CGSVGDocumentGetRootNode();
    if (v5 >= 5.0 && CGSVGNodeFindChildWithStringIdentifier())
    {
      ChildCount = CGSVGNodeGetChildCount();
      if (ChildCount)
      {
        v7 = ChildCount;
        for (i = 0; i != v7; ++i)
        {
          CGSVGNodeGetChildAtIndex();
          if (CGSVGNodeFindAttribute())
          {
            v9 = (void *)CGSVGAttributeCopyString();
            if ((objc_msgSend(v9, "containsString:", a3) & 1) != 0)
            {
              AttributeMap = (CGSVGAttributeMap *)CGSVGNodeGetAttributeMap();

              if (AttributeMap)
                return AttributeMap;
            }
            else
            {

            }
          }
        }
      }
    }
    else
    {
      CGSVGNodeGetChildAtIndex();
      v11 = CGSVGNodeGetChildCount();
      if (v11)
      {
        v12 = v11;
        for (j = 0; j != v12; ++j)
        {
          CGSVGNodeGetChildAtIndex();
          if (CGSVGNodeFindAttribute())
          {
            v14 = (void *)CGSVGAttributeCopyString();
            if ((objc_msgSend(v14, "containsString:", a3) & 1) != 0)
            {
              AttributeMap = (CGSVGAttributeMap *)CGSVGNodeGetAttributeMap();

              if (AttributeMap)
                return AttributeMap;
            }
            else
            {

            }
          }
        }
      }
    }
    return 0;
  }
  else
  {
    CGSVGDocumentGetRootNode();
    CGSVGNodeGetChildAtIndex();
    return (CGSVGAttributeMap *)CGSVGNodeGetAttributeMap();
  }
}

- (void)_legacy_drawMonochromeLayerNamed:(id)a3 inContext:(CGContext *)a4 scaleFactor:(double)a5 targetSize:(CGSize)a6 onFillColor:(CGColor *)a7 offFillColor:(CGColor *)a8
{
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (self->_drawingSymbol)
  {
    v9 = a6.width * a5;
    v10 = a6.height * a5;
    -[TDVectorGlyphReader referenceCanvasSize](self, "referenceCanvasSize", a3, a4, a7, a8);
    v12 = v11;
    v14 = v13;
    CGContextSaveGState(a4);
    CGContextScaleCTM(a4, v9 / v12, v10 / v14);
    CGContextDrawSVGDocument();
    CGContextRestoreGState(a4);
  }
}

- (id)_symbolDefaults
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (id)fillImageNames
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (CGImage)fillImageWithName:(id)a3
{
  return 0;
}

@end
