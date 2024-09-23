@implementation OfficeImportCompatibility

+ (id)searchableAttributesForOfficeFile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!OfficeImportLibraryCore_frameworkLibrary)
  {
    v16 = xmmword_24F0F3C50;
    v17 = 0;
    OfficeImportLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!OfficeImportLibraryCore_frameworkLibrary)
    goto LABEL_13;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v4 = (void *)getOISpotlightImporterClass_softClass;
  v15 = getOISpotlightImporterClass_softClass;
  if (!getOISpotlightImporterClass_softClass)
  {
    *(_QWORD *)&v16 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v16 + 1) = 3221225472;
    v17 = __getOISpotlightImporterClass_block_invoke;
    v18 = &unk_24F0F3C70;
    v19 = &v12;
    __getOISpotlightImporterClass_block_invoke((uint64_t)&v16);
    v4 = (void *)v13[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v12, 8);
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[OfficeImportCompatibility searchableAttributesForOfficeFile:].cold.1();
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  v11 = 0;
  objc_msgSend(v6, "searchableAttributesForOfficeFileAtURL:error:", v3, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (!v8 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[OfficeImportCompatibility searchableAttributesForOfficeFile:].cold.2((uint64_t)v3, (uint64_t)v9);

LABEL_14:
  return v8;
}

+ (void)searchableAttributesForOfficeFile:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not load OISpotlightImporter", v0, 2u);
}

+ (void)searchableAttributesForOfficeFile:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_2282CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not extract metadata from %@: error %@", (uint8_t *)&v2, 0x16u);
}

@end
