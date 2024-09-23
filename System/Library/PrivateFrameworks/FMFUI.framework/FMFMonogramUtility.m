@implementation FMFMonogramUtility

+ (id)contactImageCache
{
  if (contactImageCache_once != -1)
    dispatch_once(&contactImageCache_once, &__block_literal_global_1);
  return (id)imageCache;
}

uint64_t __39__FMFMonogramUtility_contactImageCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)imageCache;
  imageCache = (uint64_t)v0;

  return objc_msgSend((id)imageCache, "setEvictsObjectsWithDiscardedContent:", 0);
}

+ (id)contactStatusCache
{
  if (contactStatusCache_once != -1)
    dispatch_once(&contactStatusCache_once, &__block_literal_global_1);
  return (id)statusCache;
}

uint64_t __40__FMFMonogramUtility_contactStatusCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)statusCache;
  statusCache = (uint64_t)v0;

  return objc_msgSend((id)statusCache, "setEvictsObjectsWithDiscardedContent:", 0);
}

+ (void)clearMonogramCache
{
  if (imageCache)
    objc_msgSend((id)imageCache, "removeAllObjects");
  if (statusCache)
    objc_msgSend((id)statusCache, "removeAllObjects");
}

+ (id)monogramImageOfDiameter:(double)a3 forContact:(id)a4 useTintColor:(id)a5 useCustomFont:(BOOL)a6 isPersonImage:(BOOL *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v8 = a6;
  v12 = a4;
  v13 = a5;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:design:", *MEMORY[0x24BDC4DF0], 34.0, *MEMORY[0x24BDF7890]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(a1, "monogramImageOfDiameter:forContact:monogramStyle:tintColor:customFont:isPersonImage:", v12, 1, v13, v14, a7, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)monogramImageOfDiameter:(double)a3 forContact:(id)a4 monogramStyle:(int64_t)a5 tintColor:(id)a6 customFont:(id)a7 isPersonImage:(BOOL *)a8
{
  __CFString *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  unsigned __int8 *v29;
  double v30;
  id v31;
  int64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint8_t buf[4];
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v14 = (__CFString *)a4;
  v15 = a6;
  v16 = a7;
  v29 = (unsigned __int8 *)a8;
  *a8 = 0;
  v30 = a3;
  -[__CFString identifier](v14, "identifier");
  v31 = (id)objc_claimAutoreleasedReturnValue();

  v32 = a5;
  v34 = v15 != 0;
  *(_DWORD *)((char *)&v34 + 1) = v16 != 0;
  v33 = objc_msgSend(a1, "hexStringFromColor:", v15);
  objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", &v30, "{?=d^{__CFString}q^{__CFString}BB}");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contactImageCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contactStatusCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v17);
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  LogCategory_Daemon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v14;
    _os_log_impl(&dword_20DD58000, v21, OS_LOG_TYPE_DEFAULT, "FMFMonogramUtility monogramImageOfDiameterForContact: %@", buf, 0xCu);
  }

  if (v20)
  {
    objc_msgSend(v19, "objectForKey:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LogCategory_Daemon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v20;
      _os_log_impl(&dword_20DD58000, v23, OS_LOG_TYPE_DEFAULT, "FMFMonogramUtility: Using cached image %@", buf, 0xCu);
    }

    if (v22)
      *v29 = objc_msgSend(v22, "BOOLValue");

  }
  else
  {
    if (!v14)
      goto LABEL_13;
    objc_msgSend(a1, "monogrammerWithDiameter:style:useTintColor:customFont:", a5, v15, v16, a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "monogramForContact:isContactImage:", v14, v29);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    LogCategory_Daemon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = CFSTR("Image");
      _os_log_impl(&dword_20DD58000, v25, OS_LOG_TYPE_DEFAULT, "FMFMonogramUtility: Record found, using %@", buf, 0xCu);
    }

    if (!v20)
    {
LABEL_13:
      LogCategory_Daemon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DD58000, v26, OS_LOG_TYPE_DEFAULT, "FMFMonogramUtility: No Record, using placeholder", buf, 2u);
      }

      objc_msgSend(a1, "placeholderContactImageOfDiameter:monogramStyle:useTintColor:", a5, v15, a3);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v27, v17);

    objc_msgSend(v18, "setObject:forKey:", v20, v17);
  }

  return v20;
}

+ (id)placeholderContactImageOfDiameter:(double)a3 monogramStyle:(int64_t)a4 useTintColor:(id)a5
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "monogrammerWithDiameter:style:useTintColor:customFont:", a4, a5, 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "monogramForContact:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)monogrammerWithDiameter:(double)a3 style:(int64_t)a4 useTintColor:(id)a5 customFont:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _BOOL8 v17;

  v10 = a5;
  v11 = a6;
  pthread_mutex_lock(&__FMFAddressBook_MonogrammersMutex);
  objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread");
  v17 = v10 != 0;
  *(_DWORD *)((char *)&v17 + 1) = v11 != 0;
  v16[2] = objc_msgSend(a1, "hexStringFromColor:", v10, *(_QWORD *)&a3, a4);
  objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", v16, "{?=dq^{__CFString}BB}");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBAEC0]), "initWithStyle:diameter:", a4, a3);
    v13 = v14;
    if (v17)
      objc_msgSend(v14, "monogramsWithTint:", v10);
    if (BYTE1(v17))
      objc_msgSend(v13, "setFont:", v11);
    objc_msgSend(0, "setObject:forKey:", v13, v12);
  }
  pthread_mutex_unlock(&__FMFAddressBook_MonogrammersMutex);

  return v13;
}

+ (__CFString)hexStringFromColor:(id)a3
{
  id v3;
  CGColorSpace *v4;
  id v5;
  CGColor *CopyByMatchingToColorSpace;
  size_t NumberOfComponents;
  const CGFloat *Components;
  NSObject *v9;
  __CFString *v10;
  double v11;
  double v12;
  double v13;
  float v14;
  unint64_t v15;
  float v16;
  float v17;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  v5 = objc_retainAutorelease(v3);
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v4, kCGRenderingIntentDefault, (CGColorRef)objc_msgSend(v5, "CGColor"), 0);
  CGColorSpaceRelease(v4);
  NumberOfComponents = CGColorGetNumberOfComponents(CopyByMatchingToColorSpace);
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  if (NumberOfComponents > 2)
  {
    v11 = *Components;
    v12 = Components[1];
    v13 = Components[2];
    CGColorRelease(CopyByMatchingToColorSpace);
    v14 = v11 * 255.0;
    v15 = llroundf(v14);
    v16 = v12 * 255.0;
    v17 = v13 * 255.0;
    v10 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#%02lX%02lX%02lX"), v15, llroundf(v16), llroundf(v17));
  }
  else
  {
    LogCategory_Daemon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_20DD58000, v9, OS_LOG_TYPE_DEFAULT, "FMFMonogramUtility: invalid color provided in hexStringFromColor: %@", buf, 0xCu);
    }

    CGColorRelease(CopyByMatchingToColorSpace);
    v10 = CFSTR("#FFFFFF");
  }

  return v10;
}

@end
