@implementation NSString(DC)

- (id)dc_trimmedString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)dc_whitespaceAndNewlineCoalescedString
{
  if (dc_whitespaceAndNewlineCoalescedString_onceToken != -1)
    dispatch_once(&dc_whitespaceAndNewlineCoalescedString_onceToken, &__block_literal_global_16);
  return objc_msgSend((id)dc_whitespaceAndNewlineCoalescedString_regex, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), CFSTR(" "));
}

- (id)dc_sanitizedFilenameString
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if ((unint64_t)objc_msgSend(v1, "length") >= 0x81)
    {
      objc_msgSend(v1, "dc_substringToIndex:", 128);
      v2 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v2;
    }
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("///\\?%*|\"<>:"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "dc_stringByReplacingCharactersInSet:withString:", v3, &stru_24C5B9710);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formUnionWithCharacterSet:", v7);

    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v6);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (uint64_t)dc_stringReplacingUnsafeHTMLCharacters
{
  return objc_msgSend(a1, "dc_stringByReplacingCharactersInStringMap:", &unk_24C5D8648);
}

- (uint64_t)dc_numberOfLines
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_msgSend(a1, "length");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = objc_msgSend(a1, "lineRangeForRange:", v5, 0);
    v5 = v6 + v7;
    ++v4;
  }
  while (v6 + v7 < v3);
  return v4;
}

- (void)dc_enumerateParagraphsInRange:()DC usingBlock:
{
  void (**v8)(id, uint64_t, unint64_t, uint64_t, char *);
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;

  v8 = a5;
  v9 = a3 + a4;
  v10 = objc_msgSend(a1, "length");
  if (v9 >= v10)
    v9 = v10;
  v14 = 0;
  do
  {
    if (a3 >= v9)
      break;
    v12 = 0;
    v13 = 0;
    v11 = 0;
    objc_msgSend(a1, "getParagraphStart:end:contentsEnd:forRange:", &v13, &v12, &v11, a3, 0);
    v8[2](v8, v13, v12, v11, &v14);
    a3 = v12;
  }
  while (!v14);

}

- (void)dc_enumerateContentLineRangesInRange:()DC usingBlock:
{
  void (**v8)(id, unint64_t, uint64_t, char *);
  unint64_t v9;
  unint64_t v10;
  char v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v8 = a5;
  v9 = a3 + a4;
  v10 = objc_msgSend(a1, "length");
  v14 = 0;
  v15 = a3;
  if (v9 >= v10)
    v9 = v10;
  v13 = 0;
  v12 = 0;
  do
  {
    objc_msgSend(a1, "getLineStart:end:contentsEnd:forRange:", &v15, &v14, &v13, a3, 0);
    v8[2](v8, v15, v13 - v15, &v12);
    a3 = v14;
    v15 = v14;
  }
  while (v14 < v9 && v12 == 0);

}

- (uint64_t)dc_substringFromIndex:()DC
{
  return objc_msgSend(a1, "substringFromIndex:", objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:"));
}

- (id)dc_substringToIndex:()DC
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (objc_msgSend(a1, "length"))
  {
    v5 = objc_msgSend(a1, "length");
    if (v5 - 1 >= a3)
      v6 = a3;
    else
      v6 = v5 - 1;
    v7 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", v6);
    objc_msgSend(a1, "substringToIndex:", v7 + v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_msgSend(a1, "copy");
  }
  return v9;
}

- (uint64_t)dc_substringWithRange:()DC
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:");
  return objc_msgSend(a1, "substringWithRange:", v2, v3);
}

- (id)dc_stringByReplacingNewlineCharactersWithWhiteSpace
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dc_stringByReplacingCharactersInSet:withString:", v2, CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dc_stringByReplacingCharactersInSet:()DC withString:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v6);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
  }
  else
  {
    v12 = v9;
    v13 = v10;
    v11 = 0;
    do
    {
      if (!v11)
        v11 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v11, "replaceCharactersInRange:withString:", v12, v13, v7);
      v12 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", v6, 2, v12, objc_msgSend(v11, "length") - v12);
      v13 = v14;
    }
    while (v12 != 0x7FFFFFFFFFFFFFFFLL);
    if (v11)
    {
      v15 = objc_msgSend(v11, "copy");

      v8 = (id)v15;
    }
  }

  return v8;
}

- (id)dc_stringByReplacingCharactersInStringMap:()DC
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf;
  _BYTE v29[15];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27 = a1;
  v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v5, "appendString:", CFSTR("()"));
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v26 = v4;
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x24BDD1798], "escapedPatternForString:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v10);

        objc_msgSend(v5, "appendString:", CFSTR("|"));
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "length"))
    objc_msgSend(v5, "replaceCharactersInRange:withString:", objc_msgSend(v5, "length") - 1, 1, &stru_24C5B9710);
  objc_msgSend(v5, "appendString:", CFSTR(")"));
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", v5, 0, 0);
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__5;
  v39 = __Block_byref_object_dispose__5;
  v40 = 0;
  v11 = objc_msgSend(v27, "length");
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __58__NSString_DC__dc_stringByReplacingCharactersInStringMap___block_invoke;
  v34[3] = &unk_24C5B8F38;
  v34[4] = &v35;
  objc_msgSend(v25, "enumerateMatchesInString:options:range:usingBlock:", v27, 0, 0, v11, v34);
  if (objc_msgSend((id)v36[5], "count"))
    v12 = (void *)objc_msgSend(v27, "mutableCopy");
  else
    v12 = 0;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend((id)v36[5], "reverseObjectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v13);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "rangeValue");
        v19 = v18;
        objc_msgSend(v27, "substringWithRange:", v17, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(v12, "replaceCharactersInRange:withString:", v17, v19, v21);
        }
        else
        {
          v22 = os_log_create("com.apple.documentcamera", ");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[NSString(DC) dc_stringByReplacingCharactersInStringMap:].cold.1(&buf, v29, v22);

        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
    }
    while (v14);
  }

  if (v12)
  {
    v23 = objc_msgSend(v12, "copy");

    v27 = (id)v23;
  }

  _Block_object_dispose(&v35, 8);
  return v27;
}

- (uint64_t)dc_paragraphRangeForRange:()DC contentEnd:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v7 = 0;
  objc_msgSend(a1, "getParagraphStart:end:contentsEnd:forRange:", &v9, &v8, &v7, a3, a4);
  if (a5)
    *a5 = v7;
  return v9;
}

- (uint64_t)dc_lengthOfLongestLine
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__NSString_DC__dc_lengthOfLongestLine__block_invoke;
  v3[3] = &unk_24C5B8F60;
  v3[4] = &v4;
  objc_msgSend(a1, "enumerateLinesUsingBlock:", v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (void)dc_stringByReplacingCharactersInStringMap:()DC .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "nil replacement string replacestring map", buf, 2u);
}

@end
