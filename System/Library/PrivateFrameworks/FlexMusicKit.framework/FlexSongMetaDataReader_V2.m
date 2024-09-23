@implementation FlexSongMetaDataReader_V2

+ (BOOL)isSongAtPath:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  char isDirectory;
  BOOL v14;
  char v16;

  objc_msgSend__pathToMetadata_(a1, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v10, v11, (uint64_t)v5, (uint64_t)&v16, v12);
  if (v16)
    v14 = 0;
  else
    v14 = isDirectory;

  return v14;
}

+ (id)_pathToMetadata:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringByAppendingPathComponent_(a3, a2, (uint64_t)CFSTR("metadata.smm"), v3, v4);
}

+ (id)songAtPath:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  FMSongAsset *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  void *v50;
  FlexSong *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  id v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_class();
  if (objc_msgSend_isSongAtPath_(v4, v5, (uint64_t)v3, v6, v7))
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend__pathToMetadata_(v8, v9, (uint64_t)v3, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v13, (uint64_t)v12, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v58 = 0;
      objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v16, (uint64_t)v17, 0, (uint64_t)&v58);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v58;
      if (v18)
      {
        objc_msgSend_objectForKey_(v18, v19, (uint64_t)CFSTR("contentVersion"), v20, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend_objectForKeyedSubscript_(v18, v24, (uint64_t)CFSTR("contentVersion"), v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend_integerValue(v27, v28, v29, v30, v31);

        }
        else
        {
          v32 = 1;
        }
        objc_msgSend_objectForKey_(v18, v24, (uint64_t)CFSTR("compatibilityVersion"), v25, v26);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend_objectForKeyedSubscript_(v18, v35, (uint64_t)CFSTR("compatibilityVersion"), v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend_integerValue(v38, v39, v40, v41, v42);

        }
        else
        {
          v43 = 1;
        }
        v44 = [FMSongAsset alloc];
        objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v45, (uint64_t)v3, v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)objc_msgSend_initWithAssetID_assetStatus_localURL_contentVersion_compatibilityVersion_(v44, v49, (uint64_t)CFSTR("FMSongBundleAssetID"), 0, (uint64_t)v48, v32, v43);

        v51 = [FlexSong alloc];
        v59[0] = v50;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v52, (uint64_t)v59, 1, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend_initWithDictionary_assets_(v51, v55, (uint64_t)v18, (uint64_t)v54, v56);

      }
      else
      {
        v33 = 0;
      }

    }
    else
    {
      v33 = 0;
    }

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

@end
