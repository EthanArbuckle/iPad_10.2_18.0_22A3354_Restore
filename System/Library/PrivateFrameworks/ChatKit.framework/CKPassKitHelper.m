@implementation CKPassKitHelper

+ (id)mailAttachmentIconForPass:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD block[4];
  id v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    v9 = xmmword_1E27502C0;
    v10 = 0;
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (PassKitUILibraryCore_frameworkLibrary)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__CKPassKitHelper_mailAttachmentIconForPass___block_invoke;
    block[3] = &unk_1E274A208;
    v4 = v3;
    v8 = v4;
    if (mailAttachmentIconForPass__onceToken != -1)
      dispatch_once(&mailAttachmentIconForPass__onceToken, block);
    if (mailAttachmentIconForPass__respondsToSelector)
    {
      objc_msgSend(v4, "mailAttachmentIcon");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __45__CKPassKitHelper_mailAttachmentIconForPass___block_invoke()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  mailAttachmentIconForPass__respondsToSelector = result & 1;
  return result;
}

+ (id)localizedNameForPass:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD block[4];
  id v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    v9 = xmmword_1E27502C0;
    v10 = 0;
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (PassKitUILibraryCore_frameworkLibrary)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__CKPassKitHelper_localizedNameForPass___block_invoke;
    block[3] = &unk_1E274A208;
    v4 = v3;
    v8 = v4;
    if (localizedNameForPass__onceToken != -1)
      dispatch_once(&localizedNameForPass__onceToken, block);
    if (localizedNameForPass__respondsToSelector)
    {
      objc_msgSend(v4, "localizedName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __40__CKPassKitHelper_localizedNameForPass___block_invoke()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  localizedNameForPass__respondsToSelector = result & 1;
  return result;
}

+ (id)organizationNameForPass:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD block[4];
  id v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    v9 = xmmword_1E27502C0;
    v10 = 0;
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (PassKitUILibraryCore_frameworkLibrary)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__CKPassKitHelper_organizationNameForPass___block_invoke;
    block[3] = &unk_1E274A208;
    v4 = v3;
    v8 = v4;
    if (organizationNameForPass__onceToken != -1)
      dispatch_once(&organizationNameForPass__onceToken, block);
    if (organizationNameForPass__respondsToSelector)
    {
      objc_msgSend(v4, "organizationName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __43__CKPassKitHelper_organizationNameForPass___block_invoke()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  organizationNameForPass__respondsToSelector = result & 1;
  return result;
}

+ (id)passViewForPass:(id)a3 content:(int64_t)a4
{
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  Class (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    v15 = xmmword_1E27502C0;
    v16 = 0;
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (PassKitUILibraryCore_frameworkLibrary)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v6 = (void *)getPKPassViewClass_softClass;
    v14 = getPKPassViewClass_softClass;
    if (!getPKPassViewClass_softClass)
    {
      *(_QWORD *)&v15 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v15 + 1) = 3221225472;
      v16 = __getPKPassViewClass_block_invoke;
      v17 = &unk_1E274A178;
      v18 = &v11;
      __getPKPassViewClass_block_invoke((uint64_t)&v15);
      v6 = (void *)v12[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v11, 8);
    v8 = [v7 alloc];
    v9 = (void *)objc_msgSend(v8, "initWithPass:content:", v5, a4, v11);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)addPassesViewControllerForPass:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    v13 = xmmword_1E27502C0;
    v14 = 0;
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (PassKitUILibraryCore_frameworkLibrary)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2050000000;
    v4 = (void *)getPKAddPassesViewControllerClass_softClass;
    v12 = getPKAddPassesViewControllerClass_softClass;
    if (!getPKAddPassesViewControllerClass_softClass)
    {
      *(_QWORD *)&v13 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v13 + 1) = 3221225472;
      v14 = __getPKAddPassesViewControllerClass_block_invoke;
      v15 = &unk_1E274A178;
      v16 = &v9;
      __getPKAddPassesViewControllerClass_block_invoke((uint64_t)&v13);
      v4 = (void *)v10[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v9, 8);
    v6 = [v5 alloc];
    v7 = (void *)objc_msgSend(v6, "initWithPass:", v3, v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
