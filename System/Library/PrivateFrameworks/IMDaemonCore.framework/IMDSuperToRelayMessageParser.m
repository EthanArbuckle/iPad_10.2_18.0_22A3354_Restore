@implementation IMDSuperToRelayMessageParser

- (IMDSuperToRelayMessageParser)initWithAttributedString:(id)a3
{
  IMDSuperToRelayMessageParser *v3;
  NSMutableString *v4;
  NSMutableString *outHTML;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMDSuperToRelayMessageParser;
  v3 = -[IMFromSuperParserContext initWithAttributedString:](&v7, sel_initWithAttributedString_, a3);
  if (v3)
  {
    v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    outHTML = v3->_outHTML;
    v3->_outHTML = v4;

    v3->_isSimpleString = 1;
  }
  return v3;
}

- (id)name
{
  return CFSTR("SuperToMessage");
}

- (id)resultsForLogging
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("outHTML"), 0);
}

- (void)parserDidStart:(id)a3 bodyAttributes:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  id v14;

  v14 = a4;
  -[NSMutableString appendString:](self->_outHTML, "appendString:", CFSTR("<html>"));
  -[NSMutableString appendString:](self->_outHTML, "appendString:", CFSTR("<body"));
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D366A8]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    objc_msgSend(v5, "appendFormat:", CFSTR("background-color:%@;"), v6);
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D366B0]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    objc_msgSend(v5, "appendFormat:", CFSTR("color:%@;"), v8);
  if (objc_msgSend(v5, "length"))
    -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", CFSTR(" style=\"%@\"), v5);
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D36308]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "integerValue");
    if (v12 == 1)
    {
      v13 = CFSTR(" dir=\"rtl\");
      goto LABEL_12;
    }
    if (!v12)
    {
      v13 = CFSTR(" dir=\"ltr\");
LABEL_12:
      -[NSMutableString appendString:](self->_outHTML, "appendString:", v13);
    }
  }
  -[NSMutableString appendString:](self->_outHTML, "appendString:", CFSTR(">"));

}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6
{
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  int *v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  int v37;
  int v38;
  uint64_t v39;
  id v40;

  v40 = a6;
  v8 = *MEMORY[0x1E0D36300];
  v9 = a4;
  objc_msgSend(v9, "_stringForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_stringForKey:", *MEMORY[0x1E0D36450]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_stringForKey:", *MEMORY[0x1E0D36440]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_numberForKey:", *MEMORY[0x1E0D36448]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v13, "integerValue");

  objc_msgSend(v9, "_numberForKey:", *MEMORY[0x1E0D368F0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v9, "_numberForKey:", *MEMORY[0x1E0D36310]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v9, "_numberForKey:", *MEMORY[0x1E0D365E8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v9, "_numberForKey:", *MEMORY[0x1E0D36858]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D365F0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v22 = &OBJC_IVAR___IMDAccount__accountID;
  if (v20)
  {
    objc_msgSend(v20, "absoluteString");
    v23 = v19;
    v24 = v15;
    v25 = v20;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v12;
    v28 = v11;
    v29 = v10;
    v30 = (void *)IMCreateEscapedAttributeValueFromString();

    -[NSMutableString appendString:](self->_outHTML, "appendString:", CFSTR("<a href=\"));
    -[NSMutableString appendString:](self->_outHTML, "appendString:", v30);
    v20 = v25;
    v15 = v24;
    v19 = v23;
    -[NSMutableString appendString:](self->_outHTML, "appendString:", CFSTR("\">"));

    v10 = v29;
    v11 = v28;
    v12 = v27;
    v22 = &OBJC_IVAR___IMDAccount__accountID;
  }
  if (v38)
    objc_msgSend(v21, "appendString:", CFSTR("font-weight: bold;"));
  if (v37)
    objc_msgSend(v21, "appendString:", CFSTR("font-style: italic;"));
  if ((v15 | v19) == 1)
  {
    if (v15)
      v31 = CFSTR("text-decoration: underline;");
    else
      v31 = CFSTR("text-decoration: line-through;");
    objc_msgSend(v21, "appendString:", v31);
  }
  if (objc_msgSend(v12, "length"))
  {
    v32 = (void *)IMCopySafeNameOfFontFamilyName();
    v33 = v20;
    v34 = (void *)IMCreateEscapedAttributeValueFromString();
    objc_msgSend(v21, "appendFormat:", CFSTR("font-family: '%@';"), v34);

    v20 = v33;
  }
  if (v39)
    objc_msgSend(v21, "appendFormat:", CFSTR("font-size: %dpx;"), v39);
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v21, "appendFormat:", CFSTR("color: %@;"), v11);
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v21, "appendFormat:", CFSTR("background-color: %@;"), v10);
  if (objc_msgSend(v21, "length"))
  {
    v35 = v22[603];
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v35), "appendString:", CFSTR("<span style=\"));
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v35), "appendString:", v21);
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v35), "appendString:", CFSTR("\">"));
  }
  v36 = (void *)IMCreateEscapedStringFromString();
  if (v36)
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v22[603]), "appendString:", v36);
  if (objc_msgSend(v21, "length"))
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v22[603]), "appendString:", CFSTR("</span>"));
  if (v20)
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v22[603]), "appendString:", CFSTR("</a>"));

}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10
{
  -[IMDSuperToRelayMessageParser parser:foundAttributes:inRange:fileTransferGUID:filename:bookmark:width:height:isAnimoji:](self, "parser:foundAttributes:inRange:fileTransferGUID:filename:bookmark:width:height:isAnimoji:", a3, a4, a5.location, a5.length, a6, a7, a8, a9, a10, 0);
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  _QWORD v62[5];
  id v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v60 = a4;
  v15 = a6;
  v16 = a7;
  v61 = a8;
  v17 = a9;
  v18 = a10;
  v19 = a11;
  if (v17)
    v20 = v17;
  else
    v20 = &unk_1E92714A0;
  if (v18)
    v21 = v18;
  else
    v21 = &unk_1E92714A0;
  if (v15)
  {
    self->_isSimpleString = 0;
    +[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "transferForGUID:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
LABEL_57:

      goto LABEL_58;
    }
    objc_msgSend(v23, "transferredFilename");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (v25)
    {
      objc_msgSend(v23, "transferredFilename");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled(v28))
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v27;
          _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Filename from transferred file name: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v27 = v16;
    }
    if (objc_msgSend(v27, "length"))
    {
      v30 = v27;
      if (!v27)
      {
LABEL_56:
        v16 = 0;
        goto LABEL_57;
      }
    }
    else
    {
      objc_msgSend(v23, "localPath");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastPathComponent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled(v32))
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v30;
          _os_log_impl(&dword_1D1413000, v33, OS_LOG_TYPE_INFO, "Filename from local path: %@", buf, 0xCu);
        }

      }
      if (!v30)
        goto LABEL_56;
    }
    objc_msgSend(v30, "lastPathComponent");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v34))
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v65 = v16;
        _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Filename from last path component: %@", buf, 0xCu);
      }

    }
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (void *)IMCreateEscapedAttributeValueFromString();
      objc_msgSend(v23, "userInfo");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localPath");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      objc_msgSend(v36, "attributesOfItemAtPath:error:", v37, &v63);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v63;

      -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", CFSTR("<FILE name=\"%@\" width=\"%ld\" height=\"%ld\" datasize=\"%llu\"), v54, objc_msgSend(v20, "integerValue"), objc_msgSend(v21, "integerValue"), objc_msgSend(v53, "fileSize"));
      if (v19)
      {
        v38 = (void *)IMCreateEscapedAttributeValueFromString();
        objc_msgSend(v19, "stringValue");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)IMCreateEscapedAttributeValueFromString();

        if (v38 && v40)
          -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", CFSTR(" %@=\"%@\"), v38, v40);

      }
      objc_msgSend(v58, "MIMETypeOfPath:", v16);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v57, "length"))
      {
        v41 = (void *)IMCreateEscapedAttributeValueFromString();
        v42 = IMCreateEscapedAttributeValueFromString();
        v43 = (void *)v42;
        if (v41 && v42)
          -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", CFSTR(" %@=\"%@\"), v41, v42);

      }
      objc_msgSend(v58, "UTITypeOfPath:", v16);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v56, "length"))
      {
        v44 = (void *)IMCreateEscapedAttributeValueFromString();
        v45 = IMCreateEscapedAttributeValueFromString();
        v46 = (void *)v45;
        if (v44 && v45)
          -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", CFSTR(" %@=\"%@\"), v44, v45);

      }
      if (objc_msgSend(v23, "isAdaptiveImageGlyph"))
      {
        objc_msgSend(v23, "adaptiveImageGlyphContentIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "length"))
        {
          v48 = (void *)IMCreateEscapedAttributeValueFromString();
          -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", CFSTR(" emoji-image-id=\"%@\"), v48);

        }
        objc_msgSend(v23, "adaptiveImageGlyphContentDescription");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v49, "length"))
        {
          v50 = (void *)IMCreateEscapedAttributeValueFromString();
          -[NSMutableString appendFormat:](self->_outHTML, "appendFormat:", CFSTR(" emoji-image-description=\"%@\"), v50);

        }
      }
      if (qword_1EFC63E00 != -1)
        dispatch_once(&qword_1EFC63E00, &unk_1E922CDA8);
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = sub_1D15401FC;
      v62[3] = &unk_1E922CDD0;
      v62[4] = self;
      objc_msgSend(v55, "enumerateKeysAndObjectsUsingBlock:", v62);
      if (IMOSLoggingEnabled(-[NSMutableString appendString:](self->_outHTML, "appendString:", CFSTR("/>"))))
      {
        OSLogHandleForIMFoundationCategory();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v65 = v23;
          v66 = 2112;
          v67 = v55;
          _os_log_impl(&dword_1D1413000, v51, OS_LOG_TYPE_INFO, "Parsed file transfer: %@    user info: %@", buf, 0x16u);
        }

      }
    }
    goto LABEL_57;
  }
LABEL_58:

}

- (void)parserDidEnd:(id)a3
{
  -[NSMutableString appendString:](self->_outHTML, "appendString:", CFSTR("</body></html>"));
}

- (BOOL)shouldPreprocess
{
  return 1;
}

- (id)parser:(id)a3 preprocessedAttributesForAttributes:(id)a4 range:(_NSRange)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0D363F8];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D363F8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0D366C8];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D366C8]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x1E0D36840];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D36840]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0D36850];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D36850]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0D36848];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D36848]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0D36900];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D36900]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v9;
  v21 = v8;
  v22 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0D36440], *MEMORY[0x1E0D36448], *MEMORY[0x1E0D365E8], *MEMORY[0x1E0D36310], *MEMORY[0x1E0D368F0], *MEMORY[0x1E0D36858], *MEMORY[0x1E0D365F0], *MEMORY[0x1E0D36758], *MEMORY[0x1E0D36450], *MEMORY[0x1E0D36300], *MEMORY[0x1E0D366A8], *MEMORY[0x1E0D366B0], *MEMORY[0x1E0D36308], v11, v10, v7, v6,
    v8,
    v7,
    *MEMORY[0x1E0D36588],
    *MEMORY[0x1E0D36590],
    *MEMORY[0x1E0D367E8],
    v9,
    *MEMORY[0x1E0D36778],
    *MEMORY[0x1E0D36430],
    *MEMORY[0x1E0D36420],
    *MEMORY[0x1E0D36438],
    0);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          self->_isSimpleString = 0;
          goto LABEL_11;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_11:

  if (v29 || v28 || v27 || v26 || v25 || (v18 = v5, v24))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "removeObjectForKey:", v22);
    objc_msgSend(v18, "removeObjectForKey:", v7);
    objc_msgSend(v18, "removeObjectForKey:", v21);
    objc_msgSend(v18, "removeObjectForKey:", v20);
    objc_msgSend(v18, "removeObjectForKey:", v10);
    objc_msgSend(v18, "removeObjectForKey:", v11);
  }

  return v18;
}

- (BOOL)isSimpleString
{
  return self->_isSimpleString;
}

- (NSString)outHTML
{
  return &self->_outHTML->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outHTML, 0);
}

@end
