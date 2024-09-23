@implementation MLITChapterTOC

- (MLITChapterTOC)initWithChapterDataRef:(ChapterData *)a3 totalTimeInMS:(unsigned int)a4
{
  uint64_t v8;
  MLITChapterTOC *v9;
  MLITChapterTOC *v10;
  void *v12;
  objc_super v13;

  v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MLITChapterTOC.m"), 44, CFSTR("MLITChapterTOC is an abstract class.  You must allocate a concrete subclass."));

  }
  v13.receiver = self;
  v13.super_class = (Class)MLITChapterTOC;
  v9 = -[MLITChapterTOC init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_totalTimeInMS = a4;
    if (a3)
      v9->_chapterDataRef = (ChapterData *)ChapterData_Retain();
  }
  return v10;
}

- (ChapterData)chapterDataRef
{
  return self->_chapterDataRef;
}

- (void)dealloc
{
  unsigned int *picCookieIndexMap;
  unsigned int *urlCookieIndexMap;
  unsigned int *nameCookieIndexMap;
  objc_super v6;

  if (self->_chapterDataRef)
    ChapterData_Release();
  picCookieIndexMap = self->_picCookieIndexMap;
  if (picCookieIndexMap)
    free(picCookieIndexMap);
  urlCookieIndexMap = self->_urlCookieIndexMap;
  if (urlCookieIndexMap)
    free(urlCookieIndexMap);
  nameCookieIndexMap = self->_nameCookieIndexMap;
  if (nameCookieIndexMap)
    free(nameCookieIndexMap);
  v6.receiver = self;
  v6.super_class = (Class)MLITChapterTOC;
  -[MLITChapterTOC dealloc](&v6, sel_dealloc);
}

- (unsigned)countOfChapters
{
  ChapterData *chapterDataRef;

  chapterDataRef = self->_chapterDataRef;
  if (chapterDataRef)
    LODWORD(chapterDataRef) = ChapterData_GetNumChapters();
  return chapterDataRef;
}

- (unsigned)_cachedCookieIndexMapForProperty:(int)a3 createIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  unsigned int **v7;
  unsigned int **v8;
  ChapterData *chapterDataRef;
  unsigned int *result;
  BOOL v11;
  int NumChapters;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  uint64_t IndChapterTime;
  int v19;
  int v20;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = (unsigned int **)objc_msgSend((id)objc_opt_class(), "_chapterDataCookieIndexMapForProperty:ofChapterTOC:", *(_QWORD *)&a3, self);
  v8 = v7;
  if (!v7 || (chapterDataRef = self->_chapterDataRef) == 0)
  {
LABEL_16:
    if (v8)
      return *v8;
    else
      return 0;
  }
  result = *v7;
  if (*v8)
    v11 = 1;
  else
    v11 = !v4;
  if (!v11)
  {
    NumChapters = ChapterData_GetNumChapters();
    v13 = -[MLITChapterTOC countOfGroupsForProperty:](self, "countOfGroupsForProperty:", v5);
    result = (unsigned int *)malloc_type_calloc((NumChapters + 1), 4uLL, 0x100004052888210uLL);
    *v8 = result;
    *result = v13;
    if (NumChapters)
    {
      v14 = 0;
      v15 = (int)v5 - 1;
      v16 = 1;
      v17 = 0x7FFFFFFF;
      do
      {
        ++v14;
        IndChapterTime = ChapterData_GetIndChapterTime();
        v20 = 0x7FFFFFFF;
        v19 = 0x7FFFFFFF;
        if (v15 <= 3)
        {
          if (((unsigned int (*)(ChapterData *, uint64_t, _QWORD, int *))off_1E5B63018[v15])(chapterDataRef, IndChapterTime, 0, &v20))
          {
            v19 = 0x7FFFFFFF;
          }
          else
          {
            v19 = v20;
          }
        }
        if (v19 != v17)
        {
          (*v8)[v16++] = v14;
          v17 = v19;
        }
      }
      while (NumChapters != v14);
      goto LABEL_16;
    }
  }
  return result;
}

- (unsigned)countOfGroupsForProperty:(int)a3
{
  unsigned int *v5;
  unsigned int result;
  ChapterData *chapterDataRef;
  uint64_t IndChapterTime;
  unsigned int v9;

  v5 = -[MLITChapterTOC _cachedCookieIndexMapForProperty:createIfNecessary:](self, "_cachedCookieIndexMapForProperty:createIfNecessary:", *(_QWORD *)&a3, 0);
  if (v5)
    return *v5;
  chapterDataRef = self->_chapterDataRef;
  if (!chapterDataRef)
    return 0;
  result = ChapterData_GetNumChapters();
  if (result)
  {
    IndChapterTime = ChapterData_GetIndChapterTime();
    v9 = 0x7FFFFFFF;
    if ((a3 - 1) > 3)
      return 0;
    if (((unsigned int (*)(ChapterData *, uint64_t, _QWORD, unsigned int *))off_1E5B63018[a3 - 1])(chapterDataRef, IndChapterTime, 0, &v9))
    {
      return 0;
    }
    result = v9;
    if (v9 == 0x7FFFFFFF)
      return 0;
  }
  return result;
}

- (unsigned)chapterIndexForGroupIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  unsigned int *v5;

  v5 = -[MLITChapterTOC _cachedCookieIndexMapForProperty:createIfNecessary:](self, "_cachedCookieIndexMapForProperty:createIfNecessary:", *(_QWORD *)&a4, 1);
  if (v5 && *v5 > a3)
    return v5[a3 + 1] - 1;
  return a3;
}

- (unsigned)groupIndexForChapterIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  ChapterData *chapterDataRef;
  unsigned int v5;
  uint64_t IndChapterTime;
  int v9;

  chapterDataRef = self->_chapterDataRef;
  v5 = 0x7FFFFFFF;
  if (chapterDataRef)
  {
    IndChapterTime = ChapterData_GetIndChapterTime();
    v9 = 0x7FFFFFFF;
    if ((a4 - 1) <= 3
      && !((unsigned int (*)(ChapterData *, uint64_t, _QWORD, int *))off_1E5B63018[a4 - 1])(chapterDataRef, IndChapterTime, 0, &v9)&& v9 != 0x7FFFFFFF)
    {
      return v9 - 1;
    }
  }
  return v5;
}

- (unsigned)totalTimeInMS
{
  return self->_totalTimeInMS;
}

- (unsigned)durationInMSOfGroupAtIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  uint64_t v4;
  uint64_t v7;
  unsigned int v8;
  unsigned int v10;

  v4 = *(_QWORD *)&a4;
  v7 = -[MLITChapterTOC chapterIndexForGroupIndex:groupingProperty:](self, "chapterIndexForGroupIndex:groupingProperty:");
  if (-[MLITChapterTOC countOfGroupsForProperty:](self, "countOfGroupsForProperty:", v4) - 1 == a3)
  {
    v8 = -[MLITChapterTOC totalTimeInMS](self, "totalTimeInMS");
    return v8 - -[MLITChapterTOC timeLocationInMSOfChapterAtIndex:](self, "timeLocationInMSOfChapterAtIndex:", v7);
  }
  else
  {
    v10 = -[MLITChapterTOC timeLocationInMSOfChapterAtIndex:](self, "timeLocationInMSOfChapterAtIndex:", -[MLITChapterTOC chapterIndexForGroupIndex:groupingProperty:](self, "chapterIndexForGroupIndex:groupingProperty:", a3 + 1, v4));
    return v10 + ~-[MLITChapterTOC timeLocationInMSOfChapterAtIndex:](self, "timeLocationInMSOfChapterAtIndex:", v7);
  }
}

- (unsigned)groupIndexAtTimeLocationInMS:(unsigned int)a3 groupingProperty:(int)a4
{
  return -[MLITChapterTOC groupIndexForChapterIndex:groupingProperty:](self, "groupIndexForChapterIndex:groupingProperty:", -[MLChapterTOC chapterIndexAtTimeLocationInMS:](self, "chapterIndexAtTimeLocationInMS:", *(_QWORD *)&a3), *(_QWORD *)&a4);
}

- (unsigned)timeLocationInMSOfGroupAtIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  return -[MLITChapterTOC timeLocationInMSOfChapterAtIndex:](self, "timeLocationInMSOfChapterAtIndex:", -[MLITChapterTOC chapterIndexForGroupIndex:groupingProperty:](self, "chapterIndexForGroupIndex:groupingProperty:", *(_QWORD *)&a3, *(_QWORD *)&a4));
}

- (unsigned)timeLocationInMSOfChapterAtIndex:(unsigned int)a3
{
  ChapterData *chapterDataRef;

  chapterDataRef = self->_chapterDataRef;
  if (chapterDataRef)
    LODWORD(chapterDataRef) = ChapterData_GetIndChapterTime();
  return chapterDataRef;
}

- (id)titlePropertyOfChapterAtIndex:(unsigned int)a3
{
  void *v3;
  _OWORD v5[32];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!self->_chapterDataRef
    || (ChapterData_GetFlags() & 1) == 0
    || ChapterData_GetIndChapterTime() == -1
    || (memset(v5, 0, sizeof(v5)), ChapterData_CopyProperty()))
  {
    v3 = 0;
  }
  else
  {
    NSStringCreateWithUStr255((unsigned __int16 *)v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)urlTitleTrimmingCharacterSet
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
}

- (id)urlTitlePropertyOfChapterAtIndex:(unsigned int)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _OWORD v9[32];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!self->_chapterDataRef || (ChapterData_GetFlags() & 4) == 0)
    return 0;
  if (ChapterData_GetIndChapterTime() == -1)
  {
    v5 = 0;
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    if (ChapterData_FindURLTitleForTime())
      return 0;
    NSStringCreateWithUStr255((unsigned __int16 *)v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[MLITChapterTOC urlTitleTrimmingCharacterSet](self, "urlTitleTrimmingCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)urlPropertyOfChapterAtIndex:(unsigned int)a3
{
  ChapterData *chapterDataRef;
  void *v4;
  _BYTE v6[2048];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  chapterDataRef = self->_chapterDataRef;
  if (chapterDataRef)
  {
    if ((ChapterData_GetFlags() & 4) != 0 && ChapterData_GetIndChapterTime() != -1)
    {
      bzero(v6, 0x800uLL);
      if (ChapterData_FindURLForTime())
        return 0;
      if (v6[1])
      {
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v6);
        if (v4)
          chapterDataRef = (ChapterData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);
        else
          chapterDataRef = 0;
        goto LABEL_10;
      }
    }
    chapterDataRef = 0;
  }
  v4 = 0;
LABEL_10:

  return chapterDataRef;
}

+ (unsigned)_chapterDataCookieIndexMapForProperty:(int)a3 ofChapterTOC:(id)a4
{
  char *v7;
  unsigned int **v8;
  void *v10;

  v7 = (char *)a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MLITChapterTOC.m"), 92, CFSTR("invalid parameter"));

  }
  if ((a3 - 1) > 3)
    v8 = 0;
  else
    v8 = (unsigned int **)&v7[**((int **)&off_1E5B62FF8 + (a3 - 1))];

  return v8;
}

+ (void)enumerateArtworkCacheIDsInFlattenedChapterData:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v8 = 0;
  objc_msgSend(v5, "length");
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "bytes");
  ChapterData_CreateWithFlattenedData();
  ChapterData_Release();

}

+ (void)enumerateChapterTimesInFlattenedChapterData:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  v5 = a3;
  v6 = a4;
  v8 = 0;
  objc_msgSend(v5, "length");
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v7, "bytes");
  ChapterData_CreateWithFlattenedData();
  ChapterData_Release();

}

@end
