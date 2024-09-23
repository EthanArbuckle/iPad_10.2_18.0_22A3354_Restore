@implementation NSAttributedString(WKPrivate)

+ (void)_loadFromHTMLWithOptions:()WKPrivate contentLoader:completionHandler:
{
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA188]);
  v10 = (_QWORD *)MEMORY[0x1E0C99778];
  if (v9)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("NSWebPreferencesDocumentOption option is not supported"));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA190]))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v10, CFSTR("NSWebResourceLoadDelegateDocumentOption option is not supported"));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WebPolicyDelegate")))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v10, CFSTR("WebPolicyDelegate option is not supported"));
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", MEMORY[0x1E0C809B0], 3221225472, __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke, &unk_1E34BAE40, a3, a1, a5, a4))__90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke((uint64_t)&v11);
  else
    dispatch_async(MEMORY[0x1E0C80D38], &v11);
}

@end
