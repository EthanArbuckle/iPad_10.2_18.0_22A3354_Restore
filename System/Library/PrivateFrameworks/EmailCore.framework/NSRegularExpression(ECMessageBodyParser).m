@implementation NSRegularExpression(ECMessageBodyParser)

+ (uint64_t)ec_copyAttributionRegularExpressionForType:()ECMessageBodyParser
{
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v19;
  __CFString *v20;
  __CFString *v22;
  void *v23;
  objc_class *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", CFSTR("AttributionPatterns"), CFSTR("plist")));
  v24 = a1;
  if (a3 > 3)
  {
    v22 = 0;
    v6 = 0;
  }
  else
  {
    v22 = off_1E7121390[a3];
    v6 = off_1E71213B0[a3];
  }
  v23 = v5;
  v20 = v6;
  v7 = (void *)objc_msgSend(v5, "objectForKey:");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v7);
        v13 = (void *)objc_msgSend(MEMORY[0x1E0CB38E8], "escapedPatternForString:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
        v14 = v13;
        if (a3 == 1)
        {
          v15 = objc_msgSend(v13, "rangeOfString:", CFSTR("%@"));
          if (!v15)
            v15 = objc_msgSend(v14, "rangeOfString:options:range:", CFSTR("%@"), 0, 1, objc_msgSend(v14, "length") - 1);
          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
            v14 = (void *)objc_msgSend((id)objc_msgSend(v14, "substringToIndex:"), "stringByAppendingString:", CFSTR("%@"));
        }
        objc_msgSend(v8, "addObject:", objc_msgSend((id)objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("%@"), CFSTR(".+")), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("\\s")));
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v22, objc_msgSend(v8, "componentsJoinedByString:", CFSTR("|")));
  v25 = 0;
  v17 = objc_msgSend([v24 alloc], "initWithPattern:options:error:", v16, 1, &v25);
  if (!v17)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v24, CFSTR("ECMessageBodyParser.m"), 711, CFSTR("Couldn't create regular expression for key %@: %@"), v20, v25);
  }

  return v17;
}

+ (uint64_t)ec_attributionExpression
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__NSRegularExpression_ECMessageBodyParser__ec_attributionExpression__block_invoke;
  block[3] = &unk_1E7121370;
  block[4] = a1;
  if (ec_attributionExpression_onceToken != -1)
    dispatch_once(&ec_attributionExpression_onceToken, block);
  return ec_attributionExpression_regex;
}

+ (uint64_t)ec_attributionPrefixExpression
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__NSRegularExpression_ECMessageBodyParser__ec_attributionPrefixExpression__block_invoke;
  block[3] = &unk_1E7121370;
  block[4] = a1;
  if (ec_attributionPrefixExpression_onceToken != -1)
    dispatch_once(&ec_attributionPrefixExpression_onceToken, block);
  return ec_attributionPrefixExpression_regex;
}

+ (uint64_t)ec_forwardSeparatorExpression
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__NSRegularExpression_ECMessageBodyParser__ec_forwardSeparatorExpression__block_invoke;
  block[3] = &unk_1E7121370;
  block[4] = a1;
  if (ec_forwardSeparatorExpression_onceToken != -1)
    dispatch_once(&ec_forwardSeparatorExpression_onceToken, block);
  return ec_forwardSeparatorExpression_regex;
}

+ (uint64_t)ec_signatureExpression
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__NSRegularExpression_ECMessageBodyParser__ec_signatureExpression__block_invoke;
  block[3] = &unk_1E7121370;
  block[4] = a1;
  if (ec_signatureExpression_onceToken != -1)
    dispatch_once(&ec_signatureExpression_onceToken, block);
  return ec_signatureExpression_regex;
}

@end
