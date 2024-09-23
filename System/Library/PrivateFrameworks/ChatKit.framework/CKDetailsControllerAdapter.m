@implementation CKDetailsControllerAdapter

- (CKDetailsControllerAdapter)initWithConversation:(id)a3 delegate:(id)a4
{
  return -[CKDetailsControllerAdapter initWithConversation:delegate:customDetailsController:](self, "initWithConversation:delegate:customDetailsController:", a3, a4, 0);
}

- (CKDetailsControllerAdapter)initWithConversation:(id)a3
{
  return -[CKDetailsControllerAdapter initWithConversation:delegate:](self, "initWithConversation:delegate:", a3, 0);
}

- (CKDetailsControllerAdapter)initWithConversation:(id)a3 delegate:(id)a4 customDetailsController:(id)a5
{
  id v9;
  id v10;
  id v11;
  CKDetailsControllerAdapter *v12;
  CKDetailsControllerAdapter *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  CKDetailsController *v18;
  void *v19;
  uint64_t v20;
  CKDetailsController *legacyDetails;
  void *v22;
  CKBusinessDetailsController *v23;
  void *v24;
  uint64_t v25;
  CKBusinessDetailsController *businessDetails;
  uint64_t v27;
  UINavigationControllerDelegate *modernDetails;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CKDetailsControllerAdapter;
  v12 = -[CKDetailsControllerAdapter init](&v30, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conversation, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isBIAEnabled");
    if (v15)
      LOBYTE(v15) = objc_msgSend(v9, "isBusinessConversation");
    v13->_useBusinessDetails = v15;

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isModernDetailsViewEnabled");

    if (v17)
    {
      if (v11)
      {
        -[CKDetailsControllerAdapter setCustomDetails:](v13, "setCustomDetails:", v11);
        goto LABEL_13;
      }
      if (!-[CKDetailsControllerAdapter useBusinessDetails](v13, "useBusinessDetails"))
      {
        +[CKModernDetailsControllerFactory detailsControllerWithConversation:delegate:](CKModernDetailsControllerFactory, "detailsControllerWithConversation:delegate:", v9, v13);
        v27 = objc_claimAutoreleasedReturnValue();
        modernDetails = v13->_modernDetails;
        v13->_modernDetails = (UINavigationControllerDelegate *)v27;

        v22 = v13->_modernDetails;
        goto LABEL_12;
      }
    }
    else if (!-[CKDetailsControllerAdapter useBusinessDetails](v13, "useBusinessDetails"))
    {
      v18 = [CKDetailsController alloc];
      -[CKDetailsControllerAdapter conversation](v13, "conversation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[CKDetailsController initWithConversation:](v18, "initWithConversation:", v19);
      legacyDetails = v13->_legacyDetails;
      v13->_legacyDetails = (CKDetailsController *)v20;

      -[CKDetailsController setDetailsControllerDelegate:](v13->_legacyDetails, "setDetailsControllerDelegate:", v13);
      v22 = v13->_legacyDetails;
LABEL_12:
      objc_storeStrong((id *)&v13->_detailsController, v22);
      goto LABEL_13;
    }
    v23 = [CKBusinessDetailsController alloc];
    -[CKDetailsControllerAdapter conversation](v13, "conversation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[CKBusinessDetailsController initWithConversation:detailsControllerDelegate:](v23, "initWithConversation:detailsControllerDelegate:", v24, v13);
    businessDetails = v13->_businessDetails;
    v13->_businessDetails = (CKBusinessDetailsController *)v25;

    v22 = v13->_businessDetails;
    goto LABEL_12;
  }
LABEL_13:

  return v13;
}

- (void)stageDetailsFindMyCompositionWithShareType:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isWaldoEnabled");

  if (v6)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v7 = (void *)getMSMessageClass_softClass_1;
    v16 = getMSMessageClass_softClass_1;
    if (!getMSMessageClass_softClass_1)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getMSMessageClass_block_invoke_1;
      v12[3] = &unk_1E274A178;
      v12[4] = &v13;
      __getMSMessageClass_block_invoke_1((uint64_t)v12);
      v7 = (void *)v14[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v13, 8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "findMyLocationShareMessageWithDuration:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKComposition compositionWithMSMessage:appExtensionIdentifier:](CKComposition, "compositionWithMSMessage:appExtensionIdentifier:", v9, *MEMORY[0x1E0D37508]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKDetailsControllerAdapter delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "detailsAdapter:wantsToStageComposition:", self, v10);

    }
  }
}

- (void)detailsControllerWillDismiss:(id)a3
{
  id v4;

  -[CKDetailsControllerAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailsAdapterWillDismiss:", self);

}

- (void)detailsControllerDidDismiss:(id)a3
{
  id v4;

  -[CKDetailsControllerAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailsAdapterDidDismiss:", self);

}

- (void)dismissDetailsNavigationController
{
  id v2;

  -[CKDetailsControllerAdapter delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissDetailsNavigationController");

}

- (void)dismissDetailsViewAndShowConversationList
{
  id v2;

  -[CKDetailsControllerAdapter delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissDetailsViewAndShowConversationList");

}

- (BOOL)isDetailsNavigationControllerDetached
{
  void *v2;
  char v3;

  -[CKDetailsControllerAdapter delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDetailsNavigationControllerDetached");

  return v3;
}

- (id)detailsControllerBusinessPrivacyInfoPresentingViewController:(id)a3
{
  void *v4;
  void *v5;

  -[CKDetailsControllerAdapter delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailsAdapterBusinessPrivacyInfoPresentingViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)detailsControllerWantsToPresentReportToAppleUI:(id)a3
{
  id v4;

  -[CKDetailsControllerAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailsAdapterWantsToPresentReportToAppleUI:", self);

}

- (void)detailsControllerWantsToPresentKTContactVerificationUI:(id)a3
{
  id v4;

  -[CKDetailsControllerAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailsAdapterWantsToPresentKTContactVerificationUI:", self);

}

- (void)detailsController:(id)a3 wantsToStageComposition:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKDetailsControllerAdapter delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailsAdapter:wantsToStageComposition:", self, v5);

}

- (void)detailsControllerDidSelectStopSharingLocation:(id)a3
{
  id v4;

  -[CKDetailsControllerAdapter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailsAdapterDidSelectStopSharingLocation:", self);

}

- (void)detailsController:(id)a3 shouldComposeConversationWithRecipientAddresses:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CKDetailsControllerAdapter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKDetailsControllerAdapter delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailsAdapter:shouldComposeConversationWithRecipientAddresses:", self, v8);

  }
}

- (id)presentingViewControllerForGroupAlertsFromDetailsController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[CKDetailsControllerAdapter delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKDetailsControllerAdapter delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentingViewControllerForGroupAlertsFromDetailsAdapter:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (CKDetailsControllerAdapterDelegate)delegate
{
  return (CKDetailsControllerAdapterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (UINavigationControllerDelegate)detailsController
{
  return self->_detailsController;
}

- (CKDetailsController)legacyDetails
{
  return self->_legacyDetails;
}

- (void)setLegacyDetails:(id)a3
{
  objc_storeStrong((id *)&self->_legacyDetails, a3);
}

- (CKBusinessDetailsController)businessDetails
{
  return self->_businessDetails;
}

- (void)setBusinessDetails:(id)a3
{
  objc_storeStrong((id *)&self->_businessDetails, a3);
}

- (UINavigationControllerDelegate)modernDetails
{
  return self->_modernDetails;
}

- (void)setModernDetails:(id)a3
{
  objc_storeStrong((id *)&self->_modernDetails, a3);
}

- (BOOL)useBusinessDetails
{
  return self->_useBusinessDetails;
}

- (void)setUseBusinessDetails:(BOOL)a3
{
  self->_useBusinessDetails = a3;
}

- (UINavigationControllerDelegate)customDetails
{
  return (UINavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_customDetails);
}

- (void)setCustomDetails:(id)a3
{
  objc_storeWeak((id *)&self->_customDetails, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_customDetails);
  objc_storeStrong((id *)&self->_modernDetails, 0);
  objc_storeStrong((id *)&self->_businessDetails, 0);
  objc_storeStrong((id *)&self->_legacyDetails, 0);
  objc_storeStrong((id *)&self->_detailsController, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
