@implementation HREAutoLeaveHomeTemplate

- (HREAutoLeaveHomeTemplate)init
{
  HREAutoLeaveHomeTemplate *v2;
  HREAutoLeaveHomeTemplate *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[8];

  v16[7] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)HREAutoLeaveHomeTemplate;
  v2 = -[HRETemplate init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HREPresenceTriggerTemplate setPresenceType:](v2, "setPresenceType:", 4);
    -[HREPresenceTriggerTemplate setPresenceUserType:](v3, "setPresenceUserType:", 2);
    __32__HREAutoLeaveHomeTemplate_init__block_invoke();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplate setIdentifier:](v3, "setIdentifier:", v4);

    -[HRETemplate setSortingPriority:](v3, "setSortingPriority:", 0.2);
    -[HRETemplate setStarterRank:](v3, "setStarterRank:", 0.2 * 4.0 + 1.0);
    v5 = objc_alloc(MEMORY[0x24BE4D0B8]);
    v6 = (void *)objc_msgSend(v5, "initWithImageIdentifier:", *MEMORY[0x24BE4CEA8]);
    -[HRETriggerTemplate setDefaultIconDescriptor:](v3, "setDefaultIconDescriptor:", v6);

    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = *MEMORY[0x24BDD6BA8];
    v16[0] = *MEMORY[0x24BDD6C00];
    v16[1] = v8;
    v9 = *MEMORY[0x24BDD6C70];
    v16[2] = *MEMORY[0x24BDD6C90];
    v16[3] = v9;
    HRETelevisionProfileType();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BDD6BD0];
    v16[4] = v10;
    v16[5] = v11;
    v16[6] = *MEMORY[0x24BDD6B40];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREActionTemplate setExtraInvolvedTypes:](v3, "setExtraInvolvedTypes:", v13);

  }
  return v3;
}

id __32__HREAutoLeaveHomeTemplate_init__block_invoke()
{
  if (_block_invoke_na_once_token_376_3 != -1)
    dispatch_once(&_block_invoke_na_once_token_376_3, &__block_literal_global_2_2);
  return (id)_block_invoke_na_once_object_376_3;
}

void __32__HREAutoLeaveHomeTemplate_init__block_invoke_2()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_376_3;
  _block_invoke_na_once_object_376_3 = (uint64_t)CFSTR("autoLeaveHome");

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
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[7];
  _QWORD v33[9];

  v33[7] = *MEMORY[0x24BDAC8D0];
  v32[0] = CFSTR("HREServiceTypeAll");
  v2 = *MEMORY[0x24BDD5770];
  v30[0] = *MEMORY[0x24BDD5970];
  v30[1] = v2;
  v31[0] = MEMORY[0x24BDBD1C0];
  v31[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v18;
  v32[1] = *MEMORY[0x24BDD6B98];
  v28 = *MEMORY[0x24BDD5A60];
  v3 = v28;
  v29 = &unk_24F221068;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v16;
  v32[2] = *MEMORY[0x24BDD6CA8];
  v26 = v3;
  v27 = &unk_24F221068;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v14;
  v32[3] = *MEMORY[0x24BDD6BC8];
  v24 = *MEMORY[0x24BDD5A28];
  v25 = &unk_24F221080;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v5;
  v32[4] = *MEMORY[0x24BDD6BC0];
  v22 = *MEMORY[0x24BDD5A18];
  v23 = &unk_24F221098;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v7;
  v32[5] = *MEMORY[0x24BDD6C30];
  v20 = *MEMORY[0x24BDD5A70];
  v21 = &unk_24F221098;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v9;
  HREMediaProfileContainerType();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v10;
  +[HREMediaPlaybackActionMap actionMapWithState:volume:playbackArchive:](HREMediaPlaybackActionMap, "actionMapWithState:volume:playbackArchive:", 2, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
