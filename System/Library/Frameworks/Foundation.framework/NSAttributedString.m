@implementation NSAttributedString

- (id)description
{
  NSUInteger v3;
  NSMutableString *v4;
  NSUInteger i;
  NSDictionary *v6;
  uint64_t v7;
  NSString *v8;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[NSAttributedString length](self, "length");
  v4 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 2 * v3);
  v10 = 0;
  v11 = 0;
  if (v3)
  {
    for (i = 0; i < v3; v10 = i)
    {
      v6 = -[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", i, &v10);
      v7 = -[NSString length](v4, "length");
      v8 = -[NSAttributedString string](self, "string");
      -[NSMutableString replaceCharactersInRange:withString:](v4, "replaceCharactersInRange:withString:", v7, 0, -[NSString substringWithRange:](v8, "substringWithRange:", v10, v11));
      -[NSMutableString replaceCharactersInRange:withString:](v4, "replaceCharactersInRange:withString:", -[NSString length](v4, "length"), 0, -[NSDictionary description](v6, "description"));
      i = v10 + v11;
    }
  }
  return v4;
}

- (void)enumerateAttributesInRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void *)block
{
  int v6;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSDictionary *v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  BOOL v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v21;
  NSDictionary *v22;
  NSUInteger v23;
  uint64_t v24;
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (enumerationRange.length)
  {
    v6 = opts;
    length = enumerationRange.length;
    location = enumerationRange.location;
    v10 = ((enumerationRange.length - 1) & ((uint64_t)(opts << 62) >> 63)) + enumerationRange.location;
    v25 = 0;
    v11 = -[NSAttributedString length](self, "length");
LABEL_3:
    v12 = v11;
    while (1)
    {
      v23 = 0;
      v24 = 0;
      if ((v6 & 0x100000) != 0)
      {
        v13 = -[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", v10, &v23);
        v14 = v23;
        if (v24 + v23 >= length + location)
          v15 = length + location;
        else
          v15 = v24 + v23;
        v16 = v15 - location;
        v17 = v23 > location || location >= v24 + v23;
        if (v17)
          v18 = 0;
        else
          v18 = location;
        if (v17)
          v16 = 0;
        v19 = v15 - v23;
        if (location > v23 || v23 >= length + location)
        {
          v14 = v18;
          v21 = v16;
        }
        else
        {
          v21 = v19;
        }
        v23 = v14;
        v24 = v21;
      }
      else
      {
        v13 = -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self, "attributesAtIndex:longestEffectiveRange:inRange:", v10, &v23, location, length);
      }
      v22 = v13;
      (*((void (**)(void *, NSDictionary *, NSUInteger, uint64_t, char *))block + 2))(block, v22, v23, v24, &v25);

      if (v25)
        break;
      if ((v6 & 2) == 0)
      {
        v11 = -[NSAttributedString length](self, "length");
        if (v11 == v12)
          v10 = v24 + v23;
        else
          v10 = v24 + v23 - v12 + v11;
        if (v11 != v12)
          length = length - v12 + v11;
        if (v10 < length + location)
          goto LABEL_3;
        return;
      }
      if (v23 <= location)
        return;
      v10 = v23 - 1;
    }
  }
}

- (BOOL)_willRequireIntentResolutionWhenContainingAttributes:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSInlinePresentationIntent"));
  return v4 && !objc_msgSend(v4, "isEqual:", &off_1E0FBD7D0)
      || objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSPresentationIntent")) != 0;
}

- (BOOL)_mayRequireIntentResolution
{
  return objc_getAssociatedObject(self, &_NSAttributedStringMayRequireIntentResolutionKey) != 0;
}

- (NSDictionary)attributesAtIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit
{
  NSUInteger length;
  unint64_t v6;
  NSDictionary *v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  NSUInteger v14;
  BOOL v15;
  NSRange v17;
  uint64_t v18;

  length = rangeLimit.length;
  v6 = rangeLimit.location;
  v18 = *MEMORY[0x1E0C80C00];
  v9 = -[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", location);
  if (range)
  {
    v17 = *range;
    v10 = v6 + length;
    do
      v11 = v17.length + v17.location;
    while (v17.length + v17.location < v10
         && -[NSDictionary isEqualToDictionary:](-[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", v17.length + v17.location, &v17), "isEqualToDictionary:", v9));
    v17 = *range;
    do
      v12 = v17.location;
    while (v17.location > v6
         && -[NSDictionary isEqualToDictionary:](-[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", v17.location - 1, &v17), "isEqualToDictionary:", v9));
    if (v10 >= v11)
      v13 = v11;
    else
      v13 = v10;
    if (v6 >= v11 || v12 > v6)
    {
      v14 = v13 - v12;
      v15 = v6 > v12 || v12 >= v10;
      if (v15)
        v6 = 0;
      else
        v6 = v12;
      if (v15)
        v14 = 0;
    }
    else
    {
      v14 = v13 - v6;
    }
    range->location = v6;
    range->length = v14;
  }
  return v9;
}

- (BOOL)isEqualToAttributedString:(NSAttributedString *)other
{
  _BOOL4 v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *v12;
  NSDictionary *v13;
  NSUInteger i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (other == self)
    goto LABEL_15;
  v5 = -[NSString isEqual:](-[NSAttributedString string](self, "string"), "isEqual:", -[NSAttributedString string](other, "string"));
  if (!v5)
    return v5;
  v6 = -[NSAttributedString length](self, "length");
  v18 = 0;
  v19 = 0;
  v16 = 0;
  v17 = 0;
  if (!v6)
  {
LABEL_15:
    LOBYTE(v5) = 1;
    return v5;
  }
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  for (i = 0; i < v7; i = v16 + v17 >= (unint64_t)(v18 + v19) ? v18 + v19 : v16 + v17)
  {
    if (i >= v11 + v10)
    {
      v13 = -[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", i, &v18);
      v8 = v16;
      v9 = v17;
    }
    if (i >= v9 + v8)
      v12 = -[NSAttributedString attributesAtIndex:effectiveRange:](other, "attributesAtIndex:effectiveRange:", i, &v16);
    v5 = -[NSDictionary isEqualToDictionary:](v13, "isEqualToDictionary:", v12);
    if (!v5)
      break;
    v8 = v16;
    v9 = v17;
    v10 = v18;
    v11 = v19;
  }
  return v5;
}

uint64_t __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflect"));
  if (result
    || (result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflectionAlternative"))) != 0
    || (result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflectionReferentConcept"))) != 0
    || (result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflectionAgreementConcept"))) != 0
    || (result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflectionAgreementArgument"))) != 0
    || (result = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSLocalizedNumberFormat"))) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflect"))
    || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflectionAlternative"))
    || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflectionReferentConcept"))
    || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflectionAgreementConcept"))
    || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflectionAgreementArgument"))
    || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSLocalizedNumberFormat")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, *(_QWORD *)(a1 + 48) + a3 - *(_QWORD *)(a1 + 56), a4);
}

uint64_t __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflect"))
    || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflectionAlternative"))
    || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflectionReferentConcept"))
    || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflectionAgreementConcept"))
    || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSInflectionAgreementArgument"))
    || objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSLocalizedNumberFormat")))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, *(_QWORD *)(a1 + 48) + a3, a4);
}

- (id)__initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 context:(id)a7 arguments:(char *)a8
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSAttributedString *v52;
  char *v54;
  NSAttributedString *v55;
  void *v56;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char obj;
  id obja;
  NSMutableAttributedString *v69;
  uint64_t v71;
  _QWORD v72[5];
  _QWORD v73[17];
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  _QWORD v78[2];
  id v79;
  const __CFString *v80;
  uint64_t v81;
  _BYTE v82[128];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;

  obj = a4;
  v87 = *MEMORY[0x1E0C80C00];
  v78[1] = 0;
  v79 = 0;
  v78[0] = 0;
  objc_msgSend(a3, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSFormatSpecifierConfiguration"), 0, v78, 0, objc_msgSend(a3, "length"));
  objc_msgSend(a3, "length");
  objc_msgSend(a5, "pluralizationNumber");
  objc_msgSend(a3, "string");
  v54 = a8;
  v11 = _CFStringCreateWithFormatAndArgumentsReturningMetadata();
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  if (v11)
  {
    v69 = -[NSMutableAttributedString initWithString:]([NSMutableAttributedString alloc], "initWithString:", v11, v54);
    v65 = objc_msgSend(a3, "length");
    v55 = self;
    v56 = (void *)v11;
    v66 = objc_msgSend(v79, "count");
    if ((v66 & 0x8000000000000000) == 0)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v64 = *MEMORY[0x1E0C9AB88];
      v63 = *MEMORY[0x1E0C9AB80];
      v62 = *MEMORY[0x1E0C9AB78];
      v61 = *MEMORY[0x1E0C9AB70];
      v60 = *MEMORY[0x1E0C9AB60];
      v59 = *MEMORY[0x1E0C9AB50];
      do
      {
        if (v14 >= v66)
          v15 = 0;
        else
          v15 = (void *)objc_msgSend(v79, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", v64);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          v16 = 0;
        v17 = objc_msgSend(v15, "objectForKeyedSubscript:", v63);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = (void *)v17;
        else
          v18 = 0;
        if (v16)
          v19 = v18 == 0;
        else
          v19 = 1;
        if (v19)
        {
          v20 = 0x7FFFFFFFFFFFFFFFLL;
          v21 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          v20 = objc_msgSend(v16, "integerValue");
          v21 = objc_msgSend(v18, "integerValue");
        }
        v73[8] = MEMORY[0x1E0C809B0];
        v22 = v65;
        if (v15)
          v22 = v20;
        v73[9] = 3221225472;
        v73[10] = __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke;
        v73[11] = &unk_1E0F4ED88;
        v73[14] = v13;
        v73[15] = v12;
        v73[16] = v22 - v12;
        v73[13] = &v74;
        v73[12] = v69;
        objc_msgSend(a3, "enumerateAttributesInRange:options:usingBlock:", v12);
        if (!v15)
          break;
        v23 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", v62);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          v23 = 0;
        v24 = objc_msgSend(v15, "objectForKeyedSubscript:", v61);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = (void *)v24;
        else
          v25 = 0;
        v26 = 0x7FFFFFFFFFFFFFFFLL;
        v27 = 0x7FFFFFFFFFFFFFFFLL;
        if (v23 && v25)
        {
          v26 = objc_msgSend(v23, "integerValue");
          v27 = objc_msgSend(v25, "integerValue");
        }
        v28 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", v60);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & (v28 != 0)) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v29 = v28;
          else
            v29 = 0;
          v28 = (void *)objc_msgSend(v29, "__baseAttributedString");
        }
        v30 = objc_msgSend(v15, "objectForKeyedSubscript:", v59);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v31 = (void *)v30;
        else
          v31 = 0;
        v32 = objc_msgSend(v31, "BOOLValue");
        v33 = objc_msgSend(a3, "attributesAtIndex:effectiveRange:", v20, 0);
        v34 = obj & (v28 != 0);
        if (!v33)
          v34 = 1;
        if ((v34 & 1) == 0)
          -[NSMutableAttributedString addAttributes:range:](v69, "addAttributes:range:", v33, v26, v27);
        if (v32)
        {
          -[NSMutableAttributedString addAttributes:range:](v69, "addAttributes:range:", v33, v26 - 1, 1);
          -[NSMutableAttributedString addAttributes:range:](v69, "addAttributes:range:", v33, v26 + v27, 1);
        }
        if (v28)
        {
          v35 = objc_msgSend(v28, "length");
          v73[0] = MEMORY[0x1E0C809B0];
          v73[1] = 3221225472;
          v73[2] = __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke_2;
          v73[3] = &unk_1E0F4EDB0;
          v73[6] = v26;
          v73[7] = v27;
          v73[5] = &v74;
          v73[4] = v69;
          objc_msgSend(v28, "enumerateAttributesInRange:options:usingBlock:", 0, v35, 0x100000, v73);
        }
        v36 = v26 + v27;
        v12 = v20 + v21;
        ++v14;
        v13 = v36 + v32;
      }
      while (v66 + 1 != v14);
    }
    if ((obj & 2) != 0)
    {
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      obja = v79;
      v37 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v83, v82, 16);
      if (v37)
      {
        v71 = *(_QWORD *)v84;
        v38 = *MEMORY[0x1E0C9AB68];
        v39 = *MEMORY[0x1E0C9AB78];
        v40 = *MEMORY[0x1E0C9AB70];
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v84 != v71)
              objc_enumerationMutation(obja);
            v42 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
            v43 = objc_msgSend(v42, "objectForKeyedSubscript:", v38);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v44 = v43;
            else
              v44 = 0;
            v45 = (void *)objc_msgSend(v42, "objectForKeyedSubscript:", v39);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              v45 = 0;
            v46 = objc_msgSend(v42, "objectForKeyedSubscript:", v40);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v47 = (void *)v46;
            else
              v47 = 0;
            if (v45)
              v48 = v47 == 0;
            else
              v48 = 1;
            if (v48)
            {
              v50 = 0x7FFFFFFFFFFFFFFFLL;
              v49 = 0x7FFFFFFFFFFFFFFFLL;
              if (!v44)
                continue;
            }
            else
            {
              v50 = objc_msgSend(v45, "integerValue");
              v49 = objc_msgSend(v47, "integerValue");
              if (!v44)
                continue;
            }
            if (v50 != 0x7FFFFFFFFFFFFFFFLL && v49 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v80 = CFSTR("NSReplacementIndex");
              v81 = v44;
              -[NSMutableAttributedString addAttributes:range:](v69, "addAttributes:range:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1), v50, v49);
            }
          }
          v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v83, v82, 16);
        }
        while (v37);
      }
    }

    if (*((_BYTE *)v75 + 24)
      || (v51 = -[NSAttributedString length](v69, "length"),
          v72[0] = MEMORY[0x1E0C809B0],
          v72[1] = 3221225472,
          v72[2] = __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke_3,
          v72[3] = &unk_1E0F4E848,
          v72[4] = &v74,
          -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](v69, "enumerateAttributesInRange:options:usingBlock:", 0, v51, 0x100000, v72), *((_BYTE *)v75 + 24)))
    {
      -[NSMutableAttributedString _inflectWithLocale:replacements:concepts:preflight:](v69, "_inflectWithLocale:replacements:concepts:preflight:", a6, +[_NSAttributedStringReplacement _replacementsFromMetadataArray:](_NSAttributedStringReplacement, "_replacementsFromMetadataArray:", v79), objc_msgSend(a7, "objectForKeyedSubscript:", CFSTR("NSContextInflectionConcepts")), 0);
    }
    -[NSMutableAttributedString removeAttribute:range:](v69, "removeAttribute:range:", CFSTR("NSFormatSpecifierConfiguration"), 0, -[NSAttributedString length](v69, "length"));
    v52 = -[NSAttributedString initWithAttributedString:](v55, "initWithAttributedString:", v69);

  }
  else
  {

    v52 = -[NSAttributedString initWithString:](self, "initWithString:", &stru_1E0F56070, v54);
  }
  _Block_object_dispose(&v74, 8);
  return v52;
}

- (NSAttributedString)attributedSubstringFromRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSString *v8;
  unint64_t v9;
  NSAttributedString *v11;
  NSUInteger v12;
  NSDictionary *v13;
  NSUInteger v14;
  objc_class *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;

  length = range.length;
  location = range.location;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = range.location + range.length;
  v8 = -[NSAttributedString string](self, "string");
  v9 = -[NSString length](v8, "length");
  if (v7 > v9)
  {
    v16 = (objc_class *)objc_opt_class();
    v17 = _NSNameOfClass(v16);
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s %s: Out of bounds"), v17, sel_getName(a2)), 0);
    objc_exception_throw(v18);
  }
  if (length == v9)
    return (NSAttributedString *)-[NSAttributedString copyWithZone:](self, "copyWithZone:", 0);
  v11 = (NSAttributedString *)(id)objc_msgSend(objc_allocWithZone((Class)NSConcreteMutableAttributedString), "initWithString:", -[NSString substringWithRange:](v8, "substringWithRange:", location, length));
  if (location < v7)
  {
    v12 = location;
    do
    {
      v19 = 0;
      v20 = 0;
      v13 = -[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", v12, &v19);
      if (v20 + v19 <= v7)
        v14 = v19 - v12 + v20;
      else
        v14 = v7 - v12;
      if (v19 != v12 || v20 + v19 > v7)
        v20 = v14;
      -[NSAttributedString addAttributes:range:](v11, "addAttributes:range:", v13, v12 - location, v14);
      v12 += v20;
    }
    while (v12 < v7);
  }
  return v11;
}

+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format context:(NSDictionary *)context
{
  id v6;
  va_list va;

  va_start(va, context);
  v6 = objc_alloc((Class)a1);
  return (NSAttributedString *)(id)objc_msgSend(v6, "__initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:", format, 0, 0, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), context, va);
}

- (id)_initWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5 arguments:(char *)a6
{
  return -[NSAttributedString __initWithFormat:attributeOptions:formattingOptions:locale:arguments:](self, "__initWithFormat:attributeOptions:formattingOptions:locale:arguments:", a3, a4, 0, a5, a6);
}

- (id)__initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 arguments:(char *)a7
{
  return -[NSAttributedString __initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:](self, "__initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:", a3, a4, a5, a6, MEMORY[0x1E0C9AA70], a7);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_self();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSAttributedString isEqualToAttributedString:](self, "isEqualToAttributedString:", a3);
}

- (unint64_t)hash
{
  return -[NSString hash](-[NSAttributedString string](self, "string"), "hash");
}

- (void)enumerateAttribute:(NSAttributedStringKey)attrName inRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void *)block
{
  int v7;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  id v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  BOOL v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v23;
  id v24;
  NSUInteger v25;
  uint64_t v26;
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (enumerationRange.length)
  {
    v7 = opts;
    length = enumerationRange.length;
    location = enumerationRange.location;
    v12 = ((enumerationRange.length - 1) & ((uint64_t)(opts << 62) >> 63)) + enumerationRange.location;
    v27 = 0;
    v13 = -[NSAttributedString length](self, "length");
LABEL_3:
    v14 = v13;
    while (1)
    {
      v25 = 0;
      v26 = 0;
      if ((v7 & 0x100000) != 0)
      {
        v15 = -[NSAttributedString attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", attrName, v12, &v25);
        v16 = v25;
        if (v26 + v25 >= length + location)
          v17 = length + location;
        else
          v17 = v26 + v25;
        v18 = v17 - location;
        v19 = v25 > location || location >= v26 + v25;
        if (v19)
          v20 = 0;
        else
          v20 = location;
        if (v19)
          v18 = 0;
        v21 = v17 - v25;
        if (location > v25 || v25 >= length + location)
        {
          v16 = v20;
          v23 = v18;
        }
        else
        {
          v23 = v21;
        }
        v25 = v16;
        v26 = v23;
      }
      else
      {
        v15 = -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self, "attribute:atIndex:longestEffectiveRange:inRange:", attrName, v12, &v25, location, length);
      }
      v24 = v15;
      (*((void (**)(void *, id, NSUInteger, uint64_t, char *))block + 2))(block, v24, v25, v26, &v27);

      if (v27)
        break;
      if ((v7 & 2) == 0)
      {
        v13 = -[NSAttributedString length](self, "length");
        if (v13 == v14)
          v12 = v26 + v25;
        else
          v12 = v26 + v25 - v14 + v13;
        if (v13 != v14)
          length = length - v14 + v13;
        if (v12 < length + location)
          goto LABEL_3;
        return;
      }
      if (v25 <= location)
        return;
      v12 = v25 - 1;
    }
  }
}

- (id)attribute:(NSAttributedStringKey)attrName atIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit
{
  NSUInteger length;
  unint64_t v7;
  id v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  NSUInteger v15;
  id v16;
  unint64_t v17;
  NSUInteger v18;
  unint64_t v19;
  BOOL v20;
  NSRange v22;
  uint64_t v23;

  length = rangeLimit.length;
  v7 = rangeLimit.location;
  v23 = *MEMORY[0x1E0C80C00];
  v11 = -[NSAttributedString attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", attrName, location);
  if (range)
  {
    v22 = *range;
    v12 = v7 + length;
    do
    {
      v13 = v22.length + v22.location;
      if (v22.length + v22.location >= v12)
        break;
      v14 = -[NSAttributedString attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", attrName, v22.length + v22.location, &v22);
    }
    while (v14 == v11 || objc_msgSend(v14, "isEqual:", v11));
    v22 = *range;
    do
    {
      v15 = v22.location;
      if (v22.location <= v7)
        break;
      v16 = -[NSAttributedString attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", attrName, v22.location - 1, &v22);
    }
    while (v16 == v11 || objc_msgSend(v16, "isEqual:", v11));
    if (v12 >= v13)
      v17 = v13;
    else
      v17 = v12;
    if (v7 >= v13 || v15 > v7)
    {
      v18 = v17 - v15;
      if (v15 < v12)
        v19 = v15;
      else
        v19 = 0;
      if (v15 >= v12)
        v18 = 0;
      v20 = v7 > v15;
      if (v7 <= v15)
        v7 = v19;
      else
        v7 = 0;
      if (v20)
        v18 = 0;
    }
    else
    {
      v18 = v17 - v7;
    }
    range->location = v7;
    range->length = v18;
  }
  return v11;
}

- (id)attribute:(NSAttributedStringKey)attrName atIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range
{
  return -[NSDictionary objectForKey:](-[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", location, range), "objectForKey:", attrName);
}

- (BOOL)_willRequireIntentResolutionWhenContainingAttribute:(id)a3 value:(id)a4
{
  int v6;
  BOOL result;

  v6 = objc_msgSend(a3, "isEqual:", CFSTR("NSInlinePresentationIntent"));
  if (a4 && v6 && !objc_msgSend(a4, "isEqual:", &off_1E0FBD7D0))
    return 1;
  result = objc_msgSend(a3, "isEqual:", CFSTR("NSPresentationIntent"));
  if (!a4)
    return 0;
  return result;
}

- (NSAttributedString)initWithMarkdownString:(NSString *)markdownString options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error
{
  CFIndex v10;
  CFIndex Bytes;
  CFIndex v12;
  void *v13;
  NSAttributedString *v14;
  char *v15;
  CFIndex v17[2];
  CFRange v18;
  CFRange v19;
  CFRange v20;

  v17[1] = *MEMORY[0x1E0C80C00];

  v10 = -[NSString length](markdownString, "length");
  v17[0] = 0;
  v18.location = 0;
  v18.length = v10;
  Bytes = CFStringGetBytes((CFStringRef)markdownString, v18, 0x8000100u, 0, 0, 0, 0, v17);
  if (Bytes < 1)
    return 0;
  v12 = v17[0];
  if (v17[0] <= 0x80uLL)
  {
    if (v17[0])
    {
      MEMORY[0x1E0C80A78](Bytes);
      v15 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v15, v12);
    }
    else
    {
      v15 = 0;
    }
    v20.location = 0;
    v20.length = v10;
    if (CFStringGetBytes((CFStringRef)markdownString, v20, 0x8000100u, 0, 0, (UInt8 *)v15, v12, 0) >= 1)
      return (NSAttributedString *)newAttributedStringFromMarkdown((uint64_t)v15, v17[0], options, (uint64_t)baseURL, error);
    goto LABEL_11;
  }
  v13 = malloc_type_malloc(v17[0], 0x100004077774924uLL);
  v19.location = 0;
  v19.length = v10;
  if (CFStringGetBytes((CFStringRef)markdownString, v19, 0x8000100u, 0, 0, (UInt8 *)v13, v17[0], 0) < 1)
  {
    free(v13);
LABEL_11:
    if (error)
    {
      v14 = 0;
      *error = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 259, 0);
      return v14;
    }
    return 0;
  }
  v14 = (NSAttributedString *)newAttributedStringFromMarkdown((uint64_t)v13, v17[0], options, (uint64_t)baseURL, error);
  free(v13);
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSConcreteAttributedString initWithAttributedString:](+[NSAttributedString allocWithZone:](NSConcreteAttributedString, "allocWithZone:", a3), "initWithAttributedString:", self);
}

+ (NSAttributedString)allocWithZone:(_NSZone *)a3
{
  objc_class *v4;

  v4 = (objc_class *)a1;
  if ((id)objc_opt_self() == a1)
    v4 = (objc_class *)objc_opt_self();
  return (NSAttributedString *)NSAllocateObject(v4, 0, a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NSConcreteMutableAttributedString initWithAttributedString:](+[NSMutableAttributedString allocWithZone:](NSConcreteMutableAttributedString, "allocWithZone:", a3), "initWithAttributedString:", self);
}

+ (void)_setAttributedDictionaryClass:(Class)a3
{
  attributeDictionaryClass = (uint64_t)a3;
}

- (NSString)string
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSAttributedString"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSAttributedString"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)attributedSubstringFromRange:(_NSRange)a3 replacingCharactersInRanges:(const _NSRange *)a4 numberOfRanges:(int64_t)a5 withString:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  NSMutableAttributedString *v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;

  length = a3.length;
  location = a3.location;
  v12 = objc_alloc_init(NSMutableAttributedString);
  _CFAutoreleasePoolPush();
  v13 = location;
  if (a5 >= 1)
  {
    do
    {
      -[NSMutableAttributedString appendAttributedString:](v12, "appendAttributedString:", -[NSAttributedString attributedSubstringFromRange:](self, "attributedSubstringFromRange:"));
      -[NSMutableAttributedString replaceCharactersInRange:withString:](v12, "replaceCharactersInRange:withString:", -[NSAttributedString length](v12, "length") - 1, 1, a6);
      v14 = a4->location;
      v15 = a4->length;
      ++a4;
      v13 = v15 + v14;
      --a5;
    }
    while (a5);
  }
  if (location + length > v13)
    -[NSMutableAttributedString appendAttributedString:](v12, "appendAttributedString:", -[NSAttributedString attributedSubstringFromRange:](self, "attributedSubstringFromRange:"));
  _CFAutoreleasePoolPop();
  return v12;
}

- (id)attributedStringByWeaklyAddingAttributes:(id)a3
{
  id v5;
  id v6;

  v5 = -[NSAttributedString mutableCopyWithZone:](self, "mutableCopyWithZone:", 0);
  objc_msgSend(v5, "addAttributesWeakly:range:", a3, 0, -[NSAttributedString length](self, "length"));
  v6 = (id)objc_msgSend(v5, "copyWithZone:", 0);

  return v6;
}

- (NSUInteger)length
{
  return -[NSString length](-[NSAttributedString string](self, "string"), "length");
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)encodeWithCoder:(id)a3
{
  NSUInteger v5;
  __int128 v6;
  char v7;
  NSString *v8;
  NSDictionary *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  NSDictionary *v12;
  const __CFDictionary *v13;
  NSUInteger v14;
  int v15;
  void *v16;
  NSDictionary *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  _BYTE *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  NSDictionary *v30;
  NSDictionary *v31;
  id v32;
  void *value;
  uint64_t v34;
  unint64_t v35;
  CFDictionaryKeyCallBacks keyCallBacks;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = -[NSAttributedString length](self, "length");
  v6 = *(_OWORD *)(MEMORY[0x1E0C9B390] + 16);
  *(_OWORD *)&keyCallBacks.version = *MEMORY[0x1E0C9B390];
  *(_OWORD *)&keyCallBacks.release = v6;
  keyCallBacks.equal = 0;
  keyCallBacks.hash = 0;
  v7 = objc_msgSend(a3, "allowsKeyedCoding");
  v8 = -[NSAttributedString string](self, "string");
  if ((v7 & 1) == 0)
  {
    objc_msgSend(a3, "encodeObject:", v8);
    if (!v5)
      return;
    v13 = CFDictionaryCreateMutable(0, 0, &keyCallBacks, 0);
    v14 = 0;
    v15 = 1;
    do
    {
      v16 = (void *)MEMORY[0x186DA8F78]();
      v37 = 0;
      v38 = 0;
      v17 = -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self, "attributesAtIndex:longestEffectiveRange:inRange:", v14, &v37, v14, v5 - v14);
      LODWORD(v34) = 0;
      LODWORD(v34) = CFDictionaryGetValue(v13, v17);
      LODWORD(value) = v38;
      if ((_DWORD)v34)
      {
        objc_msgSend(a3, "encodeValuesOfObjCTypes:", "iI", &v34, &value);
      }
      else
      {
        LODWORD(v34) = v15;
        CFDictionaryAddValue(v13, v17, (const void *)v15);
        objc_msgSend(a3, "encodeValuesOfObjCTypes:", "iI", &v34, &value);
        objc_msgSend(a3, "encodeObject:", v17);
        ++v15;
      }
      v14 += v38;
      objc_autoreleasePoolPop(v16);
    }
    while (v14 < v5);
    if (!v13)
      return;
LABEL_14:
    CFRelease(v13);
    return;
  }
  objc_msgSend(a3, "encodeObject:forKey:", v8, CFSTR("NSString"));
  if (v5)
  {
    v34 = 0;
    v35 = 0;
    v9 = -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self, "attributesAtIndex:longestEffectiveRange:inRange:", 0, &v34, 0, v5);
    v10 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    v11 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    if (v9)
      v10 = v9;
    v12 = v10;
    if (v35 == v5)
    {
      objc_msgSend(a3, "encodeObject:forKey:", v12, CFSTR("NSAttributes"));
      v13 = 0;
    }
    else
    {
      v32 = a3;
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 20);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 100);
      v13 = CFDictionaryCreateMutable(0, 0, &keyCallBacks, 0);
      v20 = 0;
      while (1)
      {
        v21 = (void *)MEMORY[0x186DA8F78]();
        value = 0;
        if (!CFDictionaryGetValueIfPresent(v13, v12, (const void **)&value))
        {
          value = (void *)objc_msgSend(v18, "count");
          CFDictionaryAddValue(v13, v12, value);
          objc_msgSend(v18, "addObject:", v12);
        }
        LOBYTE(v22) = v35;
        v23 = &v37;
        if (v35 >= 0x80)
        {
          v24 = v35;
          do
          {
            *(_BYTE *)v23 = v24 | 0x80;
            v23 = (uint64_t *)((char *)v23 + 1);
            v22 = v24 >> 7;
            v25 = v24 >> 14;
            v24 >>= 7;
          }
          while (v25);
        }
        *(_BYTE *)v23 = v22;
        v26 = (char *)v23 + 1;
        v27 = (unint64_t)value;
        if ((unint64_t)value < 0x80)
        {
          LOBYTE(v28) = (_BYTE)value;
        }
        else
        {
          do
          {
            *v26++ = v27 | 0x80;
            v28 = v27 >> 7;
            v29 = v27 >> 14;
            v27 >>= 7;
          }
          while (v29);
        }
        *v26 = v28;
        objc_msgSend(v19, "appendBytes:length:", &v37, v26 - (_BYTE *)&v37 + 1);
        v20 += v35;
        if (v5 == v20)
          break;

        v30 = -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self, "attributesAtIndex:longestEffectiveRange:inRange:", v20, &v34, v20, v5 - v20);
        if (v30)
          v31 = v30;
        else
          v31 = v11;
        v12 = v31;
        objc_autoreleasePoolPop(v21);
      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v32, "encodeObject:forKey:", v18, CFSTR("NSAttributes"));
      objc_msgSend(v32, "encodeObject:forKey:", v19, CFSTR("NSAttributeInfo"));

    }
    if (v13)
      goto LABEL_14;
  }
}

- (NSAttributedString)initWithCoder:(id)a3
{
  void *v5;
  NSAttributedString *v6;

  v5 = (void *)objc_msgSend(objc_allocWithZone((Class)NSMutableAttributedString), "init");
  if (_NSReadMutableAttributedStringWithCoder(a3, v5))
  {
    v6 = -[NSAttributedString initWithAttributedString:](self, "initWithAttributedString:", v5);
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_markRequiringIntentResolution
{
  objc_setAssociatedObject(self, &_NSAttributedStringMayRequireIntentResolutionKey, MEMORY[0x1E0C9AAB0], (void *)0x303);
}

- (void)_markIntentsResolved
{
  objc_setAssociatedObject(self, &_NSAttributedStringMayRequireIntentResolutionKey, 0, (void *)0x303);
}

- (id)_createAttributedSubstringWithRange:(_NSRange)a3
{
  return -[NSAttributedString attributedSubstringFromRange:](self, "attributedSubstringFromRange:", a3.location, a3.length);
}

- (id)_firstValueOfAttributeWithKey:(id)a3 inRange:(_NSRange)a4
{
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__NSAttributedString_NSInflection___firstValueOfAttributeWithKey_inRange___block_invoke;
  v6[3] = &unk_1E0F4E820;
  v6[4] = &v7;
  -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", a3, a4.location, a4.length, 0x100000, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

_QWORD *__74__NSAttributedString_NSInflection___firstValueOfAttributeWithKey_inRange___block_invoke(_QWORD *result, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  _QWORD *v6;

  if (a2)
  {
    v6 = result;
    result = a2;
    *(_QWORD *)(*(_QWORD *)(v6[4] + 8) + 40) = result;
    *a5 = 1;
  }
  return result;
}

- (id)_inflectedAttributedString
{
  void *v2;
  uint64_t v3;

  v2 = (void *)-[NSAttributedString mutableCopy](self, "mutableCopy");
  v3 = objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  objc_msgSend(v2, "_inflectWithLocale:replacements:concepts:preflight:", v3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 1);
  return v2;
}

- (id)_identicalAttributesInRange:(_NSRange)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__7;
  v12 = __Block_byref_object_dispose__7;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__NSAttributedString_NSInflection___identicalAttributesInRange___block_invoke;
  v7[3] = &unk_1E0F4E848;
  v7[4] = &v8;
  -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:", a3.location, a3.length, 0x100000, v7);
  v3 = (void *)v9[5];
  if (v3)
    v4 = v3;
  else
    v4 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __64__NSAttributedString_NSInflection___identicalAttributesInRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  void *v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t result;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v7)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (void *)objc_msgSend(v7, "allKeys");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v14), "isEqual:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v14)) & 1) == 0)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeObjectForKey:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
      }
      while (v11);
    }
    result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count");
    *a5 = result == 0;
  }
  else
  {
    result = objc_msgSend(a2, "mutableCopy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

- (NSAttributedString)attributedStringByInflectingString
{
  void *v2;
  uint64_t v3;

  v2 = (void *)-[NSAttributedString mutableCopy](self, "mutableCopy");
  v3 = objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  objc_msgSend(v2, "_inflectWithLocale:replacements:concepts:preflight:", v3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 1);
  return (NSAttributedString *)v2;
}

- (id)_initWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5
{
  uint64_t v6;

  return -[NSAttributedString _initWithFormat:options:locale:arguments:](self, "_initWithFormat:options:locale:arguments:", a3, a4, 0, &v6, &v6);
}

+ (id)_localizedAttributedStringWithFormat:(id)a3
{
  id v4;
  uint64_t v6;

  v4 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v4, "_initWithFormat:options:locale:arguments:", a3, 0, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), &v6);
}

+ (id)_localizedAttributedStringWithFormat:(id)a3 options:(unint64_t)a4
{
  id v6;
  uint64_t v8;

  v6 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v6, "_initWithFormat:options:locale:arguments:", a3, a4, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), &v8);
}

+ (id)_attributedStringWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5 arguments:(char *)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithFormat:options:locale:arguments:", a3, a4, a5, a6);
}

+ (id)_attributedStringWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 arguments:(char *)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithFormat:attributeOptions:formattingOptions:locale:arguments:", a3, a4, a5, a6, a7);
}

- (id)_initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6
{
  uint64_t v7;

  return -[NSAttributedString _initWithFormat:attributeOptions:formattingOptions:locale:arguments:](self, "_initWithFormat:attributeOptions:formattingOptions:locale:arguments:", a3, a4, a5, a6, &v7, &v7);
}

- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale
{
  va_list va;

  va_start(va, locale);
  return (NSAttributedString *)-[NSAttributedString _initWithFormat:options:locale:arguments:](self, "_initWithFormat:options:locale:arguments:", format, options, 0, va, va);
}

- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale context:(NSDictionary *)context
{
  va_list va;

  va_start(va, context);
  return (NSAttributedString *)-[NSAttributedString __initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:](self, "__initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:", format, options, 0, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale", format, options, locale), context, va);
}

- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale context:(NSDictionary *)context arguments:(va_list)arguments
{
  return (NSAttributedString *)-[NSAttributedString __initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:](self, "__initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:", format, options, 0, locale, context, arguments);
}

+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format
{
  id v4;
  va_list va;

  va_start(va, format);
  v4 = objc_alloc((Class)a1);
  return (NSAttributedString *)(id)objc_msgSend(v4, "_initWithFormat:options:locale:arguments:", format, 0, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), va);
}

+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options
{
  id v6;
  va_list va;

  va_start(va, options);
  v6 = objc_alloc((Class)a1);
  return (NSAttributedString *)(id)objc_msgSend(v6, "_initWithFormat:options:locale:arguments:", format, options, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), va);
}

+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options context:(NSDictionary *)context
{
  id v8;
  va_list va;

  va_start(va, context);
  v8 = objc_alloc((Class)a1);
  return (NSAttributedString *)(id)objc_msgSend(v8, "__initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:", format, options, 0, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), context, va);
}

- (NSAttributedString)initWithContentsOfMarkdownFileAtURL:(NSURL *)markdownFile options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error
{
  uint64_t v10;

  v10 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", markdownFile, 1, error);
  if (v10)
    return -[NSAttributedString initWithMarkdown:options:baseURL:error:](self, "initWithMarkdown:options:baseURL:error:", v10, options, baseURL, error);

  return 0;
}

- (NSAttributedString)initWithMarkdown:(NSData *)markdown options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error
{

  return (NSAttributedString *)newAttributedStringFromMarkdown((uint64_t)-[NSData bytes](markdown, "bytes"), -[NSData length](markdown, "length"), options, (uint64_t)baseURL, error);
}

@end
