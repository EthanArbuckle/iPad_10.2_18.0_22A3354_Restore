@implementation NSString

- (NSString)encodedDialerString
{
  return (NSString *)-[NSString _encodedDialerStringSkippingUnmappedCharacters:](self, "_encodedDialerStringSkippingUnmappedCharacters:", 1);
}

- (id)_encodedDialerStringSkippingUnmappedCharacters:(BOOL)a3
{
  _BOOL4 v3;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  __CFString *Mutable;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  UniChar v12;
  uint64_t v13;
  CFIndex v14;
  int64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  CFIndex v21;
  double NumericValue;
  double v23;
  BOOL v24;
  unsigned int v25;
  int v26;
  int v27;
  uint64_t v28;
  BOOL v29;
  __CFString *v30;
  UniChar chars;
  UniChar buffer[8];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CFStringRef v41;
  const UniChar *v42;
  const char *v43;
  uint64_t v44;
  CFIndex v45;
  int64_t v46;
  int64_t v47;
  CFRange v48;

  v3 = a3;
  Length = CFStringGetLength((CFStringRef)self);
  v41 = (CFStringRef)self;
  v44 = 0;
  v45 = Length;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)self);
  CStringPtr = 0;
  v42 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr((CFStringRef)self, 0x600u);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  *(_OWORD *)buffer = 0u;
  v34 = 0u;
  v43 = CStringPtr;
  v46 = 0;
  v47 = 0;
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (Length >= 1)
  {
    v9 = 0;
    v10 = 0;
    v11 = 64;
    do
    {
      v12 = 0;
      if ((unint64_t)v10 >= 4)
        v13 = 4;
      else
        v13 = v10;
      chars = 0;
      v14 = v45;
      if (v45 > v10)
      {
        if (v42)
        {
          v12 = v42[v10 + v44];
        }
        else if (v43)
        {
          v12 = v43[v44 + v10];
        }
        else
        {
          v15 = v46;
          v16 = v47 > v10 && v46 <= v10;
          if (!v16)
          {
            v17 = -v13;
            v18 = v13 + v9;
            v19 = v11 - v13;
            v20 = v10 + v17;
            v21 = v20 + 64;
            if (v20 + 64 >= v45)
              v21 = v45;
            v46 = v20;
            v47 = v21;
            if (v45 >= v19)
              v14 = v19;
            v48.length = v14 + v18;
            v48.location = v20 + v44;
            CFStringGetCharacters(v41, v48, buffer);
            v15 = v46;
          }
          v12 = buffer[v10 - v15];
        }
      }
      chars = v12;
      NumericValue = u_getNumericValue(v12);
      if (NumericValue <= 9.0
        && ((v23 = ceil(NumericValue), NumericValue >= 0.0) ? (v24 = NumericValue == v23) : (v24 = 0), v24))
      {
        v25 = (int)NumericValue + 48;
        chars = (int)NumericValue + 48;
      }
      else
      {
        LOWORD(v25) = chars;
      }
      v26 = (unsigned __int16)v25;
      if ((unsigned __int16)(v25 - 65) > 0x19u)
      {
        if ((unsigned __int16)(v25 - 97) > 0x19u)
        {
          if ((unsigned __int16)(v25 + 223) > 0x19u)
          {
            if ((unsigned __int16)(v25 + 191) > 0x19u)
            {
              if ((unsigned __int16)(v25 + 240) > 9u)
              {
                switch((unsigned __int16)v25)
                {
                  case 0xFF03u:
                    LOWORD(v25) = 35;
                    goto LABEL_41;
                  case 0xFF04u:
                  case 0xFF05u:
                  case 0xFF06u:
                  case 0xFF07u:
                  case 0xFF08u:
                  case 0xFF09u:
                    goto LABEL_42;
                  case 0xFF0Au:
                    LOWORD(v25) = 42;
                    goto LABEL_41;
                  case 0xFF0Bu:
                    LOWORD(v25) = 43;
                    goto LABEL_41;
                  case 0xFF0Cu:
                    LOWORD(v25) = 44;
                    goto LABEL_41;
                  default:
                    if ((unsigned __int16)v25 != 65307)
                      goto LABEL_42;
                    LOWORD(v25) = 59;
                    break;
                }
              }
              else
              {
                LOWORD(v25) = v25 + 288;
              }
              goto LABEL_41;
            }
            v27 = -65345;
          }
          else
          {
            v27 = -65313;
          }
          v25 = v26 + v27;
        }
        else
        {
          v25 = (unsigned __int16)v25 - 97;
        }
      }
      else
      {
        v25 = (unsigned __int16)v25 - 65;
      }
      LOWORD(v25) = word_10023F534[v25] + 48;
LABEL_41:
      chars = v25;
LABEL_42:
      if (!v3
        || (unsigned __int16)(v25 - 48) < 0xAu
        || ((v16 = (unsigned __int16)v25 > 0x3Bu, v28 = (1 << v25) & 0x8001C0800000000, !v16)
          ? (v29 = v28 == 0)
          : (v29 = 1),
            !v29))
      {
        CFStringAppendCharacters(Mutable, &chars, 1);
      }
      ++v10;
      --v9;
      ++v11;
    }
    while (Length != v10);
  }
  v30 = Mutable;
  CFRelease(v30);
  return v30;
}

- (NSString)unformattedNumber
{
  return (NSString *)-[NSString processNumberInLatin:](self, "processNumberInLatin:", 0);
}

- (NSString)unformattedNumberInLatin
{
  return (NSString *)-[NSString processNumberInLatin:](self, "processNumberInLatin:", 1);
}

- (id)processNumberInLatin:(BOOL)a3
{
  _BOOL4 v3;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  __CFString *Mutable;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  UniChar v12;
  uint64_t v13;
  CFIndex v14;
  int64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  CFIndex v21;
  double NumericValue;
  double v23;
  __CFString *v25;
  UniChar chars;
  UniChar buffer[8];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CFStringRef v36;
  const UniChar *v37;
  const char *v38;
  uint64_t v39;
  CFIndex v40;
  int64_t v41;
  int64_t v42;
  CFRange v43;

  v3 = a3;
  Length = CFStringGetLength((CFStringRef)self);
  v36 = (CFStringRef)self;
  v39 = 0;
  v40 = Length;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)self);
  CStringPtr = 0;
  v37 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr((CFStringRef)self, 0x600u);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  *(_OWORD *)buffer = 0u;
  v29 = 0u;
  v38 = CStringPtr;
  v41 = 0;
  v42 = 0;
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (Length >= 1)
  {
    v9 = 0;
    v10 = 0;
    v11 = 64;
    do
    {
      v12 = 0;
      if ((unint64_t)v10 >= 4)
        v13 = 4;
      else
        v13 = v10;
      chars = 0;
      v14 = v40;
      if (v40 > v10)
      {
        if (v37)
        {
          v12 = v37[v10 + v39];
        }
        else if (v38)
        {
          v12 = v38[v39 + v10];
        }
        else
        {
          v15 = v41;
          if (v42 <= v10 || v41 > v10)
          {
            v17 = -v13;
            v18 = v13 + v9;
            v19 = v11 - v13;
            v20 = v10 + v17;
            v21 = v20 + 64;
            if (v20 + 64 >= v40)
              v21 = v40;
            v41 = v20;
            v42 = v21;
            if (v40 >= v19)
              v14 = v19;
            v43.length = v14 + v18;
            v43.location = v20 + v39;
            CFStringGetCharacters(v36, v43, buffer);
            v15 = v41;
          }
          v12 = buffer[v10 - v15];
        }
      }
      chars = v12;
      NumericValue = u_getNumericValue(v12);
      if (NumericValue <= 9.0)
      {
        v23 = ceil(NumericValue);
        if (NumericValue >= 0.0 && NumericValue == v23)
        {
          if (v3)
            chars = (int)NumericValue + 48;
          CFStringAppendCharacters(Mutable, &chars, 1);
        }
      }
      ++v10;
      --v9;
      ++v11;
    }
    while (Length != v10);
  }
  v25 = Mutable;
  CFRelease(v25);
  return v25;
}

- (id)attributedStringToHighlightText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString attributedStringToHighlightText:primaryColour:secondaryColour:](self, "attributedStringToHighlightText:primaryColour:secondaryColour:", v4, v5, v6));

  return v7;
}

- (id)attributedStringToHighlightText:(id)a3 style:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSString attributedStringToHighlightText:primaryColour:secondaryColour:style:](self, "attributedStringToHighlightText:primaryColour:secondaryColour:style:", v6, v7, v8, a4));

  return v9;
}

- (id)attributedStringToHighlightText:(id)a3 primaryColour:(id)a4 secondaryColour:(id)a5
{
  return -[NSString attributedStringToHighlightText:primaryColour:secondaryColour:style:](self, "attributedStringToHighlightText:primaryColour:secondaryColour:style:", a3, a4, a5, 0);
}

- (id)attributedStringToHighlightText:(id)a3 primaryColour:(id)a4 secondaryColour:(id)a5 style:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSAttributedStringKey v14;
  NSString *v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", self);
  if (-[NSString length](self, "length"))
  {
    v14 = NSForegroundColorAttributeName;
    objc_msgSend(v13, "addAttribute:value:range:", NSForegroundColorAttributeName, v11, 0, -[NSString length](self, "length"));
    v15 = self;
    v16 = v10;
    v17 = a6 - 1;
    if (!v17)
    {
      v32 = v12;
      v33 = v10;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByString:](v15, "componentsSeparatedByString:", CFSTR(" ")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v18, "count")));
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v20 = v18;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v23)
              objc_enumerationMutation(v20);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), "_encodedDialerStringSkippingUnmappedCharacters:", 0));
            objc_msgSend(v19, "addObject:", v25);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v22);
      }

      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsJoinedByString:", CFSTR(" ")));
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "unformattedNumberInLatin"));

      v16 = (id)v27;
      v15 = (NSString *)v26;
      v12 = v32;
      v10 = v33;
      v17 = 0;
      v14 = NSForegroundColorAttributeName;
    }
    v28 = -[NSString rangeToHighlightText:](v15, "rangeToHighlightText:", v16);
    if (v29)
    {
      objc_msgSend(v13, "addAttribute:value:range:", v14, v12, v28, v29);
    }
    else if (v17 < 2 || objc_msgSend(v16, "isNumeric") && -[NSString isNumeric](v15, "isNumeric"))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSString indexSetToHighlightDigitsInText:](v15, "indexSetToHighlightDigitsInText:", v16));
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100038CE0;
      v34[3] = &unk_100285450;
      v35 = v13;
      v36 = v12;
      objc_msgSend(v30, "enumerateRangesUsingBlock:", v34);

    }
  }

  return v13;
}

- (_NSRange)rangeToHighlightText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  v4 = a3;
  if (-[NSString length](self, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString sanitizedString](self, "sanitizedString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByRemovingDiatrics"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sanitizedString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByRemovingDiatrics"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression escapedPatternForString:](NSRegularExpression, "escapedPatternForString:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(?:(?<![^\\W_])|(?=[\\W_]))%@"), v9));

    if (objc_msgSend(v4, "length"))
    {
      v11 = objc_msgSend(v6, "rangeOfString:options:", v10, 1025);
      v13 = v12;
    }
    else
    {
      v13 = 0;
      v11 = 0;
    }

  }
  else
  {
    v13 = 0;
    v11 = 0;
  }

  v14 = (NSUInteger)v11;
  v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

- (id)indexSetToHighlightDigitsInText:(id)a3
{
  id v4;
  id v5;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  __CFString *v8;
  id v9;
  const UniChar *v10;
  const char *v11;
  int64_t v12;
  char v13;
  CFIndex v14;
  UniChar v15;
  double NumericValue;
  double v17;
  BOOL v18;
  int64_t v19;
  int64_t v20;
  int64_t v21;
  const UniChar *v22;
  int64_t v23;
  unsigned __int16 v24;
  int64_t v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CFStringRef v39;
  const UniChar *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  int64_t v45;
  UniChar buffer[8];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CFStringRef theString;
  const UniChar *v55;
  const char *v56;
  uint64_t v57;
  CFIndex Length;
  int64_t v59;
  int64_t v60;
  CFRange v61;
  CFRange v62;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableIndexSet);
  theString = (CFStringRef)self;
  v57 = 0;
  Length = CFStringGetLength((CFStringRef)self);
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)self);
  CStringPtr = 0;
  v55 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr((CFStringRef)self, 0x600u);
  v59 = 0;
  v60 = 0;
  v56 = CStringPtr;
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "unformattedNumber"));
  v9 = (id)CFStringGetLength(v8);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v39 = v8;
  v42 = 0;
  v43 = (uint64_t)v9;
  v10 = CFStringGetCharactersPtr(v8);
  v11 = 0;
  v40 = v10;
  if (!v10)
    v11 = CFStringGetCStringPtr(v8, 0x600u);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  *(_OWORD *)buffer = 0u;
  v47 = 0u;
  v44 = 0;
  v45 = 0;
  v41 = v11;
  if (!-[NSString length](self, "length", v31, v32, v33, v34, v35, v36, v37, v38))
  {
LABEL_54:
    v30 = 0;
    goto LABEL_55;
  }
  v12 = 0;
  v13 = 0;
  while (1)
  {
    if (v12 < 0 || (v14 = Length, Length <= v12))
    {
      v15 = 0;
    }
    else if (v55)
    {
      v15 = v55[v57 + v12];
    }
    else if (v56)
    {
      v15 = v56[v57 + v12];
    }
    else
    {
      if (v60 <= v12 || (v25 = v59, v59 > v12))
      {
        v26 = v12 - 4;
        if ((unint64_t)v12 < 4)
          v26 = 0;
        if (v26 + 64 < Length)
          v14 = v26 + 64;
        v59 = v26;
        v60 = v14;
        v61.location = v57 + v26;
        v61.length = v14 - v26;
        CFStringGetCharacters(theString, v61, buffer);
        v25 = v59;
      }
      v15 = buffer[v12 - v25];
    }
    NumericValue = u_getNumericValue(v15);
    if (NumericValue > 9.0
      || ((v17 = ceil(NumericValue), NumericValue >= 0.0) ? (v18 = NumericValue == v17) : (v18 = 0), !v18))
    {
      v13 = 0;
      goto LABEL_32;
    }
    v19 = (int64_t)objc_msgSend(v5, "count");
    v20 = v19;
    if (v19 < 0 || (v21 = v43, v43 <= v19))
    {
      v24 = 0;
    }
    else
    {
      v22 = v40;
      if (v40)
      {
        v23 = v42 + v19;
LABEL_22:
        v24 = v22[v23];
        goto LABEL_25;
      }
      if (!v41)
      {
        if (v45 <= v19 || (v27 = v44, v44 > v19))
        {
          v28 = v19 - 4;
          if ((unint64_t)v19 < 4)
            v28 = 0;
          if (v28 + 64 < v43)
            v21 = v28 + 64;
          v44 = v28;
          v45 = v21;
          v62.location = v42 + v28;
          v62.length = v21 - v28;
          CFStringGetCharacters(v39, v62, (UniChar *)&v31);
          v27 = v44;
        }
        v23 = v20 - v27;
        v22 = (const UniChar *)&v31;
        goto LABEL_22;
      }
      v24 = v41[v42 + v19];
    }
LABEL_25:
    if (v15 == v24)
      break;
    if (!v20)
      goto LABEL_31;
    v12 = (int64_t)objc_msgSend(v5, "firstIndex");
    objc_msgSend(v5, "removeAllIndexes");
LABEL_32:
    if (++v12 >= -[NSString length](self, "length"))
      goto LABEL_54;
  }
  if (((v20 == 0) & v13) != 0 || (objc_msgSend(v5, "addIndex:", v12), objc_msgSend(v5, "count") != v9))
  {
LABEL_31:
    v13 = 1;
    goto LABEL_32;
  }
  v30 = objc_msgSend(v5, "copy");
LABEL_55:

  return v30;
}

- (NSString)sanitizedString
{
  return -[NSString stringByReplacingOccurrencesOfString:withString:](self, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
}

- (id)stringByRemovingDiatrics
{
  return -[NSString stringByApplyingTransform:reverse:](self, "stringByApplyingTransform:reverse:", NSStringTransformStripDiacritics, 0);
}

- (BOOL)isNumeric
{
  return -[NSString rangeOfString:options:](self, "rangeOfString:options:", CFSTR("^[\\d\\s\\(\\)\\-\\+]+$"), 1024) != (id)0x7FFFFFFFFFFFFFFFLL;
}

@end
