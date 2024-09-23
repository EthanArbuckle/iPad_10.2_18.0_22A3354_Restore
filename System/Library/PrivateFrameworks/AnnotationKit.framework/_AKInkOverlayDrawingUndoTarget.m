@implementation _AKInkOverlayDrawingUndoTarget

- (_AKInkOverlayDrawingUndoTarget)initWithPageController:(id)a3
{
  id v4;
  _AKInkOverlayDrawingUndoTarget *v5;
  _AKInkOverlayDrawingUndoTarget *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_AKInkOverlayDrawingUndoTarget;
  v5 = -[_AKInkOverlayDrawingUndoTarget init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_pageController, v4);

  return v6;
}

- (void)performUndo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[_AKInkOverlayDrawingUndoTarget pageController](self, "pageController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "relinquishablesAreLoaded"))
    {
      objc_msgSend(v5, "inkPageOverlayController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "inkOverlayView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "canvasView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "drawing");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "drawingUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
      {
        objc_msgSend(v7, "canvasView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "performUndo:", v19);
LABEL_8:

      }
    }
    else
    {
      objc_msgSend(v5, "pageModelController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "inkCanvasAnnotation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v14;
      if (!v14)
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(v14, "drawing");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v5, "controller");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "undoController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "undoManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "actionName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setActionName:", v17);

        objc_msgSend(v19, "inverted");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "registerWithUndoManager:target:selector:", v13, self, sel_performUndo_);
        objc_msgSend(v19, "applyToDrawing:", v9);

        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (AKPageController)pageController
{
  return (AKPageController *)objc_loadWeakRetained((id *)&self->_pageController);
}

- (void)setPageController:(id)a3
{
  objc_storeWeak((id *)&self->_pageController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageController);
}

@end
