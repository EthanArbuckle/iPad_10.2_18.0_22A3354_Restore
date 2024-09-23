@implementation HREGoodNightTemplate

- (HREGoodNightTemplate)init
{
  HREGoodNightTemplate *v2;
  HREGoodNightTemplate *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HREGoodNightTemplate;
  v2 = -[HREActionSetTemplate init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HREActionSetTemplate setActionSetType:](v2, "setActionSetType:", *MEMORY[0x24BDD5210]);
    v4 = objc_alloc(MEMORY[0x24BE4D0B8]);
    v5 = (void *)objc_msgSend(v4, "initWithImageIdentifier:", *MEMORY[0x24BE4CEC8]);
    -[HREActionSetTemplate setIconDescriptor:](v3, "setIconDescriptor:", v5);

    __28__HREGoodNightTemplate_init__block_invoke();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplate setIdentifier:](v3, "setIdentifier:", v6);

    -[HRETemplate setSortingPriority:](v3, "setSortingPriority:", 1.0);
    -[HRETemplate setStarterRank:](v3, "setStarterRank:", 0.2 * 3.0 + 1.0);
  }
  return v3;
}

id __28__HREGoodNightTemplate_init__block_invoke()
{
  if (_block_invoke_na_once_token_376_0 != -1)
    dispatch_once(&_block_invoke_na_once_token_376_0, &__block_literal_global_2_0);
  return (id)_block_invoke_na_once_object_376_0;
}

void __28__HREGoodNightTemplate_init__block_invoke_2()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_376_0;
  _block_invoke_na_once_object_376_0 = (uint64_t)CFSTR("goodNight");

}

id __42__HREGoodNightTemplate_extraInvolvedTypes__block_invoke()
{
  if (_block_invoke_2_na_once_token_377_0 != -1)
    dispatch_once(&_block_invoke_2_na_once_token_377_0, &__block_literal_global_5_0);
  return (id)_block_invoke_2_na_once_object_377_0;
}

void __42__HREGoodNightTemplate_extraInvolvedTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BDD6BB0];
  v6[0] = *MEMORY[0x24BDD6C00];
  v6[1] = v1;
  v6[2] = *MEMORY[0x24BDD6C70];
  HRETelevisionProfileType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_block_invoke_2_na_once_object_377_0;
  _block_invoke_2_na_once_object_377_0 = v4;

}

- (id)_lazy_actionMap
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _QWORD v49[11];

  v49[9] = *MEMORY[0x24BDAC8D0];
  v42[0] = CFSTR("HREServiceTypeAll");
  v2 = *MEMORY[0x24BDD5770];
  v40[0] = *MEMORY[0x24BDD5970];
  v40[1] = v2;
  v41[0] = MEMORY[0x24BDBD1C0];
  v41[1] = &unk_24F221008;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v24;
  v42[1] = *MEMORY[0x24BDD6B98];
  v38 = *MEMORY[0x24BDD5A60];
  v3 = v38;
  v39 = &unk_24F221020;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v22;
  v42[2] = *MEMORY[0x24BDD6CA0];
  v36 = v3;
  v37 = &unk_24F221020;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v20;
  v43 = *MEMORY[0x24BDD6C30];
  v4 = v43;
  v34 = *MEMORY[0x24BDD5A70];
  v5 = v34;
  v35 = &unk_24F221008;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v18;
  v44 = *MEMORY[0x24BDD6BC0];
  v32 = *MEMORY[0x24BDD5A18];
  v33 = &unk_24F221038;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v16;
  v45 = *MEMORY[0x24BDD6CA8];
  v30 = v3;
  v31 = &unk_24F221020;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v7;
  v46 = *MEMORY[0x24BDD6C08];
  v28 = *MEMORY[0x24BDD5A50];
  v29 = &unk_24F221038;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v9;
  v47 = v4;
  v26 = v5;
  v27 = &unk_24F221050;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v11;
  HREMediaProfileContainerType();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v12;
  +[HREMediaPlaybackActionMap actionMapWithState:volume:playbackArchive:](HREMediaPlaybackActionMap, "actionMapWithState:volume:playbackArchive:", 2, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v42, 9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
