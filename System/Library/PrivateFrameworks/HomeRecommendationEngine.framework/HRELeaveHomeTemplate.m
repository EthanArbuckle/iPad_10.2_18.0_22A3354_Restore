@implementation HRELeaveHomeTemplate

- (HRELeaveHomeTemplate)init
{
  HRELeaveHomeTemplate *v2;
  HRELeaveHomeTemplate *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HRELeaveHomeTemplate;
  v2 = -[HREActionSetTemplate init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HREActionSetTemplate setActionSetType:](v2, "setActionSetType:", *MEMORY[0x24BDD5200]);
    v4 = objc_alloc(MEMORY[0x24BE4D0B8]);
    v5 = (void *)objc_msgSend(v4, "initWithImageIdentifier:", *MEMORY[0x24BE4CEA8]);
    -[HREActionSetTemplate setIconDescriptor:](v3, "setIconDescriptor:", v5);

    __28__HRELeaveHomeTemplate_init__block_invoke();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplate setIdentifier:](v3, "setIdentifier:", v6);

    -[HRETemplate setSortingPriority:](v3, "setSortingPriority:", 4.0);
    -[HRETemplate setStarterRank:](v3, "setStarterRank:", 0.2 * 6.0 + 1.0);
  }
  return v3;
}

id __28__HRELeaveHomeTemplate_init__block_invoke()
{
  if (_block_invoke_na_once_token_376 != -1)
    dispatch_once(&_block_invoke_na_once_token_376, &__block_literal_global_2);
  return (id)_block_invoke_na_once_object_376;
}

void __28__HRELeaveHomeTemplate_init__block_invoke_2()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_376;
  _block_invoke_na_once_object_376 = (uint64_t)CFSTR("leaveHome");

}

id __42__HRELeaveHomeTemplate_extraInvolvedTypes__block_invoke()
{
  if (_block_invoke_2_na_once_token_377 != -1)
    dispatch_once(&_block_invoke_2_na_once_token_377, &__block_literal_global_5);
  return (id)_block_invoke_2_na_once_object_377;
}

void __42__HRELeaveHomeTemplate_extraInvolvedTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[9];

  v8[8] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BDD6BA8];
  v8[0] = *MEMORY[0x24BDD6C00];
  v8[1] = v1;
  v2 = *MEMORY[0x24BDD6BB0];
  v8[2] = *MEMORY[0x24BDD6C90];
  v8[3] = v2;
  v3 = *MEMORY[0x24BDD6BD0];
  v8[4] = *MEMORY[0x24BDD6C70];
  v8[5] = v3;
  v8[6] = *MEMORY[0x24BDD6B40];
  HRETelevisionProfileType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[7] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_block_invoke_2_na_once_object_377;
  _block_invoke_2_na_once_object_377 = v6;

}

- (id)_lazy_actionMap
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[8];
  _QWORD v37[10];

  v37[8] = *MEMORY[0x24BDAC8D0];
  v36[0] = CFSTR("HREServiceTypeAll");
  v2 = *MEMORY[0x24BDD5770];
  v34[0] = *MEMORY[0x24BDD5970];
  v34[1] = v2;
  v35[0] = MEMORY[0x24BDBD1C0];
  v35[1] = &unk_24F220FC0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v20;
  v36[1] = *MEMORY[0x24BDD6B98];
  v32 = *MEMORY[0x24BDD5A60];
  v3 = v32;
  v33 = &unk_24F220FD8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v18;
  v36[2] = *MEMORY[0x24BDD6CA8];
  v30 = v3;
  v31 = &unk_24F220FD8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v16;
  v36[3] = *MEMORY[0x24BDD6BC8];
  v28 = *MEMORY[0x24BDD5A28];
  v29 = &unk_24F220FC0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v14;
  v36[4] = *MEMORY[0x24BDD6BC0];
  v26 = *MEMORY[0x24BDD5A18];
  v27 = &unk_24F220FF0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v5;
  v36[5] = *MEMORY[0x24BDD6C08];
  v24 = *MEMORY[0x24BDD5A50];
  v25 = &unk_24F220FF0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v7;
  v36[6] = *MEMORY[0x24BDD6C30];
  v22 = *MEMORY[0x24BDD5A70];
  v23 = &unk_24F220FF0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v9;
  HREMediaProfileContainerType();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v10;
  +[HREMediaPlaybackActionMap actionMapWithState:volume:playbackArchive:](HREMediaPlaybackActionMap, "actionMapWithState:volume:playbackArchive:", 2, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
