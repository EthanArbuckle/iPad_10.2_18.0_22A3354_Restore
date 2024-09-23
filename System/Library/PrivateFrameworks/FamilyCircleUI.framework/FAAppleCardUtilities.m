@implementation FAAppleCardUtilities

- (FAAppleCardUtilities)init
{
  FAAppleCardUtilities *v2;
  void *v3;
  objc_class *v4;
  PKAppleCardUtilities *v5;
  PKAppleCardUtilities *appleCardUtilities;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)FAAppleCardUtilities;
  v2 = -[FAAppleCardUtilities init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getPKAppleCardUtilitiesClass_softClass;
    v13 = getPKAppleCardUtilitiesClass_softClass;
    if (!getPKAppleCardUtilitiesClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getPKAppleCardUtilitiesClass_block_invoke;
      v9[3] = &unk_24C88B7B0;
      v9[4] = &v10;
      __getPKAppleCardUtilitiesClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (PKAppleCardUtilities *)objc_alloc_init(v4);
    appleCardUtilities = v2->_appleCardUtilities;
    v2->_appleCardUtilities = v5;

  }
  return v2;
}

- (void)appleCardAccessLevelForAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  -[FAAppleCardUtilities appleCardUtilities](self, "appleCardUtilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__FAAppleCardUtilities_appleCardAccessLevelForAltDSID_completion___block_invoke;
  v10[3] = &unk_24C88CE18;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "appleCardAccessLevelForAltDSID:completion:", v7, v10);

}

uint64_t __66__FAAppleCardUtilities_appleCardAccessLevelForAltDSID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "getAccessLevel:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)appleCardAccountStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FAAppleCardUtilities appleCardUtilities](self, "appleCardUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__FAAppleCardUtilities_appleCardAccountStateWithCompletion___block_invoke;
  v7[3] = &unk_24C88CE40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "appleCardAccountStateWithCompletion:", v7);

}

uint64_t __60__FAAppleCardUtilities_appleCardAccountStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "getAccountState:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)appleCardIsSharedWithWithAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FAAppleCardUtilities appleCardUtilities](self, "appleCardUtilities");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appleCardIsSharedWithWithAltDSID:completion:", v7, v6);

}

- (void)appleCardTransactionLimitForAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FAAppleCardUtilities appleCardUtilities](self, "appleCardUtilities");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appleCardTransactionLimitForAltDSID:completion:", v7, v6);

}

- (void)hasAppleCardWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FAAppleCardUtilities appleCardUtilities](self, "appleCardUtilities");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hasAppleCardWithCompletion:", v4);

}

- (void)hasSentPendingAppleCardInvitationToUserWithAltDSID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FAAppleCardUtilities appleCardUtilities](self, "appleCardUtilities");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hasSentPendingAppleCardInvitationToUserWithAltDSID:completion:", v7, v6);

}

- (void)presentAppleCardSharingDetailsForAltDSID:(id)a3 viewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SEL v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  _QWORD aBlock[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v25 = v8;
  v9 = a4;
  v24 = v9;
  v10 = a5;
  v11 = NSSelectorFromString(CFSTR("presentAppleCardSharingDetailsForAltDSID:viewController:hideUserDetailHeader:completion:"));
  -[FAAppleCardUtilities appleCardUtilities](self, "appleCardUtilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__FAAppleCardUtilities_presentAppleCardSharingDetailsForAltDSID_viewController_completion___block_invoke;
    aBlock[3] = &unk_24C88CE68;
    v22 = v10;
    v23 = _Block_copy(aBlock);
    v20 = 1;
    v14 = (void *)MEMORY[0x24BDBCE98];
    -[FAAppleCardUtilities appleCardUtilities](self, "appleCardUtilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "methodSignatureForSelector:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invocationWithMethodSignature:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setSelector:", v11);
    -[FAAppleCardUtilities appleCardUtilities](self, "appleCardUtilities");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTarget:", v18);

    objc_msgSend(v17, "setArgument:atIndex:", &v25, 2);
    objc_msgSend(v17, "setArgument:atIndex:", &v24, 3);
    objc_msgSend(v17, "setArgument:atIndex:", &v20, 4);
    objc_msgSend(v17, "setArgument:atIndex:", &v23, 5);
    objc_msgSend(v17, "invoke");

  }
  else
  {
    -[FAAppleCardUtilities appleCardUtilities](self, "appleCardUtilities");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "presentAppleCardSharingDetailsForAltDSID:viewController:completion:", v8, v9, v10);

  }
}

uint64_t __91__FAAppleCardUtilities_presentAppleCardSharingDetailsForAltDSID_viewController_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentAppleCardUserInvitationFlowWithViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FAAppleCardUtilities appleCardUtilities](self, "appleCardUtilities");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentAppleCardUserInvitationFlowWithViewController:completion:", v7, v6);

}

- (unint64_t)getAccessLevel:(unint64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (int64_t)getAccountState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4)
    return 0;
  else
    return a3;
}

- (PKAppleCardUtilities)appleCardUtilities
{
  return self->_appleCardUtilities;
}

- (void)setAppleCardUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_appleCardUtilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleCardUtilities, 0);
}

@end
