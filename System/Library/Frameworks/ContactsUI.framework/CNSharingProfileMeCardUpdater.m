@implementation CNSharingProfileMeCardUpdater

- (CNSharingProfileMeCardUpdater)initWithMeContact:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  CNSharingProfileMeCardUpdater *v9;
  CNSharingProfileMeCardUpdater *v10;
  CNSharingProfileMeCardUpdater *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNSharingProfileMeCardUpdater;
  v9 = -[CNSharingProfileMeCardUpdater init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a4);
    objc_storeStrong((id *)&v10->_meContact, a3);
    v11 = v10;
  }

  return v10;
}

- (id)alertControllerForMeCardUpdateWithImageContact:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;

  v5 = a3;
  objc_storeStrong((id *)&self->_imageContact, a3);
  v6 = (void *)MEMORY[0x1E0DC3450];
  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_MESSAGE"), &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_CONFIRM"), &stru_1E20507A8, CFSTR("Localized"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __80__CNSharingProfileMeCardUpdater_alertControllerForMeCardUpdateWithImageContact___block_invoke;
  v24[3] = &unk_1E204FFA8;
  v24[4] = self;
  v25 = v5;
  v16 = v5;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v17);

  v18 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SHARING_UPDATE_ME_CARD_PROMPT_CANCEL"), &stru_1E20507A8, CFSTR("Localized"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __80__CNSharingProfileMeCardUpdater_alertControllerForMeCardUpdateWithImageContact___block_invoke_2;
  v23[3] = &unk_1E204F7F0;
  v23[4] = self;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v21);

  return v11;
}

- (void)updateMeContactWithImageContact:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_imageContact, a3);
  -[CNSharingProfileMeCardUpdater performSave](self, "performSave");
  -[CNSharingProfileMeCardUpdater delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "meCardUpdaterDidSetPhotoToMeCard:", self);

}

- (void)performSave
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc(MEMORY[0x1E0C97240]);
  -[CNSharingProfileMeCardUpdater meContact](self, "meContact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharingProfileMeCardUpdater contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "initWithContact:contactStore:", v4, v5);

  -[CNSharingProfileMeCardUpdater imageContact](self, "imageContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateImageWithImageContact:setAsMe:", v6, 1);

}

- (CNSharingProfileMeCardUpdaterDelegate)delegate
{
  return (CNSharingProfileMeCardUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNMutableContact)meContact
{
  return self->_meContact;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNContact)imageContact
{
  return self->_imageContact;
}

- (void)setImageContact:(id)a3
{
  objc_storeStrong((id *)&self->_imageContact, a3);
}

- (CNSharingProfileLogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_imageContact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __80__CNSharingProfileMeCardUpdater_alertControllerForMeCardUpdateWithImageContact___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateMeContactWithImageContact:", *(_QWORD *)(a1 + 40));
}

void __80__CNSharingProfileMeCardUpdater_alertControllerForMeCardUpdateWithImageContact___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "meCardUpdaterDidDeclineSetPhotoToMeCard:", *(_QWORD *)(a1 + 32));

}

@end
