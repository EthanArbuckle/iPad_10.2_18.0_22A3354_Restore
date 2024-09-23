@implementation NSAttributedString(HUAdditions)

- (double)hu_scaleFactorForBoundingSize:()HUAdditions minimumScaleFactor:maximumNumberOfLines:
{
  id v11;
  double v12;
  double v13;

  v11 = objc_alloc_init(MEMORY[0x1E0CEA248]);
  objc_msgSend(v11, "setMinimumScaleFactor:", a4);
  objc_msgSend(v11, "setMaximumNumberOfLines:", a6);
  objc_msgSend(a1, "boundingRectWithSize:options:context:", 1, v11, a2, a3);
  objc_msgSend(v11, "actualScaleFactor");
  v13 = v12;

  return v13;
}

- (uint64_t)hu_attributedStringScaledByFactor:()HUAdditions
{
  return objc_msgSend(a1, "_ui_attributedSubstringFromRange:scaledByScaleFactor:", 0, objc_msgSend(a1, "length"), a2);
}

- (id)hu_scaledAttributedStringWithBoundingSize:()HUAdditions minimumScaleFactor:maximumNumberOfLines:
{
  double v2;
  double v3;
  id v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "hu_scaleFactorForBoundingSize:minimumScaleFactor:maximumNumberOfLines:");
  v3 = v2;
  v4 = a1;
  v5 = v4;
  if (v3 < 1.0)
  {
    objc_msgSend(v4, "hu_attributedStringScaledByFactor:", v3);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

+ (id)hu_attributedStringForString:()HUAdditions withAppendedString:asURL:withAttributes:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v11 = a4;
  objc_msgSend(a3, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v12, v10);

  v14 = objc_msgSend(v12, "rangeOfString:options:", v11, 4);
  v16 = v15;

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = *MEMORY[0x1E0CEA0C0];
    v20[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAttributes:range:", v17, v14, v16);

  }
  return v13;
}

+ (id)hu_attributedString:()HUAdditions withAppendedLinkString:linkURL:
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hu_attributedLinkStringForString:linkString:linkURL:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)hu_attributedLinkStringForString:()HUAdditions linkString:linkURL:
{
  return objc_msgSend(MEMORY[0x1E0CB3498], "hu_attributedLinkStringForString:linkString:linkURL:attributes:additionalLinkAttributes:", a3, a4, a5, 0, 0);
}

+ (id)hu_attributedLinkStringForAttributedString:()HUAdditions linkString:linkURL:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v7);
  objc_msgSend(v7, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "rangeOfString:options:", v8, 4);
  v14 = v13;

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("linkString (%@) is expected to be a substring of fullString (%@)"), v8, v15);

  }
  else
  {
    v16 = *MEMORY[0x1E0CEA0C0];
    v19[0] = *MEMORY[0x1E0CEA180];
    v19[1] = v16;
    v20[0] = &unk_1E7041668;
    v20[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAttributes:range:", v17, v12, v14);

  }
  return v10;
}

+ (id)hu_attributedLinkStringForString:()HUAdditions linkString:linkURL:attributes:additionalLinkAttributes:
{
  id v11;
  id v12;
  id v13;
  id v14;
  objc_class *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = (objc_class *)MEMORY[0x1E0CB3778];
  v16 = a6;
  v17 = (void *)objc_msgSend([v15 alloc], "initWithString:attributes:", v11, v16);

  v18 = objc_msgSend(v11, "rangeOfString:options:", v12, 4);
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog(CFSTR("linkString (%@) is expected to be a substring of fullString (%@)"), v12, v11);
  }
  else
  {
    v20 = v18;
    v21 = v19;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", &unk_1E7041668, *MEMORY[0x1E0CEA180]);
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v23, *MEMORY[0x1E0CEA0A0]);

    objc_msgSend(v22, "na_safeSetObject:forKey:", v13, *MEMORY[0x1E0CEA0C0]);
    if (v14)
      objc_msgSend(v22, "addEntriesFromDictionary:", v14);
    objc_msgSend(v17, "addAttributes:range:", v22, v20, v21);

  }
  return v17;
}

- (id)hu_attributedStringWithDefaultAttributes:()HUAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "hu_attributedStringWithDefaultAttributes:inRange:", v4, 0, objc_msgSend(a1, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hu_attributedStringWithDefaultAttributes:()HUAdditions inRange:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v8 = a3;
  v9 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(a1, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v8);

  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __84__NSAttributedString_HUAdditions__hu_attributedStringWithDefaultAttributes_inRange___block_invoke;
  v25[3] = &unk_1E6F5B9A8;
  v13 = v11;
  v26 = v13;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", a4, a5, 0, v25);
  v14 = *MEMORY[0x1E0CEA098];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configurationWithFont:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *MEMORY[0x1E0CEA050];
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __84__NSAttributedString_HUAdditions__hu_attributedStringWithDefaultAttributes_inRange___block_invoke_2;
    v22[3] = &unk_1E6F5B9D0;
    v23 = v18;
    v24 = v13;
    v20 = v18;
    objc_msgSend(v24, "enumerateAttribute:inRange:options:usingBlock:", v19, a4, a5, 0, v22);

  }
  return v13;
}

- (id)hu_attributedStringByTrimmingCharactersInCharacterSet:()HUAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  objc_msgSend(a1, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E6F60E80);
  }
  else
  {
    v9 = v7;
    v10 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:", v6, 4);
    objc_msgSend(a1, "attributedSubstringFromRange:", v9, v11 - v9 + v10);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v8;

  return v12;
}

- (uint64_t)hu_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (!hu_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "mutableCopy");

    objc_msgSend(v3, "addCharactersInString:", CFSTR("\uFFFC"));
    v4 = objc_msgSend(v3, "copy");
    v5 = (void *)hu_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters;
    hu_attributedStringByTrimmingWhitespaceNewlinesAndObjectReplacementCharacters_whitespaceNewlineAndObjectReplacementCharacters = v4;

  }
  return objc_msgSend(a1, "hu_attributedStringByTrimmingCharactersInCharacterSet:");
}

+ (id)hu_safeAttributedStringWithHTML:()HUAdditions attributes:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("</?\\s*i?frame[^>]*>"), &stru_1E6F60E80, 1025, 0, objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("</?\\s*img[^>]*>"), &stru_1E6F60E80, 1025, 0, objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataUsingEncoding:", 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CB3498]);
  v40 = *MEMORY[0x1E0CEA088];
  v41[0] = *MEMORY[0x1E0CEA0A8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v12 = (void *)objc_msgSend(v10, "initWithData:options:documentAttributes:error:", v9, v11, 0, &v36);
  v13 = v36;
  v14 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v13 || !v14)
  {
    if (v13)
    {
      HFLogForCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v13;
        _os_log_error_impl(&dword_1B8E1E000, v30, OS_LOG_TYPE_ERROR, "Error creating NSAttributedString from HTML data: %@", buf, 0xCu);
      }

    }
    v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E6F60E80);
  }
  else
  {
    v32 = v5;
    v15 = objc_msgSend(v14, "length");
    objc_msgSend(v14, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "rangeOfString:options:range:", CFSTR("\u2028"), 0, 0, v15);
    v19 = v18;

    while (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v14, "replaceCharactersInRange:withString:", v17, v19, CFSTR("\n"));
      v20 = v17 + 1;
      if (v15 == v20)
        break;
      objc_msgSend(v14, "string");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v21, "rangeOfString:options:range:", CFSTR("\u2028"), 0, v20, v15 - v20);
      v19 = v22;

    }
    v23 = objc_alloc(MEMORY[0x1E0C99E20]);
    v37 = *MEMORY[0x1E0CEA0D0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithArray:", v24);

    v26 = objc_msgSend(v14, "length");
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __78__NSAttributedString_HUAdditions__hu_safeAttributedStringWithHTML_attributes___block_invoke;
    v33[3] = &unk_1E6F5B9F8;
    v27 = v14;
    v34 = v27;
    v35 = v25;
    v28 = v25;
    objc_msgSend(v27, "enumerateAttributesInRange:options:usingBlock:", 0, v26, 0, v33);
    v5 = v32;
    if (v32)
      objc_msgSend(v27, "addAttributes:range:", v32, 0, objc_msgSend(v27, "length"));
    v29 = v27;

  }
  return v29;
}

+ (id)hu_attributedStringWithSystemImageNamed:()HUAdditions title:isRTL:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CEA258]);
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithRenderingMode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v11);

    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if ((a5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ "), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v14);
      objc_msgSend(v13, "insertAttributedString:atIndex:", v15, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v14);
      objc_msgSend(v13, "appendAttributedString:", v15);
    }

    v16 = (void *)objc_msgSend(v13, "copy");
  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E6F60E80);
  }

  return v16;
}

@end
