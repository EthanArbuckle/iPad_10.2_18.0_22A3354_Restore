@implementation IMTapback

- (id)contentTypeStringForMessageSummaryInfo:(id)a3
{
  void *v3;
  unsigned __int8 v4;
  NSObject *v7;

  if (a3)
  {
    objc_msgSend(a3, "__im_associatedMessageContentType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    if (v4 <= 0xAu)
      return *(&off_1E3FB52E8 + (char)v4);
  }
  else
  {
    IMLogHandleForCategory("IMTapback");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_19E36BB30(a2);

  }
  return 0;
}

- (int64_t)associatedMessageType
{
  return self->_associatedMessageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageIdentifier, 0);
}

- (IMTapback)init
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  IMLogHandleForCategory("IMTapback");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_error_impl(&dword_19E239000, v3, OS_LOG_TYPE_ERROR, "init is dissallowed in %@", buf, 0xCu);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is not implemented"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (IMTapback)initWithAssociatedMessageType:(int64_t)a3
{
  IMTapback *v4;
  IMTapback *v5;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMTapback;
  v4 = -[IMTapback init](&v8, sel_init);
  if (!v4)
    goto LABEL_4;
  if ((objc_msgSend((id)objc_opt_class(), "isValidAssociatedMessageType:", a3) & 1) != 0)
  {
    v4->_associatedMessageType = a3;
LABEL_4:
    v5 = v4;
    goto LABEL_8;
  }
  IMLogHandleForCategory("IMTapback");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_19E36B7F8(a3, (uint64_t)v4, v6);

  v5 = 0;
LABEL_8:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  IMTapback *v4;
  int64_t v5;
  BOOL v6;

  v4 = (IMTapback *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[IMTapback associatedMessageType](self, "associatedMessageType");
      v6 = v5 == -[IMTapback associatedMessageType](v4, "associatedMessageType");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (IMTapback)removedTapbackCounterpart
{
  return 0;
}

- (IMTapback)visibleTapbackCounterpart
{
  return 0;
}

- (IMTapback)counterpart
{
  return 0;
}

- (BOOL)isRemoved
{
  return (-[IMTapback associatedMessageType](self, "associatedMessageType") & 0xFFFFFFFFFFFFFFF8) == 3000;
}

- (BOOL)isSendable
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)IMTapback;
  -[IMTapback description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMTapback associatedMessageType](self, "associatedMessageType");
  v6 = (void *)MEMORY[0x1E0CB3940];
  IMStringFromAssociatedMessageType(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%ld (%@)"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: associated message type: %@"), v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (IMTapback)initWithCoder:(id)a3
{
  return -[IMTapback initWithAssociatedMessageType:](self, "initWithAssociatedMessageType:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("associatedMessageType")));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_associatedMessageType, CFSTR("associatedMessageType"));
}

- (void)encodeWithIMRemoteObjectSerializedDictionary:(id)a3
{
  void *v4;
  __CFDictionary *theDict;

  theDict = (__CFDictionary *)a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_associatedMessageType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    CFDictionarySetValue(theDict, CFSTR("associatedMessageType"), v4);

}

- (IMTapback)initWithIMRemoteObjectSerializedDictionary:(id)a3
{
  void *v4;
  IMTapback *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("associatedMessageType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMTapback initWithAssociatedMessageType:](self, "initWithAssociatedMessageType:", objc_msgSend(v4, "unsignedLongValue"));

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssociatedMessageType:", self->_associatedMessageType);
}

+ (BOOL)isValidAssociatedMessageType:(int64_t)a3
{
  return 0;
}

- (id)actionStringFormatWithAdaptiveImageGlyphAvailable:(BOOL)a3
{
  NSObject *v4;

  IMLogHandleForCategory("IMTapback");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_19E36B8F0(a2);

  return 0;
}

- (id)reactionStringWithAdaptiveImageGlyph:(id)a3
{
  NSObject *v4;

  IMLogHandleForCategory("IMTapback");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_19E36B968(a2);

  return 0;
}

- (id)adaptiveImageGlyphForPreviewStringWithAdaptiveImageGlyphProvider:(id)a3
{
  NSObject *v4;

  IMLogHandleForCategory("IMTapback");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_19E36B9E0(a2);

  return 0;
}

- (id)emojiReactionForPreviewString
{
  NSObject *v3;

  IMLogHandleForCategory("IMTapback");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_19E36BA58(a2);

  return 0;
}

- (BOOL)_isAssociatedMessageContentTypeTextInMessageSummaryInfo:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "__im_associatedMessageContentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4 == 1;
}

- (BOOL)_isAttachmentOnlyMessageText:(id)a3 isAdaptiveImageGlyphProvider:(id)a4
{
  id v5;
  uint64_t (**v6)(id, void *);
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a3;
  v6 = (uint64_t (**)(id, void *))a4;
  objc_msgSend(v5, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D362F8]))
  {
    objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D36430], 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      if ((v6[2](v6, v8) & 1) != 0)
      {
        v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
      IMLogHandleForCategory("IMTapback");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_19E36BB00(v10, v18, v19, v20, v21, v22, v23, v24);
    }
    else
    {
      IMLogHandleForCategory("IMTapback");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_19E36BAD0(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    v9 = 1;
    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (id)previewStringFormatForMessageSummaryInfo:(id)a3 adaptiveImageGlyphAvailable:(BOOL)a4 isFromMe:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  IMLocalizedTapbackStringFormat *v22;
  uint64_t v23;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  if (!v9)
  {
    IMLogHandleForCategory("IMTapback");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_19E36BB30(a2);
    goto LABEL_11;
  }
  v10 = -[IMTapback shouldQuoteContentString:](self, "shouldQuoteContentString:", v9);
  -[IMTapback actionStringFormatWithAdaptiveImageGlyphAvailable:](self, "actionStringFormatWithAdaptiveImageGlyphAvailable:", v6);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    IMLogHandleForCategory("IMTapback");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_19E36BBA8(a2);

LABEL_11:
    v16 = 0;
    goto LABEL_29;
  }
  -[IMTapback contentTypeStringForMessageSummaryInfo:](self, "contentTypeStringForMessageSummaryInfo:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject actionStringFormat](v11, "actionStringFormat");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v14, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = -[NSObject requiresReactionReplacment](v11, "requiresReactionReplacment");
  if (v5)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("You %@ \"%%@\"), v13);
    }
    else
    {
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("You %@ %@"), v13, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v14;
        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("You %@ %%@"), v13);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (_DWORD)v14 == 0;
    v19 = 2;
  }
  else
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%%@ %@ \"%%@\"), v13);
    }
    else
    {
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%%@ %@ %@"), v13, v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (_DWORD)v14 == 0;
        v19 = 4;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%%@ %@ %%@"), v13);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (_DWORD)v14 == 0;
    v19 = 6;
  }
LABEL_22:
  if (v18)
    v14 = v19;
  else
    v14 = v19 + 1;
LABEL_25:
  -[IMTapback languageIdentifier](self, "languageIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");
  v22 = [IMLocalizedTapbackStringFormat alloc];
  if (v21)
    v23 = -[IMLocalizedTapbackStringFormat initWithLocalizedStringFormatType:unlocalizedFormatString:languageIdentifier:](v22, "initWithLocalizedStringFormatType:unlocalizedFormatString:languageIdentifier:", v14, v17, v20);
  else
    v23 = -[IMLocalizedTapbackStringFormat initWithLocalizedStringFormatType:unlocalizedFormatString:](v22, "initWithLocalizedStringFormatType:unlocalizedFormatString:", v14, v17);
  v16 = (void *)v23;

LABEL_29:
  return v16;
}

- (id)_convertDatabaseFormatAssociatedMessageSummaryToDisplayFormat:(id)a3 isAdaptiveImageGlyphProvider:(id)a4 adaptiveImageGlyphProvider:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v9, "__im_insertAdaptiveImageGlyphsForFileTransfersUsingIsAdaptiveImageGlyphProvider:adaptiveImageGlyphProvider:", v8, v7);

  v13[0] = CFSTR("CTAdaptiveImageProvider");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__im_removeAllAttributesExcept:", v10);

  v11 = (void *)objc_msgSend(v9, "copy");
  return v11;
}

- (id)_attributedAssociatedMessageSummaryFromMessageSummaryInfo:(id)a3 isAdaptiveImageGlyphProvider:(id)a4 adaptiveImageGlyphProvider:(id)a5 effectString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __CFString *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  uint8_t v26[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v13 || !objc_msgSend(v13, "length"))
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("ame"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.invisibleink")))
    {
      v17 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v10, "__im_associatedMessageSummary");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v19 = v17;
LABEL_16:
      v15 = (void *)objc_msgSend(v19, "initWithString:", v18);

LABEL_17:
      goto LABEL_18;
    }
    if (-[IMTapback _isAssociatedMessageContentTypeTextInMessageSummaryInfo:](self, "_isAssociatedMessageContentTypeTextInMessageSummaryInfo:", v10))
    {
      objc_msgSend(v10, "__imami_attributedStringForKey:", CFSTR("ampt"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        if (!-[IMTapback _isAttachmentOnlyMessageText:isAdaptiveImageGlyphProvider:](self, "_isAttachmentOnlyMessageText:isAdaptiveImageGlyphProvider:", v20, v11))
        {
          -[IMTapback _convertDatabaseFormatAssociatedMessageSummaryToDisplayFormat:isAdaptiveImageGlyphProvider:adaptiveImageGlyphProvider:](self, "_convertDatabaseFormatAssociatedMessageSummaryToDisplayFormat:isAdaptiveImageGlyphProvider:adaptiveImageGlyphProvider:", v20, v11, v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            goto LABEL_17;
          goto LABEL_13;
        }
        IMLogHandleForCategory("IMTapback");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Attributed associated message text contains only an attachment, not using attributed text in preview.", v26, 2u);
        }

      }
    }
LABEL_13:
    objc_msgSend(v10, "__im_associatedMessageSummary");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    v24 = &stru_1E3FBBA48;
    if (v22)
      v24 = (__CFString *)v22;
    v18 = v24;

    v19 = objc_alloc(MEMORY[0x1E0CB3498]);
    goto LABEL_16;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v14);
LABEL_18:

  return v15;
}

- (id)previewAttributedStringWithMessageSummaryInfo:(id)a3 isAdaptiveImageGlyphProvider:(id)a4 adaptiveImageGlyphProvider:(id)a5 senderDisplayName:(id)a6 isFromMe:(BOOL)a7 effectString:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const __CFString *v28;
  void *v29;
  id v30;
  const __CFString *v31;
  uint64_t v32;
  id v33;
  const __CFString *v34;
  id v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = (__CFString *)a6;
  v18 = a8;
  -[IMTapback adaptiveImageGlyphForPreviewStringWithAdaptiveImageGlyphProvider:](self, "adaptiveImageGlyphForPreviewStringWithAdaptiveImageGlyphProvider:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTapback previewStringFormatForMessageSummaryInfo:adaptiveImageGlyphAvailable:isFromMe:](self, "previewStringFormatForMessageSummaryInfo:adaptiveImageGlyphAvailable:isFromMe:", v14, v19 != 0, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v43 = v15;
    objc_msgSend(v20, "localizedFormatString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v22);
    switch(objc_msgSend(v21, "localizedStringFormatType"))
    {
      case 0:
        v24 = v23;
        break;
      case 1:
        -[IMTapback reactionStringWithAdaptiveImageGlyph:](self, "reactionStringWithAdaptiveImageGlyph:", v19);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 2:
        -[IMTapback _attributedAssociatedMessageSummaryFromMessageSummaryInfo:isAdaptiveImageGlyphProvider:adaptiveImageGlyphProvider:effectString:](self, "_attributedAssociatedMessageSummaryFromMessageSummaryInfo:isAdaptiveImageGlyphProvider:adaptiveImageGlyphProvider:effectString:", v14, v15, v16, v18);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 3:
        -[IMTapback reactionStringWithAdaptiveImageGlyph:](self, "reactionStringWithAdaptiveImageGlyph:", v19);
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 4:
        v27 = objc_alloc(MEMORY[0x1E0CB3498]);
        if (v17)
          v28 = v17;
        else
          v28 = &stru_1E3FBBA48;
        v25 = objc_msgSend(v27, "initWithString:", v28);
LABEL_13:
        v29 = (void *)v25;
        objc_msgSend(MEMORY[0x1E0CB3498], "localizedAttributedStringWithFormat:", v23, v25);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      case 5:
        v30 = objc_alloc(MEMORY[0x1E0CB3498]);
        if (v17)
          v31 = v17;
        else
          v31 = &stru_1E3FBBA48;
        v41 = objc_msgSend(v30, "initWithString:", v31);
        -[IMTapback reactionStringWithAdaptiveImageGlyph:](self, "reactionStringWithAdaptiveImageGlyph:", v19);
        v32 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      case 6:
        v33 = objc_alloc(MEMORY[0x1E0CB3498]);
        if (v17)
          v34 = v17;
        else
          v34 = &stru_1E3FBBA48;
        v26 = objc_msgSend(v33, "initWithString:", v34);
LABEL_22:
        v41 = v26;
        -[IMTapback _attributedAssociatedMessageSummaryFromMessageSummaryInfo:isAdaptiveImageGlyphProvider:adaptiveImageGlyphProvider:effectString:](self, "_attributedAssociatedMessageSummaryFromMessageSummaryInfo:isAdaptiveImageGlyphProvider:adaptiveImageGlyphProvider:effectString:", v14, v15, v16, v18);
        v32 = objc_claimAutoreleasedReturnValue();
LABEL_23:
        v39 = (void *)v32;
        v29 = (void *)v41;
        objc_msgSend(MEMORY[0x1E0CB3498], "localizedAttributedStringWithFormat:", v23, v41, v32);
        v24 = (id)objc_claimAutoreleasedReturnValue();

LABEL_24:
        break;
      case 7:
        v36 = objc_alloc(MEMORY[0x1E0CB3498]);
        if (v17)
          v37 = v17;
        else
          v37 = &stru_1E3FBBA48;
        v42 = (void *)objc_msgSend(v36, "initWithString:", v37);
        -[IMTapback reactionStringWithAdaptiveImageGlyph:](self, "reactionStringWithAdaptiveImageGlyph:", v19);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMTapback _attributedAssociatedMessageSummaryFromMessageSummaryInfo:isAdaptiveImageGlyphProvider:adaptiveImageGlyphProvider:effectString:](self, "_attributedAssociatedMessageSummaryFromMessageSummaryInfo:isAdaptiveImageGlyphProvider:adaptiveImageGlyphProvider:effectString:", v14, v15, v16, v18);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3498], "localizedAttributedStringWithFormat:", v23, v42, v40, v38);
        v24 = (id)objc_claimAutoreleasedReturnValue();

        break;
      default:
        v24 = 0;
        break;
    }

    v15 = v43;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)backwardCompatibilityStringFormatForMessageSummaryInfo:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  IMLocalizedTapbackStringFormat *v17;
  uint64_t v18;

  v5 = a3;
  if (!v5)
  {
    IMLogHandleForCategory("IMTapback");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_19E36BB30(a2);
    goto LABEL_10;
  }
  -[IMTapback actionStringFormatWithAdaptiveImageGlyphAvailable:](self, "actionStringFormatWithAdaptiveImageGlyphAvailable:", 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    IMLogHandleForCategory("IMTapback");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_19E36BC20(a2);

LABEL_10:
    v13 = 0;
    goto LABEL_21;
  }
  -[NSObject actionStringFormat](v6, "actionStringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMTapback contentTypeStringForMessageSummaryInfo:](self, "contentTypeStringForMessageSummaryInfo:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IMTapback shouldQuoteContentString:](self, "shouldQuoteContentString:", v5);
  LODWORD(v11) = -[NSObject requiresReactionReplacment](v7, "requiresReactionReplacment");
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ \"%%@\"), v8);
  }
  else
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v8, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v11;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %%@"), v8);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v11)
    v11 = 3;
  else
    v11 = 2;
LABEL_17:
  -[IMTapback languageIdentifier](self, "languageIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");
  v17 = [IMLocalizedTapbackStringFormat alloc];
  if (v16)
    v18 = -[IMLocalizedTapbackStringFormat initWithLocalizedStringFormatType:unlocalizedFormatString:languageIdentifier:](v17, "initWithLocalizedStringFormatType:unlocalizedFormatString:languageIdentifier:", v11, v14, v15);
  else
    v18 = -[IMLocalizedTapbackStringFormat initWithLocalizedStringFormatType:unlocalizedFormatString:](v17, "initWithLocalizedStringFormatType:unlocalizedFormatString:", v11, v14);
  v13 = (void *)v18;

LABEL_21:
  return v13;
}

- (id)_plainStringAssociatedMessageSummaryFromMessageSummaryInfo:(id)a3 isAdaptiveImageGlyphProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "__imami_attributedStringForKey:", CFSTR("ampt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7
    || (v15 = 0,
        objc_msgSend(v7, "__im_attributedStringByReplacingAdaptiveImageGlyphFileTransfersUsingIsAdaptiveImageGlyphProvider:replacementTextProvider:removedTransferGUIDsOut:", v6, &unk_1E3FB3348, &v15), v9 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v9, "string"), v10 = (__CFString *)objc_claimAutoreleasedReturnValue(), v9, !v10))
  {
    objc_msgSend(v5, "__im_associatedMessageSummary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = &stru_1E3FBBA48;
    if (v11)
      v13 = (__CFString *)v11;
    v10 = v13;

  }
  return v10;
}

- (id)_plainStringReactionFromAttributedReactionString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "__im_attributedStringByReplacingAdaptiveImageGlyphsWithUnknownCharacterSymbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)backwardCompatibilityStringWithMessageSummaryInfo:(id)a3 isAdaptiveImageGlyphProvider:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    -[IMTapback backwardCompatibilityStringFormatForMessageSummaryInfo:](self, "backwardCompatibilityStringFormatForMessageSummaryInfo:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject localizedStringFormatType](v9, "localizedStringFormatType");
    -[NSObject localizedFormatString](v9, "localizedFormatString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    switch(v10)
    {
      case 0:
        v14 = v11;
        goto LABEL_16;
      case 1:
        -[IMTapback reactionStringWithAdaptiveImageGlyph:](self, "reactionStringWithAdaptiveImageGlyph:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMTapback _plainStringReactionFromAttributedReactionString:](self, "_plainStringReactionFromAttributedReactionString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v16);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 2:
        -[IMTapback _plainStringAssociatedMessageSummaryFromMessageSummaryInfo:isAdaptiveImageGlyphProvider:](self, "_plainStringAssociatedMessageSummaryFromMessageSummaryInfo:isAdaptiveImageGlyphProvider:", v7, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v15);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 3:
        -[IMTapback reactionStringWithAdaptiveImageGlyph:](self, "reactionStringWithAdaptiveImageGlyph:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMTapback _plainStringReactionFromAttributedReactionString:](self, "_plainStringReactionFromAttributedReactionString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMTapback _plainStringAssociatedMessageSummaryFromMessageSummaryInfo:isAdaptiveImageGlyphProvider:](self, "_plainStringAssociatedMessageSummaryFromMessageSummaryInfo:isAdaptiveImageGlyphProvider:", v7, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@ %@"), 0, v16, v17);
        v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
LABEL_15:

        goto LABEL_16;
      case 4:
      case 5:
      case 6:
      case 7:
        IMLogHandleForCategory("IMTapback");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          sub_19E36BC98(v13);

        goto LABEL_6;
      default:
LABEL_6:
        v14 = 0;
LABEL_16:

        break;
    }
  }
  else
  {
    IMLogHandleForCategory("IMTapback");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_19E36BB30(a2);
    v14 = 0;
  }

  return v14;
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (void)setLanguageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_languageIdentifier, a3);
}

+ (id)tapbackWithAssociatedMessageType:(int64_t)a3
{
  IMClassicTapback *v3;

  if ((unint64_t)(a3 - 3000) >= 6 && (unint64_t)(a3 - 2000) > 5)
    v3 = 0;
  else
    v3 = -[IMClassicTapback initWithAssociatedMessageType:]([IMClassicTapback alloc], "initWithAssociatedMessageType:", a3);
  return v3;
}

@end
