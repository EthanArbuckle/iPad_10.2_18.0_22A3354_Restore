@implementation MFMimeEnrichedReader

+ (__CFCharacterSet)punctuationSet
{
  __CFCharacterSet *result;

  result = (__CFCharacterSet *)punctuationSet_puncSet;
  if (!punctuationSet_puncSet)
  {
    result = CFCharacterSetCreateWithCharactersInString(0, CFSTR(" <>\n"));
    punctuationSet_puncSet = (uint64_t)result;
  }
  return result;
}

+ (__CFCharacterSet)parenSet
{
  __CFCharacterSet *result;

  result = (__CFCharacterSet *)parenSet_parenSet;
  if (!parenSet_parenSet)
  {
    result = CFCharacterSetCreateWithCharactersInString(0, CFSTR("<>"));
    parenSet_parenSet = (uint64_t)result;
  }
  return result;
}

- (void)setWantsHTML:(BOOL)a3
{
  *((_BYTE *)self + 212) = *((_BYTE *)self + 212) & 0xFE | !a3;
}

- (void)mismatchError:(id)a3
{
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = a3;
    _os_log_impl(&dword_1C8839000, v4, OS_LOG_TYPE_INFO, "Ignoring unmatched </%@> command", (uint8_t *)&v5, 0xCu);
  }
}

- (void)dealloc
{
  __CFString *prependHTML;
  __CFString *postpendHTML;
  objc_super v5;

  prependHTML = self->_prependHTML;
  if (prependHTML)
    CFRelease(prependHTML);
  postpendHTML = self->_postpendHTML;
  if (postpendHTML)
    CFRelease(postpendHTML);
  if (self->_commandStack)
  {
    while (_releaseTopStackEntry((uint64_t)self))
      ;
    CFRelease(self->_commandStack);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFMimeEnrichedReader;
  -[MFMimeEnrichedReader dealloc](&v5, sel_dealloc);
}

- (void)appendStringToBuffer:(id)a3
{
  id v3;

  v3 = a3;
  if ((*((_BYTE *)self + 211) & 0x40) != 0 && objc_msgSend(a3, "hasPrefix:", CFSTR("\n")))
    v3 = (id)objc_msgSend(v3, "substringFromIndex:", 1);
  -[NSMutableString appendString:](self->_outputBuffer, "appendString:", v3);
  *((_BYTE *)self + 211) &= ~0x40u;
}

- (void)resetStateWithString:(id)a3 outputString:(id)a4
{
  CFIndex Length;
  unsigned __int16 *CharactersPtr;
  char *CStringPtr;

  self->_outputString = a4;
  if (a3)
    Length = CFStringGetLength((CFStringRef)a3);
  else
    Length = 0;
  self->_inputLength = Length;
  self->_inputBuffer.theString = (__CFString *)a3;
  self->_inputBuffer.rangeToBuffer.location = 0;
  self->_inputBuffer.rangeToBuffer.length = Length;
  CharactersPtr = (unsigned __int16 *)CFStringGetCharactersPtr((CFStringRef)a3);
  CStringPtr = 0;
  self->_inputBuffer.directUniCharBuffer = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
  self->_inputBuffer.directCStringBuffer = CStringPtr;
  self->_inputBuffer.bufferedRangeEnd = 0;
  self->_currentIndex = 0;
  self->_inputBuffer.bufferedRangeStart = 0;
  *((_BYTE *)self + 211) &= ~0x80u;
  if (self->_commandStack)
  {
    while (_releaseTopStackEntry((uint64_t)self))
      ;

  }
  self->_commandStack = CFArrayCreateMutable(0, 0, 0);

  self->_outputBuffer = (NSMutableString *)objc_opt_new();
}

- (void)nowWouldBeAGoodTimeToAppendToTheAttributedString
{
  CFIndex Count;
  CFIndex v4;
  int v5;
  int v6;
  CFIndex v7;
  int v8;
  id **ValueAtIndex;
  const __CFString *v10;
  const char *v11;
  const __CFString *v12;
  CFIndex v13;
  CFIndex v14;
  void *v15;
  int v16;
  int v17;
  __CFString *outputString;
  uint64_t v19;
  NSMutableString *outputBuffer;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v23;
  char v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  UniChar v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  int64_t v35;
  __CFString *v36;
  const __CFString *v37;
  UniChar chars;
  UniChar buffer[8];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  NSMutableString *v47;
  const UniChar *v48;
  const char *v49;
  uint64_t v50;
  int64_t v51;
  int64_t v52;
  int64_t v53;
  CFRange v54;

  if ((*((_BYTE *)self + 212) & 1) != 0)
  {
    objc_msgSend(self->_outputString, "appendString:", self->_outputBuffer);
    -[NSMutableString setString:](self->_outputBuffer, "setString:", &stru_1E81CBE50);
    return;
  }
  if (-[NSMutableString length](self->_outputBuffer, "length"))
  {
    if (!self->_prependHTML)
      self->_prependHTML = CFStringCreateMutable(0, 0);
    if (!self->_postpendHTML)
      self->_postpendHTML = CFStringCreateMutable(0, 0);
    Count = CFArrayGetCount(self->_commandStack);
    if (Count < 1)
    {
      v5 = 0;
    }
    else
    {
      v4 = Count;
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 0;
      do
      {
        ValueAtIndex = (id **)CFArrayGetValueAtIndex(self->_commandStack, v7);
        if (objc_msgSend(**ValueAtIndex, "isEqualToString:", CFSTR("underline")))
        {
          if (v6)
          {
            ++v6;
          }
          else
          {
            CFStringAppendCString(self->_prependHTML, "<U>", 0x8000100u);
            CFStringInsert(self->_postpendHTML, 0, CFSTR("</U>"));
            v6 = 1;
          }
        }
        else if (objc_msgSend(**ValueAtIndex, "isEqualToString:", CFSTR("excerpt")))
        {
          ++v5;
        }
        else if (objc_msgSend(**ValueAtIndex, "isEqualToString:", CFSTR("superscript")))
        {
          ++v8;
        }
        else
        {
          v8 -= objc_msgSend(**ValueAtIndex, "isEqualToString:", CFSTR("subscript"));
        }
        ++v7;
      }
      while (v4 != v7);
      if (v8 <= 0)
      {
        if ((v8 & 0x80000000) == 0)
          goto LABEL_25;
        v10 = CFSTR("</SUB>");
        v11 = "<SUB>";
      }
      else
      {
        v10 = CFSTR("</SUP>");
        v11 = "<SUP>";
      }
      CFStringAppendCString(self->_prependHTML, v11, 0x8000100u);
      CFStringInsert(self->_postpendHTML, 0, v10);
    }
LABEL_25:
    v12 = -[MFMimeEnrichedReader currentFont](self, "currentFont");
    v13 = _currentAttributeOfType((uint64_t)self, 2);
    v14 = _currentAttributeOfType((uint64_t)self, 3);
    if ((unint64_t)v12 | v13)
    {
      v15 = (void *)v14;
      CFStringAppendCString(self->_prependHTML, "<SPAN style=\", 0x8000100u);
      if (v12)
      {
        CFStringAppend(self->_prependHTML, v12);
        CFStringAppendCString(self->_prependHTML, "; ", 0x8000100u);
      }
      if (v13)
        CFStringAppendFormat(self->_prependHTML, 0, CFSTR("color: %s; "), objc_msgSend((id)v13, "UTF8String"));
      if (v15)
        CFStringAppendFormat(self->_prependHTML, 0, CFSTR("font-size: %dpt; "), objc_msgSend(v15, "intValue"));
      CFStringAppendCString(self->_prependHTML, "\">", 0x8000100u);
      CFStringAppendCString(self->_postpendHTML, "</SPAN>", 0x8000100u);
    }
    v16 = v5 - self->_lastQuoteLevel;
    if (v16 < 1)
    {
      if (v16 < 0)
      {
        v17 = 0;
        do
        {
          CFStringInsert(self->_prependHTML, 0, CFSTR("</BLOCKQUOTE>"));
          --v17;
        }
        while (v17 > v16);
      }
    }
    else
    {
      do
      {
        CFStringInsert(self->_prependHTML, 0, CFSTR("<BLOCKQUOTE type=\"cite\">"));
        --v16;
      }
      while (v16);
    }
    self->_lastQuoteLevel = v5;
    if (CFStringGetLength(self->_prependHTML))
      objc_msgSend(self->_outputString, "appendString:", self->_prependHTML);
    outputString = (__CFString *)self->_outputString;
    v19 = -[NSMutableString length](self->_outputBuffer, "length");
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    *(_OWORD *)buffer = 0u;
    v40 = 0u;
    outputBuffer = self->_outputBuffer;
    v47 = outputBuffer;
    v50 = 0;
    v51 = v19;
    CharactersPtr = CFStringGetCharactersPtr((CFStringRef)outputBuffer);
    CStringPtr = 0;
    v48 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr((CFStringRef)outputBuffer, 0x600u);
    v49 = CStringPtr;
    v52 = 0;
    v53 = 0;
    if (v19)
    {
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 64;
      do
      {
        if ((unint64_t)v25 >= 4)
          v27 = 4;
        else
          v27 = v25;
        chars = 0;
        if ((v25 & 0x8000000000000000) == 0)
        {
          v28 = v51;
          if (v51 > v25)
          {
            if (v48)
            {
              v29 = v48[v25 + v50];
            }
            else if (v49)
            {
              v29 = v49[v50 + v25];
            }
            else
            {
              if (v53 <= v25 || (v30 = v52, v52 > v25))
              {
                v31 = -v27;
                v32 = v27 + v23;
                v33 = v26 - v27;
                v34 = v25 + v31;
                v35 = v34 + 64;
                if (v34 + 64 >= v51)
                  v35 = v51;
                v52 = v34;
                v53 = v35;
                if (v51 >= v33)
                  v28 = v33;
                v54.length = v28 + v32;
                v54.location = v34 + v50;
                CFStringGetCharacters((CFStringRef)v47, v54, buffer);
                v30 = v52;
              }
              v29 = buffer[v25 - v30];
            }
            chars = v29;
            if (v29 > 0x25u)
            {
              switch(v29)
              {
                case '&':
                  v36 = outputString;
                  v37 = CFSTR("&amp;");
                  goto LABEL_77;
                case '>':
                  v36 = outputString;
                  v37 = CFSTR("&gt;");
                  goto LABEL_77;
                case '<':
                  v36 = outputString;
                  v37 = CFSTR("&lt;");
LABEL_77:
                  CFStringAppend(v36, v37);
                  goto LABEL_78;
              }
            }
            else
            {
              switch(v29)
              {
                case 9u:
                  v36 = outputString;
                  v37 = CFSTR("&nbsp;&nbsp;&nbsp;&nbsp;");
                  goto LABEL_77;
                case 0xAu:
                  v36 = outputString;
                  v37 = CFSTR("<br/>");
                  goto LABEL_77;
                case 0x20u:
                  if ((v24 & 1) == 0)
                  {
                    v24 = 1;
                    CFStringAppendCharacters(outputString, &chars, 1);
                    goto LABEL_79;
                  }
                  v36 = outputString;
                  v37 = CFSTR("&nbsp;");
                  goto LABEL_77;
              }
            }
          }
        }
        CFStringAppendCharacters(outputString, &chars, 1);
LABEL_78:
        v24 = 0;
LABEL_79:
        ++v25;
        --v23;
        ++v26;
      }
      while (v19 != v25);
    }
    if (CFStringGetLength(self->_postpendHTML))
      objc_msgSend(self->_outputString, "appendString:", self->_postpendHTML);
    CFStringReplaceAll(self->_prependHTML, &stru_1E81CBE50);
    CFStringReplaceAll(self->_postpendHTML, &stru_1E81CBE50);
    CFStringReplaceAll((CFMutableStringRef)self->_outputBuffer, &stru_1E81CBE50);
  }
}

- (void)closeUpQuoting
{
  int v3;

  if (self->_lastQuoteLevel >= 1)
  {
    v3 = 0;
    do
    {
      objc_msgSend(self->_outputString, "appendString:", CFSTR("</BLOCKQUOTE>"));
      ++v3;
    }
    while (v3 < self->_lastQuoteLevel);
  }
}

- (void)handleNoParameterCommand:(id *)a3
{
  const __CFCharacterSet *v5;
  __CFString *Token;
  NSMutableString *outputBuffer;
  const __CFString *v8;
  __CFString *v9;

  if (!objc_msgSend(a3->var0, "isEqualToString:", CFSTR("param")))
  {
    if (objc_msgSend(a3->var0, "isEqualToString:", CFSTR("comment")))
    {
      *((_BYTE *)self + 211) |= 0x80u;
      return;
    }
    if (objc_msgSend(a3->var0, "isEqualToString:", CFSTR("lt")))
    {
      outputBuffer = self->_outputBuffer;
      v8 = CFSTR("&lt;");
    }
    else if (objc_msgSend(a3->var0, "isEqualToString:", CFSTR("np")))
    {
      outputBuffer = self->_outputBuffer;
      v8 = CFSTR("\f");
    }
    else
    {
      if (!objc_msgSend(a3->var0, "isEqualToString:", CFSTR("nl")))
        return;
      outputBuffer = self->_outputBuffer;
      v8 = CFSTR("\n");
    }
    -[NSMutableString appendString:](outputBuffer, "appendString:", v8);
    return;
  }
  v5 = (const __CFCharacterSet *)objc_msgSend((id)objc_opt_class(), "parenSet");
  Token = (__CFString *)_copyNextToken((uint64_t)self, v5);
  if (Token)
  {
    v9 = Token;
    -[MFMimeEnrichedReader parseParameterString:](self, "parseParameterString:", Token);
    Token = v9;
  }

}

- (void)setupFontStackEntry:(_CommandStackEntry *)a3
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  id v12;
  double v13;

  if (!a3)
    -[MFMimeEnrichedReader setupFontStackEntry:].cold.1();
  if ((objc_msgSend(*(id *)a3->var0, "isEqualToString:", CFSTR("bold")) & 1) != 0)
  {
    v5 = CFSTR("font-weight: bold");
LABEL_6:
    v6 = v5;
LABEL_18:
    a3->var1 = v6;
    return;
  }
  if ((objc_msgSend(*(id *)a3->var0, "isEqualToString:", CFSTR("italic")) & 1) != 0)
  {
    v5 = CFSTR("font-style: italic");
    goto LABEL_6;
  }
  v7 = (void *)_currentAttributeOfType((uint64_t)self, 3);
  if (v7)
  {
    objc_msgSend(v7, "floatValue");
    v9 = v8;
  }
  else
  {
    v9 = 12.0;
  }
  v10 = 2.0;
  if ((objc_msgSend(*(id *)a3->var0, "isEqualToString:", CFSTR("bigger")) & 1) != 0)
    goto LABEL_17;
  v10 = 1.0;
  if ((objc_msgSend(*(id *)a3->var0, "isEqualToString:", CFSTR("x-tad-bigger")) & 1) != 0)
    goto LABEL_17;
  if (objc_msgSend(*(id *)a3->var0, "isEqualToString:", CFSTR("smaller")))
  {
    v10 = -2.0;
    v11 = 8.0;
  }
  else
  {
    if (!objc_msgSend(*(id *)a3->var0, "isEqualToString:", CFSTR("x-tad-smaller")))
      return;
    v10 = -1.0;
    v11 = 7.0;
  }
  if (v9 >= v11)
  {
LABEL_17:
    v12 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v13 = v9 + v10;
    v6 = (__CFString *)objc_msgSend(v12, "initWithFloat:", v13);
    goto LABEL_18;
  }
}

- (void)beginCommand:(id)a3
{
  __CFString **v5;
  unsigned int v6;
  void *outputBuffer;
  id **v8;
  int v9;

  v5 = &gCommandSpecTable;
  while (objc_msgSend(a3, "compare:options:", *v5, 1))
  {
    v5 += 2;
    if (v5 >= &__block_descriptor_40_e8_32o_e24_v16__0__NSNotification_8ls32l8)
      return;
  }
  v6 = *((unsigned __int8 *)v5 + 8);
  if ((v6 & 4) != 0)
  {
    outputBuffer = self->_outputBuffer;
    if (!objc_msgSend(outputBuffer, "length"))
      outputBuffer = self->_outputString;
    if (objc_msgSend(outputBuffer, "length")
      && objc_msgSend(outputBuffer, "characterAtIndex:", objc_msgSend(outputBuffer, "length") - 1) != 10)
    {
      -[NSMutableString appendString:](self->_outputBuffer, "appendString:", CFSTR("\n"));
    }
  }
  if ((v6 & 2) != 0)
    -[MFMimeEnrichedReader nowWouldBeAGoodTimeToAppendToTheAttributedString](self, "nowWouldBeAGoodTimeToAppendToTheAttributedString");
  if ((v6 & 1) != 0)
  {
    v8 = (id **)malloc_type_malloc(0x10uLL, 0xE00402B90B96AuLL);
    *v8 = (id *)v5;
    v8[1] = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = (v6 >> 3) & 3;
  if (v9 == 3 || v9 == 1)
  {
    -[MFMimeEnrichedReader setupFontStackEntry:](self, "setupFontStackEntry:", v8);
  }
  else if (!v9)
  {
    -[MFMimeEnrichedReader handleNoParameterCommand:](self, "handleNoParameterCommand:", v5);
  }
  if (v8)
  {
    CFArrayAppendValue(self->_commandStack, v8);
    if (objc_msgSend(**v8, "isEqualToString:", CFSTR("nofill")))
      *((_DWORD *)self + 52) = *((_DWORD *)self + 52) & 0xC0000000 | (*((_DWORD *)self + 52) + 1) & 0x3FFFFFFF;
  }
}

- (void)endCommand:(id)a3
{
  __CFString **v5;
  char v6;
  id **v7;

  v5 = &gCommandSpecTable;
  while (objc_msgSend(a3, "compare:options:", *v5, 1))
  {
    v5 += 2;
    if (v5 >= &__block_descriptor_40_e8_32o_e24_v16__0__NSNotification_8ls32l8)
      return;
  }
  v6 = *((_BYTE *)v5 + 8);
  if ((v6 & 2) != 0)
    -[MFMimeEnrichedReader nowWouldBeAGoodTimeToAppendToTheAttributedString](self, "nowWouldBeAGoodTimeToAppendToTheAttributedString");
  if ((v6 & 1) != 0)
  {
    v7 = (id **)_peekCommandStackEntry((uint64_t)self);
    if (v7 && !objc_msgSend(**v7, "compare:options:", a3, 1))
      _releaseTopStackEntry((uint64_t)self);
    else
      -[MFMimeEnrichedReader mismatchError:](self, "mismatchError:", a3);
  }
}

- (void)parseParameterString:(id)a3
{
  id **v4;
  id **v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id *v13;
  float v14;
  float v15;
  id v16;
  double v17;
  int v18;
  uint64_t v19;

  v4 = (id **)_peekCommandStackEntry((uint64_t)self);
  if (v4)
  {
    v5 = v4;
    if (((_BYTE)(*v4)[1] & 0x18) != 0 && !v4[1])
    {
      if (!objc_msgSend(**v4, "isEqualToString:", CFSTR("color")))
      {
        if (objc_msgSend(**v5, "isEqualToString:", CFSTR("fontfamily")))
        {
          v13 = (id *)(id)objc_msgSend(CFSTR("font-family: "), "stringByAppendingString:", a3);
        }
        else
        {
          if (!objc_msgSend(**v5, "isEqualToString:", CFSTR("x-fontsize")))
            return;
          objc_msgSend(a3, "floatValue");
          if (v14 >= 0.0)
            v15 = v14;
          else
            v15 = 0.0;
          v16 = objc_alloc(MEMORY[0x1E0CB37E8]);
          *(float *)&v17 = v15;
          v13 = (id *)objc_msgSend(v16, "initWithFloat:", v17);
        }
LABEL_22:
        v5[1] = v13;
        return;
      }
      objc_msgSend(a3, "rangeOfString:", CFSTR(","));
      if (v6)
      {
        v19 = 0;
        v18 = 0;
        v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a3);
        if (!objc_msgSend(v7, "scanHexInt:", (char *)&v19 + 4))
          goto LABEL_19;
        a3 = 0;
        if (objc_msgSend(v7, "scanString:intoString:", CFSTR(","), 0))
        {
          if (!objc_msgSend(v7, "scanHexInt:", &v19))
            goto LABEL_19;
          a3 = 0;
          if (objc_msgSend(v7, "scanString:intoString:", CFSTR(","), 0))
          {
            if (objc_msgSend(v7, "scanHexInt:", &v18))
            {
              LODWORD(v8) = HIDWORD(v19);
              *(double *)&v9 = (double)v8 * 0.0000152587891 * 255.0;
              v10 = (int)*(double *)&v9;
              LODWORD(v9) = v19;
              *(double *)&v11 = (double)v9 * 0.0000152587891 * 255.0;
              v12 = (int)*(double *)&v11;
              LODWORD(v11) = v18;
              a3 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rgba(%d, %d, %d, 1)"), v10, v12, (int)((double)v11 * 0.0000152587891 * 255.0));
              goto LABEL_20;
            }
LABEL_19:
            a3 = 0;
          }
        }
      }
LABEL_20:
      if (!a3)
        return;
      v13 = (id *)a3;
      goto LABEL_22;
    }
  }
}

- (id)currentFont
{
  id result;

  result = (id)_currentAttributeOfType((uint64_t)self, 1);
  if (!result)
    return CFSTR("font-face: Helvetica");
  return result;
}

- (void)appendNewLine:(id)a3
{
  CFStringAppendCString((CFMutableStringRef)a3, "\n", 0x8000100u);
}

- (int)readTokenInto:(id *)a3
{
  const __CFCharacterSet *v5;
  __CFString *Token;
  __CFString *v7;
  int64_t currentIndex;
  int v9;
  CFIndex v10;
  int64_t v11;
  unsigned __int16 *v12;
  unsigned __int16 v13;
  uint64_t v14;
  int64_t length;
  unsigned __int16 *directUniCharBuffer;
  unsigned __int16 v17;
  char *directCStringBuffer;
  int64_t bufferedRangeStart;
  int64_t v20;
  __CFString *v21;
  char *v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  int64_t inputLength;
  CFIndex v27;
  CFIndex v28;
  uint64_t v29;
  int64_t v30;
  unsigned __int16 *v31;
  unsigned __int16 v32;
  char *v33;
  int64_t v34;
  uint64_t v35;
  int64_t v36;
  int64_t v37;
  int64_t v38;
  CFRange v40;
  CFRange v41;
  CFRange v42;
  CFRange v43;
  CFRange v44;

  v5 = (const __CFCharacterSet *)objc_msgSend((id)objc_opt_class(), "punctuationSet");
  Token = (__CFString *)_copyNextToken((uint64_t)self, v5);
  if (Token)
  {
    v7 = Token;
    if (-[__CFString isEqualToString:](Token, "isEqualToString:", CFSTR("\n")))
    {
      currentIndex = self->_currentIndex;

      if ((*((_DWORD *)self + 52) & 0x3FFFFFFF) != 0)
      {
        v43.location = self->_currentIndex;
        v43.length = currentIndex - v43.location;
        v7 = (__CFString *)CFStringCreateWithSubstring(0, self->_inputBuffer.theString, v43);
      }
      else
      {
        v7 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
        if (currentIndex >= self->_inputLength || currentIndex < 0)
        {
LABEL_34:
          v21 = CFSTR(" ");

          v9 = 2;
          v7 = v21;
          goto LABEL_78;
        }
        v14 = 1;
        while (1)
        {
          length = self->_inputBuffer.rangeToBuffer.length;
          if (length <= currentIndex)
            break;
          directUniCharBuffer = self->_inputBuffer.directUniCharBuffer;
          if (directUniCharBuffer)
          {
            v17 = directUniCharBuffer[self->_inputBuffer.rangeToBuffer.location + currentIndex];
          }
          else
          {
            directCStringBuffer = self->_inputBuffer.directCStringBuffer;
            if (directCStringBuffer)
            {
              v17 = directCStringBuffer[self->_inputBuffer.rangeToBuffer.location + currentIndex];
            }
            else
            {
              if (self->_inputBuffer.bufferedRangeEnd <= currentIndex
                || (bufferedRangeStart = self->_inputBuffer.bufferedRangeStart, bufferedRangeStart > currentIndex))
              {
                v20 = currentIndex - 4;
                if ((unint64_t)currentIndex < 4)
                  v20 = 0;
                if (v20 + 64 < length)
                  length = v20 + 64;
                self->_inputBuffer.bufferedRangeStart = v20;
                self->_inputBuffer.bufferedRangeEnd = length;
                v40.location = self->_inputBuffer.rangeToBuffer.location + v20;
                v40.length = length - v20;
                CFStringGetCharacters(self->_inputBuffer.theString, v40, self->_inputBuffer.buffer);
                bufferedRangeStart = self->_inputBuffer.bufferedRangeStart;
              }
              v17 = self->_inputBuffer.buffer[currentIndex - bufferedRangeStart];
            }
          }
          if (v17 != 10)
            break;
          -[MFMimeEnrichedReader appendNewLine:](self, "appendNewLine:", v7);
          ++v14;
          if (++currentIndex >= self->_inputLength)
            goto LABEL_35;
        }
        if (v14 == 1)
          goto LABEL_34;
LABEL_35:
        self->_currentIndex = currentIndex;
      }
      v9 = 2;
LABEL_78:
      *a3 = v7;
      return v9;
    }
    if (!-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("<")))
    {
      v9 = 1;
      goto LABEL_78;
    }

    v10 = self->_currentIndex;
    if (v10 < self->_inputLength && (v10 & 0x8000000000000000) == 0)
    {
      v11 = self->_inputBuffer.rangeToBuffer.length;
      if (v11 > v10)
      {
        v12 = self->_inputBuffer.directUniCharBuffer;
        if (v12)
        {
          v13 = v12[self->_inputBuffer.rangeToBuffer.location + v10];
        }
        else
        {
          v22 = self->_inputBuffer.directCStringBuffer;
          if (v22)
          {
            v13 = v22[self->_inputBuffer.rangeToBuffer.location + v10];
          }
          else
          {
            if (self->_inputBuffer.bufferedRangeEnd <= v10 || (v23 = self->_inputBuffer.bufferedRangeStart, v23 > v10))
            {
              v24 = v10 - 4;
              if ((unint64_t)v10 < 4)
                v24 = 0;
              if (v24 + 64 < v11)
                v11 = v24 + 64;
              self->_inputBuffer.bufferedRangeStart = v24;
              self->_inputBuffer.bufferedRangeEnd = v11;
              v41.location = self->_inputBuffer.rangeToBuffer.location + v24;
              v41.length = v11 - v24;
              CFStringGetCharacters(self->_inputBuffer.theString, v41, self->_inputBuffer.buffer);
              v23 = self->_inputBuffer.bufferedRangeStart;
            }
            v13 = self->_inputBuffer.buffer[v10 - v23];
          }
        }
        if (v13 == 47)
        {
          v10 = self->_currentIndex + 1;
          self->_currentIndex = v10;
          v9 = 4;
LABEL_52:
          inputLength = self->_inputLength;
          if (v10 < inputLength)
          {
            v27 = -v10;
            v28 = v10 + 64;
            while (1)
            {
              if ((unint64_t)v10 >= 4)
                v29 = 4;
              else
                v29 = v10;
              if ((v10 & 0x8000000000000000) == 0)
              {
                v30 = self->_inputBuffer.rangeToBuffer.length;
                if (v30 > v10)
                {
                  v31 = self->_inputBuffer.directUniCharBuffer;
                  if (v31)
                  {
                    v32 = v31[v10 + self->_inputBuffer.rangeToBuffer.location];
                  }
                  else
                  {
                    v33 = self->_inputBuffer.directCStringBuffer;
                    if (v33)
                    {
                      v32 = v33[self->_inputBuffer.rangeToBuffer.location + v10];
                    }
                    else
                    {
                      if (self->_inputBuffer.bufferedRangeEnd <= v10
                        || (v34 = self->_inputBuffer.bufferedRangeStart, v34 > v10))
                      {
                        v35 = v29 + v27;
                        v36 = v28 - v29;
                        v37 = v10 - v29;
                        v38 = v37 + 64;
                        if (v37 + 64 >= v30)
                          v38 = self->_inputBuffer.rangeToBuffer.length;
                        self->_inputBuffer.bufferedRangeStart = v37;
                        self->_inputBuffer.bufferedRangeEnd = v38;
                        if (v30 >= v36)
                          v30 = v36;
                        v42.length = v30 + v35;
                        v42.location = v37 + self->_inputBuffer.rangeToBuffer.location;
                        CFStringGetCharacters(self->_inputBuffer.theString, v42, self->_inputBuffer.buffer);
                        v34 = self->_inputBuffer.bufferedRangeStart;
                      }
                      v32 = self->_inputBuffer.buffer[v10 - v34];
                    }
                  }
                  if (v32 == 62)
                  {
LABEL_74:
                    v25 = v10;
                    v10 = self->_currentIndex;
                    goto LABEL_76;
                  }
                  inputLength = self->_inputLength;
                }
              }
              ++v10;
              --v27;
              ++v28;
              if (v10 >= inputLength)
                goto LABEL_74;
            }
          }
          v25 = v10;
LABEL_76:
          v44.length = v25 - v10;
          v44.location = v10;
          v7 = (__CFString *)CFStringCreateWithSubstring(0, self->_inputBuffer.theString, v44);
          goto LABEL_77;
        }
        if (v13 == 60)
        {
          v25 = self->_currentIndex;
          v9 = 1;
          v7 = CFSTR("<");
LABEL_77:
          self->_currentIndex = v25 + 1;
          goto LABEL_78;
        }
        v10 = self->_currentIndex;
      }
    }
    v9 = 3;
    goto LABEL_52;
  }
  return 0;
}

- (void)convertRichTextString:(id)a3 intoOutputString:(id)a4
{
  id v5;
  int v6;
  int v7;
  id v8;

  v8 = 0;
  -[MFMimeEnrichedReader resetStateWithString:outputString:](self, "resetStateWithString:outputString:", a3, a4);
  v5 = 0;
  v6 = 0;
  while (1)
  {
    v7 = -[MFMimeEnrichedReader readTokenInto:](self, "readTokenInto:", &v8);
    if (v7 == 3)
    {
      -[MFMimeEnrichedReader beginCommand:](self, "beginCommand:", v8);
      goto LABEL_15;
    }
    if (v7 == 4)
    {
      -[MFMimeEnrichedReader endCommand:](self, "endCommand:", v8);
      goto LABEL_15;
    }
    if (!v7)
      break;
    if ((*((char *)self + 211) & 0x80000000) == 0)
    {
      if (objc_msgSend(v8, "isEqual:", CFSTR("\n")))
      {
        v6 |= objc_msgSend(v5, "isEqual:", CFSTR(" ")) ^ 1;
      }
      else
      {
        if ((v6 & 1) != 0
          && (objc_msgSend(v8, "isEqual:", CFSTR(" ")) & 1) == 0
          && (objc_msgSend(v5, "isEqual:", CFSTR(" ")) & 1) == 0)
        {
          -[MFMimeEnrichedReader appendStringToBuffer:](self, "appendStringToBuffer:", CFSTR(" "));
        }
        -[MFMimeEnrichedReader appendStringToBuffer:](self, "appendStringToBuffer:", v8);
        v6 = 0;
      }
    }
LABEL_15:

    v5 = v8;
  }

  -[MFMimeEnrichedReader nowWouldBeAGoodTimeToAppendToTheAttributedString](self, "nowWouldBeAGoodTimeToAppendToTheAttributedString");
  -[MFMimeEnrichedReader closeUpQuoting](self, "closeUpQuoting");
}

- (void)convertEnrichedString:(id)a3 intoOutputString:(id)a4
{
  double Current;
  char v8;
  int v9;
  NSObject *v10;
  CFAbsoluteTime v11;
  int64_t inputLength;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  CFAbsoluteTime v16;
  __int16 v17;
  int64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  v14 = 0;
  -[MFMimeEnrichedReader resetStateWithString:outputString:](self, "resetStateWithString:outputString:", a3, a4);
  v8 = 1;
  while (1)
  {
    v9 = -[MFMimeEnrichedReader readTokenInto:](self, "readTokenInto:", &v14);
    if (v9 == 3)
    {
      -[MFMimeEnrichedReader beginCommand:](self, "beginCommand:", v14);
      goto LABEL_12;
    }
    if (v9 == 4)
    {
      -[MFMimeEnrichedReader endCommand:](self, "endCommand:", v14);
      goto LABEL_12;
    }
    if (!v9)
      break;
    if ((*((char *)self + 211) & 0x80000000) == 0)
    {
      if (v9 != 2 || (v8 & 1) == 0 || (objc_msgSend(v14, "isEqual:", CFSTR(" ")) & 1) == 0)
        -[MFMimeEnrichedReader appendStringToBuffer:](self, "appendStringToBuffer:", v14);
      v8 = 0;
    }
LABEL_12:

  }
  -[MFMimeEnrichedReader nowWouldBeAGoodTimeToAppendToTheAttributedString](self, "nowWouldBeAGoodTimeToAppendToTheAttributedString");
  -[MFMimeEnrichedReader closeUpQuoting](self, "closeUpQuoting");
  v10 = MFLogGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = CFAbsoluteTimeGetCurrent() - Current;
    inputLength = self->_inputLength;
    v13 = objc_msgSend(self->_outputString, "length");
    *(_DWORD *)buf = 134218496;
    v16 = v11;
    v17 = 2048;
    v18 = inputLength;
    v19 = 2048;
    v20 = v13;
    _os_log_impl(&dword_1C8839000, v10, OS_LOG_TYPE_INFO, "elapsed time %gs (input length=%ld, output length=%lu)", buf, 0x20u);
  }
}

- (id)description
{
  void *v3;
  __CFArray *commandStack;
  CFIndex Count;
  CFIndex i;
  _QWORD *ValueAtIndex;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p"), objc_opt_class(), self);
  commandStack = self->_commandStack;
  if (commandStack)
  {
    Count = CFArrayGetCount(commandStack);
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\t_commandStack = %p (%ld entries):"), self->_commandStack, Count);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->_commandStack, i);
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\t[%@ parameter=%@]"), *(_QWORD *)*ValueAtIndex, ValueAtIndex[1]);
      }
    }
  }
  if (self->_outputBuffer)
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\t_outputBuffer=%@"), self->_outputBuffer);
  if (self->_outputString)
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\t_outputString=%@"), self->_outputString);
  objc_msgSend(v3, "appendString:", CFSTR(">\n-------------------------------------------------------------------\n"));
  return v3;
}

- (void)setupFontStackEntry:.cold.1()
{
  __assert_rtn("-[MFMimeEnrichedReader setupFontStackEntry:]", "MimeEnrichedReader.m", 505, "NULL != stackEntry");
}

@end
