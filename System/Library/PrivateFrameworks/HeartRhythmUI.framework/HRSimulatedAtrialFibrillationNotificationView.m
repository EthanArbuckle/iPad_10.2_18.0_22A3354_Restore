@implementation HRSimulatedAtrialFibrillationNotificationView

- (HRSimulatedAtrialFibrillationNotificationView)init
{
  HRSimulatedAtrialFibrillationNotificationView *v2;
  HRSimulatedAtrialFibrillationNotificationView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HRSimulatedAtrialFibrillationNotificationView *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HRSimulatedAtrialFibrillationNotificationView;
  v2 = -[HRSimulatedAtrialFibrillationNotificationView init](&v13, sel_init);
  if (!v2)
    return 0;
  v3 = v2;
  objc_msgSend(MEMORY[0x24BDF6AC8], "hrui_heartRateIconImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HRHeartRhythmUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_QUICK_LOOK_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HRHeartRhythmUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_QUICK_LOOK_SUBTITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedUppercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.231372549, 0.188235294, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (HRSimulatedAtrialFibrillationNotificationView *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A868]), "initWithIconImage:titleText:detailText:tintColor:", v4, v6, v9, v10);

  return v11;
}

@end
