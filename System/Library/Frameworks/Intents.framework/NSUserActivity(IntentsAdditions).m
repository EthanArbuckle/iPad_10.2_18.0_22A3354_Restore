@implementation NSUserActivity(IntentsAdditions)

- (uint64_t)shortcutAvailability
{
  void *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = 0;
  objc_msgSend(a1, "_payloadForIdentifier:", CFSTR("UAINShortcutAvailabilityOptionsPayload"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  if (objc_msgSend(v1, "length") == 8)
  {
    objc_msgSend(v1, "getBytes:length:", &v4, 8);
    v2 = v4;
  }

  return v2;
}

- (id)suggestedInvocationPhrase
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_payloadForIdentifier:", CFSTR("UAINSuggestedInvocationPhrasePayload"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v1, 4);
  else
    v2 = 0;

  return v2;
}

- (id)interaction
{
  void *v2;
  void *v3;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_objectForIdentifier:", CFSTR("UAINInteractionPayload"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "_payloadForIdentifier:", CFSTR("UAINInteractionPayload"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_3;
    v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "_in_safeUnarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    if (v5)
    {
      v6 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v9 = "-[NSUserActivity(IntentsAdditions) interaction]";
        v10 = 2112;
        v11 = v5;
        _os_log_error_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_ERROR, "%s Unable to unarchive interactionPayloadData with error: %@", buf, 0x16u);
      }
    }

    if (!v2)
    {
      v3 = 0;
      goto LABEL_3;
    }
  }
  INTypedInteractionWithInteraction(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_3:
  objc_msgSend(a1, "_setAccessedInteraction:", 1);
  return v3;
}

- (void)_setAccessedInteraction:()IntentsAdditions
{
  const void *v2;
  id v3;

  v2 = (const void *)_accessedInteractionPropertyKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);

}

- (void)_initWithIntent:()IntentsAdditions
{
  id v4;
  void *v5;
  void *v6;
  INInteraction *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "_className");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(a1, "initWithActivityType:", v5);

  if (v6)
  {
    v7 = -[INInteraction initWithIntent:response:]([INInteraction alloc], "initWithIntent:response:", v4, 0);
    -[INInteraction setIntentHandlingStatus:](v7, "setIntentHandlingStatus:", 5);
    objc_msgSend(v6, "_setInteraction:donate:", v7, 0);
    objc_msgSend(v6, "_setExecutionContext:", objc_msgSend(v4, "_executionContext"));
    v8 = v6;

  }
  return v6;
}

- (id)_appIntent
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_objectForIdentifier:", CFSTR("UAINAppIntentPayload"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "_payloadForIdentifier:", CFSTR("UAINAppIntentPayload"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v7 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "_in_safeUnarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v7);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v7;
      if (v4)
      {
        v5 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v9 = "-[NSUserActivity(IntentsAdditions) _appIntent]";
          v10 = 2112;
          v11 = v4;
          _os_log_error_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_ERROR, "%s Unable to unarchive interactionPayloadData with error: %@", buf, 0x16u);
        }
      }

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (uint64_t)_setAppIntent:()IntentsAdditions
{
  if (a3)
    return objc_msgSend(a1, "_setPayloadIdentifier:object:withBlock:", CFSTR("UAINAppIntentPayload"), a3, &__block_literal_global_16923);
  else
    return objc_msgSend(a1, "_setPayload:object:identifier:", 0, 0, CFSTR("UAINAppIntentPayload"));
}

- (void)_setInteraction:()IntentsAdditions donate:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v10 = v6;
  if (v6)
  {
    objc_msgSend(v6, "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    INIssueSandboxExtensionsForFileURLEnumerable(v7);

    objc_msgSend(v10, "intentResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      INIssueSandboxExtensionsForFileURLEnumerable(v8);
    if (a4)
      objc_msgSend(v10, "donateInteractionWithCompletion:", 0);
    objc_msgSend(a1, "_setPayloadIdentifier:object:withBlock:", CFSTR("UAINInteractionPayload"), v10, &__block_literal_global_15);

  }
  else
  {
    objc_msgSend(a1, "_setPayload:object:identifier:", 0, 0, CFSTR("UAINInteractionPayload"));
  }

}

- (BOOL)_hasInteraction
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_payloadForIdentifier:", CFSTR("UAINInteractionPayload"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "length") != 0;

  return v2;
}

- (uint64_t)_accessedInteraction
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, (const void *)_accessedInteractionPropertyKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)setInteraction:()IntentsAdditions
{
  return objc_msgSend(a1, "_setInteraction:donate:", a3, 1);
}

- (void)setSuggestedInvocationPhrase:()IntentsAdditions
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setPayload:object:identifier:", v5, v4, CFSTR("UAINSuggestedInvocationPhrasePayload"));

}

- (void)setShortcutAvailability:()IntentsAdditions
{
  void *v4;
  uint64_t v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v5, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setPayload:object:identifier:", v4, 0, CFSTR("UAINShortcutAvailabilityOptionsPayload"));

}

- (id)_intentsIdentifier
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_payloadForIdentifier:", CFSTR("UAIntentsIdentifierPayload"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_7;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "_in_safeUnarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (v4)
  {
    v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[NSUserActivity(IntentsAdditions) _intentsIdentifier]";
      v15 = 2112;
      v16 = v4;
      _os_log_error_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_ERROR, "%s Unable to unarchive intentsIdentifier with error: %@", buf, 0x16u);
    }
  }

  if (v3)
  {
    v6 = v2;
  }
  else
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;

    if (v8)
    {
      v9 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[NSUserActivity(IntentsAdditions) _intentsIdentifier]";
        v15 = 2112;
        v16 = v8;
        _os_log_error_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_ERROR, "%s Unable to archive intentsIdentifierPayload with error: %@", buf, 0x16u);
      }
    }
    objc_msgSend(a1, "_setPayload:object:identifier:", v6, v3, CFSTR("UAIntentsIdentifierPayload"));

  }
  return v3;
}

- (void)_intentsPrepareForEncoding
{
  id v2;
  void *v3;
  id v4;

  v2 = (id)objc_msgSend(a1, "_intentsIdentifier");
  objc_msgSend(a1, "interaction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "_setInteraction:donate:", 0, 0);
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setPayload:object:identifier:", v3, v4, CFSTR("UAINInteractionPayload"));

  }
}

- (void)_setExecutionContext:()IntentsAdditions
{
  void *v4;
  uint64_t v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v5, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setPayload:object:identifier:", v4, 0, CFSTR("_UAINExecutionContextPayload"));

}

- (uint64_t)_executionContext
{
  void *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = 0;
  objc_msgSend(a1, "_payloadForIdentifier:", CFSTR("_UAINExecutionContextPayload"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  if (objc_msgSend(v1, "length") == 8)
  {
    objc_msgSend(v1, "getBytes:length:", &v4, 8);
    v2 = v4;
  }

  return v2;
}

- (id)_intents_copy
{
  void *v1;
  void *v2;

  INUserActivitySerializeToData(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  INUserActivityDeserializeFromData(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
