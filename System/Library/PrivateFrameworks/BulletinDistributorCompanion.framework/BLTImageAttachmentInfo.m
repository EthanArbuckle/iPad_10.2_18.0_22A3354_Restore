@implementation BLTImageAttachmentInfo

+ (id)imageAttachmentInfoForImageURL:(id)a3
{
  const __CFURL *v3;
  void *v4;
  void *v5;
  CGImageSourceRef v6;
  CGImageSource *v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v3 = (const __CFURL *)a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentType:", v5);

  v6 = CGImageSourceCreateWithURL(v3, 0);
  if (v6)
  {
    v7 = v6;
    v29 = *MEMORY[0x24BDD97D0];
    v30[0] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, v8);
    if (v9)
    {
      v10 = v9;
      CFDictionaryGetValue(v9, (const void *)*MEMORY[0x24BDD9630]);
      v11 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject BOOLValue](v11, "BOOLValue") & 1) == 0)
      {
        objc_msgSend((id)*MEMORY[0x24BDF8438], "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setContentType:", v12);

      }
      CFDictionaryGetValue(v10, (const void *)*MEMORY[0x24BDD96C0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryGetValue(v10, (const void *)*MEMORY[0x24BDD96C8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSize:", (double)(int)objc_msgSend(v14, "intValue"), (double)(int)objc_msgSend(v13, "intValue"));
      CFRelease(v10);
      CFRelease(v7);
      v15 = v4;

    }
    else
    {
      blt_ids_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[BLTImageAttachmentInfo imageAttachmentInfoForImageURL:].cold.2((uint64_t)v3, v11, v22, v23, v24, v25, v26, v27);
      v15 = 0;
    }

  }
  else
  {
    blt_ids_log();
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      +[BLTImageAttachmentInfo imageAttachmentInfoForImageURL:].cold.1((uint64_t)v3, v8, v16, v17, v18, v19, v20, v21);
    v15 = 0;
  }

  return v15;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
}

+ (void)imageAttachmentInfoForImageURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, a2, a3, "BLTImageAttachmentInfo CGImageSourceCreateWithURL failed for: %@", a5, a6, a7, a8, 2u);
}

+ (void)imageAttachmentInfoForImageURL:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2173D9000, a2, a3, "BLTImageAttachmentInfo CGImageSourceCopyPropertiesAtIndex failed for: %@", a5, a6, a7, a8, 2u);
}

@end
