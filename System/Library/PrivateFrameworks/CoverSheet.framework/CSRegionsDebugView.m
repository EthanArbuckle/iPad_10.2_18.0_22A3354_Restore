@implementation CSRegionsDebugView

- (CSRegionsDebugView)initWithFrame:(CGRect)a3
{
  CSRegionsDebugView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSRegionsDebugView;
  v3 = -[CSRegionsDebugView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSRegionsDebugView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[CSRegionsDebugView bs_setHitTestingDisabled:](v3, "bs_setHitTestingDisabled:", 1);
  }
  return v3;
}

- (void)setRegions:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_regions != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_regions, a3);
    -[CSRegionsDebugView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;
  CGRect v17;

  v16 = *MEMORY[0x1E0C80C00];
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 0.3);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v5, "CGColor"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_regions;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "extent", (_QWORD)v11);
        CGContextFillRect(CurrentContext, v17);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSArray)regions
{
  return self->_regions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regions, 0);
}

@end
