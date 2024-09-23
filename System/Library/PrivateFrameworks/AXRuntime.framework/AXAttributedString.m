@implementation AXAttributedString

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[AXAttributedString setAttribute:forKey:withRange:](self, "setAttribute:forKey:withRange:", v7, v6, 0, -[AXAttributedString length](self, "length"));

}

- (void)setAttribute:(id)a3 forKey:(id)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  __CFString *v10;
  __CFAttributedString *string;
  const __CFDictionary *v12;
  __CFString *v13;
  _QWORD v14[2];
  CFRange v15;
  CFRange v16;

  length = a5.length;
  location = a5.location;
  v14[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (__CFString *)a4;
  if (v10 && location + length <= CFAttributedStringGetLength(self->_string))
  {
    string = self->_string;
    if (v9)
    {
      v13 = v10;
      v14[0] = v9;
      v12 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v15.location = location;
      v15.length = length;
      CFAttributedStringSetAttributes(string, v15, v12, 0);
    }
    else
    {
      v16.location = location;
      v16.length = length;
      CFAttributedStringRemoveAttribute(string, v16, v10);
    }
  }

}

- (unint64_t)length
{
  unint64_t result;

  result = (unint64_t)self->_string;
  if (result)
    return CFAttributedStringGetLength((CFAttributedStringRef)result);
  return result;
}

+ (id)axAttributedStringWithString:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "copy");
  else
    v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:", v3);
  v5 = (void *)v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXAttributedString *v4;
  void *v5;
  AXAttributedString *v6;

  v4 = -[AXAttributedString initWithCFAttributedString:](+[AXAttributedString allocWithZone:](AXAttributedString, "allocWithZone:", a3), "initWithCFAttributedString:", -[AXAttributedString cfAttributedString](self, "cfAttributedString"));
  -[NSObject _accessibilityAttributedLocalizedString](self, "_accessibilityAttributedLocalizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[AXAttributedString initWithCFAttributedString:]([AXAttributedString alloc], "initWithCFAttributedString:", objc_msgSend(v5, "cfAttributedString"));
    -[NSObject _setAccessibilityAttributedLocalizedString:](v4, "_setAccessibilityAttributedLocalizedString:", v6);

  }
  return v4;
}

- (AXAttributedString)initWithCFAttributedString:(__CFAttributedString *)a3
{
  __CFAttributedString *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  AXAttributedString *v8;
  objc_super v10;

  if (a3)
  {
    v4 = a3;
    -[__CFAttributedString string](v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      AXRuntimeLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[AXAttributedString initWithCFAttributedString:].cold.1((uint64_t)v5, v7);
      v8 = 0;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)AXAttributedString;
      self = -[AXAttributedString init](&v10, sel_init);
      if (!self)
      {
        v8 = 0;
        goto LABEL_12;
      }
      self->_string = CFAttributedStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v4);
      -[NSObject _accessibilityAttributedLocalizedString](self, "_accessibilityAttributedLocalizedString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");

      -[NSObject _setAccessibilityAttributedLocalizedString:](self, "_setAccessibilityAttributedLocalizedString:", v7);
      self = self;
      v8 = self;
    }

LABEL_12:
    goto LABEL_13;
  }
  v8 = 0;
LABEL_13:

  return v8;
}

- (AXAttributedString)initWithString:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  AXAttributedString *v6;
  AXAttributedString *v7;
  AXAttributedString *v8;
  const __CFAllocator *v9;
  const __CFAttributedString *v10;
  void *v11;
  objc_super v13;

  v4 = (__CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_1E691BCF0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (AXAttributedString *)-[__CFString copy](v5, "copy");

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)AXAttributedString;
    v7 = -[AXAttributedString init](&v13, sel_init);
    if (v7)
    {
      v8 = v7;
      v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v10 = CFAttributedStringCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, 0);
      v8->_string = CFAttributedStringCreateMutableCopy(v9, 0, v10);
      CFRelease(v10);
      -[__CFString _accessibilityAttributedLocalizedString](v5, "_accessibilityAttributedLocalizedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject _setAccessibilityAttributedLocalizedString:](v8, "_setAccessibilityAttributedLocalizedString:", v11);
      v6 = v8;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (__CFAttributedString)cfAttributedString
{
  return self->_string;
}

- (void)dealloc
{
  __CFAttributedString *string;
  objc_super v4;

  string = self->_string;
  if (string)
  {
    CFRelease(string);
    self->_string = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXAttributedString;
  -[AXAttributedString dealloc](&v4, sel_dealloc);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (id)string
{
  return (id)objc_msgSend(a1, "axAttributedStringWithString:", &stru_1E691BCF0);
}

- (AXAttributedString)initWithStringOrAttributedString:(id)a3
{
  id v4;
  AXAttributedString *v5;
  AXAttributedString *v6;
  AXAttributedString *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[AXAttributedString initWithCFAttributedString:](self, "initWithCFAttributedString:", v4);
  else
    v5 = -[AXAttributedString initWithString:](self, "initWithString:", v4);
  v6 = v5;

  v7 = v6;
  return v7;
}

- (id)stringByTrimmingCharactersInSet:(id)a3
{
  id v4;
  CFMutableAttributedStringRef *v5;
  uint64_t v6;
  CFRange v7;
  uint64_t v8;
  uint64_t v9;
  CFIndex v10;
  CFIndex v11;
  CFIndex v12;
  CFRange v14;

  v4 = a3;
  v5 = (CFMutableAttributedStringRef *)-[AXAttributedString copy](self, "copy");
  v6 = -[CFMutableAttributedStringRef rangeOfCharacterFromSet:options:range:](v5, "rangeOfCharacterFromSet:options:range:", v4, 0, 0, -[CFMutableAttributedStringRef length](v5, "length"));
  if (v7.location && !v6)
  {
    v7.length = v7.location;
    do
    {
      v7.location = 0;
      CFAttributedStringReplaceString(v5[1], v7, &stru_1E691BCF0);
      v8 = -[CFMutableAttributedStringRef rangeOfCharacterFromSet:options:range:](v5, "rangeOfCharacterFromSet:options:range:", v4, 0, 0, -[CFMutableAttributedStringRef length](v5, "length"));
      if (!v7.location)
        break;
      v7.length = v7.location;
    }
    while (!v8);
  }
  do
  {
    v9 = -[CFMutableAttributedStringRef rangeOfCharacterFromSet:options:range:](v5, "rangeOfCharacterFromSet:options:range:", v4, 4, 0, -[CFMutableAttributedStringRef length](v5, "length", v7.length));
    if (!v10)
      break;
    v11 = v9;
    v12 = v10;
    if (v9 + v10 != -[CFMutableAttributedStringRef length](v5, "length"))
      break;
    v14.location = v11;
    v14.length = v12;
    CFAttributedStringReplaceString(v5[1], v14, &stru_1E691BCF0);
  }
  while (v11 != 0x7FFFFFFFFFFFFFFFLL);

  return v5;
}

- (void)convertAttachmentsWithBlock:(id)a3
{
  uint64_t (**v4)(id, uint64_t);
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v4 = (uint64_t (**)(id, uint64_t))a3;
  v12 = 0;
  v13 = 0;
  v5 = -[AXAttributedString length](self, "length");
  v6 = 0;
  while (1)
  {
    -[AXAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", v6, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    objc_msgSend(v7, "objectForKey:", UIAccessibilityTokenAttachment);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v4 && v9)
    {
      v11 = v4[2](v4, v9);
      -[AXAttributedString setAttribute:forKey:withRange:](self, "setAttribute:forKey:withRange:", v11, UIAccessibilityTokenAttachment, v12, v13);
    }
    v12 += v13;

    v6 = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL || v12 >= v5)
      goto LABEL_10;
  }

LABEL_10:
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;

  length = a4.length;
  location = a4.location;
  CFAttributedStringGetString(self->_string);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getCharacters:range:", a3, location, length);

}

- (id)substringWithRange:(_NSRange)a3
{
  void *v3;
  AXAttributedString *v4;

  -[__CFAttributedString attributedSubstringFromRange:](self->_string, "attributedSubstringFromRange:", a3.location, a3.length);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[AXAttributedString initWithStringOrAttributedString:]([AXAttributedString alloc], "initWithStringOrAttributedString:", v3);

  return v4;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  void *v4;

  CFAttributedStringGetString(self->_string);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(a3) = objc_msgSend(v4, "characterAtIndex:", a3);

  return a3;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  CFAttributedStringReplaceString(self->_string, (CFRange)a3, (CFStringRef)a4);
}

- (void)replaceString:(__CFString *)a3
{
  __CFAttributedString *string;
  CFRange v5;

  if (a3)
  {
    string = self->_string;
    v5.length = -[AXAttributedString length](self, "length");
    v5.location = 0;
    CFAttributedStringReplaceString(string, v5, a3);
  }
}

- (id)attributedString
{
  return self->_string;
}

- (void)setAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXAttributedString setAttribute:forKey:](self, "setAttribute:forKey:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)addAttribute:(id)a3 forKey:(id)a4 withRange:(_NSRange)a5
{
  -[__CFAttributedString addAttribute:value:range:](self->_string, "addAttribute:value:range:", a4, a3, a5.location, a5.length);
}

- (void)removeAttributes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFString *v10;
  __CFAttributedString *string;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;
  CFRange v18;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CFAttributedStringBeginEditing(self->_string);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(const __CFString **)(*((_QWORD *)&v12 + 1) + 8 * i);
        string = self->_string;
        v18.length = CFAttributedStringGetLength(string);
        v18.location = 0;
        CFAttributedStringRemoveAttribute(string, v18, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  CFAttributedStringEndEditing(self->_string);
}

- (void)setAttributes:(id)a3 withRange:(_NSRange)a4
{
  int64_t length;
  NSUInteger location;
  const __CFDictionary *replacement;
  CFRange v8;

  length = a4.length;
  location = a4.location;
  replacement = (const __CFDictionary *)a3;
  if (location + length <= CFAttributedStringGetLength(self->_string))
  {
    if (length >= 1)
    {
      v8.location = location;
      v8.length = length;
      CFAttributedStringSetAttributes(self->_string, v8, replacement, 0);
    }
  }
  else
  {
    NSLog((NSString *)CFSTR("AX: bad range passed into setAttributes: %lu %lu"), location, length);
  }

}

- (id)axAttributedStringByReplacingOccurrencesOfString:(id)a3 withString:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[AXAttributedString stringByReplacingOccurrencesOfString:withString:options:range:](self, "stringByReplacingOccurrencesOfString:withString:options:range:", v7, v6, 0, 0, -[AXAttributedString length](self, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)axStringByReplacingCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  __CFString *v7;
  CFMutableAttributedStringRef *v8;
  CFRange v10;
  CFRange v11;

  length = a3.length;
  location = a3.location;
  v7 = (__CFString *)a4;
  v8 = (CFMutableAttributedStringRef *)-[AXAttributedString copy](self, "copy");
  v10.location = location;
  v10.length = length;
  CFAttributedStringSetAttributes(v8[1], v10, MEMORY[0x1E0C9AA70], 1u);
  v11.location = location;
  v11.length = length;
  CFAttributedStringReplaceString(v8[1], v11, v7);

  return v8;
}

- (id)stringByReplacingOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  int64_t v12;
  void *v13;
  uint64_t (**v14)(void *, void *, _QWORD);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  __CFAttributedString *MutableCopy;
  AXAttributedString *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  AXAttributedString *v61;
  void *v62;
  id obja;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD aBlock[5];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;
  CFRange v77;
  CFRange v78;

  length = a6.length;
  location = a6.location;
  v76 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  CFAttributedStringGetString(self->_string);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AXAttributedString length](self, "length");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__AXAttributedString_stringByReplacingOccurrencesOfString_withString_options_range___block_invoke;
  aBlock[3] = &unk_1E6919678;
  v61 = self;
  aBlock[4] = self;
  v14 = (uint64_t (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  if (location)
  {
    v15 = 0;
    do
    {
      v16 = v14[2](v14, v13, v15);
      v15 = v16 + v17;
    }
    while (v16 + v17 < location);
  }
  v18 = location + length;
  if ((uint64_t)(location + length) < v12)
  {
    v19 = location + length;
    do
    {
      v20 = v14[2](v14, v13, v19);
      v19 = v20 + v21;
    }
    while (v20 + v21 < v12);
  }
  if (location < v18)
  {
    v22 = location;
    do
    {
      v23 = v14[2](v14, v60, v22);
      v22 = v23 + v24;
    }
    while (v23 + v24 < v18);
  }
  v57 = v14;
  objc_msgSend(v62, "substringWithRange:", location, length);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v11;
  v59 = v10;
  objc_msgSend(v25, "stringByReplacingOccurrencesOfString:withString:options:range:", v10, v11, a5, 0, objc_msgSend(v25, "length"));
  v26 = (const __CFString *)objc_claimAutoreleasedReturnValue();

  MutableCopy = CFAttributedStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v61->_string);
  v77.location = location;
  v77.length = length;
  v56 = (__CFString *)v26;
  CFAttributedStringReplaceString(MutableCopy, v77, v26);
  v78.length = CFAttributedStringGetLength(MutableCopy);
  v78.location = 0;
  CFAttributedStringSetAttributes(MutableCopy, v78, MEMORY[0x1E0C9AA70], 1u);
  v28 = -[AXAttributedString initWithCFAttributedString:]([AXAttributedString alloc], "initWithCFAttributedString:", MutableCopy);
  CFRelease(MutableCopy);
  v29 = -[AXAttributedString length](v28, "length") - v12;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obja = v13;
  v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v70 != v32)
          objc_enumerationMutation(obja);
        v34 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(v34, "objectAtIndex:", 0, v56);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "rangeValue");
        v38 = v37;

        objc_msgSend(v34, "objectAtIndex:", 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36 >= v18)
          v40 = v29;
        else
          v40 = 0;
        -[AXAttributedString setAttributes:withRange:](v28, "setAttributes:withRange:", v39, v40 + v36, v38);

      }
      v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
    }
    while (v31);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v41 = v60;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v66;
    v45 = v29 + v18;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v66 != v44)
          objc_enumerationMutation(v41);
        v47 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
        objc_msgSend(v47, "objectAtIndex:", 0, v56);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "rangeValue");
        v51 = v50;

        objc_msgSend(v47, "objectAtIndex:", 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49 + v51 <= v45)
          -[AXAttributedString setAttributes:withRange:](v28, "setAttributes:withRange:", v52, v49, v51);

      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
    }
    while (v43);
  }

  -[NSObject _accessibilityAttributedLocalizedString](v61, "_accessibilityAttributedLocalizedString");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v53, "copy");

  if (v54)
    -[NSObject _setAccessibilityAttributedLocalizedString:](v28, "_setAccessibilityAttributedLocalizedString:", v54);

  return v28;
}

uint64_t __84__AXAttributedString_stringByReplacingOccurrencesOfString_withString_options_range___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v10 = xmmword_1B54F04E0;
  objc_msgSend(*(id *)(a1 + 32), "attributesAtIndex:effectiveRange:", a3, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  return v10;
}

- (void)appendString:(id)a3
{
  id v4;
  AXAttributedString *v5;

  v4 = a3;
  v5 = -[AXAttributedString initWithString:]([AXAttributedString alloc], "initWithString:", v4);

  -[AXAttributedString appendAXAttributedString:](self, "appendAXAttributedString:", v5);
}

- (void)appendFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:locale:arguments:", v5, 0, &v7);

  -[AXAttributedString appendString:](self, "appendString:", v6);
}

- (void)appendAXAttributedString:(id)a3
{
  if (a3)
    -[__CFAttributedString appendAttributedString:](self->_string, "appendAttributedString:", objc_msgSend(a3, "cfAttributedString"));
}

- (void)appendStringOrAXAttributedString:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AXAttributedString appendAXAttributedString:](self, "appendAXAttributedString:", v4);
  else
    -[AXAttributedString appendString:](self, "appendString:", v4);

}

- (id)attributesAtIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  const __CFDictionary *Length;
  CFDictionaryRef Attributes;
  CFRange v10;

  Length = (const __CFDictionary *)CFAttributedStringGetLength(self->_string);
  if (Length)
  {
    v10 = (CFRange)xmmword_1B54F04F0;
    Attributes = CFAttributedStringGetAttributes(self->_string, a3, &v10);
    if (a4)
      *(CFRange *)a4 = v10;
    Length = Attributes;
  }
  return Length;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  __CFString *v8;
  void *Attribute;
  id v10;
  CFRange v12;

  v8 = (__CFString *)a3;
  if (CFAttributedStringGetLength(self->_string))
  {
    v12 = (CFRange)xmmword_1B54F04F0;
    Attribute = (void *)CFAttributedStringGetAttribute(self->_string, a4, v8, &v12);
    if (a5)
      *(CFRange *)a5 = v12;
    v10 = Attribute;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)attributeValueForKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__AXAttributedString_attributeValueForKey___block_invoke;
  v8[3] = &unk_1E69196A0;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[AXAttributedString enumerateAttributesUsingBlock:](self, "enumerateAttributesUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __43__AXAttributedString_attributeValueForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  void *v8;

  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
    v7 = v8;
    *a5 = 1;
  }

}

- (void)enumerateAttributesUsingBlock:(id)a3
{
  id v4;

  v4 = a3;
  if (-[AXAttributedString length](self, "length"))
    -[__CFAttributedString enumerateAttributesInRange:options:usingBlock:](self->_string, "enumerateAttributesInRange:options:usingBlock:", 0, -[AXAttributedString length](self, "length"), 0, v4);

}

- (void)enumerateAttribute:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  -[__CFAttributedString enumerateAttribute:inRange:options:usingBlock:](self->_string, "enumerateAttribute:inRange:options:usingBlock:", a3, a4.location, a4.length, a5, a6);
}

- (BOOL)isAXAttributedString
{
  return 1;
}

- (BOOL)hasAttributes
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__AXAttributedString_hasAttributes__block_invoke;
  v4[3] = &unk_1E69196C8;
  v4[4] = &v5;
  -[AXAttributedString enumerateAttributesUsingBlock:](self, "enumerateAttributesUsingBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __35__AXAttributedString_hasAttributes__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v7 = a2;
  v8 = v7;
  if (v7)
  {
    v10 = v7;
    v9 = objc_msgSend(v7, "count");
    v8 = v10;
    if (v9)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a5 = 1;
    }
  }

}

- (id)string
{
  return (id)CFAttributedStringGetString(self->_string);
}

- (id)lowercaseString
{
  _QWORD *v3;
  __CFAttributedString *v4;
  CFIndex v5;
  void *v6;
  __CFString *v7;
  CFRange v9;

  v3 = (_QWORD *)-[AXAttributedString copy](self, "copy");
  v4 = (__CFAttributedString *)v3[1];
  v5 = -[AXAttributedString length](self, "length");
  -[AXAttributedString string](self, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9.location = 0;
  v9.length = v5;
  CFAttributedStringReplaceString(v4, v9, v7);

  return v3;
}

- (id)uppercaseString
{
  _QWORD *v3;
  __CFAttributedString *v4;
  CFIndex v5;
  void *v6;
  __CFString *v7;
  CFRange v9;

  v3 = (_QWORD *)-[AXAttributedString copy](self, "copy");
  v4 = (__CFAttributedString *)v3[1];
  v5 = -[AXAttributedString length](self, "length");
  -[AXAttributedString string](self, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uppercaseString");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9.location = 0;
  v9.length = v5;
  CFAttributedStringReplaceString(v4, v9, v7);

  return v3;
}

- (id)attributedSubstringFromRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  __CFAttributedString *MutableCopy;
  CFAttributedStringRef v7;
  const __CFAttributedString *v8;
  BOOL v9;
  void *v10;
  CFRange v12;
  CFRange v13;

  length = a3.length;
  location = a3.location;
  MutableCopy = CFAttributedStringCreateMutableCopy(0, 0, self->_string);
  v7 = CFAttributedStringCreate(0, &stru_1E691BCF0, 0);
  v8 = v7;
  if (MutableCopy)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    if (location + length <= CFAttributedStringGetLength(self->_string))
    {
      if (location)
      {
        v13.location = 0;
        v13.length = location;
        CFAttributedStringReplaceAttributedString(MutableCopy, v13, v8);
      }
      v12.length = CFAttributedStringGetLength(MutableCopy) - length;
      if (v12.length >= 1)
      {
        v12.location = length;
        CFAttributedStringReplaceAttributedString(MutableCopy, v12, v8);
      }
      v10 = (void *)objc_msgSend(objc_allocWithZone((Class)AXAttributedString), "initWithCFAttributedString:", MutableCopy);
    }
    else
    {
      v10 = 0;
    }
LABEL_17:
    CFRelease(v8);
    if (!MutableCopy)
      return v10;
    goto LABEL_8;
  }
  v10 = 0;
  if (v7)
    goto LABEL_17;
  if (MutableCopy)
LABEL_8:
    CFRelease(MutableCopy);
  return v10;
}

- (id)coalescedAttributes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__AXAttributedString_coalescedAttributes__block_invoke;
  v6[3] = &unk_1E69196F0;
  v4 = v3;
  v7 = v4;
  -[AXAttributedString enumerateAttributesUsingBlock:](self, "enumerateAttributesUsingBlock:", v6);

  return v4;
}

void __41__AXAttributedString_coalescedAttributes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v11, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (id)coalescedFontAttributes
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  uint64_t v14;
  unint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = 0;
  v16 = -[AXAttributedString length](self, "length");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  do
  {
    -[AXAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", v3, &v22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {

      return v2;
    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (!v6)
      goto LABEL_24;
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "objectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            if ((objc_msgSend(v10, "isEqualToString:", UIAccessibilityTokenBold) & 1) != 0
              || (objc_msgSend(v10, "isEqualToString:", UIAccessibilityTokenItalic) & 1) != 0
              || (objc_msgSend(v10, "isEqualToString:", UIAccessibilityTokenUnderline) & 1) != 0
              || objc_msgSend(v10, "isEqualToString:", UIAccessibilityTokenMisspelled))
            {
              if ((objc_msgSend(v11, "BOOLValue") & 1) != 0)
                goto LABEL_15;
            }
            else if ((objc_msgSend(v10, "isEqualToString:", UIAccessibilityTokenFontSize) & 1) == 0
                   && !objc_msgSend(v10, "isEqualToString:", UIAccessibilityTokenBlockquoteLevel)
                   || (objc_msgSend(v11, "floatValue"), v13 > 0.01))
            {
LABEL_15:
              objc_msgSend(v2, "setObject:forKey:", v11, v10);
            }
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      v7 = v14;
    }
    while (v14);
LABEL_24:
    v22 += v23;

    v3 = v22;
  }
  while (v22 != 0x7FFFFFFFFFFFFFFFLL && v22 < v16);
  return v2;
}

- (BOOL)hasAttribute:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  unint64_t v12;
  uint64_t v13;

  v4 = a3;
  v12 = 0;
  v13 = 0;
  v5 = -[AXAttributedString length](self, "length");
  v6 = 0;
  while (1)
  {
    -[AXAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", v6, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v12 != 0x7FFFFFFFFFFFFFFFLL;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    objc_msgSend(v7, "objectForKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v10, "BOOLValue") & 1) != 0)
        goto LABEL_10;
    }
    else if (v10)
    {
LABEL_10:

      break;
    }
    v12 += v13;

    v9 = 0;
    v6 = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL || v12 >= v5)
      goto LABEL_12;
  }

LABEL_12:
  return v9;
}

- (id)substringFromIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v16;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AXAttributedString;
  -[AXAttributedString substringFromIndex:](&v18, sel_substringFromIndex_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXAttributedString axAttributedStringWithString:](AXAttributedString, "axAttributedStringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AXAttributedString length](self, "length");
  if (v7 > a3)
  {
    v8 = v7;
    v16 = a3;
    v17 = 0;
    v9 = a3;
    while (1)
    {
      -[AXAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", v9, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v12 = a3 - v16;
      if (a3 < v16)
        v12 = 0;
      v13 = v17 - v12;
      if (v16 >= a3)
        v14 = v16 - a3;
      else
        v14 = 0;
      if (v13 + v14 <= objc_msgSend(v5, "length", v16))
        objc_msgSend(v6, "setAttributes:withRange:", v11, v14, v13);
      v16 += v17;

      v9 = v16;
      if (v16 == 0x7FFFFFFFFFFFFFFFLL || v16 >= v8)
        goto LABEL_15;
    }

  }
LABEL_15:

  return v6;
}

- (id)axAttributedStringDescription
{
  return (id)-[__CFAttributedString description](-[AXAttributedString cfAttributedString](self, "cfAttributedString"), "description");
}

- (id)_axRecursivelyPropertyListCoercedRepresentationWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[AXAttributedString attributedString](self, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_axRecursivelyPropertyListCoercedRepresentationWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:(id *)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AXSerialize3ErrorDomain"), 1, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)initWithCFAttributedString:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1B54A6000, a2, OS_LOG_TYPE_FAULT, "attributedStringRef.string expected to be a string, was actually: %@", (uint8_t *)&v2, 0xCu);
}

@end
