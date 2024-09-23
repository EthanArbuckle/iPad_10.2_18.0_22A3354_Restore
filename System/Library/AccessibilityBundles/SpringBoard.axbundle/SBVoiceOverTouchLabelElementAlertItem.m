@implementation SBVoiceOverTouchLabelElementAlertItem

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)shouldShowInEmergencyCall
{
  return 0;
}

- (BOOL)willShowInAwayItems
{
  return 0;
}

- (BOOL)allowMenuButtonDismissal
{
  return 1;
}

- (BOOL)reappearsAfterLock
{
  return 0;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("VOLabelElement"));
  accessibilityLocalizedString(CFSTR("element.label.title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  v7 = (void *)MEMORY[0x24BDF67E8];
  accessibilityLocalizedString(CFSTR("VoiceOver.confirmation.Cancel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __77__SBVoiceOverTouchLabelElementAlertItem_configure_requirePasscodeForActions___block_invoke;
  v18[3] = &unk_2503684C0;
  v18[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v10);

  v11 = (void *)MEMORY[0x24BDF67E8];
  accessibilityLocalizedString(CFSTR("element.label.save"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __77__SBVoiceOverTouchLabelElementAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v16[3] = &unk_2503684E8;
  v16[4] = self;
  v17 = v5;
  v13 = v5;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v14);

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __77__SBVoiceOverTouchLabelElementAlertItem_configure_requirePasscodeForActions___block_invoke_3;
  v15[3] = &unk_250368510;
  v15[4] = self;
  objc_msgSend(v13, "addTextFieldWithConfigurationHandler:", v15);

}

void __77__SBVoiceOverTouchLabelElementAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v3, "voiceOverTouchLabelElementAlertItemDidCancel:", *(_QWORD *)(a1 + 32));

  }
}

void __77__SBVoiceOverTouchLabelElementAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));

  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 40), "textFields");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "voiceOverTouchLabelElementAlertItemDidAccept:withTextField:", *(_QWORD *)(a1 + 32), v5);

  }
}

void __77__SBVoiceOverTouchLabelElementAlertItem_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "initialValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v4);

  objc_msgSend(v6, "setDelegate:", *(_QWORD *)(a1 + 32));
  accessibilityLocalizedString(CFSTR("element.label.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceholder:", v5);

  objc_msgSend(v6, "setClearButtonMode:", 1);
  objc_msgSend(v6, "setReturnKeyType:", 9);

}

- (NSString)initialValue
{
  return self->_initialValue;
}

- (void)setInitialValue:(id)a3
{
  objc_storeStrong((id *)&self->_initialValue, a3);
}

- (SBVoiceOverTouchLabelElementAlertItemDelegate)voiceOverAlertItemDelegate
{
  return (SBVoiceOverTouchLabelElementAlertItemDelegate *)objc_loadWeakRetained((id *)&self->_voiceOverAlertItemDelegate);
}

- (void)setVoiceOverAlertItemDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_voiceOverAlertItemDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_voiceOverAlertItemDelegate);
  objc_storeStrong((id *)&self->_initialValue, 0);
}

@end
