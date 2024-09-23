@implementation CPListMaker

- (CPListMaker)initWithLayoutArea:(id)a3
{
  CPListMaker *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPListMaker;
  v4 = -[CPListMaker init](&v6, sel_init);
  if (v4)
  {
    v4->area = (CPLayoutArea *)a3;
    v4->spacers = (NSArray *)(id)objc_msgSend((id)objc_msgSend(a3, "ancestorOfClass:", objc_opt_class()), "spacers");
  }
  return v4;
}

- (void)dispose
{
  id *textLines;

  textLines = self->textLines;
  if (textLines)
  {
    free(textLines);
    self->textLines = 0;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPListMaker dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPListMaker;
  -[CPListMaker finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPListMaker dispose](self, "dispose");

  v3.receiver = self;
  v3.super_class = (Class)CPListMaker;
  -[CPListMaker dealloc](&v3, sel_dealloc);
}

- (void)fetchTextLine:(id)a3
{
  id *textLines;
  uint64_t textLineCount;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    textLines = self->textLines;
    textLineCount = self->textLineCount;
    self->textLineCount = textLineCount + 1;
    textLines[textLineCount] = a3;
  }
  else
  {
    objc_msgSend(a3, "map:target:", sel_fetchTextLine_, self);
  }
}

- (void)fetchTextLinesInColumn:(id)a3
{
  id *textLines;
  unsigned int v6;
  id *v7;

  textLines = self->textLines;
  if (textLines)
    free(textLines);
  self->textLineCount = 0;
  v6 = objc_msgSend(a3, "countOfFirstDescendantsOfClass:", objc_opt_class());
  if (v6)
  {
    v7 = (id *)malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
    self->textLines = v7;
    if (v7)
      objc_msgSend(a3, "map:target:", sel_fetchTextLine_, self);
  }
  else
  {
    self->textLines = 0;
  }
}

- (void)makeListItemFrom:(CPListInfo *)a3 stopAt:(unsigned int)a4
{
  uint64_t var0;
  id v8;
  void *v9;
  void *v10;
  CPList *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  CPParagraphListItem *v18;

  var0 = a3->var0;
  if (var0 < a4)
  {
    v8 = self->textLines[var0];
    v9 = (void *)objc_msgSend(v8, "parent");
    if (v9)
    {
      v10 = v9;
      if (v8 != (id)objc_msgSend(v9, "firstChild"))
        v10 = splitParagraphAtTextLine(v10, (uint64_t)v8, 0);
      v18 = objc_alloc_init(CPParagraphListItem);
      -[CPParagraphListItem setNumber:](v18, "setNumber:", a3->var7);
      if (!a3->var9)
      {

        v11 = objc_alloc_init(CPList);
        self->list = v11;
        -[CPList setSpacer:](v11, "setSpacer:", a3->var2.origin.x, a3->var2.origin.y, a3->var2.size.width, a3->var2.size.height);
        -[CPList setType:](self->list, "setType:", a3->var4);
        -[CPList setOrdinalPrefixLength:](self->list, "setOrdinalPrefixLength:", a3->var5);
        -[CPList setOrdinalSuffixLength:](self->list, "setOrdinalSuffixLength:", a3->var6);
      }
      if (!-[CPList containsParagraph:](self->list, "containsParagraph:", v10))
        -[CPParagraphListItem addParagraph:](v18, "addParagraph:", v10);
      v12 = a3->var0 + 1;
      if (v12 < a4)
      {
        v13 = ~a3->var0 + a4;
        v14 = v12;
        do
        {
          v8 = self->textLines[v14];
          v15 = objc_msgSend(v8, "parent");
          if ((void *)v15 != v10 && v15 != 0)
          {
            v17 = (void *)v15;
            if (!-[CPList containsParagraph:](self->list, "containsParagraph:", v15))
              -[CPParagraphListItem addParagraph:](v18, "addParagraph:", v17);
            v10 = v17;
          }
          ++v14;
          --v13;
        }
        while (v13);
      }
      if (-[CPParagraphListItem paragraphCount](v18, "paragraphCount"))
        -[CPList addItem:](self->list, "addItem:", v18);
      if (v8 != (id)objc_msgSend(v10, "lastChild"))
        splitParagraphAtTextLine(v10, (uint64_t)v8, 1u);

    }
  }
}

- (BOOL)makeListFrom:(CPListInfo *)a3
{
  _BOOL4 v5;
  unsigned int var0;
  unsigned int *v7;
  const __CFAllocator *v8;
  id v9;
  int v10;
  _BOOL4 v11;
  unsigned int *v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  CFMutableStringRef Mutable;
  __CFString *v18;
  uint64_t v19;
  unsigned int v20;
  CFIndex Length;
  CFRange v22;
  unsigned int var6;
  CFIndex v24;
  const __CFString *v25;
  int HasPrefix;
  double v27;
  double v28;
  double v29;
  double y;
  const __CFAllocator *v32;
  CPList *list;
  BOOL v34;
  const __CFString *v35;
  CFIndex v36;
  CFIndex v37;
  int CharacterAtIndex;
  unsigned int CharacterType;
  unsigned int v41;
  CFIndex v42;
  CFIndex v43;
  uint64_t v44;
  CFIndex v45;
  int v46;
  const __CFString *v47;
  int HasSuffix;
  CFIndex var5;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  int var4;
  BOOL v54;
  const __CFString *v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  const __CFAllocator *v63;
  unsigned int v64;
  unsigned int *v65;
  _BOOL4 v66;
  UniChar chars[2];
  int v68;
  CGRect v69;
  CFTypeRef v70;
  uint64_t v71;
  __int128 v72;
  CPListInfo *v73;
  unsigned int v74;
  unsigned int v75;
  CGRect v76;
  CFTypeRef cf;
  _QWORD v78[5];
  CFRange v79;
  CFRange v80;
  CFRange v81;
  CFRange v82;

  LOBYTE(v5) = 0;
  var0 = a3->var0;
  v74 = var0;
  v75 = 0;
  v76 = CGRectNull;
  cf = 0;
  memset(v78, 0, 24);
  *(_DWORD *)((char *)&v78[1] + 7) = 0;
  v78[3] = a3->var11;
  if (var0 >= self->textLineCount)
    goto LABEL_111;
  v5 = 0;
  v7 = (unsigned int *)&v78[1] + 1;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  do
  {
    v9 = self->textLines[var0];
    v10 = objc_msgSend(v9, "isListItem", v63);
    LOBYTE(v78[2]) = v10;
    if (!v10)
      goto LABEL_32;
    v75 = objc_msgSend(v9, "listSpacerIndex");
    v76 = CGRectNull;
    objc_msgSend(-[NSArray objectAtIndex:](self->spacers, "objectAtIndex:", v75), "getValue:", &v76);
    v11 = v76.origin.x != INFINITY;
    if (v76.origin.y == INFINITY)
      v11 = 0;
    LOBYTE(v78[2]) = v11;
    if (!v11)
      goto LABEL_32;
    v12 = (unsigned int *)objc_msgSend(v9, "firstWord", *(_OWORD *)&v76.origin);
    v13 = objc_msgSend(v9, "charSequence");
    v14 = !v12 || v13 == 0;
    v15 = !v14;
    LOBYTE(v78[2]) = v15;
    if (v14
      || (v16 = (void *)v13, Mutable = CFStringCreateMutable(v8, v12[1]), LOBYTE(v78[2]) = Mutable != 0, !Mutable))
    {
LABEL_32:
      if (!a3->var4)
        goto LABEL_78;
      objc_msgSend(v9, "bounds");
      if (v27 != INFINITY && v28 != INFINITY && a3->var2.origin.x <= v27)
      {
        y = a3->var2.origin.y;
        if (y <= v28 + v29 && y + a3->var2.size.height >= v28)
          goto LABEL_78;
      }
      goto LABEL_99;
    }
    v18 = Mutable;
    v19 = *v12;
    v20 = v12[1];
    if (v19 < v20 + v19)
    {
      do
      {
        chars[0] = 0;
        chars[0] = *(_WORD *)(objc_msgSend(v16, "charAtIndex:", v19) + 72);
        CFStringAppendCharacters(v18, chars, 1);
        v19 = (v19 + 1);
        --v20;
      }
      while (v20);
    }
    if (cf)
      CFRelease(cf);
    cf = v18;
    CFRetain(v18);
    CFRelease(v18);
    if (v75 == a3->var1)
    {
      if (a3->var8)
      {
        Length = CFStringGetLength((CFStringRef)cf);
        v22.length = a3->var5;
        var6 = a3->var6;
        v24 = var6 + LODWORD(v22.length);
        if (LODWORD(v22.length) && Length > v24)
        {
          v22.location = 0;
          v25 = CFStringCreateWithSubstring(v8, a3->var3, v22);
          HasPrefix = CFStringHasPrefix((CFStringRef)cf, v25);
          CFRelease(v25);
          if (!HasPrefix)
            goto LABEL_99;
          var6 = a3->var6;
        }
        else if (Length <= v24)
        {
          goto LABEL_99;
        }
        if (!var6
          || (v46 = CFStringGetLength(a3->var3),
              v79.length = a3->var6,
              v79.location = (v46 - LODWORD(v79.length)),
              v47 = CFStringCreateWithSubstring(v8, a3->var3, v79),
              HasSuffix = CFStringHasSuffix((CFStringRef)cf, v47),
              CFRelease(v47),
              HasSuffix))
        {
          var5 = a3->var5;
          if (*(_QWORD *)&a3->var5)
          {
            v80.length = CFStringGetLength(a3->var3) - (a3->var5 + (unint64_t)a3->var6);
            v80.location = var5;
            v50 = CFStringCreateWithSubstring(v8, a3->var3, v80);
            v81.length = CFStringGetLength((CFStringRef)cf) - (a3->var5 + (unint64_t)a3->var6);
            v81.location = var5;
            v51 = CFStringCreateWithSubstring(v8, (CFStringRef)cf, v81);
          }
          else
          {
            v50 = (const __CFString *)CFRetain(a3->var3);
            v51 = (const __CFString *)CFRetain(cf);
          }
          v52 = v51;
          var4 = a3->var4;
          if (!var4)
          {
            v54 = CFStringCompare(v50, v51, 0) == kCFCompareEqualTo;
LABEL_81:
            v57 = v54;
            goto LABEL_84;
          }
          if (CPOrdinalLexerTypedStringToInt(v51, var4, v7))
          {
            v54 = HIDWORD(v78[1]) == a3->var7 + 1;
            goto LABEL_81;
          }
          v58 = a3->var4;
          if (v58 == 4)
            v59 = 6;
          else
            v59 = 0;
          if (v58 == 3)
            v60 = 5;
          else
            v60 = v59;
          if (v60)
          {
            *(_DWORD *)chars = 0;
            v57 = 0;
            if (CPOrdinalLexerTypedStringToInt(v52, v60, v7))
            {
              if (CPOrdinalLexerTypedStringToInt(v50, v60, (unsigned int *)chars)
                && (v61 = *(_DWORD *)chars, HIDWORD(v78[1]) == *(_DWORD *)chars + 1))
              {
                a3->var4 = v60;
                a3->var7 = v61;
                v57 = 1;
              }
              else
              {
                v57 = 0;
              }
            }
LABEL_84:
            CFRelease(v52);
            CFRelease(v50);
            if (v57)
            {
              -[CPListMaker makeListItemFrom:stopAt:](self, "makeListItemFrom:stopAt:", a3, v74);
              v78[0] = *(_QWORD *)&a3->var4;
              LODWORD(v78[1]) = a3->var6;
              CPListInfoCopy((__int128 *)&v74, (uint64_t)a3);
              v5 = 1;
              a3->var9 = 1;
              goto LABEL_78;
            }
            goto LABEL_99;
          }
          CFRelease(v52);
          CFRelease(v50);
        }
LABEL_99:
        a3->var10 = 1;
        goto LABEL_100;
      }
    }
    else if (a3->var8)
    {
      if (v76.origin.x + v76.size.width > a3->var2.origin.x + a3->var2.size.width)
      {
        v32 = v8;
        list = self->list;
        self->list = 0;
        *(_DWORD *)chars = v74;
        v68 = 0;
        v69 = CGRectNull;
        v71 = 0;
        v72 = 0uLL;
        v70 = 0;
        v73 = a3;
        *(_DWORD *)((char *)&v72 + 7) = 0;
        v34 = -[CPListMaker makeListFrom:](self, "makeListFrom:", chars);

        self->list = list;
        if (!v34)
          a3->var10 = 1;
        v74 = *(_DWORD *)chars;
        if (v70)
          CFRelease(v70);
        v8 = v32;
        goto LABEL_78;
      }
      goto LABEL_99;
    }
    v65 = v7;
    v66 = v5;
    v35 = (const __CFString *)cf;
    v36 = CFStringGetLength((CFStringRef)cf);
    do
    {
      v37 = v36;
      if (v36-- < 1)
      {
        v78[0] = 0;
        v78[1] = 0;
        v5 = v66;
        v7 = v65;
        goto LABEL_77;
      }
      CharacterAtIndex = CFStringGetCharacterAtIndex(v35, v36);
      CharacterType = CPOrdinalLexerGetCharacterType(CharacterAtIndex);
    }
    while (!CharacterType);
    if (CharacterType == 2)
      v41 = 1;
    else
      v41 = CharacterType;
    if (!v36)
    {
LABEL_70:
      v45 = 0;
      v5 = v66;
      if (v41 == 1)
      {
LABEL_71:
        if (CharacterAtIndex == 48)
          v41 = 2;
        else
          v41 = 1;
      }
      goto LABEL_74;
    }
    v63 = v8;
    v42 = v37 - 2;
    v43 = v36;
    while (1)
    {
      v64 = v41;
      v44 = v41;
      v45 = v43;
      while (1)
      {
        v43 = v42;
        CharacterAtIndex = CFStringGetCharacterAtIndex(v35, v42);
        if ((CPOrdinalLexerTestCharacterType[v44]() & 1) == 0)
          break;
        v42 = v43 - 1;
        v45 = v43;
        if (!v43)
        {
          v8 = v63;
          v41 = v64;
          goto LABEL_70;
        }
      }
      v41 = v64;
      if (v64 != 4)
        break;
      v8 = v63;
      if ((CharacterAtIndex - 65) >= 0x1A)
      {
LABEL_107:
        v37 = v36 - v43;
        goto LABEL_110;
      }
      v41 = 6;
LABEL_59:
      v42 = v43 - 1;
      if (!v43)
      {
        v45 = 0;
        v37 = v36 - v42;
        v5 = v66;
        v8 = v63;
        goto LABEL_74;
      }
    }
    v8 = v63;
    if (v64 == 3)
    {
      if ((CharacterAtIndex - 97) > 0x19)
        goto LABEL_107;
      v41 = 5;
      goto LABEL_59;
    }
    v37 = v36 - v43;
    if (v64 == 1)
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(v35, v45);
      v5 = v66;
      goto LABEL_71;
    }
LABEL_110:
    v5 = v66;
LABEL_74:
    v78[0] = __PAIR64__(v45, v41);
    LODWORD(v78[1]) = CFStringGetLength((CFStringRef)cf) - (v45 + v37);
    if (*(_QWORD *)((char *)v78 + 4))
    {
      v82.location = v45;
      v82.length = v37;
      v55 = CFStringCreateWithSubstring(v8, (CFStringRef)cf, v82);
      v7 = v65;
      LODWORD(v78[0]) = CPOrdinalLexerStringToInt(v55, v65);
      CFRelease(v55);
    }
    else
    {
      v7 = v65;
      LODWORD(v78[0]) = CPOrdinalLexerStringToInt((const __CFString *)cf, v65);
    }
LABEL_77:
    CPListInfoCopy((__int128 *)&v74, (uint64_t)a3);
LABEL_78:
    if (!a3->var10)
    {
      v56 = v74;
      goto LABEL_104;
    }
LABEL_100:
    if (a3->var9)
    {
      -[CPListMaker makeListItemFrom:stopAt:](self, "makeListItemFrom:stopAt:", a3, v74);
      a3->var9 = 0;
    }
    if (a3->var11)
      break;
    a3->var4 = 0;
    v56 = (__PAIR64__(v74, a3->var0) - v74) >> 32;
    a3->var8 = 0;
    a3->var10 = 0;
LABEL_104:
    var0 = v56 + 1;
    v74 = var0;
  }
  while (var0 < self->textLineCount);
LABEL_111:
  if (a3->var9)
  {
    -[CPListMaker makeListItemFrom:stopAt:](self, "makeListItemFrom:stopAt:", a3, v74);
    a3->var9 = 0;
  }
  if (v5 && v74 > a3->var0)
    a3->var0 = v74 - 1;
  if (cf)
    CFRelease(cf);
  return v5;
}

- (void)makeListsInColumn:(id)a3
{
  uint64_t v4;
  CGRect v5;
  CFTypeRef cf_8;
  _BYTE v7[24];
  uint64_t v8;

  -[CPListMaker fetchTextLinesInColumn:](self, "fetchTextLinesInColumn:", a3);
  v4 = 0;
  v5 = CGRectNull;
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  cf_8 = 0;
  -[CPListMaker makeListFrom:](self, "makeListFrom:", &v4);
  if (cf_8)
    CFRelease(cf_8);
}

- (void)makeLists
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;

  if (self->spacers)
  {
    v3 = -[CPObject count](self->area, "count");
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      do
      {
        -[CPListMaker makeListsInColumn:](self, "makeListsInColumn:", -[CPObject childAtIndex:](self->area, "childAtIndex:", v5));
        v5 = (v5 + 1);
      }
      while (v4 != (_DWORD)v5);
    }
  }
}

+ (void)makeListsInLayoutArea:(id)a3
{
  CPListMaker *v3;

  v3 = -[CPListMaker initWithLayoutArea:]([CPListMaker alloc], "initWithLayoutArea:", a3);
  -[CPListMaker makeLists](v3, "makeLists");

}

+ (void)makeListsInChunk:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    +[CPListMaker makeListsInLayoutArea:](CPListMaker, "makeListsInLayoutArea:", a3);
  else
    objc_msgSend(a3, "map:target:", sel_makeListsInChunk_, objc_opt_class());
}

+ (void)makeListsInPage:(id)a3
{
  objc_msgSend(a3, "map:target:", sel_makeListsInChunk_, objc_opt_class());
}

@end
