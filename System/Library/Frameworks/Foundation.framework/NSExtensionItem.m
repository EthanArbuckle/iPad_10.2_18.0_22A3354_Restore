@implementation NSExtensionItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSExtensionItem)init
{
  NSExtensionItem *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSExtensionItem;
  v2 = -[NSExtensionItem init](&v4, sel_init);
  if (v2)
    v2->_userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (NSExtensionItem)initWithCoder:(id)a3
{
  NSExtensionItem *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSExtensionItem;
  v4 = -[NSExtensionItem init](&v6, sel_init);
  if (v4)
    v4->_userInfo = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), CFSTR("NSExtensionItemUserInfoKey")), "mutableCopy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSExtensionItem;
  -[NSExtensionItem dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_userInfo, CFSTR("NSExtensionItemUserInfoKey"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSExtensionItem *v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(NSExtensionItem);
  v5 = (NSMutableDictionary *)-[NSDictionary mutableCopy](-[NSExtensionItem userInfo](self, "userInfo"), "mutableCopy");
  v6 = (void *)-[NSMutableDictionary objectForKey:](v5, "objectForKey:", CFSTR("NSExtensionItemAttachmentsKey"));
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = (id)objc_msgSend(v12, "copy");
        objc_msgSend(v7, "addObject:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v9);
  }
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v7, CFSTR("NSExtensionItemAttachmentsKey"));

  v4->_userInfo = v5;
  return v4;
}

- (void)setAttributedTitle:(NSAttributedString *)attributedTitle
{
  NSUInteger v5;
  NSData *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (attributedTitle)
  {
    v9 = 0;
    v5 = -[NSAttributedString length](attributedTitle, "length");
    v12 = _MergedGlobals_84();
    v13[0] = off_1ECD04CB0();
    v6 = -[NSAttributedString dataFromRange:documentAttributes:error:](attributedTitle, "dataFromRange:documentAttributes:error:", 0, v5, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1), &v9);
    if (v6)
    {
      -[NSMutableDictionary setValue:forKey:](self->_userInfo, "setValue:forKey:", v6, CFSTR("NSExtensionItemAttributedTitleKey"));
    }
    else
    {
      v7 = _NSOSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = objc_msgSend(v9, "description");
        *(_DWORD *)buf = 138412290;
        v11 = v8;
        _os_log_error_impl(&dword_1817D9000, v7, OS_LOG_TYPE_ERROR, "unable to create RTF representation of attributed string! error - %@", buf, 0xCu);
      }
    }
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_userInfo, "removeObjectForKey:", CFSTR("NSExtensionItemAttributedTitleKey"));
  }
}

- (NSAttributedString)attributedTitle
{
  NSAttributedString *result;
  NSAttributedString *v3;
  NSAttributedString *v4;
  NSAttributedString *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  result = (NSAttributedString *)-[NSMutableDictionary objectForKey:](self->_userInfo, "objectForKey:", CFSTR("NSExtensionItemAttributedTitleKey"));
  if (result)
  {
    v3 = result;
    v8 = 0;
    UIFoundationLibrary();
    v4 = [NSAttributedString alloc];
    v11 = _MergedGlobals_84();
    v12[0] = off_1ECD04CB0();
    v5 = -[NSAttributedString initWithData:options:documentAttributes:error:](v4, "initWithData:options:documentAttributes:error:", v3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1), 0, &v8);
    if (!v5)
    {
      v6 = _NSOSLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = objc_msgSend(v8, "description");
        *(_DWORD *)buf = 138412290;
        v10 = v7;
        _os_log_error_impl(&dword_1817D9000, v6, OS_LOG_TYPE_ERROR, "unable to create attributed string representation from RTF data! error - %@", buf, 0xCu);
      }
    }
    return v5;
  }
  return result;
}

- (void)setAttributedContentText:(NSAttributedString *)attributedContentText
{
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (attributedContentText)
  {
    v5 = -[NSAttributedString length](attributedContentText, "length", 0);
    v7 = _MergedGlobals_84();
    v8[0] = off_1ECD04CB0();
    -[NSMutableDictionary setValue:forKey:](self->_userInfo, "setValue:forKey:", -[NSAttributedString dataFromRange:documentAttributes:error:](attributedContentText, "dataFromRange:documentAttributes:error:", 0, v5, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1), &v6), CFSTR("NSExtensionItemAttributedContentTextKey"));
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_userInfo, "removeObjectForKey:", CFSTR("NSExtensionItemAttributedContentTextKey"));
  }
}

- (NSAttributedString)attributedContentText
{
  NSAttributedString *result;
  NSAttributedString *v3;
  NSAttributedString *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  result = (NSAttributedString *)-[NSMutableDictionary objectForKey:](self->_userInfo, "objectForKey:", CFSTR("NSExtensionItemAttributedContentTextKey"));
  if (result)
  {
    v3 = result;
    UIFoundationLibrary();
    v4 = [NSAttributedString alloc];
    v6 = _MergedGlobals_84();
    v7[0] = off_1ECD04CB0();
    return -[NSAttributedString initWithData:options:documentAttributes:error:](v4, "initWithData:options:documentAttributes:error:", v3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1, 0), 0, &v5);
  }
  return result;
}

- (void)setAttachments:(NSArray *)attachments
{
  -[NSMutableDictionary setValue:forKey:](self->_userInfo, "setValue:forKey:", (id)-[NSArray copy](attachments, "copy"), CFSTR("NSExtensionItemAttachmentsKey"));
}

- (NSArray)attachments
{
  return (NSArray *)-[NSMutableDictionary objectForKey:](self->_userInfo, "objectForKey:", CFSTR("NSExtensionItemAttachmentsKey"));
}

- (void)setUserInfo:(NSDictionary *)userInfo
{

  self->_userInfo = (NSMutableDictionary *)-[NSDictionary mutableCopy](userInfo, "mutableCopy");
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_userInfo, "copy");
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSExtensionItem;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - userInfo: %@"), -[NSExtensionItem description](&v3, sel_description), self->_userInfo);
}

- (id)_matchingDictionaryRepresentation
{
  NSDictionary *v3;
  uint64_t v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSExtensionURLResult *v14;
  uint64_t v15;
  char v16;
  id v17;
  char v18;
  int v19;
  uint64_t v20;
  const __CFString **v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSArray *obj;
  id v28;
  _QWORD v29[5];
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  _QWORD v43[2];
  _QWORD v44[2];
  const __CFString *v45;
  const __CFString *v46;
  _BYTE v47[128];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = &v35;
  v37 = 0x3052000000;
  v38 = __Block_byref_object_copy__4;
  v39 = __Block_byref_object_dispose__4;
  v40 = 0;
  v40 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v3 = -[NSExtensionItem userInfo](self, "userInfo");
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke;
  v30[3] = &unk_1E0F4E340;
  v30[4] = &v31;
  v30[5] = &v35;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", v30);
  if (-[NSArray count](-[NSExtensionItem attachments](self, "attachments"), "count"))
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = off_1ECD04CB8();
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v5 = -[NSExtensionItem attachments](self, "attachments");
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v48, v47, 16);
    if (!v6)
      goto LABEL_37;
    v7 = *(_QWORD *)v49;
    obj = v5;
    while (1)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v49 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v8);
        v10 = off_1ECD04CC0();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", objc_msgSend(v9, "registeredTypeIdentifiers"));
        v12 = v11;
        if (!*((_BYTE *)v32 + 24) || (v13 = v10, (objc_msgSend(v11, "containsObject:", v10) & 1) == 0))
        {
          v13 = v4;
          if (!objc_msgSend(v12, "containsObject:", v4))
          {
            v13 = 0;
            goto LABEL_25;
          }
        }
        if (v13)
        {
          v14 = objc_alloc_init(NSExtensionURLResult);
          v45 = CFSTR("NSItemProviderOptionsDispatchMode");
          v46 = CFSTR("NSItemProviderOptionsDispatchModeAsynchronous");
          v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke_44;
          v29[3] = &unk_1E0F4E368;
          v29[4] = v14;
          objc_msgSend(v9, "loadItemForTypeIdentifier:options:completionHandler:", v13, v15, v29);
          v16 = -[NSExtensionURLResult wait:](v14, "wait:", 2.0);
          v17 = -[NSExtensionURLResult copiedURL](v14, "copiedURL");

          if (v17)
            v18 = v16;
          else
            v18 = 1;
          if ((v18 & 1) != 0)
            goto LABEL_22;
          if (v13 == v10)
          {
            if (objc_msgSend((id)objc_msgSend(v17, "scheme"), "caseInsensitiveCompare:", CFSTR("http"))
              && objc_msgSend((id)objc_msgSend(v17, "scheme"), "caseInsensitiveCompare:", CFSTR("https")))
            {
              goto LABEL_22;
            }
            v13 = 0;
            v19 = 1;
          }
          else
          {
            if (v13 == v4 && objc_msgSend(v17, "isFileURL"))
            {
              v13 = off_1ECD04CD0((uint64_t)v17, 0);
              v19 = 0;
              goto LABEL_23;
            }
LABEL_22:
            v19 = 0;
            v13 = 0;
          }
LABEL_23:

          if (v19)
          {
            objc_msgSend(v12, "addObject:", CFSTR("com.apple.active-webpage"));
            goto LABEL_28;
          }
        }
LABEL_25:
        if ((unint64_t)objc_msgSend(v12, "count") >= 2
          && (objc_msgSend(v12, "containsObject:", CFSTR("com.apple.active-webpage")) & 1) == 0)
        {
          objc_msgSend(v12, "removeObject:", v10);
        }
LABEL_28:
        if ((unint64_t)objc_msgSend(v12, "count") >= 2)
          objc_msgSend(v12, "removeObject:", off_1ECD04CC8());
        if (v13)
        {
          v43[0] = CFSTR("registeredTypeIdentifiers");
          v20 = objc_msgSend(v12, "allObjects");
          v43[1] = CFSTR("fileProviderItem");
          v44[0] = v20;
          v21 = (const __CFString **)v43;
          v22 = v44;
          v23 = 2;
          v44[1] = v13;
        }
        else
        {
          v41 = CFSTR("registeredTypeIdentifiers");
          v42 = objc_msgSend(v12, "allObjects");
          v21 = &v41;
          v22 = &v42;
          v23 = 1;
        }
        objc_msgSend(v28, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, v23));

        ++v8;
      }
      while (v6 != v8);
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v48, v47, 16);
      v6 = v24;
      if (!v24)
      {
LABEL_37:
        objc_msgSend((id)v36[5], "setObject:forKey:", v28, CFSTR("attachments"));

        break;
      }
    }
  }
  v25 = (void *)v36[5];
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v25;
}

void __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke(uint64_t a1, __CFString *a2, void *a3)
{
  __CFString *v4;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a2;
  v19 = *MEMORY[0x1E0C80C00];
  if (-[__CFString isEqualToString:](a2, "isEqualToString:", CFSTR("NSExtensionItemAttributedTitleKey")))
    v4 = CFSTR("title");
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("NSExtensionItemAttributedContentTextKey")))v4 = CFSTR("contentText");
  if ((-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("NSExtensionItemAttachmentsKey")) & 1) == 0)
  {
    if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("supportsJavaScript"))
      && (objc_getClass("NSNumber"), (objc_opt_isKindOfClass() & 1) != 0)
      && objc_msgSend(a3, "BOOLValue"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
    else if ((-[__CFString hasPrefix:](v4, "hasPrefix:", CFSTR("com.apple.UIKit")) & 1) == 0)
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v14 = 0;
      v6 = objc_opt_class();
      v7 = +[NSExtensionContext _extensionContextHostProtocolAllowedClassesForItems](NSExtensionContext, "_extensionContextHostProtocolAllowedClassesForItems");
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke_2;
      v10[3] = &unk_1E0F4CE58;
      v10[4] = v6;
      v10[5] = &v11;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
      if (*((_BYTE *)v12 + 24))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKey:", a3, v4);
      }
      else
      {
        v8 = _NSOSLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v16 = v4;
          v17 = 2112;
          v18 = v9;
          _os_log_error_impl(&dword_1817D9000, v8, OS_LOG_TYPE_ERROR, "Unable to encode value for key %@ because it is of unsupported type %@", buf, 0x16u);
        }
      }
      _Block_object_dispose(&v11, 8);
    }
  }
}

uint64_t __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isSubclassOfClass:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __52__NSExtensionItem__matchingDictionaryRepresentation__block_invoke_44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "setURL:", a2);
  }
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

@end
