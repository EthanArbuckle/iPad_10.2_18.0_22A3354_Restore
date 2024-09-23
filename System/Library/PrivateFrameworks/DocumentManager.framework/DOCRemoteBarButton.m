@implementation DOCRemoteBarButton

- (DOCRemoteBarButton)initWithBarButton:(id)a3
{
  id v5;
  DOCRemoteBarButton *v6;
  uint64_t v7;
  NSUUID *uuid;
  NSObject **v9;
  NSObject *v10;
  NSUUID *v11;
  NSObject *v12;
  void *v13;
  DOCRemoteBarButton *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DOCRemoteBarButton;
  v6 = -[DOCRemoteBarButton init](&v16, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v7;

    objc_storeStrong((id *)&v6->_barButton, a3);
    v9 = (NSObject **)MEMORY[0x24BE2DF90];
    v10 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = v6->_uuid;
      v12 = v10;
      -[NSUUID UUIDString](v11, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_209052000, v12, OS_LOG_TYPE_INFO, "initWithBarButton: uuid: %@", buf, 0xCu);

    }
    v14 = v6;
  }

  return v6;
}

- (void)performPrimaryAction
{
  id v2;

  -[DOCRemoteBarButton barButton](self, "barButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_doc_ipi_triggerActionForEvent:", 0);

}

- (void)performOverflowAction
{
  void *v3;
  id v4;

  -[DOCRemoteBarButton barButton](self, "barButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "menuRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[DOCRemoteBarButton performOverflowAction_forCommand:](self, "performOverflowAction_forCommand:", v3);
  }
  else if (objc_msgSend(v3, "conformsToProtocol:", &unk_2545BD7A8))
  {
    -[DOCRemoteBarButton performOverflowAction_menuLeaf:](self, "performOverflowAction_menuLeaf:", v3);
  }

}

- (void)performOverflowAction_forCommand:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DOCRemoteBarButton barButton](self, "barButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "action");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "performSelector:withObject:", objc_msgSend(v6, "action"), v4);

}

- (void)performOverflowAction_menuLeaf:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DOCRemoteBarButton barButton](self, "barButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performWithSender:target:", v5, 0);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCRemoteBarButton)initWithCoder:(id)a3
{
  id v4;
  DOCRemoteUIBarButtonItem *v5;
  void *v6;
  NSObject **v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  DOCRemoteBarButton *v24;
  DOCRemoteBarButton *v25;
  void *v26;
  DOCRemoteBarButton *v27;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [DOCRemoteUIBarButtonItem alloc];
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (NSObject **)MEMORY[0x24BE2DF90];
  v8 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(v6, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v10;
    _os_log_impl(&dword_209052000, v9, OS_LOG_TYPE_INFO, "initWithCoder: bar button with uuid: %@", buf, 0xCu);

  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("landscapeImagePhone"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSystemItem")))
  {
    v15 = -[DOCRemoteUIBarButtonItem initWithBarButtonSystemItem:target:action:](v5, "initWithBarButtonSystemItem:target:action:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("systemItem")), 0, 0);
  }
  else if (v11)
  {
    v15 = -[DOCRemoteUIBarButtonItem initWithTitle:style:target:action:](v5, "initWithTitle:style:target:action:", v11, v12, 0, 0);
  }
  else if (v13 && v14)
  {
    v15 = -[DOCRemoteUIBarButtonItem initWithImage:landscapeImagePhone:style:target:action:](v5, "initWithImage:landscapeImagePhone:style:target:action:", v13, v14, v12, 0, 0);
  }
  else
  {
    if (!v13)
      goto LABEL_15;
    v15 = -[DOCRemoteUIBarButtonItem initWithImage:style:target:action:](v5, "initWithImage:style:target:action:", v13, v12, 0, 0);
  }
  v5 = (DOCRemoteUIBarButtonItem *)v15;
LABEL_15:
  -[DOCRemoteUIBarButtonItem setEnabled:](v5, "setEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled")));
  v16 = (void *)MEMORY[0x24BDBCF20];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("possibleTitles"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCRemoteUIBarButtonItem setPossibleTitles:](v5, "setPossibleTitles:", v19);

  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("width"));
  -[DOCRemoteUIBarButtonItem setWidth:](v5, "setWidth:", v20);
  objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("imageInsets"));
  -[DOCRemoteUIBarButtonItem setImageInsets:](v5, "setImageInsets:");
  objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("landscapeImagePhoneInsets"));
  -[DOCRemoteUIBarButtonItem setLandscapeImagePhoneInsets:](v5, "setLandscapeImagePhoneInsets:");
  -[DOCRemoteUIBarButtonItem setUuid:](v5, "setUuid:", v6);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCRemoteUIBarButtonItem setAccessibilityLabel:](v5, "setAccessibilityLabel:", v21);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityHint"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCRemoteUIBarButtonItem setAccessibilityHint:](v5, "setAccessibilityHint:", v22);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("menuRepresentation"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCRemoteUIBarButtonItem setMenuRepresentation:](v5, "setMenuRepresentation:", v23);

  v24 = -[DOCRemoteBarButton initWithBarButton:](self, "initWithBarButton:", v5);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_uuid, v6);
    +[DOCRemoteUIBarButtonItemRegistry shared](DOCRemoteUIBarButtonItemRegistry, "shared");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "registerInstance:", v5);

    v27 = v25;
  }

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject **v14;
  NSObject *v15;
  NSUUID *uuid;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[DOCRemoteBarButton barButton](self, "barButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v5, "isSystemItem"), CFSTR("isSystemItem"));
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v5, "systemItem"), CFSTR("systemItem"));
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("image"));

  objc_msgSend(v5, "landscapeImagePhone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("landscapeImagePhone"));

  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v5, "style"), CFSTR("style"));
  objc_msgSend(v5, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("title"));

  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v5, "isEnabled"), CFSTR("enabled"));
  objc_msgSend(v5, "possibleTitles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("possibleTitles"));

  objc_msgSend(v5, "width");
  *(float *)&v10 = v10;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("width"), v10);
  objc_msgSend(v5, "imageInsets");
  objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("imageInsets"));
  objc_msgSend(v5, "landscapeImagePhoneInsets");
  objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("landscapeImagePhoneInsets"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v5, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("accessibilityLabel"));

  objc_msgSend(v5, "accessibilityHint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("accessibilityHint"));

  objc_msgSend(v5, "menuRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("menuRepresentation"));

  v14 = (NSObject **)MEMORY[0x24BE2DF90];
  v15 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v15 = *v14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uuid = self->_uuid;
    v17 = v15;
    -[NSUUID UUIDString](uuid, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v18;
    _os_log_impl(&dword_209052000, v17, OS_LOG_TYPE_INFO, "encodeWithCoder: bar button with uuid: %@", (uint8_t *)&v19, 0xCu);

  }
}

- (UIBarButtonItem)barButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_barButton, 0);
}

- (id)remoteUIBarButtonItemDisplayedInNavigationBar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[DOCRemoteUIBarButtonItemRegistry shared](DOCRemoteUIBarButtonItemRegistry, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCRemoteBarButton uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "barButtonItemPresentedInNavigationBar:uuid:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
