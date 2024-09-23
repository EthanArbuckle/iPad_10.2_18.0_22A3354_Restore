void _UIDocumentListControllerPresentOSAlert(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(_QWORD);
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  void (**v31)(_QWORD);
  id v32;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v32 = 0;
  objc_msgSend(a1, "getPromisedItemResourceValue:forKey:error:", &v32, *MEMORY[0x24BDBCD58], 0);
  v10 = v32;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
    {
      v13 = objc_msgSend(v11, "code");

      if (v13 == 3328)
      {
        v27 = (void *)MEMORY[0x24BDF67F0];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("A Newer Version of iOS is Needed to Edit this File"), CFSTR("A Newer Version of iOS is Needed to Edit this File"), CFSTR("Localizable"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Changes made to this document will not be available on any other devices. Open this document anyway?"), CFSTR("Changes made to this document will not be available on any other devices. Open this document anyway?"), CFSTR("Localizable"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:", v15, v17, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)MEMORY[0x24BDF67E8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Open"), CFSTR("Open"), CFSTR("Localizable"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = ___UIDocumentListControllerPresentOSAlert_block_invoke;
        v30[3] = &unk_24E43A9D8;
        v31 = v8;
        objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, v30);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addAction:", v22);

        v23 = (void *)MEMORY[0x24BDF67E8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = ___UIDocumentListControllerPresentOSAlert_block_invoke_2;
        v28[3] = &unk_24E43A9D8;
        v29 = v9;
        objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 1, v28);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addAction:", v26);

        objc_msgSend(v7, "presentViewController:animated:completion:", v18, 1, 0);
        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  if (v8)
    v8[2](v8);
LABEL_8:

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id BRFormatPhoneNumber(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  void *v8;
  id v9;
  _Unwind_Exception *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BE192B0], "countryCodeForNumber:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v3 = getCFPhoneNumberCreateSymbolLoc_ptr;
  v15 = getCFPhoneNumberCreateSymbolLoc_ptr;
  if (!getCFPhoneNumberCreateSymbolLoc_ptr)
  {
    v4 = (void *)PhoneNumbersLibrary();
    v3 = dlsym(v4, "CFPhoneNumberCreate");
    v13[3] = (uint64_t)v3;
    getCFPhoneNumberCreateSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v12, 8);
  if (!v3)
  {
    BRFormatPhoneNumber_cold_1();
    goto LABEL_12;
  }
  v5 = ((uint64_t (*)(_QWORD, id, void *))v3)(0, v1, v2);
  if (!v5)
  {
    v9 = v1;
    goto LABEL_10;
  }
  v6 = (const void *)v5;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v7 = getCFPhoneNumberCreateStringSymbolLoc_ptr;
  v15 = getCFPhoneNumberCreateStringSymbolLoc_ptr;
  if (!getCFPhoneNumberCreateStringSymbolLoc_ptr)
  {
    v8 = (void *)PhoneNumbersLibrary();
    v7 = dlsym(v8, "CFPhoneNumberCreateString");
    v13[3] = (uint64_t)v7;
    getCFPhoneNumberCreateStringSymbolLoc_ptr = v7;
  }
  _Block_object_dispose(&v12, 8);
  if (!v7)
  {
LABEL_12:
    v11 = (_Unwind_Exception *)BRFormatPhoneNumber_cold_1();
    _Block_object_dispose(&v12, 8);
    _Unwind_Resume(v11);
  }
  v9 = (id)((uint64_t (*)(_QWORD, const void *, uint64_t))v7)(0, v6, 5);
  CFRelease(v6);
LABEL_10:

  return v9;
}

uint64_t PhoneNumbersLibrary()
{
  uint64_t v0;
  void *v2;

  if (!PhoneNumbersLibraryCore_frameworkLibrary)
    PhoneNumbersLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = PhoneNumbersLibraryCore_frameworkLibrary;
  if (!PhoneNumbersLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id BRFormatModifiedAgoWithDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v1 = (void *)MEMORY[0x24BDBCE48];
  v2 = a1;
  objc_msgSend(v1, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:toDate:options:", 124, v2, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "year"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("modified %lu years ago"), CFSTR("modified %lu years ago"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "year");
  }
  else if (objc_msgSend(v5, "month"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("modified %lu months ago"), CFSTR("modified %lu months ago"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "month");
  }
  else if (objc_msgSend(v5, "day"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("modified %lu days ago"), CFSTR("modified %lu days ago"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "day");
  }
  else if (objc_msgSend(v5, "hour"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("modified %lu hours ago"), CFSTR("modified %lu hours ago"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "hour");
  }
  else
  {
    if (!objc_msgSend(v5, "minute"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("modified less than a minute ago"), CFSTR("modified less than a minute ago"), CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("modified %lu minutes ago"), CFSTR("modified %lu minutes ago"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "minute");
  }
  objc_msgSend(v6, "localizedStringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v10;
}

id cdui_default_log()
{
  if (cdui_default_log_once != -1)
    dispatch_once(&cdui_default_log_once, &__block_literal_global_0);
  return (id)cdui_default_log_logger;
}

void __cdui_default_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CloudDocsUI", "default");
  v1 = (void *)cdui_default_log_logger;
  cdui_default_log_logger = (uint64_t)v0;

}

id cdui_perf_log()
{
  if (cdui_perf_log_once != -1)
    dispatch_once(&cdui_perf_log_once, &__block_literal_global_3);
  return (id)cdui_perf_log_logger;
}

void __cdui_perf_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CloudDocsUI", "performance");
  v1 = (void *)cdui_perf_log_logger;
  cdui_perf_log_logger = (uint64_t)v0;

}

id BRCompareImages(void *a1, void *a2, _DWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  CGImage *v10;
  CGImage *v11;
  CGDataProvider *DataProvider;
  CFDataRef v13;
  CGDataProvider *v14;
  CFDataRef v15;
  size_t Width;
  size_t v17;
  void *v18;
  const __CFData *v19;
  id v20;
  size_t BitsPerPixel;
  size_t BitsPerComponent;
  size_t v23;
  size_t v24;
  CGBitmapInfo BitmapInfo;
  unint64_t v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t *v30;
  CGDataProvider *v31;
  CGColorSpace *ColorSpace;
  CGImageRef v33;
  id v35;
  _DWORD *v36;
  const __CFData *v37;
  const __CFData *v38;
  CFDataRef data;
  void *v40;
  uint64_t bytesPerRow;
  size_t v42;
  size_t v43;
  size_t height;
  uint64_t i;
  NSObject *v46;
  NSObject *group;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[13];
  int v52;
  int v53;
  CGBitmapInfo v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  int v58;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = objc_retainAutorelease(v5);
    v10 = (CGImage *)objc_msgSend(v9, "CGImage");
    v40 = v7;
    v11 = (CGImage *)objc_msgSend(objc_retainAutorelease(v7), "CGImage");
    DataProvider = CGImageGetDataProvider(v10);
    v13 = CGDataProviderCopyData(DataProvider);
    v14 = CGImageGetDataProvider(v11);
    v15 = CGDataProviderCopyData(v14);
    Width = CGImageGetWidth(v11);
    height = CGImageGetHeight(v11);
    v17 = height * Width;
    if (a3)
      *a3 = v17;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 4 * v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_retainAutorelease(v13);
    v50 = -[__CFData bytes](v19, "bytes");
    v38 = objc_retainAutorelease(v15);
    v49 = -[__CFData bytes](v38, "bytes");
    data = objc_retainAutorelease(v18);
    v48 = -[__CFData mutableBytes](data, "mutableBytes");
    v43 = CGImageGetBytesPerRow(v10);
    v42 = CGImageGetBytesPerRow(v11);
    v55 = 0;
    v56 = &v55;
    v57 = 0x3020000000;
    v58 = 0;
    v20 = objc_retainAutorelease(v9);
    v37 = v19;
    if (CGImageGetBitsPerComponent((CGImageRef)objc_msgSend(v20, "CGImage")) == 8)
    {
      v7 = v40;
      BitsPerPixel = CGImageGetBitsPerPixel(v10);
      BitsPerComponent = CGImageGetBitsPerComponent(v10);
      v36 = a3;
      v23 = CGImageGetBitsPerPixel(v11);
      v24 = BitsPerPixel / BitsPerComponent;
      if (BitsPerPixel / BitsPerComponent == v23 / CGImageGetBitsPerComponent(v11))
      {
        v35 = v5;
        BitmapInfo = CGImageGetBitmapInfo(v11);
        bytesPerRow = 4 * Width;
        group = dispatch_group_create();
        v46 = dispatch_queue_create("Image comparison queue", MEMORY[0x24BDAC9C0]);
        if (height)
        {
          for (i = 0; i != height; ++i)
          {
            if (Width)
            {
              LODWORD(v26) = 0;
              do
              {
                v51[0] = MEMORY[0x24BDAC760];
                if ((int)Width - (int)v26 >= 128)
                  v27 = 128;
                else
                  v27 = Width - v26;
                v51[1] = 3221225472;
                v51[2] = __BRCompareImages_block_invoke;
                v51[3] = &unk_24E43AA70;
                v52 = v26;
                v53 = v27;
                v51[6] = i * v43;
                v51[7] = v24;
                v51[8] = v49;
                v51[9] = i * v42;
                v51[10] = v48;
                v51[11] = i * bytesPerRow;
                v51[12] = 4;
                v54 = BitmapInfo;
                v51[4] = &v55;
                v51[5] = v50;
                v28 = (void *)MEMORY[0x2207C9E60](v51);
                v29 = (void *)objc_msgSend(v28, "copy");
                dispatch_group_async(group, v46, v29);

                v26 = (v27 + v26);
              }
              while (Width > v26);
            }
          }
        }
        dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
        v30 = v56;
        if (v36)
          *v36 = *((_DWORD *)v56 + 10);
        v5 = v35;
        v7 = v40;
        if (*((_DWORD *)v30 + 10))
        {
          v31 = CGDataProviderCreateWithCFData(data);
          ColorSpace = CGImageGetColorSpace((CGImageRef)objc_msgSend(objc_retainAutorelease(v20), "CGImage"));
          v33 = CGImageCreate(Width, height, 8uLL, 0x20uLL, bytesPerRow, ColorSpace, 3u, v31, 0, 0, kCGRenderingIntentDefault);
          objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v33);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          CFRelease(v33);
          CFRelease(v31);
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
      v7 = v40;
    }
    _Block_object_dispose(&v55, 8);

  }
  return v8;
}

void sub_21F510038(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

id BRSnapshotOfView(void *a1)
{
  id v1;
  CGFloat v2;
  CGFloat v3;
  void *v4;
  void *v5;
  CGSize v7;

  v1 = a1;
  objc_msgSend(v1, "bounds");
  v7.width = v2;
  v7.height = v3;
  UIGraphicsBeginImageContextWithOptions(v7, 1, 0.0);
  objc_msgSend(v1, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v5;
}

id BRLayerSnapshot(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)CAEncodeLayerTree();

  return v2;
}

void appendDescription(void *a1, void *a2, unint64_t a3)
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v6, "appendString:", CFSTR("\n"));
  if (a3)
  {
    v7 = 1;
    do
    {
      objc_msgSend(v6, "appendString:", CFSTR("   | "));
      ++v7;
    }
    while (v7 <= a3);
  }
  objc_msgSend(v5, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v8);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "subitems", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    v13 = a3 + 1;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        appendDescription(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), v6, v13);
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

uint64_t appendComparison(void *a1, void *a2, void *a3, unint64_t a4)
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  char v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  int v45;
  unint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  double size;
  CGPoint v58;
  CGPoint v59;
  CGSize v60;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v9, "appendString:", CFSTR("\n"));
  if (a4)
  {
    v10 = 1;
    do
    {
      objc_msgSend(v9, "appendString:", CFSTR("   | "));
      ++v10;
    }
    while (v10 <= a4);
  }
  objc_msgSend(v7, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v11);

  objc_msgSend(v7, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v7, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("\nName mismatch: %@ != %@\n"), v15, v16);

  }
  objc_msgSend(v7, "absoluteFrame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  size = v23;
  objc_msgSend(v8, "absoluteFrame");
  v26 = v25;
  v27 = v24;
  v29 = v28;
  v31 = v30;
  if (vabdd_f64(v18, v25) >= 0.00001 || vabdd_f64(v20, v24) >= 0.00001)
  {
    v58.x = v18;
    v58.y = v20;
    NSStringFromCGPoint(v58);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v59.x = v26;
    v59.y = v27;
    NSStringFromCGPoint(v59);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("\nOrigin mismatch: %@ != %@"), v33, v34);

    v32 = 1;
  }
  else
  {
    v32 = v14 ^ 1;
  }
  v35 = size;
  if (vabdd_f64(v22, v29) >= 0.00001 || vabdd_f64(size, v31) >= 0.00001)
  {
    v36 = v22;
    NSStringFromCGSize(*(CGSize *)(&v35 - 1));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v60.width = v29;
    v60.height = v31;
    NSStringFromCGSize(v60);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("\nSize mismatch: %@ != %@"), v37, v38);

    v32 = 1;
  }
  objc_msgSend(v7, "subitems");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "count");
  objc_msgSend(v8, "subitems");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "count");

  if (v40 != v42)
  {
    objc_msgSend(v7, "subitems");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subitems");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("\nSubitems don't match: %@ != %@"), v54, v55);

    goto LABEL_22;
  }
  if ((v32 & 1) != 0)
  {
LABEL_22:
    LOBYTE(v45) = 1;
    goto LABEL_23;
  }
  objc_msgSend(v7, "subitems");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count");

  v45 = 0;
  if (v44)
  {
    v46 = 0;
    v47 = a4 + 1;
    do
    {
      objc_msgSend(v7, "subitems");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectAtIndex:", v46);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "subitems");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectAtIndex:", v46);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v45 |= appendComparison(v49, v51, v9, v47);
      ++v46;
      objc_msgSend(v7, "subitems");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "count");

    }
    while (v46 < v53);
  }
LABEL_23:

  return v45 & 1;
}

void sub_21F513284(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F513328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21F513494(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_21F517C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F519F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_21F51C0E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F51C154(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F51C3D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21F51C610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21F51CEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F51E9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F51F62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MCProfileConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMCProfileConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void CDAddLocalizedSuffixForType(void *a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  v3 = CDAddLocalizedSuffixForType_onceToken;
  v4 = a2;
  v5 = a1;
  if (v3 != -1)
    dispatch_once(&CDAddLocalizedSuffixForType_onceToken, &__block_literal_global_7);
  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "setSuffix:", v5);

  objc_msgSend(v6, "setType:", v4);
  objc_msgSend((id)BRLocalizedStringSuffixesByType, "addObject:", v6);

}

id _CDAdaptLocalizedStringForItemType(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (id)BRLocalizedStringSuffixesByType;
  v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "appliesToType:", v7))
        {
          objc_msgSend(v12, "suffix");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v9 = (void *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v5, v9, (_QWORD)v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", v13, &stru_24E43B9D8, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "isEqualToString:", v13))
  {
    v16 = v6;

    v15 = v16;
  }

  return v15;
}

void sub_21F521834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_21F521BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F52794C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void _UIDocumentPickerDisplayModeChangedHandler(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  +[_UIDocumentPickerContainerViewController userDefaults](_UIDocumentPickerContainerViewController, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronize");

  objc_msgSend(v3, "displayModeChanged");
}

void sub_21F52C374(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_21F52D49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F52F2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F52F844(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t BRFormatPhoneNumber_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return +[_UIDocumentPickerURLContainerModel _tagColorsDidChange].cold.1(v0);
}

uint64_t __getMCProfileConnectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[_UIDocumentPickerViewServiceViewController _setUploadURL:].cold.1(v0);
}

uint64_t BRGetCloudEnabledStatusForAuditToken()
{
  return MEMORY[0x24BE17418]();
}

uint64_t BRPrimaryiCloudAccountCopyStatus()
{
  return MEMORY[0x24BE174C8]();
}

uint64_t CAEncodeLayerTree()
{
  return MEMORY[0x24BDE5420]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x24BDBDFC0]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE120](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x24BDBE168](provider);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x24BDBE638](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE668](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CPIsInternalDevice()
{
  return MEMORY[0x24BE04698]();
}

uint64_t FPExtendBookmarkForDocumentURL()
{
  return MEMORY[0x24BDC8060]();
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x24BDD0FE0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BDF6668]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x24BDF7700]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x24BDF7720]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x24BDF7C88]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x24BDF7CA0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BDF7D08]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x24BDC15A8](inUTI, inConformsToUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFURLCopyLogicalURLOfPromiseAtURL()
{
  return MEMORY[0x24BDBD0E0]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x24BDBD0F0]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x24BDBD108]();
}

uint64_t _UIGraphicsDrawIntoImageContextWithOptions()
{
  return MEMORY[0x24BDF8120]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __UIImageCacheKeyWithSentinel()
{
  return MEMORY[0x24BDF81F0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t sandbox_check()
{
  return MEMORY[0x24BDAFBD8]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

