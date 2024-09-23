@implementation HREActionSetTemplate

- (HREActionSetTemplate)init
{
  HREActionSetTemplate *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HREActionSetTemplate;
  v2 = -[HRETemplate init](&v5, sel_init);
  if (v2)
  {
    __28__HREActionSetTemplate_init__block_invoke();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREActionSetTemplate setActionSetName:](v2, "setActionSetName:", v3);

    -[HREActionSetTemplate setActionSetType:](v2, "setActionSetType:", 0);
    -[HREActionSetTemplate setIconDescriptor:](v2, "setIconDescriptor:", 0);
  }
  return v2;
}

id __28__HREActionSetTemplate_init__block_invoke()
{
  if (_block_invoke_na_once_token_376_2 != -1)
    dispatch_once(&_block_invoke_na_once_token_376_2, &__block_literal_global_2_1);
  return (id)_block_invoke_na_once_object_376_2;
}

void __28__HREActionSetTemplate_init__block_invoke_2()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_376_2;
  _block_invoke_na_once_object_376_2 = (uint64_t)&stru_24F219000;

}

- (Class)recommendationClass
{
  return (Class)objc_opt_class();
}

- (id)createStarterRecommendationInHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HREActionSetTemplate;
  -[HREActionTemplate createStarterRecommendationInHome:](&v15, sel_createStarterRecommendationInHome_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4D020]), "initWithHome:", v4);
    objc_msgSend(v8, "mutableActionSetBuilders");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v9);

    -[HREActionSetTemplate actionSetName](self, "actionSetName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", v11);

    -[HREActionSetTemplate iconDescriptor](self, "iconDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v9, "setIconDescriptor:", v12);
    }
    else
    {
      objc_msgSend(v9, "iconDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIconDescriptor:", v13);

    }
  }

  return v6;
}

- (NSString)actionSetName
{
  return self->_actionSetName;
}

- (void)setActionSetName:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetName, a3);
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (void)setActionSetType:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetType, a3);
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_iconDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->_actionSetType, 0);
  objc_storeStrong((id *)&self->_actionSetName, 0);
}

@end
