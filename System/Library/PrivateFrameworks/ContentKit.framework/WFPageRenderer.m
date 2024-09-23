@implementation WFPageRenderer

- (CGSize)sizeForPageAtIndex:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGSize result;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[WFPageRenderer renderer](self, "renderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "paperRect");
  v9 = v8;
  v11 = v10;

  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[WFPageRenderer renderer](self, "renderer", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "printFormattersForPageAtIndex:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "integerValue");

        objc_msgSend(v19, "rectForPageAtIndex:", v21);
        if (v22 == 0.0)
          v23 = v9;
        else
          v23 = v22;
        if (v23 >= v6)
          v6 = v23;
        objc_msgSend(v19, "rectForPageAtIndex:", v21);
        if (v24 == 0.0)
          v25 = v11;
        else
          v25 = v24;
        if (v25 >= v5)
          v5 = v25;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v21 + 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v26, v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v16);
  }

  v27 = v6;
  v28 = v5;
  result.height = v28;
  result.width = v27;
  return result;
}

- (void)renderToPDF:(id)a3 startingAtPage:(int64_t)a4 endingAtPage:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  int64_t v19;

  v10 = a3;
  v11 = a6;
  if (renderToPDF_startingAtPage_endingAtPage_completionHandler__onceToken != -1)
    dispatch_once(&renderToPDF_startingAtPage_endingAtPage_completionHandler__onceToken, &__block_literal_global_10744);
  dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__WFPageRenderer_renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke_2;
  block[3] = &unk_24C4DF6B0;
  block[4] = self;
  v16 = v10;
  v18 = a4;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

- (void)_renderToPDF:(id)a3 startingAtPage:(int64_t)a4 endingAtPage:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[6];

  v10 = a6;
  objc_msgSend(a3, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPageRenderer renderer](self, "renderer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paperRect");
  softLinkUIGraphicsBeginPDFContextToFile(v11, 0, v13, v14, v15, v16);

  -[WFPageRenderer renderer](self, "renderer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "numberOfPages");

  -[WFPageRenderer renderer](self, "renderer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "prepareForDrawingPages:", 0, v18);

  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPageRenderer renderer](self, "renderer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "paperRect");
  v25 = v24;
  v27 = v26;

  v30 = v10;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __77__WFPageRenderer__renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke;
  v31[3] = &__block_descriptor_48_e8_B16__0q8l;
  v31[4] = a4;
  v31[5] = a5;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __77__WFPageRenderer__renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke_2;
  v29[3] = &unk_24C4E3540;
  v28 = v10;
  -[WFPageRenderer renderPDFPageIndex:pages:measuredIndicesByFormatter:drawnIndicesByFormatter:linkMetricsByWebView:y:paperSize:shouldDrawPageAtIndexHandler:completionHandler:](self, "renderPDFPageIndex:pages:measuredIndicesByFormatter:drawnIndicesByFormatter:linkMetricsByWebView:y:paperSize:shouldDrawPageAtIndexHandler:completionHandler:", 0, v18, v20, v21, v22, v31, 0.0, v25, v27, v29);

}

- (void)renderPDFPageIndex:(int64_t)a3 pages:(int64_t)a4 measuredIndicesByFormatter:(id)a5 drawnIndicesByFormatter:(id)a6 linkMetricsByWebView:(id)a7 y:(double)a8 paperSize:(CGSize)a9 shouldDrawPageAtIndexHandler:(id)a10 completionHandler:(id)a11
{
  double height;
  double width;
  id v19;
  uint64_t (**v20)(id, int64_t);
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  _BOOL4 v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  CGFloat x;
  CGFloat y;
  CGFloat v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  int v51;
  char v52;
  uint64_t v53;
  id v54;
  uint64_t (**v55)(id, int64_t);
  id v56;
  id v57;
  id v58;
  uint64_t (**v59)(id, int64_t);
  int64_t v60;
  CGFloat v61;
  id v62;
  id v63;
  id v64;
  _QWORD v66[5];
  id v67;
  id v68;
  id v69;
  uint64_t (**v70)(id, int64_t);
  id v71;
  int64_t v72;
  int64_t v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  _QWORD v79[4];
  id v80;
  id v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  double v86;
  uint64_t v87;
  uint64_t v88;
  double v89;
  double v90;
  double v91;
  double v92;
  char v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  uint64_t v99;
  CGRect v100;

  height = a9.height;
  width = a9.width;
  v99 = *MEMORY[0x24BDAC8D0];
  v19 = a5;
  v62 = a6;
  v63 = a7;
  v20 = (uint64_t (**)(id, int64_t))a10;
  v64 = a11;
  v21 = height;
  v22 = width;
  if (-[WFPageRenderer matchInputSize](self, "matchInputSize"))
  {
    v59 = v20;
    v22 = *MEMORY[0x24BDBF148];
    v21 = *(double *)(MEMORY[0x24BDBF148] + 8);
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    -[WFPageRenderer renderer](self, "renderer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = a3;
    objc_msgSend(v23, "printFormattersForPageAtIndex:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v95 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
          objc_msgSend(v19, "objectForKey:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "integerValue");

          objc_msgSend(v29, "rectForPageAtIndex:", v31);
          if (v32 == 0.0)
            v33 = width;
          else
            v33 = v32;
          if (v33 >= v22)
            v22 = v33;
          objc_msgSend(v29, "rectForPageAtIndex:", v31);
          if (v34 == 0.0)
            v35 = height;
          else
            v35 = v34;
          if (v35 >= v21)
            v21 = v35;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v31 + 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKey:", v36, v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
      }
      while (v26);
    }

    a3 = v60;
    v20 = v59;
  }
  v37 = -[WFPageRenderer includeMargin](self, "includeMargin");
  v38 = 0;
  if (v37)
    v39 = 18.0;
  else
    v39 = 0.0;
  v40 = 0;
  v41 = v22;
  v42 = v21;
  v100 = CGRectInset(*(CGRect *)&v38, v39, v39);
  x = v100.origin.x;
  y = v100.origin.y;
  v45 = v100.size.width;
  v61 = v100.size.height;
  -[WFPageRenderer renderer](self, "renderer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "printFormattersForPageAtIndex:", a3);
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)v47;
  v49 = (void *)MEMORY[0x24BDBD1A8];
  if (v47)
    v49 = (void *)v47;
  v50 = v49;

  v51 = v20[2](v20, a3);
  v52 = v51;
  if (v51)
    softLinkUIGraphicsBeginPDFPageWithInfo(0, 0.0, 0.0, v22, v21);
  v53 = MEMORY[0x24BDAC760];
  v79[0] = MEMORY[0x24BDAC760];
  v79[1] = 3221225472;
  v79[2] = __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke;
  v79[3] = &unk_24C4DF748;
  v80 = v62;
  v93 = v52;
  v82 = x;
  v83 = y;
  v84 = v45;
  v85 = v61;
  v86 = a8;
  v87 = 0;
  v88 = 0;
  v89 = v22;
  v90 = v21;
  v91 = v22;
  v92 = v21;
  v81 = v63;
  v66[0] = v53;
  v66[1] = 3221225472;
  v66[2] = __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke_4;
  v66[3] = &unk_24C4DF770;
  v72 = a3;
  v73 = a4;
  v66[4] = self;
  v67 = v19;
  v68 = v80;
  v69 = v81;
  v74 = a8;
  v75 = v22;
  v76 = v21;
  v77 = width;
  v78 = height;
  v70 = v20;
  v71 = v64;
  v54 = v64;
  v55 = v20;
  v56 = v81;
  v57 = v80;
  v58 = v19;
  objc_msgSend(v50, "if_enumerateAsynchronouslyInSequence:completionHandler:", v79, v66);

}

- (id)renderToImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  WFPageRenderer *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[WFPageRenderer renderer](self, "renderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfPages");

  -[WFPageRenderer renderer](self, "renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "printableRect");
  v7 = v6;
  v9 = v8;

  v10 = 0.0;
  softLinkUIGraphicsBeginImageContextWithOptions(0, v7, v9 * (double)v4, 0.0);
  v27 = self;
  -[WFPageRenderer renderer](self, "renderer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prepareForDrawingPages:", 0, v4);

  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  if (v4 >= 1)
  {
    v13 = 0;
    do
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[WFPageRenderer renderer](v27, "renderer", v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "printFormattersForPageAtIndex:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v12, "objectForKey:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "integerValue");

            objc_msgSend(v20, "drawInRect:forPageAtIndex:", v22, 0.0, v10, v7, v9);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v22 + 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v23, v20);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v17);
      }

      v10 = v9 + v10;
      ++v13;
    }
    while (v13 != v26);
  }
  softLinkUIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  softLinkUIGraphicsEndImageContext();

  return v24;
}

- (UIPrintPageRenderer)renderer
{
  UIPrintPageRenderer *renderer;
  UIPrintPageRenderer *v4;
  UIPrintPageRenderer *v5;

  renderer = self->_renderer;
  if (!renderer)
  {
    getWFPageRendererClass();
    v4 = (UIPrintPageRenderer *)objc_opt_new();
    v5 = self->_renderer;
    self->_renderer = v4;

    -[WFPageRenderer updateRendererSize](self, "updateRendererSize");
    renderer = self->_renderer;
  }
  return renderer;
}

- (void)updateRendererSize
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  UIPrintPageRenderer *renderer;
  objc_class *WFPageRendererClass;
  objc_ivar *InstanceVariable;
  void *v11;
  UIPrintPageRenderer *v12;
  objc_class *v13;
  objc_ivar *v14;
  void *v15;
  _QWORD v16[2];

  if (-[WFPageRenderer matchInputSize](self, "matchInputSize"))
  {
    -[WFPageRenderer inputSize](self, "inputSize");
    v4 = v3;
    v6 = v5;
  }
  else
  {
    v6 = 0x4088C00000000000;
    v4 = 0x4083200000000000;
  }
  if (-[WFPageRenderer includeMargin](self, "includeMargin"))
    v7 = 18.0;
  else
    v7 = 0.0;
  renderer = self->_renderer;
  WFPageRendererClass = (objc_class *)getWFPageRendererClass();
  InstanceVariable = class_getInstanceVariable(WFPageRendererClass, "_wf_inputSize");
  v16[0] = v4;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v16, "{CGSize=dd}");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  object_setIvarWithStrongDefault(renderer, InstanceVariable, v11);

  v12 = self->_renderer;
  v13 = (objc_class *)getWFPageRendererClass();
  v14 = class_getInstanceVariable(v13, "_wf_margin");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  object_setIvarWithStrongDefault(v12, v14, v15);

}

- (double)margin
{
  _BOOL4 v2;
  double result;

  v2 = -[WFPageRenderer includeMargin](self, "includeMargin");
  result = 0.0;
  if (v2)
    return 18.0;
  return result;
}

- (void)setInputSize:(CGSize)a3
{
  self->_inputSize = a3;
  -[WFPageRenderer updateRendererSize](self, "updateRendererSize");
}

- (void)setMatchInputSize:(BOOL)a3
{
  self->_matchInputSize = a3;
  -[WFPageRenderer updateRendererSize](self, "updateRendererSize");
}

- (void)setIncludeMargin:(BOOL)a3
{
  self->_includeMargin = a3;
  -[WFPageRenderer updateRendererSize](self, "updateRendererSize");
}

- (CGSize)inputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_inputSize.width;
  height = self->_inputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)matchInputSize
{
  return self->_matchInputSize;
}

- (BOOL)includeMargin
{
  return self->_includeMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
}

void __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CGContext *v12;
  CGColorSpace *DeviceRGB;
  void *v14;
  Class UITraitCollectionClass;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  void (**v24)(void *, void *);
  void *v25;
  double v26;
  _QWORD v27[4];
  id v28;
  id v29;
  void (**v30)(void *, void *);
  _QWORD aBlock[4];
  void (**v32)(id, _QWORD);
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v10 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9 + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, v6);

  if (*(_BYTE *)(a1 + 136))
  {
    v12 = 0;
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v12 = CGBitmapContextCreate(0, 1uLL, 1uLL, 8uLL, 4uLL, DeviceRGB, 1u);
    CGColorSpaceRelease(DeviceRGB);
    softLinkUIGraphicsPushContext((uint64_t)v12);
  }
  -[objc_class currentTraitCollection](getUITraitCollectionClass(), "currentTraitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UITraitCollectionClass = getUITraitCollectionClass();
  -[objc_class traitCollectionWithUserInterfaceStyle:](getUITraitCollectionClass(), "traitCollectionWithUserInterfaceStyle:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class setCurrentTraitCollection:](UITraitCollectionClass, "setCurrentTraitCollection:", v16);

  if (*(double *)(a1 + 64) > 0.0 && *(double *)(a1 + 72) > 0.0)
    objc_msgSend(v6, "drawInRect:forPageAtIndex:", v9, *(double *)(a1 + 48), *(double *)(a1 + 56));
  -[objc_class setCurrentTraitCollection:](getUITraitCollectionClass(), "setCurrentTraitCollection:", v14);
  if (v12)
  {
    softLinkUIGraphicsPopContext();
    CGContextRelease(v12);
LABEL_16:
    v7[2](v7, 0);
    goto LABEL_17;
  }
  getUIViewPrintFormatterClass();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  objc_msgSend(v6, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v18 = (void *)getWKWebViewClass_softClass;
  v43 = getWKWebViewClass_softClass;
  if (!getWKWebViewClass_softClass)
  {
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __getWKWebViewClass_block_invoke;
    v39[3] = &unk_24C4E3118;
    v39[4] = &v40;
    __getWKWebViewClass_block_invoke((uint64_t)v39);
    v18 = (void *)v41[3];
  }
  v19 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v40, 8);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_16;
  }
  v20 = v17;
  v21 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke_2;
  aBlock[3] = &unk_24C4DF6F8;
  v22 = *(_OWORD *)(a1 + 64);
  v33 = *(_OWORD *)(a1 + 48);
  v34 = v22;
  v35 = *(_QWORD *)(a1 + 80);
  v23 = *(_OWORD *)(a1 + 104);
  v36 = *(_OWORD *)(a1 + 88);
  v37 = v23;
  v38 = *(_OWORD *)(a1 + 120);
  v32 = v7;
  v24 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v24[2](v24, v25);
  }
  else
  {
    v26 = *(double *)(a1 + 64);
    v27[0] = v21;
    v27[1] = 3221225472;
    v27[2] = __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke_3;
    v27[3] = &unk_24C4DF720;
    v28 = *(id *)(a1 + 40);
    v29 = v20;
    v30 = v24;
    +[WFWebViewLinkExtractor extractLinksFromWKWebView:withDestinationWidth:completionHandler:](WFWebViewLinkExtractor, "extractLinksFromWKWebView:withDestinationWidth:completionHandler:", v29, v27, v26);

  }
LABEL_17:

}

uint64_t __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 80);
  if (v1 >= *(_QWORD *)(a1 + 88) - 1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "renderPDFPageIndex:pages:measuredIndicesByFormatter:drawnIndicesByFormatter:linkMetricsByWebView:y:paperSize:shouldDrawPageAtIndexHandler:completionHandler:", v1 + 1, *(double *)(a1 + 96) + *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128), *(_QWORD *)(a1 + 72));
}

void __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  CGContext *CurrentContext;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  const __CFURL *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGRect v33;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CurrentContext = (CGContext *)softLinkUIGraphicsGetCurrentContext();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "rect", (_QWORD)v27);
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v19 = *(double *)(a1 + 40);
        v20 = *(double *)(a1 + 48);
        v21 = *(double *)(a1 + 72);
        v22 = *(double *)(a1 + 104);
        objc_msgSend(v10, "href");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = v22 - (v20 + v14 - v21) - v18;
          v25 = *(double *)(a1 + 120);

          if (v18 + v24 < v25)
          {
            objc_msgSend(v10, "href");
            v26 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
            v33.origin.x = v12 + v19;
            v33.origin.y = v24;
            v33.size.width = v16;
            v33.size.height = v18;
            CGPDFContextSetURLForRect(CurrentContext, v26, v33);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __174__WFPageRenderer_renderPDFPageIndex_pages_measuredIndicesByFormatter_drawnIndicesByFormatter_linkMetricsByWebView_y_paperSize_shouldDrawPageAtIndexHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

BOOL __77__WFPageRenderer__renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) <= a2 && *(_QWORD *)(a1 + 40) >= a2;
}

uint64_t __77__WFPageRenderer__renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke_2(uint64_t a1)
{
  softLinkUIGraphicsEndPDFContext();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__WFPageRenderer_renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;
  __int128 v6;

  dispatch_semaphore_wait((dispatch_semaphore_t)renderToPDF_startingAtPage_endingAtPage_completionHandler__semaphore, 0xFFFFFFFFFFFFFFFFLL);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__WFPageRenderer_renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke_3;
  block[3] = &unk_24C4DF6B0;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v6 = *(_OWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

intptr_t __76__WFPageRenderer_renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_renderToPDF:startingAtPage:endingAtPage:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  return dispatch_semaphore_signal((dispatch_semaphore_t)renderToPDF_startingAtPage_endingAtPage_completionHandler__semaphore);
}

void __76__WFPageRenderer_renderToPDF_startingAtPage_endingAtPage_completionHandler___block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)renderToPDF_startingAtPage_endingAtPage_completionHandler__semaphore;
  renderToPDF_startingAtPage_endingAtPage_completionHandler__semaphore = (uint64_t)v0;

}

@end
