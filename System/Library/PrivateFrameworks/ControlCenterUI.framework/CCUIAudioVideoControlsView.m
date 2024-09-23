@implementation CCUIAudioVideoControlsView

- (CCUIAudioVideoControlsView)initWithFrame:(CGRect)a3
{
  CCUIAudioVideoControlsView *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CCUIAudioVideoControlsView;
  v3 = -[CCUIAudioVideoControlsView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIAudioVideoControlsView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", v6);

    -[SBFView setAnimatedLayerProperties:](v3, "setAnimatedLayerProperties:", &unk_1E8D18848);
    -[CCUIAudioVideoControlsView setClipsToBounds:](v3, "setClipsToBounds:", 0);

  }
  return v3;
}

- (void)setBlurRadius:(double)a3
{
  void *v4;
  id v5;

  -[CCUIAudioVideoControlsView layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (CGRect)cachedExpandedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->cachedExpandedRect.origin.x;
  y = self->cachedExpandedRect.origin.y;
  width = self->cachedExpandedRect.size.width;
  height = self->cachedExpandedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->cachedExpandedRect = a3;
}

@end
