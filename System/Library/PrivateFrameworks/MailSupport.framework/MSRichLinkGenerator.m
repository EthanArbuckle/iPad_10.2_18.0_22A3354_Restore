@implementation MSRichLinkGenerator

+ (MSRichLinkGenerator)linkGenerator
{
  if (linkGenerator_onceToken[0] != -1)
    dispatch_once(linkGenerator_onceToken, &__block_literal_global_9);
  return (MSRichLinkGenerator *)(id)linkGenerator_linkGenerator;
}

void __36__MSRichLinkGenerator_linkGenerator__block_invoke()
{
  MSRichLinkGenerator *v0;
  void *v1;

  v0 = objc_alloc_init(MSRichLinkGenerator);
  v1 = (void *)linkGenerator_linkGenerator;
  linkGenerator_linkGenerator = (uint64_t)v0;

}

+ (NSString)titleConvertToRichLink
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)titleConvertToPlainLink
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)titleOpenLink
{
  return (NSString *)_EFLocalizedString();
}

- (void)createRichLinkWithURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  if (createRichLinkWithURL_completionHandler__onceToken[0] != -1)
    dispatch_once(createRichLinkWithURL_completionHandler__onceToken, &__block_literal_global_6_0);
  objc_msgSend(v5, "ef_urlByAddingSchemeIfNeeded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(NSClassFromString(CFSTR("LPMetadataProvider")));
  objc_msgSend(v8, "setTimeout:", 5.0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__MSRichLinkGenerator_createRichLinkWithURL_completionHandler___block_invoke_2;
  v11[3] = &unk_1E716E3D0;
  v9 = v7;
  v12 = v9;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v8, "startFetchingMetadataForURL:completionHandler:", v9, v11);

}

void *__63__MSRichLinkGenerator_createRichLinkWithURL_completionHandler___block_invoke()
{
  return dlopen("/System/Library/Frameworks/LinkPresentation.framework/LinkPresentation", 2);
}

void __63__MSRichLinkGenerator_createRichLinkWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MSRichLinkGenerator_createRichLinkWithURL_completionHandler___block_invoke_3;
  block[3] = &unk_1E716E3A8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __63__MSRichLinkGenerator_createRichLinkWithURL_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v35 = (id)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("LPLinkHTMLTextGenerator"))), "initWithURL:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v35, "setMetadata:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v35, "HTMLFragmentString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "icon");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v34 = v6;
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "imageMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "iconMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  v33 = v11;
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    _EFLocalizedString();
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  objc_msgSend(v17, "pathExtension");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsSeparatedByCharactersInSet:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && (objc_msgSend(v18, "isEqualToString:", v21) & 1) == 0)
  {
    objc_msgSend(v17, "stringByDeletingPathExtension");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingPathExtension:", v21);
    v23 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v23;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "absoluteString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ef_stringByEscapingForXML");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27 && objc_msgSend(v2, "containsString:", v27))
    {
      objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", v27, v25);
      v28 = v2;
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_msgSend(v2, "containsString:", CFSTR("class=\"lp-rich-link-mediaImage\")) & 1) != 0)
      {
        v29 = CFSTR("class=\"lp-rich-link-mediaImage\");
      }
      else if ((objc_msgSend(v2, "containsString:", CFSTR("class=\"lp-rich-link-captionBar-rightIcon\")) & 1) != 0)
      {
        v29 = CFSTR("class=\"lp-rich-link-captionBar-rightIcon\");
      }
      else
      {
        if (!objc_msgSend(v2, "containsString:", CFSTR("class=\"lp-rich-link-captionBar-leftIcon\")))
        {
          v28 = v7;
          v7 = 0;
          goto LABEL_25;
        }
        v29 = CFSTR("class=\"lp-rich-link-captionBar-leftIcon\");
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ id=\"%@\"), v29, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", v29, v28);
      v30 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v30;
    }
LABEL_25:

    goto LABEL_26;
  }
  v25 = 0;
LABEL_26:
  v31 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v34, "MIMEType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void *, void *, void *))(v31 + 16))(v31, v2, v7, v17, v32, v25);

}

@end
