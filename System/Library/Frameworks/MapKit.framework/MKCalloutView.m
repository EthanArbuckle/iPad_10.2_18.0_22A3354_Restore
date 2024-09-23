@implementation MKCalloutView

- (MKCalloutView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (MKCalloutView)initWithCoder:(id)a3
{

  return 0;
}

- (MKCalloutView)initWithAnnotationView:(id)a3
{
  id v4;
  MKCalloutView *v5;
  MKCalloutView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKCalloutView;
  v5 = -[MKCalloutView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_annotationView, v4);
  -[MKCalloutView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("MKCalloutView"));

  return v6;
}

- (void)showAnimated:(BOOL)a3 completionBlock:(id)a4
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("Subclass must implement -[%@ %@]"), v9, v8);

}

- (void)dismissAnimated:(BOOL)a3 completionBlock:(id)a4
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("Subclass must implement -[%@ %@]"), v9, v8);

}

- (BOOL)isVisible
{
  void *v2;
  BOOL v3;

  -[MKCalloutView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)hasPendingVisibility
{
  return 0;
}

- (int64_t)anchorPosition
{
  return 2;
}

- (MKAnnotationView)annotationView
{
  return (MKAnnotationView *)objc_loadWeakRetained((id *)&self->_annotationView);
}

- (BOOL)parallaxEnabled
{
  return self->_parallaxEnabled;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_annotationView);
}

@end
