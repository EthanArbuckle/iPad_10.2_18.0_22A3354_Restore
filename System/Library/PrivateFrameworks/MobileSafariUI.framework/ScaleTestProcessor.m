@implementation ScaleTestProcessor

- (BOOL)startPageAction:(id)a3
{
  int v4;
  id v5;
  void *v6;
  double v7;
  void *v8;

  v4 = *(_DWORD *)(&self->super._showRenderFps + 1);
  v5 = a3;
  -[PageLoadTestRunner browserController](self, "browserController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = v4;
  objc_msgSend(v6, "setZoomScale:", v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startRenderTime:", v8);

  -[ScaleTestProcessor performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_doneRendering_, v5, 0.0);
  return 1;
}

- (void)setZoomScale:(float)a3
{
  *(float *)(&self->super._showRenderFps + 1) = a3;
}

- (void)doneRendering:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v6 = a3;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishRenderTime:", v5);

  -[PageLoadTestRunner finishPage:stats:error:](self, "finishPage:stats:error:", v6, 0, 0);
}

@end
