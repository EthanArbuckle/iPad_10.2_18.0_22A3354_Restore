@implementation MUPlaceFooterActionsSectionController

- (MUPlaceFooterActionsSectionController)initWithMapItem:(id)a3 actionManager:(id)a4
{
  id v6;
  MUPlaceFooterActionsSectionController *v7;
  MUFooterActionsSectionController *v8;
  MUFooterActionsSectionController *underlyingSectionController;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MUPlaceFooterActionsSectionController;
  v7 = -[MUPlaceSectionController initWithMapItem:](&v11, sel_initWithMapItem_, a3);
  if (v7)
  {
    v8 = -[MUFooterActionsSectionController initWithActionManager:]([MUFooterActionsSectionController alloc], "initWithActionManager:", v6);
    underlyingSectionController = v7->_underlyingSectionController;
    v7->_underlyingSectionController = v8;

  }
  return v7;
}

- (UIView)sectionView
{
  return -[MUFooterActionsSectionController sectionView](self->_underlyingSectionController, "sectionView");
}

- (void)reloadData
{
  -[MUFooterActionsSectionController reloadData](self->_underlyingSectionController, "reloadData");
}

- (int)analyticsModuleType
{
  return 23;
}

- (id)analyticsModule
{
  return (id)objc_msgSend(MEMORY[0x1E0D26EB0], "moduleFromModuleType:", -[MUPlaceFooterActionsSectionController analyticsModuleType](self, "analyticsModuleType"));
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSectionController, 0);
}

@end
