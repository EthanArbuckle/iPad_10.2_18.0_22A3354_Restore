@implementation NSString(WFFilenameUtilities)

- (id)wf_filenameTruncatedToMaximumLengthWithSuffix:()WFFilenameUtilities
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(CFSTR("%@"), "stringByAppendingString:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(a1, "wf_filenameTruncatedToMaximumLengthWithFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)wf_filenameTruncatedToMaximumLength
{
  return objc_msgSend(a1, "wf_filenameTruncatedToMaximumLengthWithSuffix:", 0);
}

- (id)wf_filenameTruncatedToMaximumLengthWithFormat:()WFFilenameUtilities
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[8];
  _QWORD v30[4];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;

  v4 = a3;
  objc_msgSend(a1, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4);
  v7 = objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4);
  v8 = objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 4);
  v9 = a1;
  v10 = v4;
  v11 = v5;
  if (v8)
  {
    objc_msgSend(v9, "stringByDeletingPathExtension");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    WFFilenameByApplyingFormatStringToBasenameAndAppendPathExtension(v12, v10, v7, v11, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v9;
    v14 = v10;
    v15 = v11;
    v13 = v12;
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v14, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  v16 = objc_msgSend(v13, "lengthOfBytesUsingEncoding:", 4);
  if (v16 <= 255)
  {
    v17 = v13;
    goto LABEL_17;
  }
  v18 = v16 - v6;
  v19 = v9;
  v20 = v19;
  if (v8 + v18 + 2 >= 256)
  {
    objc_msgSend(v19, "stringByDeletingPathExtension");
    v21 = objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v22 = 255 - v18;
    v20 = (void *)v21;
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  v22 = 255 - v18;
  if (!v8)
    goto LABEL_12;
  v22 += ~v8;
LABEL_13:
  v23 = v20;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v24 = objc_msgSend(v23, "length");
  if (v24 >= v22)
    v25 = v22;
  else
    v25 = v24;
  v34 = v25;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v26 = v32[3];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __WFSubstringByEncodingComposedCharacterSequencesToMaxLength_block_invoke;
  v29[3] = &unk_24C4DB650;
  v29[6] = 4;
  v29[7] = v22;
  v29[4] = v30;
  v29[5] = &v31;
  objc_msgSend(v23, "enumerateSubstringsInRange:options:usingBlock:", 0, v26, 2, v29);
  objc_msgSend(v23, "substringToIndex:", v32[3]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v31, 8);

  WFFilenameByApplyingFormatStringToBasenameAndAppendPathExtension(v27, v10, v7, v11, v8);
  v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v17;
}

+ (id)wf_datedFilenameWithTypeString:()WFFilenameUtilities fileExtension:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a4;
  v6 = a3;
  WFLocalizedString(CFSTR("yyyy-MM-dd"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1500], "dateFormatFromTemplate:options:locale:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setDateFormat:", v8);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v10, 0, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("%1$@ %2$@ at %3$@"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringWithFormat:", v14, v6, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  WFLocalizedString(CFSTR("-"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  WFLocalizedString(CFSTR("."));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "stringByAppendingPathExtension:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
