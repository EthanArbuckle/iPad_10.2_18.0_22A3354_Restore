@implementation AMSUIParentalVerificationCommon

+ (id)_promiseToPromptAfterFailureWithBag:(id)a3 viewController:(id)a4 metrics:(id)a5 pageID:(id)a6 flowName:(id)a7
{
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  AMSUIAlertDialogTask *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  __CFString *v41;
  id v42;
  id v43;
  id v44;
  id v45;

  v35 = a5;
  v11 = a6;
  v38 = a7;
  v12 = (void *)MEMORY[0x24BDD1488];
  v13 = a4;
  v14 = a3;
  objc_msgSend(v12, "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("PARENTAL_VERIFICATION_ID_CARD_FAILED_TITLE"), v14, v15);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("PARENTAL_VERIFICATION_ID_CARD_FAILED_MESSAGE"), v14, v16);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("PARENTAL_VERIFICATION_ID_CARD_FAILED_CONTINUE_BUTTON_TITLE"), v14, v17);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  AMSUILocalizedStringFromBundle(CFSTR("PARENTAL_VERIFICATION_ID_CARD_FAILED_CANCEL_BUTTON_TITLE"), v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc_init(MEMORY[0x24BE082B0]);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE08130]), "initWithTitle:message:", v37, v36);
  objc_msgSend(MEMORY[0x24BE08128], "actionWithTitle:identifier:", v19, CFSTR("cancelButtonID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addButtonAction:", v22);

  objc_msgSend(MEMORY[0x24BE08128], "actionWithTitle:identifier:", v34, CFSTR("continueButtonID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addButtonAction:", v23);

  v24 = -[AMSUIAlertDialogTask initWithRequest:presentingViewController:]([AMSUIAlertDialogTask alloc], "initWithRequest:presentingViewController:", v21, v13);
  objc_msgSend(v35, "enqueueEventWithPageId:displayReason:", v11, 0);
  -[AMSUIAlertDialogTask present](v24, "present");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __110__AMSUIParentalVerificationCommon__promiseToPromptAfterFailureWithBag_viewController_metrics_pageID_flowName___block_invoke;
  v39[3] = &unk_24CB50410;
  v40 = v21;
  v41 = CFSTR("cancelButtonID");
  v26 = v20;
  v42 = v26;
  v43 = v35;
  v44 = v11;
  v45 = v38;
  v27 = v38;
  v28 = v11;
  v29 = v35;
  v30 = v21;
  objc_msgSend(v25, "addFinishBlock:", v39);

  v31 = v45;
  v32 = v26;

  return v32;
}

void __110__AMSUIParentalVerificationCommon__promiseToPromptAfterFailureWithBag_viewController_metrics_pageID_flowName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "selectedActionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locateActionWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v7)
  {
    v8 = *(void **)(a1 + 48);
    v14 = CFSTR("really_cancelled");
    v15[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AMSCustomError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithError:", v10);

    objc_msgSend(*(id *)(a1 + 56), "enqueueEventWithTargetId:pageId:displayReason:", CFSTR("Cancel"), *(_QWORD *)(a1 + 64), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ failed for parental verification, moving on to next method"), *(_QWORD *)(a1 + 72));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 48);
    AMSError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishWithError:", v13);

    objc_msgSend(*(id *)(a1 + 56), "enqueueEventWithTargetId:pageId:displayReason:", CFSTR("Continue"), *(_QWORD *)(a1 + 64), 0);
  }

}

@end
