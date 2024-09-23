@implementation UIDocumentPickerViewController(SFManagedSourceSupport)

+ (id)sf_documentPickerViewControllerWithURL:()SFManagedSourceSupport inMode:sourceURL:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = objc_alloc(MEMORY[0x1E0DC3730]);
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithURLs:inMode:", v10, a4);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setIsContentManaged:", objc_msgSend(v12, "isURLManaged:", v8));

    v13 = v11;
  }

  return v11;
}

@end
