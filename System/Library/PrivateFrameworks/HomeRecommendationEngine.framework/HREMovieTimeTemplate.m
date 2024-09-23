@implementation HREMovieTimeTemplate

- (HREMovieTimeTemplate)init
{
  HREMovieTimeTemplate *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)HREMovieTimeTemplate;
  v2 = -[HREActionSetTemplate init](&v16, sel_init);
  if (v2)
  {
    HRELocalizedString(CFSTR("HRETemplateTitleMovieTime"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREActionSetTemplate setActionSetName:](v2, "setActionSetName:", v3);

    v4 = objc_alloc(MEMORY[0x24BE4D0B8]);
    v5 = (void *)objc_msgSend(v4, "initWithImageIdentifier:", *MEMORY[0x24BE4CEB0]);
    -[HREActionSetTemplate setIconDescriptor:](v2, "setIconDescriptor:", v5);

    -[HRETemplate setSplitStrategy:](v2, "setSplitStrategy:", 1);
    v6 = (void *)MEMORY[0x24BDBCF20];
    HRETelevisionProfileType();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDD6C70];
    v17[0] = v7;
    v17[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HRERecommendableObjectTypeListRule ruleRequiringOneOfTypes:](HRERecommendableObjectTypeListRule, "ruleRequiringOneOfTypes:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplate setRules:](v2, "setRules:", v13);

    __28__HREMovieTimeTemplate_init__block_invoke();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplate setIdentifier:](v2, "setIdentifier:", v14);

    -[HRETemplate setSortingPriority:](v2, "setSortingPriority:", 3.0);
    -[HRETemplate setStarterRank:](v2, "setStarterRank:", 0.2 * 6.0 + -1.0);
  }
  return v2;
}

id __28__HREMovieTimeTemplate_init__block_invoke()
{
  if (_block_invoke_na_once_token_376_4 != -1)
    dispatch_once(&_block_invoke_na_once_token_376_4, &__block_literal_global_6);
  return (id)_block_invoke_na_once_object_376_4;
}

void __28__HREMovieTimeTemplate_init__block_invoke_2()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_376_4;
  _block_invoke_na_once_object_376_4 = (uint64_t)CFSTR("movieTime");

}

- (id)_lazy_actionMap
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD v26[2];
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[4];
  _QWORD v32[6];

  v32[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14C0], "notPredicateWithSubpredicate:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  HREMediaProfileContainerType();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v21;
  +[HREMediaPlaybackActionMap actionMapWithState:volume:playbackArchive:](HREMediaPlaybackActionMap, "actionMapWithState:volume:playbackArchive:", 2, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v20;
  v31[1] = *MEMORY[0x24BDD6C00];
  v28 = *MEMORY[0x24BDD5970];
  v2 = v28;
  v29 = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap conditonalCharacteristicActionMap:condition:](HRECharacteristicActionMap, "conditonalCharacteristicActionMap:condition:", v18, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v17;
  v3 = *MEMORY[0x24BDD57A0];
  v26[0] = v2;
  v26[1] = v3;
  v27[0] = MEMORY[0x24BDBD1C8];
  v27[1] = &unk_24F2210B0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap conditonalCharacteristicActionMap:condition:](HRECharacteristicActionMap, "conditonalCharacteristicActionMap:condition:", v15, v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HREActionMap actionMapWithChildMaps:](HRECharacteristicActionMap, "actionMapWithChildMaps:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v6;
  v31[2] = *MEMORY[0x24BDD6C70];
  v24 = *MEMORY[0x24BDD5770];
  v7 = v24;
  v25 = &unk_24F2210C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v9;
  HRETelevisionProfileType();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v10;
  v22 = v7;
  v23 = &unk_24F2210C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __39__HREMovieTimeTemplate__lazy_actionMap__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_255A56278))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "hre_characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_83);
  return v6;
}

uint64_t __39__HREMovieTimeTemplate__lazy_actionMap__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "characteristicType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD57A0]);

  return v3;
}

- (id)_lazy_allowedVariance
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  +[HREActionRangeVarianceRule rangeVarianceWithType:min:](HREActionRangeVarianceRule, "rangeVarianceWithType:min:", *MEMORY[0x24BDD57A0], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HREActionVarianceCollection varianceRuleCollectionWithRules:](HREActionVarianceCollection, "varianceRuleCollectionWithRules:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
