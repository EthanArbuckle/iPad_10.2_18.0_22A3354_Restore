@implementation EMFEmojiToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)emojiTokenWithCEMEmojiToken:(__EmojiTokenWrapper *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCEMEmojiToken:", a3);
}

+ (id)emojiTokensForCEMEmojiTokens:(__CFArray *)a3
{
  CFIndex Count;
  void *v5;
  CFIndex i;
  void *v7;

  if (a3)
  {
    Count = CFArrayGetCount(a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (Count)
    {
      for (i = 0; i != Count; ++i)
      {
        +[EMFEmojiToken emojiTokenWithCEMEmojiToken:](EMFEmojiToken, "emojiTokenWithCEMEmojiToken:", CFArrayGetValueAtIndex(a3, i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v7);

      }
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)emojiTokenWithString:(id)a3 localeData:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  objc_msgSend(v6, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithString:localeIdentifier:", v7, v9);
  return v10;
}

+ (id)emojiTokenWithLongCharacter:(unsigned int)a3 localeData:(id)a4
{
  id v5;
  const void *v6;
  void *v7;
  void *v8;

  v5 = objc_retainAutorelease(a4);
  objc_msgSend(v5, "emojiLocaleDataRef");
  v6 = (const void *)CEMEmojiTokenCreateWithLongCharacter();
  objc_msgSend(a1, "emojiTokenWithCEMEmojiToken:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CFRelease(v6);
  objc_msgSend(v5, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocaleIdentifier:", v8);

  return v7;
}

- (EMFEmojiToken)initWithCEMEmojiToken:(__EmojiTokenWrapper *)a3
{
  EMFEmojiToken *v4;
  uint64_t v5;
  NSString *string;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *localeIdentifier;
  objc_super v13;

  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)EMFEmojiToken;
    v4 = -[EMFEmojiToken init](&v13, sel_init);
    if (v4)
    {
      v4->_emojiTokenRef = (__EmojiTokenWrapper *)CFRetain(a3);
      v5 = objc_msgSend((id)CEMEmojiTokenGetString(), "copy");
      string = v4->_string;
      v4->_string = (NSString *)v5;

      -[EMFEmojiToken localeData](v4, "localeData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "localeIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "copy");
        localeIdentifier = v4->_localeIdentifier;
        v4->_localeIdentifier = (NSString *)v10;

      }
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (EMFEmojiToken)initWithString:(id)a3 localeIdentifier:(id)a4
{
  id v6;
  id v7;
  EMFEmojiToken *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *string;
  uint64_t v12;
  NSString *localeIdentifier;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v15.receiver = self;
    v15.super_class = (Class)EMFEmojiToken;
    v8 = -[EMFEmojiToken init](&v15, sel_init);
    if (v8)
    {
      if (+[EMFStringUtilities _genderEmojiBaseStringNeedVariantSelector:](EMFStringUtilities, "_genderEmojiBaseStringNeedVariantSelector:", v6))
      {
        objc_msgSend(v6, "stringByAppendingString:", CFSTR("️"));
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v9;
      }
      v8->_emojiTokenRef = 0;
      v10 = objc_msgSend(v6, "copy");
      string = v8->_string;
      v8->_string = (NSString *)v10;

      v12 = objc_msgSend(v7, "copy");
      localeIdentifier = v8->_localeIdentifier;
      v8->_localeIdentifier = (NSString *)v12;

    }
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  __EmojiTokenWrapper *emojiTokenRef;
  NSString *localeIdentifier;
  NSString *string;
  objc_super v6;

  emojiTokenRef = self->_emojiTokenRef;
  if (emojiTokenRef)
    CFRelease(emojiTokenRef);
  self->_emojiTokenRef = 0;
  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = 0;

  string = self->_string;
  self->_string = 0;

  v6.receiver = self;
  v6.super_class = (Class)EMFEmojiToken;
  -[EMFEmojiToken dealloc](&v6, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[EMFEmojiToken string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; string = \"%@\"), v4);

  if (self->_localeIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR("; locale = \"%@\"), self->_localeIdentifier);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  __EmojiTokenWrapper *emojiTokenRef;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  emojiTokenRef = self->_emojiTokenRef;
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (!emojiTokenRef)
    return (id)objc_msgSend(v5, "initWithString:localeIdentifier:", self->_string, self->_localeIdentifier);
  v6 = (_QWORD *)objc_msgSend(v5, "initWithCEMEmojiToken:", self->_emojiTokenRef);
  v7 = -[NSString copy](self->_localeIdentifier, "copy");
  v8 = (void *)v6[3];
  v6[3] = v7;

  return v6;
}

- (EMFEmojiToken)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  EMFEmojiToken *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emojiString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[EMFEmojiToken initWithString:localeIdentifier:](self, "initWithString:localeIdentifier:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSString *localeIdentifier;
  id v6;

  v6 = a3;
  -[EMFEmojiToken string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("emojiString"));
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
    objc_msgSend(v6, "encodeObject:forKey:", localeIdentifier, CFSTR("localeIdentifier"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[EMFEmojiToken string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)string
{
  NSString *string;

  string = self->_string;
  if (string)
    return (NSString *)(id)-[NSString copy](string, "copy");
  CEMEmojiTokenGetString();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)_baseString
{
  void *v2;
  void *v3;

  -[EMFEmojiToken string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMFStringUtilities _baseStringForEmojiString:](EMFStringUtilities, "_baseStringForEmojiString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_createEmojiTokenRefIfNecessary
{
  const void *v3;
  __EmojiTokenWrapper *emojiTokenRef;
  __EmojiTokenWrapper *v5;

  if (!self->_emojiTokenRef && self->_string && !self->_didFailCEM)
  {
    if (self->_localeIdentifier)
    {
      v3 = (const void *)CEMCreateEmojiLocaleData();
      emojiTokenRef = (__EmojiTokenWrapper *)CEMEmojiTokenCreateWithString();
      self->_emojiTokenRef = emojiTokenRef;
      if (v3)
      {
        CFRelease(v3);
        emojiTokenRef = self->_emojiTokenRef;
      }
      if (!emojiTokenRef)
        goto LABEL_11;
    }
    else
    {
      v5 = (__EmojiTokenWrapper *)CEMEmojiTokenCreateWithString();
      self->_emojiTokenRef = v5;
      if (!v5)
LABEL_11:
        self->_didFailCEM = 1;
    }
  }
}

- (__EmojiTokenWrapper)emojiTokenRef
{
  -[EMFEmojiToken _createEmojiTokenRefIfNecessary](self, "_createEmojiTokenRefIfNecessary");
  return self->_emojiTokenRef;
}

- (EMFEmojiLocaleData)localeData
{
  void *v2;

  if (self->_emojiTokenRef)
  {
    +[EMFEmojiLocaleData emojiLocaleDataWithCEMEmojiLocaleData:](EMFEmojiLocaleData, "emojiLocaleDataWithCEMEmojiLocaleData:", CEMEmojiTokenGetLocaleData());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_localeIdentifier)
  {
    +[EMFEmojiLocaleData emojiLocaleDataWithLocaleIdentifier:](EMFEmojiLocaleData, "emojiLocaleDataWithLocaleIdentifier:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (EMFEmojiLocaleData *)v2;
}

- (BOOL)supportsSkinToneVariants
{
  return +[EMFStringUtilities _hasSkinToneVariantsForString:](EMFStringUtilities, "_hasSkinToneVariantsForString:", self->_string);
}

- (int)skinTone
{
  EMFEmojiToken *v2;

  v2 = objc_retainAutorelease(self);
  if (-[EMFEmojiToken emojiTokenRef](v2, "emojiTokenRef"))
    return CEMEmojiTokenGetSkinTone();
  else
    return +[EMFStringUtilities _skinToneForString:](EMFStringUtilities, "_skinToneForString:", v2->_string);
}

- (NSArray)skinToneSpecifiers
{
  return (NSArray *)+[EMFStringUtilities _skinToneSpecifiersForString:](EMFStringUtilities, "_skinToneSpecifiersForString:", self->_string);
}

- (NSArray)skinToneChooserVariants
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  uint64_t v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[EMFEmojiToken supportsSkinToneVariants](self, "supportsSkinToneVariants"))
  {
    -[EMFEmojiToken string](self, "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMFStringUtilities _skinToneChooserVariantsForString:](EMFStringUtilities, "_skinToneChooserVariantsForString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v4;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v19)
    {
      v17 = *(_QWORD *)v25;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v5);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v8 = v6;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v21;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v21 != v11)
                  objc_enumerationMutation(v8);
                +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12), 0);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                -[EMFEmojiToken localeIdentifier](self, "localeIdentifier");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "setLocaleIdentifier:", v14);

                objc_msgSend(v7, "addObject:", v13);
                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v10);
          }

          objc_msgSend(v18, "addObject:", v7);
          ++v5;
        }
        while (v5 != v19);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v19);
    }

  }
  else
  {
    v18 = (id)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v18;
}

- (NSArray)skinToneVariants
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[EMFEmojiToken supportsSkinToneVariants](self, "supportsSkinToneVariants"))
  {
    -[EMFEmojiToken string](self, "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMFStringUtilities _skinToneVariantsForString:](EMFStringUtilities, "_skinToneVariantsForString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), 0, (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[EMFEmojiToken localeIdentifier](self, "localeIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setLocaleIdentifier:", v12);

          objc_msgSend(v5, "addObject:", v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v5;
}

- (NSArray)_skinToneVariantStrings
{
  void *v3;
  void *v4;

  if (-[EMFEmojiToken supportsSkinToneVariants](self, "supportsSkinToneVariants"))
  {
    -[EMFEmojiToken string](self, "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMFStringUtilities _skinToneVariantsForString:](EMFStringUtilities, "_skinToneVariantsForString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v4;
}

- (id)copyWithSkinToneVariant:(int)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[EMFEmojiToken string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMFStringUtilities _skinToneVariantsForString:](EMFStringUtilities, "_skinToneVariantsForString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count") || (unint64_t)objc_msgSend(v6, "count") > 0x18)
    goto LABEL_8;
  if (a3 <= 6 && ((0x7Bu >> a3) & 1) != 0)
  {
    objc_msgSend(v6, "objectAtIndex:", qword_1B3E3B350[a3]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFEmojiToken localeIdentifier](self, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocaleIdentifier:", v9);

  if (!v8)
LABEL_8:
    v8 = (void *)-[EMFEmojiToken copy](self, "copy");

  return v8;
}

- (id)copyWithSkinToneVariantSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "count");
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[EMFStringUtilities _skinToneModifierFromSpecifierType:](EMFStringUtilities, "_skinToneModifierFromSpecifierType:", v6);

    v8 = -[EMFEmojiToken copyWithSkinToneVariant:](self, "copyWithSkinToneVariant:", v7);
    if (!v8)
LABEL_8:
      v8 = (id)-[EMFEmojiToken copy](self, "copy");
  }
  else
  {
    if (objc_msgSend(v5, "count") != 2)
      goto LABEL_8;
    -[EMFEmojiToken string](self, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMFStringUtilities _multiPersonStringForString:skinToneVariantSpecifier:](EMFStringUtilities, "_multiPersonStringForString:skinToneVariantSpecifier:", v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", v10, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[EMFEmojiToken localeIdentifier](self, "localeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocaleIdentifier:", v11);

    if (!v8)
      goto LABEL_8;
  }

  return v8;
}

- (NSString)longFormEncodedStringVariantForMultiPersonGrouping
{
  void *v2;
  void *v3;

  -[EMFEmojiToken string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMFStringUtilities _normalizeMultiPersonGroupToLongFormEncoding:](EMFStringUtilities, "_normalizeMultiPersonGroupToLongFormEncoding:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)shortFormEncodedStringVariantForMultiPersonGrouping
{
  void *v2;
  void *v3;

  -[EMFEmojiToken string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMFStringUtilities _normalizeMultiPersonGroupToShortFormEncoding:](EMFStringUtilities, "_normalizeMultiPersonGroupToShortFormEncoding:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int)gender
{
  -[EMFEmojiToken emojiTokenRef](objc_retainAutorelease(self), "emojiTokenRef");
  return CEMEmojiTokenGetGender();
}

- (unsigned)_emojiIndex
{
  __EmojiTokenWrapper *emojiTokenRef;

  -[EMFEmojiToken _createEmojiTokenRefIfNecessary](self, "_createEmojiTokenRefIfNecessary");
  emojiTokenRef = self->_emojiTokenRef;
  if (emojiTokenRef)
    LOWORD(emojiTokenRef) = CEMEmojiTokenGetIndex();
  return (unsigned __int16)emojiTokenRef;
}

- (BOOL)isNewEmoji
{
  return 0;
}

- (BOOL)_shouldHighlightEmoji
{
  int v3;

  v3 = MGGetBoolAnswer();
  if (v3)
    LOBYTE(v3) = -[EMFEmojiToken isNewEmoji](self, "isNewEmoji");
  return v3;
}

- (int)presentationStyle
{
  -[EMFEmojiToken emojiTokenRef](objc_retainAutorelease(self), "emojiTokenRef");
  return CEMEmojiTokenGetPresentationStyle();
}

- (BOOL)supportsPresentationStyle:(int)a3
{
  -[EMFEmojiToken emojiTokenRef](objc_retainAutorelease(self), "emojiTokenRef");
  return CEMEmojiTokenSupportsPresentationStyle() != 0;
}

- (id)copyWithPresentationStyle:(int)a3
{
  const void *PresentationVariant;
  void *v4;

  -[EMFEmojiToken emojiTokenRef](objc_retainAutorelease(self), "emojiTokenRef");
  PresentationVariant = (const void *)CEMEmojiTokenCreatePresentationVariant();
  objc_msgSend((id)objc_opt_class(), "emojiTokenWithCEMEmojiToken:", PresentationVariant);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (PresentationVariant)
    CFRelease(PresentationVariant);
  return v4;
}

- (id)copyWithoutModifiers
{
  EMFEmojiToken *v2;
  const void *CopyRemovingModifiers;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_retainAutorelease(self);
  if (-[EMFEmojiToken emojiTokenRef](v2, "emojiTokenRef"))
  {
    CopyRemovingModifiers = (const void *)CEMEmojiTokenCreateCopyRemovingModifiers();
    objc_msgSend((id)objc_opt_class(), "emojiTokenWithCEMEmojiToken:", CopyRemovingModifiers);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (CopyRemovingModifiers)
      CFRelease(CopyRemovingModifiers);
  }
  else
  {
    -[EMFEmojiToken _baseString](v2, "_baseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", v5, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[EMFEmojiToken localeIdentifier](v2, "localeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocaleIdentifier:", v6);

  }
  return v4;
}

- (BOOL)isEqualIgnoringModifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[EMFEmojiToken _baseString](self, "_baseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_baseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    v7 = 1;
  else
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[EMFEmojiToken string](self, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[EMFEmojiToken string](self, "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[EMFEmojiToken localeIdentifier](self, "localeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
    {
      v12 = 1;
    }
    else
    {
      -[EMFEmojiToken localeIdentifier](self, "localeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localeIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v15, "isEqualToString:", v16);

    }
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (BOOL)isCommon
{
  -[EMFEmojiToken emojiTokenRef](objc_retainAutorelease(self), "emojiTokenRef");
  return CEMEmojiTokenIsCommon() != 0;
}

- (id)relatedEmojiTokens:(unint64_t)a3
{
  const void *v3;
  void *v4;

  -[EMFEmojiToken emojiTokenRef](objc_retainAutorelease(self), "emojiTokenRef");
  v3 = (const void *)CEMEmojiTokenCopyRelatedEmoji();
  objc_msgSend((id)objc_opt_class(), "emojiTokensForCEMEmojiTokens:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    CFRelease(v3);
  return v4;
}

- (id)nameForType:(int)a3
{
  -[EMFEmojiToken emojiTokenRef](objc_retainAutorelease(self), "emojiTokenRef");
  return (id)CEMEmojiTokenCopyName();
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[EMFEmojiToken string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CEMStringIsSingleEmoji() != 0;

  return v3;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end
