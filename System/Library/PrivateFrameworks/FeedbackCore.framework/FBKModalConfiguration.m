@implementation FBKModalConfiguration

+ (id)fetchRequest
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBB678];
  objc_msgSend(a1, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
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
  id v23;

  v23 = a3;
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("type_enum"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
    if ((unint64_t)(v6 - 1) >= 3)
      v7 = 0;
    else
      v7 = v6;
    -[FBKModalConfiguration setTypeEnum:](self, "setTypeEnum:", v7);
  }
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("sort_order"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[FBKModalConfiguration setSortOrder:](self, "setSortOrder:", objc_msgSend(v9, "unsignedIntegerValue"));
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("icon_name"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[FBKModalConfiguration setIconName:](self, "setIconName:", v11);
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[FBKModalConfiguration setTitle:](self, "setTitle:", v13);
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    -[FBKModalConfiguration setSubtitle:](self, "setSubtitle:", v15);
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("body"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    -[FBKModalConfiguration setBody:](self, "setBody:", v17);
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("choice_set"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("choice_options"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v21, "ded_mapWithBlock:", &__block_literal_global_23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKModalConfiguration setChoices:](self, "setChoices:", v22);

    }
  }

}

id __53__FBKModalConfiguration_setPropertiesFromJSONObject___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[FBKQuestionChoice choiceFromArray:](FBKQuestionChoice, "choiceFromArray:", a2);
}

+ (id)entityName
{
  return CFSTR("ModalConfiguration");
}

@end
