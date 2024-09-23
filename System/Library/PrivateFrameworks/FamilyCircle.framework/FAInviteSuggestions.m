@implementation FAInviteSuggestions

- (FAInviteSuggestions)init
{
  id v3;
  FAFamilyPeopleSuggesterSuggester *v4;
  void *v5;
  FAInviteSuggestions *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(FAFamilyPeopleSuggesterSuggester);
  objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_msgSend(v3, "copy");
  v6 = -[FAInviteSuggestions initWithSuggesters:](self, "initWithSuggesters:", v5);

  return v6;
}

- (id)initForOneTapInvite
{
  id v3;
  FAFamilyMegadomeSuggester *v4;
  FAFamilyPeopleSuggesterSuggester *v5;
  void *v6;
  FAInviteSuggestions *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(FAFamilyMegadomeSuggester);
  objc_msgSend(v3, "addObject:", v4);
  v5 = objc_alloc_init(FAFamilyPeopleSuggesterSuggester);
  objc_msgSend(v3, "addObject:", v5);
  v6 = (void *)objc_msgSend(v3, "copy");
  v7 = -[FAInviteSuggestions initWithSuggesters:](self, "initWithSuggesters:", v6);

  return v7;
}

- (FAInviteSuggestions)initWithSuggesters:(id)a3
{
  id v5;
  FAInviteSuggestions *v6;
  FAInviteSuggestions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAInviteSuggestions;
  v6 = -[FAInviteSuggestions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_suggesters, a3);

  return v7;
}

- (id)recommendedSuggester:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  NSObject *v16;
  const char *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _FALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v4;
      _os_log_impl(&dword_1CAEBA000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to use recommended suggester: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = self->_suggesters;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v8, "isEqual:", CFSTR("megadome"), (_QWORD)v19)
            && objc_msgSend(v14, "proactiveModel") == 3)
          {
            _FALogSystem();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v17 = "Recommended suggester matches megadome";
              goto LABEL_21;
            }
LABEL_22:

            v15 = v14;
            goto LABEL_23;
          }
          if (objc_msgSend(v8, "isEqual:", CFSTR("proactive"))
            && objc_msgSend(v14, "proactiveModel") == 2)
          {
            _FALogSystem();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v17 = "Recommended suggester matches proactive";
LABEL_21:
              _os_log_impl(&dword_1CAEBA000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
            }
            goto LABEL_22;
          }
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_23:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)fetchFamilyMemberSuggestions:(int64_t *)a3
{
  return -[FAInviteSuggestions fetchFamilyMemberSuggestions:useSuggester:](self, "fetchFamilyMemberSuggestions:useSuggester:", a3, 0);
}

- (id)fetchFamilyMemberSuggestions:(int64_t *)a3 useSuggester:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  int64_t v23;
  objc_class *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  FAInviteSuggestions *v36;
  void *v37;
  void *v38;
  int64_t *v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _FALogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAEBA000, v7, OS_LOG_TYPE_DEFAULT, "Trying to get family recommendations", buf, 2u);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[FAInviteSuggestions recommendedSuggester:](self, "recommendedSuggester:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAInviteSuggestions suggesters](self, "suggesters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    v12 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v12, "insertObject:atIndex:", v9, 0);
    v11 = (void *)objc_msgSend(v12, "copy");

  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v14)
  {
    v15 = v14;
    v36 = self;
    v37 = v9;
    v38 = v8;
    v39 = a3;
    v40 = v6;
    v16 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_21:
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          _FALogSystem();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v25;
            _os_log_impl(&dword_1CAEBA000, v26, OS_LOG_TYPE_DEFAULT, "Attempting to get Family suggestions from suggester %@", buf, 0xCu);
          }

          v41 = 0;
          v42 = 0;
          objc_msgSend(v18, "getFamilyRecommendationsWithContext:error:", &v42, &v41);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v42;
          v29 = v41;
          _FALogSystem();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v48 = v25;
            v49 = 2112;
            v50 = (uint64_t)v29;
            v51 = 2112;
            v52 = v27;
            _os_log_impl(&dword_1CAEBA000, v30, OS_LOG_TYPE_DEFAULT, "Finished getting family suggestions for suggester class %@. error: %@, recommendations: %@", buf, 0x20u);
          }

          if (v29)
          {
            _FALogSystem();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              v32 = objc_msgSend(v27, "count");
              *(_DWORD *)buf = 138412802;
              v48 = v25;
              v49 = 2048;
              v50 = v32;
              v51 = 2112;
              v52 = v29;
              _os_log_impl(&dword_1CAEBA000, v31, OS_LOG_TYPE_DEFAULT, "Suggester class %@ returned %lu suggestions and encountered an error: %@", buf, 0x20u);
            }

          }
          -[FAInviteSuggestions setFeedbackContext:](v36, "setFeedbackContext:", v28);
          v23 = objc_msgSend(v18, "proactiveModel");
          v8 = v38;
          objc_msgSend(v38, "addObjectsFromArray:", v27);
          _FALogSystem();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v48 = v25;
            v49 = 2112;
            v50 = (uint64_t)v27;
            _os_log_impl(&dword_1CAEBA000, v33, OS_LOG_TYPE_DEFAULT, "Using family suggestions for suggester class %@: recommendations: %@", buf, 0x16u);
          }

          a3 = v39;
          v6 = v40;
          v9 = v37;
          goto LABEL_32;
        }
        +[FAFamilyFeatureFlag megadomeAdoption](FAFamilyFeatureFlag, "megadomeAdoption");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isEnabled") & 1) != 0)
        {
          +[FAServerBagFlag megadomeKillSwitch](FAServerBagFlag, "megadomeKillSwitch");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEnabledWithForceRefresh:", 1);

          if (!v21)
            goto LABEL_21;
        }
        else
        {

        }
        _FALogSystem();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAEBA000, v22, OS_LOG_TYPE_DEFAULT, "Megadome is not enabled. Falling back to the next priorty suggestions model.", buf, 2u);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      if (v15)
        continue;
      break;
    }
    a3 = v39;
    v6 = v40;
    v9 = v37;
    v8 = v38;
  }
  v23 = 1;
LABEL_32:

  if (a3)
    *a3 = v23;
  v34 = (void *)objc_msgSend(v8, "copy");

  return v34;
}

- (int64_t)fetchSuggestedInviteTransportForContactId:(id)a3 contactHandles:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int64_t v17;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D158C0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "interactionAdvisor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D158C8], "interactionAdvisorSettingsDefault");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResultLimit:", 5);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setConstrainPersonIds:", v10);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setConstrainIdentifiers:", v11);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E85745E8, &unk_1E8574600, &unk_1E8574618, &unk_1E8574630, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConstrainMechanisms:", v12);

  objc_msgSend(v8, "adviseInteractionsUsingSettings:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v15;
    _os_log_impl(&dword_1CAEBA000, v16, OS_LOG_TYPE_DEFAULT, "Suggested transport type for contact is %@", buf, 0xCu);
  }

  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
  {
    v17 = 1;
  }
  else if (objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.mobilemail")))
  {
    v17 = 2;
  }
  else
  {
    v17 = 3;
  }

  return v17;
}

- (FAFamilySuggesterFeedbackContext)feedbackContext
{
  return self->_feedbackContext;
}

- (void)setFeedbackContext:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackContext, a3);
}

- (NSArray)suggesters
{
  return self->_suggesters;
}

- (void)setSuggesters:(id)a3
{
  objc_storeStrong((id *)&self->_suggesters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggesters, 0);
  objc_storeStrong((id *)&self->_feedbackContext, 0);
}

@end
