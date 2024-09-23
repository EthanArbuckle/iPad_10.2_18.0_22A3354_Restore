@implementation UIKeyCommand(DOCEExtension)

- (id)_doc_erasedKeyCommandWithWrappedAction:()DOCEExtension
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15 = CFSTR("com.apple.DocumentManager.keyCommands.originalKeyCommandAction");
  NSStringFromSelector((SEL)objc_msgSend(a1, "action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD6B8];
  objc_msgSend(a1, "discoverabilityTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "input");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "modifierFlags");
  objc_msgSend(a1, "alternates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commandWithTitle:image:action:input:modifierFlags:propertyList:alternates:", v8, 0, a3, v9, v10, v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "discoverabilityTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDiscoverabilityTitle:", v13);

  objc_msgSend(v12, "setAttributes:", objc_msgSend(a1, "attributes"));
  return v12;
}

- (BOOL)doc_isCancellingKeyCommand
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v7[5];

  +[DOCKeyCommandController cancellingKeyCommandsWithAction:](DOCKeyCommandController, "cancellingKeyCommandsWithAction:", sel_description);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__UIKeyCommand_DOCEExtension__doc_isCancellingKeyCommand__block_invoke;
  v7[3] = &unk_24C0F1970;
  v7[4] = a1;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count") != 0;
  return v5;
}

- (BOOL)doc_isDismissingKeyCommand
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v7[5];

  +[DOCKeyCommandController dismissingKeyCommandsWithAction:](DOCKeyCommandController, "dismissingKeyCommandsWithAction:", sel_description);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__UIKeyCommand_DOCEExtension__doc_isDismissingKeyCommand__block_invoke;
  v7[3] = &unk_24C0F1970;
  v7[4] = a1;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count") != 0;
  return v5;
}

- (BOOL)doc_isShortcutEqualToKeyCommand:()DOCEExtension
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;

  v4 = a3;
  objc_msgSend(a1, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = objc_msgSend(a1, "modifierFlags");
    v8 = v7 == objc_msgSend(v4, "modifierFlags");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
