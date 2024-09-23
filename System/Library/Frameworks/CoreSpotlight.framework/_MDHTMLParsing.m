@implementation _MDHTMLParsing

+ (void)initialize
{
  CFAllocatorContext v2;

  if ((id)objc_opt_class() == a1)
  {
    *(_OWORD *)&v2.reallocate = unk_1E2400780;
    v2.preferredSize = 0;
    memset(&v2, 0, 48);
    sHTMLDataDeallocator = (uint64_t)CFAllocatorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &v2);
  }
}

- (void)dealloc
{
  unsigned __int16 *uniChars;
  objc_super v4;

  uniChars = self->uniChars;
  if (uniChars)
    free(uniChars);
  v4.receiver = self;
  v4.super_class = (Class)_MDHTMLParsing;
  -[_MDHTMLParsing dealloc](&v4, sel_dealloc);
}

- (_MDHTMLParsing)initWithEncoding:(unint64_t)a3
{
  _MDHTMLParsing *v4;
  uint64_t v5;
  NSMutableDictionary *attributes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MDHTMLParsing;
  v4 = -[_MDHTMLParsing init](&v8, sel_init);
  v4->sourceEncoding = a3;
  v4->sourceCFEncoding = CFStringConvertNSStringEncodingToEncoding(a3);
  objc_msgSend(CFSTR("\n"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v4->newLineBuffer, 8, &v4->newLineLength, a3, 0, 0, objc_msgSend(CFSTR("\n"), "length"), 0);
  v5 = objc_opt_new();
  attributes = v4->attributes;
  v4->attributes = (NSMutableDictionary *)v5;

  return v4;
}

- (void)appendText:(const char *)a3 length:(unint64_t)a4
{
  unint64_t uniCharLen;
  const char *v7;
  int v8;
  unint64_t uniCharSize;
  const char *v10;
  const char *v11;
  unsigned __int8 v12;
  int v13;
  unsigned int v14;
  unsigned __int16 *uniChars;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  int v21;
  char v22;
  unint64_t v23;
  unsigned __int16 *v24;

  if (!self->hiddenCount)
  {
    uniCharLen = self->uniCharLen;
    if (uniCharLen < self->indexingLimit)
    {
      v7 = a3;
      if (self->newLineLength != a4 || (v8 = memcmp(a3, self->newLineBuffer, a4), uniCharLen) || v8)
      {
        uniCharSize = self->uniCharSize;
        if (uniCharLen + a4 > uniCharSize)
        {
          do
          {
            if (uniCharSize)
              uniCharSize *= 2;
            else
              uniCharSize = 4096;
          }
          while (uniCharLen + a4 > uniCharSize);
          self->uniCharSize = uniCharSize;
          self->uniChars = (unsigned __int16 *)malloc_type_realloc(self->uniChars, 2 * uniCharSize, 0x1000040BDFB0063uLL);
        }
        if (self->sourceCFEncoding == 134217984)
        {
          if ((uint64_t)a4 >= 1)
          {
            v10 = &v7[a4];
            v11 = v7;
            do
            {
              v13 = *v11++;
              v12 = v13;
              LOWORD(v14) = v13;
              if (v13 < 0)
              {
                v17 = (unint64_t)v12 >> 4;
                if ((v17 & 0xC) == 8)
                  goto LABEL_29;
                v18 = utf8_len_table[v17];
                if (&v7[v18] > v10)
                  return;
                v19 = utf8_first_char_mask[v18] & v14;
                if ((v17 & 0xC) == 0xC)
                {
                  if (v18 <= 2)
                    v20 = 2;
                  else
                    v20 = utf8_len_table[v17];
                  v21 = v20 - 1;
                  do
                  {
                    v22 = *v11++;
                    v14 = v22 & 0x3F | (v19 << 6);
                    v19 = v14;
                    --v21;
                  }
                  while (v21);
                }
                else
                {
                  v14 &= utf8_first_char_mask[v18];
                }
                if ((_DWORD)v17 == 15)
                {
                  v23 = self->uniCharLen;
                  v24 = &self->uniChars[v23];
                  *v24 = (v14 >> 10) - 10304;
                  self->uniCharLen = v23 + 2;
                  v24[1] = v14 & 0x3FF | 0xDC00;
                  goto LABEL_29;
                }
              }
              uniChars = self->uniChars;
              v16 = self->uniCharLen;
              self->uniCharLen = v16 + 1;
              uniChars[v16] = v14;
LABEL_29:
              v7 = v11;
            }
            while (v11 < v10);
          }
        }
        else if (!CFStringEncodingBytesToUnicode())
        {
          self->uniCharLen = self->uniCharLen;
        }
      }
    }
  }
}

- (void)appendUnichars:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  unint64_t uniCharLen;
  unint64_t uniCharSize;
  unsigned __int16 *uniChars;

  if (!self->hiddenCount)
  {
    uniCharLen = self->uniCharLen;
    if (uniCharLen < self->indexingLimit && (a4 != 1 || uniCharLen || *a3 != 10))
    {
      uniCharSize = self->uniCharSize;
      if (uniCharLen + a4 <= uniCharSize)
      {
        uniChars = self->uniChars;
      }
      else
      {
        do
        {
          if (uniCharSize)
            uniCharSize *= 2;
          else
            uniCharSize = 4096;
        }
        while (uniCharLen + a4 > uniCharSize);
        self->uniCharSize = uniCharSize;
        uniChars = (unsigned __int16 *)malloc_type_realloc(self->uniChars, 2 * uniCharSize, 0x1000040BDFB0063uLL);
        self->uniChars = uniChars;
        uniCharLen = self->uniCharLen;
      }
      memcpy(&uniChars[uniCharLen], a3, 2 * a4);
      self->uniCharLen += a4;
    }
  }
}

- (void)appendNewline
{
  __int16 v2;

  v2 = 10;
  -[_MDHTMLParsing appendUnichars:length:](self, "appendUnichars:length:", &v2, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->metaContent, 0);
  objc_storeStrong((id *)&self->metaHttpEquiv, 0);
  objc_storeStrong((id *)&self->metaName, 0);
  objc_storeStrong((id *)&self->attributes, 0);
}

@end
