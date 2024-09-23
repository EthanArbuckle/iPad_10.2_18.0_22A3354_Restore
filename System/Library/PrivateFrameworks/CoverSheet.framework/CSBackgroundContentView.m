@implementation CSBackgroundContentView

- (CSBackgroundContentView)initWithPresentationView:(id)a3
{
  id v5;
  CSBackgroundContentView *v6;
  CSBackgroundContentView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSBackgroundContentView;
  v6 = -[CSBackgroundContentView init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentationView, a3);
    -[CSBackgroundContentView addSubview:](v7, "addSubview:", v7->_presentationView);
  }

  return v7;
}

- (void)layoutSubviews
{
  UIScenePresentation *presentationView;

  presentationView = self->_presentationView;
  -[CSBackgroundContentView bounds](self, "bounds");
  -[UIScenePresentation setFrame:](presentationView, "setFrame:");
}

- (UIScenePresentation)presentationView
{
  return self->_presentationView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationView, 0);
}

@end
