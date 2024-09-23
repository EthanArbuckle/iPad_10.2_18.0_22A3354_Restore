@implementation NSURL(ChatKitAdditions)

+ (id)ckURLForResource:()ChatKitAdditions withExtension:
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForResource:withExtension:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)ckURLForChatIdentifier:()ChatKitAdditions entryBody:
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "__im_URLForChatIdentifier:entryBody:");
}

+ (id)ckSMSURLFromBusinessChatURL:()ChatKitAdditions
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToIgnoringCase:", CFSTR("bcrw.apple.com"));

  if (v5)
  {
    objc_msgSend(v3, "pathComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v3, 1);
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("sms://open"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("service"), *MEMORY[0x1E0D38F68]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v11);
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("recipient"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v13);
        objc_msgSend(v8, "queryItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v14);

        objc_msgSend(v10, "setQueryItems:", v9);
        objc_msgSend(v10, "URL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)ckShouldShowComposeUI
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsString:", CFSTR("compose=false")) ^ 1;

  return v2;
}

- (uint64_t)ckShouldInitiateCollaborationWithSend
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsString:", CFSTR("collaboration-initiate-send=true"));

  return v2;
}

- (id)ckCollaborationSceneIdentifier
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)ExtractURLQueries();

  objc_msgSend(v2, "objectForKey:", CFSTR("collaboration-scene-identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ckCollaborationShareOptions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v11;
  uint8_t v12[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)ExtractURLQueries();

  objc_msgSend(v2, "objectForKey:", CFSTR("collaboration-share-options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v5, 0);
    if (v6)
    {
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Failed to convert data for Collaboration Share Options", v12, 2u);
        }

      }
      v7 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "No query object found for Collaboration Share Options", buf, 2u);
      }

    }
    v7 = 0;
  }

  return v7;
}

- (id)ckURLByPercentEncodingFragment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("!"));
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fragment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFragment:", v6);

  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ckFaceTimeConversationUUID
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)ExtractURLQueries();

  objc_msgSend(v2, "objectForKey:", CFSTR("facetime-conversation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
  else
    v6 = 0;

  return v6;
}

- (uint64_t)ckShouldShowDigitalTouchCanvas
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsString:", CFSTR("dt-canvas=true"));

  return v2;
}

- (uint64_t)ckIsSMSPrivateURLScheme
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("sms-private"));

  return v3;
}

- (id)ckLaunchURLBalloonPluginBundleID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "ckIsSMSPrivateURLScheme"))
    return 0;
  v2 = (void *)MEMORY[0x1E0CB3998];
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "queryItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("appBundleID"));

        if ((v12 & 1) != 0)
        {
          objc_msgSend(v10, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (id)ckLaunchURLBalloonPluginPayload
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "ckIsSMSPrivateURLScheme"))
    return 0;
  v2 = (void *)MEMORY[0x1E0CB3998];
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v17 = v4;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("appPayload"));

        if (v12)
        {
          objc_msgSend(v10, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dataUsingEncoding:", 4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v14, 0, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {

            goto LABEL_15;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
    v15 = 0;
LABEL_15:
    v4 = v17;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (uint64_t)ckAllowRetargeting
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsString:", CFSTR("allowRetargeting=true"));

  return v2;
}

- (uint64_t)ckIsLaunchAppURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsString:", CFSTR("app?"));

  return v2;
}

- (uint64_t)ckIsUnitTestingURL
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  char v13;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalInstall");

  if (v3)
  {
    objc_msgSend(a1, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("sms")) & 1) != 0)
    {
LABEL_5:

LABEL_6:
      objc_msgSend(a1, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsString:", CFSTR("runUnitTest?"));

      return v9;
    }
    objc_msgSend(a1, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("sms-private")) & 1) != 0)
    {

      goto LABEL_5;
    }
    objc_msgSend(a1, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("imessage"));

    if ((v13 & 1) != 0)
      goto LABEL_6;
  }
  return 0;
}

- (id)ckLaunchURLPostComposeDismissal
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB3998];
  objc_msgSend(a1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "queryItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("launchURLPostComposeDismiss"));

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v9, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)ckSuggestedReplies
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "queryItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("reply"));

        if (v10)
        {
          objc_msgSend(v8, "value");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "length"))
          {
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v11);
            objc_msgSend(v2, "addObject:", v12);

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)ckLaunchURLPresentContentForMessageGUID
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB3998];
  objc_msgSend(a1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "queryItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("presentContentForMessage"));

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v9, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

@end
