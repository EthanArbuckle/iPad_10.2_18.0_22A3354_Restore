@implementation BCSGenericDataParser

+ (id)parseString:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BOOL8 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BOOL8 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  void *v71;

  v4 = a3;
  v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v5)
    +[BCSGenericDataParser parseString:].cold.9(v5, v6, v7, v8, v9, v10, v11, v12);
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v13 = getDDScannerCreateSymbolLoc_ptr;
  v71 = getDDScannerCreateSymbolLoc_ptr;
  if (!getDDScannerCreateSymbolLoc_ptr)
  {
    v14 = (void *)DataDetectorsCoreLibrary();
    v13 = dlsym(v14, "DDScannerCreate");
    v69[3] = (uint64_t)v13;
    getDDScannerCreateSymbolLoc_ptr = v13;
  }
  _Block_object_dispose(&v68, 8);
  if (!v13)
    +[BCSGenericDataParser parseString:].cold.1();
  v15 = ((uint64_t (*)(_QWORD, _QWORD, _QWORD))v13)(0, 0, 0);
  if (!v15)
  {
    v35 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v35)
      +[BCSGenericDataParser parseString:].cold.2(v35, v36, v37, v38, v39, v40, v41, v42);
    goto LABEL_35;
  }
  v16 = (const void *)v15;
  v17 = objc_msgSend(v4, "length", v68);
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v18 = getDDScanQueryCreateFromStringSymbolLoc_ptr;
  v71 = getDDScanQueryCreateFromStringSymbolLoc_ptr;
  if (!getDDScanQueryCreateFromStringSymbolLoc_ptr)
  {
    v19 = (void *)DataDetectorsCoreLibrary();
    v18 = dlsym(v19, "DDScanQueryCreateFromString");
    v69[3] = (uint64_t)v18;
    getDDScanQueryCreateFromStringSymbolLoc_ptr = v18;
  }
  _Block_object_dispose(&v68, 8);
  if (!v18)
    +[BCSGenericDataParser parseString:].cold.3();
  v20 = ((uint64_t (*)(_QWORD, id, _QWORD, uint64_t))v18)(0, v4, 0, v17);
  if (!v20)
  {
    v43 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v43)
      +[BCSGenericDataParser parseString:].cold.4(v43, v44, v45, v46, v47, v48, v49, v50);
    goto LABEL_34;
  }
  v21 = (const void *)v20;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v22 = getDDScannerScanQuerySymbolLoc_ptr;
  v71 = getDDScannerScanQuerySymbolLoc_ptr;
  if (!getDDScannerScanQuerySymbolLoc_ptr)
  {
    v23 = (void *)DataDetectorsCoreLibrary();
    v22 = dlsym(v23, "DDScannerScanQuery");
    v69[3] = (uint64_t)v22;
    getDDScannerScanQuerySymbolLoc_ptr = v22;
  }
  _Block_object_dispose(&v68, 8);
  if (!v22)
    +[BCSGenericDataParser parseString:].cold.5();
  if (!((unsigned int (*)(const void *, const void *))v22)(v16, v21))
  {
    v51 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v51)
      +[BCSGenericDataParser parseString:].cold.6(v51, v52, v53, v54, v55, v56, v57, v58);
    CFRelease(v21);
LABEL_34:
    CFRelease(v16);
LABEL_35:
    v31 = 0;
    goto LABEL_40;
  }
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v24 = getDDScannerCopyResultsWithOptionsSymbolLoc_ptr;
  v71 = getDDScannerCopyResultsWithOptionsSymbolLoc_ptr;
  if (!getDDScannerCopyResultsWithOptionsSymbolLoc_ptr)
  {
    v25 = (void *)DataDetectorsCoreLibrary();
    v24 = dlsym(v25, "DDScannerCopyResultsWithOptions");
    v69[3] = (uint64_t)v24;
    getDDScannerCopyResultsWithOptionsSymbolLoc_ptr = v24;
  }
  _Block_object_dispose(&v68, 8);
  if (!v24)
    +[BCSGenericDataParser parseString:].cold.7();
  v26 = (void *)((uint64_t (*)(const void *, uint64_t))v24)(v16, 1);
  v27 = v26;
  if (!v26)
  {
    v59 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v59)
      +[BCSGenericDataParser parseString:].cold.8(v59, v60, v61, v62, v63, v64, v65, v66);
    goto LABEL_38;
  }
  v28 = objc_msgSend(v26, "count", v68);
  if (!v28)
  {
LABEL_38:
    v31 = 0;
    goto LABEL_39;
  }
  v29 = v28;
  v30 = 0;
  v31 = 0;
  while (1)
  {
    objc_msgSend(v27, "objectAtIndexedSubscript:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_parsedDataFromDDResult:decodedString:", v32, v4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
      break;
LABEL_25:

    if (v29 == ++v30)
      goto LABEL_39;
  }
  if (objc_msgSend(v33, "type") != 1)
  {
    if (!v31)
      v31 = v34;
    goto LABEL_25;
  }

  v31 = v34;
LABEL_39:
  CFRelease(v21);
  CFRelease(v16);

LABEL_40:
  return v31;
}

+ (id)_parsedDataFromDDResult:(__DDResult *)a3 decodedString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BCSParsedURLData *v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  void *v48;

  v5 = a4;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v6 = getDDResultGetRangeSymbolLoc_ptr;
  v48 = getDDResultGetRangeSymbolLoc_ptr;
  if (!getDDResultGetRangeSymbolLoc_ptr)
  {
    v7 = (void *)DataDetectorsCoreLibrary();
    v6 = dlsym(v7, "DDResultGetRange");
    v46[3] = (uint64_t)v6;
    getDDResultGetRangeSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v45, 8);
  if (!v6)
    +[BCSGenericDataParser _parsedDataFromDDResult:decodedString:].cold.1();
  v8 = ((uint64_t (*)(__DDResult *))v6)(a3);
  v10 = v5;
  if (!v8)
  {
    if (v9 == objc_msgSend(v5, "length", v45))
      v10 = 0;
    else
      v10 = v5;
  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v11 = getDDResultGetCategorySymbolLoc_ptr;
  v48 = getDDResultGetCategorySymbolLoc_ptr;
  if (!getDDResultGetCategorySymbolLoc_ptr)
  {
    v12 = (void *)DataDetectorsCoreLibrary();
    v11 = dlsym(v12, "DDResultGetCategory");
    v46[3] = (uint64_t)v11;
    getDDResultGetCategorySymbolLoc_ptr = v11;
  }
  _Block_object_dispose(&v45, 8);
  if (!v11)
    +[BCSGenericDataParser _parsedDataFromDDResult:decodedString:].cold.2();
  v13 = ((uint64_t (*)(__DDResult *))v11)(a3);
  if ((v13 - 1) < 2)
  {
    _bcs_urlFromDDResult((uint64_t)a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "scheme", v45);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lowercaseString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("mailto")) & 1) != 0)
      {
        v18 = 3;
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("tel")))
      {
        v18 = 4;
      }
      else
      {
        v18 = 1;
      }
      v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v28)
        +[BCSGenericDataParser _parsedDataFromDDResult:decodedString:].cold.3(v28, v29, v30, v31, v32, v33, v34, v35);
      v27 = -[BCSParsedURLData initWithURL:type:extraPreviewText:]([BCSParsedURLData alloc], "initWithURL:type:extraPreviewText:", v15, v18, v10);

      goto LABEL_30;
    }
LABEL_29:
    v27 = 0;
LABEL_30:

    goto LABEL_31;
  }
  if (v13 == 3)
  {
    objc_msgSend(getDDScannerResultClass(), "resultFromCoreResult:", a3, v45);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v19)
        +[BCSGenericDataParser _parsedDataFromDDResult:decodedString:].cold.5(v19, v20, v21, v22, v23, v24, v25, v26);
      v27 = -[BCSDataDetectorsScannerResultData initWithScannerResult:type:extraPreviewText:]([BCSDataDetectorsScannerResultData alloc], "initWithScannerResult:type:extraPreviewText:", v15, 6, v10);
      goto LABEL_30;
    }
    v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v36)
      +[BCSGenericDataParser _parsedDataFromDDResult:decodedString:].cold.4(v36, v37, v38, v39, v40, v41, v42, v43);
    goto LABEL_29;
  }
  v27 = 0;
LABEL_31:

  return v27;
}

+ (void)parseString:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "DDScannerRef _DDScannerCreate(DDScannerType, DDScannerOptions, CFErrorRef *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGenericDataParser.m"), 20, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

+ (void)parseString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGenericDataParser: Cannot create DDScanner", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:.cold.3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "DDScanQueryRef _DDScanQueryCreateFromString(CFAllocatorRef, CFStringRef, CFRange)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGenericDataParser.m"), 18, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

+ (void)parseString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGenericDataParser: Cannot create DDScanQuery", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:.cold.5()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Boolean _DDScannerScanQuery(DDScannerRef, DDScanQueryRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGenericDataParser.m"), 21, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

+ (void)parseString:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGenericDataParser: Did not find any interesting data", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:.cold.7()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFArrayRef _DDScannerCopyResultsWithOptions(DDScannerRef, DDScannerCopyResultsOptions)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGenericDataParser.m"), 19, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

+ (void)parseString:(uint64_t)a3 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGenericDataParser: Failed to get results from scanner", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)parseString:(uint64_t)a3 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGenericDataParser: Begin parsing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_parsedDataFromDDResult:decodedString:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFRange _DDResultGetRange(DDResultRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGenericDataParser.m"), 17, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

+ (void)_parsedDataFromDDResult:decodedString:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "DDResultCategory _DDResultGetCategory(DDResultRef)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BCSGenericDataParser.m"), 16, CFSTR("%s"), OUTLINED_FUNCTION_3_2());

  __break(1u);
}

+ (void)_parsedDataFromDDResult:(uint64_t)a3 decodedString:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGenericDataParser: Extracted URL from generic string", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_parsedDataFromDDResult:(uint64_t)a3 decodedString:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGenericDataParser: Failed to create scanner result from core result", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_parsedDataFromDDResult:(uint64_t)a3 decodedString:(uint64_t)a4 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSGenericDataParser: Extracted scanner result from generic string", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
