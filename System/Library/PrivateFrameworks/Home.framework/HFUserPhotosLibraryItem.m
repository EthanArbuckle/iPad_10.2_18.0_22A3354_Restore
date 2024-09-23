@implementation HFUserPhotosLibraryItem

- (HFUserPhotosLibraryItem)initWithUser:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  HFUserPhotosLibraryItem *v11;
  id *p_isa;
  HFUserPhotosLibraryItem *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "hf_allUsersIncludingCurrentUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v7);

  if ((v10 & 1) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)HFUserPhotosLibraryItem;
    v11 = -[HFUserPhotosLibraryItem init](&v16, sel_init);
    p_isa = (id *)&v11->super.super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_user, a3);
      objc_storeStrong(p_isa + 7, a4);
    }
    self = p_isa;
    v13 = self;
  }
  else
  {
    objc_msgSend(v8, "hf_allUsersIncludingCurrentUser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ %s: Home %@ doesn't include user %@. home's users = %@"), self, "-[HFUserPhotosLibraryItem initWithUser:inHome:]", v8, v7, v14);

    v13 = 0;
  }

  return v13;
}

- (HFUserPhotosLibraryItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithUser_inHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFUserPhotosLibraryItem.m"), 42, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFUserPhotosLibraryItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFUserPhotosLibraryItem user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserPhotosLibraryItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithUser:inHome:", v5, v6);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  HFUserNameFormatter *v6;
  void *v7;
  HFUserNameFormatter *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HFUserNameFormatter *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  HFItemUpdateOutcome *v46;
  void *v47;
  void *v49;
  uint8_t buf[4];
  HFUserPhotosLibraryItem *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  void *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserPhotosLibraryItem user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HFUserNameFormatter alloc];
  -[HFUserPhotosLibraryItem home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFUserNameFormatter initWithHome:](v6, "initWithHome:", v7);

  -[HFUserNameFormatter setStyle:](v8, "setStyle:", 0);
  -[HFUserPhotosLibraryItem home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_handleForUser:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[HFUtilities isAMac](HFUtilities, "isAMac"))
  {
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1000);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[HFContactStore defaultStore](HFContactStore, "defaultStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contactForUserHandle:withKeys:", v10, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v14, 1000);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFUserNameFormatter stringForObjectValue:](v8, "stringForObjectValue:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  HFLocalizedStringWithFormat(CFSTR("HFFaceRecognitionUsersPhotosLibraryTableViewCellTitle"), CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("title"));

  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[HFUserPhotosLibraryItem home](self, "home");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "personManagerSettings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "numberWithInt:", objc_msgSend(v25, "isFaceClassificationEnabled") ^ 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("isDisabled"));

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("dependentHomeKitClasses"));

  objc_msgSend(v5, "photosPersonManagerSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v49 = v15;
    v29 = v8;
    v30 = v10;
    -[HFUserPhotosLibraryItem user](self, "user");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFUserPhotosLibraryItem home](self, "home");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "currentUser");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v31, "isEqual:", v33);

    v35 = objc_msgSend(v28, "isImportingFromPhotoLibraryEnabled");
    if (v34)
    {
      if (v35)
      {
        if (objc_msgSend(v28, "isSharingFaceClassificationsEnabled"))
          v36 = CFSTR("HFFaceRecognitionUsersPhotosLibraryTableViewCellDescriptionTextAnyoneInHome");
        else
          v36 = CFSTR("HFFaceRecognitionUsersPhotosLibraryTableViewCellDescriptionTextOnlyMe");
      }
      else
      {
        v36 = CFSTR("HFFaceRecognitionUsersPhotosLibraryTableViewCellDescriptionTextNotConnected");
      }
      v10 = v30;
    }
    else
    {
      v10 = v30;
      if (!v35 || (objc_msgSend(v28, "isSharingFaceClassificationsEnabled") & 1) == 0)
      {
        objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("description"));
        v41 = 1;
        v8 = v29;
LABEL_20:
        v15 = v49;
        goto LABEL_21;
      }
      v36 = CFSTR("HFFaceRecognitionUsersPhotosLibraryTableViewCellDescriptionTextShared");
    }
    v8 = v29;
    _HFLocalizedStringWithDefaultValue(v36, v36, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, CFSTR("description"));

    -[HFUserPhotosLibraryItem home](self, "home");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "personManagerSettings");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v44, "isFaceClassificationEnabled") ^ 1;

    goto LABEL_20;
  }
  v37 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "name");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringWithFormat:", CFSTR("externalPersonManagerSettings is nil for user %@"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x13uLL);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v51 = self;
    v52 = 2080;
    v53 = "-[HFUserPhotosLibraryItem _subclass_updateWithOptions:]";
    v54 = 2112;
    v55 = v39;
    _os_log_impl(&dword_1DD34E000, v40, OS_LOG_TYPE_DEFAULT, "%@ (%s): %@", buf, 0x20u);
  }

  v41 = 1;
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v41);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v45, CFSTR("hidden"));

  v46 = -[HFItemUpdateOutcome initWithResults:]([HFItemUpdateOutcome alloc], "initWithResults:", v4);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserPhotosLibraryItem user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("user"));

  -[HFUserPhotosLibraryItem home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("home"));

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (HMHome)home
{
  return self->_home;
}

- (HMUser)user
{
  return self->_user;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
