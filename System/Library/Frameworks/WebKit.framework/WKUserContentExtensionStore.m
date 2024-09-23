@implementation WKUserContentExtensionStore

void __111___WKUserContentExtensionStore_compileContentExtensionForIdentifier_encodedContentExtension_completionHandler___block_invoke(uint64_t a1, void *a2, NSError *a3)
{
  id v4;
  uint64_t v6;
  uint64_t v7;

  v4 = a2;
  if (a2)
    v4 = -[_WKUserContentFilter _initWithWKContentRuleList:]([_WKUserContentFilter alloc], "_initWithWKContentRuleList:", a2);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = toUserContentRuleListStoreError((uint64_t)a3);
  (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v4, v7);
  if (v4)
    CFRelease(v4);
}

void __86___WKUserContentExtensionStore_lookupContentExtensionForIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, NSError *a3)
{
  id v4;
  uint64_t v6;
  uint64_t v7;

  v4 = a2;
  if (a2)
    v4 = -[_WKUserContentFilter _initWithWKContentRuleList:]([_WKUserContentFilter alloc], "_initWithWKContentRuleList:", a2);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = toUserContentRuleListStoreError((uint64_t)a3);
  (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v4, v7);
  if (v4)
    CFRelease(v4);
}

uint64_t __86___WKUserContentExtensionStore_removeContentExtensionForIdentifier_completionHandler___block_invoke(uint64_t a1, NSError *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = toUserContentRuleListStoreError((uint64_t)a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

@end
