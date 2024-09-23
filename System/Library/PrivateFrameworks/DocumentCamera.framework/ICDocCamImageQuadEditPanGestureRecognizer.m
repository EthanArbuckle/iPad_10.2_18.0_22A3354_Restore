@implementation ICDocCamImageQuadEditPanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDocCamImageQuadEditPanGestureRecognizer;
  -[ICDocCamImageQuadEditPanGestureRecognizer touchesBegan:withEvent:](&v6, sel_touchesBegan_withEvent_, a3, a4);
  if (-[ICDocCamImageQuadEditPanGestureRecognizer state](self, "state") <= 0)
  {
    -[ICDocCamImageQuadEditPanGestureRecognizer setState:](self, "setState:", 1);
    -[ICDocCamImageQuadEditPanGestureRecognizer quadEditorDelegate](self, "quadEditorDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "touchesBeganOnQuadEditPanGestureRecognizerDelegate:", self);

  }
}

- (ICDocCamImageQuadEditPanGestureRecognizerDelegate)quadEditorDelegate
{
  return (ICDocCamImageQuadEditPanGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_quadEditorDelegate);
}

- (void)setQuadEditorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_quadEditorDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_quadEditorDelegate);
}

@end
