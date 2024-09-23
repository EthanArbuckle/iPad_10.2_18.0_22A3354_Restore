@implementation NSMutableString(CNOrderedDictionary)

- (uint64_t)_cn_replaceStrings:()CNOrderedDictionary
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNStringRangeFinder rangesOfStrings:inString:](CNStringRangeFinder, "rangesOfStrings:inString:", v5, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __59__NSMutableString_CNOrderedDictionary___cn_replaceStrings___block_invoke;
  v13 = &unk_1E29BB0C0;
  v14 = a1;
  v15 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, &v10);
  v8 = objc_msgSend(v6, "count", v10, v11, v12, v13, v14);

  return v8;
}

@end
