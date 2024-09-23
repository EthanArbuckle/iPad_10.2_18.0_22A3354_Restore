@implementation CPActionSheetTemplate

- (CPActionSheetTemplate)initWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray *)actions
{
  NSString *v9;
  NSString *v10;
  NSArray *v11;
  CPActionSheetTemplate *v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  NSString *v16;
  NSArray *v17;
  NSArray *v18;
  _QWORD v20[5];
  objc_super v21;

  v9 = title;
  v10 = message;
  v11 = actions;
  v21.receiver = self;
  v21.super_class = (Class)CPActionSheetTemplate;
  v12 = -[CPTemplate init](&v21, sel_init);
  if (v12)
  {
    v13 = -[NSString copy](v9, "copy");
    v14 = v12->_title;
    v12->_title = (NSString *)v13;

    v15 = -[NSString copy](v10, "copy");
    v16 = v12->_message;
    v12->_message = (NSString *)v15;

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __55__CPActionSheetTemplate_initWithTitle_message_actions___block_invoke;
    v20[3] = &__block_descriptor_40_e30_v32__0__CPAlertAction_8Q16_B24l;
    v20[4] = a2;
    -[NSArray enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v20);
    if (-[NSArray count](v11, "count") > 3)
    {
      -[NSArray subarrayWithRange:](v11, "subarrayWithRange:", 0, 3);
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = v11;
    }
    v18 = v12->_actions;
    v12->_actions = v17;

  }
  return v12;
}

void __55__CPActionSheetTemplate_initWithTitle_message_actions___block_invoke(uint64_t a1, void *a2)
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
  v5 = *(const char **)(a1 + 32);
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
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPActionSheetTemplate)initWithCoder:(id)a3
{
  id v4;
  CPActionSheetTemplate *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *message;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *actions;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPActionSheetTemplate;
  v5 = -[CPTemplate initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPActionSheetTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPActionSheetMessage"));
    v8 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("CPActionSheetActions"));
    v13 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPActionSheetTemplate;
  v4 = a3;
  -[CPTemplate encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[CPActionSheetTemplate title](self, "title", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CPActionSheetTitle"));

  -[CPActionSheetTemplate message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CPActionSheetMessage"));

  -[CPActionSheetTemplate actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("CPActionSheetActions"));

}

- (void)handleAlertActionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  -[CPActionSheetTemplate actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__CPActionSheetTemplate_handleAlertActionForIdentifier___block_invoke;
  v14[3] = &unk_24C77C4A8;
  v7 = v4;
  v15 = v7;
  v16 = &v17;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);

  objc_msgSend((id)v18[5], "handler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __56__CPActionSheetTemplate_handleAlertActionForIdentifier___block_invoke_2;
    block[3] = &unk_24C77C4D0;
    block[4] = &v17;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  -[CPTemplate templateDelegate](self, "templateDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CPTemplate templateDelegate](self, "templateDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPTemplate identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "templateDidDismissWithIdentifier:", v12);

  }
  _Block_object_dispose(&v17, 8);

}

void __56__CPActionSheetTemplate_handleAlertActionForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

void __56__CPActionSheetTemplate_handleAlertActionForIdentifier___block_invoke_2(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "handler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

- (id)leadingNavigationBarButtons
{
  -[CPActionSheetTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setLeadingNavigationBarButtons:(id)a3
{
  -[CPActionSheetTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)trailingNavigationBarButtons
{
  -[CPActionSheetTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setTrailingNavigationBarButtons:(id)a3
{
  -[CPActionSheetTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSArray)actions
{
  return self->_actions;
}

- (CPAlertDelegate)alertDelegate
{
  return self->_alertDelegate;
}

- (void)setAlertDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_alertDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertDelegate, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
