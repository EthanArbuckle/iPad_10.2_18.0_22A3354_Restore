@implementation IMURLResponseToPlist

+ (void)generate:(id)a3 data:(id)a4 toFilePath:(id)a5
{
  id v6;
  id v7;
  __CFDictionary *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  id v37;
  const void *v38;
  const char *v39;
  void *v40;
  id v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;

  v6 = a3;
  v7 = a4;
  v8 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_URL(v6, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteString(v12, v13, v14, v15);
  v16 = (const void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_allHeaderFields(v6, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    CFDictionarySetValue(v8, CFSTR("headers"), v20);

  v21 = (void *)MEMORY[0x1E0CB37E8];
  v25 = objc_msgSend_statusCode(v6, v22, v23, v24);
  objc_msgSend_numberWithInteger_(v21, v26, v25, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    CFDictionarySetValue(v8, CFSTR("statusCode"), v28);

  if (v16)
    CFDictionarySetValue(v8, CFSTR("url"), v16);
  v52 = (void *)v16;
  v29 = objc_alloc(MEMORY[0x1E0CB3940]);
  v31 = (void *)objc_msgSend_initWithData_encoding_(v29, v30, (uint64_t)v7, 4);
  objc_msgSend_dataUsingEncoding_(v31, v32, 4, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v35, (uint64_t)v34, 0, 0, &v54);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v54;
  if (v37)
  {
    v38 = v7;
    if (!v7)
      goto LABEL_10;
    goto LABEL_9;
  }
  v38 = v36;
  if (v36)
LABEL_9:
    CFDictionarySetValue(v8, CFSTR("body"), v38);
LABEL_10:

  v53 = 0;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E0CB38B0], v39, (uint64_t)v8, 100, 0, &v53);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
    NSLog(CFSTR("Can't serialize dictionary to plist-nsdata! error: %@, dictionary: %@"), v53, v8);
  v41 = objc_alloc(MEMORY[0x1E0CB3940]);
  v43 = (void *)objc_msgSend_initWithData_encoding_(v41, v42, (uint64_t)v40, 4);
  objc_msgSend_URL(v6, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteString(v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("fullPlist for url: %@\n%@"), v51, v43);

}

@end
