@implementation MFContactCardInteractions

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MFContactCardInteractions_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1)
    dispatch_once(&log_onceToken_3, block);
  return (id)log_log_3;
}

void __32__MFContactCardInteractions_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;

}

+ (id)contactCardInteractionWithViewController:(id)a3 blockedSenderManager:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithViewController:blockedSenderManager:", v6, v7);

  return v8;
}

- (MFContactCardInteractions)initWithViewController:(id)a3 blockedSenderManager:(id)a4
{
  id v6;
  id v7;
  MFContactCardInteractions *v8;
  MFContactCardInteractions *v9;
  uint64_t v10;
  EFScheduler *workerScheduler;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFContactCardInteractions;
  v8 = -[MFContactCardInteractions init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_contactViewController, v6);
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.MFContactCardInteractions.workerScheduler"), 17);
    v10 = objc_claimAutoreleasedReturnValue();
    workerScheduler = v9->_workerScheduler;
    v9->_workerScheduler = (EFScheduler *)v10;

    objc_storeStrong((id *)&v9->_blockedSenderManager, a4);
  }

  return v9;
}

- (id)contact
{
  void *v2;
  void *v3;

  -[MFContactCardInteractions contactViewController](self, "contactViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)configureInteractionsWithInteractionDelegate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[MFContactCardInteractions contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFContactCardInteractions setDelegate:](self, "setDelegate:", v19);
  objc_msgSend(v4, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_map:", &__block_literal_global_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D1E458]);
    -[MFContactCardInteractions setEmailAddressSet:](self, "setEmailAddressSet:", v7);

    -[MFContactCardInteractions emailAddressSet](self, "emailAddressSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v6);

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFContactCardInteractions setDisplayName:](self, "setDisplayName:", v10);

    -[MFContactCardInteractions displayName](self, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[MFContactCardInteractions displayName](self, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v12);

    }
    -[MFContactCardInteractions contactViewController](self, "contactViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VIPManager defaultInstance](VIPManager, "defaultInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFContactCardInteractions emailAddressSet](self, "emailAddressSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "vipForEmailAddresses:andDisplayNames:", v15, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFContactCardInteractions setCurrentVIP:](self, "setCurrentVIP:", v16);

    -[MFContactCardInteractions blockedSenderManager](self, "blockedSenderManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contact");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFContactCardInteractions setIsBlocked:](self, "setIsBlocked:", objc_msgSend(v17, "isContactBlocked:", v18));

    -[MFContactCardInteractions _updateContactCardButtonsForViewController:](self, "_updateContactCardButtonsForViewController:", v13);
  }

}

id __74__MFContactCardInteractions_configureInteractionsWithInteractionDelegate___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "value");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateContactCardButtonsForViewController:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[MFContactCardInteractions _updateVIPContactCardButtonForViewController:](self, "_updateVIPContactCardButtonForViewController:");
  -[MFContactCardInteractions _updateBlockContactCardButtonForViewController:](self, "_updateBlockContactCardButtonForViewController:", v6);
  -[MFContactCardInteractions delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canSearchForContactFromContactCardInteractions:", self);

  if (v5)
    -[MFContactCardInteractions _updateSearchContactCardButtonForViewController:](self, "_updateSearchContactCardButtonForViewController:", v6);

}

- (void)_updateSearchContactCardButtonForViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "contentViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SEARCH_MAIL_FOR_CONTACT_ADDRESSES"), &stru_1E9A04480, CFSTR("Main"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cardBottomGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addActionWithTitle:target:selector:inGroup:destructive:", v5, self, sel__startSearch_, v6, 0);

}

- (void)_startSearch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  -[MFContactCardInteractions displayName](self, "displayName", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v11 = v4;
  }
  else
  {
    -[MFContactCardInteractions emailAddressSet](self, "emailAddressSet");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v7;
  }

  -[MFContactCardInteractions delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFContactCardInteractions emailAddressSet](self, "emailAddressSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactCardInteractions:triggerSearchForDisplayName:emailAddresses:", self, v11, v10);

}

- (void)_removeVIP:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  +[VIPManager defaultInstance](VIPManager, "defaultInstance", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[MFContactCardInteractions currentVIP](self, "currentVIP");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteVIPWithIdentifier:", v5);

  -[MFContactCardInteractions setCurrentVIP:](self, "setCurrentVIP:", 0);
  -[MFContactCardInteractions contactViewController](self, "contactViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MFContactCardInteractions _updateContactCardButtonsForViewController:](self, "_updateContactCardButtonsForViewController:");

}

- (void)_addVIP:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = objc_alloc(MEMORY[0x1E0D1E3B8]);
  -[MFContactCardInteractions displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFContactCardInteractions emailAddressSet](self, "emailAddressSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "initWithIdentifier:name:emailAddresses:", 0, v5, v6);

  -[MFContactCardInteractions setCurrentVIP:](self, "setCurrentVIP:", v10);
  +[VIPManager defaultInstance](VIPManager, "defaultInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFContactCardInteractions currentVIP](self, "currentVIP");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "saveVIP:", v8);

  -[MFContactCardInteractions contactViewController](self, "contactViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFContactCardInteractions _updateContactCardButtonsForViewController:](self, "_updateContactCardButtonsForViewController:", v9);

}

- (void)_updateVIPContactCardButtonForViewController:(id)a3
{
  void *v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a3, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardBottomGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sel__removeVIP_;
  objc_msgSend(v4, "removeActionWithTarget:selector:inGroup:", self, sel__removeVIP_, v5);

  objc_msgSend(v4, "cardBottomGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeActionWithTarget:selector:inGroup:", self, sel__addVIP_, v7);

  if (-[MFContactCardInteractions isBlocked](self, "isBlocked")
    && (-[MFContactCardInteractions currentVIP](self, "currentVIP"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v13 = 0;
  }
  else
  {
    -[MFContactCardInteractions currentVIP](self, "currentVIP");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REMOVE_VIP"), &stru_1E9A04480, CFSTR("Main"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ADD_VIP"), &stru_1E9A04480, CFSTR("Main"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v6 = sel__addVIP_;
    }

    objc_msgSend(v4, "cardBottomGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addActionWithTitle:target:selector:inGroup:destructive:", v13, self, v6, v11, 0);

    -[MFContactCardInteractions currentVIP](self, "currentVIP");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v12 != 0) != objc_msgSend(v4, "isMailVIP"))
      objc_msgSend(v4, "setIsMailVIP:", v12 != 0);
  }

}

- (void)_blockContact:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BLOCK_CONTACT_CONFIRMATION"), &stru_1E9A04480, CFSTR("Main"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setModalPresentationStyle:", 7);
  v8 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BLOCK_CONTACT"), &stru_1E9A04480, CFSTR("Main"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __43__MFContactCardInteractions__blockContact___block_invoke;
  v17[3] = &unk_1E9A03288;
  v17[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  v12 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E9A04480, CFSTR("Main"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v15);
  -[MFContactCardInteractions contactViewController](self, "contactViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentViewController:animated:completion:", v7, 1, 0);

}

void __43__MFContactCardInteractions__blockContact___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "contactViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __43__MFContactCardInteractions__blockContact___block_invoke_2;
  v9 = &unk_1E9A02DD8;
  v10 = v3;
  v5 = v2;
  v11 = v5;
  objc_msgSend(v4, "performBlock:", &v6);
  objc_msgSend(*(id *)(a1 + 32), "setIsBlocked:", 1, v6, v7, v8, v9, v10);
  objc_msgSend(*(id *)(a1 + 32), "_updateContactCardButtonsForViewController:", v5);

}

void __43__MFContactCardInteractions__blockContact___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "blockedSenderManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "blockContact:", v2);

}

- (void)_unblockContact:(id)a3
{
  void *v4;
  EFScheduler *workerScheduler;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  MFContactCardInteractions *v11;
  id v12;

  -[MFContactCardInteractions contactViewController](self, "contactViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  workerScheduler = self->_workerScheduler;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __45__MFContactCardInteractions__unblockContact___block_invoke;
  v10 = &unk_1E9A02DD8;
  v11 = self;
  v6 = v4;
  v12 = v6;
  -[EFScheduler performBlock:](workerScheduler, "performBlock:", &v7);
  -[MFContactCardInteractions setIsBlocked:](self, "setIsBlocked:", 0, v7, v8, v9, v10, v11);
  -[MFContactCardInteractions _updateContactCardButtonsForViewController:](self, "_updateContactCardButtonsForViewController:", v6);

}

void __45__MFContactCardInteractions__unblockContact___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "blockedSenderManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unblockContact:", v2);

}

- (void)_updateBlockContactCardButtonForViewController:(id)a3
{
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  objc_msgSend(a3, "contentViewController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cardBottomGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = sel__unblockContact_;
  objc_msgSend(v14, "removeActionWithTarget:selector:inGroup:", self, sel__unblockContact_, v4);

  objc_msgSend(v14, "cardBottomGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeActionWithTarget:selector:inGroup:", self, sel__blockContact_, v6);

  -[MFContactCardInteractions currentVIP](self, "currentVIP");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (v8 = -[MFContactCardInteractions isBlocked](self, "isBlocked"), v7, v8))
  {
    if (-[MFContactCardInteractions isBlocked](self, "isBlocked"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UNBLOCK_CONTACT"), &stru_1E9A04480, CFSTR("Main"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      objc_msgSend(v14, "cardBottomGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addActionWithTitle:target:selector:inGroup:destructive:", v10, self, v5, v13, 0);

      goto LABEL_8;
    }
    -[MFContactCardInteractions blockedSenderManager](self, "blockedSenderManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isBlockedSenderEnabled");

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BLOCK_CONTACT"), &stru_1E9A04480, CFSTR("Main"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = sel__blockContact_;
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (CNContactViewController)contactViewController
{
  return (CNContactViewController *)objc_loadWeakRetained((id *)&self->_contactViewController);
}

- (void)setContactViewController:(id)a3
{
  objc_storeWeak((id *)&self->_contactViewController, a3);
}

- (MFContactCardInteractionDelegate)delegate
{
  return (MFContactCardInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (EAEmailAddressSet)emailAddressSet
{
  return self->_emailAddressSet;
}

- (void)setEmailAddressSet:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddressSet, a3);
}

- (EMVIP)currentVIP
{
  return self->_currentVIP;
}

- (void)setCurrentVIP:(id)a3
{
  objc_storeStrong((id *)&self->_currentVIP, a3);
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  self->_isBlocked = a3;
}

- (EFScheduler)workerScheduler
{
  return self->_workerScheduler;
}

- (EMBlockedSenderManager)blockedSenderManager
{
  return self->_blockedSenderManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockedSenderManager, 0);
  objc_storeStrong((id *)&self->_workerScheduler, 0);
  objc_storeStrong((id *)&self->_currentVIP, 0);
  objc_storeStrong((id *)&self->_emailAddressSet, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_contactViewController);
}

@end
