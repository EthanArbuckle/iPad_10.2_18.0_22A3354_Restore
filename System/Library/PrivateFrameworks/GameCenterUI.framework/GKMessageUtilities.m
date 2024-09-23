@implementation GKMessageUtilities

+ (id)messagesRecipientHandleForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v3, "phoneNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v42 = v3;
  objc_msgSend(v3, "phoneNumbers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v51;
    v10 = *MEMORY[0x1E0C97010];
    v11 = *MEMORY[0x1E0C97050];
    v12 = *MEMORY[0x1E0C97030];
    v45 = *MEMORY[0x1E0C97038];
    v43 = *MEMORY[0x1E0C97030];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v14, "label");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v10) & 1) == 0
          && (objc_msgSend(v15, "isEqualToString:", v11) & 1) == 0
          && (objc_msgSend(v15, "isEqualToString:", v12) & 1) == 0
          && (objc_msgSend(v15, "isEqualToString:", v45) & 1) == 0)
        {
          objc_msgSend(v14, "label");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v14, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringValue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "label");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKeyedSubscript:", v18, v19);

            v12 = v43;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v8);
  }

  v20 = v44;
  objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x1E0C97058]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x1E0C97028]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x1E0C97020]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        objc_msgSend(v42, "phoneNumbers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "value");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          v25 = (void *)MEMORY[0x1E0C99E08];
          objc_msgSend(v42, "emailAddresses");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          objc_msgSend(v42, "emailAddresses");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v47;
            do
            {
              for (j = 0; j != v30; ++j)
              {
                if (*(_QWORD *)v47 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
                objc_msgSend(v33, "label");
                v34 = objc_claimAutoreleasedReturnValue();
                if (v34)
                {
                  v35 = (void *)v34;
                  objc_msgSend(v33, "value");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v36)
                  {
                    objc_msgSend(v33, "value");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "label");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "setObject:forKeyedSubscript:", v37, v38);

                  }
                }
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            }
            while (v30);
          }

          objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0C96FF0]);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0C96FF8]);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v21)
            {
              objc_msgSend(v42, "emailAddresses");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "firstObject");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "value");
              v21 = (void *)objc_claimAutoreleasedReturnValue();

            }
          }

          v20 = v44;
        }
      }
    }
  }

  return v21;
}

+ (void)linkMetadataWithPlayerRange:(_NSRange)a3 shareURL:(id)a4 completionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  NSUInteger v28;
  NSUInteger v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;

  length = a3.length;
  location = a3.location;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMessageUtilities.m", 76, "+[GKMessageUtilities linkMetadataWithPlayerRange:shareURL:completionHandler:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dispatchGroupWithName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D252C0], "currentGame");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke;
  v30[3] = &unk_1E59C42A0;
  v31 = v14;
  v16 = v12;
  v32 = v16;
  v17 = v13;
  v33 = v17;
  v18 = v14;
  objc_msgSend(v16, "perform:", v30);
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke_4;
  v23[3] = &unk_1E59C42C8;
  v24 = v17;
  v25 = v16;
  v28 = location;
  v29 = length;
  v26 = v8;
  v27 = v9;
  v19 = v9;
  v20 = v8;
  v21 = v16;
  v22 = v17;
  objc_msgSend(v21, "notifyOnMainQueueWithBlock:", v23);

}

void __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D25298], "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bulletinServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke_2;
  v8[3] = &unk_1E59C4278;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v11 = v3;
  v10 = *(id *)(a1 + 48);
  v7 = v3;
  objc_msgSend(v5, "fetchMessageImageForBundleID:handler:", v6, v8);

}

void __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithData:MIMEType:", v3, CFSTR("image/png"));
    objc_msgSend(*(id *)(a1 + 32), "setResult:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke_3;
    v7[3] = &unk_1E59C4250;
    v5 = *(void **)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    v6 = (id)objc_msgSend(v5, "loadIconForStyle:withCompletionHandler:", 9, v7);

  }
}

uint64_t __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke_3(uint64_t a1, UIImage *image)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (image)
  {
    UIImagePNGRepresentation(image);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithData:MIMEType:", v3, CFSTR("image/png"));
    objc_msgSend(*(id *)(a1 + 32), "setResult:", v4);
  }
  else
  {
    GKGameCenterUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_gkPathForMessageImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithData:MIMEType:", v4, CFSTR("image/png"));
    objc_msgSend(*(id *)(a1 + 32), "setResult:", v6);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77__GKMessageUtilities_linkMetadataWithPlayerRange_shareURL_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = objc_alloc_init(MEMORY[0x1E0CC1168]);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setGame:", v2);

  objc_msgSend(*(id *)(a1 + 40), "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v3);

  v4 = *(_QWORD *)(a1 + 72);
  v5 = v4 + *(_QWORD *)(a1 + 64);
  if (v4)
  {
    objc_msgSend(v11, "setMinimumNumberOfPlayers:");
    objc_msgSend(v11, "setMaximumNumberOfPlayers:", v5);
  }
  else
  {
    objc_msgSend(v11, "setNumberOfPlayers:", v5);
  }
  GKGameCenterUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_gkPathForMessageImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithData:MIMEType:", v8, CFSTR("image/png"));
  objc_msgSend(v11, "setIcon:", v9);

  v10 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  objc_msgSend(v10, "setOriginalURL:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v10, "setSpecialization:", v11);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

+ (id)playerWithPhoneNumberOrEmail:(id)a3
{
  return (id)objc_msgSend(a1, "playerWithPhoneNumberOrEmail:givenName:", a3, 0);
}

+ (id)playerWithPhoneNumberOrEmail:(id)a3 givenName:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C97360]);
  if (objc_msgSend(v5, "containsString:", CFSTR("@")))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", &stru_1E59EB978, v5);
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEmailAddresses:", v9);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v5);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97338]), "initWithLabel:value:", &stru_1E59EB978, v8);
    v13 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPhoneNumbers:", v10);

  }
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v7, "setGivenName:", v6);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D25358]), "initWithContact:", v7);

  return v11;
}

+ (id)predicateWithPhoneNumberOrEmail:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (!v3)
    goto LABEL_6;
  if (!IMStringIsEmail())
  {
    if (MEMORY[0x1AF43049C](v3))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v3);
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v4;
}

+ (id)contactFromEmailOrPhoneNumber:(id)a3 fromContactStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject **v19;
  NSObject *v20;
  id v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[15];

  v30[14] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[GKMessageUtilities predicateWithPhoneNumberOrEmail:](GKMessageUtilities, "predicateWithPhoneNumberOrEmail:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    v29 = 0;
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0C966E8];
    v30[0] = v8;
    v30[1] = v9;
    v10 = *MEMORY[0x1E0C967C0];
    v30[2] = *MEMORY[0x1E0C966A8];
    v30[3] = v10;
    v11 = *MEMORY[0x1E0C966D0];
    v30[4] = *MEMORY[0x1E0C96790];
    v30[5] = v11;
    v12 = *MEMORY[0x1E0C966C0];
    v30[6] = *MEMORY[0x1E0C96780];
    v30[7] = v12;
    v13 = *MEMORY[0x1E0C96798];
    v30[8] = *MEMORY[0x1E0C96820];
    v30[9] = v13;
    v14 = *MEMORY[0x1E0C96898];
    v30[10] = *MEMORY[0x1E0C967A0];
    v30[11] = v14;
    v15 = *MEMORY[0x1E0C96890];
    v30[12] = *MEMORY[0x1E0C96708];
    v30[13] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v16);
    objc_msgSend(v17, "setPredicate:", v7);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69__GKMessageUtilities_contactFromEmailOrPhoneNumber_fromContactStore___block_invoke;
    v23[3] = &unk_1E59C42F0;
    v23[4] = &v24;
    objc_msgSend(v6, "enumerateContactsWithFetchRequest:error:usingBlock:", v17, 0, v23);
    v18 = (id)v25[5];

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v19 = (NSObject **)MEMORY[0x1E0D25460];
    v20 = *MEMORY[0x1E0D25460];
    if (!*MEMORY[0x1E0D25460])
    {
      v21 = (id)GKOSLoggers();
      v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[GKMessageUtilities contactFromEmailOrPhoneNumber:fromContactStore:].cold.1((uint64_t)v5, v20);
    v18 = 0;
  }

  return v18;
}

void __69__GKMessageUtilities_contactFromEmailOrPhoneNumber_fromContactStore___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v3;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v7 = objc_msgSend(v16, "contactType");
  v8 = v16;
  if (!v7)
  {
    objc_msgSend(v16, "givenName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    v11 = v16;
    v12 = v10;
    if (!v10)
    {
      objc_msgSend(v16, "familyName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "length"))
      {

        v8 = v16;
        goto LABEL_13;
      }
      v11 = v16;
    }
    objc_msgSend(v11, "emailAddresses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {

      if (!v12)
LABEL_12:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      v8 = v16;
      *a3 = 1;
      goto LABEL_13;
    }
    objc_msgSend(v16, "phoneNumbers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (!v12)
    v8 = v16;
    if (v15)
      goto LABEL_12;
  }
LABEL_13:

}

+ (void)contactFromEmailOrPhoneNumber:(uint64_t)a1 fromContactStore:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AB361000, a2, OS_LOG_TYPE_DEBUG, "Could not create predicate for handle: %@", (uint8_t *)&v2, 0xCu);
}

@end
