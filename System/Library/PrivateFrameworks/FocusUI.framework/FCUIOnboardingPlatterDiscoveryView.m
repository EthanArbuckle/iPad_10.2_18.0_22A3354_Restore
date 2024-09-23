@implementation FCUIOnboardingPlatterDiscoveryView

+ (id)onboardingPlatterDiscoveryViewForMode:(id)a3
{
  id v3;
  FCUIOnboardingPlatterDiscoveryView *v4;

  v3 = a3;
  v4 = -[FCUIOnboardingPlatterDiscoveryView initWithMode:]([FCUIOnboardingPlatterDiscoveryView alloc], "initWithMode:", v3);

  return v4;
}

- (FCUIOnboardingPlatterDiscoveryView)initWithMode:(id)a3
{
  id v4;
  FCUIOnboardingPlatterDiscoveryView *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FCUIOnboardingPlatterDiscoveryView;
  v5 = -[PLPlatterDiscoveryView init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "semanticType");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DISCOVERY_ONBOARDING_PLATTER_TITLE"), &stru_24D20B520, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterDiscoveryView setTitleText:](v5, "setTitleText:", v8);

    +[FCUIOnboardingPlatterDiscoveryView _bodyStringForDNDModeSemanticType:](FCUIOnboardingPlatterDiscoveryView, "_bodyStringForDNDModeSemanticType:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterDiscoveryView setBodyText:](v5, "setBodyText:", v9);

    v10 = (void *)MEMORY[0x24BEBD388];
    objc_msgSend(v4, "modeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCUIOnboardingPlatterDiscoveryView presentQuickStartForModeIdentifier:](v5, "presentQuickStartForModeIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", CFSTR("Customize"), 0, CFSTR("present-quickstart-sheet"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterDiscoveryView setDefaultAction:](v5, "setDefaultAction:", v13);

  }
  return v5;
}

+ (id)_bodyStringForDNDModeSemanticType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_LIST_MISSED_SECTION_HEADER_DO_NOT_DISTURB"), &stru_24D20B520, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DISCOVERY_ONBOARDING_PLATTER_BODY_DO_NOT_DISTURB_ALLOW");
      goto LABEL_12;
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DISCOVERY_ONBOARDING_PLATTER_BODY_SLEEP_ALLOW");
      goto LABEL_12;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DISCOVERY_ONBOARDING_PLATTER_BODY_DRIVING_ALLOW");
      goto LABEL_12;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DISCOVERY_ONBOARDING_PLATTER_BODY_FITNESS_ALLOW");
      goto LABEL_12;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DISCOVERY_ONBOARDING_PLATTER_BODY_WORK_ALLOW");
      goto LABEL_12;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DISCOVERY_ONBOARDING_PLATTER_BODY_PERSONAL_SILENCE");
      goto LABEL_12;
    case 6:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DISCOVERY_ONBOARDING_PLATTER_BODY_READING_ALLOW");
      goto LABEL_12;
    case 7:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DISCOVERY_ONBOARDING_PLATTER_BODY_GAMING_ALLOW");
      goto LABEL_12;
    case 8:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DISCOVERY_ONBOARDING_PLATTER_BODY_MINDFULNESS_ALLOW");
      goto LABEL_12;
    case 9:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DISCOVERY_ONBOARDING_PLATTER_BODY_REDUCE_INTERRUPTIONS_ALLOW");
LABEL_12:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24D20B520, 0);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
      break;
    default:
      return v5;
  }
  return v5;
}

- (id)presentQuickStartForModeIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  FCUIOnboardingPlatterDiscoveryView *v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__FCUIOnboardingPlatterDiscoveryView_presentQuickStartForModeIdentifier___block_invoke;
  v8[3] = &unk_24D20ABB8;
  objc_copyWeak(&v11, &location);
  v9 = v4;
  v10 = self;
  v5 = v4;
  v6 = _Block_copy(v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v6;
}

void __73__FCUIOnboardingPlatterDiscoveryView_presentQuickStartForModeIdentifier___block_invoke(uint64_t a1)
{
  _TtC7FocusUI24QuickStartViewController *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = -[QuickStartViewController initWithModeIdentifier:]([_TtC7FocusUI24QuickStartViewController alloc], "initWithModeIdentifier:", *(_QWORD *)(a1 + 32));
  -[QuickStartViewController setDelegate:](v2, "setDelegate:", WeakRetained);
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onboardingPlatter:requestsModalPresentationOfViewController:animated:completion:", *(_QWORD *)(a1 + 40), v2, 1, 0);

}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)FCUIOnboardingPlatterDiscoveryView;
  -[PLPlatterDiscoveryView layoutSubviews](&v3, sel_layoutSubviews);
  -[FCUIOnboardingPlatterDiscoveryView _configureGraphicViewIfNecessary](self, "_configureGraphicViewIfNecessary");
  -[FCUIOnboardingPlatterDiscoveryView bounds](self, "bounds");
  if (CGRectGetWidth(v4) > 0.0)
    -[FCUIOnboardingPlatterDiscoveryView _layoutGraphicView](self, "_layoutGraphicView");
}

- (void)_configureGraphicViewIfNecessary
{
  void *v3;
  FCUIOnboardingStackedNotificationView *v4;
  void *v5;
  FCUIOnboardingStackedNotificationView *v6;
  FCUIOnboardingStackedNotificationView *notificationPlatterView2;
  FCUIOnboardingStackedNotificationView *v8;
  void *v9;
  FCUIOnboardingStackedNotificationView *v10;
  FCUIOnboardingStackedNotificationView *notificationPlatterView1;
  id v12;

  -[PLPlatterDiscoveryView graphicView](self, "graphicView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v12 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    v4 = [FCUIOnboardingStackedNotificationView alloc];
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray3Color");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[FCUIOnboardingStackedNotificationView initWithBackgroundColor:assetImageName:](v4, "initWithBackgroundColor:assetImageName:", v5, 0);
    notificationPlatterView2 = self->_notificationPlatterView2;
    self->_notificationPlatterView2 = v6;

    objc_msgSend(v12, "addSubview:", self->_notificationPlatterView2);
    v8 = [FCUIOnboardingStackedNotificationView alloc];
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray2Color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FCUIOnboardingStackedNotificationView initWithBackgroundColor:assetImageName:](v8, "initWithBackgroundColor:assetImageName:", v9, CFSTR("person.circle.fill"));
    notificationPlatterView1 = self->_notificationPlatterView1;
    self->_notificationPlatterView1 = v10;

    objc_msgSend(v12, "addSubview:", self->_notificationPlatterView1);
    -[PLPlatterDiscoveryView setGraphicView:](self, "setGraphicView:", v12);

  }
}

- (void)_layoutGraphicView
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double Width;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  FCUIOnboardingStackedNotificationView *notificationPlatterView2;
  __int128 v27;
  FCUIOnboardingStackedNotificationView *v28;
  uint64_t v29;
  uint64_t v30;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGRect v36;
  CGRect v37;

  -[FCUIOnboardingPlatterDiscoveryView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;
  v30 = v4;

  -[PLPlatterDiscoveryView graphicView](self, "graphicView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v36.origin.x = v8;
  v36.origin.y = v10;
  v36.size.width = v12;
  v36.size.height = v14;
  Width = CGRectGetWidth(v36);
  v37.origin.x = v8;
  v37.origin.y = v10;
  v37.size.width = v12;
  v37.size.height = v14;
  v16 = (CGRectGetHeight(v37) + -44.0 + 4.0) / 1.5;
  if ((Width + -20.0) * 0.3 >= v16)
    v17 = v16;
  else
    v17 = (Width + -20.0) * 0.3;
  v29 = v5;
  UIRectCenteredIntegralRectScale();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  notificationPlatterView2 = self->_notificationPlatterView2;
  v27 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v35.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v35.c = v27;
  *(_OWORD *)&v35.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[FCUIOnboardingStackedNotificationView setTransform:](notificationPlatterView2, "setTransform:", &v35, v29);
  -[FCUIOnboardingStackedNotificationView setFrame:](self->_notificationPlatterView2, "setFrame:", v19, v21, v23, v25);
  memset(&v35, 0, sizeof(v35));
  CGAffineTransformMakeScale(&v35, 0.85, 0.85);
  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeTranslation(&v34, 0.0, v17 * 0.5);
  v28 = self->_notificationPlatterView2;
  t1 = v35;
  t2 = v34;
  CGAffineTransformConcat(&v33, &t1, &t2);
  -[FCUIOnboardingStackedNotificationView setTransform:](v28, "setTransform:", &v33);
  UIRectCenteredIntegralRectScale();
  -[FCUIOnboardingStackedNotificationView setFrame:](self->_notificationPlatterView1, "setFrame:", v30);
}

- (void)requestDismissal:(id)a3
{
  id v4;

  -[FCUIOnboardingPlatterDiscoveryView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "onboardingPlatterRequestsDismissal:", self);

}

- (FCUIOnboardingPlatterDiscoveryViewDelegate)delegate
{
  return (FCUIOnboardingPlatterDiscoveryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationPlatterView2, 0);
  objc_storeStrong((id *)&self->_notificationPlatterView1, 0);
}

@end
