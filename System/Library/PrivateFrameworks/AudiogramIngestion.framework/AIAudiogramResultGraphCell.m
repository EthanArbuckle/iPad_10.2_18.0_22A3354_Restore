@implementation AIAudiogramResultGraphCell

+ (double)cellHeight
{
  return 432.0;
}

- (AIAudiogramResultGraphCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AIAudiogramResultGraphCell *v5;
  AIAudiogramResultGraphCell *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
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
  id v51;
  id v52;
  objc_super v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[6];

  v63[4] = *MEMORY[0x24BDAC8D0];
  v53.receiver = self;
  v53.super_class = (Class)AIAudiogramResultGraphCell;
  v51 = a4;
  v5 = -[AIAudiogramResultGraphCell initWithStyle:reuseIdentifier:](&v53, sel_initWithStyle_reuseIdentifier_, a3);
  v6 = v5;
  if (v5)
  {
    -[AIAudiogramResultGraphCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultGraphCell setBackgroundColor:](v6, "setBackgroundColor:", v7);

    v59 = 0;
    v60 = &v59;
    v61 = 0x2050000000;
    v8 = (void *)getHKHealthStoreClass_softClass_2;
    v62 = getHKHealthStoreClass_softClass_2;
    if (!getHKHealthStoreClass_softClass_2)
    {
      v54 = MEMORY[0x24BDAC760];
      v55 = 3221225472;
      v56 = __getHKHealthStoreClass_block_invoke_2;
      v57 = &unk_24FD6CE58;
      v58 = &v59;
      __getHKHealthStoreClass_block_invoke_2((uint64_t)&v54);
      v8 = (void *)v60[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v59, 8);
    v52 = objc_alloc_init(v9);
    v59 = 0;
    v60 = &v59;
    v61 = 0x2050000000;
    v10 = (void *)getHKSampleTypeUpdateControllerClass_softClass_2;
    v62 = getHKSampleTypeUpdateControllerClass_softClass_2;
    if (!getHKSampleTypeUpdateControllerClass_softClass_2)
    {
      v54 = MEMORY[0x24BDAC760];
      v55 = 3221225472;
      v56 = __getHKSampleTypeUpdateControllerClass_block_invoke_2;
      v57 = &unk_24FD6CE58;
      v58 = &v59;
      __getHKSampleTypeUpdateControllerClass_block_invoke_2((uint64_t)&v54);
      v10 = (void *)v60[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v59, 8);
    v50 = (void *)objc_msgSend([v11 alloc], "initWithHealthStore:", v52);
    v59 = 0;
    v60 = &v59;
    v61 = 0x2050000000;
    v12 = (void *)getHKUnitPreferenceControllerClass_softClass_2;
    v62 = getHKUnitPreferenceControllerClass_softClass_2;
    if (!getHKUnitPreferenceControllerClass_softClass_2)
    {
      v54 = MEMORY[0x24BDAC760];
      v55 = 3221225472;
      v56 = __getHKUnitPreferenceControllerClass_block_invoke_2;
      v57 = &unk_24FD6CE58;
      v58 = &v59;
      __getHKUnitPreferenceControllerClass_block_invoke_2((uint64_t)&v54);
      v12 = (void *)v60[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v59, 8);
    v49 = (void *)objc_msgSend([v13 alloc], "initWithHealthStore:", v52);
    v59 = 0;
    v60 = &v59;
    v61 = 0x2050000000;
    v14 = (void *)getHKAudiogramChartViewControllerClass_softClass_2;
    v62 = getHKAudiogramChartViewControllerClass_softClass_2;
    if (!getHKAudiogramChartViewControllerClass_softClass_2)
    {
      v54 = MEMORY[0x24BDAC760];
      v55 = 3221225472;
      v56 = __getHKAudiogramChartViewControllerClass_block_invoke_2;
      v57 = &unk_24FD6CE58;
      v58 = &v59;
      __getHKAudiogramChartViewControllerClass_block_invoke_2((uint64_t)&v54);
      v14 = (void *)v60[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v59, 8);
    v16 = (void *)objc_msgSend([v15 alloc], "initWithUnitController:sampleTypeUpdateController:minimumAudiogramHeight:", v49, v50, 400.0);
    -[AIAudiogramResultGraphCell setAudiogramChart:](v6, "setAudiogramChart:", v16);

    -[AIAudiogramResultGraphCell audiogramChart](v6, "audiogramChart");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AIAudiogramResultGraphCell contentView](v6, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultGraphCell audiogramChart](v6, "audiogramChart");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v21);

    v32 = (void *)MEMORY[0x24BDD1628];
    -[AIAudiogramResultGraphCell audiogramChart](v6, "audiogramChart");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "view");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultGraphCell contentView](v6, "contentView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 16.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v43;
    -[AIAudiogramResultGraphCell audiogramChart](v6, "audiogramChart");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultGraphCell contentView](v6, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, -16.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v37;
    -[AIAudiogramResultGraphCell audiogramChart](v6, "audiogramChart");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultGraphCell contentView](v6, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v63[2] = v23;
    -[AIAudiogramResultGraphCell audiogramChart](v6, "audiogramChart");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultGraphCell contentView](v6, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, -16.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v63[3] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v30);

  }
  return v6;
}

- (void)setAudiogram:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void (*v11)(_QWORD *);
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_audiogram, a3);
  -[AIAudiogramResultGraphCell audiogramChart](self, "audiogramChart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    v18[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAudiograms:", v8);

  }
  else
  {
    objc_msgSend(v6, "setAudiograms:", MEMORY[0x24BDBD1A8]);

  }
  v9 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __43__AIAudiogramResultGraphCell_setAudiogram___block_invoke;
  v12[3] = &unk_24FD6CDA0;
  v12[4] = self;
  v10 = v12;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v11 = (void (*)(_QWORD *))getAXPerformSafeBlockSymbolLoc_ptr;
  v17 = getAXPerformSafeBlockSymbolLoc_ptr;
  if (!getAXPerformSafeBlockSymbolLoc_ptr)
  {
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __getAXPerformSafeBlockSymbolLoc_block_invoke;
    v13[3] = &unk_24FD6CE58;
    v13[4] = &v14;
    __getAXPerformSafeBlockSymbolLoc_block_invoke((uint64_t)v13);
    v11 = (void (*)(_QWORD *))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v11)
  {
    metadataForHKAudiogramSample_cold_1();
    __break(1u);
  }
  v11(v10);

}

void __43__AIAudiogramResultGraphCell_setAudiogram___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "audiogramChart");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resetCurrentGraph");

  objc_msgSend(*(id *)(a1 + 32), "audiogramChart");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateHeaderState");

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  AIAudiogramResultGraphCell *v5;

  if (-[AIAudiogramResultGraphCell pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y))v5 = self;
  else
    v5 = 0;
  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (HKAudiogramSample)audiogram
{
  return self->_audiogram;
}

- (UIViewController)audiogramChart
{
  return self->_audiogramChart;
}

- (void)setAudiogramChart:(id)a3
{
  objc_storeStrong((id *)&self->_audiogramChart, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audiogramChart, 0);
  objc_storeStrong((id *)&self->_audiogram, 0);
}

@end
