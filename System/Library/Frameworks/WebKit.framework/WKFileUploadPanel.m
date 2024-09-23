@implementation WKFileUploadPanel

- (WKFileUploadPanel)initWithView:(id)a3
{
  WKFileUploadPanel *v4;
  WKFileUploadPanel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKFileUploadPanel;
  v4 = -[WKFileUploadPanel init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeWeak(&v4->_view.m_weakReference, a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(self->_cameraPicker.m_ptr, "setDelegate:", 0);
  objc_msgSend(self->_documentPickerController.m_ptr, "setDelegate:", 0);
  -[WKFileUploadPanel resetContextMenuPresenter](self, "resetContextMenuPresenter");
  v3.receiver = self;
  v3.super_class = (Class)WKFileUploadPanel;
  -[WKFileUploadPanel dealloc](&v3, sel_dealloc);
}

- (void)_dispatchDidDismiss
{
  WKFileUploadPanelDelegate **p_delegate;

  p_delegate = &self->_delegate;
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak((id *)p_delegate), "fileUploadPanelDidDismiss:", self);
}

- (void)_cancel
{
  WebOpenPanelResultListenerProxy *m_ptr;
  WebKit::WebPageProxy *v4;

  m_ptr = self->_listener.m_ptr;
  if (m_ptr)
  {
    v4 = (WebKit::WebPageProxy *)*((_QWORD *)m_ptr + 2);
    if (v4)
      WebKit::WebPageProxy::didCancelForOpenPanel(v4, (void *)a2);
  }
  -[WKFileUploadPanel _dispatchDidDismiss](self, "_dispatchDidDismiss");
}

- (void)_chooseMediaItems:(id)a3
{
  void *v5;
  CFTypeRef v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  CFTypeRef v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CFTypeRef arg;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = 0;
  v7 = 0;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "addObject:", objc_msgSend(v11, "fileURL"));
        if (!v6)
        {
          if (v11)
          {
            objc_msgSend(v11, "displayImage");
            v6 = arg;
          }
          else
          {
            v6 = 0;
          }
        }
        v7 += objc_msgSend(v11, "isVideo");
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v8);
  }
  v12 = objc_msgSend(a3, "count");
  if (objc_msgSend(a3, "count") == 1)
  {
    v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "firstObject"), "fileURL"), "lastPathComponent");
LABEL_18:
    v17 = v14;
    goto LABEL_19;
  }
  if (v12 | v7)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    WebCore::copyLocalizedString((WebCore *)CFSTR("%lu photo(s) and %lu video(s)"), v13);
    if (arg)
    {
      CFAutorelease(arg);
      v16 = arg;
    }
    else
    {
      v16 = 0;
    }
    v14 = objc_msgSend(v15, "localizedStringWithFormat:", v16, v12 - v7, v7);
    goto LABEL_18;
  }
  v17 = 0;
LABEL_19:
  -[WKFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", 1);
  -[WKFileUploadPanel _chooseFiles:displayString:iconImage:](self, "_chooseFiles:displayString:iconImage:", v5, v17, v6);
  if (v6)
    CFRelease(v6);
}

- (void)_chooseFiles:(id)a3 displayString:(id)a4 iconImage:(id)a5
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  WTF::String *v13;
  const char *v14;
  WTF::StringImpl *v15;
  uint64_t v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSData *v23;
  void *v24;
  uint64_t v25;
  WebOpenPanelResultListenerProxy *m_ptr;
  WTF::StringImpl *v27;
  uint64_t v28;
  WTF::StringImpl *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  WTF::StringImpl *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a3, "count");
  if (v9)
  {
    v35 = 0;
    v36 = 0;
    if (v9 >> 29)
    {
      __break(0xC471u);
    }
    else
    {
      LODWORD(v36) = v9;
      v35 = WTF::fastMalloc((WTF *)(8 * v9));
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v32;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v32 != v11)
              objc_enumerationMutation(a3);
            v13 = (WTF::String *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v12), "fileSystemRepresentation");
            WTF::String::fromUTF8((uint64_t *)&v37, v13, v14);
            LODWORD(v16) = HIDWORD(v36);
            if (HIDWORD(v36) == (_DWORD)v36)
            {
              v19 = (uint64_t *)WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v35, HIDWORD(v36) + 1, (unint64_t)&v37);
              v16 = HIDWORD(v36);
              v20 = v35;
              v21 = *v19;
              *v19 = 0;
              *(_QWORD *)(v20 + 8 * v16) = v21;
            }
            else
            {
              v17 = v37;
              v37 = 0;
              *(_QWORD *)(v35 + 8 * HIDWORD(v36)) = v17;
            }
            HIDWORD(v36) = v16 + 1;
            v18 = v37;
            v37 = 0;
            if (v18)
            {
              if (*(_DWORD *)v18 == 2)
                WTF::StringImpl::destroy(v18, v15);
              else
                *(_DWORD *)v18 -= 2;
            }
            ++v12;
          }
          while (v10 != v12);
          v22 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
          v10 = v22;
        }
        while (v22);
      }
      v23 = UIImagePNGRepresentation((UIImage *)a5);
      API::Data::create((WTF *)-[NSData length](v23, "length"), -[NSData bytes](v23, "bytes"), &v37);
      if (v37 && (v24 = (void *)*((_QWORD *)v37 + 1)) != 0)
        v25 = objc_msgSend(v24, "_apiObject");
      else
        v25 = 0;
      m_ptr = self->_listener.m_ptr;
      MEMORY[0x19AEABCC8](&v37, a4);
      v28 = *((_QWORD *)m_ptr + 2);
      if (v28)
        WebKit::WebPageProxy::didChooseFilesForOpenPanelWithDisplayStringAndIcon(v28, &v35, (uint64_t)&v37, v25);
      v29 = v37;
      v37 = 0;
      if (v29)
      {
        if (*(_DWORD *)v29 == 2)
          WTF::StringImpl::destroy(v29, v27);
        else
          *(_DWORD *)v29 -= 2;
      }
      -[WKFileUploadPanel _dispatchDidDismiss](self, "_dispatchDidDismiss");
      if (v25)
        CFRelease(*(CFTypeRef *)(v25 + 8));
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v35, v30);
    }
  }
  else
  {
    -[WKFileUploadPanel _cancel](self, "_cancel");
  }
}

- (void)presentWithParameters:(void *)a3 resultListener:(void *)a4
{
  WebOpenPanelResultListenerProxy *m_ptr;
  CGFloat v7;
  CGFloat v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  const __CFString *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  _QWORD *v21;
  int v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  WTF::StringImpl *v37;
  WTF::StringImpl *v38;
  _QWORD *v39;
  int v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t i;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  int v54;
  WKFileUploadPanel *v55;
  char v56;
  WKFileUploadPanel *v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  WTF::StringImpl *v65[18];

  v65[16] = *(WTF::StringImpl **)MEMORY[0x1E0C80C00];
  if (a4)
    CFRetain(*((CFTypeRef *)a4 + 1));
  m_ptr = self->_listener.m_ptr;
  self->_listener.m_ptr = (WebOpenPanelResultListenerProxy *)a4;
  if (m_ptr)
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  self->_allowMultipleFiles = *((_BYTE *)a3 + 17);
  objc_msgSend(objc_loadWeak(&self->_view.m_weakReference), "lastInteractionLocation");
  v58 = self;
  self->_interactionPoint.x = v7;
  self->_interactionPoint.y = v8;
  API::Array::createStringArray((uint64_t)a3 + 24, &v60);
  v9 = v60;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(unsigned int *)(v60 + 28));
  v11 = *(_QWORD **)(v9 + 16);
  v12 = *(unsigned int *)(v9 + 28);
  v13 = &v11[v12];
  if ((_DWORD)v12)
  {
    v14 = 8 * v12;
    while ((*(unsigned int (**)(_QWORD))(*(_QWORD *)*v11 + 16))(*v11) != 21)
    {
      ++v11;
      v14 -= 8;
      if (!v14)
      {
        v11 = v13;
        break;
      }
    }
    v15 = v11;
    v11 = *(_QWORD **)(v9 + 16);
    v16 = *(unsigned int *)(v9 + 28);
  }
  else
  {
    v16 = 0;
    v15 = *(_QWORD **)(v9 + 16);
  }
  v17 = &v11[v16];
  while (v15 != v17)
  {
    WTF::String::isolatedCopy();
    if (v65[0])
      v18 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v18 = &stru_1E351F1B8;
    objc_msgSend(v10, "addObject:", v18);
    v20 = v65[0];
    v65[0] = 0;
    if (v20)
    {
      if (*(_DWORD *)v20 == 2)
        WTF::StringImpl::destroy(v20, v19);
      else
        *(_DWORD *)v20 -= 2;
    }
    v21 = v15 + 1;
    while (v21 - 1 != v13 && v21 != v13)
    {
      v23 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v21 + 16))(*v21);
      ++v21;
      if (v23 == 21)
      {
        v15 = v21 - 1;
        goto LABEL_27;
      }
    }
    v15 = v13;
LABEL_27:
    ;
  }
  API::Array::createStringArray((uint64_t)a3 + 40, &v59);
  v24 = v59;
  v25 = *(_QWORD **)(v59 + 16);
  v26 = *(unsigned int *)(v59 + 28);
  v27 = &v25[v26];
  if ((_DWORD)v26)
  {
    v28 = 8 * v26;
    while ((*(unsigned int (**)(_QWORD))(*(_QWORD *)*v25 + 16))(*v25) != 21)
    {
      ++v25;
      v28 -= 8;
      if (!v28)
      {
        v25 = v27;
        break;
      }
    }
    v29 = v25;
    v25 = *(_QWORD **)(v24 + 16);
    v30 = *(unsigned int *)(v24 + 28);
  }
  else
  {
    v30 = 0;
    v29 = *(_QWORD **)(v59 + 16);
  }
  v31 = &v25[v30];
  while (v29 != v31)
  {
    v32 = *(_QWORD *)(*v29 + 16);
    if (v32)
    {
      v33 = *(unsigned int *)(v32 + 4);
      if (v33 >= 2)
      {
        v34 = *(_QWORD *)(v32 + 8);
        v35 = (v33 - 1);
        v36 = v33 - 1;
        if ((*(_BYTE *)(v32 + 16) & 4) != 0)
        {
          if (v36 < v35)
            goto LABEL_98;
        }
        else if (v36 < v35)
        {
LABEL_98:
          __break(1u);
          goto LABEL_99;
        }
      }
    }
    WebCore::MIMETypeRegistry::mimeTypeForExtension();
    v38 = v65[0];
    if (v65[0])
    {
      if (*((_DWORD *)v65[0] + 1))
      {
        objc_msgSend(v10, "addObject:", WTF::StringImpl::operator NSString *());
        v38 = v65[0];
        v65[0] = 0;
        if (!v38)
          goto LABEL_50;
      }
      else
      {
        v65[0] = 0;
      }
      if (*(_DWORD *)v38 == 2)
        WTF::StringImpl::destroy(v38, v37);
      else
        *(_DWORD *)v38 -= 2;
    }
LABEL_50:
    v39 = v29 + 1;
    while (v39 - 1 != v27 && v39 != v27)
    {
      v41 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v39 + 16))(*v39);
      ++v39;
      if (v41 == 21)
      {
        v29 = v39 - 1;
        goto LABEL_58;
      }
    }
    v29 = v27;
LABEL_58:
    ;
  }
  v42 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v43 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v62;
    v45 = (void *)*MEMORY[0x1E0CEC568];
    v46 = (void *)*MEMORY[0x1E0CEC520];
    while (2)
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v62 != v44)
          objc_enumerationMutation(v10);
        v48 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        if ((objc_msgSend(v48, "isEqualToString:", CFSTR("*/*")) & 1) != 0)
        {
          v42 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
          goto LABEL_78;
        }
        v49 = objc_msgSend(v48, "caseInsensitiveCompare:", CFSTR("image/*"));
        v50 = v46;
        if (v49)
        {
          v51 = objc_msgSend(v48, "caseInsensitiveCompare:", CFSTR("video/*"));
          v50 = v45;
          if (v51)
          {
            v52 = objc_msgSend(v48, "caseInsensitiveCompare:", CFSTR("audio/*"));
            v50 = v45;
            if (v52)
            {
              v50 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithMIMEType:", v48);
              if (!v50)
                continue;
            }
          }
        }
        objc_msgSend(v42, "addObject:", objc_msgSend(v50, "identifier"));
      }
      v43 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      if (v43)
        continue;
      break;
    }
  }
LABEL_78:
  if (v42)
    CFRetain(v42);
  v53 = v58->_acceptedUTIs.m_ptr;
  v58->_acceptedUTIs.m_ptr = v42;
  if (v53)
  {
    CFRelease(v53);
    v42 = v58->_acceptedUTIs.m_ptr;
  }
  if (!objc_msgSend(v42, "count"))
  {
    v56 = 3;
    v55 = v58;
    goto LABEL_88;
  }
  if (setContainsUTIThatConformsTo(v58->_acceptedUTIs.m_ptr, *MEMORY[0x1E0CEC520]))
    v58->_allowedImagePickerTypes.m_storage |= 1u;
  v54 = setContainsUTIThatConformsTo(v58->_acceptedUTIs.m_ptr, *MEMORY[0x1E0CEC568]);
  v55 = v58;
  if (v54)
  {
    v56 = 2;
LABEL_88:
    v55->_allowedImagePickerTypes.m_storage |= v56;
  }
  v55->_mediaCaptureType = 0;
  v55->_mediaCaptureType = *((_BYTE *)a3 + 72);
  if (-[WKFileUploadPanel platformSupportsPickerViewController](v55, "platformSupportsPickerViewController"))
  {
    if (-[WKFileUploadPanel _shouldMediaCaptureOpenMediaDevice](v58, "_shouldMediaCaptureOpenMediaDevice"))
    {
      -[WKFileUploadPanel _adjustMediaCaptureType](v58, "_adjustMediaCaptureType");
      v58->_usingCamera = 1;
      -[WKFileUploadPanel _showCamera](v58, "_showCamera");
    }
    else
    {
      -[WKFileUploadPanel showDocumentPickerMenu](v58, "showDocumentPickerMenu");
    }
  }
  else
  {
    -[WKFileUploadPanel _cancel](v58, "_cancel");
  }
  v34 = v59;
  if (v59)
LABEL_99:
    CFRelease(*(CFTypeRef *)(v34 + 8));
  if (v60)
    CFRelease(*(CFTypeRef *)(v60 + 8));
}

- (void)dismiss
{
  id WeakRetained;
  const void *v4;
  void *m_ptr;

  WeakRetained = objc_loadWeakRetained(&self->_view.m_weakReference);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend((id)objc_msgSend(WeakRetained, "_wk_viewControllerForFullScreenPresentation"), "dismissViewControllerAnimated:completion:", 0, 0);
    CFRelease(v4);
  }
  m_ptr = self->_presentationViewController.m_ptr;
  self->_presentationViewController.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  -[WKFileUploadPanel _cancel](self, "_cancel");
}

- (BOOL)dismissIfNeededWithReason:(unsigned __int8)a3
{
  if (a3 == 1)
  {
    if ((objc_msgSend(self->_documentPickerController.m_ptr, "_wk_isInFullscreenPresentation") & 1) != 0
      || (objc_msgSend(self->_photoPicker.m_ptr, "_wk_isInFullscreenPresentation") & 1) != 0
      || (objc_msgSend(self->_cameraPicker.m_ptr, "_wk_isInFullscreenPresentation") & 1) != 0)
    {
      return 0;
    }
    goto LABEL_7;
  }
  if ((a3 - 1) <= 1)
LABEL_7:
    -[WKFileUploadPanel setDelegate:](self, "setDelegate:", 0);
  -[WKFileUploadPanel dismiss](self, "dismiss");
  return 1;
}

- (void)_dismissDisplayAnimated:(BOOL)a3
{
  void *m_ptr;
  _BOOL8 v5;
  WKFileUploadPanel *v6;
  _QWORD v7[5];

  m_ptr = self->_presentationViewController.m_ptr;
  if (m_ptr)
  {
    v5 = a3;
    v6 = (WKFileUploadPanel *)objc_msgSend(m_ptr, "presentedViewController");
    if (v6 == self || v6 == self->_cameraPicker.m_ptr || v6 == self->_photoPicker.m_ptr)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __45__WKFileUploadPanel__dismissDisplayAnimated___block_invoke;
      v7[3] = &unk_1E34BAF80;
      v7[4] = self;
      -[WKFileUploadPanel dismissViewControllerAnimated:completion:](v6, "dismissViewControllerAnimated:completion:", v5, v7);
    }
  }
}

void __45__WKFileUploadPanel__dismissDisplayAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(const void **)(v1 + 1048);
  *(_QWORD *)(v1 + 1048) = 0;
  if (v2)
    CFRelease(v2);
}

- (id)currentAvailableActionTitles
{
  void *v3;
  void *v4;
  int m_storage;
  const __CFString *v6;
  const __CFString *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = v3;
  if ((self->_allowedImagePickerTypes.m_storage & 3) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("Photo Library"));
    m_storage = self->_allowedImagePickerTypes.m_storage;
    v6 = CFSTR("Take Video");
    if ((m_storage & 2) == 0)
      v6 = CFSTR("Take Photo");
    if ((~m_storage & 3) != 0)
      v7 = v6;
    else
      v7 = CFSTR("Take Photo or Video");
    objc_msgSend(v4, "addObject:", v7);
  }
  objc_msgSend(v4, "addObject:", -[WKFileUploadPanel _chooseFilesButtonLabel](self, "_chooseFilesButtonLabel"));
  return v4;
}

- (id)acceptedTypeIdentifiers
{
  return (id)objc_msgSend((id)objc_msgSend(self->_acceptedUTIs.m_ptr, "allObjects"), "sortedArrayUsingSelector:", sel_compare_);
}

- (id)_mediaTypesForPickerSourceType:(int64_t)a3
{
  void *v4;
  void *m_ptr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id obj;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CEA648], "availableMediaTypesForSourceType:", a3);
  m_ptr = self->_acceptedUTIs.m_ptr;
  if (!objc_msgSend(m_ptr, "count"))
    return v4;
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (!v6)
    goto LABEL_21;
  v7 = v6;
  v8 = *(_QWORD *)v25;
  obj = v4;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v25 != v8)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9);
      if ((objc_msgSend(m_ptr, "containsObject:", v10, obj) & 1) != 0)
        goto LABEL_8;
      v11 = objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v10);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v12 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v21;
LABEL_13:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(m_ptr);
          if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15)), "conformsToType:", v11) & 1) != 0)break;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v13)
              goto LABEL_13;
            goto LABEL_9;
          }
        }
LABEL_8:
        objc_msgSend(v19, "addObject:", v10);
      }
LABEL_9:
      ++v9;
    }
    while (v9 != v7);
    v4 = obj;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    v7 = v16;
  }
  while (v16);
LABEL_21:
  if (!objc_msgSend(v19, "count"))
    return v4;
  return v19;
}

- (int64_t)_preferredAssetRepresentationMode
{
  WKFileUploadPanelDelegate **p_delegate;

  p_delegate = &self->_delegate;
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || !objc_msgSend(objc_loadWeak((id *)p_delegate), "fileUploadPanelPhotoPickerPrefersOriginalImageFormat:", self))
  {
    return 2;
  }
  if (!objc_msgSend(self->_acceptedUTIs.m_ptr, "count"))
    return 1;
  if (objc_msgSend(self->_acceptedUTIs.m_ptr, "containsObject:", objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier")))return 1;
  return 2;
}

- (id)_chooseFilesButtonLabel
{
  WTF::StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  if (!self->_allowMultipleFiles)
  {
    WebCore::fileButtonChooseFileLabel((WebCore *)self);
    if (v5)
      goto LABEL_5;
    return &stru_1E351F1B8;
  }
  WebCore::fileButtonChooseMultipleFilesLabel((WebCore *)self);
  if (!v5)
    return &stru_1E351F1B8;
LABEL_5:
  v3 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
    WTF::StringImpl::destroy(v5, v2);
  else
    *(_DWORD *)v5 -= 2;
  return v3;
}

- (id)_photoLibraryButtonLabel
{
  WTF::StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  WebCore::localizedString((WebCore *)CFSTR("Photo Library (file upload action sheet)"), (const __CFString *)a2);
  if (!v5)
    return &stru_1E351F1B8;
  v3 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
    WTF::StringImpl::destroy(v5, v2);
  else
    *(_DWORD *)v5 -= 2;
  return v3;
}

- (id)_cameraButtonLabel
{
  int m_storage;
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v6;

  m_storage = self->_allowedImagePickerTypes.m_storage;
  if ((~m_storage & 3) == 0)
  {
    WebCore::localizedString((WebCore *)CFSTR("Take Photo or Video (file upload action sheet)"), (const __CFString *)a2);
    if (v6)
      goto LABEL_8;
    return &stru_1E351F1B8;
  }
  if ((m_storage & 2) != 0)
  {
    WebCore::localizedString((WebCore *)CFSTR("Take Video (file upload action sheet)"), (const __CFString *)a2);
    if (v6)
      goto LABEL_8;
    return &stru_1E351F1B8;
  }
  WebCore::localizedString((WebCore *)CFSTR("Take Photo (file upload action sheet)"), (const __CFString *)a2);
  if (!v6)
    return &stru_1E351F1B8;
LABEL_8:
  v4 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v6 == 2)
    WTF::StringImpl::destroy(v6, v3);
  else
    *(_DWORD *)v6 -= 2;
  return v4;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  return (id)objc_msgSend(objc_loadWeak(&self->_view.m_weakReference), "_createTargetedContextMenuHintPreviewIfPossible");
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v4;
  id v7;
  _QWORD v8[5];
  id v9;

  v7 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3321888768;
  v8[2] = __75__WKFileUploadPanel_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v8[3] = &__block_descriptor_48_e8_32c88_ZTSKZ75__WKFileUploadPanel_contextMenuInteraction_configurationForMenuAtLocation__E3__6_e25___UIMenu_16__0__NSArray_8l;
  objc_initWeak(&v7, self);
  v8[4] = self;
  v9 = 0;
  objc_copyWeak(&v9, &v7);
  objc_destroyWeak(&v7);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CEA4B0], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v8);
  objc_destroyWeak(&v9);
  return v4;
}

uint64_t __75__WKFileUploadPanel_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    return 0;
  v3 = WeakRetained;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1056) = 0;
  v4 = (void *)MEMORY[0x1E0CEA2A8];
  v5 = objc_msgSend(WeakRetained, "_chooseFilesButtonLabel");
  v6 = objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("folder"));
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = ___ZZ75__WKFileUploadPanel_contextMenuInteraction_configurationForMenuAtLocation__ENK3__6clEP7NSArrayIP13UIMenuElementE_block_invoke;
  v21[3] = &unk_1E34CEDA0;
  v21[4] = *(_QWORD *)(a1 + 32);
  v8 = objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, CFSTR("choose"), v21);
  v9 = (void *)MEMORY[0x1E0CEA2A8];
  v10 = objc_msgSend(v3, "_photoLibraryButtonLabel");
  v11 = objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("photo.on.rectangle"));
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = ___ZZ75__WKFileUploadPanel_contextMenuInteraction_configurationForMenuAtLocation__ENK3__6clEP7NSArrayIP13UIMenuElementE_block_invoke_2;
  v20[3] = &unk_1E34CEDA0;
  v20[4] = *(_QWORD *)(a1 + 32);
  v12 = objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v11, CFSTR("photo"), v20);
  if (objc_msgSend(MEMORY[0x1E0CEA648], "isSourceTypeAvailable:", 1))
  {
    v13 = objc_msgSend(v3, "_cameraButtonLabel");
    v14 = (void *)MEMORY[0x1E0CEA2A8];
    v15 = objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("camera"));
    v23 = v7;
    v24 = 3221225472;
    v25 = ___ZZ75__WKFileUploadPanel_contextMenuInteraction_configurationForMenuAtLocation__ENK3__6clEP7NSArrayIP13UIMenuElementE_block_invoke_3;
    v26 = &unk_1E34CEDA0;
    v27 = *(_QWORD *)(a1 + 32);
    v16 = objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v13, v15, CFSTR("camera"), &v23);
    v22[0] = v12;
    v22[1] = v16;
    v22[2] = v8;
    v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  }
  else
  {
    v23 = v12;
    v24 = v8;
    v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 2);
  }
  v18 = objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:children:", &stru_1E351F1B8, v17);
  CFRelease(v3);
  return v18;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  _QWORD v5[5];

  if (!self->_isRepositioningContextMenu)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __77__WKFileUploadPanel_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
    v5[3] = &unk_1E34BAF80;
    v5[4] = self;
    objc_msgSend(a5, "addCompletion:", v5, a4);
  }
}

_BYTE *__77__WKFileUploadPanel_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  _BYTE *result;

  objc_msgSend(*(id *)(a1 + 32), "resetContextMenuPresenter");
  result = *(_BYTE **)(a1 + 32);
  if (!result[1056])
    return (_BYTE *)objc_msgSend(result, "_cancel");
  return result;
}

- (void)resetContextMenuPresenter
{
  id **p_menuPresenter;

  p_menuPresenter = (id **)&self->_menuPresenter;
  if (*p_menuPresenter)
  {
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_menuPresenter, 0);
    objc_msgSend(objc_loadWeak(&self->_view.m_weakReference), "_removeContextMenuHintContainerIfPossible");
  }
}

- (void)contextMenuPresenter
{
  id **p_menuPresenter;
  id WeakRetained;
  id *v5;

  p_menuPresenter = (id **)&self->_menuPresenter;
  if (!self->_menuPresenter.__ptr_.__value_)
  {
    WeakRetained = objc_loadWeakRetained(&self->_view.m_weakReference);
    v5 = (id *)WTF::fastMalloc((WTF *)0x10);
    WebKit::CompactContextMenuPresenter::CompactContextMenuPresenter(v5, WeakRetained, (uint64_t)self);
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_menuPresenter, v5);
    if (WeakRetained)
      CFRelease(WeakRetained);
  }
  return *p_menuPresenter;
}

- (void)repositionContextMenuIfNeeded
{
  WeakObjCPtr<WKContentView> *p_view;
  CGFloat *v4;
  CGFloat *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  BOOL isRepositioningContextMenu;
  _QWORD v13[5];
  CGPoint v14;
  CGRect v15;
  CGRect v16;

  if (self->_menuPresenter.__ptr_.__value_)
  {
    p_view = &self->_view;
    v4 = (CGFloat *)objc_msgSend(objc_loadWeak(&self->_view.m_weakReference), "webView");
    if (v4)
    {
      v5 = v4;
      v6 = v4[144];
      v7 = v4[145];
      v8 = v4[146];
      v9 = v4[147];
      v15.origin.x = v6;
      v15.origin.y = v7;
      v15.size.width = v8;
      v15.size.height = v9;
      if (!CGRectIsEmpty(v15))
      {
        objc_msgSend(objc_loadWeak(&p_view->m_weakReference), "convertPoint:toView:", -[CGFloat window](v5, "window"), self->_interactionPoint.x, self->_interactionPoint.y);
        v14.x = v10;
        v14.y = v11;
        v16.origin.x = v6;
        v16.origin.y = v7;
        v16.size.width = v8;
        v16.size.height = v9;
        if (CGRectContainsPoint(v16, v14))
        {
          isRepositioningContextMenu = self->_isRepositioningContextMenu;
          self->_isRepositioningContextMenu = 1;
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __50__WKFileUploadPanel_repositionContextMenuIfNeeded__block_invoke;
          v13[3] = &unk_1E34BAF80;
          v13[4] = self;
          objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v13);
          self->_isRepositioningContextMenu = isRepositioningContextMenu;
        }
      }
    }
  }
}

uint64_t __50__WKFileUploadPanel_repositionContextMenuIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  CGRect v5;

  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064) + 8), "contextMenuInteraction"), "dismissMenu");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id **)(v2 + 1064);
  v2 += 1000;
  v5.origin.x = *(CGFloat *)v2;
  v5.origin.y = *(CGFloat *)(v2 + 8);
  v5.size.width = *(CGFloat *)MEMORY[0x1E0C9D820];
  v5.size.height = *(CGFloat *)(MEMORY[0x1E0C9D820] + 8);
  return WebKit::CompactContextMenuPresenter::present(v3, v5);
}

- (void)showFilePickerMenu
{
  void *v3;
  id v4;
  void *m_ptr;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(self->_acceptedUTIs.m_ptr, "allObjects");
  if (!objc_msgSend(v3, "count"))
  {
    v10[0] = objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  }
  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  m_ptr = self->_uploadFileManager.m_ptr;
  self->_uploadFileManager.m_ptr = v4;
  if (m_ptr)
    CFRelease(m_ptr);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3600]);
  v7 = self->_uploadFileCoordinator.m_ptr;
  self->_uploadFileCoordinator.m_ptr = v6;
  if (v7)
    CFRelease(v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA548]), "initWithDocumentTypes:inMode:", v3, 0);
  v9 = self->_documentPickerController.m_ptr;
  self->_documentPickerController.m_ptr = v8;
  if (v9)
  {
    CFRelease(v9);
    v8 = self->_documentPickerController.m_ptr;
  }
  objc_msgSend(v8, "setAllowsMultipleSelection:", self->_allowMultipleFiles);
  objc_msgSend(self->_documentPickerController.m_ptr, "setDelegate:", self);
  objc_msgSend((id)objc_msgSend(self->_documentPickerController.m_ptr, "presentationController"), "setDelegate:", self);
  objc_loadWeak((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_documentPickerController.m_ptr, "_setIsContentManaged:", objc_msgSend(objc_loadWeak((id *)&self->_delegate), "fileUploadPanelDestinationIsManaged:", self));
  -[WKFileUploadPanel _presentFullscreenViewController:animated:](self, "_presentFullscreenViewController:animated:", self->_documentPickerController.m_ptr, 1);
}

- (void)showDocumentPickerMenu
{
  id *v3;
  void *m_ptr;
  CGRect v5;

  if ((self->_allowedImagePickerTypes.m_storage & 3) != 0)
  {
    v3 = -[WKFileUploadPanel contextMenuPresenter](self, "contextMenuPresenter");
    v5.origin.x = self->_interactionPoint.x;
    v5.origin.y = self->_interactionPoint.y;
    v5.size.width = *(CGFloat *)MEMORY[0x1E0C9D820];
    v5.size.height = *(CGFloat *)(MEMORY[0x1E0C9D820] + 8);
    WebKit::CompactContextMenuPresenter::present(v3, v5);
  }
  else
  {
    -[WKFileUploadPanel showFilePickerMenu](self, "showFilePickerMenu");
  }
  m_ptr = self->_presentationViewController.m_ptr;
  self->_presentationViewController.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)_adjustMediaCaptureType
{
  unsigned __int8 v3;

  if ((objc_msgSend(MEMORY[0x1E0CEA648], "isCameraDeviceAvailable:", 1) & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0CEA648], "isCameraDeviceAvailable:", 0))
  {
    v3 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(MEMORY[0x1E0CEA648], "isCameraDeviceAvailable:", 1) & 1) == 0)
    self->_mediaCaptureType = 2;
  if ((objc_msgSend(MEMORY[0x1E0CEA648], "isCameraDeviceAvailable:", 0) & 1) == 0)
  {
    v3 = 1;
LABEL_8:
    self->_mediaCaptureType = v3;
  }
}

- (BOOL)_shouldMediaCaptureOpenMediaDevice
{
  if (self->_mediaCaptureType)
    return objc_msgSend(MEMORY[0x1E0CEA648], "isSourceTypeAvailable:", 1);
  else
    return 0;
}

- (void)_showCamera
{
  id v3;
  void *m_ptr;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA648]);
  m_ptr = self->_cameraPicker.m_ptr;
  self->_cameraPicker.m_ptr = v3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v3 = self->_cameraPicker.m_ptr;
  }
  objc_msgSend(v3, "setSourceType:", 1);
  objc_msgSend(self->_cameraPicker.m_ptr, "setMediaTypes:", -[WKFileUploadPanel _mediaTypesForPickerSourceType:](self, "_mediaTypesForPickerSourceType:", 1));
  objc_msgSend(self->_cameraPicker.m_ptr, "setDelegate:", self);
  objc_msgSend((id)objc_msgSend(self->_cameraPicker.m_ptr, "presentationController"), "setDelegate:", self);
  objc_msgSend(self->_cameraPicker.m_ptr, "setAllowsEditing:", 0);
  objc_msgSend(self->_cameraPicker.m_ptr, "_setAllowsMultipleSelection:", self->_allowMultipleFiles);
  objc_msgSend(self->_cameraPicker.m_ptr, "_setRequiresPickingConfirmation:", 1);
  objc_msgSend(self->_cameraPicker.m_ptr, "_setShowsFileSizePicker:", 1);
  if (self->_mediaCaptureType)
    objc_msgSend(self->_cameraPicker.m_ptr, "setCameraDevice:", self->_mediaCaptureType == 1);
  -[WKFileUploadPanel _presentFullscreenViewController:animated:](self, "_presentFullscreenViewController:animated:", self->_cameraPicker.m_ptr, 1);
}

- (void)_showPhotoPicker
{
  void *v3;
  int m_storage;
  uint64_t v6;
  id v7;
  void *m_ptr;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_msgSend(objc_alloc((Class)off_1EE33FF98()), "init");
  objc_msgSend(v3, "setSelectionLimit:", !self->_allowMultipleFiles);
  objc_msgSend(v3, "setPreferredAssetRepresentationMode:", -[WKFileUploadPanel _preferredAssetRepresentationMode](self, "_preferredAssetRepresentationMode"));
  objc_msgSend(v3, "_setAllowsDownscaling:", 1);
  m_storage = self->_allowedImagePickerTypes.m_storage;
  if ((m_storage & (m_storage - 1)) == 0 && m_storage != 0)
  {
    if (m_storage == 1)
      v6 = objc_msgSend((id)_MergedGlobals_48(), "imagesFilter");
    else
      v6 = objc_msgSend((id)_MergedGlobals_48(), "videosFilter");
    objc_msgSend(v3, "setFilter:", v6);
  }
  v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  m_ptr = self->_uploadFileManager.m_ptr;
  self->_uploadFileManager.m_ptr = v7;
  if (m_ptr)
    CFRelease(m_ptr);
  v9 = objc_alloc_init(MEMORY[0x1E0CB3600]);
  v10 = self->_uploadFileCoordinator.m_ptr;
  self->_uploadFileCoordinator.m_ptr = v9;
  if (v10)
    CFRelease(v10);
  v11 = (void *)objc_msgSend(objc_alloc((Class)off_1EE33FFA0()), "initWithConfiguration:", v3);
  v12 = self->_photoPicker.m_ptr;
  self->_photoPicker.m_ptr = v11;
  if (v12)
  {
    CFRelease(v12);
    v11 = self->_photoPicker.m_ptr;
  }
  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend((id)objc_msgSend(self->_photoPicker.m_ptr, "presentationController"), "setDelegate:", self);
  -[WKFileUploadPanel _presentFullscreenViewController:animated:](self, "_presentFullscreenViewController:animated:", self->_photoPicker.m_ptr, 1);
  if (v3)
    CFRelease(v3);
}

- (void)_presentFullscreenViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *m_ptr;

  v4 = a4;
  -[WKFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", a4);
  v7 = (void *)objc_msgSend(objc_loadWeak(&self->_view.m_weakReference), "_wk_viewControllerForFullScreenPresentation");
  v8 = v7;
  if (v7)
    CFRetain(v7);
  m_ptr = self->_presentationViewController.m_ptr;
  self->_presentationViewController.m_ptr = v8;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v8 = self->_presentationViewController.m_ptr;
  }
  objc_msgSend(v8, "presentViewController:animated:completion:", a3, v4, 0);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  _QWORD *v6;
  NSObject *global_queue;

  -[WKFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", 1);
  if (self)
    CFRetain(self);
  if (a4)
    CFRetain(a4);
  v6 = malloc_type_malloc(0x30uLL, 0x10E004097807CC0uLL);
  *v6 = MEMORY[0x1E0C809A0];
  v6[1] = 50331650;
  v6[2] = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKFileUploadPanel documentPicker:didPickDocumentsAtURLs:]::$_5>(-[WKFileUploadPanel documentPicker:didPickDocumentsAtURLs:]::$_5)::{lambda(void *)#1}::__invoke;
  v6[3] = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKFileUploadPanel documentPicker:didPickDocumentsAtURLs:]::$_5>(-[WKFileUploadPanel documentPicker:didPickDocumentsAtURLs:]::$_5)::descriptor;
  v6[4] = self;
  v6[5] = a4;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, v6);
  _Block_release(v6);
}

- (void)documentPickerWasCancelled:(id)a3
{
  -[WKFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", 1);
  -[WKFileUploadPanel _cancel](self, "_cancel");
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  _QWORD v4[5];
  _QWORD v5[5];

  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__WKFileUploadPanel_picker_didFinishPicking___block_invoke;
  v5[3] = &unk_1E34CEBF8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__WKFileUploadPanel_picker_didFinishPicking___block_invoke_2;
  v4[3] = &unk_1E34BAF80;
  -[WKFileUploadPanel _processPickerResults:successBlock:failureBlock:](self, "_processPickerResults:successBlock:failureBlock:", a4, v5, v4);
}

uint64_t __45__WKFileUploadPanel_picker_didFinishPicking___block_invoke(uint64_t a1, CFTypeRef cf)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    CFRetain(*(CFTypeRef *)(a1 + 32));
  if (cf)
    CFRetain(cf);
  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v4 = &off_1E34CEE18;
  v4[1] = v3;
  v4[2] = v3;
  v4[3] = cf;
  v6 = (uint64_t)v4;
  WTF::ensureOnMainRunLoop();
  result = v6;
  if (v6)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  return result;
}

uint64_t __45__WKFileUploadPanel_picker_didFinishPicking___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;
  _QWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    CFRetain(*(CFTypeRef *)(a1 + 32));
  v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v2 = &off_1E34CEE40;
  v2[1] = v1;
  v2[2] = v1;
  v4 = v2;
  WTF::ensureOnMainRunLoop();
  result = (uint64_t)v4;
  if (v4)
    return (*(uint64_t (**)(_QWORD *))(*v4 + 8))(v4);
  return result;
}

- (BOOL)_willMultipleSelectionDelegateBeCalled
{
  return self->_allowMultipleFiles && !self->_usingCamera;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!-[WKFileUploadPanel _willMultipleSelectionDelegateBeCalled](self, "_willMultipleSelectionDelegateBeCalled", a3))
  {
    v9[0] = a4;
    v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__WKFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
    v8[3] = &unk_1E34CEBF8;
    v8[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__WKFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_2;
    v7[3] = &unk_1E34BAF80;
    -[WKFileUploadPanel _processMediaInfoDictionaries:successBlock:failureBlock:](self, "_processMediaInfoDictionaries:successBlock:failureBlock:", v6, v8, v7);
  }
}

uint64_t __73__WKFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1, CFTypeRef cf)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    CFRetain(*(CFTypeRef *)(a1 + 32));
  if (cf)
    CFRetain(cf);
  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v4 = &off_1E34CEE68;
  v4[1] = v3;
  v4[2] = v3;
  v4[3] = cf;
  v6 = (uint64_t)v4;
  WTF::ensureOnMainRunLoop();
  result = v6;
  if (v6)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  return result;
}

uint64_t __73__WKFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;
  _QWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    CFRetain(*(CFTypeRef *)(a1 + 32));
  v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v2 = &off_1E34CEE90;
  v2[1] = v1;
  v2[2] = v1;
  v4 = v2;
  WTF::ensureOnMainRunLoop();
  result = (uint64_t)v4;
  if (v4)
    return (*(uint64_t (**)(_QWORD *))(*v4 + 8))(v4);
  return result;
}

- (void)imagePickerController:(id)a3 didFinishPickingMultipleMediaWithInfo:(id)a4
{
  _QWORD v4[5];
  _QWORD v5[5];

  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__WKFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke;
  v5[3] = &unk_1E34CEBF8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__WKFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_2;
  v4[3] = &unk_1E34BAF80;
  -[WKFileUploadPanel _processMediaInfoDictionaries:successBlock:failureBlock:](self, "_processMediaInfoDictionaries:successBlock:failureBlock:", a4, v5, v4);
}

uint64_t __81__WKFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_uploadMediaItemsTranscodingVideo:", a2);
}

uint64_t __81__WKFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;
  _QWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    CFRetain(*(CFTypeRef *)(a1 + 32));
  v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v2 = &off_1E34CEEB8;
  v2[1] = v1;
  v2[2] = v1;
  v4 = v2;
  WTF::ensureOnMainRunLoop();
  result = (uint64_t)v4;
  if (v4)
    return (*(uint64_t (**)(_QWORD *))(*v4 + 8))(v4);
  return result;
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  -[WKFileUploadPanel _dismissDisplayAnimated:](self, "_dismissDisplayAnimated:", 1);
  -[WKFileUploadPanel _cancel](self, "_cancel");
}

- (void)_processMediaInfoDictionaries:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  -[WKFileUploadPanel _processMediaInfoDictionaries:atIndex:processedResults:successBlock:failureBlock:](self, "_processMediaInfoDictionaries:atIndex:processedResults:successBlock:failureBlock:", a3, 0, objc_msgSend(MEMORY[0x1E0C99DE8], "array"), a4, a5);
}

- (void)_processPickerResults:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  -[WKFileUploadPanel _processPickerResults:atIndex:processedResults:successBlock:failureBlock:](self, "_processPickerResults:atIndex:processedResults:successBlock:failureBlock:", a3, 0, objc_msgSend(MEMORY[0x1E0C99DE8], "array"), a4, a5);
}

- (void)_processPickerResults:(id)a3 atIndex:(unint64_t)a4 processedResults:(id)a5 successBlock:(id)a6 failureBlock:(id)a7
{
  uint64_t v13;
  _QWORD v14[10];

  if (objc_msgSend(a3, "count") == a4)
  {
    (*((void (**)(id, id))a6 + 2))(a6, a5);
  }
  else
  {
    v13 = objc_msgSend(a3, "objectAtIndex:", a4);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __94__WKFileUploadPanel__processPickerResults_atIndex_processedResults_successBlock_failureBlock___block_invoke;
    v14[3] = &unk_1E34CEC20;
    v14[4] = a5;
    v14[5] = self;
    v14[6] = a3;
    v14[7] = a6;
    v14[8] = a7;
    v14[9] = a4 + 1;
    -[WKFileUploadPanel _uploadItemFromResult:successBlock:failureBlock:](self, "_uploadItemFromResult:successBlock:failureBlock:", v13, v14, a7);
  }
}

uint64_t __94__WKFileUploadPanel__processPickerResults_atIndex_processedResults_successBlock_failureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_processPickerResults:atIndex:processedResults:successBlock:failureBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_uploadItemFromResult:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  void *v9;
  uint64_t UTIThatConformsTo;
  void *v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *, void *, uint64_t);
  void *v18;
  WKFileUploadPanel *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(_QWORD *, void *, uint64_t);
  void *v25;
  WKFileUploadPanel *v26;
  id v27;
  id v28;

  v9 = (void *)objc_msgSend((id)objc_msgSend(a3, "itemProvider"), "registeredTypeIdentifiers");
  UTIThatConformsTo = firstUTIThatConformsTo(v9, *MEMORY[0x1E0CEC568]);
  v11 = (void *)objc_msgSend(a3, "itemProvider");
  if (UTIThatConformsTo)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __69__WKFileUploadPanel__uploadItemFromResult_successBlock_failureBlock___block_invoke;
    v25 = &unk_1E34CEC48;
    v26 = self;
    v27 = a5;
    v28 = a4;
    v12 = &v22;
LABEL_5:
    objc_msgSend(v11, "loadFileRepresentationForTypeIdentifier:completionHandler:", UTIThatConformsTo, v12, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
    return;
  }
  v13 = (void *)objc_msgSend(v11, "registeredTypeIdentifiers");
  v14 = firstUTIThatConformsTo(v13, *MEMORY[0x1E0CEC520]);
  if (v14)
  {
    UTIThatConformsTo = v14;
    v11 = (void *)objc_msgSend(a3, "itemProvider");
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __69__WKFileUploadPanel__uploadItemFromResult_successBlock_failureBlock___block_invoke_2;
    v18 = &unk_1E34CEC48;
    v19 = self;
    v20 = a5;
    v21 = a4;
    v12 = &v15;
    goto LABEL_5;
  }
  (*((void (**)(id))a5 + 2))(a5);
}

void __69__WKFileUploadPanel__uploadItemFromResult_successBlock_failureBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t *p_cf;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _WKVideoFileUploadItem *v14;
  CFTypeRef v15;
  CFTypeRef v16;
  CFTypeRef cf;

  if (a3 || (objc_msgSend(a2, "isFileURL") & 1) == 0)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v5 = (void *)a1[4];
    if (v5)
    {
      objc_msgSend(v5, "_copyToNewTemporaryDirectory:", a2);
      v6 = a1[4];
    }
    else
    {
      v6 = 0;
      v16 = 0;
      cf = 0;
    }
    p_cf = (uint64_t *)&cf;
    v8 = v6 + 1088;
    v10 = *(_DWORD *)(v6 + 1096);
    v9 = *(unsigned int *)(v6 + 1100);
    if ((_DWORD)v9 == v10)
    {
      p_cf = (uint64_t *)WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(v8, v9 + 1, (unint64_t)&cf);
      v9 = *(unsigned int *)(v8 + 12);
    }
    v11 = (_QWORD *)(*(_QWORD *)v8 + 8 * v9);
    v12 = *p_cf;
    *p_cf = 0;
    *v11 = v12;
    *(_DWORD *)(v8 + 12) = v9 + 1;
    v13 = a1[6];
    v14 = -[_WKFileUploadItem initWithFileURL:]([_WKVideoFileUploadItem alloc], "initWithFileURL:", v16);
    (*(void (**)(uint64_t, _WKVideoFileUploadItem *))(v13 + 16))(v13, v14);
    if (v14)
      CFRelease(v14);
    v15 = cf;
    cf = 0;
    if (v15)
      CFRelease(v15);
    if (v16)
      CFRelease(v16);
  }
}

void __69__WKFileUploadPanel__uploadItemFromResult_successBlock_failureBlock___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t *p_cf;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _WKImageFileUploadItem *v14;
  CFTypeRef v15;
  CFTypeRef v16;
  CFTypeRef cf;

  if (a3 || (objc_msgSend(a2, "isFileURL") & 1) == 0)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v5 = (void *)a1[4];
    if (v5)
    {
      objc_msgSend(v5, "_copyToNewTemporaryDirectory:", a2);
      v6 = a1[4];
    }
    else
    {
      v6 = 0;
      v16 = 0;
      cf = 0;
    }
    p_cf = (uint64_t *)&cf;
    v8 = v6 + 1088;
    v10 = *(_DWORD *)(v6 + 1096);
    v9 = *(unsigned int *)(v6 + 1100);
    if ((_DWORD)v9 == v10)
    {
      p_cf = (uint64_t *)WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(v8, v9 + 1, (unint64_t)&cf);
      v9 = *(unsigned int *)(v8 + 12);
    }
    v11 = (_QWORD *)(*(_QWORD *)v8 + 8 * v9);
    v12 = *p_cf;
    *p_cf = 0;
    *v11 = v12;
    *(_DWORD *)(v8 + 12) = v9 + 1;
    v13 = a1[6];
    v14 = -[_WKFileUploadItem initWithFileURL:]([_WKImageFileUploadItem alloc], "initWithFileURL:", v16);
    (*(void (**)(uint64_t, _WKImageFileUploadItem *))(v13 + 16))(v13, v14);
    if (v14)
      CFRelease(v14);
    v15 = cf;
    cf = 0;
    if (v15)
      CFRelease(v15);
    if (v16)
      CFRelease(v16);
  }
}

- (void)_processMediaInfoDictionaries:(id)a3 atIndex:(unint64_t)a4 processedResults:(id)a5 successBlock:(id)a6 failureBlock:(id)a7
{
  uint64_t v13;
  _QWORD v14[10];

  if (objc_msgSend(a3, "count") == a4)
  {
    (*((void (**)(id, id))a6 + 2))(a6, a5);
  }
  else
  {
    v13 = objc_msgSend(a3, "objectAtIndex:", a4);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __102__WKFileUploadPanel__processMediaInfoDictionaries_atIndex_processedResults_successBlock_failureBlock___block_invoke;
    v14[3] = &unk_1E34CEC20;
    v14[4] = a5;
    v14[5] = self;
    v14[6] = a3;
    v14[7] = a6;
    v14[8] = a7;
    v14[9] = a4 + 1;
    -[WKFileUploadPanel _uploadItemFromMediaInfo:successBlock:failureBlock:](self, "_uploadItemFromMediaInfo:successBlock:failureBlock:", v13, v14, a7);
  }
}

uint64_t __102__WKFileUploadPanel__processMediaInfoDictionaries_atIndex_processedResults_successBlock_failureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_processMediaInfoDictionaries:atIndex:processedResults:successBlock:failureBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_uploadItemForImageData:(id)a3 imageName:(id)a4 successBlock:(id)a5 failureBlock:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  _WKImageFileUploadItem *v11;
  _WKImageFileUploadItem *v12;
  uint64_t v13;

  v9 = objc_msgSend((id)WTF::FileSystemImpl::createTemporaryDirectory((WTF::FileSystemImpl *)CFSTR("WKWebFileUpload"), (NSString *)a2), "stringByAppendingPathComponent:", a4);
  if (v9)
  {
    v10 = v9;
    v13 = 0;
    objc_msgSend(a3, "writeToFile:options:error:", v9, 1, &v13);
    if (v13)
    {
      (*((void (**)(id))a6 + 2))(a6);
    }
    else
    {
      v11 = [_WKImageFileUploadItem alloc];
      v12 = -[_WKFileUploadItem initWithFileURL:](v11, "initWithFileURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 0));
      (*((void (**)(id, _WKImageFileUploadItem *))a5 + 2))(a5, v12);
      if (v12)
        CFRelease(v12);
    }
  }
  else
  {
    (*((void (**)(id))a6 + 2))(a6);
  }
}

- (void)_uploadItemForJPEGRepresentationOfImage:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  NSObject *global_queue;
  _QWORD v10[8];

  global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__WKFileUploadPanel__uploadItemForJPEGRepresentationOfImage_successBlock_failureBlock___block_invoke;
  v10[3] = &unk_1E34CEC70;
  v10[4] = a3;
  v10[5] = self;
  v10[6] = a5;
  v10[7] = a4;
  dispatch_async(global_queue, v10);
}

uint64_t __87__WKFileUploadPanel__uploadItemForJPEGRepresentationOfImage_successBlock_failureBlock___block_invoke(uint64_t a1)
{
  NSData *v2;

  v2 = UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 0.8);
  if (v2)
    return objc_msgSend(*(id *)(a1 + 40), "_uploadItemForImageData:imageName:successBlock:failureBlock:", v2, CFSTR("image.jpg"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_uploadItemFromMediaInfo:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  uint64_t v9;
  void *v10;
  void *v11;
  _WKImageFileUploadItem *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v9 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CEB6C0]);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v9);
  if (!objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC568]))
  {
    if ((objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC520]) & 1) != 0)
    {
      v13 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CEB6A8]);
      if (v13)
      {
        v14 = v13;
        if ((objc_msgSend(v13, "isFileURL") & 1) != 0)
        {
          v12 = -[_WKFileUploadItem initWithFileURL:]([_WKImageFileUploadItem alloc], "initWithFileURL:", v14);
          (*((void (**)(id, _WKImageFileUploadItem *))a4 + 2))(a4, v12);
          if (v12)
            goto LABEL_4;
          return;
        }
      }
      else
      {
        v15 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CEB6D0]);
        if (v15)
        {
          -[WKFileUploadPanel _uploadItemForJPEGRepresentationOfImage:successBlock:failureBlock:](self, "_uploadItemForJPEGRepresentationOfImage:successBlock:failureBlock:", v15, a4, a5);
          return;
        }
      }
    }
LABEL_12:
    (*((void (**)(id))a5 + 2))(a5);
    return;
  }
  v11 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CEB6C8]);
  if ((objc_msgSend(v11, "isFileURL") & 1) == 0)
    goto LABEL_12;
  v12 = -[_WKFileUploadItem initWithFileURL:]([_WKVideoFileUploadItem alloc], "initWithFileURL:", v11);
  (*((void (**)(id, _WKImageFileUploadItem *))a4 + 2))(a4, v12);
  if (v12)
LABEL_4:
    CFRelease(v12);
}

- (void)_uploadMediaItemsTranscodingVideo:(id)a3
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v5 = objc_msgSend((id)objc_msgSend(a3, "indexesOfObjectsPassingTest:", &__block_literal_global_331), "count");
  if (self)
    CFRetain(self);
  if (a3)
    CFRetain(a3);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
  *v6 = &off_1E34CEEE0;
  v6[1] = self;
  v6[2] = self;
  v6[3] = a3;
  v6[4] = v5;
  v7 = v6;
  WTF::ensureOnMainRunLoop();
  if (v7)
    (*(void (**)(_QWORD *))(*v7 + 8))(v7);
}

uint64_t __55__WKFileUploadPanel__uploadMediaItemsTranscodingVideo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isVideo");
}

- (pair<WTF::RetainPtr<NSURL>,)_copyToNewTemporaryDirectory:(id)a3
{
  id *v3;
  id *v6;
  void *TemporaryDirectory;
  void *v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  const void *v12;
  void *m_ptr;
  uint64_t v14;
  uint64_t *v15;
  void *v16;
  void *v17;
  CFTypeRef v18;
  _QWORD v19[7];
  CFTypeRef cf;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  void *v26;
  CFTypeRef v27;
  CFTypeRef v28;
  uint64_t v29;
  pair<WTF::RetainPtr<NSURL>, WTF::RetainPtr<NSURL>> result;

  v6 = v3;
  v29 = 0;
  TemporaryDirectory = (void *)WTF::FileSystemImpl::createTemporaryDirectory((WTF::FileSystemImpl *)CFSTR("WKFileUploadPanel"), (NSString *)a2);
  if (TemporaryDirectory)
  {
    v9 = TemporaryDirectory;
    v10 = objc_msgSend(TemporaryDirectory, "stringByAppendingPathComponent:", objc_msgSend(a3, "lastPathComponent"));
    v11 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v10, 0);
    v12 = v11;
    v21 = 0;
    v22 = &v21;
    v23 = 0x4012000000;
    v24 = __Block_byref_object_copy__8;
    v25 = __Block_byref_object_dispose__8;
    v27 = 0;
    v28 = 0;
    v26 = &unk_197A0BBD2;
    m_ptr = self->_uploadFileCoordinator.m_ptr;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3321888768;
    v19[2] = __50__WKFileUploadPanel__copyToNewTemporaryDirectory___block_invoke;
    v19[3] = &unk_1E34CECD8;
    v19[4] = self;
    cf = v11;
    if (v11)
      CFRetain(v11);
    v19[5] = v9;
    v19[6] = &v21;
    objc_msgSend(m_ptr, "coordinateWritingItemAtURL:options:error:byAccessor:", a3, 2, &v29, v19);
    if (v29)
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v9, 1);
      *v6 = a3;
      if (a3)
        CFRetain(a3);
      v6[1] = (id)v14;
    }
    else
    {
      v15 = v22;
      v16 = (void *)v22[6];
      *v6 = v16;
      if (v16)
        CFRetain(v16);
      v17 = (void *)v15[7];
      v6[1] = v17;
      if (v17)
        CFRetain(v17);
    }
    if (cf)
      CFRelease(cf);
    _Block_object_dispose(&v21, 8);
    v18 = v28;
    v28 = 0;
    if (v18)
      CFRelease(v18);
    TemporaryDirectory = (void *)v27;
    v27 = 0;
    if (TemporaryDirectory)
    {
      CFRelease(TemporaryDirectory);
      if (!v12)
        goto LABEL_24;
    }
    else if (!v12)
    {
      goto LABEL_24;
    }
    CFRelease(v12);
  }
  else
  {
    *v6 = a3;
    if (a3)
      TemporaryDirectory = (void *)CFRetain(a3);
    v6[1] = 0;
  }
LABEL_24:
  result.var1.m_ptr = v8;
  result.var0.m_ptr = TemporaryDirectory;
  return result;
}

void __50__WKFileUploadPanel__copyToNewTemporaryDirectory___block_invoke(_QWORD *a1, const void *a2)
{
  BOOL v4;
  const void *v5;
  const void *v6;
  const void *v7;
  CFTypeRef v8;
  CFTypeRef cf;
  uint64_t v10;

  v10 = 0;
  if (objc_msgSend(*(id *)(a1[4] + 1104), "moveItemAtURL:toURL:error:", a2, a1[7], &v10))
    v4 = v10 == 0;
  else
    v4 = 0;
  if (v4)
  {
    v6 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", a1[5], 1);
    v7 = (const void *)a1[7];
    v8 = v7;
    if (v7)
      CFRetain(v7);
    cf = v6;
  }
  else
  {
    v5 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", a1[5], 1);
    v8 = a2;
    if (a2)
      CFRetain(a2);
    cf = v5;
  }
  std::pair<WTF::RetainPtr<NSURL>,WTF::RetainPtr<NSURL>>::operator=[abi:sn180100](*(_QWORD *)(a1[6] + 8) + 48, (uint64_t *)&v8);
  if (cf)
    CFRelease(cf);
  if (v8)
    CFRelease(v8);
}

- (BOOL)platformSupportsPickerViewController
{
  return 1;
}

- (WKFileUploadPanelDelegate)delegate
{
  return (WKFileUploadPanelDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  void *v3;
  void *m_ptr;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WebOpenPanelResultListenerProxy *v12;

  objc_destroyWeak((id *)&self->_delegate);
  m_ptr = self->_uploadFileCoordinator.m_ptr;
  self->_uploadFileCoordinator.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v5 = self->_uploadFileManager.m_ptr;
  self->_uploadFileManager.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_temporaryUploadedFileURLs, v3);
  v6 = self->_documentPickerController.m_ptr;
  self->_documentPickerController.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_menuPresenter, 0);
  v7 = self->_presentationViewController.m_ptr;
  self->_presentationViewController.m_ptr = 0;
  if (v7)
    CFRelease(v7);
  v8 = self->_photoPicker.m_ptr;
  self->_photoPicker.m_ptr = 0;
  if (v8)
    CFRelease(v8);
  v9 = self->_cameraPicker.m_ptr;
  self->_cameraPicker.m_ptr = 0;
  if (v9)
    CFRelease(v9);
  v10 = self->_mediaTranscoder.m_ptr;
  self->_mediaTranscoder.m_ptr = 0;
  if (v10)
    CFRelease(v10);
  v11 = self->_acceptedUTIs.m_ptr;
  self->_acceptedUTIs.m_ptr = 0;
  if (v11)
    CFRelease(v11);
  v12 = self->_listener.m_ptr;
  self->_listener.m_ptr = 0;
  if (v12)
    CFRelease(*((CFTypeRef *)v12 + 1));
  objc_destroyWeak(&self->_view.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 121) = 0;
  *((_QWORD *)self + 122) = 0;
  *((_QWORD *)self + 123) = 0;
  *((_BYTE *)self + 992) = 0;
  *((_QWORD *)self + 128) = 0;
  *((_QWORD *)self + 129) = 0;
  *((_QWORD *)self + 130) = 0;
  *((_QWORD *)self + 131) = 0;
  *((_QWORD *)self + 133) = 0;
  *((_QWORD *)self + 134) = 0;
  *((_QWORD *)self + 136) = 0;
  *((_QWORD *)self + 137) = 0;
  *((_QWORD *)self + 138) = 0;
  *((_QWORD *)self + 139) = 0;
  return self;
}

- (void)documentPicker:didPickDocumentsAtURLs:
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = 0;
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  if (v3)
    CFRelease(v3);
}

- (CFTypeRef)documentPicker:didPickDocumentsAtURLs:
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  CFTypeRef v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef *v11;
  uint64_t v12;
  CFTypeRef v13;
  CFTypeRef v14;
  id Weak;
  uint64_t v16;
  void *v17;
  void *v18;
  WTF::RunLoop *v19;
  uint64_t v20;
  _QWORD *v21;
  CFTypeRef result;
  uint64_t v23;
  uint64_t v24;
  CFTypeRef v25;
  CFTypeRef cf;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = *(void **)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v4)
    goto LABEL_23;
  v5 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v28 != v5)
        objc_enumerationMutation(v3);
      v7 = *(void **)(a1 + 32);
      if (v7)
      {
        objc_msgSend(v7, "_copyToNewTemporaryDirectory:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        if (v25)
          objc_msgSend(v2, "addObject:");
      }
      else
      {
        v25 = 0;
        cf = 0;
      }
      v8 = cf;
      if (!cf)
      {
        cf = 0;
        goto LABEL_19;
      }
      v9 = *(_QWORD *)(a1 + 32) + 1088;
      v10 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1100);
      if ((_DWORD)v10 != *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1096))
      {
        *(_QWORD *)(*(_QWORD *)v9 + 8 * v10) = cf;
LABEL_16:
        CFRetain(v8);
        LODWORD(v12) = *(_DWORD *)(v9 + 12);
        goto LABEL_17;
      }
      v11 = (CFTypeRef *)WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(*(_QWORD *)(a1 + 32) + 1088, v10 + 1, (unint64_t)&cf);
      v12 = *(unsigned int *)(v9 + 12);
      v8 = *v11;
      *(_QWORD *)(*(_QWORD *)v9 + 8 * v12) = v8;
      if (v8)
        goto LABEL_16;
LABEL_17:
      *(_DWORD *)(v9 + 12) = v12 + 1;
      v13 = cf;
      cf = 0;
      if (v13)
        CFRelease(v13);
LABEL_19:
      v14 = v25;
      v25 = 0;
      if (v14)
        CFRelease(v14);
    }
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v4);
LABEL_23:
  Weak = objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 968));
  v16 = *(_QWORD *)(a1 + 32) + 1088;
  v25 = *(CFTypeRef *)v16;
  cf = *(CFTypeRef *)(v16 + 8);
  v23 = 0;
  *(_QWORD *)v16 = 0;
  LODWORD(v24) = 0;
  *(_DWORD *)(v16 + 8) = 0;
  HIDWORD(v24) = 0;
  *(_DWORD *)(v16 + 12) = 0;
  objc_msgSend(Weak, "_removeTemporaryDirectoriesWhenDeallocated:", &v25, v23, v24);
  WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v25, v17);
  v19 = (WTF::RunLoop *)WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v23, v18);
  WTF::RunLoop::main(v19);
  v20 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  v21 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v21 = &off_1E34CEDF0;
  v21[1] = v20;
  v21[2] = v2;
  v25 = v21;
  WTF::RunLoop::dispatch();
  result = v25;
  v25 = 0;
  if (result)
    return (CFTypeRef)(*(uint64_t (**)(CFTypeRef))(*(_QWORD *)result + 8))(result);
  return result;
}

- (_QWORD)documentPicker:didPickDocumentsAtURLs:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E34CEDF0;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)documentPicker:didPickDocumentsAtURLs:
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E34CEDF0;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (WTF::StringImpl)documentPicker:didPickDocumentsAtURLs:
{
  void *v2;
  void *v3;
  WebCore *v4;
  const __CFString *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  CFTypeRef v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *result;
  WTF::StringImpl *v12[2];
  CFTypeRef cf;
  WTF::StringImpl *v14[2];

  v14[1] = *(WTF::StringImpl **)MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 8);
  v2 = *(void **)(a1 + 16);
  v4 = (WebCore *)objc_msgSend(v2, "count");
  if (v4 == (WebCore *)1)
  {
    v5 = (const __CFString *)objc_msgSend((id)objc_msgSend(v2, "objectAtIndexedSubscript:", 0), "lastPathComponent");
  }
  else
  {
    WebCore::multipleFileUploadText(v4);
    if (v12[0])
    {
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
      v7 = v12[0];
      v12[0] = 0;
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, v6);
      else
        *(_DWORD *)v7 -= 2;
    }
    else
    {
      v5 = &stru_1E351F1B8;
    }
  }
  MEMORY[0x19AEABCC8](v14, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "objectAtIndexedSubscript:", 0), "absoluteString"));
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v12, (_DWORD **)v14, 1uLL);
  WebKit::iconForFiles((uint64_t)v12, &cf);
  objc_msgSend(v3, "_chooseFiles:displayString:iconImage:", v2, v5, cf);
  v9 = cf;
  cf = 0;
  if (v9)
    CFRelease(v9);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v12, v8);
  result = v14[0];
  v14[0] = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2)
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v10);
    else
      *(_DWORD *)result -= 2;
  }
  return result;
}

- (_QWORD)_uploadMediaItemsTranscodingVideo:(_QWORD *)a1
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E34CEEE0;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)_uploadMediaItemsTranscodingVideo:(WTF *)this
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E34CEEE0;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)_uploadMediaItemsTranscodingVideo:(uint64_t)a1
{
  WKFileUploadMediaTranscoder *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  id v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 32))
    return objc_msgSend(*(id *)(a1 + 8), "_chooseMediaItems:", *(_QWORD *)(a1 + 24));
  v2 = [WKFileUploadMediaTranscoder alloc];
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 8);
  v12 = 0;
  objc_initWeak(&v12, v5);
  v6 = WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v6 = off_1E34CEF08;
  *(_QWORD *)(v6 + 8) = 0;
  objc_moveWeak((id *)(v6 + 8), &v12);
  v13 = v6;
  v7 = -[WKFileUploadMediaTranscoder initWithItems:videoCount:completionHandler:](v2, "initWithItems:videoCount:completionHandler:", v3, v4, &v13);
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(const void **)(v8 + 1024);
  *(_QWORD *)(v8 + 1024) = v7;
  if (v9)
    CFRelease(v9);
  v10 = v13;
  v13 = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  objc_destroyWeak(&v12);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 1024), "start");
}

- (uint64_t)_uploadMediaItemsTranscodingVideo:
{
  void *v2;

  *a1 = off_1E34CEF08;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_uploadMediaItemsTranscodingVideo:
{
  id WeakRetained;
  const void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_chooseMediaItems:", a2);
    CFRelease(v4);
  }
}

@end
