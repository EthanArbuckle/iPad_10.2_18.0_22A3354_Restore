@implementation SGPlainTextContentCursor

- (SGPlainTextContentCursor)initWithMailMessage:(id)a3
{
  id v5;
  void *v6;
  SGPlainTextContentCursor *v7;
  SGPlainTextContentCursor *v8;
  uint64_t v9;
  NSIndexSet *quoted;
  const __CFString *v11;
  CFIndex Length;
  const __CFString *str;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  void *v17;
  void *v18;
  objc_super v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPlainTextContentCursor.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  }
  objc_msgSend(v5, "textContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPlainTextContentCursor.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message.textContent"));

  }
  v19.receiver = self;
  v19.super_class = (Class)SGPlainTextContentCursor;
  v7 = -[SGPlainTextContentCursor init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_pos = 0;
    objc_msgSend(v5, "quotedRegions");
    v9 = objc_claimAutoreleasedReturnValue();
    quoted = v8->_quoted;
    v8->_quoted = (NSIndexSet *)v9;

    objc_msgSend(v5, "textContent");
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v8->_str = (__CFString *)v11;
    Length = CFStringGetLength(v11);
    v8->_len = Length;
    str = v8->_str;
    v8->_ib.theString = (__CFString *)str;
    v8->_ib.rangeToBuffer.location = 0;
    v8->_ib.rangeToBuffer.length = Length;
    CharactersPtr = CFStringGetCharactersPtr(str);
    CStringPtr = 0;
    v8->_ib.directUniCharBuffer = (unsigned __int16 *)CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(str, 0x600u);
    v8->_ib.directCStringBuffer = (char *)CStringPtr;
    v8->_ib.bufferedRangeStart = 0;
    v8->_ib.bufferedRangeEnd = 0;
  }

  return v8;
}

- (void)dealloc
{
  __CFString *str;
  objc_super v4;

  str = self->_str;
  if (str)
    CFRelease(str);
  v4.receiver = self;
  v4.super_class = (Class)SGPlainTextContentCursor;
  -[SGPlainTextContentCursor dealloc](&v4, sel_dealloc);
}

- (BOOL)forward
{
  unint64_t pos;
  unint64_t len;

  pos = self->_pos;
  len = self->_len;
  if (pos < len)
    self->_pos = pos + 1;
  return pos < len;
}

- (BOOL)backward
{
  unint64_t pos;

  pos = self->_pos;
  if (pos)
    self->_pos = pos - 1;
  return pos != 0;
}

- (void)forwardWhile:(id)a3
{
  int64_t i;
  NSIndexSet *quoted;
  id v7;
  NSIndexSet *v8;
  int64_t length;
  unsigned __int16 *directUniCharBuffer;
  unsigned __int16 v11;
  int v12;
  char *directCStringBuffer;
  int64_t bufferedRangeStart;
  int64_t v15;
  void *v16;
  id v17;
  CFRange v18;

  v17 = a3;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPlainTextContentCursor.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

  }
  for (i = self->_pos; i < self->_len; self->_pos = i)
  {
    quoted = self->_quoted;
    v7 = v17;
    v8 = quoted;
    if (i < 0 || (length = self->_ib.rangeToBuffer.length, length <= i))
    {
      v11 = 0;
    }
    else
    {
      directUniCharBuffer = self->_ib.directUniCharBuffer;
      if (directUniCharBuffer)
      {
        v11 = directUniCharBuffer[self->_ib.rangeToBuffer.location + i];
      }
      else
      {
        directCStringBuffer = self->_ib.directCStringBuffer;
        if (directCStringBuffer)
        {
          v11 = directCStringBuffer[self->_ib.rangeToBuffer.location + i];
        }
        else
        {
          if (self->_ib.bufferedRangeEnd <= i
            || (bufferedRangeStart = self->_ib.bufferedRangeStart, bufferedRangeStart > i))
          {
            v15 = i - 4;
            if ((unint64_t)i < 4)
              v15 = 0;
            if (v15 + 64 < length)
              length = v15 + 64;
            self->_ib.bufferedRangeStart = v15;
            self->_ib.bufferedRangeEnd = length;
            v18.location = self->_ib.rangeToBuffer.location + v15;
            v18.length = length - v15;
            CFStringGetCharacters(self->_ib.theString, v18, self->_ib.buffer);
            bufferedRangeStart = self->_ib.bufferedRangeStart;
          }
          v11 = self->_ib.buffer[i - bufferedRangeStart];
        }
      }
    }
    v12 = (*((uint64_t (**)(id, _QWORD, BOOL))v17 + 2))(v7, v11, -[NSIndexSet containsIndex:](v8, "containsIndex:", i));

    if (!v12)
      break;
    i = self->_pos + 1;
  }

}

- (void)backwardWhile:(id)a3
{
  int64_t pos;
  NSIndexSet *quoted;
  id v7;
  NSIndexSet *v8;
  int64_t length;
  unsigned __int16 *directUniCharBuffer;
  unsigned __int16 v11;
  int v12;
  unint64_t v13;
  char *directCStringBuffer;
  int64_t bufferedRangeStart;
  int64_t v16;
  void *v17;
  id v18;
  CFRange v19;

  v18 = a3;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPlainTextContentCursor.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

  }
  pos = self->_pos;
  if (pos)
  {
    do
    {
      quoted = self->_quoted;
      v7 = v18;
      v8 = quoted;
      if (pos < 0 || (length = self->_ib.rangeToBuffer.length, length <= pos))
      {
        v11 = 0;
      }
      else
      {
        directUniCharBuffer = self->_ib.directUniCharBuffer;
        if (directUniCharBuffer)
        {
          v11 = directUniCharBuffer[self->_ib.rangeToBuffer.location + pos];
        }
        else
        {
          directCStringBuffer = self->_ib.directCStringBuffer;
          if (directCStringBuffer)
          {
            v11 = directCStringBuffer[self->_ib.rangeToBuffer.location + pos];
          }
          else
          {
            if (self->_ib.bufferedRangeEnd <= pos
              || (bufferedRangeStart = self->_ib.bufferedRangeStart, bufferedRangeStart > pos))
            {
              v16 = pos - 4;
              if ((unint64_t)pos < 4)
                v16 = 0;
              if (v16 + 64 < length)
                length = v16 + 64;
              self->_ib.bufferedRangeStart = v16;
              self->_ib.bufferedRangeEnd = length;
              v19.location = self->_ib.rangeToBuffer.location + v16;
              v19.length = length - v16;
              CFStringGetCharacters(self->_ib.theString, v19, self->_ib.buffer);
              bufferedRangeStart = self->_ib.bufferedRangeStart;
            }
            v11 = self->_ib.buffer[pos - bufferedRangeStart];
          }
        }
      }
      v12 = (*((uint64_t (**)(id, _QWORD, BOOL))v18 + 2))(v7, v11, -[NSIndexSet containsIndex:](v8, "containsIndex:", pos));

      if (!v12)
        break;
      v13 = self->_pos;
      pos = v13 - 1;
      self->_pos = v13 - 1;
    }
    while (v13 != 1);
  }

}

- (BOOL)forwardToString:(id)a3 consume:(BOOL)a4
{
  _BOOL4 v4;
  int v7;
  BOOL result;
  CFIndex length;
  CFRange v10;
  CFRange v11;

  if (!a3)
    return 0;
  v4 = a4;
  v10.location = 0;
  v10.length = 0;
  v11.length = self->_len - self->_pos;
  v11.location = self->_pos;
  v7 = CFStringFindWithOptions(self->_str, (CFStringRef)a3, v11, 0, &v10);
  result = v7 != 0;
  if (v7)
  {
    length = v10.length;
    if (!v4)
      length = 0;
    self->_pos = length + v10.location;
  }
  return result;
}

- (BOOL)backwardToString:(id)a3 consume:(BOOL)a4
{
  _BOOL4 v4;
  int v7;
  BOOL result;
  CFIndex length;
  CFRange v10;
  CFRange v11;

  if (!a3)
    return 0;
  v4 = a4;
  v10.location = 0;
  v10.length = 0;
  v11.length = self->_pos;
  v11.location = 0;
  v7 = CFStringFindWithOptions(self->_str, (CFStringRef)a3, v11, 4uLL, &v10);
  result = v7 != 0;
  if (v7)
  {
    length = v10.length;
    if (v4)
      length = 0;
    self->_pos = length + v10.location;
  }
  return result;
}

- (void)seekToStart
{
  self->_pos = 0;
}

- (void)seekToEnd
{
  unint64_t len;
  BOOL v3;
  unint64_t v4;

  len = self->_len;
  v3 = len != 0;
  v4 = len - 1;
  if (!v3)
    v4 = 0;
  self->_pos = v4;
}

- (unint64_t)pos
{
  return self->_pos;
}

- (void)setPos:(unint64_t)a3
{
  self->_pos = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quoted, 0);
}

@end
