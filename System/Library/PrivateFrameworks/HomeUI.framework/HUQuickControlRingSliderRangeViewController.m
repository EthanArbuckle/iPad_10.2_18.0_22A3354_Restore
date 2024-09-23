@implementation HUQuickControlRingSliderRangeViewController

+ (id)controlItemPredicate
{
  return -[HUQuickControlSingleItemPredicate initWithBlock:]([HUQuickControlSingleItemPredicate alloc], "initWithBlock:", &__block_literal_global_61);
}

uint64_t __67__HUQuickControlRingSliderRangeViewController_controlItemPredicate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int isKindOfClass;
  void *v4;
  void *v5;
  int v6;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_msgSend(v2, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_4);

  return isKindOfClass & (v6 ^ 1u);
}

uint64_t __67__HUQuickControlRingSliderRangeViewController_controlItemPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "serviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB9A18]);

  return v3;
}

- (id)createInteractionCoordinator
{
  HUQuickControlRingSliderView *v3;
  void *v4;
  HUQuickControlRingSliderView *v5;
  HUQuickControlRingSliderInteractionCoordinator *v6;
  void *v7;
  HUQuickControlRingSliderInteractionCoordinator *v8;
  void *v9;

  v3 = [HUQuickControlRingSliderView alloc];
  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HUQuickControlRingSliderView initWithProfile:](v3, "initWithProfile:", v4);
  -[HUQuickControlRingSliderRangeViewController setRingSliderView:](self, "setRingSliderView:", v5);

  v6 = [HUQuickControlRingSliderInteractionCoordinator alloc];
  -[HUQuickControlRingSliderRangeViewController ringSliderView](self, "ringSliderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HUQuickControlRingSliderInteractionCoordinator initWithControlView:delegate:](v6, "initWithControlView:delegate:", v7, self);

  -[HUQuickControlRingSliderRangeViewController ringSliderView](self, "ringSliderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInteractionDelegate:", v8);

  return v8;
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (id)createViewProfile
{
  HUQuickControlRingSliderViewProfile *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HUQuickControlRingSliderRangeViewController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
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
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  float v55;
  void *v56;
  float v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  char v75;
  double v76;
  double v77;
  uint64_t v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  int v92;
  int v93;
  int v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v105;
  HUQuickControlRingSliderRangeViewController *v106;

  v3 = objc_alloc_init(HUQuickControlRingSliderViewProfile);
  -[HUQuickControlRingSliderViewProfile setIsHandleViewVisible:](v3, "setIsHandleViewVisible:", 0);
  -[HUQuickControlRingSliderViewProfile setHasOffState:](v3, "setHasOffState:", 0);
  -[HUQuickControlRingSliderViewProfile setHandleViewStyle:](v3, "setHandleViewStyle:", 2);
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "mode");
  if (v7 == 2)
  {
    -[HUQuickControlRingSliderViewProfile setHasSecondaryValue:](v3, "setHasSecondaryValue:", 1);
    v30 = (void *)MEMORY[0x1E0D318D8];
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "minimumValueConstraints");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "validRange");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D318F0], "sharedCoordinator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "integerTemperatureRangeWithinNumberRange:representsCelsius:", v33, objc_msgSend(v34, "isCelsius"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = objc_alloc(MEMORY[0x1E0D315F8]);
    objc_msgSend(v13, "minValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "maxValue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "minimumValueConstraints");
    v106 = self;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stepValue");
    v105 = v6;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v35, "initWithMinValue:maxValue:stepValue:", v36, v37, v40);

    v41 = (void *)MEMORY[0x1E0D318D8];
    -[HUQuickControlSingleControlViewController controlItem](v106, "controlItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "maximumValueConstraints");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "validRange");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D318F0], "sharedCoordinator");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "integerTemperatureRangeWithinNumberRange:representsCelsius:", v44, objc_msgSend(v45, "isCelsius"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_alloc(MEMORY[0x1E0D315F8]);
    objc_msgSend(v27, "minValue");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "maxValue");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSingleControlViewController controlItem](v106, "controlItem");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "maximumValueConstraints");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "stepValue");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(v46, "initWithMinValue:maxValue:stepValue:", v47, v48, v51);

    v6 = v105;
    self = v106;

    objc_msgSend(v13, "unionRange:", v27);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "minValue");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "floatValue");
    v26 = v55;

    objc_msgSend(v53, "maxValue");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "floatValue");
    v29 = v57;

    objc_msgSend(v52, "percentageConstraintsWithinRange:", v53);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlRingSliderViewProfile setPrimaryValueConstraints:](v3, "setPrimaryValueConstraints:", v58);

    objc_msgSend(v22, "percentageConstraintsWithinRange:", v53);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlRingSliderViewProfile setSecondaryValueConstraints:](v3, "setSecondaryValueConstraints:", v59);

  }
  else
  {
    if (v7 != 1)
      goto LABEL_47;
    v8 = (void *)MEMORY[0x1E0D318D8];
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "targetValueConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "validRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D318F0], "sharedCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "integerTemperatureRangeWithinNumberRange:representsCelsius:", v11, objc_msgSend(v12, "isCelsius"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x1E0D315F8]);
    objc_msgSend(v13, "minValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "maxValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "targetValueConstraints");
    v18 = self;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stepValue");
    v20 = v6;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v14, "initWithMinValue:maxValue:stepValue:", v15, v16, v21);

    v6 = v20;
    self = v18;

    objc_msgSend(v22, "percentageConstraintsWithinRange:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlRingSliderViewProfile setPrimaryValueConstraints:](v3, "setPrimaryValueConstraints:", v23);

    objc_msgSend(v13, "minValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    v26 = v25;

    objc_msgSend(v13, "maxValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    v29 = v28;
  }

  if (v26 != v29)
  {
    v60 = v26;
    v61 = v29;
    objc_msgSend(MEMORY[0x1E0D318F0], "sharedCoordinator");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "isCelsius");

    if (!v63)
    {
      v76 = v60 * 9.0 / 5.0 + 32.0;
      v77 = v61 * 9.0 / 5.0 + 32.0;
      if (v76 <= v77)
      {
        v79 = v61 - v60;
        v78 = 1;
        do
        {
          v80 = ((v76 + -32.0) * 5.0 / 9.0 - v60) / v79;
          *(float *)&v80 = v80;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUQuickControlRingSliderViewProfile gradationMarkingValues](v3, "gradationMarkingValues");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "arrayByAddingObject:", v81);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUQuickControlRingSliderViewProfile setGradationMarkingValues:](v3, "setGradationMarkingValues:", v83);

          v76 = v76 + 1.0;
        }
        while (v76 <= v77);
      }
      else
      {
        v78 = 1;
      }
LABEL_46:
      -[HUQuickControlRingSliderViewProfile setGradationMarkingViewStyle:](v3, "setGradationMarkingViewStyle:", v78);
      goto LABEL_47;
    }
    objc_opt_class();
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v65 = v64;
    else
      v65 = 0;
    v66 = v65;

    objc_opt_class();
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v68 = v67;
    else
      v68 = 0;
    v69 = v68;

    v70 = objc_msgSend(v6, "mode");
    if (v70 != 2)
    {
      if (v70 != 1)
        goto LABEL_41;
      objc_msgSend(v66, "targetValueConstraints");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "stepValue");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (v69)
      {
        objc_msgSend(v69, "targetValueConstraints");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "stepValue");
        v74 = objc_claimAutoreleasedReturnValue();

        v72 = (void *)v74;
      }
      v75 = objc_msgSend(v72, "isEqualToNumber:", &unk_1E7040960);

      if ((v75 & 1) == 0)
        goto LABEL_41;
LABEL_39:
      v96 = 1.0;
      v78 = 1;
LABEL_42:
      if (v26 <= v29)
      {
        v97 = v26;
        do
        {
          v98 = (v97 - v60) / (v61 - v60);
          *(float *)&v98 = v98;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v98);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUQuickControlRingSliderViewProfile gradationMarkingValues](v3, "gradationMarkingValues");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "arrayByAddingObject:", v99);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUQuickControlRingSliderViewProfile setGradationMarkingValues:](v3, "setGradationMarkingValues:", v101);

          v97 = v96 + v97;
        }
        while (v97 <= v61);
      }

      goto LABEL_46;
    }
    objc_msgSend(v66, "minimumValueConstraints");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "stepValue");
    v85 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v66, "maximumValueConstraints");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "stepValue");
    v87 = objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      objc_msgSend(v69, "minimumValueConstraints");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "stepValue");
      v89 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v69, "maximumValueConstraints");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "stepValue");
      v91 = objc_claimAutoreleasedReturnValue();

      v87 = v91;
      v85 = v89;
    }
    if (v85 && v87)
    {
      v92 = objc_msgSend((id)v85, "intValue");
      v93 = objc_msgSend((id)v87, "intValue");
      if (v92 <= v93)
        v94 = v93;
      else
        v94 = v92;
      if (v94 != 1)
        goto LABEL_40;
    }
    else
    {
      if (!(v85 | v87))
      {
LABEL_40:

LABEL_41:
        v96 = 0.5;
        v78 = 2;
        goto LABEL_42;
      }
      if (v85)
        v95 = (void *)v85;
      else
        v95 = (void *)v87;
      objc_msgSend(v95, "isEqualToNumber:", &unk_1E7040960);
    }

    goto LABEL_39;
  }
LABEL_47:
  -[HUQuickControlRingSliderViewProfile setStyle:](v3, "setStyle:", 0);
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUQuickControlRingSliderViewProfile setShouldShowSupplementaryValue:](v3, "setShouldShowSupplementaryValue:", 1);
  }
  else
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[HUQuickControlRingSliderViewProfile setShouldShowSupplementaryValue:](v3, "setShouldShowSupplementaryValue:", objc_opt_isKindOfClass() & 1);

  }
  return v3;
}

- (id)controlToViewValueTransformer
{
  void *v3;
  void *v4;
  void *v5;

  -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D319D8], "transformerForRingSliderViewProfile:rangeControlItem:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)interactionCoordinator:(id)a3 viewValueDidChange:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlRingSliderRangeViewController;
  v6 = a4;
  -[HUQuickControlSingleControlViewController interactionCoordinator:viewValueDidChange:](&v7, sel_interactionCoordinator_viewValueDidChange_, a3, v6);
  -[HUQuickControlRingSliderRangeViewController updateMainStatusStringWithValue:](self, "updateMainStatusStringWithValue:", v6, v7.receiver, v7.super_class);

  -[HUQuickControlRingSliderRangeViewController updateSupplementaryValue](self, "updateSupplementaryValue");
}

- (void)invalidateViewProfile
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlRingSliderRangeViewController;
  -[HUQuickControlSingleControlViewController invalidateViewProfile](&v4, sel_invalidateViewProfile);
  -[HUQuickControlSingleControlViewController modelValue](self, "modelValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlRingSliderRangeViewController updateMainStatusStringWithValue:](self, "updateMainStatusStringWithValue:", v3);

}

- (void)updateMainStatusStringWithValue:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD *v20;
  id v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  double v28;
  void *v29;
  id v30;
  void *v31;
  int v32;
  _BOOL8 v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id)0x1E0D31000;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    if (!v6)
    {
LABEL_12:
      HFLogForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v41 = (id)objc_opt_class();
        v42 = 2112;
        v43 = v4;
        v21 = v41;
        _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "value is neither HFRangeCotrolItemValue, NSNumber, or HFNumberRange class. Value's class type is %@. value = %@", buf, 0x16u);

      }
      goto LABEL_42;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_12;
    }
    v7 = (void *)MEMORY[0x1E0D319D8];
    -[HUQuickControlSingleControlViewController viewProfile](self, "viewProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transformerForRingSliderViewProfile:rangeControlItem:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "valueForTransformedValue:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "normalizedValueForValue:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v6 = (objc_opt_isKindOfClass() & 1) != 0 ? v13 : 0;

    if (!v6)
      goto LABEL_12;
  }
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "latestResults");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v15, "objectForKey:", *MEMORY[0x1E0D30520]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v15) = objc_opt_isKindOfClass();

  v35 = v16;
  if ((v15 & 1) != 0)
  {
    v38 = 0;
    v39 = 0;
    -[HUQuickControlRingSliderRangeViewController _getTemperatureThresholdControlItemStateString:temperatureString:withRangeControlItemValue:](self, "_getTemperatureThresholdControlItemStateString:temperatureString:withRangeControlItemValue:", &v39, &v38, v6);
    v18 = v39;
    v19 = v38;
    v20 = (_QWORD *)MEMORY[0x1E0CB8AC0];
  }
  else
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v18 = 0;
      v19 = 0;
      v26 = 0;
      goto LABEL_21;
    }
    v36 = 0;
    v37 = 0;
    -[HUQuickControlRingSliderRangeViewController _getHeaterCoolerThresholdControlItemStateString:temperatureString:withRangeControlItemValue:](self, "_getHeaterCoolerThresholdControlItemStateString:temperatureString:withRangeControlItemValue:", &v37, &v36, v6);
    v18 = v37;
    v19 = v36;
    v20 = (_QWORD *)MEMORY[0x1E0CB8790];
  }
  objc_msgSend(v16, "objectForKey:", *v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
    v26 = objc_msgSend(v24, "integerValue") == 0;
  else
    v26 = 0;

LABEL_21:
  -[HUQuickControlRingSliderRangeViewController ringSliderView](self, "ringSliderView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "updateSupplementaryLabelWithString:", v18);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = 40.0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v5 = v4;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v5;
      else
        v29 = 0;
      v30 = v29;

      if (objc_msgSend(v30, "mode") == 2)
        v28 = 40.0;
      else
        v28 = 65.0;

    }
    else
    {
      v28 = 65.0;
    }
  }
  -[HUQuickControlRingSliderRangeViewController ringSliderView](self, "ringSliderView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "updatePrimaryLabelWithString:fontSize:", v19, v28);

  if (v26)
  {
    v32 = 0;
    v33 = 1;
  }
  else
  {
    -[HUQuickControlRingSliderRangeViewController ringSliderView](self, "ringSliderView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "reachabilityState") == 1)
    {
      v32 = 0;
      v33 = 1;
    }
    else
    {
      -[HUQuickControlRingSliderRangeViewController ringSliderView](self, "ringSliderView");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v5, "reachabilityState") == 0;
      v32 = 1;
    }
  }
  -[HUQuickControlRingSliderRangeViewController ringSliderView](self, "ringSliderView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setShowOffState:", v33);

  if (v32)
  if (!v26)

LABEL_42:
}

- (void)modelValueDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlRingSliderRangeViewController;
  -[HUQuickControlSingleControlViewController modelValueDidChange](&v4, sel_modelValueDidChange);
  -[HUQuickControlSingleControlViewController modelValue](self, "modelValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlRingSliderRangeViewController updateMainStatusStringWithValue:](self, "updateMainStatusStringWithValue:", v3);

  -[HUQuickControlRingSliderRangeViewController updateSupplementaryValue](self, "updateSupplementaryValue");
}

- (void)quickControlItemUpdater:(id)a3 didUpdateResultsForControlItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  -[HUQuickControlSingleControlViewController interactionCoordinator](self, "interactionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "controlView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = objc_msgSend(v11, "isUserInteractionActive");
  if ((v12 & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)HUQuickControlRingSliderRangeViewController;
    -[HUQuickControlSingleControlViewController quickControlItemUpdater:didUpdateResultsForControlItems:](&v13, sel_quickControlItemUpdater_didUpdateResultsForControlItems_, v6, v7);
  }
  -[HUQuickControlRingSliderRangeViewController updateSupplementaryValue](self, "updateSupplementaryValue");

}

- (void)updateSupplementaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  float v29;
  float v30;
  void *v31;
  float v32;
  float v33;
  void *v34;
  float v35;
  double v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[HUQuickControlViewController controlItems](self, "controlItems");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqual:", v5))
  {

    return;
  }
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      return;
  }
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30558]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "mode");
  if (v12 == 2)
  {
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "minimumValueConstraints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "maximumValueConstraints");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v12 != 1)
    {
      v14 = 0;
      v18 = 0;
      goto LABEL_14;
    }
    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetValueConstraints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "targetValueConstraints");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v16;

  if (!v14 || !v18)
  {
LABEL_14:
    HFLogForCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "-[HUQuickControlRingSliderRangeViewController updateSupplementaryValue]";
      v43 = 2112;
      v44 = v14;
      v45 = 2112;
      v46 = v18;
      _os_log_error_impl(&dword_1B8E1E000, v38, OS_LOG_TYPE_ERROR, "%s. Either HFNumberValueConstraints for min and max are nil. (minConstraints = %@, maxConstraints = %@)", buf, 0x20u);
    }

    -[HUQuickControlRingSliderRangeViewController ringSliderView](self, "ringSliderView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setSupplementaryValue:", 1.79769313e308);

    goto LABEL_17;
  }
  objc_msgSend(v14, "validRange");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "validRange");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unionRange:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "latestResults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0D30520]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0CB8890]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v27 = v26;
  objc_msgSend(v21, "minValue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "floatValue");
  v30 = v27 - v29;
  objc_msgSend(v21, "maxValue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "floatValue");
  v33 = v32;
  objc_msgSend(v21, "minValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "floatValue");
  v36 = (float)(v30 / (float)(v33 - v35));

  -[HUQuickControlRingSliderRangeViewController ringSliderView](self, "ringSliderView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setSupplementaryValue:", v36);

LABEL_17:
}

- (void)_getTemperatureThresholdControlItemStateString:(id *)a3 temperatureString:(id *)a4 withRangeControlItemValue:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _QWORD aBlock[8];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v8 = a5;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__8;
  v56 = __Block_byref_object_dispose__8;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__8;
  v50 = __Block_byref_object_dispose__8;
  v51 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __138__HUQuickControlRingSliderRangeViewController__getTemperatureThresholdControlItemStateString_temperatureString_withRangeControlItemValue___block_invoke;
  aBlock[3] = &unk_1E6F51018;
  aBlock[6] = a3;
  aBlock[7] = a4;
  aBlock[4] = &v52;
  aBlock[5] = &v46;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D30520]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D313F0], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "temperatureFormatter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setInputIsCelsius:", 1);
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB8890]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB8AC0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v16, "integerValue"))
  {
    case 0:
      _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlTemperatureNow"), CFSTR("HUQuickControlTemperatureNow"), 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedUppercaseString");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v53[5];
      v53[5] = v18;

      objc_msgSend(v14, "stringForObjectValue:", v15);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v47[5];
      v47[5] = v20;
      goto LABEL_14;
    case 1:
      _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlTemperatureHeatTo"), CFSTR("HUQuickControlTemperatureHeatTo"), 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedUppercaseString");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v53[5];
      v53[5] = v23;

      objc_msgSend(v8, "targetValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringForObjectValue:", v21);
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
      _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlTemperatureCoolTo"), CFSTR("HUQuickControlTemperatureCoolTo"), 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedUppercaseString");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v53[5];
      v53[5] = v27;

      objc_msgSend(v8, "targetValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringForObjectValue:", v21);
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 3:
      if (objc_msgSend(v16, "integerValue") != 3)
        goto LABEL_11;
      objc_msgSend(v8, "minimumValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
        goto LABEL_11;
      objc_msgSend(v8, "maximumValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        objc_msgSend(v8, "targetValue");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
LABEL_18:
          _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlTemperatureKeepBetween"), CFSTR("HUQuickControlTemperatureKeepBetween"), 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "localizedUppercaseString");
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)v53[5];
          v53[5] = v37;

          objc_msgSend(v8, "maximumValue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringForObjectValue:", v21);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "minimumValue");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringForObjectValue:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          HFLocalizedStringWithFormat();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "localizedUppercaseString", v40, v44);
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = (void *)v47[5];
          v47[5] = v42;

          goto LABEL_14;
        }
      }
      else
      {

      }
LABEL_11:
      if (objc_msgSend(v16, "integerValue") != 3)
        goto LABEL_18;
      _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlTemperatureSetTo"), CFSTR("HUQuickControlTemperatureSetTo"), 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedUppercaseString");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v53[5];
      v53[5] = v33;

      objc_msgSend(v8, "targetValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringForObjectValue:", v21);
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v35 = (void *)v47[5];
      v47[5] = v25;

LABEL_14:
LABEL_15:

      if (v9)
        v9[2](v9);

      _Block_object_dispose(&v46, 8);
      _Block_object_dispose(&v52, 8);

      return;
    default:
      goto LABEL_15;
  }
}

_QWORD *__138__HUQuickControlRingSliderRangeViewController__getTemperatureThresholdControlItemStateString_temperatureString_withRangeControlItemValue___block_invoke(_QWORD *result)
{
  _QWORD *v1;

  v1 = result;
  if (result[6])
  {
    result = objc_retainAutorelease(*(id *)(*(_QWORD *)(result[4] + 8) + 40));
    *(_QWORD *)v1[6] = result;
  }
  if (v1[7])
  {
    result = objc_retainAutorelease(*(id *)(*(_QWORD *)(v1[5] + 8) + 40));
    *(_QWORD *)v1[7] = result;
  }
  return result;
}

- (void)_getHeaterCoolerThresholdControlItemStateString:(id *)a3 temperatureString:(id *)a4 withRangeControlItemValue:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD aBlock[8];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v8 = a5;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__8;
  v53 = __Block_byref_object_dispose__8;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__8;
  v47 = __Block_byref_object_dispose__8;
  v48 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __139__HUQuickControlRingSliderRangeViewController__getHeaterCoolerThresholdControlItemStateString_temperatureString_withRangeControlItemValue___block_invoke;
  aBlock[3] = &unk_1E6F51018;
  aBlock[6] = a3;
  aBlock[7] = a4;
  aBlock[4] = &v49;
  aBlock[5] = &v43;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[HUQuickControlSingleControlViewController controlItem](self, "controlItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "latestResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D30520]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D313F0], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "temperatureFormatter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setInputIsCelsius:", 1);
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB8890]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB8AB8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB8790]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "integerValue"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlTemperatureNow"), CFSTR("HUQuickControlTemperatureNow"), 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedUppercaseString");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v50[5];
    v50[5] = v28;

    objc_msgSend(v14, "stringForObjectValue:", v15);
    v30 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v44[5];
    v44[5] = v30;
    goto LABEL_13;
  }
  v18 = objc_msgSend(v16, "integerValue");
  if (v18 == 2)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlTemperatureCoolingTo"), CFSTR("HUQuickControlTemperatureCoolingTo"), 1);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v50[5];
    v50[5] = v31;

    objc_msgSend(v8, "targetValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringForObjectValue:", v23);
    v33 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v39 = (void *)v44[5];
    v44[5] = v33;

    goto LABEL_13;
  }
  if (v18 == 1)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlTemperatureHeatingTo"), CFSTR("HUQuickControlTemperatureHeatingTo"), 1);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v50[5];
    v50[5] = v34;

    objc_msgSend(v8, "targetValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringForObjectValue:", v23);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (v18)
    goto LABEL_14;
  objc_msgSend(v8, "minimumValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19
    || (objc_msgSend(v8, "maximumValue"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        !v20))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlTemperatureSetTo"), CFSTR("HUQuickControlTemperatureSetTo"), 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedUppercaseString");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v50[5];
    v50[5] = v37;

    objc_msgSend(v8, "targetValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringForObjectValue:", v23);
    v33 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  _HULocalizedStringWithDefaultValue(CFSTR("HUQuickControlTemperatureKeepBetween"), CFSTR("HUQuickControlTemperatureKeepBetween"), 1);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v50[5];
  v50[5] = v21;

  objc_msgSend(v8, "maximumValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringForObjectValue:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minimumValue");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringForObjectValue:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedStringWithFormat();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v44[5];
  v44[5] = v25;

LABEL_13:
LABEL_14:

  if (v9)
    v9[2](v9);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

}

_QWORD *__139__HUQuickControlRingSliderRangeViewController__getHeaterCoolerThresholdControlItemStateString_temperatureString_withRangeControlItemValue___block_invoke(_QWORD *result)
{
  _QWORD *v1;

  v1 = result;
  if (result[6])
  {
    result = objc_retainAutorelease(*(id *)(*(_QWORD *)(result[4] + 8) + 40));
    *(_QWORD *)v1[6] = result;
  }
  if (v1[7])
  {
    result = objc_retainAutorelease(*(id *)(*(_QWORD *)(v1[5] + 8) + 40));
    *(_QWORD *)v1[7] = result;
  }
  return result;
}

- (HUQuickControlRingSliderView)ringSliderView
{
  return self->_ringSliderView;
}

- (void)setRingSliderView:(id)a3
{
  objc_storeStrong((id *)&self->_ringSliderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringSliderView, 0);
}

@end
