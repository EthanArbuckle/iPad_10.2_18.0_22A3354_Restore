@implementation CKWalletMediaObjectMetadataHandler

+ (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4 presentationProperties:(id)a5
{
  double height;
  double width;
  objc_class *v7;
  id v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  CGSize v15;

  height = a3.height;
  width = a3.width;
  v7 = (objc_class *)MEMORY[0x1E0CC11C8];
  v8 = a5;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithPresentationProperties:URL:", v8, 0);

  objc_msgSend(v9, "_setApplyCornerRadius:", 0);
  objc_msgSend(v9, "_setAction:withText:buttonType:", 0, &stru_1E276D870, 1);
  objc_msgSend(v9, "layoutIfNeeded");
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, width, height);
  objc_msgSend(v9, "layoutIfNeeded");
  objc_msgSend(v9, "bounds");
  v15.width = v10;
  v15.height = v11;
  UIGraphicsBeginImageContextWithOptions(v15, 0, 0.0);
  objc_msgSend(v9, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v13;
}

+ (id)previewMetadataWithContentsOfURL:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (objc_class *)MEMORY[0x1E0C99D50];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithContentsOfURL:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
    }
    else
    {
      _IMWarn();
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D38CA0], 13, 0);
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D38CA0], 11, 0);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)writePreviewMetadata:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;
    if (v9)
    {
      objc_msgSend(v8, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 1;
      v13 = objc_msgSend(v9, "writeToFile:atomically:", v11, 1);

      if ((v13 & 1) != 0)
      {
LABEL_15:

        goto LABEL_17;
      }
      if (_IMWillLog())
      {
        objc_msgSend(v8, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _IMAlwaysLog();

      }
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D38CA0], 9, 0);
        v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else
    {
      if (_IMWillLog())
        _IMAlwaysLog();
      if (a5)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = *MEMORY[0x1E0D38CA0];
        v20 = *MEMORY[0x1E0CB3388];
        v21[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 13, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v12 = 0;
    goto LABEL_15;
  }
  _IMWarn();
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D38CA0], 13, 0);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_17:

  return v12;
}

+ (id)paddedImage:(id)a3 horizontalPadding:(double)a4 verticalPadding:(double)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  double v19;
  double v20;

  v7 = a3;
  objc_msgSend(v7, "size");
  v9 = v8 + a4 * 2.0;
  objc_msgSend(v7, "size");
  v11 = v10 + a5 * 2.0;
  objc_msgSend(MEMORY[0x1E0CEA618], "preferredFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  objc_msgSend(v12, "setScale:");
  objc_msgSend(v12, "setOpaque:", 0);
  objc_msgSend(v12, "setPreferredRange:", 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:format:", v12, v9, v11);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__CKWalletMediaObjectMetadataHandler_paddedImage_horizontalPadding_verticalPadding___block_invoke;
  v17[3] = &unk_1E2750638;
  v18 = v7;
  v19 = a4;
  v20 = a5;
  v14 = v7;
  objc_msgSend(v13, "imageWithActions:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __84__CKWalletMediaObjectMetadataHandler_paddedImage_horizontalPadding_verticalPadding___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

+ (id)replyPreviewIconFromFullImage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CEA610]);
  objc_msgSend(v3, "size");
  v5 = (void *)objc_msgSend(v4, "initWithSize:");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__CKWalletMediaObjectMetadataHandler_replyPreviewIconFromFullImage___block_invoke;
  v9[3] = &unk_1E274A3D0;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "imageWithActions:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __68__CKWalletMediaObjectMetadataHandler_replyPreviewIconFromFullImage___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "size");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "size");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "size");
  objc_msgSend(MEMORY[0x1E0CEA390], "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, 0.0, 0.0, v3, v5, fmin(v6, v7) * 0.0416666667);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addClip");
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, v3, v5);

}

+ (id)colorFromDictionaryRepresentation:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = (void *)MEMORY[0x1E0CEA478];
  v5 = *MEMORY[0x1E0D395C8];
  v6 = a3;
  objc_msgSend(a1, "colorValueForKey:inDictionary:", v5, v6);
  v8 = v7;
  objc_msgSend(a1, "colorValueForKey:inDictionary:", *MEMORY[0x1E0D395C0], v6);
  v10 = v9;
  objc_msgSend(a1, "colorValueForKey:inDictionary:", *MEMORY[0x1E0D395B8], v6);
  v12 = v11;
  objc_msgSend(a1, "colorValueForKey:inDictionary:", *MEMORY[0x1E0D395B0], v6);
  v14 = v13;

  return (id)objc_msgSend(v4, "colorWithRed:green:blue:alpha:", v8, v10, v12, v14);
}

+ (id)dictionaryRepresentationForText:(id)a3 color:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  __CFDictionary *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = (__CFDictionary *)objc_alloc_init(v7);
  v10 = v6;
  if (v10)
  {
    CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E0D39608], v10);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:color:].cold.2();
  }

  objc_msgSend(a1, "colorDictionaryFromColor:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E0D39600], v11);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:color:].cold.1();
  }

  return v9;
}

+ (id)dictionaryRepresentationForText:(id)a3 optionalColor:(id)a4
{
  id v6;
  id v7;
  __CFDictionary *v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = v6;
  if (v9)
  {
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D39608], v9);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:color:].cold.2();
  }

  if (v7)
  {
    objc_msgSend(a1, "colorDictionaryFromColor:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0D39600], v10);

  }
  return v8;
}

+ (id)colorDictionaryFromColor:(id)a3
{
  __CFDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v9;
  double v10;
  double v11;
  double v12;

  v11 = 0.0;
  v12 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E0D395C8], v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler colorDictionaryFromColor:].cold.4();
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E0D395C0], v5);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler colorDictionaryFromColor:].cold.3();
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E0D395B8], v6);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler colorDictionaryFromColor:].cold.2();
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    CFDictionarySetValue(v3, (const void *)*MEMORY[0x1E0D395B0], v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    +[CKWalletMediaObjectMetadataHandler colorDictionaryFromColor:].cold.1();
  }

  return v3;
}

+ (double)colorValueForKey:(id)a3 inDictionary:(id)a4
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = 1.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "doubleValue");
    v5 = v6;
  }

  return v5;
}

+ (void)dictionaryRepresentationForText:color:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_18DFCD000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

+ (void)dictionaryRepresentationForText:color:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_18DFCD000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

+ (void)colorDictionaryFromColor:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_18DFCD000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

+ (void)colorDictionaryFromColor:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_18DFCD000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

+ (void)colorDictionaryFromColor:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_18DFCD000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

+ (void)colorDictionaryFromColor:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_6(&dword_18DFCD000, MEMORY[0x1E0C81028], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
