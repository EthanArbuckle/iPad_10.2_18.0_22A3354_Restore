@implementation NSString(HFAdditions)

- (id)hf_SHA1
{
  id v1;
  unsigned __int8 md[20];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_SHA1((const void *)objc_msgSend(v1, "UTF8String"), objc_msgSend(v1, "hf_UTF8Length"), md);
  objc_msgSend(v1, "hf_toHexString:length:", md, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)hf_SHA256
{
  id v1;
  unsigned __int8 md[32];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(a1);
  CC_SHA256((const void *)objc_msgSend(v1, "UTF8String"), objc_msgSend(v1, "hf_UTF8Length"), md);
  objc_msgSend(v1, "hf_toHexString:length:", md, 32);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hf_isPhoneNumber
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  if (!objc_msgSend(a1, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3780], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInString:", CFSTR("+()-"));
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v4);

  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", &stru_1EA741FF8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length") == 0;
  return v7;
}

- (uint64_t)hf_isEmail
{
  if (qword_1ED379150 != -1)
    dispatch_once(&qword_1ED379150, &__block_literal_global_105);
  return objc_msgSend((id)_MergedGlobals_258, "evaluateWithObject:", a1);
}

+ (id)hf_formattedPersonNameForFirstName:()HFAdditions lastName:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setGivenName:", v5);
    objc_msgSend(v7, "setFamilyName:", v6);
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v5, "length"))
      v9 = v6;
    else
      v9 = v5;
    v8 = v9;
  }

  return v8;
}

- (id)hf_stringByTransformingFirstWordUsingBlock:()HFAdditions
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3010000000;
  v24 = &unk_1DD6D32DE;
  v25 = xmmword_1DD669890;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__12;
  v19 = __Block_byref_object_dispose__12;
  v20 = 0;
  v5 = objc_msgSend(a1, "length");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__NSString_HFAdditions__hf_stringByTransformingFirstWordUsingBlock___block_invoke;
  v11[3] = &unk_1EA733E30;
  v13 = &v21;
  v14 = &v15;
  v6 = v4;
  v12 = v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 3, v11);
  v7 = v22[4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v7, v22[5], v16[5]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (uint64_t)hf_stringByCapitalizingFirstWord
{
  return objc_msgSend(a1, "hf_stringByTransformingFirstWordUsingBlock:", &__block_literal_global_14_8);
}

- (uint64_t)hf_stringByLowercasingFirstWord
{
  return objc_msgSend(a1, "hf_stringByTransformingFirstWordUsingBlock:", &__block_literal_global_15_7);
}

- (id)hf_extractDecimalDigits
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", &stru_1EA741FF8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hf_containsOnlyDecimalDigits
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v3) == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(a1, "length") != 0;
  return v4;
}

- (uint64_t)hf_UTF8Length
{
  return objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4);
}

- (id)hf_toHexString:()HFAdditions length:
{
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v7 = a4;
    do
    {
      objc_msgSend(v6, "appendFormat:", CFSTR("%02x"), *a3);
      *a3++ = 0;
      --v7;
    }
    while (v7);
  }
  return v6;
}

- (uint64_t)hf_countForSubstring:()HFAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "componentsSeparatedByString:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") - 1;

  return v2;
}

- (id)hf_stringByTrimmingTrailingHexCode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInString:", CFSTR("-"));
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEF"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invertedSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v7);
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    goto LABEL_9;
  if (objc_msgSend(v5, "length") != 2)
  {
    if (objc_msgSend(v5, "length") == 4 && v8 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_4;
LABEL_9:
    v10 = a1;
    goto LABEL_10;
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_9;
LABEL_4:
  objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "length") - objc_msgSend(v5, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v2);
  v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v10;
}

+ (id)hf_stringWithFormat:()HFAdditions arguments:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "count") || !objc_msgSend(v6, "length"))
    goto LABEL_5;
  if ((unint64_t)objc_msgSend(v7, "count") >= 0x15)
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ doesn't support more than 20 arguments: %@"), v8, v7);

LABEL_5:
    v9 = v6;
    goto LABEL_6;
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = objc_msgSend(v7, "count");
  if (v12)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(v7, "count");
  v27 = v11;
  if (v14 < 2)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_msgSend(v7, "count");
  if (v16 < 3)
  {
    v57 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_msgSend(v7, "count");
  if (v17 < 4)
  {
    v56 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = objc_msgSend(v7, "count");
  if (v18 < 5)
  {
    v55 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 4);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = objc_msgSend(v7, "count");
  if (v19 < 6)
  {
    v54 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 5);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38 = objc_msgSend(v7, "count");
  if (v38 < 7)
  {
    v53 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 6);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37 = objc_msgSend(v7, "count");
  if (v37 < 8)
  {
    v52 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 7);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = objc_msgSend(v7, "count");
  if (v36 < 9)
  {
    v51 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 8);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = objc_msgSend(v7, "count");
  if (v35 < 0xA)
  {
    v50 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 9);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = objc_msgSend(v7, "count");
  if (v34 < 0xB)
  {
    v49 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 10);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = objc_msgSend(v7, "count");
  if (v33 < 0xC)
  {
    v48 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 11);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = objc_msgSend(v7, "count");
  if (v32 < 0xD)
  {
    v47 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 12);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = objc_msgSend(v7, "count");
  if (v31 < 0xE)
  {
    v46 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 13);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = objc_msgSend(v7, "count");
  if (v30 < 0xF)
  {
    v45 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 14);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = objc_msgSend(v7, "count");
  if (v29 < 0x10)
  {
    v44 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 15);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = objc_msgSend(v7, "count");
  v39 = v19;
  if (v28 < 0x11)
  {
    v43 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 16);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = objc_msgSend(v7, "count");
  v40 = v18;
  if (v20 < 0x12)
  {
    v42 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 17);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = objc_msgSend(v7, "count");
  v41 = v17;
  if (v21 < 0x13)
  {
    v22 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v13;
  if ((unint64_t)objc_msgSend(v7, "count") <= 0x13)
  {
    objc_msgSend(v27, "localizedStringWithFormat:", v6, v13, v15, v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45, v44,
      v43,
      v42,
      v22,
      0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 19);
    v25 = v14;
    v23 = v12;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringWithFormat:", v6, v13, v15, v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45, v44,
      v43,
      v42,
      v22,
      v24);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v12 = v23;
    v14 = v25;
  }
  if (v21 >= 0x13)

  if (v20 >= 0x12)
  if (v28 >= 0x11)

  if (v29 >= 0x10)
  if (v30 >= 0xF)

  if (v31 >= 0xE)
  if (v32 >= 0xD)

  if (v33 >= 0xC)
  if (v34 >= 0xB)

  if (v35 >= 0xA)
  if (v36 >= 9)

  if (v37 >= 8)
  if (v38 >= 7)

  if (v39 >= 6)
  if (v40 >= 5)

  if (v41 >= 4)
  if (v16 >= 3)

  if (v14 >= 2)
  if (v12)

LABEL_6:
  return v9;
}

@end
