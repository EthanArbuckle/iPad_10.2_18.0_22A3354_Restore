@implementation MLChapterTOC

- (ChapterData)chapterDataRef
{
  return 0;
}

- (unsigned)countOfChapters
{
  return 0;
}

- (BOOL)hasDataForProperty:(int)a3
{
  return -[MLChapterTOC countOfGroupsForProperty:](self, "countOfGroupsForProperty:", *(_QWORD *)&a3) != 0;
}

- (unsigned)countOfGroupsForProperty:(int)a3
{
  return 0;
}

- (unsigned)chapterIndexForGroupIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  return 0;
}

- (unsigned)groupIndexForChapterIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  return 0;
}

- (unsigned)durationInMSOfGroupAtIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  return 0;
}

- (unsigned)groupIndexAtTimeLocationInMS:(unsigned int)a3 groupingProperty:(int)a4
{
  return 0;
}

- (unsigned)timeLocationInMSOfGroupAtIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  return 0;
}

- (unsigned)chapterIndexAtTimeLocationInMS:(unsigned int)a3
{
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;

  v5 = -[MLChapterTOC countOfChapters](self, "countOfChapters");
  if (v5)
  {
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = -[MLChapterTOC timeLocationInMSOfChapterAtIndex:](self, "timeLocationInMSOfChapterAtIndex:", v6);
      if (v7 <= a3 && v8 > a3)
        break;
      v6 = (v6 + 1);
      v7 = v8;
      if (v5 == (_DWORD)v6)
        goto LABEL_6;
    }
    if ((_DWORD)v6)
      return v6 - 1;
    else
      return 0;
  }
  else
  {
LABEL_6:
    if (a3 != 0 && v5 != 0)
      return v5 - 1;
    else
      return 0x7FFFFFFF;
  }
}

- (unsigned)timeLocationInMSOfChapterAtIndex:(unsigned int)a3
{
  return 0;
}

- (id)titlePropertyOfChapterAtIndex:(unsigned int)a3
{
  return 0;
}

- (id)urlTitlePropertyOfChapterAtIndex:(unsigned int)a3
{
  return 0;
}

- (id)urlPropertyOfChapterAtIndex:(unsigned int)a3
{
  return 0;
}

@end
