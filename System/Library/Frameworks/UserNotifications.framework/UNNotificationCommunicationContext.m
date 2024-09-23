@implementation UNNotificationCommunicationContext

id __77___UNNotificationCommunicationContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  const __CFString *v36;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "un_logDigest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("identifier"));

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "associatedObjectUri");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "un_logDigest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "appendObject:withName:", v8, CFSTR("associatedObjectUri"));

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v10, "appendObject:withName:", v11, CFSTR("bundleIdentifier"));

  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "un_logDigest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v13, "appendObject:withName:", v15, CFSTR("displayName"));

  v17 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "recipients");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendArraySection:withName:skipIfEmpty:", v18, CFSTR("recipients"), 1);

  v19 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sender");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v19, "appendObject:withName:", v20, CFSTR("sender"));

  v22 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v22, "appendObject:withName:", v23, CFSTR("contentURL"));

  v25 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "imageName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v25, "appendObject:withName:", v26, CFSTR("imageName"));

  v28 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSystemImage"), CFSTR("isSystemImage"));
  v29 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "mentionsCurrentUser"), CFSTR("mentionsCurrentUser"));
  v30 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "notifyRecipientAnyway"), CFSTR("notifyRecipientAnyway"));
  v31 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isReplyToCurrentUser"), CFSTR("isReplyToCurrentUser"));
  v32 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "recipientCount"), CFSTR("recipientCount"));
  v33 = *(void **)(a1 + 32);
  v34 = objc_msgSend(*(id *)(a1 + 40), "capabilities");
  v35 = &stru_1E57F06A0;
  if (!v34)
    v35 = CFSTR("Unspecified");
  if ((v34 & 1) != 0)
    v36 = CFSTR("Video");
  else
    v36 = v35;
  objc_msgSend(v33, "appendString:withName:", v36, CFSTR("capabilities"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isBusinessCorrespondence"), CFSTR("isBusinessCorrespondence"));
}

@end
