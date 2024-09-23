@implementation NSUserActivity(ContactsUICore)

+ (id)_cnui_startAudioCallIntentWithHandle:()ContactsUICore contact:
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cnui_userActivityWithActivityType:handle:contact:intentWithPerson:", v9, v7, v6, &__block_literal_global_33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_cnui_startVideoCallIntentWithHandle:()ContactsUICore contact:
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cnui_userActivityWithActivityType:handle:contact:intentWithPerson:", v9, v7, v6, &__block_literal_global_2_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_cnui_sendMessageIntentWithHandle:()ContactsUICore contact:
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cnui_userActivityWithActivityType:handle:contact:intentWithPerson:", v9, v7, v6, &__block_literal_global_4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_cnui_userActivityWithActivityType:()ContactsUICore handle:contact:intentWithPerson:
{
  id v9;
  id v10;
  void (**v11)(id, void *);
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = a4;
  if (objc_msgSend(v10, "hasBeenPersisted"))
  {
    objc_msgSend(v10, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_alloc(MEMORY[0x1E0CBDA58]);
  +[CNHandle inPersonHandleForHandle:](CNHandle, "inPersonHandleForHandle:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "customIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v14, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v15, 0, 0, 0, v13, v16);
  v11[2](v11, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v18, 0);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B10]), "initWithActivityType:", v9);
    objc_msgSend(v20, "_setInteraction:donate:", v19, 0);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)_cnui_searchMailUserActivityForContact:()ContactsUICore
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3B10]);
    v5 = (void *)objc_msgSend(v4, "initWithActivityType:", *MEMORY[0x1E0CA5EF8]);
    v8 = *MEMORY[0x1E0CA5F08];
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInfo:", v6);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
