@implementation HUSymbolIconPickerViewController

+ (NSArray)sceneIconDescriptors
{
  if (qword_1EF226A10 != -1)
    dispatch_once(&qword_1EF226A10, &__block_literal_global_95);
  return (NSArray *)(id)_MergedGlobals_3_3;
}

void __56__HUSymbolIconPickerViewController_sceneIconDescriptors__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[131];

  v4[130] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("bed.double.fill");
  v4[1] = CFSTR("sofa.fill");
  v0 = *MEMORY[0x1E0D30F80];
  v4[2] = CFSTR("chair.lounge.fill");
  v4[3] = v0;
  v4[4] = CFSTR("building.2.fill");
  v4[5] = CFSTR("oven.fill");
  v4[6] = CFSTR("fork.knife");
  v4[7] = CFSTR("cup.and.saucer.fill");
  v4[8] = CFSTR("frying.pan.fill");
  v4[9] = CFSTR("sink.fill");
  v4[10] = CFSTR("bathtub.fill");
  v4[11] = CFSTR("book.closed.fill");
  v4[12] = CFSTR("book.fill");
  v4[13] = CFSTR("paintpalette.fill");
  v4[14] = CFSTR("paintbrush.fill");
  v4[15] = CFSTR("paintbrush.pointed.fill");
  v4[16] = CFSTR("ruler.fill");
  v4[17] = CFSTR("gamecontroller.fill");
  v4[18] = CFSTR("die.face.5.fill");
  v4[19] = CFSTR("theatermasks.fill");
  v4[20] = CFSTR("puzzlepiece.fill");
  v4[21] = CFSTR("metronome.fill");
  v4[22] = CFSTR("pianokeys");
  v4[23] = CFSTR("tuningfork");
  v4[24] = CFSTR("binoculars.fill");
  v4[25] = CFSTR("film.fill");
  v4[26] = CFSTR("birthday.cake.fill");
  v4[27] = CFSTR("popcorn.fill");
  v4[28] = CFSTR("wineglass.fill");
  v4[29] = CFSTR("ticket.fill");
  v4[30] = CFSTR("guitars.fill");
  v4[31] = CFSTR("fireplace.fill");
  v4[32] = CFSTR("moon.stars.fill");
  v4[33] = CFSTR("sun.and.horizon.fill");
  v4[34] = CFSTR("sunrise.fill");
  v4[35] = CFSTR("sunset.fill");
  v4[36] = CFSTR("sun.max.fill");
  v4[37] = CFSTR("cloud.rain.fill");
  v4[38] = CFSTR("drop.fill");
  v4[39] = CFSTR("wind");
  v4[40] = CFSTR("flame.fill");
  v4[41] = CFSTR("snowflake");
  v4[42] = CFSTR("thermometer.medium");
  v4[43] = CFSTR("umbrella.fill");
  v4[44] = CFSTR("leaf.fill");
  v4[45] = CFSTR("cloud.fill");
  v4[46] = CFSTR("figure.run");
  v4[47] = CFSTR("figure.socialdance");
  v4[48] = CFSTR("figure.mind.and.body");
  v4[49] = CFSTR("figure.core.training");
  v4[50] = CFSTR("figure.walk");
  v4[51] = CFSTR("figure.roll.runningpace");
  v4[52] = CFSTR("figure.indoor.cycle");
  v4[53] = CFSTR("figure.elliptical");
  v4[54] = CFSTR("figure.jumprope");
  v4[55] = CFSTR("figure.highintensity.intervaltraining");
  v4[56] = CFSTR("figure.walk.arrival");
  v4[57] = CFSTR("figure.walk.departure");
  v4[58] = CFSTR("person.2.fill");
  v4[59] = CFSTR("baseball.fill");
  v4[60] = CFSTR("basketball.fill");
  v4[61] = CFSTR("dumbbell.fill");
  v4[62] = CFSTR("football.fill");
  v4[63] = CFSTR("soccerball");
  v4[64] = CFSTR("tennisball.fill");
  v4[65] = CFSTR("volleyball.fill");
  v4[66] = CFSTR("speaker.wave.2.fill");
  v4[67] = CFSTR("phone.fill");
  v4[68] = CFSTR("video.fill");
  v4[69] = CFSTR("alarm.fill");
  v4[70] = CFSTR("calendar");
  v4[71] = CFSTR("clock.fill");
  v4[72] = CFSTR("envelope.fill");
  v4[73] = CFSTR("hifispeaker.2.fill");
  v4[74] = CFSTR("radio.fill");
  v4[75] = CFSTR("person.crop.rectangle.fill");
  v4[76] = CFSTR("person.lanyardcard.fill");
  v4[77] = CFSTR("tv.and.hifispeaker.fill");
  v4[78] = CFSTR("display");
  v4[79] = CFSTR("play.tv.fill");
  v4[80] = CFSTR("cart.fill");
  v4[81] = CFSTR("briefcase.fill");
  v4[82] = CFSTR("suitcase.fill");
  v4[83] = CFSTR("suitcase.cart.fill");
  v4[84] = CFSTR("keyboard.fill");
  v4[85] = CFSTR("lock.shield.fill");
  v4[86] = CFSTR("lightbulb.fill");
  v4[87] = CFSTR("lightbulb.slash.fill");
  v4[88] = CFSTR("scissors");
  v4[89] = CFSTR("airplane");
  v4[90] = CFSTR("car.fill");
  v4[91] = CFSTR("heart.fill");
  v4[92] = CFSTR("dial.medium.fill");
  v4[93] = CFSTR("fanblades.fill");
  v4[94] = CFSTR("wrench.and.screwdriver.fill");
  v4[95] = CFSTR("lock.fill");
  v4[96] = CFSTR("trophy.fill");
  v4[97] = CFSTR("studentdesk");
  v4[98] = CFSTR("tshirt.fill");
  v4[99] = CFSTR("balloon.2.fill");
  v4[100] = CFSTR("flag.fill");
  v4[101] = CFSTR("sparkles");
  v4[102] = CFSTR("party.popper.fill");
  v4[103] = CFSTR("music.mic");
  v4[104] = CFSTR("wand.and.stars");
  v4[105] = CFSTR("emoji.face.smiling.with.sunglasses");
  v4[106] = CFSTR("emoji.face.smiling.with.hearts");
  v4[107] = CFSTR("emoji.face.smiling.with.heart.eyes");
  v4[108] = CFSTR("memoji");
  v4[109] = CFSTR("emoji.ghost");
  v4[110] = CFSTR("emoji.skull");
  v4[111] = CFSTR("emoji.alien");
  v4[112] = CFSTR("emoji.unicorn");
  v4[113] = CFSTR("emoji.horse.face");
  v4[114] = CFSTR("emoji.snake");
  v4[115] = CFSTR("emoji.mouse.face");
  v4[116] = CFSTR("emoji.pig.face");
  v4[117] = CFSTR("emoji.monkey.face");
  v4[118] = CFSTR("emoji.cow.face");
  v4[119] = CFSTR("emoji.tiger.face");
  v4[120] = CFSTR("emoji.ram.face");
  v4[121] = CFSTR("emoji.rabbit.face");
  v4[122] = CFSTR("emoji.dragon.face");
  v4[123] = CFSTR("emoji.robot.face");
  v4[124] = CFSTR("emoji.alien.monster");
  v4[125] = CFSTR("emoji.pile.of.poop");
  v4[126] = CFSTR("emoji.dog.face");
  v4[127] = CFSTR("emoji.bear.face");
  v4[128] = CFSTR("emoji.cat.face");
  v4[129] = CFSTR("emoji.chicken.face");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 130);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_326);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_3_3;
  _MergedGlobals_3_3 = v2;

}

id __56__HUSymbolIconPickerViewController_sceneIconDescriptors__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D31460];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithSystemImageNamed:", v3);

  return v4;
}

+ (id)tintColors
{
  if (qword_1EF226A20 != -1)
    dispatch_once(&qword_1EF226A20, &__block_literal_global_327);
  return (id)qword_1EF226A18;
}

void __46__HUSymbolIconPickerViewController_tintColors__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[13];

  v14[12] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v13;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v12;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v0;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v1;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemMintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v2;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemCyanColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v3;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemTealColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v4;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v5;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemIndigoColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v6;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemPurpleColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v7;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemPinkColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[10] = v8;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBrownColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[11] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 12);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1EF226A18;
  qword_1EF226A18 = v10;

}

- (HUSymbolIconPickerViewController)initWithIconDescriptors:(id)a3 selectedIconDescriptor:(id)a4 selectedTintColor:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  HUSymbolIconPickerViewController *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_super v23;
  _QWORD v24[4];
  id v25;
  id location;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_initWeak(&location, self);
  v15 = objc_alloc(MEMORY[0x1E0CEA428]);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __110__HUSymbolIconPickerViewController_initWithIconDescriptors_selectedIconDescriptor_selectedTintColor_delegate___block_invoke;
  v24[3] = &unk_1E6F534D8;
  objc_copyWeak(&v25, &location);
  v16 = (void *)objc_msgSend(v15, "initWithSectionProvider:", v24);
  v23.receiver = self;
  v23.super_class = (Class)HUSymbolIconPickerViewController;
  v17 = -[HUSymbolIconPickerViewController initWithCollectionViewLayout:](&v23, sel_initWithCollectionViewLayout_, v16);
  if (v17)
  {
    if (objc_msgSend((id)objc_opt_class(), "indexOfIconDescriptor:inArray:", v12, v11) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = objc_alloc(MEMORY[0x1E0D31460]);
      v19 = objc_msgSend(v18, "initWithSystemImageNamed:", *MEMORY[0x1E0D30F80]);

      v12 = (id)v19;
    }
    objc_storeStrong((id *)&v17->_iconDescriptors, a3);
    objc_storeStrong((id *)&v17->_selectedIconDescriptor, v12);
    v20 = v13;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v17->_selectedTintColor, v20);
    if (!v13)

    objc_storeWeak((id *)&v17->_delegate, v14);
    _HULocalizedStringWithDefaultValue(CFSTR("HUIconPickerTitle"), CFSTR("HUIconPickerTitle"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSymbolIconPickerViewController setTitle:](v17, "setTitle:", v21);

    -[HUSymbolIconPickerViewController applyTintColor](v17, "applyTintColor");
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v17;
}

id __110__HUSymbolIconPickerViewController_initWithIconDescriptors_selectedIconDescriptor_selectedTintColor_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_layoutSectionForSection:layoutEnvironment:", a2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)viewDidLoad
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
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUSymbolIconPickerViewController;
  -[HUSymbolIconPickerViewController viewDidLoad](&v21, sel_viewDidLoad);
  -[HUSymbolIconPickerViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsMultipleSelection:", 1);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSymbolIconPickerViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[HUSymbolIconPickerViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("header"));

  -[HUSymbolIconPickerViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("colorTint"));

  -[HUSymbolIconPickerViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(), *MEMORY[0x1E0CEB3B0], CFSTR("colorTintSeparator"));

  -[HUSymbolIconPickerViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("icon"));

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel_);
  -[HUSymbolIconPickerViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLeftBarButtonItem:", v10);

  -[HUSymbolIconPickerViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leftBarButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("Home.Scene.ChooseIcon.Cancel"));

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
  -[HUSymbolIconPickerViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRightBarButtonItem:", v14);

  -[HUSymbolIconPickerViewController selectedIconDescriptor](self, "selectedIconDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSymbolIconPickerViewController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rightBarButtonItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEnabled:", v16 != 0);

  -[HUSymbolIconPickerViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rightBarButtonItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("Home.Scene.ChooseIcon.Done"));

}

- (void)viewDidLayoutSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUSymbolIconPickerViewController;
  -[HUSymbolIconPickerViewController viewDidLayoutSubviews](&v19, sel_viewDidLayoutSubviews);
  -[HUSymbolIconPickerViewController selectedIconDescriptor](self, "selectedIconDescriptor");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[HUSymbolIconPickerViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathsForSelectedItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      v8 = (void *)objc_opt_class();
      -[HUSymbolIconPickerViewController selectedIconDescriptor](self, "selectedIconDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUSymbolIconPickerViewController iconDescriptors](self, "iconDescriptors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "indexOfIconDescriptor:inArray:", v9, v10);

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[HUSymbolIconPickerViewController collectionView](self, "collectionView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v11, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "selectItemAtIndexPath:animated:scrollPosition:", v13, 0, 0);

      }
      objc_msgSend((id)objc_opt_class(), "tintColors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUSymbolIconPickerViewController selectedTintColor](self, "selectedTintColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "indexOfObject:", v15);

      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[HUSymbolIconPickerViewController collectionView](self, "collectionView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v16, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "selectItemAtIndexPath:animated:scrollPosition:", v18, 0, 0);

      }
    }
  }
}

- (void)applyTintColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HUSymbolIconPickerViewController selectedTintColor](self, "selectedTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CEA650];
    -[HUSymbolIconPickerViewController selectedTintColor](self, "selectedTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationWithHierarchicalColor:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[HUSymbolIconPickerViewController selectedIconDescriptor](self, "selectedIconDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageIconDescriptorWithUpdatedImageSymbolConfiguration:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSymbolIconPickerViewController setSelectedIconDescriptor:](self, "setSelectedIconDescriptor:", v7);

  }
}

+ (int64_t)indexOfIconDescriptor:(id)a3 inArray:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;

  v5 = a3;
  objc_msgSend(a4, "valueForKey:", CFSTR("imageIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "indexOfObject:", v7);
  return v8;
}

- (void)_cancel:(id)a3
{
  id v4;

  -[HUSymbolIconPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconPickerDidCancel:", self);

}

- (void)_done:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HUSymbolIconPickerViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUSymbolIconPickerViewController selectedIconDescriptor](self, "selectedIconDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSymbolIconPickerViewController selectedTintColor](self, "selectedTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconPicker:didPickIcon:withTintColor:", self, v4, v5);

}

- (id)_layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a4;
  if (a3 == 2)
  {
    -[HUSymbolIconPickerViewController _buildIconPickerSectionWithEnvironment:](self, "_buildIconPickerSectionWithEnvironment:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[HUSymbolIconPickerViewController _buildColorTintSectionWithEnvironment:](self, "_buildColorTintSectionWithEnvironment:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v8 = 0;
      goto LABEL_9;
    }
    -[HUSymbolIconPickerViewController _buildHeaderSectionWithEnvironment:](self, "_buildHeaderSectionWithEnvironment:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_9:

  return v8;
}

- (id)_buildHeaderSectionWithEnvironment:(id)a3
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

  v3 = (void *)MEMORY[0x1E0CEA1E0];
  v4 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", a3, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalHeightDimension:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeWithWidthDimension:heightDimension:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemWithLayoutSize:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setContentInsets:", 15.0, 15.0, 15.0, 15.0);
  v9 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", 120.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeWithWidthDimension:heightDimension:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1D0], "horizontalGroupWithLayoutSize:subitem:count:", v12, v8, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentInsets:", 15.0, 30.0, 10.0, 30.0);

  return v14;
}

- (id)_buildColorTintSectionWithEnvironment:(id)a3
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
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", a3, 52.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", 52.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithWidthDimension:heightDimension:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heightDimension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeWithWidthDimension:heightDimension:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentInsets:", 5.0, 5.0, 5.0, 5.0);
  v12 = (void *)MEMORY[0x1E0CEA1D0];
  v25[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "horizontalGroupWithLayoutSize:subitems:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1F8], "flexibleSpacing:", 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInterItemSpacing:", v15);

  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInterGroupSpacing:", 5.0);
  objc_msgSend(v16, "setContentInsets:", 10.0, 30.0, 30.0, 30.0);
  v17 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", 0.5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sizeWithWidthDimension:heightDimension:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1B0], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v20, *MEMORY[0x1E0CEB3B0], 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBoundarySupplementaryItems:", v22);

  objc_msgSend(v16, "setSupplementariesFollowContentInsets:", 0);
  return v16;
}

- (id)_buildIconPickerSectionWithEnvironment:(id)a3
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
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", a3, 45.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C0], "absoluteDimension:", 45.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithWidthDimension:heightDimension:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CEA1F0];
  objc_msgSend(MEMORY[0x1E0CEA1C0], "fractionalWidthDimension:", 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heightDimension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeWithWidthDimension:heightDimension:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1E0], "itemWithLayoutSize:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CEA1D0];
  v18[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "horizontalGroupWithLayoutSize:subitems:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA1F8], "flexibleSpacing:", 10.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInterItemSpacing:", v15);

  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithGroup:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInterGroupSpacing:", 20.0);
  objc_msgSend(v16, "setContentInsets:", 25.0, 30.0, 15.0, 30.0);

  return v16;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;

  v6 = a3;
  if (a4)
  {
    if (a4 == 2)
    {
      -[HUSymbolIconPickerViewController iconDescriptors](self, "iconDescriptors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4 != 1)
      {
        v8 = -1;
        goto LABEL_9;
      }
      objc_msgSend((id)objc_opt_class(), "tintColors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;
    v8 = objc_msgSend(v7, "count");

  }
  else
  {
    v8 = 1;
  }
LABEL_9:

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
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

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == 2)
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("icon"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSymbolIconPickerViewController iconDescriptors](self, "iconDescriptors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSymbolIconPickerViewController selectedTintColor](self, "selectedTintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIconDescriptor:andSelectedTintColor:", v13, v14);

    v9 = v11;
    -[HUSymbolIconPickerViewController iconDescriptors](self, "iconDescriptors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityIdentifier:", v17);

LABEL_7:
    goto LABEL_9;
  }
  if (v8 == 1)
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("colorTint"), v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "tintColors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setColor:", v20);

    v9 = v18;
    objc_msgSend(v9, "color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessibilityName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityIdentifier:", v16);

    goto LABEL_7;
  }
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("header"), v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[HUSymbolIconPickerViewController selectedIconDescriptor](self, "selectedIconDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIconDescriptor:", v10);

    objc_msgSend(v9, "setUserInteractionEnabled:", 0);
  }
LABEL_9:

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CEB3B0]) & 1) == 0)
    NSLog(CFSTR("Asked for a view for an unexpected kind: %@"), v8);
  objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, CFSTR("colorTintSeparator"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  return v10;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "indexPathsForSelectedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v7, "compare:", v13))
        {
          v14 = objc_msgSend(v13, "section");
          if (v14 == objc_msgSend(v7, "section"))
            objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v13, 1);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v10);
  }
  v15 = objc_msgSend(v7, "section");
  if (v15 == 2)
  {
    -[HUSymbolIconPickerViewController iconDescriptors](self, "iconDescriptors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_alloc(MEMORY[0x1E0D31460]);
    objc_msgSend(v18, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageSymbolConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "initWithSystemImageNamed:configuration:", v21, v22);
    -[HUSymbolIconPickerViewController setSelectedIconDescriptor:](self, "setSelectedIconDescriptor:", v23);

    -[HUSymbolIconPickerViewController applyTintColor](self, "applyTintColor");
    -[HUSymbolIconPickerViewController navigationItem](self, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "rightBarButtonItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setEnabled:", 1);

    goto LABEL_15;
  }
  if (v15 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "tintColors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSymbolIconPickerViewController setSelectedTintColor:](self, "setSelectedTintColor:", v17);

    -[HUSymbolIconPickerViewController applyTintColor](self, "applyTintColor");
    objc_msgSend(v6, "indexPathsForVisibleItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reconfigureItemsAtIndexPaths:", v18);
LABEL_15:

  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadItemsAtIndexPaths:", v27);

}

- (HFImageIconDescriptor)selectedIconDescriptor
{
  return self->_selectedIconDescriptor;
}

- (void)setSelectedIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIconDescriptor, a3);
}

- (UIColor)selectedTintColor
{
  return self->_selectedTintColor;
}

- (void)setSelectedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTintColor, a3);
}

- (HUSymbolIconPickerDelegate)delegate
{
  return (HUSymbolIconPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)iconDescriptors
{
  return self->_iconDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptors, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedTintColor, 0);
  objc_storeStrong((id *)&self->_selectedIconDescriptor, 0);
}

@end
