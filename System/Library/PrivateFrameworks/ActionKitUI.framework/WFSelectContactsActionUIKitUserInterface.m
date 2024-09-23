@implementation WFSelectContactsActionUIKitUserInterface

- (void)showWithProperties:(id)a3 selectMultiple:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD block[5];
  id v14;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSelectContactsActionUIKitUserInterface.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[WFSelectContactsActionUIKitUserInterface setContactProperties:](self, "setContactProperties:", v9);
  -[WFSelectContactsActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v10);
  -[WFSelectContactsActionUIKitUserInterface setSelectMultiple:](self, "setSelectMultiple:", v6);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__WFSelectContactsActionUIKitUserInterface_showWithProperties_selectMultiple_completionHandler___block_invoke;
  block[3] = &unk_24E3439C0;
  block[4] = self;
  v14 = v9;
  v11 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFSelectContactsActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __84__WFSelectContactsActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFSelectContactsActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)finishWithContacts:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFSelectContactsActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFSelectContactsActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFSelectContactsActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (BOOL)respondsToSelector:(SEL)a3
{
  BOOL v5;
  _BOOL4 v6;
  objc_super v8;

  v5 = sel_contactPicker_didSelectContacts_ == a3 || sel_contactPicker_didSelectContactProperties_ == a3;
  if (!v5 || (v6 = -[WFSelectContactsActionUIKitUserInterface selectMultiple](self, "selectMultiple")))
  {
    v8.receiver = self;
    v8.super_class = (Class)WFSelectContactsActionUIKitUserInterface;
    LOBYTE(v6) = -[WFSelectContactsActionUIKitUserInterface respondsToSelector:](&v8, sel_respondsToSelector_, a3);
  }
  return v6;
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFSelectContactsActionUIKitUserInterface finishWithContacts:error:](self, "finishWithContacts:error:", 0, v4);

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  WFSelectContactsActionUIKitUserInterface *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE193D0], "contactWithCNContact:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[WFSelectContactsActionUIKitUserInterface contactProperties](self, "contactProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v17 = self;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v23 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        WFContactPropertyIDsFromActionProperties();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "intValue");

        if (objc_msgSend(v5, "hasValueForPropertyID:", v14))
        {
          objc_msgSend(v5, "contactWithPropertyID:multivalueIndex:", v14, 0);
          v15 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v15;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v8)
        continue;
      break;
    }
LABEL_11:
    self = v17;
  }

  v22 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSelectContactsActionUIKitUserInterface finishWithContacts:error:](self, "finishWithContacts:error:", v16, 0);

}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  WFContactFromCNContactProperty();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSelectContactsActionUIKitUserInterface finishWithContacts:error:](self, "finishWithContacts:error:", v6, 0);

}

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  id v5;

  objc_msgSend(a4, "if_map:", &__block_literal_global_5430);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFSelectContactsActionUIKitUserInterface finishWithContacts:error:](self, "finishWithContacts:error:", v5, 0);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[WFSelectContactsActionUIKitUserInterface finishWithContacts:error:](self, "finishWithContacts:error:", 0, 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)selectMultiple
{
  return self->_selectMultiple;
}

- (void)setSelectMultiple:(BOOL)a3
{
  self->_selectMultiple = a3;
}

- (NSArray)contactProperties
{
  return self->_contactProperties;
}

- (void)setContactProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactProperties, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __76__WFSelectContactsActionUIKitUserInterface_contactPicker_didSelectContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BE193D0], "contactWithCNContact:", a2);
}

uint64_t __84__WFSelectContactsActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithContacts:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __96__WFSelectContactsActionUIKitUserInterface_showWithProperties_selectMultiple_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v2 = (void *)getCNContactPickerViewControllerClass_softClass;
  v16 = getCNContactPickerViewControllerClass_softClass;
  if (!getCNContactPickerViewControllerClass_softClass)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __getCNContactPickerViewControllerClass_block_invoke;
    v12[3] = &unk_24E343A50;
    v12[4] = &v13;
    __getCNContactPickerViewControllerClass_block_invoke((uint64_t)v12);
    v2 = (void *)v14[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v13, 8);
  v4 = objc_alloc_init(v3);
  objc_msgSend(v4, "setModalPresentationStyle:", 2);
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  WFCNPropertyKeysFromActionProperties();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayedPropertyKeys:", v5);

  objc_msgSend(v4, "displayedPropertyKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WFPredicateForEnablingPerson();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicateForEnablingContact:", v7);

  objc_msgSend(v4, "displayedPropertyKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WFPredicateForSelectionOfPerson();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicateForSelectionOfContact:", v9);

  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "presentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", v10);

  objc_msgSend(*(id *)(a1 + 32), "presentContent:", v4);
}

@end
