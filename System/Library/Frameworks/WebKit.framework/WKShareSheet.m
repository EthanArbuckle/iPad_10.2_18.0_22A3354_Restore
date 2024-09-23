@implementation WKShareSheet

- (WKShareSheetDelegate)delegate
{
  WKShareSheetDelegate *WeakRetained;
  WKShareSheetDelegate *v3;

  WeakRetained = (WKShareSheetDelegate *)objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v3 = WeakRetained;
  if (WeakRetained)
    CFRelease(WeakRetained);
  return v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate.m_weakReference, a3);
}

- (WKShareSheet)initWithView:(id)a3
{
  WKShareSheet *v4;
  WKShareSheet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKShareSheet;
  v4 = -[WKShareSheet init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeWeak(&v4->_webView.m_weakReference, a3);
  return v5;
}

- (void)presentWithParameters:(const void *)a3 inRect:(optional<WebCore:(void *)a5 :FloatRect> *)a4 completionHandler:
{
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  WKShareSheetURLItemProvider *v13;
  const __CFString *v14;
  void *v15;
  void *value;
  unsigned __int16 v17;
  char v18;
  id v19;
  void *v20;
  void *m_ptr;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  CFTypeRef *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  uint64_t v35;
  uint64_t v36;
  CFTypeRef v37;
  WTF::StringImpl *v38;
  CFTypeRef v39;
  uint64_t v40;
  $12DD2257486BCFCE6114A021383766B1 var0;
  int v42;
  $12DD2257486BCFCE6114A021383766B1 v43;
  int v44;
  CFTypeRef v45;
  const void *v46;
  uint64_t v47;
  CFTypeRef cf;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = *((_QWORD *)a3 + 1);
  if (v10 && *(_DWORD *)(v10 + 4))
    objc_msgSend(v9, "addObject:", WTF::StringImpl::operator NSString *());
  if (*((_BYTE *)a3 + 80))
  {
    v11 = (void *)WTF::URL::operator NSURL *();
    if (*(_QWORD *)a3 && *(_DWORD *)(*(_QWORD *)a3 + 4))
      v12 = WTF::StringImpl::operator NSString *();
    else
      v12 = 0;
    if (*((_BYTE *)a3 + 104))
    {
      objc_msgSend(v11, "_web_setTitle:", v12);
      objc_msgSend(v9, "addObject:", v11);
    }
    else
    {
      v13 = -[WKShareSheetURLItemProvider initWithURL:title:]([WKShareSheetURLItemProvider alloc], "initWithURL:title:", v11, v12);
      if (v13)
      {
        objc_msgSend(v9, "addObject:", v13);
        CFRelease(v13);
      }
    }
  }
  if (*(_QWORD *)a3 && *(_DWORD *)(*(_QWORD *)a3 + 4) && !objc_msgSend(v9, "count"))
  {
    if (*(_QWORD *)a3)
      v14 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v14 = &stru_1E351F1B8;
    objc_msgSend(v9, "addObject:", v14);
  }
  v15 = *(void **)a5;
  *(_QWORD *)a5 = 0;
  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = v15;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  v17 = objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "_resolutionForShareSheetImmediateCompletionForTesting");
  if (v17 >= 0x100u)
  {
    self->_didShareSuccessfully = v17;
    -[WKShareSheet dismiss](self, "dismiss");
    goto LABEL_48;
  }
  if (!*((_DWORD *)a3 + 25))
  {
    var0 = a4->var0;
    v42 = *(_DWORD *)&a4->var1;
    -[WKShareSheet presentWithShareDataArray:inRect:](self, "presentWithShareDataArray:inRect:", v9, &var0);
LABEL_48:
    if (v9)
      CFRelease(v9);
    return;
  }
  v18 = *((_BYTE *)a3 + 104);
  v19 = +[WKShareSheet createTemporarySharingDirectory](WKShareSheet, "createTemporarySharingDirectory");
  v20 = v19;
  if (v19)
    CFRetain(v19);
  m_ptr = self->_temporaryFileShareDirectory.m_ptr;
  self->_temporaryFileShareDirectory.m_ptr = v20;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v20 = self->_temporaryFileShareDirectory.m_ptr;
  }
  CFRetain(self);
  v43 = a4->var0;
  LOBYTE(v44) = a4->var1;
  v22 = WTF::fastMalloc((WTF *)0x28);
  *(_QWORD *)v22 = &off_1E3508158;
  *(_QWORD *)(v22 + 8) = self;
  *($12DD2257486BCFCE6114A021383766B1 *)(v22 + 16) = v43;
  *(_DWORD *)(v22 + 32) = v44;
  v53 = 0;
  v54 = 0;
  v23 = *((unsigned int *)a3 + 25);
  if ((_DWORD)v23)
  {
    if (v23 >> 28)
    {
      __break(0xC471u);
      return;
    }
    v24 = WTF::fastMalloc((WTF *)(16 * v23));
    LODWORD(v54) = v23;
    v53 = v24;
    if (*((_DWORD *)a3 + 25))
    {
      v25 = 0;
      v26 = 0;
      do
      {
        v27 = *((_QWORD *)a3 + 11) + v25;
        WTF::String::isolatedCopy();
        WebCore::SharedBuffer::createNSData(*(WebCore::SharedBuffer **)(v27 + 8));
        ++v26;
        v28 = (CFTypeRef *)(v24 + v25);
        *v28 = v45;
        v28[1] = v46;
        v25 += 16;
      }
      while (v26 < *((unsigned int *)a3 + 25));
      HIDWORD(v54) = v26;
    }
  }
  WTF::WorkQueue::create();
  v29 = v52;
  v45 = v9;
  v46 = (const void *)v53;
  v30 = v54;
  v53 = 0;
  v54 = 0;
  v47 = v30;
  cf = v20;
  if (v20)
    CFRetain(v20);
  v49 = v18 ^ 1;
  v50 = v22;
  v31 = WTF::fastMalloc((WTF *)0x38);
  *(_QWORD *)v31 = off_1E3508108;
  *(_QWORD *)(v31 + 8) = v45;
  v32 = v46;
  v45 = 0;
  v46 = 0;
  *(_QWORD *)(v31 + 16) = v32;
  *(_QWORD *)(v31 + 24) = v47;
  *(_QWORD *)(v31 + 32) = cf;
  *(_BYTE *)(v31 + 40) = v49;
  v33 = v50;
  v47 = 0;
  cf = 0;
  v50 = 0;
  v51 = v31;
  *(_QWORD *)(v31 + 48) = v33;
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v29 + 32))(v29, &v51);
  v35 = v51;
  v51 = 0;
  if (v35)
    (*(void (**)(uint64_t))(*(_QWORD *)v35 + 8))(v35);
  v36 = v50;
  v50 = 0;
  if (v36)
    (*(void (**)(uint64_t))(*(_QWORD *)v36 + 8))(v36);
  v37 = cf;
  cf = 0;
  if (v37)
    CFRelease(v37);
  WTF::Vector<appendFilesAsShareableURLs(WTF::RetainPtr<NSMutableArray> &&,WTF::Vector<WebCore::RawFile,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&,NSURL *,BOOL,WTF::CompletionHandler<void ()(WTF::RetainPtr<NSMutableArray> &)> &&)::FileWriteTask,0ul,WebCore::RawFile,16ul,WTF::CrashOnOverflow>::~Vector((unsigned int *)&v46, v34);
  v39 = v45;
  v45 = 0;
  if (v39)
    CFRelease(v39);
  v40 = v52;
  v52 = 0;
  if (v40)
    (*(void (**)(uint64_t))(*(_QWORD *)v40 + 56))(v40);
  WTF::Vector<appendFilesAsShareableURLs(WTF::RetainPtr<NSMutableArray> &&,WTF::Vector<WebCore::RawFile,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&,NSURL *,BOOL,WTF::CompletionHandler<void ()(WTF::RetainPtr<NSMutableArray> &)> &&)::FileWriteTask,0ul,WebCore::RawFile,16ul,WTF::CrashOnOverflow>::~Vector((unsigned int *)&v53, v38);
}

- (void)presentWithShareDataArray:(id)a3 inRect:(optional<WebCore::FloatRect> *)a4
{
  id Weak;
  void *v8;
  void *m_ptr;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  $12DD2257486BCFCE6114A021383766B1 v19;
  CGRect v20;
  _QWORD v21[5];
  $12DD2257486BCFCE6114A021383766B1 var0;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  Weak = objc_loadWeak(&self->_webView.m_weakReference);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2D8]), "initWithActivityItems:applicationActivities:", a3, 0);
  m_ptr = self->_shareSheetViewController.m_ptr;
  self->_shareSheetViewController.m_ptr = v8;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v8 = self->_shareSheetViewController.m_ptr;
  }
  v23[0] = *MEMORY[0x1E0CEB240];
  objc_msgSend(v8, "setExcludedActivityTypes:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1));
  v10 = self->_shareSheetViewController.m_ptr;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __49__WKShareSheet_presentWithShareDataArray_inRect___block_invoke;
  v21[3] = &unk_1E35080B0;
  v21[4] = self;
  objc_msgSend(v10, "setCompletionWithItemsHandler:", v21);
  v11 = (void *)objc_msgSend(self->_shareSheetViewController.m_ptr, "popoverPresentationController");
  objc_msgSend(v11, "setSourceView:", Weak);
  objc_msgSend(Weak, "bounds");
  v20.origin.x = v12;
  v20.origin.y = v13;
  v20.size.width = v14;
  v20.size.height = v15;
  if (a4->var1)
    var0 = a4->var0;
  else
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&var0, &v20);
  v19 = var0;
  WebCore::FloatRect::operator CGRect();
  objc_msgSend(v11, "setSourceRect:", *(_OWORD *)&v19);
  if (!a4->var1)
    objc_msgSend(v11, "setPermittedArrowDirections:", 0);
  objc_loadWeak(&self->_delegate.m_weakReference);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "shareSheet:willShowActivityItems:", self, a3);
  v16 = (void *)objc_msgSend(Weak, "_wk_viewControllerForFullScreenPresentation");
  v17 = v16;
  if (v16)
    CFRetain(v16);
  v18 = self->_presentationViewController.m_ptr;
  self->_presentationViewController.m_ptr = v17;
  if (v18)
  {
    CFRelease(v18);
    v17 = self->_presentationViewController.m_ptr;
  }
  objc_msgSend(v17, "presentViewController:animated:completion:", self->_shareSheetViewController.m_ptr, 1, 0);
}

uint64_t __49__WKShareSheet_presentWithShareDataArray_inRect___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) |= a3;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "presentingViewController"))
    return objc_msgSend(*(id *)(a1 + 32), "dismiss");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isBeingDismissed");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "dismiss");
  return result;
}

- (void)dismiss
{
  void *value;
  void *m_ptr;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[5];

  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
  {
    (*(void (**)(void *, BOOL))(*(_QWORD *)value + 16))(value, self->_didShareSuccessfully);
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", self->_temporaryFileShareDirectory.m_ptr, 0);
  m_ptr = self->_temporaryFileShareDirectory.m_ptr;
  self->_temporaryFileShareDirectory.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __23__WKShareSheet_dismiss__block_invoke;
  v9[3] = &unk_1E34BAF80;
  v9[4] = self;
  v6 = self->_presentationViewController.m_ptr;
  if (v6)
  {
    v7 = (void *)objc_msgSend(v6, "presentedViewController");
    if (self->_shareSheetViewController.m_ptr == v7)
    {
      v8[0] = v5;
      v8[1] = 3221225472;
      v8[2] = __23__WKShareSheet_dismiss__block_invoke_2;
      v8[3] = &unk_1E35080D8;
      v8[4] = self;
      v8[5] = v9;
      objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);
    }
    else
    {
      __23__WKShareSheet_dismiss__block_invoke((uint64_t)v9);
    }
  }
}

uint64_t __23__WKShareSheet_dismiss__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 24));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 24)), "shareSheetDidDismiss:", *(_QWORD *)(a1 + 32));
  return result;
}

void __23__WKShareSheet_dismiss__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;
  if (v3)
    CFRelease(v3);
}

- (BOOL)dismissIfNeededWithReason:(unsigned __int8)a3
{
  if (a3 == 1)
  {
    if ((objc_msgSend(self->_shareSheetViewController.m_ptr, "_wk_isInFullscreenPresentation") & 1) != 0)
      return 0;
    goto LABEL_5;
  }
  if ((a3 - 1) <= 1)
LABEL_5:
    -[WKShareSheet setDelegate:](self, "setDelegate:", 0);
  -[WKShareSheet dismiss](self, "dismiss");
  return 1;
}

+ (id)createTemporarySharingDirectory
{
  void *TemporaryDirectory;
  id result;

  TemporaryDirectory = (void *)WTF::FileSystemImpl::createTemporaryDirectory((WTF::FileSystemImpl *)CFSTR("WKFileShare"), (NSString *)a2);
  result = (id)objc_msgSend(TemporaryDirectory, "length");
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", TemporaryDirectory, 1);
  return result;
}

+ (id)createRandomSharingDirectoryForFile:(id)a3
{
  WTF::StringImpl *v4;
  __CFString *v5;
  uint64_t v6;
  id result;
  void *v8;
  WTF::StringImpl *v9;

  WTF::createVersion4UUIDString((WTF *)a1);
  if (v9)
  {
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v4);
    else
      *(_DWORD *)v9 -= 2;
  }
  else
  {
    v5 = &stru_1E351F1B8;
  }
  v6 = -[__CFString length](v5, "length");
  result = 0;
  if (a3 && v6)
  {
    v8 = (void *)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", v5, 1);
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 0, 0, 0))return v8;
    else
      return 0;
  }
  return result;
}

+ (id)writeFileToShareableURL:(id)a3 data:(id)a4 temporaryDirectory:(id)a5
{
  uint64_t v8;
  id result;
  void *v10;

  if (!a5)
    return 0;
  v8 = objc_msgSend(a3, "length");
  result = 0;
  if (a4)
  {
    if (v8)
    {
      result = +[WKShareSheet createRandomSharingDirectoryForFile:](WKShareSheet, "createRandomSharingDirectoryForFile:", a5);
      if (result)
      {
        v10 = (void *)objc_msgSend(result, "URLByAppendingPathComponent:isDirectory:", a3, 0);
        if (objc_msgSend(a4, "writeToURL:options:error:", v10, 1, 0))
          return v10;
        else
          return 0;
      }
    }
  }
  return result;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *value;
  void *v6;

  m_ptr = self->_presentationViewController.m_ptr;
  self->_presentationViewController.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_shareSheetViewController.m_ptr;
  self->_shareSheetViewController.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *, SEL))(*(_QWORD *)value + 8))(value, a2);
  objc_destroyWeak(&self->_delegate.m_weakReference);
  objc_destroyWeak(&self->_webView.m_weakReference);
  v6 = self->_temporaryFileShareDirectory.m_ptr;
  self->_temporaryFileShareDirectory.m_ptr = 0;
  if (v6)
    CFRelease(v6);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (_QWORD)presentWithParameters:(_QWORD *)a1 inRect:completionHandler:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3508158;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)presentWithParameters:(WTF *)this inRect:(void *)a2 completionHandler:
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3508158;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)presentWithParameters:(uint64_t)a1 inRect:(uint64_t *)a2 completionHandler:
{
  uint64_t v3;
  void *v4;
  __int128 v6;
  int v7;

  v3 = *a2;
  v4 = *(void **)(a1 + 8);
  if (!*a2)
    return objc_msgSend(v4, "dismiss");
  v6 = *(_OWORD *)(a1 + 16);
  v7 = *(_DWORD *)(a1 + 32);
  return objc_msgSend(v4, "presentWithShareDataArray:inRect:", v3, &v6);
}

@end
