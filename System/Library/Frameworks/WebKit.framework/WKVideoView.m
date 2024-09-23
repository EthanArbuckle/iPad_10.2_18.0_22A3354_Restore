@implementation WKVideoView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (WKVideoView)initWithFrame:(CGRect)a3 playerView:(id)a4
{
  WKVideoView *v5;
  WKVideoView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WKVideoView;
  v5 = -[WKVideoView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_playerView = (WebAVPlayerLayerView *)a4;
    -[WKVideoView addSubview:](v5, "addSubview:", a4);
  }
  return v6;
}

- (CALayer)playerLayer
{
  return (CALayer *)-[WebAVPlayerLayerView layer](self->_playerView, "layer");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (-[WKVideoView pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y))
    return self;
  else
    return 0;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[WKVideoView subviews](self, "subviews", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        -[WKVideoView bounds](self, "bounds");
        objc_msgSend(v8, "setFrame:");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
}

@end
