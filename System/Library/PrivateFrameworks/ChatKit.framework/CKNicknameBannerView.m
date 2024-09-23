@implementation CKNicknameBannerView

- (CKNicknameBannerView)initWithStyle:(unint64_t)a3 updates:(id)a4 useNamedTitles:(BOOL)a5 avatarImages:(id)a6 contacts:(id)a7 customImage:(id)a8 titleString:(id)a9 subtitleString:(id)a10 actionButtonTitle:(id)a11 actionButtonHandler:(id)a12 actionButtonMenuItems:(id)a13 xButtonHandler:(id)a14
{
  id v18;
  id v19;
  id v20;
  CKNicknameBannerView *v21;
  CKNicknameBannerView *v22;
  uint64_t v23;
  void *v24;
  char IsEmpty;
  char v26;
  void *v27;
  CKBannerButtonObject *v28;
  uint64_t v29;
  UIView *swiftBanner;
  uint64_t v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD aBlock[4];
  id v45;
  id v46;
  id location;
  objc_super v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v40 = a4;
  v35 = a6;
  v36 = a7;
  v37 = a8;
  v38 = a9;
  v39 = a10;
  v18 = a11;
  v19 = a12;
  v34 = a13;
  v20 = a14;
  v48.receiver = self;
  v48.super_class = (Class)CKNicknameBannerView;
  v21 = -[CKNicknameBannerView initWithFrame:](&v48, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v22 = v21;
  if (v21)
  {
    -[CKNicknameBannerView setStyle:](v21, "setStyle:", a3);
    -[CKNicknameBannerView setNicknameUpdates:](v22, "setNicknameUpdates:", v40);
    location = 0;
    objc_initWeak(&location, v22);
    v23 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __197__CKNicknameBannerView_initWithStyle_updates_useNamedTitles_avatarImages_contacts_customImage_titleString_subtitleString_actionButtonTitle_actionButtonHandler_actionButtonMenuItems_xButtonHandler___block_invoke;
    aBlock[3] = &unk_1E274B2E0;
    v45 = v19;
    objc_copyWeak(&v46, &location);
    v24 = _Block_copy(aBlock);
    IsEmpty = IMStringIsEmpty();
    if (v24)
      v26 = IsEmpty;
    else
      v26 = 1;
    if ((v26 & 1) != 0)
    {
      v27 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v28 = -[CKBannerButtonObject initWithTitle:handler:menuItems:]([CKBannerButtonObject alloc], "initWithTitle:handler:menuItems:", v18, v24, v34);
      v49[0] = v28;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v41[0] = v23;
    v41[1] = 3221225472;
    v41[2] = __197__CKNicknameBannerView_initWithStyle_updates_useNamedTitles_avatarImages_contacts_customImage_titleString_subtitleString_actionButtonTitle_actionButtonHandler_actionButtonMenuItems_xButtonHandler___block_invoke_2;
    v41[3] = &unk_1E274B308;
    v42 = v20;
    objc_copyWeak(&v43, &location);
    LOBYTE(v32) = 1;
    +[CKBannerViewFactory bannerWithTitle:subtitleString:avatarImages:contacts:customImage:actionButtonObjects:forceImageCentering:xButtonHandler:](_TtC7ChatKit19CKBannerViewFactory, "bannerWithTitle:subtitleString:avatarImages:contacts:customImage:actionButtonObjects:forceImageCentering:xButtonHandler:", v38, v39, v35, v36, v37, v27, v32, v41);
    v29 = objc_claimAutoreleasedReturnValue();
    swiftBanner = v22->_swiftBanner;
    v22->_swiftBanner = (UIView *)v29;

    -[CKNicknameBannerView addSubview:](v22, "addSubview:", v22->_swiftBanner);
    objc_destroyWeak(&v43);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }

  return v22;
}

void __197__CKNicknameBannerView_initWithStyle_updates_useNamedTitles_avatarImages_contacts_customImage_titleString_subtitleString_actionButtonTitle_actionButtonHandler_actionButtonMenuItems_xButtonHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  id v4;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, WeakRetained, v4);

}

void __197__CKNicknameBannerView_initWithStyle_updates_useNamedTitles_avatarImages_contacts_customImage_titleString_subtitleString_actionButtonTitle_actionButtonHandler_actionButtonMenuItems_xButtonHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIView sizeThatFits:](self->_swiftBanner, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  UIView *swiftBanner;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKNicknameBannerView;
  -[CKNicknameBannerView layoutSubviews](&v4, sel_layoutSubviews);
  swiftBanner = self->_swiftBanner;
  -[CKNicknameBannerView bounds](self, "bounds");
  -[UIView setFrame:](swiftBanner, "setFrame:");
  -[UIView sizeToFit](self->_swiftBanner, "sizeToFit");
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NSArray)nicknameUpdates
{
  return self->_nicknameUpdates;
}

- (void)setNicknameUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_nicknameUpdates, a3);
}

- (UIView)swiftBanner
{
  return self->_swiftBanner;
}

- (void)setSwiftBanner:(id)a3
{
  objc_storeStrong((id *)&self->_swiftBanner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftBanner, 0);
  objc_storeStrong((id *)&self->_nicknameUpdates, 0);
}

@end
