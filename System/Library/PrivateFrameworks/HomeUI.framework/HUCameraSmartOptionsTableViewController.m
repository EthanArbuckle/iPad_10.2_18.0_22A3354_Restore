@implementation HUCameraSmartOptionsTableViewController

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  objc_super v14;

  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedSectionIdentifierForSectionIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("HUCameraSmartDetectionSettingsOnOffSectionIdentifier"))|| (-[HUItemTableViewController itemManager](self, "itemManager"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v9, "sectionIndexForDisplayedSectionIdentifier:", CFSTR("HUCameraSmartDetectionSettingsMotionDetectionSectionIdentifier")), v9, v11 = 10.0, v10 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v14.receiver = self;
    v14.super_class = (Class)HUCameraSmartOptionsTableViewController;
    -[HUItemTableViewController tableView:heightForFooterInSection:](&v14, sel_tableView_heightForFooterInSection_, v6, a4);
    v11 = v12;
  }

  return v11;
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  void *v4;
  void *v5;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedSectionIdentifierForSectionIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", CFSTR("HUCameraSmartDetectionSettingsMotionDetectionSectionIdentifier"));
  return (char)v4;
}

@end
