@implementation WFLightroomPresetPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void)setAction:(id)a3
{
  WFAction **p_action;
  id v5;
  id WeakRetained;

  p_action = &self->_action;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_action);
  objc_msgSend(WeakRetained, "removeEventObserver:", self);

  objc_storeWeak((id *)p_action, v5);
  objc_msgSend(v5, "addEventObserver:", self);

  -[WFLightroomPresetPickerParameter possibleStatesDidChange](self, "possibleStatesDidChange");
}

- (void)possibleStatesDidChange
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFLightroomPresetPickerParameter;
  -[WFLightroomPresetPickerParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
}

- (BOOL)isHidden
{
  void *v2;
  BOOL v3;

  -[WFLightroomPresetPickerParameter possibleStates](self, "possibleStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (NSArray)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    -[WFLightroomPresetPickerParameter action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLightroomPresetPickerParameter definition](self, "definition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("PresetGroupKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameterStateForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "presetsByGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "if_compactMap:", &__block_literal_global_1130);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_possibleStates;
    self->_possibleStates = v11;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;

  v5 = a4;
  -[WFLightroomPresetPickerParameter definition](self, "definition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("PresetGroupKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
    -[WFLightroomPresetPickerParameter possibleStatesDidChange](self, "possibleStatesDidChange");
}

- (WFAction)action
{
  return (WFAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __50__WFLightroomPresetPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC3DF8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

+ (id)presetsByGroup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
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
  _QWORD v54[4];
  _QWORD v55[4];
  _QWORD v56[4];
  _QWORD v57[5];
  _QWORD v58[10];
  _QWORD v59[6];
  _QWORD v60[10];
  _QWORD v61[7];
  _QWORD v62[9];

  v62[7] = *MEMORY[0x24BDAC8D0];
  v61[0] = CFSTR("B&W");
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("19271F2DDD66BC545C6190F4B84A36F0"), CFSTR("Punch"));
  v60[0] = v53;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("1CFE55E8E69B5ACE9873EF4AA90E8B4D"), CFSTR("High Contrast"));
  v60[1] = v52;
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("33C9D95D9699BFAFC894C2040B26F8D3"), CFSTR("Sepia Tone"));
  v60[2] = v51;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("4F0AAD59434D2B8A9A97FF18B7DA9A9F"), CFSTR("Infrared"));
  v60[3] = v50;
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("A0E0A57F977717F5A5D58D93EEFCDE80"), CFSTR("Selenium Tone"));
  v60[4] = v49;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("ACA9F103CE197414B5D2FB044214A1F6"), CFSTR("Split Tone"));
  v60[5] = v48;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("BC40F013813101E79FA77C52AF2C24EA"), CFSTR("Landscape"));
  v60[6] = v47;
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("D6FD323773F16CA6E39CD151831EDD57"), CFSTR("Soft"));
  v60[7] = v46;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("D858F1679E126E7B88F477259C932EE8"), CFSTR("Flat"));
  v60[8] = v45;
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("F6E61E9487CF280BA0F78E85B8291EEE"), CFSTR("Low Contrast"));
  v60[9] = v44;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 10);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v43;
  v61[1] = CFSTR("Color");
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("24411B29DA6F03858BD4604A6772D3B7"), CFSTR("High Contrast"));
  v59[0] = v42;
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("94A7B12F170D65F5F86DF16A8165EDB8"), CFSTR("Matte"));
  v59[1] = v41;
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("A8400A4F84CEFC90DFDC3F0598A3E80F"), CFSTR("Natural"));
  v59[2] = v40;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("B4DF7CAAC3DC5851334749CD66C6E093"), CFSTR("Vivid"));
  v59[3] = v39;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("D7878D40EEE6081C516E9F49732DE1A3"), CFSTR("High Contrast & Detail"));
  v59[4] = v38;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("D9DBEEE928A264244D00B9960351DD85"), CFSTR("Bright"));
  v59[5] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v36;
  v61[2] = CFSTR("Creative");
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("0F011E395F1F535B9C22C9FD317FF541"), CFSTR("Flat & Green"));
  v58[0] = v35;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("1F87275D229A17F59AC6AEEB07740A8B"), CFSTR("Warm Shadows"));
  v58[1] = v34;
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("4CE218B784FD9FA45A901D74AA9473B1"), CFSTR("Cool Light"));
  v58[2] = v33;
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("62A3A4F10DEFAB5DB96E2E819695AE45"), CFSTR("Turquoise & Red"));
  v58[3] = v32;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("ACA35E0D0E9604A00E57A3DE7CC349D4"), CFSTR("Red Lift Matte"));
  v58[4] = v31;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("CED5E9863E3821FFE0A1B691A63A3D31"), CFSTR("Warm Contrast"));
  v58[5] = v30;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("CFB23A1F4CC9954DB4D5BABB76B1837A"), CFSTR("Desaturated Contrast"));
  v58[6] = v29;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("E28022BE507EB904FAC12AF4D9020EF2"), CFSTR("Soft Mist"));
  v58[7] = v28;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("E9F14D340EE517BAE40885B2C75179E3"), CFSTR("Vintage Instant"));
  v58[8] = v27;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("F2519E32E9412F082845648CCAE463EC"), CFSTR("Aged Photo"));
  v58[9] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v25;
  v61[3] = CFSTR("Curve");
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("34B01A80E7C1D5D9066012B6EF3FDC18"), CFSTR("Flat"));
  v57[0] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("63A97DC6094C1DA30C06339BABF88894"), CFSTR("Strong S Curve"));
  v57[1] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("69FE229AD75B5BB3A8579C3B854C5B48"), CFSTR("None"));
  v57[2] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("7B538D900711C300BE09C022DABF1363"), CFSTR("Lift Shadows"));
  v57[3] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("BD3BD3746830FD852159955AB11EEE21"), CFSTR("Cross Process"));
  v57[4] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v19;
  v61[4] = CFSTR("Grain");
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("26974227534FC2BE01BA2FEA23B0B1CA"), CFSTR("Medium"));
  v56[0] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("54E8B33AF99FF270CA5063C498BD3C90"), CFSTR("Heavy"));
  v56[1] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("65099705565294D471733DF04B6EFF81"), CFSTR("None"));
  v56[2] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("95FB372852D2646A914E82BAF810A621"), CFSTR("Light"));
  v56[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v14;
  v61[5] = CFSTR("Sharpening");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("1A5330A7529B1FDCB1B2747AD29A7D37"), CFSTR("Medium"));
  v55[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("606E77E300EA35C7C7F54A0D01217A3C"), CFSTR("None"));
  v55[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("B9F499526A62395B4B74670B1A42F1C9"), CFSTR("Heavy"));
  v55[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("DAEFD428A1FABB512C2FC55653E43823"), CFSTR("Light"));
  v55[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v6;
  v61[6] = CFSTR("Vignetting");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("3E6450B5D15D661006AD72C79EC6FB6E"), CFSTR("Medium"));
  v54[0] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("B10E60EFE17E2A501068449B3374EED4"), CFSTR("Heavy"));
  v54[1] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("B172B4349A640AD8EFFCF1747FF1D96F"), CFSTR("None"));
  v54[2] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", CFSTR("BC38A4949BDF6AD56FD42D6E5563C9C3"), CFSTR("Light"));
  v54[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v62[6] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
