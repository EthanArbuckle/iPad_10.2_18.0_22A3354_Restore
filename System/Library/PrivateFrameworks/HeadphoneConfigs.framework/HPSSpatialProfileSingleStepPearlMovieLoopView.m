@implementation HPSSpatialProfileSingleStepPearlMovieLoopView

- (HPSSpatialProfileSingleStepPearlMovieLoopView)initWithFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  HPSSpatialProfileSingleStepPearlMovieLoopView *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("HRTF_Tutorial_A"), CFSTR("mov"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)HPSSpatialProfileSingleStepPearlMovieLoopView;
  v6 = -[HPSMovieLoopPlayer initWithFrame:urlForResource:](&v8, sel_initWithFrame_urlForResource_, v5, 0.0, 0.0, 250.0, 144.0);

  return v6;
}

@end
