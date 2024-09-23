void FAUIInitLogging()
{
  if (FAUIInitLogging_once != -1)
    dispatch_once(&FAUIInitLogging_once, &__block_literal_global);
}

id FAUICreateTempFileURLInTemporaryDirectory(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = (void *)MEMORY[0x24BDD1880];
  v3 = a1;
  objc_msgSend(v2, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("temp_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id FAUICreateTemporaryFolderURLAppropriateForURL(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v1 = (void *)MEMORY[0x24BDD1580];
  v2 = a1;
  objc_msgSend(v1, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v3, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v2, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (!v4)
  {
    v6 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      if (FAUIInitLogging_once != -1)
        dispatch_once(&FAUIInitLogging_once, &__block_literal_global);
      v6 = fauiLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      FAUICreateTemporaryFolderURLAppropriateForURL_cold_1((uint64_t)v5, v6);
  }

  return v4;
}

void FAUICreatePDFFromDocumentURLs(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = dispatch_queue_create("com.apple.FilesActionsUI.queue.CreatePDF", v6);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __FAUICreatePDFFromDocumentURLs_block_invoke;
  v10[3] = &unk_24F9EC7E0;
  v11 = v3;
  v12 = v4;
  v8 = v4;
  v9 = v3;
  dispatch_async(v7, v10);

}

void _FAUICreatePDFFromDocumentURLs(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id obj;
  _QWORD block[4];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (!objc_msgSend(v3, "count"))
    goto LABEL_28;
  v25 = v4;
  v5 = objc_alloc_init((Class)getPDFDocumentClass());
  v6 = objc_alloc_init(MEMORY[0x24BDD1570]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v3;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v42;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v12);
        v40 = 0;
        v35[0] = v9;
        v35[1] = 3221225472;
        v35[2] = ___FAUICreatePDFFromDocumentURLs_block_invoke;
        v35[3] = &unk_24F9EC808;
        v36 = 0;
        v37 = v13;
        v38 = v5;
        v39 = v7;
        objc_msgSend(v6, "coordinateReadingItemAtURL:options:error:byAccessor:", v13, 0, &v40, v35);
        v14 = v40;

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v10);
  }
  _NewDocumentFileName(obj);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateTemporaryPDFFileURL(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "pageCount"))
  {
    v18 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v18 = fauiLogHandle;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      _FAUICreatePDFFromDocumentURLs_cold_1(v18);
    goto LABEL_19;
  }
  if ((objc_msgSend(v5, "writeToURL:", v16) & 1) == 0)
  {
    v17 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v17 = fauiLogHandle;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      _FAUICreatePDFFromDocumentURLs_cold_2();
LABEL_19:

    v16 = 0;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v19 = v7;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v32;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(v19);
        _CleanupTemporaryImage(*(void **)(*((_QWORD *)&v31 + 1) + 8 * v23++));
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    }
    while (v21);
  }

  block[0] = v9;
  block[1] = 3221225472;
  block[2] = ___FAUICreatePDFFromDocumentURLs_block_invoke_4;
  block[3] = &unk_24F9EC830;
  v4 = v25;
  v29 = v16;
  v30 = v25;
  v24 = v16;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  v3 = v26;
LABEL_28:

}

id getPDFDocumentClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPDFDocumentClass_softClass;
  v7 = getPDFDocumentClass_softClass;
  if (!getPDFDocumentClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPDFDocumentClass_block_invoke;
    v3[3] = &unk_24F9EC898;
    v3[4] = &v4;
    __getPDFDocumentClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22E115358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _SortedFileURLsUsingStandardSort(void *a1, const char *a2)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:", &__block_literal_global_0);
}

const __CFURL *_AppendImageToDocument(void *a1, void *a2)
{
  id v3;
  id v4;
  const __CFURL *v5;
  const __CFURL *v6;
  CGImageSourceRef v7;
  CGImageSourceRef v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  CGRect v19;
  CGRect v20;

  v3 = a1;
  v4 = a2;
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = 612.0;
  v19.size.height = 792.0;
  v20 = CGRectInset(v19, 30.0, 30.0);
  _DownsampleImage(v3, v20.size.width, v20.size.height);
  v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = CGImageSourceCreateWithURL(v5, 0);
    if (v7)
    {
      v8 = v7;
      v15 = 0;
      v16 = &v15;
      v17 = 0x2050000000;
      v9 = (void *)getPDFPageClass_softClass;
      v18 = getPDFPageClass_softClass;
      if (!getPDFPageClass_softClass)
      {
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __getPDFPageClass_block_invoke;
        v14[3] = &unk_24F9EC898;
        v14[4] = &v15;
        __getPDFPageClass_block_invoke((uint64_t)v14);
        v9 = (void *)v16[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v15, 8);
      v11 = (void *)objc_msgSend([v10 alloc], "initWithImageSource:", v8);
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "setBounds:forBox:", 0, 0.0, 0.0, 612.0, 792.0);
        objc_msgSend(v12, "setBounds:forBox:", 1, 0.0, 0.0, 612.0, 792.0);
        objc_msgSend(v4, "insertPage:atIndex:", v12, objc_msgSend(v4, "pageCount"));
      }
      CFRelease(v8);

    }
    if (-[__CFURL isEqual:](v6, "isEqual:", v3))
    {

      v6 = 0;
    }
  }

  return v6;
}

void sub_22E115720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _AppendDocumentToDocument(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a1;
  v3 = a2;
  v4 = objc_msgSend(v8, "pageCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v8, "pageAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "insertPage:atIndex:", v7, objc_msgSend(v3, "pageCount"));

    }
  }

}

id _CreateTemporaryPDFFileURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v3);
  return v4;
}

id _NewDocumentFileName(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = (id)objc_msgSend(a1, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v2 = objc_msgSend(v1, "count");
  objc_msgSend(v1, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.pdf"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _FormattedDate(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@.pdf"), v5, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void _CleanupTemporaryImage(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;

  v1 = (void *)MEMORY[0x24BDD1580];
  v2 = a1;
  objc_msgSend(v1, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v3, "removeItemAtURL:error:", v2, &v6);

  v4 = v6;
  if (v4)
  {
    v5 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v5 = fauiLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      _CleanupTemporaryImage_cold_1();
  }

}

id _DownsampleImage(void *a1, double a2, double a3)
{
  const __CFURL *v5;
  void *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  CFDictionaryRef v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  double v14;
  float v15;
  float v16;
  double v17;
  double v18;
  const __CFString *Type;
  uint64_t v20;
  CGImageDestinationRef v21;
  CGImageDestination *v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFDictionary *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  const __CFURL *v31;
  NSObject *v32;
  NSObject *v33;
  _QWORD v35[4];
  _QWORD v36[5];

  v36[4] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  _CreateTemporaryImageFileURL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = CGImageSourceCreateWithURL(v5, 0);
    if (v7)
    {
      v8 = v7;
      v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
      -[__CFDictionary valueForKey:](v9, "valueForKey:", *MEMORY[0x24BDD96C8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFDictionary valueForKey:](v9, "valueForKey:", *MEMORY[0x24BDD96C0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v13 = v12;
      v14 = v12;
      objc_msgSend(v11, "floatValue");
      v16 = v15;
      v17 = v15;
      v18 = a2 / v14;
      if (a2 >= v14)
        v18 = 1.0;
      if (v18 * v17 > a3)
        v18 = a3 / v17;
      if (v18 == 1.0)
      {
        v30 = fauiLogHandle;
        if (!fauiLogHandle)
        {
          FAUIInitLogging();
          v30 = fauiLogHandle;
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          _DownsampleImage_cold_5();
        v31 = v5;

        v6 = v31;
      }
      else
      {
        Type = CGImageSourceGetType(v8);
        if (Type)
        {
          v20 = (uint64_t)Type;
          v21 = CGImageDestinationCreateWithURL((CFURLRef)v6, Type, 1uLL, 0);
          if (v21)
          {
            v22 = v21;
            v35[0] = *MEMORY[0x24BDD9218];
            if (v13 >= v16)
              v23 = v14;
            else
              v23 = v17;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = *MEMORY[0x24BDD97D0];
            v36[0] = v24;
            v36[1] = MEMORY[0x24BDBD1C0];
            v26 = *MEMORY[0x24BDD9788];
            v35[1] = v25;
            v35[2] = v26;
            v35[3] = *MEMORY[0x24BDD9820];
            v36[2] = MEMORY[0x24BDBD1C8];
            v36[3] = MEMORY[0x24BDBD1C8];
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
            v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

            CGImageDestinationAddImageFromSource(v22, v8, 0, v27);
            if (!CGImageDestinationFinalize(v22))
            {

              v28 = fauiLogHandle;
              if (!fauiLogHandle)
              {
                FAUIInitLogging();
                v28 = fauiLogHandle;
              }
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                _DownsampleImage_cold_4(v20, v28);
              v6 = 0;
            }
            CFRelease(v22);

          }
          else
          {
            v33 = fauiLogHandle;
            if (!fauiLogHandle)
            {
              FAUIInitLogging();
              v33 = fauiLogHandle;
            }
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              _DownsampleImage_cold_3();
          }
        }
        else
        {
          v32 = fauiLogHandle;
          if (!fauiLogHandle)
          {
            FAUIInitLogging();
            v32 = fauiLogHandle;
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            _DownsampleImage_cold_2();
        }
      }
      CFRelease(v8);

    }
    else
    {
      v29 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        v29 = fauiLogHandle;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        _DownsampleImage_cold_1();
    }
  }

  return v6;
}

id _CreateTemporaryImageFileURL()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  NSTemporaryDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathExtension:", CFSTR("jpeg"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v4);
  return v5;
}

id _FormattedDate(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd' at 'h.mm.ss a"));
  objc_msgSend(v2, "stringFromDate:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

Class __getPDFDocumentClass_block_invoke(uint64_t a1)
{
  Class result;

  PDFKitLibrary();
  result = objc_getClass("PDFDocument");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPDFDocumentClass_block_invoke_cold_1();
  getPDFDocumentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void PDFKitLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!PDFKitLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_24F9EC8B8;
    v2 = 0;
    PDFKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PDFKitLibraryCore_frameworkLibrary)
    PDFKitLibrary_cold_1(&v0);
}

Class __getPDFPageClass_block_invoke(uint64_t a1)
{
  Class result;

  PDFKitLibrary();
  result = objc_getClass("PDFPage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPDFPageClass_block_invoke_cold_1();
  getPDFPageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void FAUIRotateMovies(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id obj;
  void *v24;
  _QWORD block[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  uint64_t v34;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v21 = a3;
  v5 = (void *)objc_opt_new();
  v6 = objc_alloc_init(MEMORY[0x24BDD1710]);
  objc_msgSend(v6, "setQualityOfService:", 25);
  v24 = v6;
  objc_msgSend(v6, "setName:", CFSTR("RotateReaderWriterQueue"));
  v7 = dispatch_group_create();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v11);
        dispatch_group_enter(v7);
        v13 = objc_alloc_init(MEMORY[0x24BDD1570]);
        objc_msgSend(MEMORY[0x24BDD1568], "readingIntentWithURL:options:", v12, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v12, "startAccessingSecurityScopedResource");
        v40 = v14;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __FAUIRotateMovies_block_invoke;
        v28[3] = &unk_24F9EC928;
        v29 = v5;
        v30 = v12;
        v35 = v15;
        v31 = v7;
        v32 = v14;
        v33 = v13;
        v34 = a2;
        v17 = v13;
        v18 = v14;
        objc_msgSend(v17, "coordinateAccessWithIntents:queue:byAccessor:", v16, v24, v28);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v9);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __FAUIRotateMovies_block_invoke_12;
  block[3] = &unk_24F9EC830;
  v26 = v5;
  v27 = v21;
  v19 = v5;
  v20 = v21;
  dispatch_group_notify(v7, MEMORY[0x24BDAC9B8], block);

}

void _FAUIRotateMovie(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  void (**v8)(id, uint64_t, void *);
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v31;

  v7 = a1;
  v8 = a4;
  v9 = a2;
  v10 = objc_msgSend(v7, "startAccessingSecurityScopedResource");
  objc_msgSend(MEMORY[0x24BDB25C0], "movieWithURL:options:", v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tracksWithMediaType:", *MEMORY[0x24BDB1D50]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 4.71238898;
  if (a3 != 1)
    v14 = 0.0;
  if (a3)
    v15 = v14;
  else
    v15 = 1.57079633;
  if (v13)
    objc_msgSend(v13, "preferredTransform", v14);
  else
    memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeRotation(&t2, v15);
  CGAffineTransformConcat(&v31, &t1, &t2);
  objc_msgSend(v13, "setPreferredTransform:", &v31);
  v16 = *MEMORY[0x24BDB1C40];
  v28 = 0;
  v17 = objc_msgSend(v11, "writeMovieHeaderToURL:fileType:options:error:", v9, v16, 0, &v28);

  v18 = v28;
  if (v18)
  {
    v19 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v19 = fauiLogHandle;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      _FAUIRotateMovie_cold_1((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
    v26 = v18;
LABEL_19:
    v27 = v26;
    if (!v10)
      goto LABEL_21;
    goto LABEL_20;
  }
  if ((v17 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB1C58], -11800, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v27 = 0;
  if (v10)
LABEL_20:
    objc_msgSend(v7, "stopAccessingSecurityScopedResource");
LABEL_21:
  if (v8)
    v8[2](v8, v17, v27);

}

void sub_22E116BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

double _FAUIRotationDirectionToRadians(uint64_t a1)
{
  double result;

  result = 4.71238898;
  if (a1 != 1)
    result = 0.0;
  if (!a1)
    return 1.57079633;
  return result;
}

BOOL FAUIRotateImage(void *a1, void *a2, uint64_t a3)
{
  const __CFURL *v5;
  const __CFURL *v6;
  CGDataProvider *v7;
  CGDataProvider *v8;
  CGImageSource *v9;
  CGImageSource *v10;
  const __CFString *Type;
  CGImageDestinationRef v12;
  CGImageDestination *v13;
  CGImageMetadataRef v14;
  CGImageMetadataRef v15;
  CFDictionaryRef v16;
  void *v17;
  int v18;
  unsigned int *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const __CFDictionary *v23;
  _BOOL8 v24;
  __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  const __CFDictionary *v32;
  void *v33;
  CFErrorRef err;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = CGDataProviderCreateWithURL(v5);
  if (v7)
  {
    v8 = v7;
    v9 = CGImageSourceCreateWithDataProvider(v7, 0);
    if (!v9)
    {
      v28 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        v28 = fauiLogHandle;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        FAUIRotateImage_cold_2();
      v24 = 0;
      goto LABEL_40;
    }
    v10 = v9;
    Type = CGImageSourceGetType(v9);
    if (Type)
    {
      v12 = CGImageDestinationCreateWithURL(v6, Type, 1uLL, 0);
      if (v12)
      {
        v13 = v12;
        v14 = CGImageSourceCopyMetadataAtIndex(v10, 0, 0);
        if (v14)
        {
          v15 = v14;
          v16 = CGImageSourceCopyPropertiesAtIndex(v10, 0, 0);
          -[__CFDictionary valueForKey:](v16, "valueForKey:", *MEMORY[0x24BDD9698]);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
            v17 = &unk_24F9ECD30;
          v33 = v17;
          v18 = objc_msgSend(v17, "intValue");
          if ((v18 - 9) <= 0xFFFFFFF7)
            FAUIRotateImage_cold_5();
          v19 = (unsigned int *)&_FAUICounterClockwiseTranslations;
          if (!a3)
            v19 = (unsigned int *)&_FAUIClockwiseTranslations;
          v20 = v19[v18];
          v21 = *MEMORY[0x24BDD9240];
          v35[0] = *MEMORY[0x24BDD9228];
          v35[1] = v21;
          v36[0] = MEMORY[0x24BDBD1C8];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v36[1] = v22;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
          v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          err = 0;
          v24 = CGImageDestinationCopyImageSource(v13, v10, v23, &err);
          if (err)
          {
            v32 = v16;
            v25 = (__CFString *)CFErrorCopyDescription(err);
            v26 = fauiLogHandle;
            if (!fauiLogHandle)
            {
              FAUIInitLogging();
              v26 = fauiLogHandle;
            }
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              FAUIRotateImage_cold_6();

            v16 = v32;
          }
          CFRelease(v15);

        }
        else
        {
          v24 = 0;
        }
        CFRelease(v13);
        goto LABEL_39;
      }
      v30 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        v30 = fauiLogHandle;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        FAUIRotateImage_cold_4();
    }
    else
    {
      v29 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        v29 = fauiLogHandle;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        FAUIRotateImage_cold_3();
    }
    v24 = 0;
LABEL_39:
    CFRelease(v10);
LABEL_40:
    CFRelease(v8);
    goto LABEL_41;
  }
  v27 = fauiLogHandle;
  if (!fauiLogHandle)
  {
    FAUIInitLogging();
    v27 = fauiLogHandle;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    FAUIRotateImage_cold_1();
  v24 = 0;
LABEL_41:

  return v24;
}

void FAUIRotateImages(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id obj;
  _QWORD block[4];
  id v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD v36[5];
  NSObject *v37;
  _QWORD *v38;
  char v39;
  _QWORD v40[5];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v5 = a3;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v46[3] = 0;
  v6 = objc_alloc_init(MEMORY[0x24BDD1710]);
  objc_msgSend(v6, "setQualityOfService:", 25);
  objc_msgSend(v6, "setName:", CFSTR("RotateReaderWriterQueue"));
  v22 = v5;
  v7 = dispatch_group_create();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    v10 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", 0);
        objc_msgSend(MEMORY[0x24BDD1568], "readingIntentWithURL:options:", v12, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v12, "startAccessingSecurityScopedResource");
        v40[0] = 0;
        v40[1] = v40;
        v40[2] = 0x3032000000;
        v40[3] = __Block_byref_object_copy__0;
        v40[4] = __Block_byref_object_dispose__0;
        v41 = 0;
        dispatch_group_enter(v7);
        v36[0] = v9;
        v36[1] = 3221225472;
        v36[2] = __FAUIRotateImages_block_invoke;
        v36[3] = &unk_24F9EC950;
        v39 = v15;
        v38 = v40;
        v36[4] = v12;
        v37 = v7;
        v16 = (void *)MEMORY[0x22E326BE0](v36);
        v47 = v14;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v9;
        v28[1] = 3221225472;
        v28[2] = __FAUIRotateImages_block_invoke_6;
        v28[3] = &unk_24F9EC9A0;
        v33 = v46;
        v18 = v16;
        v32 = v18;
        v34 = v40;
        v19 = v14;
        v29 = v19;
        v35 = a2;
        v20 = v13;
        v30 = v20;
        v31 = v6;
        objc_msgSend(v20, "coordinateAccessWithIntents:queue:byAccessor:", v17, v31, v28);

        _Block_object_dispose(v40, 8);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v8);
  }

  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __FAUIRotateImages_block_invoke_9;
  block[3] = &unk_24F9EC9C8;
  v26 = v22;
  v27 = v46;
  v21 = v22;
  dispatch_group_notify(v7, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v46, 8);
}

void sub_22E117404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a53, 8);
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

void FAUICreateTemporaryFolderURLAppropriateForURL_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22E113000, a2, OS_LOG_TYPE_ERROR, "Failed to create temp directory: %@", (uint8_t *)&v2, 0xCu);
}

void _FAUICreatePDFFromDocumentURLs_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22E113000, log, OS_LOG_TYPE_ERROR, "Error: failed to create PDF", v1, 2u);
}

void _FAUICreatePDFFromDocumentURLs_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22E113000, v0, v1, "Error: failed to write PDF to URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _CleanupTemporaryImage_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22E113000, v0, v1, "Error cleaning up temporary file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _DownsampleImage_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22E113000, v0, v1, "Failed to create image source from file URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _DownsampleImage_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22E113000, v0, v1, "Failed to get type identifier of file URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _DownsampleImage_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22E113000, v0, v1, "Failed create image destination at file URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _DownsampleImage_cold_4(uint64_t a1, NSObject *a2)
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
  v5 = 0;
  _os_log_error_impl(&dword_22E113000, a2, OS_LOG_TYPE_ERROR, "Downsample image: failed to finalize image destination of type: %@ at file URL: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void _DownsampleImage_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22E113000, v0, v1, "No need to downsample image at file URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __getPDFDocumentClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPDFDocumentClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FAUICombinePDFAction.m"), 24, CFSTR("Unable to find class %s"), "PDFDocument");

  __break(1u);
}

void PDFKitLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PDFKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("FAUICombinePDFAction.m"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPDFPageClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPDFPageClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("FAUICombinePDFAction.m"), 23, CFSTR("Unable to find class %s"), "PDFPage");

  __break(1u);
}

void _FAUIRotateMovie_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22E113000, a2, a3, "Failed to rotate video file: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void FAUIRotateImage_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22E113000, v0, v1, "Error: could not create data provider with URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void FAUIRotateImage_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22E113000, v0, v1, "Error: could not create image source for URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void FAUIRotateImage_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22E113000, v0, v1, "Error: could not determine UTI for URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void FAUIRotateImage_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22E113000, v0, v1, "Error: could create image destination for URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void FAUIRotateImage_cold_5()
{
  __assert_rtn("_FAUINextEXIFOrientation", "FAUIImageRotationUtilities.m", 42, "currentOrientation > 0 && currentOrientation < 9");
}

void FAUIRotateImage_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_22E113000, v0, v1, "Error, could not use fast-path image rotation due to: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE1A0](url);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9058](idst, isrc, index, properties);
}

BOOL CGImageDestinationCopyImageSource(CGImageDestinationRef idst, CGImageSourceRef isrc, CFDictionaryRef options, CFErrorRef *err)
{
  return MEMORY[0x24BDD9068](idst, isrc, options, err);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x24BDD9138](isrc, index, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9178](provider, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x24BDD91A0](isrc);
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

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x24BDC15A8](inUTI, inConformsToUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

