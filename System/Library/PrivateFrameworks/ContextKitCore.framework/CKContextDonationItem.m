@implementation CKContextDonationItem

- (CKContextDonationItem)initWithCoder:(id)a3
{
  id v4;
  CKContextDonationItem *v5;
  uint64_t v6;
  NSString *languageTag;
  uint64_t v8;
  NSString *text;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *contentDescription;
  uint64_t v14;
  NSString *contentKeywords;
  uint64_t v16;
  NSString *contentAuthor;
  uint64_t v18;
  NSString *debugText;
  uint64_t v20;
  NSString *debugUrlString;
  uint64_t v22;
  NSString *rawHTML;
  void *v24;
  uint64_t v25;
  NSArray *uiElements;
  void *v27;
  uint64_t v28;
  NSArray *extractionItems;
  uint64_t v30;
  IOSurface *leadImage;
  uint64_t v32;
  IOSurface *snapshot;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CKContextDonationItem;
  v5 = -[CKContextDonationItem init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("languageTag"));
    v6 = objc_claimAutoreleasedReturnValue();
    languageTag = v5->_languageTag;
    v5->_languageTag = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v8 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentDescription"));
    v12 = objc_claimAutoreleasedReturnValue();
    contentDescription = v5->_contentDescription;
    v5->_contentDescription = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentKeywords"));
    v14 = objc_claimAutoreleasedReturnValue();
    contentKeywords = v5->_contentKeywords;
    v5->_contentKeywords = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentAuthor"));
    v16 = objc_claimAutoreleasedReturnValue();
    contentAuthor = v5->_contentAuthor;
    v5->_contentAuthor = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("debugText"));
    v18 = objc_claimAutoreleasedReturnValue();
    debugText = v5->_debugText;
    v5->_debugText = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("debugUrlString"));
    v20 = objc_claimAutoreleasedReturnValue();
    debugUrlString = v5->_debugUrlString;
    v5->_debugUrlString = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawHTML"));
    v22 = objc_claimAutoreleasedReturnValue();
    rawHTML = v5->_rawHTML;
    v5->_rawHTML = (NSString *)v22;

    if (class_CKContextUIElement)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), class_CKContextUIElement, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("uiElements"));
      v25 = objc_claimAutoreleasedReturnValue();
      uiElements = v5->_uiElements;
      v5->_uiElements = (NSArray *)v25;

    }
    if (class_CKContextExtractionItem)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), class_CKContextExtractionItem, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("extractionItems"));
      v28 = objc_claimAutoreleasedReturnValue();
      extractionItems = v5->_extractionItems;
      v5->_extractionItems = (NSArray *)v28;

    }
    if (class_IOSurface)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", class_IOSurface, CFSTR("leadImage"));
      v30 = objc_claimAutoreleasedReturnValue();
      leadImage = v5->_leadImage;
      v5->_leadImage = (IOSurface *)v30;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", class_IOSurface, CFSTR("snapshot"));
      v32 = objc_claimAutoreleasedReturnValue();
      snapshot = v5->_snapshot;
      v5->_snapshot = (IOSurface *)v32;

    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugUrlString, 0);
  objc_storeStrong((id *)&self->_debugText, 0);
  objc_storeStrong((id *)&self->_extractionItems, 0);
  objc_storeStrong((id *)&self->_uiElements, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_leadImage, 0);
  objc_storeStrong((id *)&self->_languageTag, 0);
  objc_storeStrong((id *)&self->_rawHTML, 0);
  objc_storeStrong((id *)&self->_contentAuthor, 0);
  objc_storeStrong((id *)&self->_contentKeywords, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *languageTag;
  id v5;

  languageTag = self->_languageTag;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", languageTag, CFSTR("languageTag"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_text, CFSTR("text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentDescription, CFSTR("contentDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentKeywords, CFSTR("contentKeywords"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentAuthor, CFSTR("contentAuthor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_debugText, CFSTR("debugText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_debugUrlString, CFSTR("debugUrlString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawHTML, CFSTR("rawHTML"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uiElements, CFSTR("uiElements"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extractionItems, CFSTR("extractionItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_leadImage, CFSTR("leadImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_snapshot, CFSTR("snapshot"));

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    class_CKContextUIElement = (uint64_t)NSClassFromString(CFSTR("CKContextUIElement"));
    class_CKContextExtractionItem = (uint64_t)NSClassFromString(CFSTR("CKContextExtractionItem"));
    class_IOSurface = (uint64_t)NSClassFromString(CFSTR("IOSurface"));
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)-[NSString copy](self->_text, "copy");
  objc_msgSend(v4, "setText:", v5);

  v6 = (void *)-[NSString copy](self->_title, "copy");
  objc_msgSend(v4, "setTitle:", v6);

  v7 = (void *)-[NSString copy](self->_contentDescription, "copy");
  objc_msgSend(v4, "setContentDescription:", v7);

  objc_msgSend(v4, "setContentKeywords:", self->_contentKeywords);
  v8 = (void *)-[NSString copy](self->_contentAuthor, "copy");
  objc_msgSend(v4, "setContentAuthor:", v8);

  v9 = (void *)-[NSString copy](self->_languageTag, "copy");
  objc_msgSend(v4, "setLanguageTag:", v9);

  v10 = (void *)-[NSString copy](self->_debugText, "copy");
  objc_msgSend(v4, "setDebugText:", v10);

  v11 = (void *)-[NSString copy](self->_debugUrlString, "copy");
  objc_msgSend(v4, "setDebugUrlString:", v11);

  v12 = (void *)-[NSString copy](self->_rawHTML, "copy");
  objc_msgSend(v4, "setRawHTML:", v12);

  v13 = (void *)-[NSArray copy](self->_uiElements, "copy");
  objc_msgSend(v4, "setUiElements:", v13);

  v14 = (void *)-[NSArray copy](self->_extractionItems, "copy");
  objc_msgSend(v4, "setExtractionItems:", v14);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setText:(id)a3
{
  id v4;
  NSString *v5;
  NSString *text;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "trimTextToSize:", v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  text = self->_text;
  self->_text = v5;

}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "trimTextToSize:", v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  title = self->_title;
  self->_title = v5;

}

- (void)setContentDescription:(id)a3
{
  id v4;
  NSString *v5;
  NSString *contentDescription;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "trimTextToSize:", v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  contentDescription = self->_contentDescription;
  self->_contentDescription = v5;

}

- (void)setContentKeywords:(id)a3
{
  id v4;
  NSString *v5;
  NSString *contentKeywords;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "trimTextToSize:", v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  contentKeywords = self->_contentKeywords;
  self->_contentKeywords = v5;

}

- (void)setContentAuthor:(id)a3
{
  id v4;
  NSString *v5;
  NSString *contentAuthor;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "trimTextToSize:", v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  contentAuthor = self->_contentAuthor;
  self->_contentAuthor = v5;

}

+ (id)trimTextToSize:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  unint64_t v5;
  unint64_t v6;
  _WORD *v7;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  unint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  UniChar v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  int64_t v24;
  __int16 v25;
  int v26;
  unint64_t v27;
  const __CFCharacterSet *theSet;
  UniChar buffer[8];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CFStringRef theString;
  const UniChar *v39;
  const char *v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  int64_t v44;
  CFRange v45;

  v3 = (__CFString *)a3;
  v4 = v3;
  if (!v3 || ((v5 = -[__CFString length](v3, "length"), v5 >= 0x4E20) ? (v6 = 20000) : (v6 = v5), !v6))
  {
LABEL_55:
    v7 = 0;
    goto LABEL_56;
  }
  v7 = malloc_type_malloc(2 * v6, 0x1000040BDFB0063uLL);
  if (v7)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    *(_OWORD *)buffer = 0u;
    v31 = 0u;
    theString = v4;
    v41 = 0;
    v42 = v6;
    CharactersPtr = CFStringGetCharactersPtr(v4);
    CStringPtr = 0;
    v39 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
    v43 = 0;
    v44 = 0;
    v40 = CStringPtr;
    theSet = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
    v10 = 0;
    v11 = 0;
    v12 = 1;
    do
    {
      v13 = -(uint64_t)v10;
      v14 = v10 + 64;
      while (1)
      {
        if (v10 >= 4)
          v15 = 4;
        else
          v15 = v10;
        v16 = v42;
        if (v42 <= (uint64_t)v10)
        {
          v17 = 0;
          goto LABEL_36;
        }
        if (v39)
        {
          v17 = v39[v10 + v41];
        }
        else if (v40)
        {
          v17 = v40[v41 + v10];
        }
        else
        {
          v18 = v43;
          if (v44 <= (uint64_t)v10 || v43 > (uint64_t)v10)
          {
            v20 = -v15;
            v21 = v15 + v13;
            v22 = v14 - v15;
            v23 = v10 + v20;
            v24 = v23 + 64;
            if (v23 + 64 >= v42)
              v24 = v42;
            v43 = v23;
            v44 = v24;
            if (v42 >= v22)
              v16 = v22;
            v45.length = v16 + v21;
            v45.location = v23 + v41;
            CFStringGetCharacters(theString, v45, buffer);
            v18 = v43;
          }
          v17 = buffer[v10 - v18];
        }
        if (v17 != 10)
          break;
        if (v11)
        {
          v26 = (unsigned __int16)v7[v11 - 1];
          if (v26 == 32)
          {
            v7[v11 - 1] = 10;
            goto LABEL_47;
          }
          if (v26 != 10 || v11 < 2 || v7[v11 - 2] != 10)
          {
            v25 = 10;
            goto LABEL_46;
          }
          goto LABEL_47;
        }
        ++v10;
        --v13;
        ++v14;
        if (v10 >= v6)
          goto LABEL_54;
      }
      if (v17 == 173)
        goto LABEL_48;
LABEL_36:
      if (!CFCharacterSetIsCharacterMember(theSet, v17))
      {
        v12 = 0;
        v7[v11++] = v17;
        goto LABEL_48;
      }
      if ((v12 & 1) == 0)
      {
        v25 = 32;
LABEL_46:
        v7[v11++] = v25;
      }
LABEL_47:
      v12 = 1;
LABEL_48:
      ++v10;
    }
    while (v10 < v6 && v11 >> 4 <= 0x270);
    if (v11)
    {
      v27 = v11 - 1;
      if (v7[v11 - 1] != 32 || (--v11, v27))
      {
        v7 = (_WORD *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharactersNoCopy:length:freeWhenDone:", v7, v11, 1);
        goto LABEL_56;
      }
    }
LABEL_54:
    free(v7);
    goto LABEL_55;
  }
LABEL_56:

  return v7;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (NSString)contentKeywords
{
  return self->_contentKeywords;
}

- (NSString)contentAuthor
{
  return self->_contentAuthor;
}

- (NSString)rawHTML
{
  return self->_rawHTML;
}

- (void)setRawHTML:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)languageTag
{
  return self->_languageTag;
}

- (void)setLanguageTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (IOSurface)leadImage
{
  return self->_leadImage;
}

- (void)setLeadImage:(id)a3
{
  objc_storeStrong((id *)&self->_leadImage, a3);
}

- (IOSurface)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (NSArray)uiElements
{
  return self->_uiElements;
}

- (void)setUiElements:(id)a3
{
  objc_storeStrong((id *)&self->_uiElements, a3);
}

- (NSArray)extractionItems
{
  return self->_extractionItems;
}

- (void)setExtractionItems:(id)a3
{
  objc_storeStrong((id *)&self->_extractionItems, a3);
}

- (NSString)debugText
{
  return self->_debugText;
}

- (void)setDebugText:(id)a3
{
  objc_storeStrong((id *)&self->_debugText, a3);
}

- (NSString)debugUrlString
{
  return self->_debugUrlString;
}

- (void)setDebugUrlString:(id)a3
{
  objc_storeStrong((id *)&self->_debugUrlString, a3);
}

@end
