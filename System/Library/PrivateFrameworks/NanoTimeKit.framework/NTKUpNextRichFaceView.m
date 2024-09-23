@implementation NTKUpNextRichFaceView

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v12;

  v8 = a3;
  v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)NTKUpNextRichFaceView;
  v10 = -[NTKUpNextFaceView _newLegacyViewForComplication:family:slot:](&v12, sel__newLegacyViewForComplication_family_slot_, v8, a4, v9);
  if (!v10)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("top-left")))
    {
      +[NTKRichComplicationCircularBaseView viewWithLegacyComplicationType:](NTKRichComplicationCircularBaseView, "viewWithLegacyComplicationType:", objc_msgSend(v8, "complicationType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKUpNextRichFaceView;
  -[NTKUpNextFaceView _configureComplicationView:forSlot:](&v10, sel__configureComplicationView_forSlot_, v6, a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "transitionToMonochromeWithFraction:", 0.0);
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1F8E0B098))
  {
    v7 = (void *)MEMORY[0x1E0DC3658];
    v8 = v6;
    objc_msgSend(v7, "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlatterColor:", v9);

  }
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("top-left")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKUpNextRichFaceView;
    v5 = -[NTKFaceView _keylineStyleForComplicationSlot:](&v7, sel__keylineStyleForComplicationSlot_, v4);
  }

  return v5;
}

@end
