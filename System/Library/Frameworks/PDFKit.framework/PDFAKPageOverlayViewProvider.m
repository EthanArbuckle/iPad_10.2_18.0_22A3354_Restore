@implementation PDFAKPageOverlayViewProvider

- (PDFAKPageOverlayViewProvider)initWithPDFDocument:(id)a3 pdfView:(id)a4 andAKController:(id)a5
{
  id v8;
  id v9;
  id v10;
  PDFAKPageOverlayViewProvider *v11;
  PDFAKPageOverlayViewProvider *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PDFAKPageOverlayViewProvider;
  v11 = -[PDFAKPageOverlayViewProvider init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_pdfDocument, v8);
    objc_storeWeak((id *)&v12->_pdfView, v9);
    objc_storeWeak((id *)&v12->_akController, v10);
  }

  return v12;
}

- (id)pdfView:(id)a3 overlayViewForPage:(id)a4
{
  PDFDocument **p_pdfDocument;
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  void *v10;

  p_pdfDocument = &self->_pdfDocument;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_pdfDocument);
  v8 = objc_msgSend(WeakRetained, "indexForPage:", v6);

  v9 = objc_loadWeakRetained((id *)&self->_akController);
  if ((objc_msgSend(v9, "isOverlayViewLoadedAtIndex:", v8) & 1) == 0)
    objc_msgSend(v9, "prepareOverlayAtIndex:", v8);
  objc_msgSend(v9, "overlayViewAtIndex:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)pdfView:(id)a3 willEndDisplayingOverlayView:(id)a4 forPage:(id)a5
{
  PDFDocument **p_pdfDocument;
  id v7;
  id WeakRetained;
  uint64_t v9;
  id v10;

  p_pdfDocument = &self->_pdfDocument;
  v7 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_pdfDocument);
  v9 = objc_msgSend(WeakRetained, "indexForPage:", v7);

  v10 = objc_loadWeakRetained((id *)&self->_akController);
  objc_msgSend(v10, "relinquishOverlayAtIndex:", v9);

}

- (BOOL)shouldVerticallyFlipOverlayViews
{
  return 1;
}

- (void)setupGestureRecognizersForView:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[6];

  v45[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_akController);
  v6 = WeakRetained;
  if (v4 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "tapGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v7;
    objc_msgSend(v6, "doubleTapGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v8;
    objc_msgSend(v6, "pressGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v9;
    objc_msgSend(v6, "panGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v10;
    objc_msgSend(v6, "rotationGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v45[4] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v41;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v41 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v4, "addGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v17++), (_QWORD)v40);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v15);
    }

    objc_msgSend(v4, "tapGestureRecognizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tapGestureRecognizer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requireGestureRecognizerToFail:", v19);

    objc_msgSend(v4, "longPressGestureRecognizer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tapGestureRecognizer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "requireGestureRecognizerToFail:", v21);

    objc_msgSend(v4, "longPressGestureRecognizer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pressGestureRecognizer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "requireGestureRecognizerToFail:", v23);

    objc_msgSend(v4, "longPressGestureRecognizer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "panGestureRecognizer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "requireGestureRecognizerToFail:", v25);

    objc_msgSend(v4, "longPressGestureRecognizer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rotationGestureRecognizer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "requireGestureRecognizerToFail:", v27);

    if (objc_msgSend(v4, "isUsingPageViewController"))
    {
      objc_msgSend(v4, "documentViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "scrollView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v4, "documentScrollView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v29, "panGestureRecognizer", (_QWORD)v40);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "panGestureRecognizer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "requireGestureRecognizerToFail:", v31);

    objc_msgSend(v29, "panGestureRecognizer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rotationGestureRecognizer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "requireGestureRecognizerToFail:", v33);

    objc_msgSend(v29, "pinchGestureRecognizer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "panGestureRecognizer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "requireGestureRecognizerToFail:", v35);

    objc_msgSend(v29, "pinchGestureRecognizer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rotationGestureRecognizer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "requireGestureRecognizerToFail:", v37);

    v38 = objc_msgSend(v4, "scrollViewMinimumNumberOfTouches");
    objc_msgSend(v29, "panGestureRecognizer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setMinimumNumberOfTouches:", v38);

  }
}

- (void)teardownGestureRecognizersForView:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_akController);
  v6 = WeakRetained;
  if (v4 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "tapGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    objc_msgSend(v6, "doubleTapGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v8;
    objc_msgSend(v6, "pressGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v9;
    objc_msgSend(v6, "panGestureRecognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v10;
    objc_msgSend(v6, "rotationGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[4] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v4, "removeGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), (_QWORD)v18);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v15);
    }

  }
}

- (void)overlayViewInstalledForPage:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_akController);
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_pdfView);
    v7 = objc_loadWeakRetained((id *)&self->_pdfDocument);
    v8 = objc_msgSend(v7, "indexForPage:", v4);

    if (objc_msgSend(v6, "isUsingPageViewController"))
    {
      objc_msgSend(v6, "documentViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "findPageViewControllerForPageIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "scrollView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "panGestureRecognizer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "panGestureRecognizer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "requireGestureRecognizerToFail:", v14);

        objc_msgSend(v12, "panGestureRecognizer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "rotationGestureRecognizer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "requireGestureRecognizerToFail:", v16);

        objc_msgSend(v12, "pinchGestureRecognizer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "panGestureRecognizer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "requireGestureRecognizerToFail:", v18);

        objc_msgSend(v12, "pinchGestureRecognizer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "rotationGestureRecognizer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "requireGestureRecognizerToFail:", v20);

        v21 = objc_msgSend(v6, "scrollViewMinimumNumberOfTouches");
        objc_msgSend(v12, "panGestureRecognizer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setMinimumNumberOfTouches:", v21);

      }
    }
    objc_msgSend(v6, "pageViewForPageAtIndex:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v35 = v6;
      objc_msgSend(WeakRetained, "tapGestureRecognizer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = WeakRetained;
      objc_msgSend(WeakRetained, "panGestureRecognizer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v34 = v23;
      objc_msgSend(v23, "subviews");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v39)
      {
        v38 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v45 != v38)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      continue;
                  }
                }
              }
            }
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            objc_msgSend(v27, "gestureRecognizers");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v41;
              do
              {
                for (j = 0; j != v30; ++j)
                {
                  if (*(_QWORD *)v41 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    objc_msgSend(v33, "requireGestureRecognizerToFail:", v24);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    objc_msgSend(v33, "requireGestureRecognizerToFail:", v25);
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
              }
              while (v30);
            }

          }
          v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        }
        while (v39);
      }

      WeakRetained = v36;
      v23 = v34;
      v6 = v35;
    }

  }
}

- (void)overlayViewWillBeUninstalledForPage:(id)a3
{
  id WeakRetained;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  if (objc_msgSend(WeakRetained, "isUsingPageViewController"))
  {
    v5 = objc_loadWeakRetained((id *)&self->_pdfDocument);
    v6 = objc_msgSend(v5, "indexForPage:", v19);

    objc_msgSend(WeakRetained, "documentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "findPageViewControllerForPageIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_loadWeakRetained((id *)&self->_akController);
      if (v9)
      {
        objc_msgSend(v8, "scrollView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "panGestureRecognizer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "panGestureRecognizer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeFailureRequirement:", v12);

        objc_msgSend(v10, "panGestureRecognizer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "rotationGestureRecognizer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeFailureRequirement:", v14);

        objc_msgSend(v10, "pinchGestureRecognizer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "panGestureRecognizer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeFailureRequirement:", v16);

        objc_msgSend(v10, "pinchGestureRecognizer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "rotationGestureRecognizer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeFailureRequirement:", v18);

      }
    }

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pdfView);
  objc_destroyWeak((id *)&self->_akController);
  objc_destroyWeak((id *)&self->_pdfDocument);
}

@end
