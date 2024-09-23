@implementation WFAlert

- (WFAlertButton)escapeButton
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[WFAlert buttons](self, "buttons", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "style") == 1)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  -[WFAlert buttons](self, "buttons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v10 = v9;

  return (WFAlertButton *)v10;
}

- (WFAlert)init
{
  WFAlert *v2;
  uint64_t v3;
  NSMutableArray *mutableButtons;
  uint64_t v5;
  NSMutableArray *mutableTextFieldConfigurationHandlers;
  WFAlert *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFAlert;
  v2 = -[WFAlert init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mutableButtons = v2->_mutableButtons;
    v2->_mutableButtons = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    mutableTextFieldConfigurationHandlers = v2->_mutableTextFieldConfigurationHandlers;
    v2->_mutableTextFieldConfigurationHandlers = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)addButton:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFAlert buttons](self, "buttons");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAlert setButtons:](self, "setButtons:", v5);
}

- (void)setButtons:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "setAlert:", self);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v9 = (void *)objc_msgSend(v4, "mutableCopy");
  -[WFAlert setMutableButtons:](self, "setMutableButtons:", v9);

  -[WFAlert presenter](self, "presenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAlert buttons](self, "buttons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setButtons:forAlert:", v11, self);

}

- (NSArray)buttons
{
  void *v2;
  void *v3;

  -[WFAlert mutableButtons](self, "mutableButtons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addTextFieldWithConfigurationHandler:(id)a3
{
  id v4;
  const void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFAlert mutableTextFieldConfigurationHandlers](self, "mutableTextFieldConfigurationHandlers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4;
  else
    v5 = &__block_literal_global_12885;
  v6 = _Block_copy(v5);

  objc_msgSend(v7, "addObject:", v6);
}

- (void)dismissWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[WFAlert presenter](self, "presenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFAlert presenter](self, "presenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissAlert:completionHandler:", self, v6);

  }
  else
  {
    v6[2]();
  }

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)setPreferredStyle:(int64_t)a3
{
  self->_preferredStyle = a3;
}

- (WFImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (WFTextFieldConfiguration)textFieldConfiguration
{
  return self->_textFieldConfiguration;
}

- (void)setTextFieldConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_textFieldConfiguration, a3);
}

- (WFDatePickerConfiguration)datePickerConfiguration
{
  return self->_datePickerConfiguration;
}

- (void)setDatePickerConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_datePickerConfiguration, a3);
}

- (NSArray)textFieldResults
{
  return self->_textFieldResults;
}

- (void)setTextFieldResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)datePickerResult
{
  return self->_datePickerResult;
}

- (void)setDatePickerResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)associatedParameterKey
{
  return self->_associatedParameterKey;
}

- (void)setAssociatedParameterKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (WFAlertPresenter)presenter
{
  return (WFAlertPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (NSMutableArray)mutableButtons
{
  return self->_mutableButtons;
}

- (void)setMutableButtons:(id)a3
{
  objc_storeStrong((id *)&self->_mutableButtons, a3);
}

- (NSMutableArray)mutableTextFieldConfigurationHandlers
{
  return self->_mutableTextFieldConfigurationHandlers;
}

- (void)setMutableTextFieldConfigurationHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_mutableTextFieldConfigurationHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableTextFieldConfigurationHandlers, 0);
  objc_storeStrong((id *)&self->_mutableButtons, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_associatedParameterKey, 0);
  objc_storeStrong((id *)&self->_datePickerResult, 0);
  objc_storeStrong((id *)&self->_textFieldResults, 0);
  objc_storeStrong((id *)&self->_datePickerConfiguration, 0);
  objc_storeStrong((id *)&self->_textFieldConfiguration, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (WFAlert)alertWithPreferredStyle:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPreferredStyle:", a3);
  return (WFAlert *)v4;
}

- (NSError)associatedError
{
  return (NSError *)objc_getAssociatedObject(self, sel_associatedError);
}

+ (WFAlert)alertWithError:(id)a3
{
  return (WFAlert *)objc_msgSend(a1, "alertWithError:confirmationHandler:", a3, 0);
}

+ (WFAlert)alertWithError:(id)a3 confirmationHandler:(id)a4
{
  id v6;
  id v7;
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
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "alertWithPreferredStyle:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v8, sel_associatedError, v6, (void *)1);
  objc_msgSend(v6, "localizedFailureReason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v9);

  objc_msgSend(v6, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMessage:", v10);

  objc_msgSend(v6, "localizedRecoveryOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {

    goto LABEL_7;
  }
  objc_msgSend(v6, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WFRecoveryAttempter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v6, "recoveryAttempter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_6;
LABEL_7:
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = __54__WFAlert_Errors__alertWithError_confirmationHandler___block_invoke_4;
    v30 = &unk_24C4E3540;
    v31 = v7;
    +[WFAlertButton okButtonWithHandler:](WFAlertButton, "okButtonWithHandler:", &v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addButton:", v25, v27, v28, v29, v30);

    goto LABEL_8;
  }

LABEL_6:
  objc_msgSend(v6, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("WFDestructiveRecoveryOptionIndex"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("WFPreferredRecoveryOptionIndex"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("WFRecoveryAttempter"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedRecoveryOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __54__WFAlert_Errors__alertWithError_confirmationHandler___block_invoke;
  v32[3] = &unk_24C4E3518;
  v33 = v16;
  v34 = v18;
  v35 = v8;
  v36 = v20;
  v37 = v6;
  v22 = v20;
  v23 = v18;
  v24 = v16;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v32);

LABEL_8:
  return (WFAlert *)v8;
}

void __54__WFAlert_Errors__alertWithError_confirmationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a2;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToNumber:", v8))
    v9 = 2;
  else
    v9 = 0;

  v10 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToNumber:", v11);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__WFAlert_Errors__alertWithError_confirmationHandler___block_invoke_2;
  v15[3] = &unk_24C4E34F0;
  v13 = *(void **)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 64);
  v18 = a3;
  +[WFAlertButton buttonWithTitle:style:preferred:handler:](WFAlertButton, "buttonWithTitle:style:preferred:handler:", v7, v9, v12, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addButton:", v14);
}

uint64_t __54__WFAlert_Errors__alertWithError_confirmationHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __54__WFAlert_Errors__alertWithError_confirmationHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "attemptRecoveryFromError:optionIndex:userInterface:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, &__block_literal_global_23312);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "recoveryAttempter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attemptRecoveryFromError:optionIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

@end
