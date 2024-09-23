@implementation EMListUnsubscribeDetector

+ (uint64_t)_validateHeaders:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  objc_opt_self();
  objc_msgSend(v17, "encodedHeaders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  EMRecodeDataToNetwork(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v22 = 0;
    v16 = objc_alloc_init(MEMORY[0x1E0D1E6B0]);
    objc_msgSend(v16, "verificationContextForMessageData:error:", v3, &v22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v22;
    v6 = v5;
    v7 = 2;
    if (v4 && !v5)
    {
      objc_msgSend(v4, "dkimSignatureHeaders");
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v19;
        v11 = *MEMORY[0x1E0D1E598];
        v12 = *MEMORY[0x1E0D1E5A0];
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "signedHeaderFields");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "containsObject:", v11)
              && (objc_msgSend(v14, "containsObject:", v12) & 1) != 0)
            {

              if (objc_msgSend(v16, "verifyMessageWithContext:options:error:", v4, 1, 0))
                v7 = 1;
              else
                v7 = 2;
              goto LABEL_19;
            }

          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          if (v9)
            continue;
          break;
        }
      }

      v7 = 2;
LABEL_19:

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int64_t)unsubscribeTypeForHeader:(id)a3
{
  id v3;
  _EMUnsubscribeInfo *v4;
  NSURL *postURL;
  int64_t v6;
  BOOL v7;
  uint64_t v8;
  int64_t v9;

  v3 = a3;
  v4 = -[_EMUnsubscribeInfo initWithHeaders:]([_EMUnsubscribeInfo alloc], "initWithHeaders:", v3);
  if (v4)
  {
    postURL = v4->_postURL;
    v6 = v4->_mailtoURL != 0;
    v7 = postURL == 0;
    if (postURL)
      v8 = v6 | 2;
    else
      v8 = v4->_mailtoURL != 0;
    if (!v7)
      v6 |= 6uLL;
    if (v4->_postContent)
      v9 = v6;
    else
      v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)validatedUnsubscribeTypeForHeader:(id)a3
{
  id v3;
  _EMUnsubscribeInfo *v4;
  _EMUnsubscribeInfo *v5;
  NSURL *postURL;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = -[_EMUnsubscribeInfo initWithHeaders:]([_EMUnsubscribeInfo alloc], "initWithHeaders:", v3);
  v5 = v4;
  if (!v4)
    goto LABEL_15;
  postURL = v4->_postURL;
  v7 = v4->_mailtoURL != 0;
  v8 = postURL ? v7 | 2 : v4->_mailtoURL != 0;
  if (v4->_postContent)
  {
    v8 = postURL ? v7 | 6 : v4->_mailtoURL != 0;
    if (postURL && (v8 & 2) != 0)
    {
      v10 = +[EMListUnsubscribeDetector _validateHeaders:]((uint64_t)EMListUnsubscribeDetector, v3);
      if (!v10)
      {
        v11 = 0;
        goto LABEL_17;
      }
      if (v10 == 2)
LABEL_15:
        v8 = 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v11;
}

- (EMListUnsubscribeDetector)initWithMutableDictionary:(id)a3
{
  id v6;
  EMListUnsubscribeDetector *v7;
  EMListUnsubscribeDetector *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMListUnsubscribeDetector.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  v11.receiver = self;
  v11.super_class = (Class)EMListUnsubscribeDetector;
  v7 = -[EMListUnsubscribeDetector init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_persistentDictionary, a3);

  return v8;
}

- (EMListUnsubscribeDetector)init
{
  void *v3;
  EMListUnsubscribeDetector *v4;

  +[EMUbiquitouslyPersistedDictionary sharedDictionaryWithIdentifier:](EMUbiquitouslyPersistedDictionary, "sharedDictionaryWithIdentifier:", CFSTR("com.apple.mail.listUnsubscribeInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[EMListUnsubscribeDetector initWithMutableDictionary:](self, "initWithMutableDictionary:", v3);

  return v4;
}

- (id)commandForMessage:(id)a3 mailToOnly:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  _EMUnsubscribeInfo *v19;
  _EMUnsubscribeInfo *v20;
  NSString *postContent;
  NSURL *postURL;
  NSURL *mailtoURL;
  void *v24;
  NSURL *v25;
  NSString *v26;
  NSURL *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  NSURL *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  NSURL *v37;
  _BOOL8 v38;
  uint64_t v39;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  uint8_t buf[24];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "headers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[EMListUnsubscribeDetector shouldIgnoreMessageWithHeaders:](self, "shouldIgnoreMessageWithHeaders:", v7))
  {
    objc_msgSend((id)objc_opt_class(), "receivingAccountFromMessage:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deliveryAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v8 = 0;
LABEL_44:

      goto LABEL_45;
    }
    if (a4)
    {
      v11 = 0;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0D1EEC0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __58__EMListUnsubscribeDetector_commandForMessage_mailToOnly___block_invoke;
      v43[3] = &unk_1E70F3970;
      v44 = v7;
      objc_msgSend(v12, "futureWithBlock:", v43);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resultWithTimeout:error:", 0, 3.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v11 = objc_msgSend(v14, "integerValue") == 1;
      }
      else
      {
        EMLogCategoryMessageLoading();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[EMListUnsubscribeDetector commandForMessage:mailToOnly:].cold.1(v18, (uint64_t)v6, buf, v16);
        }

        v11 = 0;
      }

    }
    objc_msgSend(v7, "firstHeaderForKey:", *MEMORY[0x1E0D1E590]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[_EMUnsubscribeInfo initWithHeaders:]([_EMUnsubscribeInfo alloc], "initWithHeaders:", v7);
    v20 = v19;
    if (v19)
    {
      postContent = v19->_postContent;
      postURL = v19->_postURL;
      mailtoURL = v19->_mailtoURL;
      if (!v11)
        goto LABEL_30;
    }
    else
    {
      postContent = 0;
      postURL = 0;
      mailtoURL = 0;
      if (!v11)
        goto LABEL_30;
    }
    if (postContent && postURL)
    {
      objc_msgSend(v7, "firstSenderAddress");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v25 = v20->_postURL;
        v26 = v20->_postContent;
        v27 = v20->_postURL;
        v28 = v20->_mailtoURL != 0;
        v29 = v27 == 0;
        if (v27)
          v30 = v28 | 2;
        else
          v30 = v20->_mailtoURL != 0;
        if (!v29)
          v28 |= 6uLL;
        if (v20->_postContent)
          v31 = v28;
        else
          v31 = v30;
      }
      else
      {
        v26 = 0;
        v25 = 0;
        v31 = 0;
      }
      +[EMListUnsubscribeCommand oneClickUnsubscribeCommandWithListID:sender:URL:postContent:headerUnsubscribeTypes:](EMListUnsubscribeCommand, "oneClickUnsubscribeCommandWithListID:sender:URL:postContent:headerUnsubscribeTypes:", v42, v24, v25, v26, v31);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
LABEL_30:
    if (!mailtoURL)
    {
      v8 = 0;
      goto LABEL_43;
    }
    if (v19)
      v32 = v19->_mailtoURL;
    else
      v32 = 0;
    +[EMMailToURLComponents componentsWithURL:](EMMailToURLComponents, "componentsWithURL:", v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "toRecipients");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count") == 0;

    if (v34)
    {
      v8 = 0;
      goto LABEL_42;
    }
    objc_msgSend(v24, "toRecipients");
    v25 = (NSURL *)objc_claimAutoreleasedReturnValue();
    -[NSURL objectAtIndexedSubscript:](v25, "objectAtIndexedSubscript:", 0);
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstSenderAddress");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "subject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "body");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v37 = v20->_postURL;
      v38 = v20->_mailtoURL != 0;
      v39 = v38 | 2;
      if (!v37)
        v39 = v20->_mailtoURL != 0;
      if (v20->_postContent)
      {
        v39 = v38 | 6;
        if (!v37)
          v39 = v20->_mailtoURL != 0;
      }
    }
    else
    {
      v39 = 0;
    }
    +[EMListUnsubscribeCommand mailtoUnsubscribeCommandWithListID:address:sender:subject:body:account:headerUnsubscribeTypes:](EMListUnsubscribeCommand, "mailtoUnsubscribeCommandWithListID:address:sender:subject:body:account:headerUnsubscribeTypes:", v42, v26, v41, v35, v36, v9, v39);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_41:
LABEL_42:

LABEL_43:
    goto LABEL_44;
  }
  v8 = 0;
LABEL_45:

  return v8;
}

uint64_t __58__EMListUnsubscribeDetector_commandForMessage_mailToOnly___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[EMListUnsubscribeDetector _validateHeaders:]((uint64_t)EMListUnsubscribeDetector, *(void **)(a1 + 32)));
}

- (id)commandForMessage:(id)a3
{
  -[EMListUnsubscribeDetector commandForMessage:mailToOnly:](self, "commandForMessage:mailToOnly:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)acceptCommand:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMListUnsubscribeDetector.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("command"));

    v5 = 0;
  }
  -[EMListUnsubscribeDetector _persistentKeyForHeaders:](self, "_persistentKeyForHeaders:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[EMMutableDictionaryProtocol setObject:forKey:](self->_persistentDictionary, "setObject:forKey:", CFSTR("accepted"), v6);

}

- (void)ignoreCommand:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMListUnsubscribeDetector.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("command"));

    v5 = 0;
  }
  -[EMListUnsubscribeDetector _persistentKeyForHeaders:](self, "_persistentKeyForHeaders:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[EMMutableDictionaryProtocol setObject:forKey:](self->_persistentDictionary, "setObject:forKey:", CFSTR("ignored"), v6);

}

- (void)removeAllPersistedCommands
{
  -[EMMutableDictionaryProtocol removeAllObjects](self->_persistentDictionary, "removeAllObjects");
}

- (id)_normalizedAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^[^<>]*<([^>]+)>\\s*$|^(.+)$"), 8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), CFSTR("$1$2"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1E450], "idnaEncodedAddressForAddress:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v7, "length") > 0x3E)
    {
      objc_msgSend(v7, "substringToIndex:", 62);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v7;
    }
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_listIDString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EMListUnsubscribeDetector _normalizedAddress:](self, "_normalizedAddress:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("L:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_senderString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EMListUnsubscribeDetector _normalizedAddress:](self, "_normalizedAddress:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("S:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_persistentKeyForHeaders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    -[EMListUnsubscribeDetector _listIDString:](self, "_listIDString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "length"))
    {
      v8 = 0;
      goto LABEL_6;
    }
    -[EMListUnsubscribeDetector _senderString:](self, "_senderString:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_6:

  return v8;
}

- (BOOL)shouldIgnoreMessageWithHeaders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "firstHeaderForKey:", *MEMORY[0x1E0D1E590]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMListUnsubscribeDetector _listIDString:](self, "_listIDString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "firstSenderAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMListUnsubscribeDetector _senderString:](self, "_senderString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[EMMutableDictionaryProtocol objectForKey:](self->_persistentDictionary, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      || (-[EMMutableDictionaryProtocol objectForKey:](self->_persistentDictionary, "objectForKey:", v9),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ((objc_msgSend(v10, "isEqual:", CFSTR("accepted")) & 1) != 0)
        v11 = 1;
      else
        v11 = objc_msgSend(v10, "isEqual:", CFSTR("ignored"));
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (id)receivingAccountFromMessage:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EF25F868);

  if (v5)
  {
    objc_msgSend(v3, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentDictionary, 0);
}

- (void)commandForMessage:(uint8_t *)buf mailToOnly:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "<%{public}@> Timeout validating headers for: %@", buf, 0x16u);

}

@end
