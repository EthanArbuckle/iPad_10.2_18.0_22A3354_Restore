@implementation WKWebExtension

void __69___WKWebExtension_extensionWithAppExtensionBundle_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v5 = 0;
  v2 = API::Object::newObject(0x160uLL, 110);
  WebKit::WebExtension::WebExtension(v2, *(void **)(a1 + 32), &v5);
  v3 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
    if (!v2)
      return;
  }
  else
  {
    WebKit::WebExtension::wrapper((id *)v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

    if (!v2)
      return;
  }
  CFRelease(*(CFTypeRef *)(v2 + 8));
}

void __66___WKWebExtension_extensionWithResourceBaseURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v5 = 0;
  v2 = API::Object::newObject(0x160uLL, 110);
  WebKit::WebExtension::WebExtension(v2, *(void **)(a1 + 32), &v5);
  v3 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
    if (!v2)
      return;
  }
  else
  {
    WebKit::WebExtension::wrapper((id *)v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v3 + 16))(v3, v4, 0);

    if (!v2)
      return;
  }
  CFRelease(*(CFTypeRef *)(v2 + 8));
}

@end
