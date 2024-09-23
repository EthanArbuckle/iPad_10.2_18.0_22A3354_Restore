@implementation UNNotificationContact

id __64___UNNotificationContact_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "un_logDigest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("handle"));

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "handleType"), CFSTR("handleType"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, CFSTR("serviceName"));

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "un_logDigest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v10, "appendObject:withName:", v12, CFSTR("displayName"));

  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isDisplayNameSuggested"), CFSTR("isDisplayNameSuggested"));
  v15 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "customIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "un_logDigest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v15, "appendObject:withName:", v17, CFSTR("customIdentifier"));

  v19 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cnContactIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v19, "appendObject:withName:", v20, CFSTR("cnContactIdentifier"));

  v22 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cnContactFullname");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "un_logDigest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v22, "appendObject:withName:", v24, CFSTR("cnContactFullname"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isCNContactIdentifierSuggested"), CFSTR("isCNContactIdentifierSuggested"));
}

@end
