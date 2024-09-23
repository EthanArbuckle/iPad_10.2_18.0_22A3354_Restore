@implementation NSRegularExpression(ENAGRegex)

- (BOOL)enFindInString:()ENAGRegex
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

- (uint64_t)enMatchesString:()ENAGRegex
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  objc_msgSend(a1, "firstMatchInString:options:range:", v4, 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v6, "range"))
      v8 = 0;
    else
      v8 = v7 == v5;
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)enCapturedSubstringsOfString:()ENAGRegex
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__NSRegularExpression_ENAGRegex__enCapturedSubstringsOfString___block_invoke;
  v9[3] = &unk_24F8B02B8;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(a1, "enumerateMatchesInString:options:range:usingBlock:", v6, 0, 0, v5, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)enReplaceWithString:()ENAGRegex inString:
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, objc_msgSend(v6, "length"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)enRegexWithPattern:()ENAGRegex
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v8;

  v3 = a3;
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v3, 0, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = v5;
  if (!v4)
    NSLog(CFSTR("regularExpressionWithPattern:%@ returned error:%@"), v3, v5);

  return v4;
}

@end
