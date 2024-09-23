@implementation CNContactAddAddressingGrammarAction

+ (id)os_log
{
  if (os_log_cn_once_token_1_1843 != -1)
    dispatch_once(&os_log_cn_once_token_1_1843, &__block_literal_global_1844);
  return (id)os_log_cn_once_object_1_1845;
}

void __45__CNContactAddAddressingGrammarAction_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNContactAddAddressingGrammarAction");
  v1 = (void *)os_log_cn_once_object_1_1845;
  os_log_cn_once_object_1_1845 = (uint64_t)v0;

}

- (void)performActionWithSender:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  -[CNContactAddAddressingGrammarAction setSelectedAddressingGrammar:](self, "setSelectedAddressingGrammar:", 0);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v5 = (void *)getIPPronounPickerViewControllerClass_softClass;
  v13 = getIPPronounPickerViewControllerClass_softClass;
  if (!getIPPronounPickerViewControllerClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getIPPronounPickerViewControllerClass_block_invoke;
    v9[3] = &unk_1E204EBC0;
    v9[4] = &v10;
    __getIPPronounPickerViewControllerClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v6, "pronounPickerViewControllerWithDelegate:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "action:presentViewController:sender:", self, v7, v4);

}

- (void)pronounPickerViewController:(id)a3 didFinishWithTermOfAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  if (objc_msgSend(v10, "isUnspecified"))
    v7 = 0;
  else
    v7 = v10;
  -[CNContactAddAddressingGrammarAction setSelectedAddressingGrammar:](self, "setSelectedAddressingGrammar:", v7);
  -[CNContactAction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionDidFinish:", self);

  -[CNContactAction delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "action:dismissViewController:sender:", self, v6, self);

}

- (void)pronounPickerViewControllerDidCancel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNContactAddAddressingGrammarAction setSelectedAddressingGrammar:](self, "setSelectedAddressingGrammar:", 0);
  -[CNContactAction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWasCanceled:", self);

  -[CNContactAction delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "action:dismissViewController:sender:", self, v4, self);

}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 labeledValue:(id)a6
{
  return 0;
}

- (NSTermOfAddress)selectedAddressingGrammar
{
  return self->_selectedAddressingGrammar;
}

- (void)setSelectedAddressingGrammar:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAddressingGrammar, a3);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_selectedAddressingGrammar, 0);
}

@end
