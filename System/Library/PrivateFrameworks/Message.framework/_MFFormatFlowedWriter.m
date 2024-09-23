@implementation _MFFormatFlowedWriter

+ (id)newWithPlainTextDocument:(id)a3 encoding:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  v7 = objc_msgSend(objc_allocWithZone((Class)a1), "init");
  v8 = *(void **)(v7 + 8);
  *(_QWORD *)(v7 + 8) = v6;

  *(_DWORD *)(v7 + 16) = a4;
  return (id)v7;
}

- (unint64_t)_findLineBreakInRange:(_NSRange)a3 maxCharWidthCount:(unint64_t)a4 endIsURL:(BOOL)a5
{
  unint64_t result;
  _BOOL4 v8;
  NSUInteger length;
  NSUInteger location;
  __int128 v12;
  NSMutableString *lineString;
  const char *CStringPtr;
  uint64_t v15;
  unint64_t v16;
  NSUInteger v17;
  UniChar *v18;
  NSUInteger v19;
  UniChar v20;
  UChar32 v21;
  uint64_t v22;
  uint64_t v24;
  NSUInteger v25;
  UniChar *v26;
  NSUInteger v27;
  UniChar v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _MFFormatFlowedWriter *v35;
  NSUInteger v36;
  unint64_t v37;
  uint64_t v38;
  _MFFormatFlowedWriter *v39;
  UniChar buffer[8];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CFStringRef theString;
  const UniChar *CharactersPtr;
  const char *v50;
  _NSRange v51;
  uint64_t v52;
  int64_t v53;
  CFRange v54;
  CFRange v55;

  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL && a3.length != 0)
  {
    v8 = a5;
    length = a3.length;
    location = a3.location;
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v46 = v12;
    v47 = v12;
    v44 = v12;
    v45 = v12;
    v42 = v12;
    v43 = v12;
    *(_OWORD *)buffer = v12;
    v41 = v12;
    lineString = self->_lineString;
    theString = (CFStringRef)lineString;
    v51 = a3;
    CharactersPtr = CFStringGetCharactersPtr((CFStringRef)lineString);
    if (CharactersPtr)
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr((CFStringRef)lineString, 0x600u);
    v39 = self;
    v52 = 0;
    v53 = 0;
    v50 = CStringPtr;
    if (a4)
    {
      v15 = 0;
      v16 = 0;
      while (1)
      {
        if (v15 < 0 || (v17 = v51.length, (uint64_t)v51.length <= v15))
        {
          v21 = 0;
          goto LABEL_16;
        }
        v18 = (UniChar *)CharactersPtr;
        if (CharactersPtr)
          break;
        if (!v50)
        {
          if (v53 <= v15 || (v31 = v52, v52 > v15))
          {
            v32 = v15 - 4;
            if ((unint64_t)v15 < 4)
              v32 = 0;
            if (v32 + 64 < (uint64_t)v51.length)
              v17 = v32 + 64;
            v52 = v32;
            v53 = v17;
            v54.location = v51.location + v32;
            v54.length = v17 - v32;
            CFStringGetCharacters(theString, v54, buffer);
            v31 = v52;
          }
          v19 = v15 - v31;
          v18 = buffer;
          goto LABEL_14;
        }
        v20 = v50[v51.location + v15];
LABEL_24:
        v21 = v20;
        if ((v20 & 0xFC00) == 0xD800 && v15 < length - 1)
        {
          v24 = v15 + 1;
          v25 = v51.length;
          if ((uint64_t)v51.length <= v15 + 1)
          {
            v28 = 0;
          }
          else
          {
            v26 = (UniChar *)CharactersPtr;
            if (CharactersPtr)
            {
              v27 = v51.location + v24;
              goto LABEL_31;
            }
            if (v50)
            {
              v28 = v50[v51.location + v24];
            }
            else
            {
              if (v53 <= v24 || (v33 = v52, v52 > v24))
              {
                v34 = v15 - 3;
                if ((unint64_t)v15 < 3)
                  v34 = 0;
                if (v34 + 64 < (uint64_t)v51.length)
                  v25 = v34 + 64;
                v52 = v34;
                v53 = v25;
                v55.location = v51.location + v34;
                v55.length = v25 - v34;
                CFStringGetCharacters(theString, v55, buffer);
                v33 = v52;
              }
              v27 = v24 - v33;
              v26 = buffer;
LABEL_31:
              v28 = v26[v27];
            }
          }
          v29 = v28 & 0xFC00;
          v30 = (v21 << 10) + v28 - 56613888;
          if (v29 == 56320)
          {
            v21 = v30;
            ++v15;
          }
        }
LABEL_16:
        if (((u_getIntPropertyValue(v21, UCHAR_EAST_ASIAN_WIDTH) - 3) & 0xFFFFFFFD) != 0)
          v22 = 1;
        else
          v22 = 2;
        v16 += v22;
        if (++v15 >= length || v16 >= a4)
          goto LABEL_55;
      }
      v19 = v51.location + v15;
LABEL_14:
      v20 = v18[v19];
      goto LABEL_24;
    }
    v16 = 0;
    v15 = 0;
LABEL_55:
    if (v8 && v16 <= a4)
    {
      return location + length;
    }
    else
    {
      v35 = v39;
      v36 = -[NSMutableString length](v39->_lineString, "length", v39) - location;
      v37 = -[NSMutableString length](v35->_lineString, "length");
      if (location + v15 + 1 < v37)
        v38 = location + v15 + 1;
      else
        v38 = v37;
      return -[NSMutableString mf_lineBreakBeforeIndex:withinRange:](v35->_lineString, "mf_lineBreakBeforeIndex:withinRange:", v38, location, v36);
    }
  }
  return result;
}

- (void)_outputQuotedParagraph:(id)a3 range:(_NSRange)a4 withQuoteLevel:(unsigned int)a5
{
  NSUInteger length;
  NSUInteger location;
  BOOL v9;
  char v10;
  __CFString *v11;
  NSMutableString *lineString;
  NSMutableString *v13;
  NSMutableString *v14;
  uint64_t v15;
  void *v16;
  NSMutableString *outputString;
  unint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  CFRange v34;
  uint64_t v35;
  CFStringRef v36;
  __int128 v37;
  _OWORD *v38;
  uint64_t v39;
  unint64_t Bytes;
  NSMutableString *v41;
  unint64_t v42;
  unint64_t v43;
  NSMutableString *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  NSObject *v52;
  char v53;
  NSUInteger v54;
  NSUInteger v55;
  __CFString *v56;
  void *v57;
  unsigned int v58;
  unint64_t v59;
  NSUInteger v60;
  __CFString *str;
  NSUInteger v62;
  id v63;
  unint64_t v64;
  unint64_t v65;
  uint8_t buf[16];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _OWORD v70[4];
  unint64_t v71;
  uint64_t v72;

  length = a4.length;
  location = a4.location;
  v72 = *MEMORY[0x1E0C80C00];
  str = (__CFString *)a3;
  v58 = a5;
  if (length)
    v9 = 1;
  else
    v9 = a5 == 0;
  v10 = v9;
  if ((*((_BYTE *)self + 40) & 1) != 0)
    v11 = CFSTR(" \n");
  else
    v11 = CFSTR("\n");
  v56 = v11;
  lineString = self->_lineString;
  if (lineString)
  {
    -[NSMutableString setString:](lineString, "setString:", &stru_1E4F1C8F8);
  }
  else
  {
    v13 = (NSMutableString *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 72);
    v14 = self->_lineString;
    self->_lineString = v13;

  }
  if (a5)
  {
    v15 = a5;
    do
    {
      -[NSMutableString appendString:](self->_lineString, "appendString:", CFSTR(">"));
      --v15;
    }
    while (v15);
  }
  if (length <= 72 - (unint64_t)a5)
  {
    v57 = 0;
  }
  else
  {
    -[__CFString substringWithRange:](str, "substringWithRange:", location, length);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (_weakDDURLifierClass_onceToken != -1)
        dispatch_once(&_weakDDURLifierClass_onceToken, &__block_literal_global_4);
      objc_msgSend(objc_retainAutorelease((id)_weakDDURLifierClass_sDDURLifierClass), "urlMatchesForString:", v16);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = 0;
    }

  }
  outputString = self->_outputString;
  if (outputString)
  {
    v53 = v10;
    v64 = length + location;
    if (location < length + location)
    {
      v54 = location;
      v55 = ~location;
      v62 = location;
      v65 = location;
      while (1)
      {
        if (v58
          || -[__CFString rangeOfString:options:range:](str, "rangeOfString:options:range:", CFSTR(" "), 8, v62, length) != 0x7FFFFFFFFFFFFFFFLL|| -[__CFString rangeOfString:options:range:](str, "rangeOfString:options:range:", CFSTR("From "), 8, v62, length) != 0x7FFFFFFFFFFFFFFFLL|| -[__CFString rangeOfString:options:range:](str, "rangeOfString:options:range:", CFSTR(">"), 8, v62,
               length) != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[NSMutableString appendString:](self->_lineString, "appendString:", CFSTR(" "));
        }
        v18 = -[NSMutableString length](self->_lineString, "length");
        v19 = v57;
        *(_OWORD *)buf = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v20 = v19;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", buf, v70, 16);
        v59 = v65 - v18;
        v60 = length;
        v22 = v65 - v18 + 72;
        if (v21)
        {
          v23 = v22 + v55;
          v24 = *(_QWORD *)v67;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v67 != v24)
                objc_enumerationMutation(v20);
              v26 = *(void **)(*(_QWORD *)&buf[8] + 8 * i);
              v27 = objc_msgSend(v26, "range");
              if (v27 <= v23 && v27 + v28 > v23)
              {
                v63 = v26;
                goto LABEL_45;
              }
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", buf, v70, 16);
            if (v21)
              continue;
            break;
          }
        }
        v63 = 0;
LABEL_45:

        if (v63 && (v30 = objc_msgSend(v63, "range"), v32 = v31 + v54 + v30, v32 > v22))
        {
          if (v18 - v65 + v32 <= 0x3E6)
            v22 = v31 + v54 + v30;
          else
            v22 = v59 + 998;
          v33 = 1;
        }
        else
        {
          v33 = 0;
        }
        v34.location = v65;
        if (v22 >= v64)
          v35 = v64;
        else
          v35 = v22;
        v34.length = v35 - v65;
        v36 = CFStringCreateWithSubstring(0, str, v34);
        -[NSMutableString appendString:](self->_lineString, "appendString:", v36);
        CFRelease(v36);
        v71 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v37 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v70[2] = v37;
        v70[3] = v37;
        v70[0] = v37;
        v70[1] = v37;
        if ((unint64_t)-[NSMutableString length](self->_lineString, "length") >= 0x49)
        {
          v38 = NSZoneMalloc(0, -[NSMutableString length](self->_lineString, "length"));
          -[NSMutableString length](self->_lineString, "length");
          v39 = 998;
        }
        else
        {
          v38 = v70;
          v39 = 72;
        }
        -[NSMutableString length](self->_lineString, "length");
        Bytes = MFStringGetBytes();
        if (Bytes < -[NSMutableString length](self->_lineString, "length", 0))
          Bytes = -[NSMutableString rangeOfComposedCharacterSequenceAtIndex:](self->_lineString, "rangeOfComposedCharacterSequenceAtIndex:", Bytes);
        if (v38 != v70)
          NSZoneFree(0, v38);
        if (Bytes <= v18)
        {
          v41 = self->_outputString;
          self->_outputString = 0;

          length = v60;
          v35 = 0x7FFFFFFFFFFFFFFFLL;
          v65 = v64;
          goto LABEL_67;
        }
        if (Bytes == -[NSMutableString length](self->_lineString, "length") && v64 <= v22)
        {
          length = v60;
          goto LABEL_67;
        }
        v43 = -[_MFFormatFlowedWriter _findLineBreakInRange:maxCharWidthCount:endIsURL:](self, "_findLineBreakInRange:maxCharWidthCount:endIsURL:", v18, Bytes - v18, v39 - v18, v33);
        length = v60;
        if (v43 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_80;
        if (v43 != v18)
          break;
        if ((v33 & 1) != 0)
          goto LABEL_80;
        -[__CFString substringWithRange:](str, "substringWithRange:", v62, v60);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "mf_nextWordFromIndex:forward:", 0, 1);
        if (v46 == 0x7FFFFFFFFFFFFFFFLL || v46 > 998 - v18)
        {

          v35 = v59 + Bytes;
          goto LABEL_82;
        }
        -[__CFString substringWithRange:](str, "substringWithRange:", v62, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableString deleteCharactersInRange:](self->_lineString, "deleteCharactersInRange:", v18, -[NSMutableString length](self->_lineString, "length") - v18);
        -[NSMutableString appendString:](self->_lineString, "appendString:", v47);
        v48 = NSZoneMalloc(0, 0x3E6uLL);
        -[NSMutableString length](self->_lineString, "length");
        v49 = MFStringGetBytes();
        v50 = -[NSMutableString length](self->_lineString, "length", 0);
        NSZoneFree(0, v48);
        v51 = v49 == v50;
        if (v49 == v50)
          Bytes = v49;

        length = v60;
        v35 = Bytes - v18 + v65;
        if (!v51)
          goto LABEL_82;
LABEL_67:
        if (self->_outputString)
        {
          v42 = v35 - v65 + v18;
          if (v42 < -[NSMutableString length](self->_lineString, "length"))
            -[NSMutableString deleteCharactersInRange:](self->_lineString, "deleteCharactersInRange:", v42, -[NSMutableString length](self->_lineString, "length") - v42);
          -[NSMutableString appendString:](self->_outputString, "appendString:", self->_lineString);
          length = v64 - v35;
          if (v64 != v35)
            -[NSMutableString appendString:](self->_outputString, "appendString:", v56);
          if (-[NSMutableString length](self->_lineString, "length") > (unint64_t)v58)
            -[NSMutableString deleteCharactersInRange:](self->_lineString, "deleteCharactersInRange:", v58, -[NSMutableString length](self->_lineString, "length") - v58);
          v65 = v35;
          v62 = v35;
        }

        outputString = self->_outputString;
        if (!outputString)
          goto LABEL_99;
        v64 = length + v62;
        if (v65 >= length + v62)
          goto LABEL_97;
      }
      if (v43 < v18)
      {
        MFLogGeneral();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4F90000, v52, OS_LOG_TYPE_INFO, "Bad line break index", buf, 2u);
        }

LABEL_80:
        v43 = Bytes;
      }
      v35 = v59 + v43;
LABEL_82:
      if ((*((_BYTE *)self + 40) & 1) == 0)
      {

        v44 = self->_outputString;
        -[NSMutableString length](v44, "length");
        -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v44, "replaceOccurrencesOfString:withString:options:range:");
        *((_BYTE *)self + 40) |= 1u;
        v56 = CFSTR(" \n");
      }
      goto LABEL_67;
    }
LABEL_97:
    if ((v53 & 1) == 0)
      -[NSMutableString appendString:](outputString, "appendString:", self->_lineString);
  }
LABEL_99:

}

- (id)outputString
{
  NSMutableString *outputString;
  unint64_t v4;
  NSMutableString *v5;
  NSMutableString *v6;
  uint64_t v7;
  id v8;
  void *v9;
  MFPlainTextDocument *inputDocument;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v17;
  _QWORD v18[3];
  id v19;
  unsigned int v20;

  outputString = self->_outputString;
  if (!outputString)
  {
    v4 = -[MFPlainTextDocument fragmentCount](self->_inputDocument, "fragmentCount");
    v20 = -1431655766;
    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v6 = self->_outputString;
    self->_outputString = v5;

    v17 = v4;
    if (v4)
    {
      v7 = 0;
      v8 = 0;
      do
      {
        v9 = v8;
        if (!self->_outputString)
          break;
        inputDocument = self->_inputDocument;
        v19 = v8;
        -[MFPlainTextDocument getString:quoteLevel:ofFragmentAtIndex:](inputDocument, "getString:quoteLevel:ofFragmentAtIndex:", &v19, &v20, v7);
        v8 = v19;

        v11 = objc_msgSend(v8, "length");
        if (v11)
        {
          v12 = 0;
          while (1)
          {
            if (!self->_outputString)
              goto LABEL_21;
            memset(v18, 170, sizeof(v18));
            objc_msgSend(v8, "getLineStart:end:contentsEnd:forRange:", &v18[2], &v18[1], v18, v12, 0);
            v13 = objc_msgSend(v8, "rangeOfString:options:range:", CFSTR("-- "), 8, v18[2], v18[0] - v18[2]);
            v14 = v18[0];
            if (v13 != 0x7FFFFFFFFFFFFFFFLL)
              break;
            do
            {
              v15 = v14;
              if (v14 <= v18[2])
                break;
              --v14;
            }
            while (objc_msgSend(v8, "characterAtIndex:", v15 - 1) == 32);
            if (v18[0] == v15)
              goto LABEL_16;
            if (v18[0] != v18[1])
            {
              v18[0] = v15;
LABEL_16:
              -[_MFFormatFlowedWriter _outputQuotedParagraph:range:withQuoteLevel:](self, "_outputQuotedParagraph:range:withQuoteLevel:", v8, v18[2], v15 - v18[2], v20, v17);
              if (v18[0] != v18[1])
                -[NSMutableString appendString:](self->_outputString, "appendString:", CFSTR("\n"));
              goto LABEL_18;
            }
            -[_MFFormatFlowedWriter _outputQuotedParagraph:range:withQuoteLevel:](self, "_outputQuotedParagraph:range:withQuoteLevel:", v8, v18[2], v15 + 1 - v18[2], v20);
            if (v18[0] - v15 >= 2)
            {
              -[NSMutableString appendString:](self->_outputString, "appendString:", CFSTR("\n"));
              -[_MFFormatFlowedWriter _outputQuotedParagraph:range:withQuoteLevel:](self, "_outputQuotedParagraph:range:withQuoteLevel:", v8, v15 + 1, ~v15 + v18[0], v20);
            }
LABEL_18:
            v12 = v18[1];
            if (v18[1] >= v11)
              goto LABEL_21;
          }
          v15 = v18[0];
          goto LABEL_16;
        }
LABEL_21:
        ++v7;
      }
      while (v7 != v17);

    }
    outputString = self->_outputString;
  }
  return (id)-[NSMutableString copy](outputString, "copy", v17);
}

- (id)quotedString
{
  NSMutableString *quotedString;
  unint64_t v4;
  NSMutableString *v5;
  NSMutableString *v6;
  uint64_t v7;
  id v8;
  void *v9;
  MFPlainTextDocument *inputDocument;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableString *v14;
  void *v15;
  _QWORD v17[3];
  id v18;
  unsigned int v19;

  quotedString = self->_quotedString;
  if (!quotedString)
  {
    v4 = -[MFPlainTextDocument fragmentCount](self->_inputDocument, "fragmentCount");
    v19 = -1431655766;
    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v6 = self->_quotedString;
    self->_quotedString = v5;

    if (v4)
    {
      v7 = 0;
      v8 = 0;
      do
      {
        v9 = v8;
        if (!self->_quotedString)
          break;
        inputDocument = self->_inputDocument;
        v18 = v8;
        -[MFPlainTextDocument getString:quoteLevel:ofFragmentAtIndex:](inputDocument, "getString:quoteLevel:ofFragmentAtIndex:", &v18, &v19, v7);
        v8 = v18;

        v11 = objc_msgSend(v8, "length");
        if (v11)
        {
          v12 = 0;
          do
          {
            if (!self->_quotedString)
              break;
            memset(v17, 170, sizeof(v17));
            objc_msgSend(v8, "getLineStart:end:contentsEnd:forRange:", &v17[2], &v17[1], v17, v12, 0);
            if (v19)
            {
              v13 = v19 + 1;
              do
              {
                -[NSMutableString appendString:](self->_quotedString, "appendString:", CFSTR(">"));
                --v13;
              }
              while (v13 > 1);
              -[NSMutableString appendString:](self->_quotedString, "appendString:", CFSTR(" "));
            }
            v14 = self->_quotedString;
            objc_msgSend(v8, "substringWithRange:", v17[2], v17[1] - v17[2]);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableString appendString:](v14, "appendString:", v15);

            v12 = v17[1];
          }
          while (v17[1] < v11);
        }
        ++v7;
      }
      while (v7 != v4);

    }
    quotedString = self->_quotedString;
  }
  return (id)-[NSMutableString copy](quotedString, "copy");
}

- (BOOL)addedTrailingSpaces
{
  return *((_BYTE *)self + 40) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineString, 0);
  objc_storeStrong((id *)&self->_quotedString, 0);
  objc_storeStrong((id *)&self->_outputString, 0);
  objc_storeStrong((id *)&self->_inputDocument, 0);
}

@end
