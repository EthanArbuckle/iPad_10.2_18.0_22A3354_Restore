@implementation WKWebExtensionWebNavigationURLFilter

void __76___WKWebExtensionWebNavigationURLFilter_initWithDictionary_outErrorMessage___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  _WKWebExtensionWebNavigationURLPredicate *v9;
  uint64_t v10;
  _WKWebExtensionWebNavigationURLPredicate *v11;
  id obj;

  v7 = a2;
  v8 = a3;
  v9 = [_WKWebExtensionWebNavigationURLPredicate alloc];
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v10 + 40);
  v11 = -[_WKWebExtensionWebNavigationURLPredicate initWithTypeString:value:outErrorMessage:](v9, "initWithTypeString:value:outErrorMessage:", v7, v8, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
  else
    *a4 = 1;

}

@end
