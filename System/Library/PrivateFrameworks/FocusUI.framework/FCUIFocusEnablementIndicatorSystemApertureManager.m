@implementation FCUIFocusEnablementIndicatorSystemApertureManager

+ (id)managerWithSystemApertureElementRegistrar:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithSystemApertureElementRegistrar:", v3);

  return v4;
}

- (id)_initWithSystemApertureElementRegistrar:(id)a3
{
  id v5;
  FCUIFocusEnablementIndicatorSystemApertureManager *v6;
  FCUIFocusEnablementIndicatorSystemApertureManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCUIFocusEnablementIndicatorSystemApertureManager;
  v6 = -[FCUIFocusEnablementIndicatorManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_elementRegistrar, a3);

  return v7;
}

- (BOOL)shouldKeepPresentingAfterActiveActivityDidChange:(id)a3 lastActivity:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  void *v10;
  int v11;
  BOOL v12;
  id v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_registeredPersistentElementAssertion);
  if ((objc_msgSend(WeakRetained, "isValid") & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_lastPresentedPersistentElement);

    if (v9)
    {
      if (!v6
        || (objc_msgSend(v9, "activityDescription"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v6, "isEqual:", v10),
            v10,
            v11))
      {
        objc_msgSend(v9, "setActivityEnabled:", v6 != 0);
        v12 = 1;
        goto LABEL_15;
      }
    }
  }
  else
  {

    v9 = 0;
  }
  if (-[SAInvalidatable isValid](self->_registeredElementAssertion, "isValid"))
  {
    v13 = objc_loadWeakRetained((id *)&self->_lastPresentedElement);
    if (v13 && (!v6 || objc_msgSend(v6, "isEqual:", v7)))
    {
      objc_msgSend(v13, "setActivityEnabled:", v6 != 0);
      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }

LABEL_15:
  return v12;
}

- (void)revokeWithReason:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SAInvalidatable isValid](self->_registeredElementAssertion, "isValid"))
    -[SAInvalidatable invalidateWithReason:](self->_registeredElementAssertion, "invalidateWithReason:", v4);

}

- (void)postActivity:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  FCUIFocusEnablementIndicatorSystemApertureElement *v7;
  SAInvalidatable *v8;
  SAInvalidatable *registeredElementAssertion;
  SAInvalidatable *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a4;
  v6 = a3;
  v7 = -[FCUIFocusEnablementIndicatorSystemApertureElement initWithActivityDescription:enabled:]([FCUIFocusEnablementIndicatorSystemApertureElement alloc], "initWithActivityDescription:enabled:", v6, v4);
  -[SAElementRegistering registerElement:](self->_elementRegistrar, "registerElement:", v7);
  v8 = (SAInvalidatable *)objc_claimAutoreleasedReturnValue();
  registeredElementAssertion = self->_registeredElementAssertion;
  self->_registeredElementAssertion = v8;

  objc_initWeak(&location, self);
  v10 = self->_registeredElementAssertion;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__FCUIFocusEnablementIndicatorSystemApertureManager_postActivity_enabled___block_invoke;
  v11[3] = &unk_24D20AD60;
  objc_copyWeak(&v12, &location);
  -[SAInvalidatable addInvalidationBlock:](v10, "addInvalidationBlock:", v11);
  objc_storeWeak((id *)&self->_lastPresentedElement, v7);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __74__FCUIFocusEnablementIndicatorSystemApertureManager_postActivity_enabled___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && WeakRetained[6] == v5)
  {
    WeakRetained[6] = 0;

    objc_storeWeak(v4 + 7, 0);
  }

}

- (id)postPersistentActivity:(id)a3 enabled:(BOOL)a4 systemApertureElementProvider:(id)a5 pickerPresentation:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v8;
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  void *v14;
  int v15;
  id v16;
  FCUIFocusEnablementIndicatorSystemApertureActivityElement *v17;
  FCUIFocusEnablementIndicatorSystemApertureActivityElement *v18;
  _QWORD v20[4];
  id v21;
  id location;

  v6 = a6;
  v8 = a4;
  v10 = a3;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_registeredPersistentElementAssertion);
  if (!objc_msgSend(WeakRetained, "isValid"))
  {
LABEL_5:
    if (v11)
    {
      if (v6)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v18 = 0;
          goto LABEL_15;
        }
        objc_msgSend(v11, "createPersistentFocusPickerElementForActivityDescription:enabled:", v10, v8);
        v17 = (FCUIFocusEnablementIndicatorSystemApertureActivityElement *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v11, "createPersistentFocusElementForActivityDescription:enabled:", v10, v8);
        v17 = (FCUIFocusEnablementIndicatorSystemApertureActivityElement *)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (v6)
    {
      v18 = 0;
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_15:
        objc_storeWeak((id *)&self->_lastPresentedPersistentElement, v18);
        -[SAElementRegistering registerElement:](self->_elementRegistrar, "registerElement:", v18);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_storeWeak((id *)&self->_registeredPersistentElementAssertion, v16);
        objc_initWeak(&location, self);
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __133__FCUIFocusEnablementIndicatorSystemApertureManager_postPersistentActivity_enabled_systemApertureElementProvider_pickerPresentation___block_invoke;
        v20[3] = &unk_24D20AD60;
        objc_copyWeak(&v21, &location);
        objc_msgSend(v16, "addInvalidationBlock:", v20);
        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);

        goto LABEL_16;
      }
      v17 = -[FCUIFocusEnablementIndicatorSystemApertureElement initForPickerWithActivityDescription:enabled:]([FCUIFocusEnablementIndicatorSystemApertureActivityElement alloc], "initForPickerWithActivityDescription:enabled:", v10, v8);
    }
    else
    {
      v17 = -[FCUIFocusEnablementIndicatorSystemApertureElement initWithActivityDescription:enabled:]([FCUIFocusEnablementIndicatorSystemApertureActivityElement alloc], "initWithActivityDescription:enabled:", v10, v8);
    }
    v18 = v17;
    goto LABEL_15;
  }
  v13 = objc_loadWeakRetained((id *)&self->_lastPresentedPersistentElement);
  objc_msgSend(v13, "activityDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", v10);

  if (!v15)
  {
    objc_msgSend(WeakRetained, "invalidateWithReason:", CFSTR("Activity changed"));
    goto LABEL_5;
  }
  v16 = WeakRetained;
LABEL_16:

  return v16;
}

void __133__FCUIFocusEnablementIndicatorSystemApertureManager_postPersistentActivity_enabled_systemApertureElementProvider_pickerPresentation___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 8);

    if (v5 == v6)
    {
      objc_storeWeak(v4 + 8, 0);
      objc_storeWeak(v4 + 9, 0);
    }
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastPresentedPersistentElement);
  objc_destroyWeak((id *)&self->_registeredPersistentElementAssertion);
  objc_destroyWeak((id *)&self->_lastPresentedElement);
  objc_storeStrong((id *)&self->_registeredElementAssertion, 0);
  objc_destroyWeak((id *)&self->_elementProvider);
  objc_storeStrong((id *)&self->_elementRegistrar, 0);
}

@end
