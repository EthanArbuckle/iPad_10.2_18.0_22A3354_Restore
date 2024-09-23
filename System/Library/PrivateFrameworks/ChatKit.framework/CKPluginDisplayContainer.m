@implementation CKPluginDisplayContainer

+ (id)pluginDisplayContainerWithPluginPayload:(id)a3 composeImage:(id)a4
{
  id v5;
  id v6;
  CKPluginDisplayContainer *v7;
  NSObject *v8;
  uint8_t v10[16];

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = objc_alloc_init(CKPluginDisplayContainer);
    -[CKPluginDisplayContainer setPluginPayload:](v7, "setPluginPayload:", v5);
    -[CKPluginDisplayContainer setComposeImage:](v7, "setComposeImage:", v6);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "can't create a CKPluginDisplayContainer with a nil payload", v10, 2u);
      }

    }
    v7 = 0;
  }

  return v7;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  id v5;
  void *v6;
  void *v7;
  UIImage *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPluginDisplayContainer pluginPayload](self, "pluginPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPluginDisplayContainer composeImage](self, "composeImage");
  v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
  if (v7
    && (objc_msgSend(v7, "pluginBundleID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D375F8]),
        v9,
        v10))
  {
    objc_msgSend(v7, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "url");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_alloc(MEMORY[0x1E0CB3498]);
      v15 = v14;
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithString:", v16);
        objc_msgSend(v6, "addObject:", v17);

      }
      else
      {
        v16 = (void *)objc_msgSend(v14, "initWithString:", v13);
        objc_msgSend(v6, "addObject:", v16);
      }

    }
  }
  else if (v8)
  {
    v18 = objc_alloc(MEMORY[0x1E0DC12B0]);
    UIImagePNGRepresentation(v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithData:ofType:", v19, *MEMORY[0x1E0CA5C10]);

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    if (v7)
    {
      v28 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v28;
      if (v23)
      {
        objc_msgSend(v22, "addAttribute:value:range:", CFSTR("com.apple.MobileSMS.PluginPayload"), v23, 0, objc_msgSend(v22, "length"));
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v24, "localizedDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v30 = v26;
          _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Failed to archive plugin display container on copy with error: %@", buf, 0xCu);

        }
      }

    }
    objc_msgSend(v6, "addObject:", v22);

  }
  return v6;
}

- (id)urlForPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35768]), "initWithPluginPayload:", v3);
  if (objc_msgSend(MEMORY[0x1E0D35768], "isPayloadServiceManatee:", v3))
  {
    v5 = (void *)MEMORY[0x1E0D35768];
    objc_msgSend(v3, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D35768];
    objc_msgSend(v4, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastAddressedHandleIDFromChat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLForDugongShareURL:handle:payload:", v6, v9, v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)_registerItemProvider:(id)a3 forURL:(id)a4 withPluginPayload:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isRichLinkImprovementsEnabled");

  v12 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    if (v11)
    {
      objc_msgSend(v9, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)MEMORY[0x1E0CC11D8];
        objc_msgSend(v9, "data");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attachments");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "linkWithDataRepresentation:attachments:", v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "metadata");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *MEMORY[0x1E0CC1108];
        v29[0] = v12;
        v29[1] = 3221225472;
        v29[2] = __75__CKPluginDisplayContainer__registerItemProvider_forURL_withPluginPayload___block_invoke;
        v29[3] = &unk_1E274B9C8;
        v30 = v18;
        v20 = v18;
        objc_msgSend(v7, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v19, 0, v29);

      }
    }
  }
  v21 = *MEMORY[0x1E0CA5C90];
  v27[0] = v12;
  v27[1] = 3221225472;
  v27[2] = __75__CKPluginDisplayContainer__registerItemProvider_forURL_withPluginPayload___block_invoke_2;
  v27[3] = &unk_1E274B9C8;
  v22 = v8;
  v28 = v22;
  objc_msgSend(v7, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v21, 0, v27);
  v23 = *MEMORY[0x1E0CA5CA0];
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __75__CKPluginDisplayContainer__registerItemProvider_forURL_withPluginPayload___block_invoke_3;
  v25[3] = &unk_1E274B9C8;
  v26 = v22;
  v24 = v22;
  objc_msgSend(v7, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v23, 0, v25);

}

uint64_t __75__CKPluginDisplayContainer__registerItemProvider_forURL_withPluginPayload___block_invoke(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))a2)[2](v4, v5, 0);

  return 0;
}

uint64_t __75__CKPluginDisplayContainer__registerItemProvider_forURL_withPluginPayload___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4, 0);

  return 0;
}

uint64_t __75__CKPluginDisplayContainer__registerItemProvider_forURL_withPluginPayload___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v5, 0);

  return 0;
}

- (id)pasteboardItemProvider
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  UIImage *v9;
  NSObject *p_super;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[CKPluginDisplayContainer pluginPayload](self, "pluginPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "plugin payload is unexpectedly nil, failed to create item provider", buf, 2u);
      }

    }
    v6 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v3, "pluginBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D375F8]))
  {
    -[CKPluginDisplayContainer composeImage](self, "composeImage");
    v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    p_super = &v9->super;
    if (v9)
    {
      UIImagePNGRepresentation(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        CKFrameworkBundle();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DROPPED_PLUGIN_PREVIEW_FILE_NAME"), &stru_1E276D870, CFSTR("ChatKit"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setSuggestedName:", v13);

        v14 = *MEMORY[0x1E0CA5C10];
        v15 = MEMORY[0x1E0C809B0];
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __50__CKPluginDisplayContainer_pasteboardItemProvider__block_invoke;
        v28[3] = &unk_1E274B9C8;
        v29 = v11;
        v16 = v11;
        objc_msgSend(v6, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v14, 0, v28);

        v27 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v27;
        v19 = v18;
        if (v17 && !v18)
        {
          v25[0] = v15;
          v25[1] = 3221225472;
          v25[2] = __50__CKPluginDisplayContainer_pasteboardItemProvider__block_invoke_44;
          v25[3] = &unk_1E274B9C8;
          v26 = v17;
          v20 = v17;
          objc_msgSend(v6, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", CFSTR("com.apple.MobileSMS.PluginPayload"), 0, v25);

          goto LABEL_15;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v19;
            _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Failed to archive the plugin display container with error: %@", buf, 0xCu);
          }

        }
        goto LABEL_35;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Failed to create snapshot image NSData", buf, 2u);
        }
LABEL_28:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "plugin snapshot image is unexpectedly nil, failed to create item provider", buf, 2u);
      }
      goto LABEL_28;
    }
LABEL_20:

    goto LABEL_35;
  }
  -[CKPluginDisplayContainer urlForPayload:](self, "urlForPayload:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, p_super, OS_LOG_TYPE_INFO, "Unable to determine URL from rich links plugin", buf, 2u);
      }
      goto LABEL_20;
    }
LABEL_35:

    v21 = 0;
    goto LABEL_36;
  }
  -[CKPluginDisplayContainer _registerItemProvider:forURL:withPluginPayload:](self, "_registerItemProvider:forURL:withPluginPayload:", v6, v7, v4);

LABEL_15:
LABEL_16:
  v6 = v6;
  v21 = v6;
LABEL_36:

  return v21;
}

uint64_t __50__CKPluginDisplayContainer_pasteboardItemProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

uint64_t __50__CKPluginDisplayContainer_pasteboardItemProvider__block_invoke_44(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

+ (id)unarchiveFromData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (unarchiveFromData_error__onceToken != -1)
      dispatch_once(&unarchiveFromData_error__onceToken, &__block_literal_global_215);
    v19 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v5, &v19);
    v7 = v19;
    v8 = v7;
    if (!v6 || v7)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v7);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "localizedDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v21 = v14;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "failed to unarchive plugin display controller: failed to create unarchiver %@", buf, 0xCu);

        }
      }
      v10 = 0;
    }
    else
    {
      objc_msgSend(v6, "decodeObjectOfClasses:forKey:", unarchiveFromData_error__allowlistedClasses, *MEMORY[0x1E0CB2CD0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = v9;
        v8 = 0;
      }
      else
      {
        objc_msgSend(v6, "error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v15;
        if (a4)
          *a4 = objc_retainAutorelease(v15);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "localizedDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v21 = v17;
            _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "failed to unarchive plugin display controller: failed to decode object with error: %@", buf, 0xCu);

          }
        }
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "failed to unarchive plugin display controller: data was nil", buf, 2u);
      }

    }
    v10 = 0;
  }

  return v10;
}

void __52__CKPluginDisplayContainer_unarchiveFromData_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  IMExtensionPayloadUnarchivingClasses();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "addObject:", objc_opt_class());
  v2 = (void *)unarchiveFromData_error__allowlistedClasses;
  unarchiveFromData_error__allowlistedClasses = (uint64_t)v1;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKPluginDisplayContainer)initWithCoder:(id)a3
{
  id v4;
  CKPluginDisplayContainer *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKPluginDisplayContainer;
  v5 = -[CKPluginDisplayContainer init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKPLUGINDISPLAYCONTAINER_PLUGINGPAYLOAD_KEY"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPluginDisplayContainer setPluginPayload:](v5, "setPluginPayload:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CKPLUGINDISPLAYCONTAINER_COMPOSEIMAGE_KEY"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPluginDisplayContainer setComposeImage:](v5, "setComposeImage:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKPluginDisplayContainer pluginPayload](self, "pluginPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CKPLUGINDISPLAYCONTAINER_PLUGINGPAYLOAD_KEY"));

  -[CKPluginDisplayContainer composeImage](self, "composeImage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CKPLUGINDISPLAYCONTAINER_COMPOSEIMAGE_KEY"));

}

- (IMPluginPayload)pluginPayload
{
  return self->_pluginPayload;
}

- (void)setPluginPayload:(id)a3
{
  objc_storeStrong((id *)&self->_pluginPayload, a3);
}

- (UIImage)composeImage
{
  return self->_composeImage;
}

- (void)setComposeImage:(id)a3
{
  objc_storeStrong((id *)&self->_composeImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeImage, 0);
  objc_storeStrong((id *)&self->_pluginPayload, 0);
}

@end
