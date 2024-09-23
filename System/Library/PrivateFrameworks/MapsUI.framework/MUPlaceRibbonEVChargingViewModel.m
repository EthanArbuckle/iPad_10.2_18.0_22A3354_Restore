@implementation MUPlaceRibbonEVChargingViewModel

- (MUPlaceRibbonEVChargingViewModel)initWithAvailabilityProvider:(id)a3
{
  id v4;
  MUPlaceRibbonEVChargingViewModel *v5;
  MUPlaceRibbonEVChargingViewModel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MUPlaceRibbonEVChargingViewModel;
  v5 = -[MUPlaceRibbonEVChargingViewModel init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MUPlaceRibbonEVChargingViewModel setAvailabilityProvider:](v5, "setAvailabilityProvider:", v4);
    -[MUPlaceRibbonEVChargingViewModel _updateStringProviders](v6, "_updateStringProviders");
    objc_msgSend(v4, "registerObserver:", v6);
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MUPlaceRibbonEVChargingViewModel availabilityProvider](self, "availabilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MUPlaceRibbonEVChargingViewModel;
  -[MUPlaceRibbonEVChargingViewModel dealloc](&v4, sel_dealloc);
}

- (void)_updateStringProviders
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[4];
  id v15;

  -[MUPlaceRibbonEVChargingViewModel availabilityProvider](self, "availabilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "aggregatedInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");

  if (v6)
    v7 = CFSTR("Available Now [Placecard ribbon item title]");
  else
    v7 = CFSTR("Chargers [EV Charging]");
  _MULocalizedStringFromThisBundle(v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
  aBlock[3] = &unk_1E2E03548;
  v15 = v8;
  v10 = _Block_copy(aBlock);

  -[MUPlaceRibbonItemViewModel setTitleStringProvider:](self, "setTitleStringProvider:", v10);
  -[MUPlaceRibbonItemViewModel setTypeStringForAX:](self, "setTypeStringForAX:", CFSTR("EVChargingAvailability"));
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __58__MUPlaceRibbonEVChargingViewModel__updateStringProviders__block_invoke;
  v12[3] = &unk_1E2E03548;
  v13 = v4;
  v11 = v4;
  -[MUPlaceRibbonItemViewModel setValueStringProvider:](self, "setValueStringProvider:", v12);

}

id __58__MUPlaceRibbonEVChargingViewModel__updateStringProviders__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  objc_class *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_fontWithWeight:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithFont:scale:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MURealTimeEVChargerUtility evPlugIconWithConfiguration:](MURealTimeEVChargerUtility, "evPlugIconWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:](MUInfoCardStyle, "resolvedPrimaryColorForProposedColor:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)MEMORY[0x1E0DC12B0];
  v10 = v6;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v10, "imageWithRenderingMode:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v10;

  objc_msgSend(v11, "setImage:", v12);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v13);
  v57 = *MEMORY[0x1E0DC1140];
  v59 = *MEMORY[0x1E0DC1140];
  v60[0] = v8;
  v15 = (void *)MEMORY[0x1E0C99D80];
  v16 = v8;
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addAttributes:range:", v17, 0, objc_msgSend(v14, "length"));
  v18 = (void *)objc_msgSend(v14, "copy");

  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v19, "addObject:", v18);
  objc_msgSend(*(id *)(a1 + 32), "aggregatedInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "status");

  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 32), "aggregatedInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "available");
    objc_msgSend(*(id *)(a1 + 32), "aggregatedInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUEVChargingHelper localizedStringForAvailableChargers:outOfTotal:](MUEVChargingHelper, "localizedStringForAvailableChargers:outOfTotal:", v23, objc_msgSend(v24, "total"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "aggregatedInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v18;
    v55 = v21;
    if (objc_msgSend(v26, "available"))
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x1E0DC3870];
    v36 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "configurationWithFont:scale:", v37, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "systemImageNamed:withConfiguration:", CFSTR("dot.radiowaves.up.forward"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "imageWithRenderingMode:", 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v41 = (id)objc_claimAutoreleasedReturnValue();
    v42 = (objc_class *)MEMORY[0x1E0DC12B0];
    v34 = v40;
    v43 = objc_alloc_init(v42);
    objc_msgSend(v34, "imageWithRenderingMode:", 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "setImage:", v44);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v45);
    v59 = v57;
    v60[0] = v41;
    v47 = (void *)MEMORY[0x1E0C99D80];
    v48 = v41;
    objc_msgSend(v47, "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "addAttributes:range:", v49, 0, objc_msgSend(v46, "length"));
    v50 = (void *)objc_msgSend(v46, "copy");

    +[MUPlaceRibbonEVChargingViewModel attributedStringFromString:color:](MUPlaceRibbonEVChargingViewModel, "attributedStringFromString:color:", CFSTR(" "), v33);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v51);
    +[MUPlaceRibbonEVChargingViewModel attributedStringFromString:color:](MUPlaceRibbonEVChargingViewModel, "attributedStringFromString:color:", v25, v33);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v52);

    objc_msgSend(v19, "addObject:", v51);
    objc_msgSend(v19, "addObject:", v50);

    v18 = v56;
    v21 = v55;
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB37F0];
    v28 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "aggregatedInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v29, "total"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringFromNumber:numberStyle:", v30, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPlaceRibbonEVChargingViewModel attributedStringFromString:color:](MUPlaceRibbonEVChargingViewModel, "attributedStringFromString:color:", CFSTR(" "), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v32);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUPlaceRibbonEVChargingViewModel attributedStringFromString:color:](MUPlaceRibbonEVChargingViewModel, "attributedStringFromString:color:", v25, v33);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v34);
  }

  +[MapsUILayout buildAttributedDisplayStringForComponents:reverseIfRTLLayout:](MapsUILayout, "buildAttributedDisplayStringForComponents:reverseIfRTLLayout:", v19, v21 == 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

+ (id)attributedStringFromString:(id)a3 color:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3498];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC1140];
  v16[0] = *MEMORY[0x1E0DC1138];
  v16[1] = v10;
  v17[0] = v9;
  v17[1] = v5;
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = v5;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v8, "initWithString:attributes:", v7, v13);
  return v14;
}

- (void)evChargerAvailabilityProvider:(id)a3 didUpdateAvailability:(id)a4
{
  id v5;

  -[MUPlaceRibbonEVChargingViewModel _updateStringProviders](self, "_updateStringProviders", a3, a4);
  -[MUPlaceRibbonItemViewModel updateDelegate](self, "updateDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ribbonItemViewModelDidUpdate:", self);

}

- (id)typeStringForAX
{
  return CFSTR("EVCharging");
}

- (_TtC6MapsUI31MUEVChargerAvailabilityProvider)availabilityProvider
{
  return self->_availabilityProvider;
}

- (void)setAvailabilityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityProvider, 0);
}

@end
