@implementation UIImagePickerController(MessageUI)

+ (id)mf_systemImagePickerWithSourceType:()MessageUI
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3880]);
  objc_msgSend(v4, "setSourceType:", a3);
  objc_msgSend(MEMORY[0x1E0DC3880], "availableMediaTypesForSourceType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaTypes:", v5);

  objc_msgSend(v4, "setAllowsEditing:", 0);
  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "_properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDictionary:", v7);

  v9 = *MEMORY[0x1E0C9AE50];
  objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0DC5948]);
  objc_msgSend(v8, "setObject:forKey:", v9, *MEMORY[0x1E0DC5870]);
  objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x1E0C89E78], *MEMORY[0x1E0DC5940]);
  objc_msgSend(v4, "_setProperties:", v8);
  objc_msgSend(v4, "_setImagePickerSavingOptions:", 6);
  objc_msgSend(v4, "_setConvertAutoloopsToGIF:", 1);

  return v4;
}

@end
