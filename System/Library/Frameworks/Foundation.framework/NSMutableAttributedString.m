@implementation NSMutableAttributedString

- (void)removeAttribute:(NSAttributedStringKey)name range:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  BOOL v12;
  NSUInteger v13;
  NSUInteger v14;
  BOOL v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (range.length)
  {
    length = range.length;
    location = range.location;
    -[NSMutableAttributedString beginEditing](self, "beginEditing");
    do
    {
      v18 = 0;
      v19 = 0;
      v8 = (void *)-[NSDictionary mutableCopyWithZone:](-[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", location, &v18), "mutableCopyWithZone:", 0);
      v9 = v8;
      if (location + length >= v19 + v18)
        v10 = v19 + v18;
      else
        v10 = location + length;
      v11 = v10 - v18;
      v12 = location > v18 || v18 >= location + length;
      if (v12)
        v13 = 0;
      else
        v13 = v18;
      if (v12)
        v11 = 0;
      v14 = v10 - location;
      v15 = v18 > location || location >= v19 + v18;
      if (v15)
        v16 = v13;
      else
        v16 = location;
      if (v15)
        v17 = v11;
      else
        v17 = v14;
      v18 = v16;
      v19 = v17;
      objc_msgSend(v8, "removeObjectForKey:", name);
      -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v9, v18, v19);

      location += v19;
      length -= v19;
    }
    while (length);
    -[NSMutableAttributedString endEditing](self, "endEditing");
  }
}

- (void)addAttributes:(NSDictionary *)attrs range:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v15;
  objc_class *v17;
  const char *v18;
  void *v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (range.length)
  {
    if (!attrs)
    {
      v17 = (objc_class *)objc_opt_class();
      v18 = _NSNameOfClass(v17);
      v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s %s: nil value"), v18, sel_getName(a2)), 0);
      objc_exception_throw(v19);
    }
    length = range.length;
    location = range.location;
    -[NSMutableAttributedString beginEditing](self, "beginEditing");
    do
    {
      v20 = 0;
      v21 = 0;
      v8 = (void *)-[NSDictionary mutableCopyWithZone:](-[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", location, &v20), "mutableCopyWithZone:", 0);
      v9 = v8;
      if (location + length >= v21 + v20)
        v10 = v21 + v20;
      else
        v10 = location + length;
      if (v20 >= location + length || location > v20)
        v12 = 0;
      else
        v12 = v10 - v20;
      v13 = v10 - location;
      if (v20 > location || location >= v21 + v20)
        v15 = v12;
      else
        v15 = v13;
      v20 = location;
      v21 = v15;
      if (v15 > length)
        v21 = length;
      objc_msgSend(v8, "addEntriesFromDictionary:", attrs);
      -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v9, v20, v21);

      location += v21;
      length -= v21;
    }
    while (length);
    if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttributes:](self, "_willRequireIntentResolutionWhenContainingAttributes:", attrs))
    {
      -[NSAttributedString _markRequiringIntentResolution](self, "_markRequiringIntentResolution");
    }
    -[NSMutableAttributedString endEditing](self, "endEditing");
  }
}

- (void)appendLocalizedFormat:(NSAttributedString *)format
{
  NSAttributedString *v5;
  id v6;
  va_list va;

  va_start(va, format);
  v5 = [NSAttributedString alloc];
  v6 = -[NSAttributedString _initWithFormat:options:locale:arguments:](v5, "_initWithFormat:options:locale:arguments:", format, 0, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), va);
  -[NSMutableAttributedString appendAttributedString:](self, "appendAttributedString:", v6);

}

- (void)appendAttributedString:(NSAttributedString *)attrString
{
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", -[NSString length](-[NSAttributedString string](self, "string"), "length"), 0, attrString);
}

- (Class)_intentResolver
{
  return objc_lookUpClass("_UIAttributedStringIntentResolver");
}

- (void)addAttribute:(NSAttributedStringKey)name value:(id)value range:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  BOOL v14;
  NSUInteger v15;
  NSUInteger v16;
  BOOL v17;
  NSUInteger v18;
  NSUInteger v19;
  objc_class *v21;
  const char *v22;
  void *v23;
  NSUInteger v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (range.length)
  {
    if (!value)
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = _NSNameOfClass(v21);
      v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s %s: nil value"), v22, sel_getName(a2)), 0);
      objc_exception_throw(v23);
    }
    length = range.length;
    location = range.location;
    -[NSMutableAttributedString beginEditing](self, "beginEditing");
    do
    {
      v24 = 0;
      v25 = 0;
      v10 = (void *)-[NSDictionary mutableCopyWithZone:](-[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", location, &v24), "mutableCopyWithZone:", 0);
      v11 = v10;
      if (location + length >= v25 + v24)
        v12 = v25 + v24;
      else
        v12 = location + length;
      v13 = v12 - v24;
      v14 = location > v24 || v24 >= location + length;
      if (v14)
        v15 = 0;
      else
        v15 = v24;
      if (v14)
        v13 = 0;
      v16 = v12 - location;
      v17 = v24 > location || location >= v25 + v24;
      if (v17)
        v18 = v15;
      else
        v18 = location;
      if (v17)
        v19 = v13;
      else
        v19 = v16;
      v24 = v18;
      v25 = v19;
      objc_msgSend(v10, "setObject:forKey:", value, name);
      -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v11, v24, v25);

      location += v25;
      length -= v25;
    }
    while (length);
    if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttribute:value:](self, "_willRequireIntentResolutionWhenContainingAttribute:value:", name, value))
    {
      -[NSAttributedString _markRequiringIntentResolution](self, "_markRequiringIntentResolution");
    }
    -[NSMutableAttributedString endEditing](self, "endEditing");
  }
}

- (void)enumerateInflectableBlocksInRange:(_NSRange)a3 usingBlock:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *, void *, uint64_t, uint64_t);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__7;
  v23 = __Block_byref_object_dispose__7;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = a3.location + a3.length;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __88__NSMutableAttributedString_NSInflection__enumerateInflectableBlocksInRange_usingBlock___block_invoke;
  v11 = &unk_1E0F4EBE0;
  v13 = &v19;
  v14 = &v15;
  v12 = a4;
  -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:");
  v5 = v20[5];
  if (v5)
  {
    v6 = v16[3];
    v7 = 0;
    (*((void (**)(id, uint64_t, _QWORD, uint64_t, char *))a4 + 2))(a4, v5, 0, v6, &v7);

  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

+ (NSMutableAttributedString)allocWithZone:(_NSZone *)a3
{
  objc_class *v4;

  v4 = (objc_class *)a1;
  if ((id)objc_opt_self() == a1)
    v4 = (objc_class *)objc_opt_self();
  return (NSMutableAttributedString *)NSAllocateObject(v4, 0, a3);
}

- (NSMutableString)mutableString
{
  return (NSMutableString *)(id)objc_msgSend(objc_allocWithZone((Class)NSMutableStringProxyForMutableAttributedString), "initWithMutableAttributedString:", self);
}

void __88__NSMutableAttributedString_NSInflection__enumerateInflectableBlocksInRange_usingBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  _NSInflectionRuleExplicit *v8;
  _NSInflectionRuleExplicit *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  _NSInflectionRuleExplicit *v13;

  v8 = -[_NSInflectionRuleExplicit initWithAttributesDictionary:]([_NSInflectionRuleExplicit alloc], "initWithAttributesDictionary:", a2);
  if (!v8)
    v8 = (_NSInflectionRuleExplicit *)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflect")), "copy");
  v9 = *(_NSInflectionRuleExplicit **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v9 == v8 || (v13 = v8, v10 = -[_NSInflectionRuleExplicit isEqual:](v9, "isEqual:", v8), v8 = v13, v10))
  {

  }
  else
  {
    v11 = a3 + a4;
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
    {
      (*(void (**)(void))(a1[4] + 16))();
      v12 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    }
    else
    {
      v12 = 0;
    }

    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = v13;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v11;
  }
}

- (void)insertAttributedString:(NSAttributedString *)attrString atIndex:(NSUInteger)loc
{
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", loc, 0, attrString);
}

- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSMutableAttributedString"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSMutableAttributedString"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)addAttributesWeakly:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSDictionary *v8;
  void *v9;
  void *v10;
  NSUInteger v11;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    -[NSMutableAttributedString beginEditing](self, "beginEditing");
    do
    {
      v17 = 0;
      v18 = 0;
      v8 = -[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", location, &v17);
      v9 = (void *)objc_msgSend(a3, "mutableCopyWithZone:", 0);
      v10 = v9;
      if (location + length >= v18 + v17)
        v11 = v18 + v17;
      else
        v11 = location + length;
      if (v17 >= location + length || location > v17)
        v13 = 0;
      else
        v13 = v11 - v17;
      v14 = v11 - location;
      if (v17 > location || location >= v18 + v17)
        v16 = v13;
      else
        v16 = v14;
      v17 = location;
      v18 = v16;
      if (v16 > length)
        v18 = length;
      objc_msgSend(v9, "addEntriesFromDictionary:", v8);
      -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v10, v17, v18);

      location += v18;
      length -= v18;
    }
    while (length);
    if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttributes:](self, "_willRequireIntentResolutionWhenContainingAttributes:", a3))
    {
      -[NSAttributedString _markRequiringIntentResolution](self, "_markRequiringIntentResolution");
    }
    -[NSMutableAttributedString endEditing](self, "endEditing");
  }
}

- (void)replaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)attrString
{
  NSUInteger length;
  NSUInteger location;
  NSString *v8;
  unint64_t v9;
  unint64_t i;
  NSDictionary *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  length = range.length;
  location = range.location;
  v14 = *MEMORY[0x1E0C80C00];
  v8 = -[NSAttributedString string](attrString, "string");
  v9 = -[NSString length](v8, "length");
  v12 = 0;
  v13 = 0;
  -[NSMutableAttributedString beginEditing](self, "beginEditing");
  -[NSMutableAttributedString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", location, length, v8);
  if (v9)
  {
    for (i = 0; i < v9; v12 = i)
    {
      v11 = -[NSAttributedString attributesAtIndex:effectiveRange:](attrString, "attributesAtIndex:effectiveRange:", i, &v12);
      -[NSMutableAttributedString setAttributes:range:](self, "setAttributes:range:", v11, v12 + location, v13);
      i = v12 + v13;
    }
  }
  if (-[NSAttributedString _mayRequireIntentResolution](attrString, "_mayRequireIntentResolution"))
    -[NSAttributedString _markRequiringIntentResolution](self, "_markRequiringIntentResolution");
  -[NSMutableAttributedString endEditing](self, "endEditing");
}

- (void)deleteCharactersInRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  NSAttributedString *v6;

  length = range.length;
  location = range.location;
  v6 = objc_alloc_init(NSAttributedString);
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", location, length, v6);

}

- (void)setAttributedString:(NSAttributedString *)attrString
{
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", 0, -[NSString length](-[NSAttributedString string](self, "string"), "length"), attrString);
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)_addAttributesIfNotPresentMergingInlinePresentationIntents:(id)a3 toRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  _QWORD v9[8];

  length = a4.length;
  location = a4.location;
  v9[7] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSInlinePresentationIntent"));
    if (v8)
      v8 = (void *)objc_msgSend(v8, "unsignedIntegerValue");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __110__NSMutableAttributedString_NSInflection___addAttributesIfNotPresentMergingInlinePresentationIntents_toRange___block_invoke;
    v9[3] = &unk_1E0F4E9D8;
    v9[5] = self;
    v9[6] = v8;
    v9[4] = a3;
    -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:", location, length, 0x100000, v9);
  }
}

uint64_t __110__NSMutableAttributedString_NSInflection___addAttributesIfNotPresentMergingInlinePresentationIntents_toRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a2, "objectForKeyedSubscript:");
  v9 = *(_QWORD *)(a1 + 48);
  if (v8)
    v8 = objc_msgSend((id)v8, "unsignedIntegerValue");
  v16 = v8 | v9;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = *(void **)(a1 + 32);
  result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (result)
  {
    v12 = result;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        if (!objc_msgSend(a2, "objectForKeyedSubscript:", v15))
          objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v15, objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v15), a3, a4);
        ++v14;
      }
      while (v12 != v14);
      result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      v12 = result;
    }
    while (result);
  }
  if (v16)
    return objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", CFSTR("NSInlinePresentationIntent"), +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"), a3, a4);
  return result;
}

- (id)_formatInflectionAlternative:(id)a3 withReplacements:(id)a4
{
  NSMutableAttributedString *v6;
  NSMutableAttributedString *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSString *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  NSString *v26;
  uint64_t v27;
  uint64_t v28;
  NSString *v29;
  uint64_t v30;
  NSCharacterSet *v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = -[NSCharacterSet invertedSet](+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("0123456789")), "invertedSet");
  if (_NSIsNSString())
  {
    v6 = -[NSMutableAttributedString initWithString:]([NSMutableAttributedString alloc], "initWithString:", a3);
  }
  else
  {
    if (!_NSIsNSAttributedString())
    {
LABEL_38:
      v7 = 0;
      return v7;
    }
    v6 = (NSMutableAttributedString *)objc_msgSend(a3, "mutableCopy");
  }
  v7 = v6;
  if (v6)
  {
    -[NSAttributedString length](v6, "length");
    v8 = -[NSString rangeOfString:](-[NSAttributedString string](v7, "string"), "rangeOfString:", CFSTR("{"));
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v8;
      v12 = CFSTR("{");
      while (v11 < -[NSAttributedString length](v7, "length") - 1)
      {
        v13 = v11 + 1;
        if (-[NSString characterAtIndex:](-[NSAttributedString string](v7, "string"), "characterAtIndex:", v11 + 1) == 123)
        {
          -[NSMutableString replaceCharactersInRange:withString:](-[NSMutableAttributedString mutableString](v7, "mutableString"), "replaceCharactersInRange:withString:", v11, 2, v12);
        }
        else
        {
          v14 = -[NSString rangeOfString:options:range:](-[NSAttributedString string](v7, "string"), "rangeOfString:options:range:", CFSTR("}"), 0, v11 + 1, -[NSAttributedString length](v7, "length") - v13);
          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_37;
          v15 = v14 + ~v11;
          v16 = -[NSString substringWithRange:](-[NSAttributedString string](v7, "string"), "substringWithRange:", v11 + 1, v15);
          if (-[NSString rangeOfCharacterFromSet:](v16, "rangeOfCharacterFromSet:", v33) != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_37;
          v17 = -[NSString integerValue](v16, "integerValue");
          v18 = v17 - 1;
          if (v17 < 1)
            goto LABEL_37;
          v19 = v17;
          if (v18 >= objc_msgSend(a4, "count")
            || objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v18), "index") != v19
            || (v20 = (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", v18)) == 0)
          {
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            v21 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
            if (!v21)
              goto LABEL_37;
            v22 = v21;
            v23 = *(_QWORD *)v36;
LABEL_25:
            v24 = v12;
            v25 = 0;
            while (1)
            {
              if (*(_QWORD *)v36 != v23)
                objc_enumerationMutation(a4);
              v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v25);
              if (objc_msgSend(v20, "index") == v19)
                break;
              if (v22 == ++v25)
              {
                v22 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
                v12 = v24;
                if (v22)
                  goto LABEL_25;
                goto LABEL_37;
              }
            }
            v12 = v24;
            if (!v20)
              goto LABEL_37;
          }
          v26 = -[NSAttributedString string](self, "string");
          v27 = objc_msgSend(v20, "replacementRangeInResult");
          v29 = -[NSString substringWithRange:](v26, "substringWithRange:", v27, v28);
          -[NSMutableString replaceCharactersInRange:withString:](-[NSMutableAttributedString mutableString](v7, "mutableString"), "replaceCharactersInRange:withString:", v11, v15 + 2, v29);
          v30 = -[NSString length](v29, "length");
          if (v30 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_37;
          v13 = v30 + v11;
        }
        v11 = -[NSString rangeOfString:options:range:](-[NSAttributedString string](v7, "string"), "rangeOfString:options:range:", v12, 0, v13, -[NSAttributedString length](v7, "length") - v13);
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_7;
      }
      goto LABEL_37;
    }
LABEL_7:
    -[NSAttributedString length](v7, "length");
    v9 = -[NSString rangeOfString:](-[NSAttributedString string](v7, "string"), "rangeOfString:", CFSTR("}"));
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v9;
      while (v10 < -[NSAttributedString length](v7, "length") - 1
           && -[NSString characterAtIndex:](-[NSAttributedString string](v7, "string"), "characterAtIndex:", v10 + 1) == 125)
      {
        -[NSMutableString replaceCharactersInRange:withString:](-[NSMutableAttributedString mutableString](v7, "mutableString"), "replaceCharactersInRange:withString:", v10, 2, CFSTR("}"));
        v10 = -[NSString rangeOfString:options:range:](-[NSAttributedString string](v7, "string"), "rangeOfString:options:range:", CFSTR("}"), 0, v10 + 1, -[NSAttributedString length](v7, "length") - (v10 + 1));
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          return v7;
      }
LABEL_37:

      goto LABEL_38;
    }
  }
  return v7;
}

- (void)_inflectWithLocale:(id)a3 replacements:(id)a4 concepts:(id)a5 preflight:(BOOL)a6
{
  id v11;
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v11 = +[NSTermOfAddress currentUser](NSTermOfAddress, "currentUser");
  v22[4] = self;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke;
  v23[3] = &unk_1E0F4EA00;
  v23[4] = self;
  v21[4] = self;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_2;
  v22[3] = &unk_1E0F4EA28;
  v20[4] = self;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_3;
  v21[3] = &unk_1E0F4EA50;
  v19[4] = self;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_4;
  v20[3] = &unk_1E0F4EA50;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_5;
  v19[3] = &unk_1E0F4EA78;
  v17[4] = self;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_6;
  v18[3] = &unk_1E0F4EAA0;
  v18[4] = self;
  v16[4] = self;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_7;
  v17[3] = &unk_1E0F4EAC8;
  v15[4] = self;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_8;
  v16[3] = &unk_1E0F4EAF0;
  v14[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_9;
  v15[3] = &unk_1E0F4EB40;
  v13[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_11;
  v14[3] = &unk_1E0F4EB68;
  v12[5] = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_12;
  v13[3] = &unk_1E0F4EB90;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_13;
  v12[3] = &unk_1E0F4EBB8;
  v12[4] = self;
  _NSInflect((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)v11, (uint64_t)v23, a6, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)v19, (uint64_t)v18, (uint64_t)v17, (uint64_t)v16, (uint64_t)v15, (uint64_t)v14, (uint64_t)v13, (uint64_t)v12);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "length");
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateAttribute:inRange:options:usingBlock:", a2, a3, a4, 2, a5);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateInflectableBlocksInRange:usingBlock:", a2, a3, a4);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateFormattableBlocksInRange:usingBlock:", a2, a3, a4);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", a2, a3, a4);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
    return 0;
  v3 = a3;
  while (1)
  {
    v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "string"), "rangeOfString:options:range:", CFSTR("%"), 0, a2, v3);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    v8 = v6;
    v9 = a2 + v3;
    if (v6 > v9 - 2)
      return 0;
    v10 = v7;
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "string"), "characterAtIndex:", v6 + 1) != 37)
      break;
    a2 = v8 + v10;
    v3 = v9 - (v8 + v10);
    if (!v3)
      return 0;
  }
  return 1;
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_firstValueOfAttributeWithKey:inRange:", a2, a3, a4);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "string"), "substringWithRange:", a2, a3);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableString");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_10;
  v9[3] = &unk_1E0F4EB18;
  v9[4] = a4;
  return objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", a2, a3, 3, v9);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8;

  if (_NSIsNSString())
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "mutableString"), "replaceCharactersInRange:withString:", a2, a3, a4);
  }
  else if (_NSIsNSAttributedString())
  {
    v8 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_identicalAttributesInRange:", a2, a3), "mutableCopy");
    objc_msgSend(v8, "removeObjectForKey:", CFSTR("NSInflectionAlternative"));
    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", a2, a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "_addAttributesIfNotPresentMergingInlinePresentationIntents:toRange:", v8, a2, objc_msgSend(a4, "length"));

  }
  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSMutableAttributedString(NSInflection) _inflectWithLocale:replacements:concepts:preflight:]_block_invoke_11"), CFSTR("NSAttributedString_Inflection.m"), 1037, CFSTR("Unknown kind of replacement: %@"), a4);
  }
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", a4, a5, a2, a3);
}

uint64_t __94__NSMutableAttributedString_NSInflection___inflectWithLocale_replacements_concepts_preflight___block_invoke_13(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_formatInflectionAlternative:withReplacements:", a2, *(_QWORD *)(a1 + 40));
}

- (void)enumerateFormattableBlocksInRange:(_NSRange)a3 usingBlock:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD *, void *, uint64_t, uint64_t);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__7;
  v23 = __Block_byref_object_dispose__7;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = a3.location + a3.length;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __88__NSMutableAttributedString_NSInflection__enumerateFormattableBlocksInRange_usingBlock___block_invoke;
  v11 = &unk_1E0F4EBE0;
  v13 = &v19;
  v14 = &v15;
  v12 = a4;
  -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:");
  v5 = v20[5];
  if (v5)
  {
    v6 = v16[3];
    v7 = 0;
    (*((void (**)(id, uint64_t, _QWORD, uint64_t, char *))a4 + 2))(a4, v5, 0, v6, &v7);

  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

uint64_t __88__NSMutableAttributedString_NSInflection__enumerateFormattableBlocksInRange_usingBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t result;
  uint64_t v9;
  void *v10;

  v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSLocalizedNumberFormat"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v7 = 0;
  result = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  if ((void *)result != v7)
  {
    result = objc_msgSend((id)result, "isEqual:", v7);
    if ((result & 1) == 0)
    {
      v9 = a3 + a4;
      if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
      {
        (*(void (**)(void))(a1[4] + 16))();
        v10 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
      }
      else
      {
        v10 = 0;
      }

      result = objc_msgSend(v7, "copy");
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = result;
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
    }
  }
  return result;
}

@end
