@implementation CUIKConferenceUtils

+ (id)_workQueue
{
  if (_workQueue_onceToken != -1)
    dispatch_once(&_workQueue_onceToken, &__block_literal_global_9);
  return (id)_workQueue_workQueue;
}

void __33__CUIKConferenceUtils__workQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("CUIKConferenceUtils.workQueue", 0);
  v1 = (void *)_workQueue_workQueue;
  _workQueue_workQueue = (uint64_t)v0;

}

+ (id)_prepareImageForDefaultDescriptor:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0DC3BF8];
  v4 = a3;
  objc_msgSend(v3, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  v8 = objc_alloc(MEMORY[0x1E0D3A830]);
  objc_msgSend(MEMORY[0x1E0CAA038], "conferenceImageSize");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CAA038], "conferenceImageSize");
  v12 = (void *)objc_msgSend(v8, "initWithSize:scale:", v10, v11, v7);
  objc_msgSend(v12, "setDrawBorder:", 1);
  objc_msgSend(v4, "prepareImageForDescriptor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_imageForApplicationRecord:(id)a3 URL:(id)a4 isBroadcast:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;

  v8 = a4;
  objc_msgSend(a3, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9
    || (v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v9),
        objc_msgSend(a1, "_platformImageForISIcon:", v10),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    if (a5)
    {
      v12 = CFSTR("play.tv.fill");
    }
    else if ((objc_msgSend(v8, "cal_hasSchemeTel") & 1) != 0)
    {
      v12 = CFSTR("phone.fill");
    }
    else if (objc_msgSend(MEMORY[0x1E0D0C288], "isPreferredURL:", v8))
    {
      v12 = CFSTR("video.fill");
    }
    else
    {
      v12 = CFSTR("link");
    }
    objc_msgSend(a1, "_systemImageNamed:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)synchronousTitleForURL:(id)a3 incomplete:(BOOL *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CAA038];
  v7 = a3;
  objc_msgSend(v6, "applicationRecordForURL:incomplete:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_titleForApplicationRecord:URL:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)synchronousOutlineIconForURL:(id)a3 isBroadcast:(BOOL)a4 outImageName:(id *)a5 incomplete:(BOOL *)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  void *v14;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CAA038], "applicationRecordForURL:incomplete:", v10, a6);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (a4)
  {
    v13 = CFSTR("play.tv");
  }
  else if (v11 || (objc_msgSend(MEMORY[0x1E0D0C288], "isPreferredURL:", v10) & 1) != 0)
  {
    v13 = CFSTR("video");
  }
  else if (objc_msgSend(v10, "cal_hasSchemeTel"))
  {
    v13 = CFSTR("phone");
  }
  else
  {
    v13 = CFSTR("link");
  }
  objc_msgSend(a1, "_systemImageNamed:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    *a5 = v13;

  return v14;
}

+ (id)_systemImageNamed:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_platformImageForISIcon:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "_prepareImageForDefaultDescriptor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3870];
  v5 = objc_msgSend(v3, "CGImage");
  objc_msgSend(v3, "scale");
  objc_msgSend(v4, "imageWithCGImage:scale:orientation:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_titleForApplicationRecord:(id)a3 URL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.microsoft.lync2013.iphone")))
  {
    CUIKBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Skype"), &stru_1E6EBAE30, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }

  if (!v8)
  {
LABEL_5:
    objc_msgSend(v6, "cal_ShortDisplayStringForURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (unint64_t)_buttonTypeForApplicationRecord:(id)a3 URL:(id)a4 isBroadcast:(BOOL)a5
{
  id v7;
  id v8;
  unint64_t v9;

  v7 = a3;
  v8 = a4;
  if (a5)
  {
    v9 = 2;
  }
  else if (v7 || (objc_msgSend(MEMORY[0x1E0D0C288], "isPreferredURL:", v8) & 1) != 0)
  {
    v9 = 0;
  }
  else if (objc_msgSend(v8, "cal_hasSchemeTel"))
  {
    v9 = 3;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (void)_displayDetailsForURL:(id)a3 isBroadcast:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CAA038];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__CUIKConferenceUtils__displayDetailsForURL_isBroadcast_completionHandler___block_invoke;
  v13[3] = &unk_1E6EB6D80;
  v15 = v9;
  v16 = a1;
  v17 = a4;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "applicationRecordForURL:completionHandler:", v12, v13);

}

void __75__CUIKConferenceUtils__displayDetailsForURL_isBroadcast_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 56);
  v6 = a2;
  objc_msgSend(v3, "_imageForApplicationRecord:URL:isBroadcast:", v6, v4, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_titleForApplicationRecord:URL:", v6, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_buttonTypeForApplicationRecord:URL:isBroadcast:", v6, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (void)displayDetailsForJoinMethod:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "URL");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isBroadcast");

  objc_msgSend(a1, "_displayDetailsForURL:isBroadcast:completionHandler:", v9, v8, v6);
}

+ (void)displayDetailsForURL:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a1, "_displayDetailsForURL:isBroadcast:completionHandler:", a3, 0, a4);
}

+ (void)imageForRoomType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CUIKConferenceUtils_imageForRoomType_completionHandler___block_invoke;
  block[3] = &unk_1E6EB6DA8;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __58__CUIKConferenceUtils_imageForRoomType_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "extensionBundleIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CAA038], "FacetimeConferenceExtensionBundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v9, "caseInsensitiveCompare:", v2);

  if (v3)
  {
    v4 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CAA038], "FacetimeAppBundleID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (!v4
    || (v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v4),
        objc_msgSend(*(id *)(a1 + 48), "_platformImageForISIcon:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_platformImageForISIcon:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)subtitleForVirtualConference:(id)a3 displayedWithTitle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  char v18;
  id v19;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "joinMethods");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DBD290];
  objc_msgSend(v8, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversationLinkForURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "linkName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length") && (v15 = objc_msgSend(v5, "isEqualToString:", v12), v16 = v12, !v15)
    || objc_msgSend(v13, "length") && (v17 = objc_msgSend(v5, "isEqualToString:", v13), v16 = v13, !v17)
    || objc_msgSend(v14, "length") && (v18 = objc_msgSend(v5, "isEqualToString:", v14), v16 = v14, (v18 & 1) == 0))
  {
    v19 = v16;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)subtitleForURL:(id)a3 displayedWithTitle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0DBD290], "conversationLinkForURL:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "linkName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") && (objc_msgSend(v5, "isEqualToString:", v7) & 1) == 0)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

@end
