@implementation PDFMarkupMenuString

void __PDFMarkupMenuString_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];
  _QWORD v10[8];

  v10[7] = *MEMORY[0x24BDAC8D0];
  v9[0] = &unk_24C27D790;
  PDFKitLocalizedString(CFSTR("Yellow"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v0;
  v9[1] = &unk_24C27D7A8;
  PDFKitLocalizedString(CFSTR("Green"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v1;
  v9[2] = &unk_24C27D7C0;
  PDFKitLocalizedString(CFSTR("Blue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v2;
  v9[3] = &unk_24C27D7D8;
  PDFKitLocalizedString(CFSTR("Pink"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v3;
  v9[4] = &unk_24C27D7F0;
  PDFKitLocalizedString(CFSTR("Purple"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v4;
  v9[5] = &unk_24C27D808;
  PDFKitLocalizedString(CFSTR("Underline"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v5;
  v9[6] = &unk_24C27D820;
  PDFKitLocalizedString(CFSTR("Strikethrough"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[6] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)PDFMarkupMenuString_menuIconStrings;
  PDFMarkupMenuString_menuIconStrings = v7;

}

@end
