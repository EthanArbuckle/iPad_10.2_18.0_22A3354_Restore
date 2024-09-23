@implementation PKLinedPaperLayer

- (PKLinedPaperLayer)initWithLinedPaperLayerDelegate:(id)a3
{
  id v4;
  PKLinedPaperLayer *v5;
  PKLinedPaperLayer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKLinedPaperLayer;
  v5 = -[PKLinedPaperLayer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_linedPaperLayerDelegate, v4);

  return v6;
}

- (id)_traitCollection
{
  void *v3;
  void *v4;

  -[PKLinedPaperLayer linedPaperLayerDelegate](self, "linedPaperLayerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linedPaperLayerTraitCollection:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_attachmentContainerView
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[PKLinedPaperLayer linedPaperLayerDelegate](self, "linedPaperLayerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKLinedPaperLayer linedPaperLayerDelegate](self, "linedPaperLayerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "linedPaperLayerAttachmentContainerView:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_linedPaper
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[PKLinedPaperLayer linedPaperLayerDelegate](self, "linedPaperLayerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKLinedPaperLayer linedPaperLayerDelegate](self, "linedPaperLayerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "linedPaperLayerLinedPaper:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)updateLinesFromAttachmentBounds:(CGRect)a3
{
  double height;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat x;
  double y;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double width;
  double v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  height = a3.size.height;
  width = a3.size.width;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin", a3.origin.x, a3.origin.y);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[PKLinedPaperLayer _linedPaper](self, "_linedPaper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v27, 0, sizeof(v27));
  -[PKLinedPaperLayer linedPaperLayerDelegate](self, "linedPaperLayerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "drawingTransform");
  else
    memset(&v27, 0, sizeof(v27));

  v8 = sqrt(v27.b * v27.b + v27.a * v27.a);
  v28.size.height = height / v8;
  v26 = v27;
  v28.size.width = 768.0;
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v29 = CGRectApplyAffineTransform(v28, &v26);
  x = v29.origin.x;
  y = v29.origin.y;
  v11 = v29.size.width;
  v12 = v29.size.height;
  objc_msgSend(v5, "horizontalInset");
  v14 = v8 * v13;
  v15 = x;
  v30.origin.x = x;
  v30.origin.y = y;
  v16 = v11;
  v30.size.width = v11;
  v25 = v12;
  v30.size.height = v12;
  v31 = CGRectInset(v30, v14, 0.0);
  v17 = v31.origin.x;
  v18 = v31.origin.y;
  v19 = v31.size.width;
  v20 = v31.size.height;
  objc_msgSend(v5, "lineSpacing");
  v22 = v8 * v21;
  if (v8 * v21 > 0.0)
  {
    v23 = floor(width * y / -768.0);
    v18 = v18 + v23 - ceil(v23 / v22) * v22;
    v20 = v20 + v22;
  }
  -[PKLinedPaperLayer setFrame:](self, "setFrame:", v17, v18, v19, v20);
  -[PKLinedPaperLayer updateSublayersFromAttachmentBounds:](self, "updateSublayersFromAttachmentBounds:", v15, y, v16, v25);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (void)updateSublayersFromAttachmentBounds:(CGRect)a3
{
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  long double v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void (**v37)(_QWORD);
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  void *v42;
  double v43;
  BOOL v44;
  double v45;
  uint64_t v46;
  double v47;
  void *v48;
  double v49;
  BOOL v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD aBlock[5];
  id v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  width = a3.size.width;
  v78 = *MEMORY[0x1E0C80C00];
  -[PKLinedPaperLayer _linedPaper](self, "_linedPaper", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKLinedPaperLayer _attachmentContainerView](self, "_attachmentContainerView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v59)
  {
    -[PKLinedPaperLayer bounds](self, "bounds");
    v7 = v6;
    -[PKLinedPaperLayer bounds](self, "bounds");
    v9 = v8;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v12 = v11;

    objc_msgSend(v5, "lineSpacing");
    v57 = v13;
    v58 = v14;
    -[PKLinedPaperLayer sublayers](self, "sublayers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    -[PKLinedPaperLayer bounds](self, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(v59, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKLinedPaperLayer convertRect:toLayer:](self, "convertRect:toLayer:", v25, v18, v20, v22, v24);
    v27 = v26;
    v29 = v28;

    -[PKLinedPaperLayer _traitCollection](self, "_traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "pk_linedPaperLineColor_dark");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "pk_linedPaperLineColor_light");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = 0;
    v69 = &v68;
    v70 = 0x2020000000;
    v71 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PKLinedPaperLayer_updateSublayersFromAttachmentBounds___block_invoke;
    aBlock[3] = &unk_1E777C7E0;
    v66 = &v68;
    v67 = v16;
    aBlock[4] = self;
    v32 = v36;
    v65 = v32;
    v37 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v5, "lineSpacing");
    v38 = width / 768.0;
    if (v39 > 1.0)
    {
      v40 = fmod(v29, v38 * v58);
      v41 = 0;
      do
      {
        v37[2](v37);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setFrame:", 0.0, round(v12 * (v38 * v58 * (double)v41)) / v12 - v40, v7, 1.0);
        objc_msgSend(v42, "frame");
        v44 = v43 + 1.0 <= v9;

        ++v41;
      }
      while (v44);
    }
    objc_msgSend(v5, "lineSpacing");
    if (v45 > 1.0)
    {
      v46 = 0;
      v47 = v38 * v57;
      do
      {
        v37[2](v37);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setFrame:", round(v12 * (v27 + (double)v46 * v47)) / v12 + -0.5 - v27, 0.0, 1.0, v9);
        objc_msgSend(v48, "frame");
        v50 = v49 + 1.0 <= v7;

        ++v46;
      }
      while (v50);
    }
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[PKLinedPaperLayer sublayers](self, "sublayers");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
    if (v52)
    {
      v53 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v61 != v53)
            objc_enumerationMutation(v51);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(v32), "CGColor"));
        }
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
      }
      while (v52);
    }

    while (v16 > v69[3])
    {
      -[PKLinedPaperLayer sublayers](self, "sublayers");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectAtIndexedSubscript:", --v16);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "removeFromSuperlayer");

    }
    _Block_object_dispose(&v68, 8);
  }
  else
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    -[PKLinedPaperLayer sublayers](self, "sublayers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend(v31, "copy");

    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v73;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v73 != v34)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * j), "removeFromSuperlayer");
        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
      }
      while (v33);
    }
  }

}

id __57__PKLinedPaperLayer_updateSublayersFromAttachmentBounds___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 56))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGColor"));
    objc_msgSend(*(id *)(a1 + 32), "addSublayer:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "sublayers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return v3;
}

- (PKLinedPaperLayerDelegate)linedPaperLayerDelegate
{
  return (PKLinedPaperLayerDelegate *)objc_loadWeakRetained((id *)&self->_linedPaperLayerDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_linedPaperLayerDelegate);
}

@end
