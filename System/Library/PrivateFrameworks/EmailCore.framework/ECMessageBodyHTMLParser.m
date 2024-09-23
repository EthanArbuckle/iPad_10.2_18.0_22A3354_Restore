@implementation ECMessageBodyHTMLParser

- (ECMessageBodyHTMLParser)initWithHTML:(id)a3
{
  ECMessageBodyHTMLParser *v4;
  NSScanner *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ECMessageBodyHTMLParser;
  v4 = -[ECMessageBodyParser init](&v7, sel_init);
  if (v4)
  {
    v5 = (NSScanner *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", a3);
    v4->_scanner = v5;
    -[NSScanner setCharactersToBeSkipped:](v5, "setCharactersToBeSkipped:", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ECMessageBodyHTMLParser;
  -[ECMessageBodyParser dealloc](&v3, sel_dealloc);
}

- (unint64_t)messageBodyStringAccumulatorDefaultOptions
{
  return 2;
}

- (Class)messageBodyElementClass
{
  return (Class)objc_opt_class();
}

- (void)_consumeNodesFromNode:(id)a3 upToNode:(id)a4
{
  void *v7;
  uint64_t v8;
  void *v9;

  while (a3 != a4)
  {
    v7 = (void *)MEMORY[0x1BCCC9614](self, a2);
    if (objc_msgSend(a3, "endLocation") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = objc_msgSend(a3, "firstChild");
    }
    else
    {
      -[ECMessageBodyParser enqueueParagraphNode:withTagName:](self, "enqueueParagraphNode:withTagName:", a3, objc_msgSend(a3, "tagName"));
      v9 = (void *)objc_msgSend(a3, "nextSibling");
      if (v9)
        goto LABEL_6;
      while (1)
      {
        v8 = objc_msgSend(a3, "nextSibling");
        if (v8)
          break;
        a3 = (id)objc_msgSend(a3, "parentNode");
        if (!a3)
        {
          objc_autoreleasePoolPop(v7);
          goto LABEL_12;
        }
      }
    }
    v9 = (void *)v8;
LABEL_6:
    objc_autoreleasePoolPop(v7);
    a3 = v9;
    if (!v9)
      break;
  }
LABEL_12:
  -[ECMessageBodyParser flushParagraphNodes](self, "flushParagraphNodes");
}

- (BOOL)_isMilestoneTagName:(id)a3
{
  if (!a3)
    return 0;
  if ((objc_msgSend(a3, "hasPrefix:", CFSTR("!")) & 1) != 0)
    return 1;
  return objc_msgSend(a3, "caseInsensitiveCompare:", CFSTR("br")) == 0;
}

- (void)_findBody
{
  if (!_findBody_regex)
    _findBody_regex = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("<(body|BODY)(\\s|>)"), 0, 0);
  -[NSScanner ec_scanUpToRegularExpression:](self->_scanner, "ec_scanUpToRegularExpression:");
}

- (BOOL)parse
{
  _ECParsedHTMLNode *v3;
  _ECParsedHTMLText *v4;
  unint64_t v5;
  void *v6;
  const __CFString *v7;
  NSUInteger v8;
  _BOOL4 v9;
  BOOL v10;
  unint64_t v11;
  const __CFString *v12;
  _ECParsedHTMLText *v13;
  void *v14;
  void *v15;
  void *v16;
  NSUInteger v17;
  _BOOL4 v18;
  NSScanner *scanner;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  BOOL v24;
  _BOOL4 v25;
  NSUInteger v26;
  NSUInteger v27;
  uint64_t v28;
  __int128 v29;
  const __CFString *v30;
  const char *CStringPtr;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  UniChar v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  UniChar v39;
  BOOL v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  CFRange v48;
  uint64_t v49;
  NSUInteger v50;
  uint64_t v51;
  _BOOL4 v52;
  id v53;
  _ECParsedHTMLTag *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  id v58;
  void *v60;
  uint64_t v61;
  _ECParsedHTMLText *v62;
  NSUInteger v63;
  _BOOL4 v64;
  NSUInteger v65;
  void *v66;
  unint64_t v67;
  _ECParsedHTMLNode *v68;
  UniChar buffer[8];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  CFStringRef theString[2];
  __int128 v78;
  __int128 v79;
  int64_t v80;
  uint64_t v81;

  if (parse_onceToken != -1)
    dispatch_once(&parse_onceToken, &__block_literal_global_12);
  -[ECMessageBodyHTMLParser _findBody](self, "_findBody");
  v3 = objc_alloc_init(_ECParsedHTMLNode);
  v4 = v3;
  v5 = 0x1E0C99000uLL;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v3, 0);
  v67 = objc_msgSend(v6, "count");
  -[ECMessageBodyParser willBeginParsing](self, "willBeginParsing");
  if (-[NSScanner isAtEnd](self->_scanner, "isAtEnd"))
    goto LABEL_91;
  v7 = CFSTR("<");
  v68 = v3;
  do
  {
    if (!-[ECMessageBodyParser shouldProceedParsing](self, "shouldProceedParsing"))
      break;
    v8 = -[NSScanner scanLocation](self->_scanner, "scanLocation");
    v9 = -[NSScanner scanUpToString:intoString:](self->_scanner, "scanUpToString:intoString:", v7, 0);
    v10 = v9;
    if (v9)
    {
      v11 = v5;
      v12 = v7;
      v13 = objc_alloc_init(_ECParsedHTMLText);
      -[_ECParsedHTMLNode setHtmlString:](v13, "setHtmlString:", -[NSScanner string](self->_scanner, "string"));
      -[_ECParsedHTMLNode setStartLocation:](v13, "setStartLocation:", v8);
      -[_ECParsedHTMLNode setEndLocation:](v13, "setEndLocation:", -[NSScanner scanLocation](self->_scanner, "scanLocation"));
      v14 = v6;
      v15 = (void *)objc_msgSend(v6, "lastObject");
      v16 = (void *)objc_msgSend(v15, "lastChild");
      objc_msgSend(v15, "appendChild:", v13);
      if (-[ECMessageBodyParser isLandmarkTagName:](self, "isLandmarkTagName:", objc_msgSend(v16, "tagName")))
      {
        -[ECMessageBodyHTMLParser _consumeNodesFromNode:upToNode:](self, "_consumeNodesFromNode:upToNode:", v4, v13);

        v4 = v13;
      }

      v7 = v12;
      v5 = v11;
      v3 = v68;
      v6 = v14;
    }
    v17 = -[NSScanner scanLocation](self->_scanner, "scanLocation");
    if (!-[NSScanner scanString:intoString:](self->_scanner, "scanString:intoString:", v7, 0))
    {
      if (v10)
        continue;
      v60 = (void *)MEMORY[0x1E0CB35C8];
      v61 = 3;
      goto LABEL_90;
    }
    v18 = -[NSScanner scanString:intoString:](self->_scanner, "scanString:intoString:", CFSTR("!--"), 0);
    scanner = self->_scanner;
    if (v18)
    {
      -[NSScanner scanUpToString:intoString:](scanner, "scanUpToString:intoString:", CFSTR("-->"), 0);
      if (-[NSScanner scanString:intoString:](self->_scanner, "scanString:intoString:", CFSTR("-->"), 0))
        continue;
      v60 = (void *)MEMORY[0x1E0CB35C8];
      v61 = 2;
      goto LABEL_90;
    }
    v20 = -[NSScanner scanString:intoString:](scanner, "scanString:intoString:", CFSTR("/"), 0);
    v81 = 0;
    if (!-[NSScanner scanUpToCharactersFromSet:intoString:](self->_scanner, "scanUpToCharactersFromSet:intoString:", parse_tagNameEndCharacterSet, &v81))
    {
      v61 = 0;
      v57 = 0x1E0CB3000;
      goto LABEL_89;
    }
    v64 = v20;
    v65 = v17;
    v66 = v6;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (-[NSScanner isAtEnd](self->_scanner, "isAtEnd"))
      {
LABEL_87:
        v6 = v66;
        v57 = 0x1E0CB3000;
        v61 = 1;
LABEL_89:
        v60 = *(void **)(v57 + 1480);
LABEL_90:
        -[ECMessageBodyHTMLParser didFindError:](self, "didFindError:", objc_msgSend(v60, "errorWithDomain:code:userInfo:", CFSTR("ECMessageBodyHTMLParserErrorDomain"), v61, 0));
        goto LABEL_91;
      }
      while (1)
      {
        v22 = (void *)MEMORY[0x1BCCC9614]();
        v23 = -[NSScanner scanUpToCharactersFromSet:intoString:](self->_scanner, "scanUpToCharactersFromSet:intoString:", parse_tagEndCharacterSet, 0);
        v24 = -[NSScanner scanCharactersFromSet:intoString:](self->_scanner, "scanCharactersFromSet:intoString:", parse_singularMilestoneCharacterSet, 0);
        v25 = -[NSScanner scanCharactersFromSet:intoString:](self->_scanner, "scanCharactersFromSet:intoString:", parse_singularTagEndCharacterSet, 0);
        if (!v23 && !v24 && !v25)
        {
          v57 = 0x1E0CB3000uLL;
          -[ECMessageBodyHTMLParser didFindError:](self, "didFindError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECMessageBodyHTMLParserErrorDomain"), 3, 0));
          objc_autoreleasePoolPop(v22);
          v61 = 1;
          v6 = v66;
          goto LABEL_89;
        }
        if (v25)
          break;
        objc_autoreleasePoolPop(v22);
        if (-[NSScanner isAtEnd](self->_scanner, "isAtEnd"))
          goto LABEL_87;
      }
      v26 = -[NSScanner scanLocation](self->_scanner, "scanLocation");
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_29;
      if (v26 - v21 >= 0x401)
      {
        -[NSScanner setScanLocation:](self->_scanner, "setScanLocation:", v21);
LABEL_65:
        objc_autoreleasePoolPop(v22);
        break;
      }
      v26 = v21;
LABEL_29:
      v63 = v26;
      v27 = -[NSScanner scanLocation](self->_scanner, "scanLocation");
      v80 = 0xAAAAAAAAAAAAAAAALL;
      v28 = v27 - v65;
      *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v78 = v29;
      v79 = v29;
      v76 = v29;
      *(_OWORD *)theString = v29;
      v74 = v29;
      v75 = v29;
      v72 = v29;
      v73 = v29;
      v70 = v29;
      v71 = v29;
      *(_OWORD *)buffer = v29;
      v30 = -[NSScanner string](self->_scanner, "string");
      theString[0] = v30;
      *((_QWORD *)&v78 + 1) = v65;
      *(_QWORD *)&v79 = v28;
      theString[1] = (CFStringRef)CFStringGetCharactersPtr(v30);
      if (theString[1])
        CStringPtr = 0;
      else
        CStringPtr = CFStringGetCStringPtr(v30, 0x600u);
      *(_QWORD *)&v78 = CStringPtr;
      *((_QWORD *)&v79 + 1) = 0;
      v80 = 0;
      if (v28 < 1)
        goto LABEL_65;
      v62 = v4;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 64;
      do
      {
        if ((unint64_t)v34 >= 4)
          v38 = 4;
        else
          v38 = v34;
        if ((uint64_t)v79 <= v34)
        {
          v39 = 0;
        }
        else if (theString[1])
        {
          v39 = *((_WORD *)&theString[1]->isa + v34 + *((_QWORD *)&v78 + 1));
        }
        else if ((_QWORD)v78)
        {
          v39 = *(char *)(v78 + *((_QWORD *)&v78 + 1) + v34);
        }
        else
        {
          if (v80 <= v34 || v33 > v34)
          {
            v43 = -v38;
            v44 = v38 + v32;
            v45 = v37 - v38;
            v46 = v34 + v43;
            v47 = v46 + 64;
            if (v46 + 64 >= (uint64_t)v79)
              v47 = v79;
            *((_QWORD *)&v79 + 1) = v46;
            v80 = v47;
            v48.location = v46 + *((_QWORD *)&v78 + 1);
            if ((uint64_t)v79 >= v45)
              v49 = v45;
            else
              v49 = v79;
            v48.length = v49 + v44;
            CFStringGetCharacters(theString[0], v48, buffer);
            v33 = *((_QWORD *)&v79 + 1);
          }
          v39 = buffer[v34 - v33];
        }
        v41 = v35 != 92 && v39 == 34;
        v36 ^= v41;
        ++v34;
        --v32;
        ++v37;
        v35 = v39;
      }
      while (v28 != v34);
      objc_autoreleasePoolPop(v22);
      v4 = v62;
      v21 = v63;
      v3 = v68;
      v5 = 0x1E0C99000;
    }
    while ((v36 & 1) != 0);
    v50 = -[NSScanner scanLocation](self->_scanner, "scanLocation");
    v51 = v81;
    if (v24)
    {
      v52 = 1;
    }
    else
    {
      v52 = -[ECMessageBodyHTMLParser _isMilestoneTagName:](self, "_isMilestoneTagName:", v81);
      v51 = v81;
    }
    v6 = v66;
    if (-[ECMessageBodyParser shouldIgnoreTagWithTagName:](self, "shouldIgnoreTagWithTagName:", v51))
    {
      v53 = objc_alloc(MEMORY[0x1E0CB3940]);
      v54 = (_ECParsedHTMLTag *)objc_msgSend(v53, "initWithFormat:", CFSTR("</%@"), v81);
      -[NSScanner scanUpToString:intoString:](self->_scanner, "scanUpToString:intoString:", v54, 0);
      if (!-[NSScanner scanString:intoString:](self->_scanner, "scanString:intoString:", v54, 0)
        || !-[NSScanner scanString:intoString:](self->_scanner, "scanString:intoString:", CFSTR(">"), 0))
      {
        -[ECMessageBodyHTMLParser didFindError:](self, "didFindError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECMessageBodyHTMLParserErrorDomain"), 1, 0));
      }
      v7 = CFSTR("<");
LABEL_74:

      continue;
    }
    if (!v64)
    {
      v54 = objc_alloc_init(_ECParsedHTMLTag);
      -[_ECParsedHTMLTag setTagName:](v54, "setTagName:", v81);
      -[_ECParsedHTMLNode setHtmlString:](v54, "setHtmlString:", -[NSScanner string](self->_scanner, "string"));
      -[_ECParsedHTMLNode setStartLocation:](v54, "setStartLocation:", v65);
      objc_msgSend((id)objc_msgSend(v66, "lastObject"), "appendChild:", v54);
      if (v52)
      {
        -[_ECParsedHTMLNode setEndLocation:](v54, "setEndLocation:", v50);
      }
      else
      {
        if ((unint64_t)objc_msgSend(v66, "count") >= 0x201)
          -[ECMessageBodyHTMLParser didFindError:](self, "didFindError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECMessageBodyHTMLParserErrorDomain"), 4, 0));
        objc_msgSend(v66, "addObject:", v54);
      }
      v7 = CFSTR("<");
      if (-[ECMessageBodyParser isLandmarkTagName:](self, "isLandmarkTagName:", v81))
      {
        -[ECMessageBodyHTMLParser _consumeNodesFromNode:upToNode:](self, "_consumeNodesFromNode:upToNode:", v4, v54);

        v4 = v54;
      }
      goto LABEL_74;
    }
    do
    {
      if (objc_msgSend(v66, "count") <= v67)
        break;
      v55 = (void *)objc_msgSend(v66, "lastObject");
      objc_msgSend(v55, "setEndLocation:", v50);
      v56 = (void *)objc_msgSend(v55, "tagName");
      LODWORD(v55) = objc_msgSend(v56, "isEqualToString:", v81);
      objc_msgSend(v66, "removeLastObject");
    }
    while (!(_DWORD)v55);
    if (objc_msgSend(v66, "count") < v67)
      break;
    v7 = CFSTR("<");
  }
  while (!-[NSScanner isAtEnd](self->_scanner, "isAtEnd"));
LABEL_91:

  if (-[ECMessageBodyParser shouldProceedParsing](self, "shouldProceedParsing"))
  {
    -[ECMessageBodyHTMLParser _consumeNodesFromNode:upToNode:](self, "_consumeNodesFromNode:upToNode:", v4, 0);
    -[ECMessageBodyParser didFinishParsing](self, "didFinishParsing");
  }
  v58 = objc_alloc_init(*(Class *)(v5 + 3560));
  -[_ECParsedHTMLNode collectDescendanceIntoArray:](v3, "collectDescendanceIntoArray:", v58);
  -[_ECParsedHTMLNode collectDescendanceIntoArray:](v4, "collectDescendanceIntoArray:", v58);

  return self->super._parserError == 0;
}

uint64_t __32__ECMessageBodyHTMLParser_parse__block_invoke()
{
  uint64_t result;

  parse_tagNameEndCharacterSet = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("> /")), "copy");
  parse_tagEndCharacterSet = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(">/")), "copy");
  parse_singularMilestoneCharacterSet = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/")), "copy");
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(">")), "copy");
  parse_singularTagEndCharacterSet = result;
  return result;
}

- (void)didFindError:(id)a3
{
  NSObject *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ECMessageBodyHTMLParser;
  -[ECMessageBodyParser didFindError:](&v5, sel_didFindError_, a3);
  v4 = _ef_log_ECMessageBodyParser();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[ECMessageBodyHTMLParser didFindError:].cold.1((uint64_t)self, v4);
}

- (void)didFindError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 104), "scanLocation");
  v5 = objc_msgSend(*(id *)(a1 + 104), "string");
  v6 = 134218242;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1B9ADE000, a2, OS_LOG_TYPE_ERROR, "Scanner info: %lu %@", (uint8_t *)&v6, 0x16u);
}

@end
