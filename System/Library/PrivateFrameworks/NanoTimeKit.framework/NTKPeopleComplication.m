@implementation NTKPeopleComplication

- (unint64_t)ntk_itemType
{
  if (-[NTKPeopleComplication isFavoritedPerson](self, "isFavoritedPerson"))
    return 2;
  else
    return 4;
}

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  if (NTKDeviceIsGreenTea()
    && (objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isPaired"),
        v4,
        !v5))
  {
    v12 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(a1, "allValidFavoriteContacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "count"))
    {
      +[NTKPeopleComplicationContactsCache sharedCache](NTKPeopleComplicationContactsCache, "sharedCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nonFavoriteAllContactsWithCount:", 5);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    _peopleComplicationsForContacts(v6, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = (void *)MEMORY[0x1E0C9AA60];
    if (v9)
      v11 = (void *)v9;
    v12 = v11;

  }
  return v12;
}

+ (BOOL)_complicationPickerShouldShowMoreButtonForList:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isFavoritedPerson") & 1) != 0 && (unint64_t)objc_msgSend(v3, "count") <= 4)
  {
    +[NTKPeopleComplicationContactsCache sharedCache](NTKPeopleComplicationContactsCache, "sharedCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstNonFavoriteAllContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = (unint64_t)objc_msgSend(v3, "count") > 4;
  }

  return v7;
}

+ (id)myCard
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  +[NTKPeopleComplicationContactsCache sharedCache](NTKPeopleComplicationContactsCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__46;
  v11 = __Block_byref_object_dispose__46;
  v12 = 0;
  objc_msgSend(v2, "myCard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__NTKPeopleComplication_myCard__block_invoke;
  v6[3] = &unk_1E6BD8FF0;
  v6[4] = &v7;
  objc_msgSend(v2, "checkValidityOfContact:block:", v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__NTKPeopleComplication_myCard__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (id)allValidFavoriteContacts
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  +[NTKPeopleComplicationContactsCache sharedCache](NTKPeopleComplicationContactsCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "favoriteContacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __49__NTKPeopleComplication_allValidFavoriteContacts__block_invoke;
        v13[3] = &unk_1E6BD87F8;
        v14 = v2;
        objc_msgSend(v3, "checkValidityOfContact:block:", v10, v13);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  objc_msgSend(v2, "sortUsingComparator:", &__block_literal_global_148);
  v11 = (void *)objc_msgSend(v2, "copy");

  return v11;
}

uint64_t __49__NTKPeopleComplication_allValidFavoriteContacts__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __49__NTKPeopleComplication_allValidFavoriteContacts__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  +[NTKPeopleComplication localizedNameForContact:](NTKPeopleComplication, "localizedNameForContact:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKPeopleComplication localizedNameForContact:](NTKPeopleComplication, "localizedNameForContact:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (NTKPeopleComplication)init
{
  NTKPeopleComplication *v2;
  NTKPeopleComplication *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKPeopleComplication;
  v2 = -[NTKPeopleComplication init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[NTKPeopleComplication _registerWithSwitch:](v2, "_registerWithSwitch:", 1);
  return v3;
}

- (void)_registerWithSwitch:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);
  if (v3)
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__contactsCacheDidChange, CFSTR("NTKPeopleComplicationContactsCacheDidChangeNotification"), 0);

}

- (void)dealloc
{
  objc_super v3;

  -[NTKPeopleComplication _registerWithSwitch:](self, "_registerWithSwitch:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplication;
  -[NTKPeopleComplication dealloc](&v3, sel_dealloc);
}

- (id)ntk_sectionIdentifier
{
  return CFSTR("com.apple.nanotimekit.contacts");
}

- (NSString)storeBackedContactID
{
  NSString *storeBackedContactID;
  NSObject *v4;

  storeBackedContactID = self->_storeBackedContactID;
  if (!storeBackedContactID)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[NTKPeopleComplication storeBackedContactID].cold.1((uint64_t)self, v4);

    storeBackedContactID = self->_contactID;
  }
  return storeBackedContactID;
}

- (id)localizedDetailText
{
  return self->_shortName;
}

- (id)localizedKeylineLabelText
{
  NSString *shortName;
  void *v3;
  void *v4;

  shortName = self->_shortName;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString capitalizedStringWithLocale:](shortName, "capitalizedStringWithLocale:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)localizedNameForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[NTKPeopleComplicationContactsCache sharedCache](NTKPeopleComplicationContactsCache, "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortNameForContact:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)complicationForContact:(id)a3 forPromotedSection:(BOOL)a4
{
  __CFString *v4;

  if (a4)
    v4 = 0;
  else
    v4 = CFSTR("all");
  return _peopleComplicationForContact(a3, v4);
}

- (BOOL)isFavoritedPerson
{
  void *v3;
  void *v4;
  char v5;

  +[NTKPeopleComplicationContactsCache sharedCache](NTKPeopleComplicationContactsCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPeopleComplication storeBackedContactID](self, "storeBackedContactID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "contactIdentifierIsFavorited:", v4);

  return v5;
}

- (void)_contactsCacheDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__NTKPeopleComplication__contactsCacheDidChange__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __48__NTKPeopleComplication__contactsCacheDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshContactInfoNotifyOfChange");
}

- (void)_refreshContactInfoNotifyOfChange
{
  NSObject *v3;
  NSString *fullName;
  NSString *contactID;
  void *v6;
  int v7;
  NSObject *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSString *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  NSString *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[NTKComplication complicationType](self, "complicationType"))
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      fullName = self->_fullName;
      contactID = self->_contactID;
      *(_DWORD *)buf = 138412546;
      v17 = fullName;
      v18 = 2112;
      v19 = contactID;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplication doing refresh on instance [%@][%@] with complicationType == NTKComplicationTypeNone.", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLocked");

  if (v7)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_fullName;
      v10 = self->_contactID;
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplication skipping refresh contact [%@][%@] info due to device being locked.", buf, 0x16u);
    }
  }
  else
  {
    +[NTKPeopleComplicationContactsCache sharedCache](NTKPeopleComplicationContactsCache, "sharedCache");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NTKPeopleComplication contactID](self, "contactID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject contactForId:](v8, "contactForId:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[NTKPeopleComplication _updateStateWithContact:foundAsPrimaryId:](self, "_updateStateWithContact:foundAsPrimaryId:", v12, 1);
    }
    else
    {
      objc_initWeak((id *)buf, self);
      v13 = self->_fullName;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __58__NTKPeopleComplication__refreshContactInfoNotifyOfChange__block_invoke;
      v14[3] = &unk_1E6BD9058;
      objc_copyWeak(&v15, (id *)buf);
      -[NSObject findContactWithFullName:block:](v8, "findContactWithFullName:block:", v13, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __58__NTKPeopleComplication__refreshContactInfoNotifyOfChange__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_updateStateWithContact:foundAsPrimaryId:", v5, 0);

}

- (void)_updateStateWithContact:(id)a3 foundAsPrimaryId:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSString *v10;
  NSString *v11;
  NSObject *v12;
  NSString *fullName;
  NSString *contactID;
  NSString *v15;
  NSString *storeBackedContactID;
  NSObject *v17;
  NSString *v18;
  NSString *v19;
  NSObject *v20;
  NSString *v21;
  NSString *v22;
  _QWORD block[5];
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  NSString *v30;
  __int16 v31;
  NSString *v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[NTKPeopleComplicationContactsCache sharedCache](NTKPeopleComplicationContactsCache, "sharedCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __66__NTKPeopleComplication__updateStateWithContact_foundAsPrimaryId___block_invoke;
  v24[3] = &unk_1E6BD9080;
  v24[4] = self;
  v24[5] = &v25;
  if ((objc_msgSend(v7, "checkValidityOfContact:block:", v6, v24) & 1) != 0)
  {
    if (-[NTKComplication complicationType](self, "complicationType"))
    {
      if (v4)
      {
LABEL_4:
        objc_storeStrong((id *)&self->_storeBackedContactID, self->_contactID);
        goto LABEL_15;
      }
    }
    else
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        fullName = self->_fullName;
        contactID = self->_contactID;
        *(_DWORD *)buf = 138412546;
        v30 = fullName;
        v31 = 2112;
        v32 = contactID;
        _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplication [%@][%@] valid but NTKComplicationTypeNone == self.complicationType so changing to NTKComplicationTypePeople.", buf, 0x16u);
      }

      -[NTKComplication _setComplicationType:](self, "_setComplicationType:", 37);
      *((_BYTE *)v26 + 24) = 1;
      if (v4)
        goto LABEL_4;
    }
    objc_msgSend(v6, "identifier");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    storeBackedContactID = self->_storeBackedContactID;
    self->_storeBackedContactID = v15;

    *((_BYTE *)v26 + 24) = 1;
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = self->_contactID;
      *(_DWORD *)buf = 138412546;
      v30 = v18;
      v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplication valid but storeBackedContactID[%@] is being used now associated with primary[%@].", buf, 0x16u);

    }
  }
  else if (-[NTKComplication complicationType](self, "complicationType") == 37)
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_fullName;
      v11 = self->_contactID;
      *(_DWORD *)buf = 138412546;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplication [%@][%@] invalid so setting complicationtype to NTKComplicationTypeNone.", buf, 0x16u);
    }

    -[NTKComplication _setComplicationType:](self, "_setComplicationType:", 0);
    *((_BYTE *)v26 + 24) = 1;
  }
LABEL_15:
  if (*((_BYTE *)v26 + 24))
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_fullName;
      v22 = self->_contactID;
      *(_DWORD *)buf = 138412546;
      v30 = v21;
      v31 = 2112;
      v32 = v22;
      _os_log_impl(&dword_1B72A3000, v20, OS_LOG_TYPE_DEFAULT, "NTKPeopleComplication [%@][%@] did change in some way so sending notification.", buf, 0x16u);
    }

    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __66__NTKPeopleComplication__updateStateWithContact_foundAsPrimaryId___block_invoke_15;
    block[3] = &unk_1E6BCD5F0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  _Block_object_dispose(&v25, 8);

}

void __66__NTKPeopleComplication__updateStateWithContact_foundAsPrimaryId___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;

  v11 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isEqualToString:", v9) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "isEqualToString:", v11) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isEqualToString:", v10) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), a5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __66__NTKPeopleComplication__updateStateWithContact_foundAsPrimaryId___block_invoke_15(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKComplicationDidChangeNotification"), *(_QWORD *)(a1 + 32));

}

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return a3 != 3;
}

- (id)_complicationTypeString
{
  unint64_t v2;
  NSObject *v4;

  v2 = -[NTKComplication complicationType](self, "complicationType");
  if (!v2)
    return CFSTR("NONE");
  if (v2 == 37)
    return CFSTR("PEOPLE");
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[NTKPeopleComplication _complicationTypeString].cold.1(v4);

  return &stru_1E6BDC918;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[NTKPeopleComplication contactID](self, "contactID", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPeopleComplication abbreviation](self, "abbreviation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPeopleComplication fullName](self, "fullName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPeopleComplication shortName](self, "shortName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKPeopleComplication _complicationTypeString](self, "_complicationTypeString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@-%@-%@-%@"), v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  return objc_msgSend(a3, "localeMatchesContext:", a4) ^ 1;
}

- (id)_generateUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, self->_contactID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NTKPeopleComplication;
  v4 = -[NTKComplication copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_contactID, "copy");
  v6 = (void *)v4[5];
  v4[5] = v5;

  v7 = -[NSString copy](self->_fullName, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[NSString copy](self->_abbreviation, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[NSString copy](self->_shortName, "copy");
  v12 = (void *)v4[6];
  v4[6] = v11;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKPeopleComplication)initWithCoder:(id)a3
{
  id v4;
  NTKPeopleComplication *v5;
  uint64_t v6;
  NSString *contactID;
  uint64_t v8;
  NSString *fullName;
  uint64_t v10;
  NSString *abbreviation;
  uint64_t v12;
  NSString *shortName;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NTKPeopleComplication;
  v5 = -[NTKComplication initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPeopleComplicationContactIDKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    contactID = v5->_contactID;
    v5->_contactID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPeopleComplicationFullNameKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPeopleComplicationAbbreviationKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    abbreviation = v5->_abbreviation;
    v5->_abbreviation = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kPeopleComplicationShortNameKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    shortName = v5->_shortName;
    v5->_shortName = (NSString *)v12;

    if (!v5->_contactID)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ cannot have nil _contactID"), objc_opt_class());
    if (!v5->_fullName)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ cannot have nil _fullName"), objc_opt_class());
    if (!v5->_abbreviation)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ cannot have nil _abbreviation"), objc_opt_class());
    if (!v5->_shortName)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ cannot have nil _shortName"), objc_opt_class());
    -[NTKPeopleComplication _generateUniqueIdentifier](v5, "_generateUniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKComplication setUniqueIdentifier:](v5, "setUniqueIdentifier:", v14);

    -[NTKPeopleComplication _refreshContactInfoNotifyOfChange](v5, "_refreshContactInfoNotifyOfChange");
    -[NTKPeopleComplication _registerWithSwitch:](v5, "_registerWithSwitch:", 1);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKPeopleComplication;
  v4 = a3;
  -[NTKComplication encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contactID, CFSTR("kPeopleComplicationContactIDKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fullName, CFSTR("kPeopleComplicationFullNameKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_abbreviation, CFSTR("kPeopleComplicationAbbreviationKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shortName, CFSTR("kPeopleComplicationShortNameKey"));

}

- (void)_addKeysToJSONDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKPeopleComplication;
  v4 = a3;
  -[NTKComplication _addKeysToJSONDictionary:](&v5, sel__addKeysToJSONDictionary_, v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_contactID, CFSTR("people ID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_fullName, CFSTR("people full name"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_abbreviation, CFSTR("people Abbreviation"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_shortName, CFSTR("people short name"));

}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKPeopleComplication;
  v7 = -[NTKComplication _initWithComplicationType:JSONDictionary:](&v18, sel__initWithComplicationType_JSONDictionary_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("people ID"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v7[5];
    v7[5] = v8;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("people full name"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v7[7];
    v7[7] = v10;

    objc_msgSend(v6, "objectForKeyedSubscript:");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v7[8];
    v7[8] = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v7[6];
    v7[6] = v14;

    if (!v7[5])
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("missing value for key '%@'"), CFSTR("people ID"));
    if (!v7[7])
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("missing value for key '%@'"), CFSTR("people full name"));
    if (!v7[8])
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("missing value for key '%@'"), CFSTR("people Abbreviation"));
    if (!v7[6])
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("missing value for key '%@'"), CFSTR("people short name"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("value for key '%@' must be String - invalid value: %@"), CFSTR("people ID"), v7[5]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("value for key '%@' must be String - invalid value: %@"), CFSTR("people full name"), v7[7]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("value for key '%@' must be String - invalid value: %@"), CFSTR("people Abbreviation"), v7[8]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("value for key '%@' must be String - invalid value: %@"), CFSTR("people short name"), v7[6]);
    objc_msgSend(v7, "_generateUniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUniqueIdentifier:", v16);

  }
  return v7;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)abbreviation
{
  return self->_abbreviation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abbreviation, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_storeBackedContactID, 0);
}

- (void)storeBackedContactID
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "People Complication:[%@] no storeBackedContactID defaulting to[%@]", (uint8_t *)&v4, 0x16u);
}

- (void)_complicationTypeString
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "NTKPeopleComplication invalid complicationType.", v1, 2u);
}

@end
