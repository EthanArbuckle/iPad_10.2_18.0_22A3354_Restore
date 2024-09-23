@implementation PDFPageLayerMarkupAnnotationEffect

- (id)annotation
{
  return objc_loadWeakRetained((id *)&self->super._private->annotation);
}

- (id)UUID
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);
  objc_msgSend(WeakRetained, "pdfAnnotationUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)update
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double height;
  double width;
  double y;
  CGFloat x;
  double v44;
  double v45;
  SelectionRectInfo *v46;
  __int128 v47;
  NSMutableDictionary *v48;
  PDFPageLayerEffectPrivate *v49;
  NSMutableDictionary *markupEffectLayers;
  id v51;
  uint64_t v52;
  NSMutableDictionary *v53;
  PDFPageLayerMarkupAnnotationEffect *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  _QWORD v59[6];
  double v60;
  double v61;
  uint64_t v62;
  _QWORD v63[7];
  CGRect v64;

  v63[5] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->super._private->annotation);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v54 = self;
    objc_msgSend(WeakRetained, "bounds");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "quadrilateralPoints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "markupType");
    v11 = objc_msgSend(v9, "count");
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v11 >= 4)
    {
      v13 = 0;
      v57 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v58 = *MEMORY[0x24BDBF090];
      v55 = *(double *)(MEMORY[0x24BDBF090] + 24);
      v56 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v14 = v11 >> 2;
      v15 = (_OWORD *)MEMORY[0x24BDBD8B8];
      do
      {
        objc_msgSend(v9, "objectAtIndex:", 4 * v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "PDFKitPDFPointValue");
        v60 = v17;
        v61 = v18;

        objc_msgSend(v9, "objectAtIndex:", (4 * v13) | 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "PDFKitPDFPointValue");
        v62 = v20;
        v63[0] = v21;

        objc_msgSend(v9, "objectAtIndex:", (4 * v13) | 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "PDFKitPDFPointValue");
        v63[1] = v23;
        v63[2] = v24;

        objc_msgSend(v9, "objectAtIndex:", (4 * v13) | 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "PDFKitPDFPointValue");
        v63[3] = v26;
        v63[4] = v27;

        v28 = 0;
        while (1)
        {
          v29 = *(double *)((char *)&v60 + v28);
          v30 = *(double *)((char *)&v60 + v28 + 8);
          v31 = fabs(v30);
          if (fabs(v29) == INFINITY || v31 == INFINITY)
            break;
          *(double *)((char *)&v60 + v28) = v6 + v29;
          *(double *)((char *)&v60 + v28 + 8) = v8 + v30;
          v28 += 16;
          if (v28 == 64)
          {
            v33 = 0;
            v34 = v60;
            v35 = v61;
            v36 = v60;
            v37 = v61;
            do
            {
              v38 = *(double *)&v63[v33 - 1];
              v39 = *(double *)&v63[v33];
              if (v34 >= v38)
                v34 = *(double *)&v63[v33 - 1];
              if (v35 >= v39)
                v35 = *(double *)&v63[v33];
              if (v36 < v38)
                v36 = *(double *)&v63[v33 - 1];
              if (v37 < v39)
                v37 = *(double *)&v63[v33];
              v33 += 2;
            }
            while (v33 != 6);
            if (v10)
            {
              if (v10 == 1)
              {
                height = fmax((v37 - v35) * 0.08, 1.0);
                y = height * -0.5 + (v37 + v35) * 0.5;
                width = v36 - v34;
LABEL_26:
                x = v34;
              }
              else
              {
                height = v55;
                width = v56;
                y = v57;
                x = v58;
                if (v10 == 2)
                {
                  height = fmax((v37 - v35) * 0.08, 1.0);
                  width = v36 - v34;
                  y = v35;
                  goto LABEL_26;
                }
              }
            }
            else
            {
              v44 = v36 - v34;
              v45 = v37 - v35;
              v64 = CGRectInset(*(CGRect *)&v34, -0.8, -0.8);
              x = v64.origin.x;
              y = v64.origin.y;
              width = v64.size.width;
              height = v64.size.height;
            }
            v46 = objc_alloc_init(SelectionRectInfo);
            v46->rect.origin.x = x;
            v46->rect.origin.y = y;
            v46->rect.size.width = width;
            v46->rect.size.height = height;
            v47 = v15[1];
            *(_OWORD *)&v46->transform.a = *v15;
            *(_OWORD *)&v46->transform.c = v47;
            *(_OWORD *)&v46->transform.tx = v15[2];
            objc_msgSend(v12, "addObject:", v46);

            break;
          }
        }
        ++v13;
      }
      while (v13 != v14);
    }
    if (!v54->super._private->markupEffectLayers)
    {
      v48 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v49 = v54->super._private;
      markupEffectLayers = v49->markupEffectLayers;
      v49->markupEffectLayers = v48;

    }
    objc_msgSend(v4, "color");
    v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v52 = objc_msgSend(v51, "CGColor");

    v53 = v54->super._private->markupEffectLayers;
    v59[0] = MEMORY[0x24BDAC760];
    v59[1] = 3221225472;
    v59[2] = __44__PDFPageLayerMarkupAnnotationEffect_update__block_invoke;
    v59[3] = &unk_24C25D880;
    v59[4] = v54;
    v59[5] = v52;
    UpdateRectTransformDictionary(v53, v12, v52, v59, &__block_literal_global_13);
    -[PDFPageLayerMarkupAnnotationEffect _updateNoteLayer](v54, "_updateNoteLayer");

  }
}

id __44__PDFPageLayerMarkupAnnotationEffect_update__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  double *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = (objc_class *)MEMORY[0x24BDE56D0];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  v6 = v4[2];
  v7 = v4[3];
  v8 = v4[4];
  v9 = v4[5];

  objc_msgSend(v5, "setFrame:", v6, v7, v8, v9);
  objc_msgSend(v5, "setBackgroundColor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setNeedsDisplay");
  objc_msgSend(*(id *)(a1 + 32), "addSublayer:", v5);
  return v5;
}

- (void)_updateNoteLayer
{
  id v3;
  void *v4;
  PDFPageLayerEffect *noteLayer;
  void *v6;
  void *v7;
  PDFPageLayerEffectPrivate *v8;
  uint64_t v9;
  PDFPageLayerEffectPrivate *v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._private->pageLayer);
  v3 = objc_loadWeakRetained((id *)&self->super._private->annotation);
  objc_msgSend(v3, "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  noteLayer = self->super._private->noteLayer;
  if (v4)
  {
    if (noteLayer)
    {
      -[PDFPageLayerEffect UUID](noteLayer, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "updatePageLayerEffectForID:", v6);
    }
    else
    {
      +[PDFPageLayerEffect createPDFNoteLayerEffectForAnnotation:withLayer:](PDFPageLayerEffect, "createPDFNoteLayerEffectForAnnotation:withLayer:", v3, WeakRetained);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = self->super._private;
      v6 = v10->noteLayer;
      v10->noteLayer = (PDFPageLayerEffect *)v9;
    }
  }
  else
  {
    -[PDFPageLayerEffect UUID](noteLayer, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "removePageLayerEffectForID:", v7);

    v8 = self->super._private;
    v6 = v8->noteLayer;
    v8->noteLayer = 0;
  }

}

- (void)removeFromSuperlayer
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDFPageLayerMarkupAnnotationEffect;
  -[PDFPageLayerMarkupAnnotationEffect removeFromSuperlayer](&v5, sel_removeFromSuperlayer);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._private->pageLayer);
  -[PDFPageLayerEffect UUID](self->super._private->noteLayer, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "removePageLayerEffectForID:", v4);

}

@end
