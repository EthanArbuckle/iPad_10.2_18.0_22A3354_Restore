@implementation CNUIDefaultUserActionRecorder

- (CNUIDefaultUserActionRecorder)init
{
  void *v3;
  _CNUIDefaultUserActionRecorderEventFactory *v4;
  CNUIDefaultUserActionRecorder *v5;

  objc_msgSend(MEMORY[0x1E0D18290], "defaultInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(_CNUIDefaultUserActionRecorderEventFactory);
  v5 = -[CNUIDefaultUserActionRecorder initWithRecentsLibrary:eventFactory:](self, "initWithRecentsLibrary:eventFactory:", v3, v4);

  return v5;
}

- (CNUIDefaultUserActionRecorder)initWithRecentsLibrary:(id)a3 eventFactory:(id)a4
{
  id v7;
  id v8;
  CNUIDefaultUserActionRecorder *v9;
  CNUIDefaultUserActionRecorder *v10;
  CNUIDefaultUserActionRecorder *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNUIDefaultUserActionRecorder;
  v9 = -[CNUIDefaultUserActionRecorder init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    objc_storeStrong((id *)&v10->_eventFactory, a4);
    v11 = v10;
  }

  return v10;
}

- (void)recordUserAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v4;
    _os_log_impl(&dword_1DD140000, v5, OS_LOG_TYPE_INFO, "[Default Action] Recording default action: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "contactProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasBeenPersisted");

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v4, "associatedRecentContactMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v4, "associatedRecentContactMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
      v11 = objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v4, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v4, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v35[0] = CFSTR("date");
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceReferenceDate");
    objc_msgSend(v17, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v19;
    v35[1] = CFSTR("bundleIdentifier");
    objc_msgSend(v4, "bundleIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = &stru_1EA606688;
    if (v20)
      v22 = (const __CFString *)v20;
    v36[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactProperty");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, v25);

    objc_msgSend(v4, "type");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v16, v26);

    objc_msgSend(v4, "contactProperty");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CNUIUserActionRecentsAddressKindForContactProperty();
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUIDefaultUserActionRecorder eventFactory](self, "eventFactory");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sanitizedTargetHandle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "recentEventForAddress:kind:metadata:", v30, v28, v11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNUIDefaultUserActionRecorder library](self, "library");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "recordContactEvents:recentsDomain:sendingAddress:completion:", v33, CFSTR("CNUICRRecentsDomainContactDefaultAction"), 0, &__block_literal_global_40);

  }
  else
  {
    +[CNUICoreLogProvider actions_os_log](CNUICoreLogProvider, "actions_os_log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[CNUIDefaultUserActionRecorder recordUserAction:].cold.1(v4, v11);
  }

}

void __50__CNUIDefaultUserActionRecorder_recordUserAction___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("com.apple.contacts.ContactsUICore.CNUIUserActionRecentsChangedNotification"), 0);

}

- (CRRecentContactsLibrary)library
{
  return self->_library;
}

- (CNUIDefaultUserActionRecorderEventFactory)eventFactory
{
  return self->_eventFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventFactory, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

- (void)recordUserAction:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "contactProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1DD140000, a2, OS_LOG_TYPE_DEBUG, "[Default Action] Scratch that, contact has not been persisted %@", (uint8_t *)&v5, 0xCu);

}

@end
