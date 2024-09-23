@implementation MKPlaceCardFooterActionsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[16];

  MKGetPlaceCardLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlaceCardFooterActionsViewDidLoad", (const char *)&unk_18B2CC343, buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)MKPlaceCardFooterActionsViewController;
  -[MKPlaceCardActionsViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[MKPlaceCardActionsViewController setHaveTwoColumns:](self, "setHaveTwoColumns:", 0);
  -[MKPlaceCardActionsViewController setAllowRowSelection:](self, "setAllowRowSelection:", 1);
  -[MKPlaceCardActionsViewController setShowTopButtonSeparator:](self, "setShowTopButtonSeparator:", objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_accessibilityTextEnabled"));
  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsBottomHairline:", 0);

  -[MKPlaceCardActionsViewController setShowTopSeparator:](self, "setShowTopSeparator:", 0);
  -[MKPlaceCardActionsViewController actionManager](self, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createFooterActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCardActionsViewController setActionItemArray:](self, "setActionItemArray:", v6);

  MKGetPlaceCardLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18B0B0000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlaceCardFooterActionsViewDidLoad", (const char *)&unk_18B2CC343, buf, 2u);
  }

}

- (void)reloadData
{
  void *v3;
  id v4;

  -[MKPlaceCardActionsViewController actionManager](self, "actionManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createFooterActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCardActionsViewController setActionItemArray:](self, "setActionItemArray:", v3);

}

@end
