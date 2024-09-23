@implementation FUFlightInfoView

+ (id)flightViewForStyle:(unint64_t)a3 compact:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadNibNamed:owner:options:", CFSTR("FUFlightInfoView"), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v11;
          objc_msgSend(v8, "setupLabelStylesWithStyle:", a3, (_QWORD)v13);
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
    -[FUFlightInfoView setupLabelStylesWithStyle:](self, "setupLabelStylesWithStyle:");
}

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FUFlightInfoView;
  -[FUFlightInfoView awakeFromNib](&v3, sel_awakeFromNib);
  self->_awake = 1;
  if (self->_style)
    -[FUFlightInfoView setupLabelStylesWithStyle:](self, "setupLabelStylesWithStyle:");
}

- (double)standardTableCellContentInset
{
  void *v2;
  double v3;
  CGRect v5;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  if (CGRectGetWidth(v5) < 414.0)
    v3 = 16.0;
  else
    v3 = 20.0;

  return v3;
}

- (void)setupLabelStylesWithStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  id location;

  self->_style = a3;
  if (self->_awake)
  {
    +[FUStyleProvider providerForStyle:](FUStyleProvider, "providerForStyle:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_styleProvider, v4);
    -[FUFlightInfoView labelAirlineName](self, "labelAirlineName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelFlightCode](self, "labelFlightCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStyleProvider:primaryStyle:", v4, 0);

    -[FUFlightInfoView labelStatusTitle](self, "labelStatusTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelStatus](self, "labelStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelDepartureCity](self, "labelDepartureCity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStyleProvider:primaryStyle:", v4, 0);

    -[FUFlightInfoView labelDepartureCode](self, "labelDepartureCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelDepartureInfo1](self, "labelDepartureInfo1");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStyleProvider:primaryStyle:", v4, 0);

    -[FUFlightInfoView labelDepartureInfo2](self, "labelDepartureInfo2");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStyleProvider:primaryStyle:", v4, 0);

    -[FUFlightInfoView labelArrivalCity](self, "labelArrivalCity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStyleProvider:primaryStyle:", v4, 0);

    -[FUFlightInfoView labelArrivalCode](self, "labelArrivalCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelArrivalInfo1](self, "labelArrivalInfo1");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setStyleProvider:primaryStyle:", v4, 0);

    -[FUFlightInfoView labelArrivalInfo2](self, "labelArrivalInfo2");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setStyleProvider:primaryStyle:", v4, 0);

    -[FUFlightInfoView labelDepartureTitle](self, "labelDepartureTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelArrivalTitle](self, "labelArrivalTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelDepartureDate](self, "labelDepartureDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelArrivalDate](self, "labelArrivalDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelDepartureTime](self, "labelDepartureTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelArrivalTime](self, "labelArrivalTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelDepartureDelay](self, "labelDepartureDelay");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setStyleProvider:primaryStyle:", v4, 0);

    -[FUFlightInfoView labelArrivalDelay](self, "labelArrivalDelay");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setStyleProvider:primaryStyle:", v4, 0);

    -[FUFlightInfoView labelDurationTitle](self, "labelDurationTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelDurationValue](self, "labelDurationValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelDurationComplete](self, "labelDurationComplete");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setStyleProvider:primaryStyle:", v4, 0);

    -[FUFlightInfoView labelBaggageClaimTitle](self, "labelBaggageClaimTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelBaggageClaimValue](self, "labelBaggageClaimValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setStyleProvider:primaryStyle:", v4, 1);

    -[FUFlightInfoView labelStatusTitle](self, "labelStatusTitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelAirlineName](self, "labelAirlineName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAssociatedScalingLabel:", v30);

    -[FUFlightInfoView labelAirlineName](self, "labelAirlineName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelStatusTitle](self, "labelStatusTitle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAssociatedScalingLabel:", v32);

    -[FUFlightInfoView labelStatus](self, "labelStatus");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelFlightCode](self, "labelFlightCode");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAssociatedScalingLabel:", v34);

    -[FUFlightInfoView labelFlightCode](self, "labelFlightCode");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelStatus](self, "labelStatus");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAssociatedScalingLabel:", v36);

    -[FUFlightInfoView labelArrivalCity](self, "labelArrivalCity");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDepartureCity](self, "labelDepartureCity");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAssociatedScalingLabel:", v38);

    -[FUFlightInfoView labelDepartureCity](self, "labelDepartureCity");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelArrivalCity](self, "labelArrivalCity");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAssociatedScalingLabel:", v40);

    -[FUFlightInfoView labelDepartureCode](self, "labelDepartureCode");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelArrivalCode](self, "labelArrivalCode");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setAssociatedScalingLabel:", v42);

    -[FUFlightInfoView labelArrivalCode](self, "labelArrivalCode");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDepartureCode](self, "labelDepartureCode");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAssociatedScalingLabel:", v44);

    -[FUFlightInfoView labelArrivalInfo1](self, "labelArrivalInfo1");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDepartureInfo1](self, "labelDepartureInfo1");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAssociatedScalingLabel:", v46);

    -[FUFlightInfoView labelDepartureInfo1](self, "labelDepartureInfo1");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelArrivalInfo1](self, "labelArrivalInfo1");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setAssociatedScalingLabel:", v48);

    -[FUFlightInfoView labelArrivalInfo2](self, "labelArrivalInfo2");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDepartureInfo2](self, "labelDepartureInfo2");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setAssociatedScalingLabel:", v50);

    -[FUFlightInfoView labelDepartureInfo2](self, "labelDepartureInfo2");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelArrivalInfo2](self, "labelArrivalInfo2");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setAssociatedScalingLabel:", v52);

    -[FUFlightInfoView labelDepartureTime](self, "labelDepartureTime");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDepartureTitle](self, "labelDepartureTitle");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setAssociatedScalingLabel:", v54);

    -[FUFlightInfoView labelDepartureTitle](self, "labelDepartureTitle");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDepartureTime](self, "labelDepartureTime");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setAssociatedScalingLabel:", v56);

    -[FUFlightInfoView labelDepartureDate](self, "labelDepartureDate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDepartureDelay](self, "labelDepartureDelay");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setAssociatedScalingLabel:", v58);

    -[FUFlightInfoView labelDepartureDelay](self, "labelDepartureDelay");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDepartureDate](self, "labelDepartureDate");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setAssociatedScalingLabel:", v60);

    -[FUFlightInfoView labelArrivalTime](self, "labelArrivalTime");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelArrivalTitle](self, "labelArrivalTitle");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setAssociatedScalingLabel:", v62);

    -[FUFlightInfoView labelArrivalTitle](self, "labelArrivalTitle");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelArrivalTime](self, "labelArrivalTime");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setAssociatedScalingLabel:", v64);

    -[FUFlightInfoView labelArrivalDate](self, "labelArrivalDate");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelArrivalDelay](self, "labelArrivalDelay");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setAssociatedScalingLabel:", v66);

    -[FUFlightInfoView labelArrivalDelay](self, "labelArrivalDelay");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelArrivalDate](self, "labelArrivalDate");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setAssociatedScalingLabel:", v68);

    -[FUFlightInfoView labelDurationValue](self, "labelDurationValue");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDurationTitle](self, "labelDurationTitle");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setAssociatedScalingLabel:", v70);

    -[FUFlightInfoView labelDurationTitle](self, "labelDurationTitle");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDurationValue](self, "labelDurationValue");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setAssociatedScalingLabel:", v72);

    -[FUFlightInfoView labelBaggageClaimValue](self, "labelBaggageClaimValue");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelBaggageClaimTitle](self, "labelBaggageClaimTitle");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setAssociatedScalingLabel:", v74);

    -[FUFlightInfoView labelBaggageClaimTitle](self, "labelBaggageClaimTitle");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelBaggageClaimValue](self, "labelBaggageClaimValue");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setAssociatedScalingLabel:", v76);

    -[FUFlightInfoView standardTableCellContentInset](self, "standardTableCellContentInset");
    v79 = v78;
    -[FUFlightInfoView leadingInset](self, "leadingInset");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setConstant:", v79);

    -[FUFlightInfoView trailingInset](self, "trailingInset");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setConstant:", v79);

    if (self->_spotlightMode)
      v79 = 0.0;
    -[FUFlightInfoView trailingSeparatorsInset](self, "trailingSeparatorsInset");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setConstant:", v79);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "addObserver:selector:name:object:", self, sel_updateFlightDates, *MEMORY[0x24BDBCA70], 0);

    objc_initWeak(&location, self);
    v84 = MEMORY[0x24BDAC760];
    v89[0] = MEMORY[0x24BDAC760];
    v89[1] = 3221225472;
    v89[2] = __46__FUFlightInfoView_setupLabelStylesWithStyle___block_invoke;
    v89[3] = &unk_24ED16180;
    objc_copyWeak(&v90, &location);
    -[FUFlightInfoView labelDepartureCode](self, "labelDepartureCode");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setOnTap:", v89);

    v87[0] = v84;
    v87[1] = 3221225472;
    v87[2] = __46__FUFlightInfoView_setupLabelStylesWithStyle___block_invoke_2;
    v87[3] = &unk_24ED16180;
    objc_copyWeak(&v88, &location);
    -[FUFlightInfoView labelArrivalCode](self, "labelArrivalCode");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setOnTap:", v87);

    -[FUFlightInfoView updateFlightStatus](self, "updateFlightStatus");
    objc_destroyWeak(&v88);
    objc_destroyWeak(&v90);
    objc_destroyWeak(&location);

  }
}

void __46__FUFlightInfoView_setupLabelStylesWithStyle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "currentFocus");
    v2 = v5;
    if (v3)
    {
      objc_msgSend(v5, "setCurrentFocus:", 0);
      objc_msgSend(v5, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "flightInfoView:didUpdateFocus:", v5, objc_msgSend(v5, "currentFocus"));

      v2 = v5;
    }
  }

}

void __46__FUFlightInfoView_setupLabelStylesWithStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  BOOL v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v2 = objc_msgSend(WeakRetained, "currentFocus") == 1;
    WeakRetained = v4;
    if (!v2)
    {
      objc_msgSend(v4, "setCurrentFocus:", 1);
      objc_msgSend(v4, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "flightInfoView:didUpdateFocus:", v4, objc_msgSend(v4, "currentFocus"));

      WeakRetained = v4;
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FUFlightInfoView;
  -[FUFlightInfoView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[FUFlightInfoView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[FUFlightInfoView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[FUFlightInfoView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FUFlightInfoView;
  -[FUFlightInfoView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[FUFlightInfoView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "secondaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView flightButton](self, "flightButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

  -[FUFlightInfoView flightButton](self, "flightButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableAppearanceForView:", v7);

}

- (void)updateFlightButtonIcon
{
  void *v3;
  void *v4;
  double height;
  double width;
  double v7;
  double v8;
  CGContext *CurrentContext;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];
  CGSize v30;

  v29[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("airplane"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(v4, "size");
  v30.width = v7 * 1.69;
  width = v30.width;
  v30.height = v8 * 1.69;
  height = v30.height;
  UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  CGContextSetCompositeOperation();
  objc_msgSend(v4, "drawInRect:", 0.0, 0.0, width, height);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFill");

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStroke");

  if (self->_displayedLegId)
  {
    if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection") == 1)
      v12 = width * 0.5 + -14.0;
    else
      v12 = width * 0.5 + 1.25;
    v13 = height * 0.5 + -14.0 + -1.25;
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", v12, v13, 14.0, 14.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLineWidth:", 1.25);
    v15 = (void *)MEMORY[0x24BDD16F0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_displayedLegId);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringFromNumber:numberStyle:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = *MEMORY[0x24BDF65F8];
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 11.0, *MEMORY[0x24BDF7890]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "sizeWithAttributes:", v19);
    v21 = v12 + (14.0 - v20) * 0.5;
    v23 = v13 + (14.0 - v22) * 0.5;
    objc_msgSend(v14, "fill");
    objc_msgSend(v14, "stroke");
    objc_msgSend(v17, "drawAtPoint:withAttributes:", v19, v21, v23);

  }
  UIGraphicsPopContext();
  UIGraphicsGetImageFromCurrentImageContext();
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  objc_msgSend(v24, "imageWithRenderingMode:", 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[FUFlightInfoView flightButton](self, "flightButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setImage:forState:", v25, 0);

  -[FUFlightInfoView flightButton](self, "flightButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_setCornerRadius:", 20.0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FUFlightInfoView;
  -[FUFlightInfoView dealloc](&v4, sel_dealloc);
}

- (void)updateForFollowupContent:(BOOL)a3
{
  void *v3;
  double v5;
  int v6;
  void *v7;
  _BOOL4 spotlightMode;
  double v9;
  double v10;
  void *v11;
  id v12;

  self->_spotlightMode = a3;
  v5 = 1.0;
  if (a3 || self->_multiFlights)
  {
    v6 = 0;
  }
  else
  {
    -[FUFlight legs](self->_flight, "legs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v3, "count") <= 1)
      v5 = 0.0;
    else
      v5 = 1.0;
    v6 = 1;
  }
  -[FUFlightInfoView sep5](self, "sep5");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v5);

  if (v6)
  spotlightMode = self->_spotlightMode;
  if (self->_spotlightMode)
  {
    v9 = 0.0;
  }
  else
  {
    -[FUFlightInfoView trailingInset](self, "trailingInset");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constant");
    v9 = v10;
  }
  -[FUFlightInfoView trailingSeparatorsInset](self, "trailingSeparatorsInset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v9);

  if (!spotlightMode)
}

- (void)setFlight:(id)a3 legIndex:(unint64_t)a4 multiFlights:(BOOL)a5 spotlightMode:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  void *v11;
  unint64_t v12;
  FUFlight *v13;
  FUFlightLeg *leg;
  void *v15;
  FUFlightLeg *v16;
  unint64_t v17;
  void *v18;
  FUFlightLeg *v19;
  FUFlightLeg *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  FUFlight *v27;

  v6 = a6;
  v7 = a5;
  v27 = (FUFlight *)a3;
  -[FUFlight legs](v27, "legs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  v13 = v27;
  if (v12 > a4)
  {
    if (self->_flight != v27)
      goto LABEL_4;
    leg = self->_leg;
    -[FUFlight legs](v27, "legs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", a4);
    v16 = (FUFlightLeg *)objc_claimAutoreleasedReturnValue();

    v13 = v27;
    if (leg != v16)
    {
LABEL_4:
      if (v12 > 1)
        v17 = a4 + 1;
      else
        v17 = 0;
      self->_displayedLegId = v17;
      objc_storeStrong((id *)&self->_flight, a3);
      -[FUFlight legs](v27, "legs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", a4);
      v19 = (FUFlightLeg *)objc_claimAutoreleasedReturnValue();
      v20 = self->_leg;
      self->_leg = v19;

      self->_multiFlights = v7;
      -[FUFlightInfoView bottomMargin](self, "bottomMargin");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constant");
      v23 = v22;

      if (v12 > 1 || v7)
      {
        if (v23 != 30.0)
        {
          -[FUFlightInfoView bottomMargin](self, "bottomMargin");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          v26 = 30.0;
          goto LABEL_13;
        }
      }
      else if (v23 != 0.0)
      {
        -[FUFlightInfoView bottomMargin](self, "bottomMargin");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        v26 = 0.0;
LABEL_13:
        objc_msgSend(v24, "setConstant:", v26);

      }
      -[FUFlightInfoView updateForFollowupContent:](self, "updateForFollowupContent:", v6);
      -[FUFlightInfoView updateAirlineInformation](self, "updateAirlineInformation");
      -[FUFlightInfoView updateLocationInfo](self, "updateLocationInfo");
      -[FUFlightInfoView updateFlightTerminalInfo](self, "updateFlightTerminalInfo");
      -[FUFlightInfoView updateFlightStatus](self, "updateFlightStatus");
      -[FUFlightInfoView updateFlightDates](self, "updateFlightDates");
      -[FUFlightInfoView updateDelayInfo](self, "updateDelayInfo");
      -[FUFlightInfoView updateFlightButtonIcon](self, "updateFlightButtonIcon");
      -[FUFlightInfoView setNeedsLayout](self, "setNeedsLayout");
      v13 = v27;
    }
  }

}

- (void)updateAirlineInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[FUFlight displayAirline](self->_flight, "displayAirline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView labelAirlineName](self, "labelAirlineName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[FUFlight displayFlightCode](self->_flight, "displayFlightCode");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView labelFlightCode](self, "labelFlightCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

}

- (void)updateLocationInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  -[FUFlightLeg departure](self->_leg, "departure");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "airport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "city");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FUFlightLeg departure](self->_leg, "departure");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "airport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "city");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDepartureCity](self, "labelDepartureCity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

  }
  else
  {
    -[FUFlightInfoView labelDepartureCity](self, "labelDepartureCity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", &stru_24ED16380);
  }

  -[FUFlightLeg arrival](self->_leg, "arrival");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "airport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "city");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FUFlightLeg arrival](self->_leg, "arrival");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "airport");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "city");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelArrivalCity](self, "labelArrivalCity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

  }
  else
  {
    -[FUFlightInfoView labelArrivalCity](self, "labelArrivalCity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", &stru_24ED16380);
  }

  -[FUFlightLeg departure](self->_leg, "departure");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "airport");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "IATACode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView labelDepartureCode](self, "labelDepartureCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v19);

  -[FUFlightLeg arrival](self->_leg, "arrival");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "airport");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "IATACode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView labelArrivalCode](self, "labelArrivalCode");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v22);

}

- (void)updateTimeLabel:(id)a3 constraint:(id)a4 withString:(id)a5
{
  const __CFString *v7;
  id v8;
  id v9;

  if (a5)
    v7 = (const __CFString *)a5;
  else
    v7 = &stru_24ED16380;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "setText:", v7);
  -[FUFlightInfoView updateLabelVisibility:constraint:](self, "updateLabelVisibility:constraint:", v9, v8);

}

- (id)formattedDurationForDuration:(double)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  objc_msgSend(v4, "setAllowedUnits:", 112);
  objc_msgSend(v4, "setFormattingContext:", 1);
  objc_msgSend(v4, "setMaximumUnitCount:", 2);
  if ((uint64_t)a3 > 3599)
    v5 = 2;
  else
    v5 = 3;
  objc_msgSend(v4, "setUnitsStyle:", v5);
  objc_msgSend(v4, "stringFromTimeInterval:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateDelayInfo
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;

  -[FUFlightLeg departure](self->_leg, "departure");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delayFromSchedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FUFlightLeg departure](self->_leg, "departure");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "status");

    if (v6 != 4)
      goto LABEL_4;
    -[FUFlightLeg departure](self->_leg, "departure");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delayFromSchedule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    if (v10 >= 60.0)
    {
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Delayed %@"), CFSTR("Delayed %@"), CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[FUFlightInfoView formattedDurationForDuration:](self, "formattedDurationForDuration:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v13, v14);
      v40 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_4:
      v40 = 0;
    }
    if (-[FUFlightLeg status](self->_leg, "status") == 2 || -[FUFlightLeg status](self->_leg, "status") == 3)
    {
      -[FUFlightLeg arrival](self->_leg, "arrival");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "time");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceNow");
      v18 = v17;

      if (v18 < 60.0)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = CFSTR("Arriving now");
LABEL_17:
        objc_msgSend(v19, "localizedStringForKey:value:table:", v21, v21, CFSTR("Localizable"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v23;
      v24 = CFSTR("%@ remaining");
LABEL_12:
      objc_msgSend(v23, "localizedStringForKey:value:table:", v24, v24, CFSTR("Localizable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[FUFlightInfoView formattedDurationForDuration:](self, "formattedDurationForDuration:", v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", v25, v26);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      goto LABEL_19;
    }
    if (-[FUFlightLeg status](self->_leg, "status") == 4 || -[FUFlightLeg status](self->_leg, "status") == 4)
    {
      -[FUFlightLeg arrival](self->_leg, "arrival");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "status");

      if (v28 == 3)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = CFSTR("On time");
        goto LABEL_17;
      }
      -[FUFlightLeg arrival](self->_leg, "arrival");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "delayFromSchedule");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      v18 = fabs(v35);

      if (v18 >= 60.0)
      {
        -[FUFlightLeg arrival](self->_leg, "arrival");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "status");

        if (v37 == 4)
        {
          v22 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v23;
          v24 = CFSTR("Late %@");
          goto LABEL_12;
        }
        -[FUFlightLeg arrival](self->_leg, "arrival");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "status");

        if (v39 == 2)
        {
          v22 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v23;
          v24 = CFSTR("Early %@");
          goto LABEL_12;
        }
      }
    }
    v4 = 0;
    goto LABEL_19;
  }
  v40 = 0;
LABEL_19:
  -[FUFlightInfoView labelDepartureDelay](self, "labelDepartureDelay");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView departureDelayConstraint](self, "departureDelayConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView updateTimeLabel:constraint:withString:](self, "updateTimeLabel:constraint:withString:", v29, v30, v40);

  -[FUFlightInfoView labelArrivalDelay](self, "labelArrivalDelay");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView arrivalDelayConstraint](self, "arrivalDelayConstraint");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView updateTimeLabel:constraint:withString:](self, "updateTimeLabel:constraint:withString:", v31, v32, v4);

}

- (void)updateFlightTerminalInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  void *v68;
  __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  __CFString *v79;
  void *v80;
  id v81;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Terminal %@"), CFSTR("Terminal %@"), CFSTR("Localizable"));
  v81 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Gate %@"), CFSTR("Gate %@"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Terminal %@, Gate %@"), CFSTR("Terminal %@, Gate %@"), CFSTR("Localizable"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  -[FUFlightInfoView labelDepartureInfo2](self, "labelDepartureInfo2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FUFlightLeg departure](self->_leg, "departure");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "terminal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (__CFString *)objc_msgSend(v9, "length");

  v11 = 0x24BDD1000uLL;
  if (!v7)
  {
    if (v10)
    {
      -[FUFlightLeg departure](self->_leg, "departure");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "gate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "length");

      v27 = (void *)MEMORY[0x24BDD17C8];
      -[FUFlightLeg departure](self->_leg, "departure");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "terminal");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedTerminalOrGateID");
      v28 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v28;
      if (v26)
      {
        -[FUFlightLeg departure](self->_leg, "departure");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "gate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedTerminalOrGateID");
        v31 = v5;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", v80, v22, v32);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v5 = v31;
        v11 = 0x24BDD1000;

      }
      else
      {
        objc_msgSend(v27, "stringWithFormat:", v81, v28);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v23 = 0;
      goto LABEL_12;
    }
LABEL_9:
    v23 = 0;
    goto LABEL_13;
  }
  if (v10)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    -[FUFlightLeg departure](self->_leg, "departure");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "terminal");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedTerminalOrGateID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v81, v15);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[FUFlightLeg departure](self->_leg, "departure");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "gate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (!v18)
    goto LABEL_9;
  v19 = (void *)MEMORY[0x24BDD17C8];
  -[FUFlightLeg departure](self->_leg, "departure");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "gate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedTerminalOrGateID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", v5, v22);
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:

LABEL_13:
  -[FUFlightInfoView labelDepartureInfo1](self, "labelDepartureInfo1");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v10)
    v35 = v10;
  else
    v35 = v23;
  if (v10)
    v36 = v23;
  else
    v36 = &stru_24ED16380;
  objc_msgSend(v33, "setText:", v35);

  -[FUFlightInfoView labelDepartureInfo2](self, "labelDepartureInfo2");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setText:", v36);

  -[FUFlightInfoView labelArrivalInfo2](self, "labelArrivalInfo2");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[FUFlightLeg arrival](self->_leg, "arrival");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "terminal");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (__CFString *)objc_msgSend(v40, "length");

  if (!v38)
  {
    if (v41)
    {
      v79 = v10;
      v47 = v5;
      -[FUFlightLeg arrival](self->_leg, "arrival");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "gate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v11;
      v51 = objc_msgSend(v49, "length");

      v52 = *(void **)(v50 + 1992);
      -[FUFlightLeg arrival](self->_leg, "arrival");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "terminal");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "localizedTerminalOrGateID");
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v55;
      if (v51)
      {
        -[FUFlightLeg arrival](self->_leg, "arrival");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "gate");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "localizedTerminalOrGateID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stringWithFormat:", v80, v56, v59);
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v52, "stringWithFormat:", v81, v55);
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v62 = 0;
      goto LABEL_31;
    }
    v62 = 0;
LABEL_28:
    v66 = &stru_24ED16380;
    goto LABEL_32;
  }
  v42 = v11;
  if (v41)
  {
    v43 = *(void **)(v11 + 1992);
    -[FUFlightLeg arrival](self->_leg, "arrival");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "terminal");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "localizedTerminalOrGateID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "stringWithFormat:", v81, v46);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[FUFlightLeg arrival](self->_leg, "arrival");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "gate");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (__CFString *)objc_msgSend(v61, "length");

  if (!v62)
    goto LABEL_28;
  v79 = v10;
  v63 = *(void **)(v42 + 1992);
  -[FUFlightLeg arrival](self->_leg, "arrival");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "gate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "localizedTerminalOrGateID");
  v64 = objc_claimAutoreleasedReturnValue();
  v65 = v5;
  v56 = (void *)v64;
  v47 = v65;
  objc_msgSend(v63, "stringWithFormat:", v64);
  v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_31:
  v66 = &stru_24ED16380;

  v5 = v47;
  v10 = v79;
LABEL_32:
  -[FUFlightInfoView labelArrivalInfo1](self, "labelArrivalInfo1");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v67;
  if (v41)
    v69 = v41;
  else
    v69 = v62;
  if (v41)
    v66 = v62;
  objc_msgSend(v67, "setText:", v69);

  -[FUFlightInfoView labelArrivalInfo2](self, "labelArrivalInfo2");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setText:", v66);

  -[FUFlightInfoView labelDepartureInfo1](self, "labelDepartureInfo1");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView departureTerminalConstraint](self, "departureTerminalConstraint");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView updateLabelVisibility:constraint:](self, "updateLabelVisibility:constraint:", v71, v72);

  -[FUFlightInfoView labelDepartureInfo2](self, "labelDepartureInfo2");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView departureGateConstraint](self, "departureGateConstraint");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView updateLabelVisibility:constraint:](self, "updateLabelVisibility:constraint:", v73, v74);

  -[FUFlightInfoView labelArrivalInfo1](self, "labelArrivalInfo1");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView arrivalTerminalConstraint](self, "arrivalTerminalConstraint");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView updateLabelVisibility:constraint:](self, "updateLabelVisibility:constraint:", v75, v76);

  -[FUFlightInfoView labelArrivalInfo2](self, "labelArrivalInfo2");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView arrivalGateConstraint](self, "arrivalGateConstraint");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView updateLabelVisibility:constraint:](self, "updateLabelVisibility:constraint:", v77, v78);

}

- (void)addDateTimeAttributesToString:(id)a3 striked:(BOOL)a4 alignment:(int64_t)a5
{
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  objc_msgSend(v11, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v6)
    objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x24BDF6658], &unk_24ED1A618, 0, v8);
  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setAlignment:", a5);
  objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x24BDF6628], v10, 0, v8);

}

- (void)updateDateTimeForDeparture:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;

  if (a3)
  {
    -[FUFlightInfoView labelDepartureDate](self, "labelDepartureDate");
    v58 = (id)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDepartureTime](self, "labelDepartureTime");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightLeg departure](self->_leg, "departure");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "time");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "date");
    v55 = objc_claimAutoreleasedReturnValue();

    -[FUFlightLeg departure](self->_leg, "departure");
  }
  else
  {
    -[FUFlightInfoView labelArrivalDate](self, "labelArrivalDate");
    v58 = (id)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelArrivalTime](self, "labelArrivalTime");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightLeg arrival](self->_leg, "arrival");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "time");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date");
    v55 = objc_claimAutoreleasedReturnValue();

    -[FUFlightLeg arrival](self->_leg, "arrival");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "airport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeZone");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = (void *)updateDateTimeForDeparture__sLocaleIdentifier;
  if (!updateDateTimeForDeparture__sLocaleIdentifier
    || !v11
    || (objc_msgSend(v11, "localeIdentifier"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v13, "isEqualToString:", v14),
        v14,
        (v15 & 1) == 0))
  {
    if (!updateDateTimeForDeparture__sTimeFormatter)
    {
      v16 = objc_alloc_init(MEMORY[0x24BDD1500]);
      v17 = (void *)updateDateTimeForDeparture__sTimeFormatter;
      updateDateTimeForDeparture__sTimeFormatter = (uint64_t)v16;

    }
    if (!updateDateTimeForDeparture__sDateFormatter)
    {
      v18 = objc_alloc_init(MEMORY[0x24BDD1500]);
      v19 = (void *)updateDateTimeForDeparture__sDateFormatter;
      updateDateTimeForDeparture__sDateFormatter = (uint64_t)v18;

    }
    objc_msgSend(v12, "localeIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)updateDateTimeForDeparture__sLocaleIdentifier;
    updateDateTimeForDeparture__sLocaleIdentifier = v20;

    v22 = (void *)updateDateTimeForDeparture__sTimeFormatter;
    if (v57)
      v23 = CFSTR("h:mm j z");
    else
      v23 = CFSTR("h:mm j");
    objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", v23, 0, v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDateFormat:", v24);

    objc_msgSend((id)updateDateTimeForDeparture__sTimeFormatter, "setLocale:", v12);
    v25 = (void *)updateDateTimeForDeparture__sDateFormatter;
    objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", CFSTR("EE, MMM d"), 0, v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDateFormat:", v26);

    objc_msgSend((id)updateDateTimeForDeparture__sDateFormatter, "setLocale:", v12);
  }
  objc_msgSend((id)updateDateTimeForDeparture__sDateFormatter, "setTimeZone:", v56);
  objc_msgSend((id)updateDateTimeForDeparture__sTimeFormatter, "setTimeZone:", v56);
  v27 = (void *)v55;
  objc_msgSend((id)updateDateTimeForDeparture__sTimeFormatter, "stringFromDate:", v55);
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)updateDateTimeForDeparture__sDateFormatter, "stringFromDate:", v55);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v53);
  v54 = (void *)v28;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v28);
  v31 = -[FUFlightLeg status](self->_leg, "status");
  v32 = v58;
  if (v31)
  {
    if (v31 == 1)
    {
      if (a3)
      {
        -[FUFlightLeg departure](self->_leg, "departure");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
        v34 = v33;
        if (objc_msgSend(v33, "status") == 4)
        {
          v35 = *MEMORY[0x24BDF6600];
          -[FUStyleProvider orangeColor](self->_styleProvider, "orangeColor");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addAttribute:value:range:", v35, v36, 0, objc_msgSend(v54, "length"));

        }
        v32 = v58;
        goto LABEL_26;
      }
    }
    else if (v31 == 6 || a3)
    {
      goto LABEL_26;
    }
    -[FUFlightLeg arrival](self->_leg, "arrival");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_26:
  objc_msgSend(v32, "font");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 2 * (objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection") != 1);
  v39 = -[FUFlightLeg status](self->_leg, "status");
  v40 = v57;
  if (v57)
  {
    v41 = v39 == 6;
    -[FUFlightInfoView addDateTimeAttributesToString:striked:alignment:](self, "addDateTimeAttributesToString:striked:alignment:", v29, v41, v38);
    -[FUFlightInfoView addDateTimeAttributesToString:striked:alignment:](self, "addDateTimeAttributesToString:striked:alignment:", v30, v41, v38);
    v43 = v53;
    v42 = v54;
    if (v37)
    {
      v44 = *MEMORY[0x24BDF65F8];
      objc_msgSend(v29, "addAttribute:value:range:", *MEMORY[0x24BDF65F8], v37, 0, objc_msgSend(v53, "length"));
      objc_msgSend(v30, "addAttribute:value:range:", v44, v37, 0, objc_msgSend(v54, "length"));
    }
    objc_msgSend(v58, "setAttributedText:", v29);
    objc_msgSend(v57, "setAttributedText:", v30);
  }
  else
  {
    v52 = v39 == 6;
    v45 = v29;
    v46 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR(" at "), CFSTR(" at "), CFSTR("Localizable"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v46, "initWithString:", v48);
    objc_msgSend(v45, "appendAttributedString:", v49);

    objc_msgSend(v45, "appendAttributedString:", v30);
    -[FUFlightInfoView addDateTimeAttributesToString:striked:alignment:](self, "addDateTimeAttributesToString:striked:alignment:", v45, v52, v38);
    if (v37)
    {
      v50 = *MEMORY[0x24BDF65F8];
      objc_msgSend(v45, "string");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addAttribute:value:range:", v50, v37, 0, objc_msgSend(v51, "length"));

    }
    objc_msgSend(v58, "setAttributedText:", v45);

    v40 = 0;
    v42 = v54;
    v27 = (void *)v55;
    v43 = v53;
  }

}

- (void)updateFlightDates
{
  void *v2;
  _BOOL4 v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  __CFString *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  __CFString *v73;

  v4 = 1;
  -[FUFlightInfoView updateDateTimeForDeparture:](self, "updateDateTimeForDeparture:", 1);
  -[FUFlightInfoView updateDateTimeForDeparture:](self, "updateDateTimeForDeparture:", 0);
  v5 = (void *)-[FUFlightLeg status](self->_leg, "status");
  v6 = (unint64_t)v5;
  if (v5)
    v7 = v5 == (void *)6;
  else
    v7 = 1;
  if (!v7)
  {
    -[FUFlightLeg departure](self->_leg, "departure");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "delayFromSchedule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;
  }
  if (v6)
    v8 = v6 == 6;
  else
    v8 = 1;
  if (!v8)
  {

  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Departure"), CFSTR("Departure"), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDepartureTitle](self, "labelDepartureTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("Arrival");
    v15 = CFSTR("Arrival");
    goto LABEL_26;
  }
  if (v6 != 1)
    goto LABEL_15;
  -[FUFlightLeg departure](self->_leg, "departure");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "time");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceNow");
  v19 = v18;

  if (v19 >= 0.0)
  {
    -[FUFlightLeg departure](self->_leg, "departure");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "status");

    if (v24 == 4)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = CFSTR("Delayed");
    }
    else
    {
      -[FUFlightLeg departure](self->_leg, "departure");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "status");

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v29 == 2)
        v27 = CFSTR("Departing early");
      else
        v27 = CFSTR("Departing");
    }
    objc_msgSend(v25, "localizedStringForKey:value:table:", v27, v27, CFSTR("Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDepartureTitle](self, "labelDepartureTitle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setText:", v30);

  }
  else
  {
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Departed"), CFSTR("Departed"), CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDepartureTitle](self, "labelDepartureTitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v21);

    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 4)
      goto LABEL_24;
  }
  -[FUFlightLeg arrival](self->_leg, "arrival");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "time");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "timeIntervalSinceNow");
  v35 = v34;

  if (v35 >= 0.0)
  {
    -[FUFlightLeg arrival](self->_leg, "arrival");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "status");

    if (v70 == 4)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("Arriving late");
    }
    else
    {
      -[FUFlightLeg arrival](self->_leg, "arrival");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "status");

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v72 == 2)
        v14 = CFSTR("Arriving early");
      else
        v14 = CFSTR("Arriving");
    }
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = CFSTR("Arrived");
LABEL_25:
  v15 = v14;
LABEL_26:
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, v15, CFSTR("Localizable"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView labelArrivalTitle](self, "labelArrivalTitle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setText:", v36);

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 2)
    goto LABEL_32;
  -[FUFlightLeg departure](self->_leg, "departure");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "taxiing");

  if (v39)
  {
    -[FUFlightInfoView labelDepartureTitle](self, "labelDepartureTitle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "text");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    v45 = CFSTR("DEPARTURE_RUNWAY");
  }
  else
  {
    -[FUFlightLeg arrival](self->_leg, "arrival");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "taxiing");

    if (!v47)
      goto LABEL_32;
    -[FUFlightInfoView labelArrivalTitle](self, "labelArrivalTitle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "text");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    v45 = CFSTR("ARRIVAL_RUNWAY");
  }
  objc_msgSend(v43, "localizedStringForKey:value:table:", v45, CFSTR("Runway"), CFSTR("Localizable"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "localizedStringWithFormat:", CFSTR(" (%@)"), v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringByAppendingString:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setText:", v50);

LABEL_32:
  -[FUFlightLeg duration](self->_leg, "duration");
  if (v51 >= 60.0)
  {
    -[FUFlightInfoView formattedDurationForDuration:](self, "formattedDurationForDuration:");
    v52 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = CFSTR("–");
  }
  v73 = (__CFString *)v52;
  -[FUFlightInfoView labelDurationComplete](self, "labelDurationComplete");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v54 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("Duration: %@"), CFSTR("Duration: %@"), CFSTR("Localizable"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringWithFormat:", v56, v73);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDurationComplete](self, "labelDurationComplete");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setText:", v57);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("Duration"), CFSTR("Duration"), CFSTR("Localizable"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUFlightInfoView labelDurationTitle](self, "labelDurationTitle");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setText:", v60);

    -[FUFlightInfoView labelDurationValue](self, "labelDurationValue");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setText:", v73);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("Baggage Claim"), CFSTR("Baggage Claim"), CFSTR("Localizable"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[FUFlightInfoView labelBaggageClaimTitle](self, "labelBaggageClaimTitle");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setText:", v63);

  -[FUFlightLeg baggageClaim](self->_leg, "baggageClaim");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "length");
  if (v66)
  {
    -[FUFlightLeg baggageClaim](self->_leg, "baggageClaim");
    v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v67 = CFSTR("–");
  }
  -[FUFlightInfoView labelBaggageClaimValue](self, "labelBaggageClaimValue");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setText:", v67);

  if (v66)
}

- (void)updateFlightStatus
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;

  v4 = -[FUFlightLeg status](self->_leg, "status");
  v5 = v4;
  switch(v4)
  {
    case 1:
      -[FUFlightLeg departure](self->_leg, "departure");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "status");

      if (v7 == 4)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("Delayed");
        goto LABEL_6;
      }
      -[FUFlightLeg departure](self->_leg, "departure");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delayFromSchedule");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
      {
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("On time"), CFSTR("On time"), CFSTR("Localizable"));
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();

        -[FUStyleProvider greenColor](self->_styleProvider, "greenColor");
      }
      else
      {
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Scheduled"), CFSTR("Scheduled"), CFSTR("Localizable"));
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();

        -[FUStyleProvider primaryTextColor](self->_styleProvider, "primaryTextColor");
      }
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("Redirected");
      goto LABEL_6;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("Diverted");
LABEL_6:
      objc_msgSend(v8, "localizedStringForKey:value:table:", v10, v10, CFSTR("Localizable"));
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[FUStyleProvider orangeColor](self->_styleProvider, "orangeColor");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 6:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Canceled"), CFSTR("Canceled"), CFSTR("Localizable"));
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();

      -[FUStyleProvider redColor](self->_styleProvider, "redColor");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_32:
      v24 = (void *)v11;
      goto LABEL_33;
    default:
      if (v4 != 4 && v4 != 2)
      {
        -[FUStyleProvider blueColor](self->_styleProvider, "blueColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = &stru_24ED16380;
        goto LABEL_33;
      }
      if (v4 == 2
        && (-[FUFlightLeg departure](self->_leg, "departure"),
            v2 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v2, "taxiing")))
      {
        -[FUFlightLeg departure](self->_leg, "departure");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "status");

      }
      else
      {
        -[FUFlightLeg arrival](self->_leg, "arrival");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v20, "status");

        if (v5 != 2)
          goto LABEL_21;
      }

LABEL_21:
      if (v15 == 2)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        v27 = CFSTR("Early");
      }
      else
      {
        if (v15 == 4)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Late"), CFSTR("Late"), CFSTR("Localizable"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          -[FUStyleProvider orangeColor](self->_styleProvider, "orangeColor");
          v23 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        v27 = CFSTR("On time");
      }
      objc_msgSend(v25, "localizedStringForKey:value:table:", v27, v27, CFSTR("Localizable"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[FUStyleProvider greenColor](self->_styleProvider, "greenColor");
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_27:
      v24 = (void *)v23;
      if (v5 == 4)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        v30 = CFSTR("Arrived");
      }
      else
      {
        -[FUFlightLeg arrival](self->_leg, "arrival");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "taxiing");

        if (v32)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          v30 = CFSTR("Landed");
        }
        else
        {
          -[FUFlightLeg departure](self->_leg, "departure");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "taxiing");

          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v39)
            v30 = CFSTR("Taxiing");
          else
            v30 = CFSTR("En route");
        }
      }
      objc_msgSend(v28, "localizedStringForKey:value:table:", v30, v30, CFSTR("Localizable"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("%@ – %@"), CFSTR("%@ – %@"), CFSTR("Localizable"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", v43, v40, v22);
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_33:
      -[FUFlightInfoView labelStatus](self, "labelStatus");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setText:", v44);

      -[FUFlightInfoView labelStatus](self, "labelStatus");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setTextColor:", v24);

      if ((-[__CFString isEqualToString:](v44, "isEqualToString:", &stru_24ED16380) & 1) != 0)
      {
        -[FUFlightInfoView labelStatusTitle](self, "labelStatusTitle");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setText:", &stru_24ED16380);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Status"), CFSTR("Status"), CFSTR("Localizable"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[FUFlightInfoView labelStatusTitle](self, "labelStatusTitle");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setText:", v36);

      }
      return;
  }
}

- (void)flightButtonTapped:(id)a3
{
  id v4;

  -[FUFlightInfoView setCurrentFocus:](self, "setCurrentFocus:", 2);
  -[FUFlightInfoView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flightInfoView:didUpdateFocus:", self, 2);

}

- (void)updateLabelVisibility:(id)a3 constraint:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a3, "text");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", objc_msgSend(v6, "length") != 0);

}

- (FUFlight)flight
{
  return self->_flight;
}

- (FUFlightLeg)leg
{
  return self->_leg;
}

- (FUFlightInfoViewProtocol)delegate
{
  return (FUFlightInfoViewProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)currentFocus
{
  return self->_currentFocus;
}

- (void)setCurrentFocus:(int64_t)a3
{
  self->_currentFocus = a3;
}

- (FULabel)labelAirlineName
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelAirlineName);
}

- (void)setLabelAirlineName:(id)a3
{
  objc_storeWeak((id *)&self->_labelAirlineName, a3);
}

- (FULabel)labelFlightCode
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelFlightCode);
}

- (void)setLabelFlightCode:(id)a3
{
  objc_storeWeak((id *)&self->_labelFlightCode, a3);
}

- (FULabel)labelStatusTitle
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelStatusTitle);
}

- (void)setLabelStatusTitle:(id)a3
{
  objc_storeWeak((id *)&self->_labelStatusTitle, a3);
}

- (FULabel)labelStatus
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelStatus);
}

- (void)setLabelStatus:(id)a3
{
  objc_storeWeak((id *)&self->_labelStatus, a3);
}

- (FULabel)labelDepartureCity
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelDepartureCity);
}

- (void)setLabelDepartureCity:(id)a3
{
  objc_storeWeak((id *)&self->_labelDepartureCity, a3);
}

- (FULabel)labelDepartureCode
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelDepartureCode);
}

- (void)setLabelDepartureCode:(id)a3
{
  objc_storeWeak((id *)&self->_labelDepartureCode, a3);
}

- (FULabel)labelDepartureInfo1
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelDepartureInfo1);
}

- (void)setLabelDepartureInfo1:(id)a3
{
  objc_storeWeak((id *)&self->_labelDepartureInfo1, a3);
}

- (FULabel)labelDepartureInfo2
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelDepartureInfo2);
}

- (void)setLabelDepartureInfo2:(id)a3
{
  objc_storeWeak((id *)&self->_labelDepartureInfo2, a3);
}

- (FULabel)labelArrivalCity
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelArrivalCity);
}

- (void)setLabelArrivalCity:(id)a3
{
  objc_storeWeak((id *)&self->_labelArrivalCity, a3);
}

- (FULabel)labelArrivalCode
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelArrivalCode);
}

- (void)setLabelArrivalCode:(id)a3
{
  objc_storeWeak((id *)&self->_labelArrivalCode, a3);
}

- (FULabel)labelArrivalInfo1
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelArrivalInfo1);
}

- (void)setLabelArrivalInfo1:(id)a3
{
  objc_storeWeak((id *)&self->_labelArrivalInfo1, a3);
}

- (FULabel)labelArrivalInfo2
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelArrivalInfo2);
}

- (void)setLabelArrivalInfo2:(id)a3
{
  objc_storeWeak((id *)&self->_labelArrivalInfo2, a3);
}

- (FULabel)labelDepartureTitle
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelDepartureTitle);
}

- (void)setLabelDepartureTitle:(id)a3
{
  objc_storeWeak((id *)&self->_labelDepartureTitle, a3);
}

- (FULabel)labelDepartureDate
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelDepartureDate);
}

- (void)setLabelDepartureDate:(id)a3
{
  objc_storeWeak((id *)&self->_labelDepartureDate, a3);
}

- (FULabel)labelDepartureTime
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelDepartureTime);
}

- (void)setLabelDepartureTime:(id)a3
{
  objc_storeWeak((id *)&self->_labelDepartureTime, a3);
}

- (FULabel)labelDepartureDelay
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelDepartureDelay);
}

- (void)setLabelDepartureDelay:(id)a3
{
  objc_storeWeak((id *)&self->_labelDepartureDelay, a3);
}

- (FULabel)labelArrivalTitle
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelArrivalTitle);
}

- (void)setLabelArrivalTitle:(id)a3
{
  objc_storeWeak((id *)&self->_labelArrivalTitle, a3);
}

- (FULabel)labelArrivalDate
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelArrivalDate);
}

- (void)setLabelArrivalDate:(id)a3
{
  objc_storeWeak((id *)&self->_labelArrivalDate, a3);
}

- (FULabel)labelArrivalTime
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelArrivalTime);
}

- (void)setLabelArrivalTime:(id)a3
{
  objc_storeWeak((id *)&self->_labelArrivalTime, a3);
}

- (FULabel)labelArrivalDelay
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelArrivalDelay);
}

- (void)setLabelArrivalDelay:(id)a3
{
  objc_storeWeak((id *)&self->_labelArrivalDelay, a3);
}

- (FULabel)labelDurationTitle
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelDurationTitle);
}

- (void)setLabelDurationTitle:(id)a3
{
  objc_storeWeak((id *)&self->_labelDurationTitle, a3);
}

- (FULabel)labelDurationValue
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelDurationValue);
}

- (void)setLabelDurationValue:(id)a3
{
  objc_storeWeak((id *)&self->_labelDurationValue, a3);
}

- (FULabel)labelDurationComplete
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelDurationComplete);
}

- (void)setLabelDurationComplete:(id)a3
{
  objc_storeWeak((id *)&self->_labelDurationComplete, a3);
}

- (FULabel)labelBaggageClaimTitle
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelBaggageClaimTitle);
}

- (void)setLabelBaggageClaimTitle:(id)a3
{
  objc_storeWeak((id *)&self->_labelBaggageClaimTitle, a3);
}

- (FULabel)labelBaggageClaimValue
{
  return (FULabel *)objc_loadWeakRetained((id *)&self->_labelBaggageClaimValue);
}

- (void)setLabelBaggageClaimValue:(id)a3
{
  objc_storeWeak((id *)&self->_labelBaggageClaimValue, a3);
}

- (FUSeparator)sep5
{
  return (FUSeparator *)objc_loadWeakRetained((id *)&self->_sep5);
}

- (void)setSep5:(id)a3
{
  objc_storeWeak((id *)&self->_sep5, a3);
}

- (NSLayoutConstraint)trailingSeparatorsInset
{
  return self->_trailingSeparatorsInset;
}

- (void)setTrailingSeparatorsInset:(id)a3
{
  objc_storeStrong((id *)&self->_trailingSeparatorsInset, a3);
}

- (NSLayoutConstraint)leadingInset
{
  return self->_leadingInset;
}

- (void)setLeadingInset:(id)a3
{
  objc_storeStrong((id *)&self->_leadingInset, a3);
}

- (NSLayoutConstraint)trailingInset
{
  return self->_trailingInset;
}

- (void)setTrailingInset:(id)a3
{
  objc_storeStrong((id *)&self->_trailingInset, a3);
}

- (NSLayoutConstraint)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(id)a3
{
  objc_storeStrong((id *)&self->_bottomMargin, a3);
}

- (NSLayoutConstraint)departureDelayConstraint
{
  return self->_departureDelayConstraint;
}

- (void)setDepartureDelayConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_departureDelayConstraint, a3);
}

- (NSLayoutConstraint)departureTerminalConstraint
{
  return self->_departureTerminalConstraint;
}

- (void)setDepartureTerminalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_departureTerminalConstraint, a3);
}

- (NSLayoutConstraint)departureGateConstraint
{
  return self->_departureGateConstraint;
}

- (void)setDepartureGateConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_departureGateConstraint, a3);
}

- (NSLayoutConstraint)arrivalDelayConstraint
{
  return self->_arrivalDelayConstraint;
}

- (void)setArrivalDelayConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalDelayConstraint, a3);
}

- (NSLayoutConstraint)arrivalTerminalConstraint
{
  return self->_arrivalTerminalConstraint;
}

- (void)setArrivalTerminalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalTerminalConstraint, a3);
}

- (NSLayoutConstraint)arrivalGateConstraint
{
  return self->_arrivalGateConstraint;
}

- (void)setArrivalGateConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalGateConstraint, a3);
}

- (UIButton)flightButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_flightButton);
}

- (void)setFlightButton:(id)a3
{
  objc_storeWeak((id *)&self->_flightButton, a3);
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flightButton);
  objc_storeStrong((id *)&self->_arrivalGateConstraint, 0);
  objc_storeStrong((id *)&self->_arrivalTerminalConstraint, 0);
  objc_storeStrong((id *)&self->_arrivalDelayConstraint, 0);
  objc_storeStrong((id *)&self->_departureGateConstraint, 0);
  objc_storeStrong((id *)&self->_departureTerminalConstraint, 0);
  objc_storeStrong((id *)&self->_departureDelayConstraint, 0);
  objc_storeStrong((id *)&self->_bottomMargin, 0);
  objc_storeStrong((id *)&self->_trailingInset, 0);
  objc_storeStrong((id *)&self->_leadingInset, 0);
  objc_storeStrong((id *)&self->_trailingSeparatorsInset, 0);
  objc_destroyWeak((id *)&self->_sep5);
  objc_destroyWeak((id *)&self->_labelBaggageClaimValue);
  objc_destroyWeak((id *)&self->_labelBaggageClaimTitle);
  objc_destroyWeak((id *)&self->_labelDurationComplete);
  objc_destroyWeak((id *)&self->_labelDurationValue);
  objc_destroyWeak((id *)&self->_labelDurationTitle);
  objc_destroyWeak((id *)&self->_labelArrivalDelay);
  objc_destroyWeak((id *)&self->_labelArrivalTime);
  objc_destroyWeak((id *)&self->_labelArrivalDate);
  objc_destroyWeak((id *)&self->_labelArrivalTitle);
  objc_destroyWeak((id *)&self->_labelDepartureDelay);
  objc_destroyWeak((id *)&self->_labelDepartureTime);
  objc_destroyWeak((id *)&self->_labelDepartureDate);
  objc_destroyWeak((id *)&self->_labelDepartureTitle);
  objc_destroyWeak((id *)&self->_labelArrivalInfo2);
  objc_destroyWeak((id *)&self->_labelArrivalInfo1);
  objc_destroyWeak((id *)&self->_labelArrivalCode);
  objc_destroyWeak((id *)&self->_labelArrivalCity);
  objc_destroyWeak((id *)&self->_labelDepartureInfo2);
  objc_destroyWeak((id *)&self->_labelDepartureInfo1);
  objc_destroyWeak((id *)&self->_labelDepartureCode);
  objc_destroyWeak((id *)&self->_labelDepartureCity);
  objc_destroyWeak((id *)&self->_labelStatus);
  objc_destroyWeak((id *)&self->_labelStatusTitle);
  objc_destroyWeak((id *)&self->_labelFlightCode);
  objc_destroyWeak((id *)&self->_labelAirlineName);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_leg, 0);
  objc_storeStrong((id *)&self->_flight, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end
