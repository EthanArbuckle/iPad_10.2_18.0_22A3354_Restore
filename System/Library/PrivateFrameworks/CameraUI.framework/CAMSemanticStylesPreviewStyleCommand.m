@implementation CAMSemanticStylesPreviewStyleCommand

- (CAMSemanticStylesPreviewStyleCommand)initWithStyle:(id)a3
{
  id v5;
  CAMSemanticStylesPreviewStyleCommand *v6;
  CAMSemanticStylesPreviewStyleCommand *v7;
  CAMSemanticStylesPreviewStyleCommand *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMSemanticStylesPreviewStyleCommand;
  v6 = -[CAMCaptureCommand initWithSubcommands:](&v10, sel_initWithSubcommands_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__style, a3);
    v8 = v7;
  }

  return v7;
}

- (CAMSemanticStylesPreviewStyleCommand)initWithSubcommands:(id)a3
{
  return -[CAMSemanticStylesPreviewStyleCommand initWithStyle:](self, "initWithStyle:", 0);
}

- (void)executeWithContext:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "currentVideoPreviewLayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMSemanticStylesPreviewStyleCommand _style](self, "_style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isSemanticStyleRenderingEnabled"))
  {
    if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v4, "avSemanticStyle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSemanticStyle:animated:", v5, 0);

    }
  }

}

- (CEKCaptureStyle)_style
{
  return self->__style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__style, 0);
}

@end
