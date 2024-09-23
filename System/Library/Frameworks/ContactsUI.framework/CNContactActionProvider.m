@implementation CNContactActionProvider

- (CNContactAction)stopSharingWithFamilyAction
{
  return self->_stopSharingWithFamilyAction;
}

- (CNContactAction)shareWithFamilyAction
{
  CNContactAction *v3;

  if (objc_msgSend(MEMORY[0x1E0C97200], "downtimeWhitelistUIEnabled"))
    v3 = self->_shareWithFamilyAction;
  else
    v3 = 0;
  return v3;
}

- (void)buildCommunicationLimitsActions
{
  CNContactShareWithFamilyAction *v3;
  void *v4;
  CNContactAction *v5;
  CNContactAction *shareWithFamilyAction;
  void *v7;
  CNContactStopSharingWithFamily *v8;
  void *v9;
  CNContactAction *v10;
  CNContactAction *stopSharingWithFamilyAction;
  void *v12;
  CNContactEnableGuardianRestrictionsAction *v13;
  void *v14;
  void *v15;
  void *v16;
  CNContactAction *v17;
  CNContactAction *enableGuardianRestrictionsAction;
  CNContactDisableGuardianRestrictionsAction *v19;
  void *v20;
  void *v21;
  CNContactAction *v22;
  CNContactAction *disableGuardianRestrictionsAction;
  id v24;

  v3 = [CNContactShareWithFamilyAction alloc];
  -[CNContactActionProvider contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);
  shareWithFamilyAction = self->_shareWithFamilyAction;
  self->_shareWithFamilyAction = v5;

  -[CNContactActionProvider actionDelegate](self, "actionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction setDelegate:](self->_shareWithFamilyAction, "setDelegate:", v7);

  v8 = [CNContactStopSharingWithFamily alloc];
  -[CNContactActionProvider contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNContactAction initWithContact:](v8, "initWithContact:", v9);
  stopSharingWithFamilyAction = self->_stopSharingWithFamilyAction;
  self->_stopSharingWithFamilyAction = v10;

  -[CNContactActionProvider actionDelegate](self, "actionDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction setDelegate:](self->_stopSharingWithFamilyAction, "setDelegate:", v12);

  v13 = [CNContactEnableGuardianRestrictionsAction alloc];
  -[CNContactActionProvider contact](self, "contact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactActionProvider container](self, "container");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactActionProvider contactStore](self, "contactStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CNContactEnableGuardianRestrictionsAction initWithContact:inContainer:contactStore:](v13, "initWithContact:inContainer:contactStore:", v14, v15, v16);
  enableGuardianRestrictionsAction = self->_enableGuardianRestrictionsAction;
  self->_enableGuardianRestrictionsAction = v17;

  v19 = [CNContactDisableGuardianRestrictionsAction alloc];
  -[CNContactActionProvider contact](self, "contact");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactActionProvider container](self, "container");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactActionProvider contactStore](self, "contactStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[CNContactDisableGuardianRestrictionsAction initWithContact:inContainer:contactStore:](v19, "initWithContact:inContainer:contactStore:", v24, v20, v21);
  disableGuardianRestrictionsAction = self->_disableGuardianRestrictionsAction;
  self->_disableGuardianRestrictionsAction = v22;

}

- (CNMutableContact)contact
{
  return self->_contact;
}

- (CNContainer)container
{
  return self->_container;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)buildStaticIdentityActions
{
  CNPropertyStaticIdentityAction *v3;
  void *v4;
  CNPropertyStaticIdentityAction *v5;
  CNPropertyStaticIdentityAction *staticIdentityAction;
  void *v7;
  CNContactAddStaticIdentityAction *v8;
  void *v9;
  CNContactAddStaticIdentityAction *v10;
  CNContactAddStaticIdentityAction *addStaticIdentityAction;
  id v12;

  v3 = [CNPropertyStaticIdentityAction alloc];
  -[CNContactActionProvider contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNPropertyAction initWithContact:](v3, "initWithContact:", v4);
  staticIdentityAction = self->_staticIdentityAction;
  self->_staticIdentityAction = v5;

  -[CNContactActionProvider actionDelegate](self, "actionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction setDelegate:](self->_staticIdentityAction, "setDelegate:", v7);

  v8 = [CNContactAddStaticIdentityAction alloc];
  -[CNContactActionProvider contact](self, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CNContactAction initWithContact:](v8, "initWithContact:", v9);
  addStaticIdentityAction = self->_addStaticIdentityAction;
  self->_addStaticIdentityAction = v10;

  -[CNContactActionProvider actionDelegate](self, "actionDelegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactAction setDelegate:](self->_addStaticIdentityAction, "setDelegate:", v12);

}

- (CNPropertyActionDelegate)actionDelegate
{
  return (CNPropertyActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (CNContactActionProvider)initWithContact:(id)a3 inContainer:(id)a4 contactStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CNContactActionProvider *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CNContactActionProvider initWithContact:inContainer:contactStore:propertyGroupsDataSource:actionsDataSource:capabilities:environment:](self, "initWithContact:inContainer:contactStore:propertyGroupsDataSource:actionsDataSource:capabilities:environment:", v10, v9, v8, 0, 0, 0, v11);

  return v12;
}

- (CNContactActionProvider)initWithContact:(id)a3 inContainer:(id)a4 contactStore:(id)a5 propertyGroupsDataSource:(id)a6 actionsDataSource:(id)a7 capabilities:(id)a8 environment:(id)a9
{
  id v16;
  id v17;
  CNContactActionProvider *v18;
  CNContactActionProvider *v19;
  CNContactActionProvider *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v16 = a8;
  v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)CNContactActionProvider;
  v18 = -[CNContactActionProvider init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contact, a3);
    objc_storeStrong((id *)&v19->_container, a4);
    objc_storeStrong((id *)&v19->_contactStore, a5);
    objc_storeStrong((id *)&v19->_propertyGroupsDataSource, a6);
    objc_storeStrong((id *)&v19->_actionsDataSource, a7);
    objc_storeStrong((id *)&v19->_capabilities, a8);
    objc_storeStrong((id *)&v19->_environment, a9);
    v20 = v19;
  }

  return v19;
}

- (void)buildStandardActions
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  int v22;
  CNPropertySendMessageAction *v23;
  CNPropertySendMessageAction *sendMessageAction;
  unsigned int v25;
  CNPropertyFaceTimeAction *v26;
  CNPropertyFaceTimeAction *faceTimeAction;
  unsigned int v28;
  CNPropertyFaceTimeAction *v29;
  CNPropertyFaceTimeAction *faceTimeAudioAction;
  CNContactAction *v31;
  CNContactAction *shareContactAction;
  void *addFavoriteAction;
  int v34;
  CNContactAddFavoriteAction *v35;
  __int128 v36;
  int v37;
  int v38;
  unsigned int v39;
  int v40;
  id v41;

  -[CNContactActionProvider propertyGroupsDataSource](self, "propertyGroupsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNContactActionProvider actionsDataSource](self, "actionsDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CNContactActionProvider capabilities](self, "capabilities");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[CNContactActionProvider capabilities](self, "capabilities");
        v41 = (id)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v41, "hasCellularTelephonyCapability");
        v40 = objc_msgSend(v41, "areFavoritesAvailable");
        v6 = objc_msgSend(v41, "isMMSConfigured");
        v7 = objc_msgSend(v41, "isMadridConfigured");
        v8 = objc_msgSend(v41, "isConferencingAvailable");
        v37 = objc_msgSend(v41, "isFaceTimeAudioAvailable");
        v9 = objc_msgSend(v41, "isMessagesAppAvailable");
        v38 = objc_msgSend(v41, "isPhoneAppAvailable");
        v10 = objc_msgSend(v41, "isFaceTimeAppAvailable");
        -[CNContactActionProvider contact](self, "contact");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "phoneNumbers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        -[CNContactActionProvider contact](self, "contact");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "emailAddresses");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        -[CNContactActionProvider contact](self, "contact");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "socialProfiles");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *((_QWORD *)&v36 + 1) = objc_msgSend(v18, "count");

        -[CNContactActionProvider contact](self, "contact");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "instantMessageAddresses");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v36 = objc_msgSend(v20, "count");

        if ((objc_msgSend(MEMORY[0x1E0C97200], "quickActionsEnabled") & 1) == 0 && v9)
        {
          v21 = v13 ? v39 | v7 : 0;
          v22 = v16 ? v6 | v7 : 0;
          if ((v21 & 1) != 0 || v22)
          {
            -[CNContactActionProvider _sendMessageActionAllowingEmailIDs:](self, "_sendMessageActionAllowingEmailIDs:");
            v23 = (CNPropertySendMessageAction *)objc_claimAutoreleasedReturnValue();
            sendMessageAction = self->_sendMessageAction;
            self->_sendMessageAction = v23;

          }
        }
        if (self->_faceTimeAction)
          v25 = 0;
        else
          v25 = v8;
        if (v25 == 1 && v13 | v16 && ((v10 ^ 1) & 1) == 0)
        {
          -[CNContactActionProvider _faceTimeAction](self, "_faceTimeAction");
          v26 = (CNPropertyFaceTimeAction *)objc_claimAutoreleasedReturnValue();
          faceTimeAction = self->_faceTimeAction;
          self->_faceTimeAction = v26;

        }
        if (self->_faceTimeAudioAction)
          v28 = 0;
        else
          v28 = v8;
        if (v28 == 1 && v13 | v16 && ((v10 ^ 1) & 1) == 0 && ((v37 ^ 1) & 1) == 0)
        {
          -[CNContactActionProvider _faceTimeAudioAction](self, "_faceTimeAudioAction");
          v29 = (CNPropertyFaceTimeAction *)objc_claimAutoreleasedReturnValue();
          faceTimeAudioAction = self->_faceTimeAudioAction;
          self->_faceTimeAudioAction = v29;

        }
        -[CNContactActionProvider _shareContactAction](self, "_shareContactAction");
        v31 = (CNContactAction *)objc_claimAutoreleasedReturnValue();
        shareContactAction = self->_shareContactAction;
        self->_shareContactAction = v31;

        if (!v40)
          goto LABEL_41;
        -[CNContactActionProvider contact](self, "contact");
        addFavoriteAction = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(addFavoriteAction, "isUnknown") & 1) == 0)
        {
          if (v38 && v13 || (v13 | v16 ? (v34 = v10) : (v34 = 0), v34 == 1))
          {

          }
          else
          {

            if (v36 == 0)
              goto LABEL_41;
          }
          -[CNContactActionProvider _addFavoriteActionWithConferencing:telephony:](self, "_addFavoriteActionWithConferencing:telephony:", v10 & v8, v38 & v39);
          v35 = (CNContactAddFavoriteAction *)objc_claimAutoreleasedReturnValue();
          addFavoriteAction = self->_addFavoriteAction;
          self->_addFavoriteAction = v35;
        }

LABEL_41:
      }
    }
  }
}

- (void)buildSharingLocationActionsWithShareLocationController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__CNContactActionProvider_buildSharingLocationActionsWithShareLocationController___block_invoke;
  v6[3] = &unk_1E204CFB8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  objc_msgSend(v5, "canShareWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)buildLinkedContactActions
{
  CNPropertyLinkedCardsAction *v3;
  CNPropertyLinkedCardsAction *linkedCardsAction;
  CNContactAddLinkedCardAction *v5;
  CNContactAddLinkedCardAction *addLinkedCardAction;

  -[CNContactActionProvider _linkedCardsAction](self, "_linkedCardsAction");
  v3 = (CNPropertyLinkedCardsAction *)objc_claimAutoreleasedReturnValue();
  linkedCardsAction = self->_linkedCardsAction;
  self->_linkedCardsAction = v3;

  -[CNContactActionProvider _addLinkedCardAction](self, "_addLinkedCardAction");
  v5 = (CNContactAddLinkedCardAction *)objc_claimAutoreleasedReturnValue();
  addLinkedCardAction = self->_addLinkedCardAction;
  self->_addLinkedCardAction = v5;

}

- (void)buildAddContactActions
{
  void *v3;
  int v4;
  CNContactCreateNewContactAction *v5;
  CNContactCreateNewContactAction *createNewContactAction;
  CNContactAddToExistingContactAction *v7;
  CNContactAddToExistingContactAction *addToExistingContactAction;

  -[CNContactActionProvider contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUnknown");

  if (v4)
  {
    -[CNContactActionProvider _addCreateNewContactAction](self, "_addCreateNewContactAction");
    v5 = (CNContactCreateNewContactAction *)objc_claimAutoreleasedReturnValue();
    createNewContactAction = self->_createNewContactAction;
    self->_createNewContactAction = v5;

    -[CNContactActionProvider _addToExistingContactAction](self, "_addToExistingContactAction");
    v7 = (CNContactAddToExistingContactAction *)objc_claimAutoreleasedReturnValue();
    addToExistingContactAction = self->_addToExistingContactAction;
    self->_addToExistingContactAction = v7;

  }
}

- (void)buildContainerSelectionAction
{
  CNContactSelectContainersAction *v3;
  CNContactSelectContainersAction *containerSelectionAction;
  id v5;

  v3 = objc_alloc_init(CNContactSelectContainersAction);
  containerSelectionAction = self->_containerSelectionAction;
  self->_containerSelectionAction = v3;

  -[CNContactActionProvider actionDelegate](self, "actionDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactAction setDelegate:](self->_containerSelectionAction, "setDelegate:", v5);

}

- (id)appropriateLocationSharingActionWhenSharing:(BOOL)a3
{
  if (a3)
    -[CNContactActionProvider stopSharingLocationAction](self, "stopSharingLocationAction");
  else
    -[CNContactActionProvider shareLocationAction](self, "shareLocationAction");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_addCreateNewContactAction
{
  CNContactCreateNewContactAction *v3;
  void *v4;
  CNContactCreateNewContactAction *v5;

  v3 = [CNContactCreateNewContactAction alloc];
  -[CNContactActionProvider contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);

  return v5;
}

- (id)_addToExistingContactAction
{
  CNContactAddToExistingContactAction *v3;
  void *v4;
  CNContactAddToExistingContactAction *v5;

  v3 = [CNContactAddToExistingContactAction alloc];
  -[CNContactActionProvider contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);

  return v5;
}

- (id)_sendMessageActionAllowingEmailIDs:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CNPropertySendMessageAction *v12;
  void *v13;
  void *v14;
  CNPropertySendMessageAction *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  -[CNContactActionProvider propertyGroupsDataSource](self, "propertyGroupsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = *MEMORY[0x1E0C966A8];
    v19 = *MEMORY[0x1E0C967C0];
    v20 = v6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v19;
    v9 = 2;
  }
  else
  {
    v18 = *MEMORY[0x1E0C967C0];
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = &v18;
    v9 = 1;
  }
  objc_msgSend(v7, "arrayWithObjects:count:", v8, v9, v18, v19, v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allDisplayPropertyItemsForPropertyKeys:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [CNPropertySendMessageAction alloc];
  -[CNContactActionProvider contact](self, "contact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactActionProvider actionsDataSource](self, "actionsDataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CNPropertySendMessageAction initWithContact:propertyItems:actionDataSource:](v12, "initWithContact:propertyItems:actionDataSource:", v13, v11, v14);

  -[CNContactActionProvider actionDelegate](self, "actionDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction setDelegate:](v15, "setDelegate:", v16);

  return v15;
}

- (id)_addFavoriteActionWithConferencing:(BOOL)a3 telephony:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CNContactAddFavoriteAction *v10;
  void *v11;
  void *v12;
  void *v13;
  CNContactAddFavoriteAction *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  -[CNContactActionProvider propertyGroupsDataSource](self, "propertyGroupsDataSource", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C966A8];
  v17[0] = *MEMORY[0x1E0C967C0];
  v17[1] = v6;
  v7 = *MEMORY[0x1E0C96740];
  v17[2] = *MEMORY[0x1E0C96868];
  v17[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allDisplayPropertyItemsForPropertyKeys:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [CNContactAddFavoriteAction alloc];
  -[CNContactActionProvider contact](self, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactActionProvider environment](self, "environment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "inProcessFavorites");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNContactAddFavoriteAction initWithContact:propertyItems:favorites:](v10, "initWithContact:propertyItems:favorites:", v11, v9, v13);

  -[CNContactActionProvider actionDelegate](self, "actionDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction setDelegate:](v14, "setDelegate:", v15);

  return v14;
}

- (id)_faceTimeAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CNPropertyFaceTimeAction *v7;
  void *v8;
  CNPropertyFaceTimeAction *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[CNContactActionProvider propertyGroupsDataSource](self, "propertyGroupsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C966A8];
  v12[0] = *MEMORY[0x1E0C967C0];
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allDisplayPropertyItemsForPropertyKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [CNPropertyFaceTimeAction alloc];
  -[CNContactActionProvider contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNPropertyFaceTimeAction initWithContact:propertyItems:](v7, "initWithContact:propertyItems:", v8, v6);

  -[CNContactActionProvider actionDelegate](self, "actionDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction setDelegate:](v9, "setDelegate:", v10);

  return v9;
}

- (id)_faceTimeAudioAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CNPropertyFaceTimeAction *v7;
  void *v8;
  CNPropertyFaceTimeAction *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[CNContactActionProvider propertyGroupsDataSource](self, "propertyGroupsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C966A8];
  v12[0] = *MEMORY[0x1E0C967C0];
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allDisplayPropertyItemsForPropertyKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [CNPropertyFaceTimeAction alloc];
  -[CNContactActionProvider contact](self, "contact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNPropertyFaceTimeAction initWithContact:propertyItems:](v7, "initWithContact:propertyItems:", v8, v6);

  -[CNPropertyFaceTimeAction setType:](v9, "setType:", 1);
  -[CNContactActionProvider actionDelegate](self, "actionDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction setDelegate:](v9, "setDelegate:", v10);

  return v9;
}

- (id)_shareContactAction
{
  void *v3;
  char v4;
  CNContactShareContactAction *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;

  -[CNContactActionProvider contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSuggested");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNContactActionProvider contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mainStoreLinkedContacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isUnified"))
    {
      objc_msgSend(v6, "linkedContacts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", v7);

      if ((v9 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C97200], "unifyContacts:", v7);
        v10 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v10;
      }
    }
    v5 = -[CNContactAction initWithContact:]([CNContactShareContactAction alloc], "initWithContact:", v6);
    -[CNContactActionProvider actionDelegate](self, "actionDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactAction setDelegate:](v5, "setDelegate:", v11);

  }
  return v5;
}

- (id)_linkedCardsAction
{
  CNPropertyLinkedCardsAction *v3;
  void *v4;
  CNPropertyLinkedCardsAction *v5;
  void *v6;

  v3 = [CNPropertyLinkedCardsAction alloc];
  -[CNContactActionProvider contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNPropertyLinkedCardsAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactActionProvider actionDelegate](self, "actionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction setDelegate:](v5, "setDelegate:", v6);

  return v5;
}

- (id)_addLinkedCardAction
{
  CNContactAddLinkedCardAction *v3;
  void *v4;
  CNContactAddLinkedCardAction *v5;
  void *v6;

  v3 = [CNContactAddLinkedCardAction alloc];
  -[CNContactActionProvider contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactAction initWithContact:](v3, "initWithContact:", v4);

  -[CNContactActionProvider actionDelegate](self, "actionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactAction setDelegate:](v5, "setDelegate:", v6);

  return v5;
}

- (CNPropertySendMessageAction)sendMessageAction
{
  return self->_sendMessageAction;
}

- (CNPropertyFaceTimeAction)faceTimeAction
{
  return self->_faceTimeAction;
}

- (CNPropertyFaceTimeAction)faceTimeAudioAction
{
  return self->_faceTimeAudioAction;
}

- (CNContactAction)shareContactAction
{
  return self->_shareContactAction;
}

- (CNContactAddFavoriteAction)addFavoriteAction
{
  return self->_addFavoriteAction;
}

- (CNContactAction)createReminderAction
{
  return self->_createReminderAction;
}

- (CNContactAction)shareLocationAction
{
  return self->_shareLocationAction;
}

- (CNContactAction)stopSharingLocationAction
{
  return self->_stopSharingLocationAction;
}

- (CNPropertyLinkedCardsAction)linkedCardsAction
{
  return self->_linkedCardsAction;
}

- (CNContactAddLinkedCardAction)addLinkedCardAction
{
  return self->_addLinkedCardAction;
}

- (CNContactCreateNewContactAction)createNewContactAction
{
  return self->_createNewContactAction;
}

- (CNContactAddToExistingContactAction)addToExistingContactAction
{
  return self->_addToExistingContactAction;
}

- (CNContactSelectContainersAction)containerSelectionAction
{
  return self->_containerSelectionAction;
}

- (CNPropertyStaticIdentityAction)staticIdentityAction
{
  return self->_staticIdentityAction;
}

- (CNContactAddStaticIdentityAction)addStaticIdentityAction
{
  return self->_addStaticIdentityAction;
}

- (CNContactAction)enableGuardianRestrictionsAction
{
  return self->_enableGuardianRestrictionsAction;
}

- (CNContactAction)disableGuardianRestrictionsAction
{
  return self->_disableGuardianRestrictionsAction;
}

- (CNPropertyGroupsDataSource)propertyGroupsDataSource
{
  return self->_propertyGroupsDataSource;
}

- (CNUIUserActionListDataSource)actionsDataSource
{
  return self->_actionsDataSource;
}

- (CNCapabilitiesManager)capabilities
{
  return self->_capabilities;
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_actionsDataSource, 0);
  objc_storeStrong((id *)&self->_propertyGroupsDataSource, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_disableGuardianRestrictionsAction, 0);
  objc_storeStrong((id *)&self->_enableGuardianRestrictionsAction, 0);
  objc_storeStrong((id *)&self->_stopSharingWithFamilyAction, 0);
  objc_storeStrong((id *)&self->_addStaticIdentityAction, 0);
  objc_storeStrong((id *)&self->_staticIdentityAction, 0);
  objc_storeStrong((id *)&self->_containerSelectionAction, 0);
  objc_storeStrong((id *)&self->_addToExistingContactAction, 0);
  objc_storeStrong((id *)&self->_createNewContactAction, 0);
  objc_storeStrong((id *)&self->_addLinkedCardAction, 0);
  objc_storeStrong((id *)&self->_linkedCardsAction, 0);
  objc_storeStrong((id *)&self->_stopSharingLocationAction, 0);
  objc_storeStrong((id *)&self->_shareLocationAction, 0);
  objc_storeStrong((id *)&self->_createReminderAction, 0);
  objc_storeStrong((id *)&self->_addFavoriteAction, 0);
  objc_storeStrong((id *)&self->_shareContactAction, 0);
  objc_storeStrong((id *)&self->_faceTimeAudioAction, 0);
  objc_storeStrong((id *)&self->_faceTimeAction, 0);
  objc_storeStrong((id *)&self->_sendMessageAction, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_shareWithFamilyAction, 0);
}

void __82__CNContactActionProvider_buildSharingLocationActionsWithShareLocationController___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained && a2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __82__CNContactActionProvider_buildSharingLocationActionsWithShareLocationController___block_invoke_2;
    v6[3] = &unk_1E2050400;
    v6[4] = WeakRetained;
    v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __82__CNContactActionProvider_buildSharingLocationActionsWithShareLocationController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION_STOP_SHARING_LABEL_TEXT"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactAction contactActionWithTitle:target:selector:destructive:](CNContactAction, "contactActionWithTitle:target:selector:destructive:", v3, *(_QWORD *)(a1 + 40), sel_perform_, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v4;

  CNContactsUIBundle();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHARE_LOCATION_LABEL_TEXT"), &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactAction contactActionWithTitle:target:selector:destructive:](CNContactAction, "contactActionWithTitle:target:selector:destructive:", v7, *(_QWORD *)(a1 + 40), sel_perform_, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 72);
  *(_QWORD *)(v9 + 72) = v8;

}

@end
