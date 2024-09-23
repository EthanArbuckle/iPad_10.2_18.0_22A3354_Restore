@implementation NSAttributedString(BulletinBoard)

+ (id)_bb_attributedStringWithRTFDData:()BulletinBoard
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v20[0] = CFSTR("DocumentType");
    v20[1] = CFSTR("DefaultAttributes");
    v21[0] = CFSTR("NSRTFD");
    v21[1] = MEMORY[0x24BDBD1B8];
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = a3;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithData:options:documentAttributes:error:", v4, v5, 0, &v19);

    v7 = v19;
    if (v7)
    {
      v8 = BBLogGeneral;
      if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
        +[NSAttributedString(BulletinBoard) _bb_attributedStringWithRTFDData:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    v16 = objc_msgSend(v6, "length");
    objc_msgSend(v6, "removeAttribute:range:", CFSTR("NSFont"), 0, v16);
    objc_msgSend(v6, "removeAttribute:range:", CFSTR("NSParagraphStyle"), 0, v16);
    v17 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (id)_bb_RTFDData
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "length");
  v16 = CFSTR("DocumentType");
  v17[0] = CFSTR("NSRTFD");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(a1, "dataFromRange:documentAttributes:error:", 0, v2, v3, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  if (v5)
  {
    v6 = BBLogGeneral;
    if (os_log_type_enabled((os_log_t)BBLogGeneral, OS_LOG_TYPE_ERROR))
      -[NSAttributedString(BulletinBoard) _bb_RTFDData].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  return v4;
}

+ (void)_bb_attributedStringWithRTFDData:()BulletinBoard .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_20CCB9000, a1, a3, "Failed to create attributed string from RTFD data", a5, a6, a7, a8, 0);
}

- (void)_bb_RTFDData
{
  OUTLINED_FUNCTION_1(&dword_20CCB9000, a1, a3, "Failed to create RTFD data from attributed string", a5, a6, a7, a8, 0);
}

@end
