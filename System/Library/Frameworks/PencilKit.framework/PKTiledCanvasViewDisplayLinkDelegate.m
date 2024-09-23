@implementation PKTiledCanvasViewDisplayLinkDelegate

- (void)display:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKTiledCanvasViewDisplayLinkDelegate view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetTimestamp");
  objc_msgSend(v4, "_drawingDisplay:");

}

- (PKTiledCanvasView)view
{
  return (PKTiledCanvasView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
}

@end
