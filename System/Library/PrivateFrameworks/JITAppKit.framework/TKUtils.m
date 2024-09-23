@implementation TKUtils

+ (BOOL)decompressFile:(id)a3 toDestinationPath:(id)a4 algorithm:(int)a5
{
  id v8;
  int v9;
  id v10;
  unsigned int v11;
  id v12;
  id location[2];
  id v14;
  char v15;

  v14 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = a5;
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", location[0]);
  if (objc_msgSend(v10, "length"))
  {
    v8 = (id)objc_msgSend(v14, "decompressData:algorithm:", v10, v11);
    if (objc_msgSend(v8, "length"))
      v15 = objc_msgSend(v8, "writeToFile:options:error:", v12, 1073741825, 0) & 1;
    else
      v15 = 0;
    v9 = 1;
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v15 = 0;
    v9 = 1;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v15 & 1;
}

+ (id)decompressData:(id)a3 algorithm:(int)a4
{
  id v6;
  id location[2];
  id v8;

  v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(v8, "decompressData:algorithm:operation:", location[0], a4, 1);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)decompressData:(id)a3 algorithm:(int)a4 operation:(int)a5
{
  _BOOL4 flags;
  id v9;
  uint8_t *v10;
  size_t size;
  int v12;
  compression_status v13;
  compression_stream __b;
  int v15;
  int v16;
  id location[3];
  id v18;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = a4;
  v15 = a5;
  memset(&__b, 0, sizeof(__b));
  v13 = compression_stream_init(&__b, (compression_stream_operation)a5, (compression_algorithm)a4);
  if (v13)
  {
    v18 = 0;
    v12 = 1;
  }
  else
  {
    __b.src_ptr = (const uint8_t *)objc_msgSend(objc_retainAutorelease(location[0]), "bytes");
    __b.src_size = objc_msgSend(location[0], "length");
    size = 0x4000;
    v10 = (uint8_t *)malloc_type_malloc(0x4000uLL, 0xA97C22B3uLL);
    __b.dst_ptr = v10;
    __b.dst_size = 0x4000;
    v9 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    flags = v15 == 0;
    while (v13 == COMPRESSION_STATUS_OK)
    {
      v13 = compression_stream_process(&__b, flags);
      if (v13 == COMPRESSION_STATUS_ERROR)
      {
        compression_stream_destroy(&__b);
        v18 = 0;
        v12 = 1;
        goto LABEL_17;
      }
      if (v13)
      {
        if (v13 == COMPRESSION_STATUS_END && __b.dst_ptr > v10)
          objc_msgSend(v9, "appendBytes:length:", v10, __b.dst_ptr - v10);
      }
      else if (!__b.dst_size)
      {
        objc_msgSend(v9, "appendBytes:length:", v10, size);
        __b.dst_ptr = v10;
        __b.dst_size = size;
      }
    }
    compression_stream_destroy(&__b);
    v18 = (id)objc_msgSend(v9, "copy");
    v12 = 1;
LABEL_17:
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(location, 0);
  return v18;
}

+ (id)applicationLibraryPath
{
  NSArray *v3;
  id v4;

  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v4 = -[NSArray firstObject](v3, "firstObject");

  return v4;
}

+ (id)uniqueKeyForURL:(id)a3
{
  id v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = +[MCLURLDataLoader uniqueKeyForURL:](MCLURLDataLoader, "uniqueKeyForURL:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)httpDataURLEncoded:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(_QWORD *, void *, void *, void *);
  void *v12;
  id v13;
  id v14;
  id location[3];
  id v16;
  dispatch_once_t *v17;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = (dispatch_once_t *)&httpDataURLEncoded__onceToken;
  v16 = 0;
  objc_storeStrong(&v16, &__block_literal_global_1);
  if (*v17 != -1)
    dispatch_once(v17, v16);
  objc_storeStrong(&v16, 0);
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = location[0];
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __30__TKUtils_httpDataURLEncoded___block_invoke_2;
  v12 = &unk_24E0999D8;
  v13 = v14;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v8);
  v7 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v7, "setQueryItems:", v14);
  v5 = (id)objc_msgSend(v7, "query");
  v6 = (id)objc_msgSend(v5, "dataUsingEncoding:", 4);

  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v6;
}

void __30__TKUtils_httpDataURLEncoded___block_invoke(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4[3];

  v4[2] = a1;
  v4[1] = a1;
  v3 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v4[0] = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4[0], "removeCharactersInString:", CFSTR("!*'();:@&=+$,/?%#[]"));
  v1 = objc_msgSend(v4[0], "copy");
  v2 = (void *)httpDataURLEncoded__queryParameterCharacterSet;
  httpDataURLEncoded__queryParameterCharacterSet = v1;

  objc_storeStrong(v4, 0);
}

void __30__TKUtils_httpDataURLEncoded___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  uint64_t v4;
  id v5;
  id v6;
  void *v10;
  id v11;
  id v12;
  id v13[3];
  id v14;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[2] = a4;
  v13[1] = a1;
  v13[0] = (id)objc_msgSend(location[0], "stringByAddingPercentEncodingWithAllowedCharacters:", httpDataURLEncoded__queryParameterCharacterSet);
  v12 = (id)objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", httpDataURLEncoded__queryParameterCharacterSet);
  v10 = (void *)a1[4];
  v11 = objc_alloc(MEMORY[0x24BDD1838]);
  if (v13[0])
    v6 = v13[0];
  else
    v6 = location[0];
  if (v12)
    v4 = objc_msgSend(v11, "initWithName:value:", v6, v12);
  else
    v4 = objc_msgSend(v11, "initWithName:value:", v6, v14);
  v5 = (id)v4;
  objc_msgSend(v10, "addObject:");

  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

+ (id)URL:(id)a3 withQueryParameters:(id)a4 addKeys:(id)a5 removeKeys:(id)a6 escape:(BOOL)a7
{
  id v7;
  void *v8;
  id v9;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v27;
  int v28;
  int v29;
  void (*v30)(uint64_t, void *, void *, void *);
  void *v31;
  id v32;
  BOOL v33;
  id v34;
  uint64_t v35;
  int v36;
  int v37;
  void (*v38)(uint64_t, void *, void *, void *);
  void *v39;
  id v40;
  id v41;
  BOOL v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t (*v46)(_QWORD *, void *, void *);
  void *v47;
  id v48;
  id v49;
  id v50;
  BOOL v51;
  id v52;
  id v53;
  id v54;
  id location[3];
  id v56;
  dispatch_once_t *v57;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v54 = 0;
  objc_storeStrong(&v54, a4);
  v53 = 0;
  objc_storeStrong(&v53, a5);
  v52 = 0;
  objc_storeStrong(&v52, a6);
  v51 = a7;
  v57 = (dispatch_once_t *)&URL_withQueryParameters_addKeys_removeKeys_escape__onceToken;
  v56 = 0;
  objc_storeStrong(&v56, &__block_literal_global_9);
  if (*v57 != -1)
    dispatch_once(v57, v56);
  objc_storeStrong(&v56, 0);
  v7 = objc_alloc(MEMORY[0x24BDD1808]);
  v50 = (id)objc_msgSend(v7, "initWithURL:resolvingAgainstBaseURL:", location[0], 0);
  v21 = (id)objc_msgSend(v50, "percentEncodedQuery");
  objc_msgSend(v50, "setQuery:");

  v22 = (id)objc_msgSend(v50, "queryItems");
  v49 = (id)objc_msgSend(v22, "mutableCopy");

  if (v49)
  {
    v16 = v49;
    v15 = (void *)MEMORY[0x24BDD1758];
    v19 = MEMORY[0x24BDAC760];
    v43 = MEMORY[0x24BDAC760];
    v44 = -1073741824;
    v45 = 0;
    v46 = __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_2;
    v47 = &unk_24E099A20;
    v48 = v52;
    v18 = (id)objc_msgSend(v15, "predicateWithBlock:", &v43);
    v17 = (id)objc_msgSend(v16, "filteredArrayUsingPredicate:");
    v8 = (void *)objc_msgSend(v17, "mutableCopy");
    v9 = v49;
    v49 = v8;

    v20 = v53;
    v35 = v19;
    v36 = -1073741824;
    v37 = 0;
    v38 = __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_3;
    v39 = &unk_24E099A70;
    v40 = v54;
    v42 = v51;
    v41 = v49;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", &v35);
    if (objc_msgSend(v49, "count"))
      objc_msgSend(v50, "setQueryItems:", v49);
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v48, 0);
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v34 = (id)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v54, "count"));
    v14 = v54;
    v27 = MEMORY[0x24BDAC760];
    v28 = -1073741824;
    v29 = 0;
    v30 = __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_5;
    v31 = &unk_24E099A98;
    v33 = v51;
    v32 = v34;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v27);
    if (objc_msgSend(v34, "count"))
      objc_msgSend(v50, "setQueryItems:", v34);
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v34, 0);
  }
  v12 = (id)objc_msgSend(v50, "query");
  objc_msgSend(v50, "setPercentEncodedQuery:");

  v11 = (id)objc_msgSend(v50, "URL");
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(location, 0);
  return v11;
}

void __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4[3];

  v4[2] = a1;
  v4[1] = a1;
  v1 = (void *)MEMORY[0x24BDD1690];
  v3 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v2 = (id)objc_msgSend(v3, "bitmapRepresentation");
  v4[0] = (id)objc_msgSend(v1, "characterSetWithBitmapRepresentation:");

  objc_msgSend(v4[0], "removeCharactersInString:", CFSTR("!*'();:@&=+$,/?%#[]"));
  objc_storeStrong((id *)&URL_withQueryParameters_addKeys_removeKeys_escape__queryParameterCharacterSet, v4[0]);
  objc_storeStrong(v4, 0);
}

uint64_t __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v6;
  id v7;
  int v8;
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  v6 = (void *)a1[4];
  v7 = (id)objc_msgSend(location[0], "name");
  v8 = objc_msgSend(v6, "containsObject:") ^ 1;

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

void __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  id v20;
  id v21[2];
  uint64_t v22;
  uint64_t *v23;
  int v24;
  int v25;
  uint64_t v26;
  id v27;
  int v28;
  id v29[4];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v29[3] = a3;
  v29[2] = a4;
  v29[1] = (id)a1;
  v29[0] = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", location[0]);
  if (v29[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (id)objc_msgSend(v29[0], "stringValue");
      v5 = v29[0];
      v29[0] = v4;

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        v6 = (id)objc_msgSend(location[0], "stringByAddingPercentEncodingWithAllowedCharacters:", URL_withQueryParameters_addKeys_removeKeys_escape__queryParameterCharacterSet);
        v7 = location[0];
        location[0] = v6;

        v8 = (id)objc_msgSend(v29[0], "stringByAddingPercentEncodingWithAllowedCharacters:", URL_withQueryParameters_addKeys_removeKeys_escape__queryParameterCharacterSet);
        v9 = v29[0];
        v29[0] = v8;

      }
      v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", location[0], v29[0]);
      v22 = 0;
      v23 = &v22;
      v24 = 0x20000000;
      v25 = 32;
      v26 = 0;
      v26 = objc_msgSend(*(id *)(a1 + 40), "count");
      v11 = *(void **)(a1 + 40);
      v15 = MEMORY[0x24BDAC760];
      v16 = -1073741824;
      v17 = 0;
      v18 = __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_4;
      v19 = &unk_24E099A48;
      v20 = location[0];
      v21[0] = *(id *)(a1 + 40);
      v21[1] = &v22;
      objc_msgSend(v11, "enumerateObjectsWithOptions:usingBlock:", 2, &v15);
      v10 = v23[3];
      if (v10 >= objc_msgSend(*(id *)(a1 + 40), "count"))
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v27);
      else
        objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v27, v23[3]);
      objc_storeStrong(v21, 0);
      objc_storeStrong(&v20, 0);
      _Block_object_dispose(&v22, 8);
      objc_storeStrong(&v27, 0);
    }
    v28 = 0;
  }
  else
  {
    v28 = 1;
  }
  objc_storeStrong(v29, 0);
  if (!v28)
    v28 = 0;
  objc_storeStrong(location, 0);
}

void __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  char v6;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = (id)objc_msgSend(location[0], "name");
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }
  objc_storeStrong(location, 0);
}

void __61__TKUtils_URL_withQueryParameters_addKeys_removeKeys_escape___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v14[3];
  id v15;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v15 = 0;
  objc_storeStrong(&v15, a3);
  v14[2] = a4;
  v14[1] = (id)a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (id)objc_msgSend(v15, "stringValue");
    v5 = v15;
    v15 = v4;

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 40) & 1) != 0)
    {
      v6 = (id)objc_msgSend(location[0], "stringByAddingPercentEncodingWithAllowedCharacters:", URL_withQueryParameters_addKeys_removeKeys_escape__queryParameterCharacterSet);
      v7 = location[0];
      location[0] = v6;

      v8 = (id)objc_msgSend(v15, "stringByAddingPercentEncodingWithAllowedCharacters:", URL_withQueryParameters_addKeys_removeKeys_escape__queryParameterCharacterSet);
      v9 = v15;
      v15 = v8;

    }
    v10 = objc_alloc(MEMORY[0x24BDD1838]);
    v14[0] = (id)objc_msgSend(v10, "initWithName:value:", location[0], v15);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v14[0]);
    objc_storeStrong(v14, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

+ (id)hexForColor:(id)a3 withAlpha:(BOOL)a4
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  id location[3];
  id v15;

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  v12 = 0.0;
  v11 = 0.0;
  v10 = 0.0;
  v9 = 0.0;
  objc_msgSend(location[0], "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);
  v8 = (int)(v12 * 255.0);
  v7 = (int)(v11 * 255.0);
  v6 = (int)(v10 * 255.0);
  if (v13)
    v15 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X%02X%02X%02X"), v8, v7, v6, (int)(v9 * 255.0));
  else
    v15 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X%02X%02X"), v8, v7, v6);
  objc_storeStrong(location, 0);
  return v15;
}

@end
