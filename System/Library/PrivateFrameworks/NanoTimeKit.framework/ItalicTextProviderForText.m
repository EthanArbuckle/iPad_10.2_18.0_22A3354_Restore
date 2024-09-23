@implementation ItalicTextProviderForText

id ___ItalicTextProviderForText_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = 0;
  if (v6 && !a3)
  {
    v8 = a4;
    if (objc_msgSend(v8, "uppercase"))
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uppercaseStringWithLocale:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v10;
    }
    v11 = (void *)MEMORY[0x1E0C944D0];
    objc_msgSend(v8, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "font");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "pointSize");
    objc_msgSend(v11, "fontWithDescriptor:size:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *MEMORY[0x1E0DC1138];
    v20[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v17);

  }
  return v7;
}

@end
