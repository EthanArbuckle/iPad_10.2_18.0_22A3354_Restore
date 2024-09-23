@implementation QLItem(UI)

- (id)transformerClass
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  id result;
  NSObject **v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "generatedPreviewItemType"))
    v2 = objc_msgSend(a1, "generatedPreviewItemType");
  else
    v2 = objc_msgSend(a1, "previewItemType");
  switch(v2)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      objc_opt_class();
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        v6 = (NSObject **)MEMORY[0x24BE7BF48];
        QLSInitLogging();
        v3 = *v6;
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = v3;
        v7 = 134217984;
        v8 = objc_msgSend(a1, "previewItemType");
        _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_ERROR, "Unhandled item type %lu #PreviewItem", (uint8_t *)&v7, 0xCu);

      }
      result = 0;
      break;
  }
  return result;
}

- (id)previewItemPrintingViewControllerClassName
{
  uint64_t v2;
  NSObject **v3;
  NSObject *v4;
  objc_class *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "previewItemType");
  if (v2 != 6 && v2 != 4)
  {
    v3 = (NSObject **)MEMORY[0x24BE7BF48];
    v4 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = a1;
      _os_log_impl(&dword_20D4F5000, v4, OS_LOG_TYPE_ERROR, "Unknown preview item type in -previewItemViewControllerClassName: for preview item %@ #PreviewItem", (uint8_t *)&v7, 0xCu);
    }
  }
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)previewItemViewControllerClassName
{
  uint64_t v2;

  if (objc_msgSend(a1, "generatedPreviewItemType"))
    v2 = objc_msgSend(a1, "generatedPreviewItemType");
  else
    v2 = objc_msgSend(a1, "previewItemType");
  return objc_msgSend(a1, "previewItemViewControllerClassNameForType:", v2);
}

- (__CFString)previewItemViewControllerClassNameForType:()UI
{
  __CFString *v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  objc_class *v9;
  NSObject **v10;
  NSObject **v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("QLPDFItemViewController");
  switch(a3)
  {
    case 1:
      objc_msgSend(a1, "UTIAnalyzer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "isAudioOnly");

      goto LABEL_20;
    case 2:
      if ((objc_msgSend(a1, "canBeEdited") & 1) == 0 && !objc_msgSend(a1, "editingMode"))
        goto LABEL_20;
      return CFSTR("QLImageItemAggregatedViewController");
    case 3:
    case 4:
    case 5:
    case 7:
    case 12:
    case 13:
    case 14:
      goto LABEL_20;
    case 6:
      return CFSTR("QLWebItemAggregatedViewController");
    case 8:
      return CFSTR("QLVCFItemViewController");
    case 9:
      return CFSTR("QLICSItemViewController");
    case 10:
      return CFSTR("QLZipItemViewController");
    case 11:
      return v4;
    case 15:
      v5 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        v11 = (NSObject **)MEMORY[0x24BE7BF48];
        QLSInitLogging();
        v5 = *v11;
      }
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v12 = 138412290;
      v13 = a1;
      v6 = "Unsupported preview item type in -previewItemViewControllerClassName: for preview item %@ #PreviewItem";
      goto LABEL_15;
    default:
      v5 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        v10 = (NSObject **)MEMORY[0x24BE7BF48];
        QLSInitLogging();
        v5 = *v10;
      }
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v12 = 138412290;
      v13 = a1;
      v6 = "Unknown preview item type in -previewItemViewControllerClassName: for preview item %@ #PreviewItem";
LABEL_15:
      _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v12, 0xCu);
LABEL_20:
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v4;
  }
}

- (double)imageRawSizeOfContents:()UI withPreviewItemType:imageIsAnimated:
{
  id v7;
  CGImageSource *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFURL *v15;
  const __CFDictionary *v16;
  const __CFNumber *Value;
  const __CFNumber *v18;
  const __CFNumber *v19;
  uint64_t v20;
  double v21;
  NSObject **v22;
  NSObject *v23;
  NSObject **v24;
  NSObject *v25;
  int v27;
  uint64_t v28;
  _BYTE valuePtr[24];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(a1, "previewItemType") == 3)
      {
        gotLoadHelper_x8__OBJC_CLASS___PFVideoComplement(v9);
        v11 = (void *)objc_msgSend(objc_alloc(*(Class *)(v10 + 1144)), "initWithBundleAtURL:", v7);
        objc_msgSend(v11, "imagePath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = (void *)MEMORY[0x24BDBCF48];
          objc_msgSend(v11, "imagePath");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "fileURLWithPath:", v14);
          v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v22 = (NSObject **)MEMORY[0x24BE7BF48];
          v23 = *MEMORY[0x24BE7BF48];
          if (!*MEMORY[0x24BE7BF48])
          {
            QLSInitLogging();
            v23 = *v22;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)valuePtr = 138412290;
            *(_QWORD *)&valuePtr[4] = v7;
            _os_log_impl(&dword_20D4F5000, v23, OS_LOG_TYPE_INFO, "Could not generate a PFVideoComplement from the given url: %@ #PreviewItem", valuePtr, 0xCu);
          }
          v15 = 0;
        }

        if (!v15)
          goto LABEL_28;
      }
      else
      {
        v15 = (const __CFURL *)v7;
        if (!v15)
        {
LABEL_28:
          v24 = (NSObject **)MEMORY[0x24BE7BF48];
          v25 = *MEMORY[0x24BE7BF48];
          if (!*MEMORY[0x24BE7BF48])
          {
            QLSInitLogging();
            v25 = *v24;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)valuePtr = 0;
            _os_log_impl(&dword_20D4F5000, v25, OS_LOG_TYPE_INFO, "Returning a CGSizeZero size for imageRawSizeOfContents:withPreviewItemType: because no URL could be used to determine the size of the preview item. #PreviewItem", valuePtr, 2u);
          }
          goto LABEL_32;
        }
      }
      v8 = CGImageSourceCreateWithURL(v15, 0);

      if (v8)
        goto LABEL_10;
    }
LABEL_32:
    v21 = *MEMORY[0x24BDBF148];
    goto LABEL_33;
  }
  v8 = CGImageSourceCreateWithData((CFDataRef)v7, 0);
  if (!v8)
    goto LABEL_32;
LABEL_10:
  if (a5)
    *a5 = CGImageSourceGetCount(v8) > 1;
  v28 = 0;
  *(_QWORD *)valuePtr = 0;
  v16 = CGImageSourceCopyPropertiesAtIndex(v8, 0, 0);
  CFRelease(v8);
  if (v16)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(v16, (const void *)*MEMORY[0x24BDD96C8]);
    if (Value)
      CFNumberGetValue(Value, kCFNumberCGFloatType, valuePtr);
    v18 = (const __CFNumber *)CFDictionaryGetValue(v16, (const void *)*MEMORY[0x24BDD96C0]);
    if (v18)
      CFNumberGetValue(v18, kCFNumberCGFloatType, &v28);
    v19 = (const __CFNumber *)CFDictionaryGetValue(v16, (const void *)*MEMORY[0x24BDD9698]);
    if (v19)
    {
      v27 = 0;
      CFNumberGetValue(v19, kCFNumberIntType, &v27);
      if (v27 >= 5)
      {
        v20 = v28;
        v28 = *(_QWORD *)valuePtr;
        *(_QWORD *)valuePtr = v20;
      }
    }
    CFRelease(v16);
    v21 = *(double *)valuePtr;
  }
  else
  {
    v21 = 0.0;
  }
LABEL_33:

  return v21;
}

- (double)previewSizeForItemViewControllerSize:()UI
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  double v19;
  double v20;
  double v22;
  double v23;
  double v25;
  char isKindOfClass;
  id v27;
  void *v28;
  void *v29;
  double v30;
  NSObject **v32;
  char v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fetcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchedContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_35;
  if (objc_msgSend(a1, "previewItemType") != 2 && objc_msgSend(a1, "previewItemType") != 3)
  {
    if (objc_msgSend(a1, "previewItemType") == 1)
    {
      objc_msgSend(a1, "UTIAnalyzer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isAudioOnly"))
      {

      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v27 = objc_alloc(MEMORY[0x24BDB26C8]);
          v34 = *MEMORY[0x24BDB21E0];
          v35 = &unk_24C7493A8;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v27, "initWithURL:options:", v7, v28);

          objc_msgSend(v29, "ql_imageSizeOfFirstVideoTrack");
          QLAdaptSizeToRect();
          v10 = v30;

          goto LABEL_36;
        }
      }
    }
LABEL_35:
    v10 = *MEMORY[0x24BDBF148];
    goto LABEL_36;
  }
  v33 = 0;
  objc_msgSend(a1, "imageRawSizeOfContents:withPreviewItemType:imageIsAnimated:", v7, objc_msgSend(a1, "previewItemType"), &v33);
  v10 = *MEMORY[0x24BDBF148];
  if (v8 == *MEMORY[0x24BDBF148] && v9 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v17 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      v32 = (NSObject **)MEMORY[0x24BE7BF48];
      QLSInitLogging();
      v17 = *v32;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v37 = a1;
      v38 = 2112;
      v39 = v7;
      _os_log_impl(&dword_20D4F5000, v17, OS_LOG_TYPE_INFO, "Could not determine preview size of contents %@ %@ #PreviewItem", buf, 0x16u);
    }
  }
  else
  {
    v12 = v8;
    v13 = v9;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    v16 = v15;

    if (QLImageWithSizeShouldNotBeScaled())
    {
      v10 = v12 / v16;
    }
    else
    {
      if (v33)
        QLGetScaleForAnimatedImageWithSize();
      else
        v19 = 1.0;
      v10 = v12 / v19;
      v20 = v13 / v19;
      if (v12 / v19 > a2 || v20 > a3)
      {
        QLAdaptSizeToRect();
        v10 = v22;
        v20 = v23;
      }
      if ((!objc_msgSend(a1, "canBeEdited") || v33) && v10 < a2 * 0.75 && v20 < a3 * 0.75)
      {
        QLAdaptSizeToRect();
        v10 = v25;
      }
    }
  }
LABEL_36:

  return v10;
}

- (uint64_t)shouldUseRemoteViewController
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject **v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "previewItemContentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  switch(objc_msgSend(a1, "previewItemType"))
  {
    case 1:
    case 5:
      v3 = objc_msgSend(MEMORY[0x24BE7BFA0], "shouldBeRemoteForMediaContentType:", v2);
      break;
    case 2:
      if ((objc_msgSend(a1, "canBeEdited") & 1) != 0)
        goto LABEL_2;
      v3 = objc_msgSend(a1, "editingMode") != 0;
      break;
    case 3:
    case 7:
    case 12:
    case 14:
      break;
    case 4:
    case 6:
    case 8:
    case 9:
    case 10:
    case 11:
    case 13:
LABEL_2:
      v3 = 1;
      break;
    default:
      v4 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        v7 = (NSObject **)MEMORY[0x24BE7BF48];
        QLSInitLogging();
        v4 = *v7;
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = v4;
        v8 = 134218242;
        v9 = objc_msgSend(a1, "previewItemType");
        v10 = 2112;
        v11 = v2;
        _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_ERROR, "Unhandled item type %lu: contentType is: %@ #PreviewItem", (uint8_t *)&v8, 0x16u);

      }
      v3 = 0;
      break;
  }

  return v3;
}

+ (uint64_t)shouldUseRemoteCollection:()UI
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = a3;
  if (objc_msgSend(v3, "numberOfItems"))
  {
    v4 = 0;
    v5 = MEMORY[0x24BDAC760];
    do
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x3032000000;
      v12 = __Block_byref_object_copy__5;
      v13 = __Block_byref_object_dispose__5;
      v14 = 0;
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __40__QLItem_UI__shouldUseRemoteCollection___block_invoke;
      v8[3] = &unk_24C724C10;
      v8[4] = &v9;
      objc_msgSend(v3, "previewItemAtIndex:withCompletionHandler:", v4, v8);
      v6 = objc_msgSend((id)v10[5], "shouldUseRemoteViewController");
      _Block_object_dispose(&v9, 8);

      if ((_DWORD)v6)
        break;
      ++v4;
    }
    while (objc_msgSend(v3, "numberOfItems") > v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)canBePrintedWithCustomPrinter
{
  return (objc_msgSend(a1, "previewItemType") & 0xFFFFFFFFFFFFFFFDLL) == 4;
}

+ (uint64_t)openInTypeForItem:()UI appIsContentManaged:
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  int v11;

  v3 = a3;
  _QLGetOpenInAppClaimBindingForItem(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "editedCopy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_3;
    objc_msgSend(v3, "fpItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7
      || (objc_msgSend(v3, "previewItemURL"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9)
      && (objc_msgSend(v3, "previewItemURL"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "_QLNeedsCoordination"),
          v10,
          v11))
    {
      v6 = 1;
    }
    else
    {
LABEL_3:
      v6 = 2;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)defaultWhitePointAdaptivityStyle
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "previewItemType");
  if ((unint64_t)(v2 - 2) < 2)
    return 2;
  if (v2 == 4)
    return 1;
  if (v2 != 1)
    return 0;
  objc_msgSend(a1, "UTIAnalyzer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAudioOnly"))
    v4 = 0;
  else
    v4 = 3;

  return v4;
}

- (double)preferredContentSizeForOrbPlatterWithURL:()UI
{
  id v4;
  double v5;
  double v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(a1, "previewItemType") == 2 || objc_msgSend(a1, "previewItemType") == 3)
  {
    objc_msgSend(a1, "imageRawSizeOfContents:withPreviewItemType:imageIsAnimated:", v4, objc_msgSend(a1, "previewItemType"), 0);
    v6 = v5;
  }
  else if (objc_msgSend(a1, "previewItemType") == 1
         && (objc_msgSend(a1, "UTIAnalyzer"),
             v7 = (void *)objc_claimAutoreleasedReturnValue(),
             v8 = objc_msgSend(v7, "isAudioOnly"),
             v7,
             (v8 & 1) == 0))
  {
    v9 = objc_alloc(MEMORY[0x24BDB26C8]);
    v14 = *MEMORY[0x24BDB21E0];
    v15[0] = &unk_24C7493A8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithURL:options:", v4, v10);

    objc_msgSend(v11, "ql_imageSizeOfFirstVideoTrack");
    v6 = v12;

  }
  else
  {
    v6 = *MEMORY[0x24BDBF148];
  }

  return v6;
}

@end
