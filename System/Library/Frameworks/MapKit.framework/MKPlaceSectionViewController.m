@implementation MKPlaceSectionViewController

- (void)loadView
{
  MKPlaceSectionView *v3;
  MKPlaceSectionView *v4;
  MKPlaceSectionView *sectionView;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = [MKPlaceSectionView alloc];
  v4 = -[MKPlaceSectionView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  sectionView = self->_sectionView;
  self->_sectionView = v4;

  -[MKPlaceSectionView setDelegate:](self->_sectionView, "setDelegate:", self);
  -[_MKStackView setStackAnimationDelegate:](self->_sectionView, "setStackAnimationDelegate:", self);
  -[MKPlaceSectionViewController setView:](self, "setView:", self->_sectionView);
  v8[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)-[MKPlaceSectionViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v6, sel_traitEnvironment_didChangeTraitCollection_);

}

- (void)dealloc
{
  objc_super v3;

  -[MKPlaceSectionView setDelegate:](self->_sectionView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceSectionViewController;
  -[MKPlaceSectionViewController dealloc](&v3, sel_dealloc);
}

- (MKPlaceSectionView)sectionView
{
  MKPlaceSectionView *sectionView;
  id v4;

  sectionView = self->_sectionView;
  if (!sectionView)
  {
    v4 = (id)-[MKPlaceSectionViewController view](self, "view");
    sectionView = self->_sectionView;
  }
  return sectionView;
}

- (void)stackViewNeedsLayout:(id)a3
{
  void *v3;
  id v4;

  -[MKPlaceSectionViewController parentViewController](self, "parentViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_layoutIfNeeded");

}

- (BOOL)_viewHostsLayoutEngineAllowsTAMIC_NO
{
  return 1;
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  -[MKPlaceSectionViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  if (v5 != v7 && (objc_opt_respondsToSelector() & 1) != 0)
    -[UIViewController infoCardThemeChanged](self, "infoCardThemeChanged");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end
