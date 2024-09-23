@implementation WKWebExtensionDeclarativeNetRequestRule

id __77___WKWebExtensionDeclarativeNetRequestRule_removeInvalidResourceTypesForKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_chromeResourceTypeToWebKitResourceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __113___WKWebExtensionDeclarativeNetRequestRule__webKitRuleWithWebKitActionType_chromeActionType_chromeResourceTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("replaceOnly"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("replace-only"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("replaceOnly"));

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

id __113___WKWebExtensionDeclarativeNetRequestRule__webKitRuleWithWebKitActionType_chromeActionType_chromeResourceTypes___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __113___WKWebExtensionDeclarativeNetRequestRule__webKitRuleWithWebKitActionType_chromeActionType_chromeResourceTypes___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("*")) & 1) == 0)
  {
    objc_msgSend(CFSTR("*"), "stringByAppendingString:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  return v3;
}

id __90___WKWebExtensionDeclarativeNetRequestRule__convertedResourceTypesForChromeResourceTypes___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
