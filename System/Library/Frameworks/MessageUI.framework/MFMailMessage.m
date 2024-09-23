@implementation MFMailMessage

uint64_t __93__MFMailMessage_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "writableTypeIdentifiersForItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93__MFMailMessage_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E5A690D0;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "ef_any:", v6);

  return v4;
}

uint64_t __93__MFMailMessage_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToType:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
