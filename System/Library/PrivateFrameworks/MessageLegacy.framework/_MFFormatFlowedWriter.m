@implementation _MFFormatFlowedWriter

+ (id)newWithPlainTextDocument:(id)a3 encoding:(unsigned int)a4
{
  uint64_t v6;

  v6 = objc_msgSend(objc_allocWithZone((Class)a1), "init");
  *(_QWORD *)(v6 + 8) = a3;
  *(_DWORD *)(v6 + 16) = a4;
  return (id)v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MFFormatFlowedWriter;
  -[_MFFormatFlowedWriter dealloc](&v3, sel_dealloc);
}

- (unint64_t)_findLineBreakInRange:(_NSRange)a3 maxCharWidthCount:(unint64_t)a4 endIsURL:(BOOL)a5
{
  unint64_t result;
  _BOOL4 v8;
  NSUInteger length;
  NSUInteger location;
  NSMutableString *lineString;
  const char *CStringPtr;
  uint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  UniChar *v17;
  NSUInteger v18;
  UniChar v19;
  UChar32 v20;
  uint64_t v21;
  uint64_t v23;
  NSUInteger v24;
  UniChar *v25;
  NSUInteger v26;
  UniChar v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _MFFormatFlowedWriter *v34;
  NSUInteger v35;
  unint64_t v36;
  uint64_t v37;
  _MFFormatFlowedWriter *v38;
  UniChar buffer[8];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CFStringRef theString;
  const UniChar *CharactersPtr;
  const char *v49;
  _NSRange v50;
  uint64_t v51;
  int64_t v52;
  CFRange v53;
  CFRange v54;

  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL && a3.length != 0)
  {
    v8 = a5;
    length = a3.length;
    location = a3.location;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    *(_OWORD *)buffer = 0u;
    v40 = 0u;
    lineString = self->_lineString;
    theString = (CFStringRef)lineString;
    v50 = a3;
    CharactersPtr = CFStringGetCharactersPtr((CFStringRef)lineString);
    if (CharactersPtr)
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr((CFStringRef)lineString, 0x600u);
    v38 = self;
    v51 = 0;
    v52 = 0;
    v49 = CStringPtr;
    if (a4)
    {
      v14 = 0;
      v15 = 0;
      while (1)
      {
        if (v14 < 0 || (v16 = v50.length, (uint64_t)v50.length <= v14))
        {
          v20 = 0;
          goto LABEL_16;
        }
        v17 = (UniChar *)CharactersPtr;
        if (CharactersPtr)
          break;
        if (!v49)
        {
          if (v52 <= v14 || (v30 = v51, v51 > v14))
          {
            v31 = v14 - 4;
            if ((unint64_t)v14 < 4)
              v31 = 0;
            if (v31 + 64 < (uint64_t)v50.length)
              v16 = v31 + 64;
            v51 = v31;
            v52 = v16;
            v53.location = v50.location + v31;
            v53.length = v16 - v31;
            CFStringGetCharacters(theString, v53, buffer);
            v30 = v51;
          }
          v18 = v14 - v30;
          v17 = buffer;
          goto LABEL_14;
        }
        v19 = v49[v50.location + v14];
LABEL_24:
        v20 = v19;
        if ((v19 & 0xFC00) == 0xD800 && v14 < length - 1)
        {
          v23 = v14 + 1;
          v24 = v50.length;
          if ((uint64_t)v50.length <= v14 + 1)
          {
            v27 = 0;
          }
          else
          {
            v25 = (UniChar *)CharactersPtr;
            if (CharactersPtr)
            {
              v26 = v50.location + v23;
              goto LABEL_31;
            }
            if (v49)
            {
              v27 = v49[v50.location + v23];
            }
            else
            {
              if (v52 <= v23 || (v32 = v51, v51 > v23))
              {
                v33 = v14 - 3;
                if ((unint64_t)v14 < 3)
                  v33 = 0;
                if (v33 + 64 < (uint64_t)v50.length)
                  v24 = v33 + 64;
                v51 = v33;
                v52 = v24;
                v54.location = v50.location + v33;
                v54.length = v24 - v33;
                CFStringGetCharacters(theString, v54, buffer);
                v32 = v51;
              }
              v26 = v23 - v32;
              v25 = buffer;
LABEL_31:
              v27 = v25[v26];
            }
          }
          v28 = v27 & 0xFC00;
          v29 = (v20 << 10) + v27 - 56613888;
          if (v28 == 56320)
          {
            v20 = v29;
            ++v14;
          }
        }
LABEL_16:
        if (((u_getIntPropertyValue(v20, UCHAR_EAST_ASIAN_WIDTH) - 3) & 0xFFFFFFFD) != 0)
          v21 = 1;
        else
          v21 = 2;
        v15 += v21;
        if (++v14 >= length || v15 >= a4)
          goto LABEL_55;
      }
      v18 = v50.location + v14;
LABEL_14:
      v19 = v17[v18];
      goto LABEL_24;
    }
    v15 = 0;
    v14 = 0;
LABEL_55:
    if (v8 && v15 <= a4)
    {
      return location + length;
    }
    else
    {
      v34 = v38;
      v35 = -[NSMutableString length](v38->_lineString, "length", v38) - location;
      v36 = -[NSMutableString length](v34->_lineString, "length");
      if (location + v14 + 1 < v36)
        v37 = location + v14 + 1;
      else
        v37 = v36;
      return -[NSMutableString mf_lineBreakBeforeIndex:withinRange:](v34->_lineString, "mf_lineBreakBeforeIndex:withinRange:", v37, location, v35);
    }
  }
  return result;
}

- (void)_outputQuotedParagraph:(id)a3 range:(_NSRange)a4 withQuoteLevel:(unsigned int)a5
{
  NSUInteger length;
  NSUInteger location;
  BOOL v8;
  char v9;
  const __CFString *v10;
  NSMutableString *lineString;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSMutableString *outputString;
  CFIndex v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  NSUInteger v33;
  unint64_t v34;
  CFStringRef v35;
  _BYTE *v36;
  uint64_t v37;
  unint64_t Bytes;
  NSUInteger v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  NSObject *v47;
  unint64_t v48;
  NSUInteger v49;
  char v50;
  NSUInteger v51;
  NSUInteger v52;
  const __CFString *v53;
  unsigned int v54;
  NSUInteger v55;
  NSUInteger v58;
  NSUInteger v59;
  uint8_t buf[16];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;
  CFRange v66;

  length = a4.length;
  location = a4.location;
  v65 = *MEMORY[0x1E0C80C00];
  if (a4.length)
    v8 = 1;
  else
    v8 = a5 == 0;
  v9 = v8;
  v10 = CFSTR(" \n");
  if ((*((_BYTE *)self + 40) & 1) == 0)
    v10 = CFSTR("\n");
  v53 = v10;
  lineString = self->_lineString;
  if (lineString)
    -[NSMutableString setString:](lineString, "setString:", &stru_1E81CBE50);
  else
    self->_lineString = (NSMutableString *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 72);
  if (a5)
  {
    v12 = a5;
    do
    {
      -[NSMutableString appendString:](self->_lineString, "appendString:", CFSTR(">"));
      --v12;
    }
    while (v12);
    v13 = 72 - a5;
  }
  else
  {
    v13 = 72;
  }
  v50 = v9;
  if (length > v13 && (v14 = objc_msgSend(a3, "substringWithRange:", location, length)) != 0)
  {
    v15 = v14;
    if (_weakDDURLifierClass_onceToken != -1)
      dispatch_once(&_weakDDURLifierClass_onceToken, &__block_literal_global_2);
    v16 = (void *)objc_msgSend((id)_weakDDURLifierClass_sDDURLifierClass, "urlMatchesForString:", v15);
  }
  else
  {
    v16 = 0;
  }
  outputString = self->_outputString;
  if (outputString)
  {
    v59 = length + location;
    if (location < length + location)
    {
      v51 = ~location;
      v18 = location;
      v49 = location;
      while (1)
      {
        if (a5
          || objc_msgSend(a3, "rangeOfString:options:range:", CFSTR(" "), 8, v18, length) != 0x7FFFFFFFFFFFFFFFLL
          || objc_msgSend(a3, "rangeOfString:options:range:", CFSTR("From "), 8, v18, length) != 0x7FFFFFFFFFFFFFFFLL
          || objc_msgSend(a3, "rangeOfString:options:range:", CFSTR(">"), 8, v18, length) != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[NSMutableString appendString:](self->_lineString, "appendString:", CFSTR(" "));
        }
        v52 = length;
        v19 = -[NSMutableString length](self->_lineString, "length");
        v58 = location;
        v55 = location - v19;
        v20 = location - v19 + 72;
        *(_OWORD *)buf = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", buf, v64, 16);
        if (v21)
        {
          v22 = v21;
          v23 = v20 + v51;
          v24 = *(_QWORD *)v61;
LABEL_33:
          v25 = 0;
          while (1)
          {
            if (*(_QWORD *)v61 != v24)
              objc_enumerationMutation(v16);
            v26 = *(void **)(*(_QWORD *)&buf[8] + 8 * v25);
            v27 = objc_msgSend(v26, "range");
            if (v27 <= v23 && v27 + v28 > v23)
              break;
            if (v22 == ++v25)
            {
              v22 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", buf, v64, 16);
              if (v22)
                goto LABEL_33;
              goto LABEL_49;
            }
          }
          if (!v26)
            goto LABEL_49;
          v30 = objc_msgSend(v26, "range");
          v32 = v31 + v49 + v30;
          if (v32 <= v20)
            goto LABEL_49;
          v33 = v58;
          if (v19 - v58 + v32 <= 0x3E6)
            v20 = v31 + v49 + v30;
          else
            v20 = v55 + 998;
          v54 = 1;
        }
        else
        {
LABEL_49:
          v54 = 0;
          v33 = v58;
        }
        if (v20 >= v59)
          v34 = v59;
        else
          v34 = v20;
        v66.length = v34 - v33;
        v66.location = v18;
        v35 = CFStringCreateWithSubstring(0, (CFStringRef)a3, v66);
        -[NSMutableString appendString:](self->_lineString, "appendString:", v35);
        CFRelease(v35);
        if ((unint64_t)-[NSMutableString length](self->_lineString, "length") >= 0x49)
        {
          v36 = NSZoneMalloc(0, -[NSMutableString length](self->_lineString, "length"));
          -[NSMutableString length](self->_lineString, "length");
          v37 = 998;
        }
        else
        {
          v36 = v64;
          v37 = 72;
        }
        -[NSMutableString length](self->_lineString, "length");
        Bytes = MFStringGetBytes();
        if (Bytes < -[NSMutableString length](self->_lineString, "length", 0))
          Bytes = -[NSMutableString rangeOfComposedCharacterSequenceAtIndex:](self->_lineString, "rangeOfComposedCharacterSequenceAtIndex:", Bytes);
        if (v36 != v64)
          NSZoneFree(0, v36);
        if (Bytes <= v19)
        {

          self->_outputString = 0;
          return;
        }
        if (Bytes == -[NSMutableString length](self->_lineString, "length") && v59 <= v20)
        {
          v39 = v58;
          goto LABEL_80;
        }
        v40 = -[_MFFormatFlowedWriter _findLineBreakInRange:maxCharWidthCount:endIsURL:](self, "_findLineBreakInRange:maxCharWidthCount:endIsURL:", v19, Bytes - v19, v37 - v19, v54);
        if (v40 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_76;
        if (v40 != v19)
          break;
        if ((v54 & 1) != 0)
          goto LABEL_76;
        v41 = objc_msgSend((id)objc_msgSend(a3, "substringWithRange:", v18, v52), "mf_nextWordFromIndex:forward:", 0, 1);
        if (v41 == 0x7FFFFFFFFFFFFFFFLL || v41 > 998 - v19)
          goto LABEL_76;
        v42 = objc_msgSend(a3, "substringWithRange:", v18, v41);
        -[NSMutableString deleteCharactersInRange:](self->_lineString, "deleteCharactersInRange:", v19, -[NSMutableString length](self->_lineString, "length") - v19);
        -[NSMutableString appendString:](self->_lineString, "appendString:", v42);
        v43 = NSZoneMalloc(0, 0x3E6uLL);
        -[NSMutableString length](self->_lineString, "length");
        v44 = MFStringGetBytes();
        v45 = -[NSMutableString length](self->_lineString, "length", 0);
        if (v44 == v45)
          Bytes = v44;
        NSZoneFree(0, v43);
        v46 = Bytes - v19;
        v39 = v58;
        v34 = v46 + v58;
        if (v44 != v45)
          goto LABEL_78;
LABEL_80:
        if (!self->_outputString)
          return;
        v48 = v34 - v39 + v19;
        if (v48 < -[NSMutableString length](self->_lineString, "length"))
          -[NSMutableString deleteCharactersInRange:](self->_lineString, "deleteCharactersInRange:", v34 - v39 + v19, -[NSMutableString length](self->_lineString, "length") - v48);
        -[NSMutableString appendString:](self->_outputString, "appendString:", self->_lineString);
        length = v59 - v34;
        if (v59 != v34)
          -[NSMutableString appendString:](self->_outputString, "appendString:", v53);
        if (-[NSMutableString length](self->_lineString, "length") > (unint64_t)a5)
          -[NSMutableString deleteCharactersInRange:](self->_lineString, "deleteCharactersInRange:", a5, -[NSMutableString length](self->_lineString, "length") - a5);
        outputString = self->_outputString;
        if (!outputString)
          return;
        v18 = v34;
        location = v34;
        if (v59 <= v34)
          goto LABEL_89;
      }
      if (v40 < v19)
      {
        v47 = MFLogGeneral();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C8839000, v47, OS_LOG_TYPE_INFO, "Bad line break index", buf, 2u);
        }
LABEL_76:
        v40 = Bytes;
      }
      v34 = v55 + v40;
      v39 = v58;
LABEL_78:
      if ((*((_BYTE *)self + 40) & 1) == 0)
      {
        -[NSMutableString replaceOccurrencesOfString:withString:options:range:](self->_outputString, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" \n"), CFSTR("  \n"), 0, 0, -[NSMutableString length](self->_outputString, "length"));
        *((_BYTE *)self + 40) |= 1u;
        v53 = CFSTR(" \n");
      }
      goto LABEL_80;
    }
LABEL_89:
    if ((v50 & 1) == 0)
      -[NSMutableString appendString:](outputString, "appendString:", self->_lineString);
  }
}

- (id)outputString
{
  NSMutableString *outputString;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int v16;
  id v17;

  outputString = self->_outputString;
  if (!outputString)
  {
    v5 = -[MFPlainTextDocument fragmentCount](self->_inputDocument, "fragmentCount");
    v17 = 0;
    v16 = 0;
    outputString = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    self->_outputString = outputString;
    if (v5)
    {
      v6 = 0;
      while (1)
      {
        if (!outputString)
          return (id)-[NSMutableString copyWithZone:](outputString, "copyWithZone:", 0);
        -[MFPlainTextDocument getString:quoteLevel:ofFragmentAtIndex:](self->_inputDocument, "getString:quoteLevel:ofFragmentAtIndex:", &v17, &v16, v6);
        v7 = objc_msgSend(v17, "length");
        if (v7)
          break;
LABEL_21:
        ++v6;
        outputString = self->_outputString;
        if (v6 == v5)
          return (id)-[NSMutableString copyWithZone:](outputString, "copyWithZone:", 0);
      }
      v8 = v7;
      v9 = 0;
      while (1)
      {
        if (!self->_outputString)
          goto LABEL_21;
        v14 = 0;
        v15 = 0;
        v13 = 0;
        objc_msgSend(v17, "getLineStart:end:contentsEnd:forRange:", &v15, &v14, &v13, v9, 0);
        v10 = objc_msgSend(v17, "rangeOfString:options:range:", CFSTR("-- "), 8, v15, v13 - v15);
        v11 = v13;
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          break;
        do
        {
          v12 = v11;
          if (v11 <= v15)
            break;
          --v11;
        }
        while (objc_msgSend(v17, "characterAtIndex:", v12 - 1) == 32);
        if (v13 == v12)
          goto LABEL_18;
        if (v13 != v14)
        {
          v13 = v12;
LABEL_18:
          -[_MFFormatFlowedWriter _outputQuotedParagraph:range:withQuoteLevel:](self, "_outputQuotedParagraph:range:withQuoteLevel:", v17, v15, v12 - v15, v16);
          if (v13 != v14)
            -[NSMutableString appendString:](self->_outputString, "appendString:", CFSTR("\n"));
          goto LABEL_20;
        }
        -[_MFFormatFlowedWriter _outputQuotedParagraph:range:withQuoteLevel:](self, "_outputQuotedParagraph:range:withQuoteLevel:", v17, v15, v12 + 1 - v15, v16);
        if (v13 - v12 >= 2)
        {
          -[NSMutableString appendString:](self->_outputString, "appendString:", CFSTR("\n"));
          -[_MFFormatFlowedWriter _outputQuotedParagraph:range:withQuoteLevel:](self, "_outputQuotedParagraph:range:withQuoteLevel:", v17, v12 + 1, ~v12 + v13, v16);
        }
LABEL_20:
        v9 = v14;
        if (v14 >= v8)
          goto LABEL_21;
      }
      v12 = v13;
      goto LABEL_18;
    }
  }
  return (id)-[NSMutableString copyWithZone:](outputString, "copyWithZone:", 0);
}

- (id)quotedString
{
  NSMutableString *quotedString;
  unint64_t v5;
  uint64_t i;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  id v15;

  quotedString = self->_quotedString;
  if (!quotedString)
  {
    v5 = -[MFPlainTextDocument fragmentCount](self->_inputDocument, "fragmentCount");
    v15 = 0;
    v14 = 0;
    quotedString = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    self->_quotedString = quotedString;
    if (v5)
    {
      for (i = 0; i != v5; ++i)
      {
        if (!quotedString)
          break;
        -[MFPlainTextDocument getString:quoteLevel:ofFragmentAtIndex:](self->_inputDocument, "getString:quoteLevel:ofFragmentAtIndex:", &v15, &v14, i);
        v7 = objc_msgSend(v15, "length");
        if (v7)
        {
          v8 = v7;
          v9 = 0;
          do
          {
            if (!self->_quotedString)
              break;
            v12 = 0;
            v13 = 0;
            v11 = 0;
            objc_msgSend(v15, "getLineStart:end:contentsEnd:forRange:", &v13, &v12, &v11, v9, 0);
            if (v14)
            {
              v10 = v14 + 1;
              do
              {
                -[NSMutableString appendString:](self->_quotedString, "appendString:", CFSTR(">"));
                --v10;
              }
              while (v10 > 1);
              -[NSMutableString appendString:](self->_quotedString, "appendString:", CFSTR(" "));
            }
            -[NSMutableString appendString:](self->_quotedString, "appendString:", objc_msgSend(v15, "substringWithRange:", v13, v12 - v13));
            v9 = v12;
          }
          while (v12 < v8);
        }
        quotedString = self->_quotedString;
      }
    }
  }
  return (id)-[NSMutableString copyWithZone:](quotedString, "copyWithZone:", 0);
}

- (BOOL)addedTrailingSpaces
{
  return *((_BYTE *)self + 40) & 1;
}

@end
