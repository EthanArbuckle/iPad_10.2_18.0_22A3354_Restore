@implementation CPAlertTemplate

+ (NSUInteger)maximumActionCount
{
  if (CPCurrentProcessHasAudioEntitlement())
    return 1;
  else
    return 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPAlertTemplate)initWithTitleVariants:(NSArray *)titleVariants actions:(NSArray *)actions
{
  NSArray *v8;
  NSArray *v9;
  CPAlertTemplate *v10;
  CPAlertTemplate *v11;
  _QWORD v13[4];
  CPAlertTemplate *v14;
  SEL v15;
  objc_super v16;

  v8 = titleVariants;
  v9 = actions;
  v16.receiver = self;
  v16.super_class = (Class)CPAlertTemplate;
  v10 = -[CPTemplate init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_titleVariants, titleVariants);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __49__CPAlertTemplate_initWithTitleVariants_actions___block_invoke;
    v13[3] = &unk_24C77D0A0;
    v15 = a2;
    v14 = v11;
    -[NSArray enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v13);

  }
  return v11;
}

void __49__CPAlertTemplate_initWithTitleVariants_actions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const char *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = *(const char **)(a1 + 40);
  v6 = v3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  if ((objc_msgSend(v7, "containsObject:", object_getClass(v11)) & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDBCE88];
    v9 = *MEMORY[0x24BDBCAB8];
    NSStringFromSelector(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v11, v10, v7, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "_addAction:", v11);

}

- (CPAlertTemplate)initWithCoder:(id)a3
{
  id v4;
  CPAlertTemplate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *titleVariants;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *actions;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CPAlertTemplate;
  v5 = -[CPTemplate initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kCPAlertTemplateTitlesKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    titleVariants = v5->_titleVariants;
    v5->_titleVariants = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kCPAlertTemplateActionsKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPAlertTemplate;
  v4 = a3;
  -[CPTemplate encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CPAlertTemplate titleVariants](self, "titleVariants", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPAlertTemplateTitlesKey"));

  -[CPAlertTemplate actions](self, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPAlertTemplateActionsKey"));

}

- (void)_addAction:(id)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *actions;
  NSArray *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  id v18;

  v18 = a3;
  -[CPAlertTemplate actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CPAlertTemplate actions](self, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v18);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    actions = self->_actions;
    self->_actions = v6;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v18);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_actions;
    self->_actions = v8;
  }

  v9 = objc_msgSend((id)objc_opt_class(), "maximumActionCount");
  -[CPAlertTemplate actions](self, "actions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 > v9)
  {
    -[CPAlertTemplate actions](self, "actions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD15E0];
    -[CPAlertTemplate actions](self, "actions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexSetWithIndexesInRange:", objc_msgSend(v14, "count") - v9, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectsAtIndexes:", v15);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = self->_actions;
    self->_actions = v16;

  }
}

- (void)handleAlertActionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD block[5];
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  -[CPAlertTemplate actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__CPAlertTemplate_handleAlertActionForIdentifier___block_invoke;
  v10[3] = &unk_24C77C4A8;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  objc_msgSend((id)v14[5], "handler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __50__CPAlertTemplate_handleAlertActionForIdentifier___block_invoke_2;
    block[3] = &unk_24C77C4D0;
    block[4] = &v13;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

  _Block_object_dispose(&v13, 8);
}

void __50__CPAlertTemplate_handleAlertActionForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __50__CPAlertTemplate_handleAlertActionForIdentifier___block_invoke_2(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "handler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

- (NSArray)titleVariants
{
  return self->_titleVariants;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_titleVariants, 0);
}

@end
