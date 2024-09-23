@implementation PDFOverlayViewsController_ios

- (PDFOverlayViewsController_ios)initWithPDFView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PDFOverlayViewsController_ios;
  return -[PDFOverlayViewsController initWithPDFView:](&v4, sel_initWithPDFView_, a3);
}

- (void)_installOverlayForPageView:(id)a3 ofPage:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double x;
  double y;
  double width;
  double height;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGAffineTransform v54;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v57;
  CGRect v58;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9 && a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PDFOverlayViewsController viewProvider](self, "viewProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFOverlayViewsController pdfView](self, "pdfView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFOverlayViewsController _callOverlayViewForPage:](self, "_callOverlayViewForPage:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = v8;
      objc_msgSend(v13, "superview");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 != v14)
      {
        objc_msgSend(v10, "boundsForBox:", 1);
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v24 = objc_msgSend(v10, "rotation");
        v25 = PDFDegToRad((double)v24);
        objc_msgSend(v12, "convertRect:fromPage:", v10, v17, v19, v21, v23);
        objc_msgSend(v14, "convertRect:fromView:", v12);
        x = v58.origin.x;
        y = v58.origin.y;
        width = v58.size.width;
        height = v58.size.height;
        if (!CGRectIsEmpty(v58))
        {
          v49 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
          v50 = *MEMORY[0x24BDBD8B8];
          *(_OWORD *)&v57.a = *MEMORY[0x24BDBD8B8];
          *(_OWORD *)&v57.c = v49;
          v48 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
          *(_OWORD *)&v57.tx = v48;
          v30 = v11;
          if ((objc_opt_respondsToSelector() & 1) != 0
            && objc_msgSend(v30, "shouldVerticallyFlipOverlayViews"))
          {
            CGAffineTransformMakeScale(&t2, 1.0, -1.0);
            *(_OWORD *)&t1.a = v50;
            *(_OWORD *)&t1.c = v49;
            *(_OWORD *)&t1.tx = v48;
            CGAffineTransformConcat(&v57, &t1, &t2);
          }
          v51 = v30;
          if (v24)
          {
            CGAffineTransformMakeRotation(&v54, v25);
            v53 = v57;
            CGAffineTransformConcat(&t1, &v53, &v54);
            v57 = t1;
          }
          objc_msgSend(v13, "layer", v48, v49);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setAnchorPoint:", 0.5, 0.5);

          v52 = v57;
          objc_msgSend(v13, "setTransform:", &v52);
          objc_msgSend(v13, "setFrame:", x, y, width, height);
          objc_msgSend(v14, "addSubview:", v13);
          objc_msgSend(v14, "setOverlayViewInstalled:", 1);
          objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          objc_msgSend(v13, "centerXAnchor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "centerXAnchor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "constraintEqualToAnchor:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setActive:", 1);

          objc_msgSend(v13, "centerYAnchor");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "centerYAnchor");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "constraintEqualToAnchor:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setActive:", 1);

          if (v24 == 270 || v24 == 90)
          {
            objc_msgSend(v13, "widthAnchor");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "heightAnchor");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "constraintEqualToAnchor:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setActive:", 1);

            objc_msgSend(v13, "heightAnchor");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "widthAnchor");
            v42 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v13, "widthAnchor");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "widthAnchor");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "constraintEqualToAnchor:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setActive:", 1);

            objc_msgSend(v13, "heightAnchor");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "heightAnchor");
            v42 = objc_claimAutoreleasedReturnValue();
          }
          v46 = (void *)v42;
          objc_msgSend(v41, "constraintEqualToAnchor:", v42);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setActive:", 1);

          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v51, "pdfView:willDisplayOverlayView:forPage:", v12, v13, v10);

        }
      }

    }
  }

}

- (void)_uninstallOverlayForPageView:(id)a3 ofPage:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (objc_msgSend(v13, "isOverlayViewInstalled"))
  {
    -[PDFOverlayViewsController _cachedOverlayViewForPage:](self, "_cachedOverlayViewForPage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFOverlayViewsController _callWillEndDisplayingOverlayViewForPage:](self, "_callWillEndDisplayingOverlayViewForPage:", v7);
    if (objc_msgSend(v8, "isFirstResponder"))
    {
      -[PDFOverlayViewsController pdfDocument](self, "pdfDocument");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "akDocumentAdaptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "akMainController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "modernToolbarView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "becomeFirstResponder");

    }
    else
    {
      objc_msgSend(v8, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "becomeFirstResponder");
    }

    objc_msgSend(v13, "setOverlayViewInstalled:", 0);
    objc_msgSend(v8, "removeFromSuperview");

  }
}

@end
