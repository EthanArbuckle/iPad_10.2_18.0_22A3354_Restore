@implementation NSURL(LPInternal)

- (BOOL)_lp_isNewsPuzzleURL
{
  if ((objc_msgSend(a1, "isFileURL") & 1) != 0)
    return 0;
  NewsCoreLibrary();
  return (unint64_t)(objc_msgSend(a1, "fc_newsURLType") - 5) < 2;
}

- (BOOL)_lp_isNewsSportsEventURL
{
  if ((objc_msgSend(a1, "isFileURL") & 1) != 0)
    return 0;
  NewsCoreLibrary();
  return objc_msgSend(a1, "fc_newsURLType") == 4;
}

- (uint64_t)_lp_isTelephoneURL
{
  if ((objc_msgSend(a1, "_lp_isHTTPFamilyURL") & 1) != 0 || (objc_msgSend(a1, "isFileURL") & 1) != 0)
    return 0;
  TelephonyUtilitiesLibrary();
  return objc_msgSend(a1, "isTelephonyURL");
}

- (uint64_t)_lp_formattedTelephoneNumber
{
  TelephonyUtilitiesLibrary();
  return objc_msgSend(a1, "formattedPhoneNumber");
}

- (id)_lp_faceTimeInviteLink
{
  void *v3;
  id v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (!objc_msgSend(a1, "_lp_isHTTPFamilyURL") || (objc_msgSend(a1, "isFileURL") & 1) != 0)
    return 0;
  TelephonyUtilitiesLibrary();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v3 = (void *)getTUConversationLinkClass(void)::softClass;
  v9 = getTUConversationLinkClass(void)::softClass;
  if (!getTUConversationLinkClass(void)::softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = ___ZL26getTUConversationLinkClassv_block_invoke;
    v5[3] = &unk_1E44A7DB0;
    v5[4] = &v6;
    ___ZL26getTUConversationLinkClassv_block_invoke((uint64_t)v5);
    v3 = (void *)v7[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v4, "conversationLinkForURL:", a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_lp_isFaceTimeInviteURL
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_lp_faceTimeInviteLink");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)_lp_faceTimeInviteTitle
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_lp_faceTimeInviteLink");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "linkName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_lp_components
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_lp_componentsNoCopy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "copy");

  return v2;
}

- (id)_lp_componentsNoCopy
{
  void *v4;

  objc_getAssociatedObject(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (id)_lp_pathComponentAtIndex:()LPInternal
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_lp_valueForQueryKey:()LPInternal
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_lp_componentsNoCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v5, "queryItems", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "_lp_isEqualIgnoringCase:", v4);

        if (v12)
        {
          objc_msgSend(v10, "value");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (uint64_t)_lp_hasWalletRelatedScheme
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "_lp_isEqualToAnyIgnoringCase:", &unk_1E44F02A0);

  return v2;
}

- (uint64_t)_lp_hasAllowedNonHTTPSchemeForMetadataDecoding
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(a1, "_lp_hasAllowedNonHTTPScheme") & 1) != 0)
    return 1;
  objc_msgSend(a1, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "_lp_isEqualIgnoringCase:", CFSTR("tel"));

  return v2;
}

- (id)_lp_requestWithAttribution:()LPInternal
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttribution:", a3);
  return v4;
}

- (uint64_t)_lp_fileSize
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "attributesOfItemAtPath:error:", v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  v6 = objc_msgSend(v4, "fileSize");

  if (v5)
  {
    v7 = LPLogChannelFilesystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NSURL(LPInternal) _lp_fileSize].cold.1((uint64_t)v5, v7);
  }

  return v6;
}

- (void)_lp_fileSize
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A0C41000, a2, OS_LOG_TYPE_ERROR, "Failed to read size of file: %@", (uint8_t *)&v2, 0xCu);
}

@end
