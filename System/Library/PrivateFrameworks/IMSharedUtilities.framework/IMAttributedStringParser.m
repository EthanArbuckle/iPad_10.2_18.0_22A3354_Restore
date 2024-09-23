@implementation IMAttributedStringParser

+ (id)sharedInstance
{
  if (qword_1ECFC7658 != -1)
    dispatch_once(&qword_1ECFC7658, &unk_1E3FB3A88);
  return (id)qword_1ECFC75B8;
}

- (void)_preprocessWithContext:(id)a3 string:(id *)a4
{
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char isKindOfClass;
  uint64_t v16;
  uint64_t v17;

  v7 = objc_msgSend(*a4, "length");
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    do
    {
      v16 = 0;
      v17 = 0;
      v11 = objc_msgSend(*a4, "attributesAtIndex:longestEffectiveRange:inRange:", v10, &v16, v10, v8 - v10);
      v12 = objc_msgSend(a3, "parser:preprocessedAttributesForAttributes:range:", self, v11, v16, v17);
      if (v11 != v12)
      {
        v13 = v12;
        v14 = *a4;
        if ((v9 & 1) == 0)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v14 = *a4;
          if ((isKindOfClass & 1) == 0)
          {
            v14 = (id)objc_msgSend(*a4, "mutableCopy");
            *a4 = v14;
          }
        }
        objc_msgSend(v14, "setAttributes:range:", v13, v16, v17);
        v9 = 1;
      }
      v10 = v17 + v16;
    }
    while (v17 + v16 < v8);
  }
}

- (void)parseContext:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = (id)objc_msgSend(a3, "inString");
  v12 = v5;
  objc_msgSend(a3, "parserDidStart:", self);
  if (objc_msgSend(a3, "shouldPreprocess"))
  {
    -[IMAttributedStringParser _preprocessWithContext:string:](self, "_preprocessWithContext:string:", a3, &v12);
    v5 = v12;
  }
  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      v10 = 0;
      v11 = 0;
      v9 = objc_msgSend(v12, "attributesAtIndex:longestEffectiveRange:inRange:", v8, &v10, v8, v7 - v8);
      objc_msgSend(a3, "parser:foundAttributes:inRange:", self, v9, v10, v11);
      v8 = v11 + v10;
    }
    while (v11 + v10 < v7);
  }
  objc_msgSend(a3, "parserDidEnd:", self);
}

@end
