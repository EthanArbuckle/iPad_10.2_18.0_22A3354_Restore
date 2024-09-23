@implementation IMIDSIDQueryController

+ (BOOL)idInfoForDestinations:(id)a3 service:(id)a4 fromID:(id)a5 infoTypes:(unint64_t)a6 options:(id)a7 listenerID:(id)a8 queue:(id)a9 completionBlock:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  +[IMIDSServiceController sharedInstance](IMIDSServiceController, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logIfDebuggingService:method:", v16, "+[IMIDSIDQueryController idInfoForDestinations:service:fromID:infoTypes:options:listenerID:queue:completionBlock:]");

  objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34EA8]), "initWithPrefixedURI:", v17);
    v25 = objc_msgSend(v23, "idInfoForDestinations:service:preferredFromID:infoTypes:options:listenerID:queue:completionBlock:", v15, v16, v24, a6, v18, v19, v20, v21);

  }
  else
  {
    v25 = objc_msgSend(v23, "idInfoForDestinations:service:infoTypes:options:listenerID:queue:completionBlock:", v15, v16, a6, v18, v19, v20, v21);
  }

  return v25;
}

+ (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[IMIDSServiceController sharedInstance](IMIDSServiceController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logIfDebuggingService:method:", v8, "+[IMIDSIDQueryController _currentIDStatusForDestinations:service:listenerID:]");

  objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_currentIDStatusForDestinations:service:listenerID:", v9, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  +[IMIDSServiceController sharedInstance](IMIDSServiceController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logIfDebuggingService:method:", v14, "+[IMIDSIDQueryController refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:]");

  objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:", v15, v14, v13, v12, v11);

  return v18;
}

+ (int64_t)_currentCachedIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int64_t v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[IMIDSServiceController sharedInstance](IMIDSServiceController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logIfDebuggingService:method:", v8, "+[IMIDSIDQueryController _currentCachedIDStatusForDestination:service:listenerID:]");

  objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "_currentCachedIDStatusForDestination:service:listenerID:", v9, v8, v7);

  return v12;
}

+ (id)_currentCachedRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[IMIDSServiceController sharedInstance](IMIDSServiceController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logIfDebuggingService:method:", v8, "+[IMIDSIDQueryController _currentCachedRemoteDevicesForDestinations:service:listenerID:]");

  objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_currentCachedRemoteDevicesForDestinations:service:listenerID:", v9, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  +[IMIDSServiceController sharedInstance](IMIDSServiceController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logIfDebuggingService:method:", v14, "+[IMIDSIDQueryController currentIDStatusForDestination:service:listenerID:queue:completionBlock:]");

  objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "currentIDStatusForDestination:service:listenerID:queue:completionBlock:", v15, v14, v13, v12, v11);

  return v18;
}

+ (BOOL)refreshIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  +[IMIDSServiceController sharedInstance](IMIDSServiceController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logIfDebuggingService:method:", v14, "+[IMIDSIDQueryController refreshIDStatusForDestination:service:listenerID:queue:completionBlock:]");

  objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "refreshIDStatusForDestination:service:listenerID:queue:completionBlock:", v15, v14, v13, v12, v11);

  return v18;
}

+ (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  +[IMIDSServiceController sharedInstance](IMIDSServiceController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logIfDebuggingService:method:", v14, "+[IMIDSIDQueryController currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:]");

  objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:", v15, v14, v13, v12, v11);

  return v18;
}

+ (BOOL)participantsForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  +[IMIDSServiceController sharedInstance](IMIDSServiceController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logIfDebuggingService:method:", v14, "+[IMIDSIDQueryController participantsForDestinations:service:listenerID:queue:completionBlock:]");

  objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "participantsForDestinations:service:listenerID:queue:completionBlock:", v15, v14, v13, v12, v11);

  return v18;
}

@end
