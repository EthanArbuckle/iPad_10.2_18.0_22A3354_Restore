@implementation NSAttributedString(NSAttributedStringWebKitAdditions)

+ (uint64_t)loadFromHTMLWithRequest:()NSAttributedStringWebKitAdditions options:completionHandler:
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __107__NSAttributedString_NSAttributedStringWebKitAdditions__loadFromHTMLWithRequest_options_completionHandler___block_invoke;
  v5[3] = &unk_1E34BAE68;
  v5[4] = a3;
  return objc_msgSend(a1, "_loadFromHTMLWithOptions:contentLoader:completionHandler:", a4, v5);
}

+ (uint64_t)loadFromHTMLWithFileURL:()NSAttributedStringWebKitAdditions options:completionHandler:
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __107__NSAttributedString_NSAttributedStringWebKitAdditions__loadFromHTMLWithFileURL_options_completionHandler___block_invoke;
  v5[3] = &unk_1E34BAE90;
  v5[4] = a4;
  v5[5] = a3;
  return objc_msgSend(a1, "_loadFromHTMLWithOptions:contentLoader:completionHandler:", a4, v5);
}

+ (uint64_t)loadFromHTMLWithString:()NSAttributedStringWebKitAdditions options:completionHandler:
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __106__NSAttributedString_NSAttributedStringWebKitAdditions__loadFromHTMLWithString_options_completionHandler___block_invoke;
  v5[3] = &unk_1E34BAE90;
  v5[4] = a4;
  v5[5] = a3;
  return objc_msgSend(a1, "_loadFromHTMLWithOptions:contentLoader:completionHandler:", a4, v5);
}

+ (uint64_t)loadFromHTMLWithData:()NSAttributedStringWebKitAdditions options:completionHandler:
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __104__NSAttributedString_NSAttributedStringWebKitAdditions__loadFromHTMLWithData_options_completionHandler___block_invoke;
  v5[3] = &unk_1E34BAE90;
  v5[4] = a4;
  v5[5] = a3;
  return objc_msgSend(a1, "_loadFromHTMLWithOptions:contentLoader:completionHandler:", a4, v5);
}

@end
