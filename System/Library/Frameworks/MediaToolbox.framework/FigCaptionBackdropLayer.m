@implementation FigCaptionBackdropLayer

+ (void)initialize
{
  objc_opt_class();
}

- (FigCaptionBackdropLayer)init
{
  FigCaptionBackdropLayer *v2;
  FigCaptionBackdropLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCaptionBackdropLayer;
  v2 = -[FigBaseCABackdropLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[FigCaptionBackdropLayer configure](v2, "configure");
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = *(void **)&self->super._preventsChangesToSublayerHierarchy;
  if (v3)

  v4.receiver = self;
  v4.super_class = (Class)FigCaptionBackdropLayer;
  -[FigCaptionBackdropLayer dealloc](&v4, sel_dealloc);
}

- (void)configure
{
  id v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[FigCaptionBackdropLayer setHidden:](self, "setHidden:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[FigCaptionBackdropLayer setValue:forKey:](self, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("allowsInPlaceFiltering"));
  v3 = objc_alloc(MEMORY[0x1E0CD2780]);
  v4 = (void *)objc_msgSend(v3, "initWithType:", *MEMORY[0x1E0CD2C10]);
  *(_QWORD *)&self->super._preventsChangesToSublayerHierarchy = v4;
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0), CFSTR("inputAmount"));
  v5[0] = *(_QWORD *)&self->super._preventsChangesToSublayerHierarchy;
  -[FigCaptionBackdropLayer setFilters:](self, "setFilters:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1));
}

- (void)insertBackdropAsSublayerToLayer:(id)a3 below:(id)a4
{
  if (a3 && a4)
    objc_msgSend(a3, "insertSublayer:below:", self);
  else
    FigSignalErrorAt();
}

@end
