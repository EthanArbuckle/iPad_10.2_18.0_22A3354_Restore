@implementation CNVisualSimilarity(ContactsUI)

+ (id)fingerprintForUIImage:()ContactsUI
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0CEDF70];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "CGImage");

  v9 = (void *)objc_msgSend(v6, "initWithCGImage:options:", v8, MEMORY[0x1E0C9AA70]);
  objc_msgSend(a1, "fingerprintForImageRequestHandler:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
