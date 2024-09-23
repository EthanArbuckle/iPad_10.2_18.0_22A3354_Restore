@implementation _WKElementAction

- (id)_initWithTitle:(id)a3 actionHandler:(id)a4 type:(int64_t)a5 assistant:(id)a6
{
  return -[_WKElementAction _initWithTitle:actionHandler:type:assistant:disabled:](self, "_initWithTitle:actionHandler:type:assistant:disabled:", a3, a4, a5, a6, 0);
}

- (id)_initWithTitle:(id)a3 actionHandler:(id)a4 type:(int64_t)a5 assistant:(id)a6 disabled:(BOOL)a7
{
  _WKElementAction *v12;
  uint64_t v13;
  void *m_ptr;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_WKElementAction;
  v12 = -[_WKElementAction init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(a3, "copy");
    m_ptr = v12->_title.m_ptr;
    v12->_title.m_ptr = (void *)v13;
    if (m_ptr)
      CFRelease(m_ptr);
    v12->_type = a5;
    v12->_actionHandler = (id)objc_msgSend(a4, "copy");
    v12->_disabled = a7;
    objc_storeWeak(&v12->_defaultActionSheetAssistant.m_weakReference, a6);
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_WKElementAction;
  -[_WKElementAction dealloc](&v3, sel_dealloc);
}

+ (id)elementActionWithTitle:(id)a3 actionHandler:(id)a4
{
  id v6;
  _QWORD v8[5];

  v6 = objc_alloc((Class)a1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57___WKElementAction_elementActionWithTitle_actionHandler___block_invoke;
  v8[3] = &unk_1E34C2618;
  v8[4] = a4;
  return (id)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(v6, "_initWithTitle:actionHandler:type:assistant:", a3, v8, 0, 0));
}

+ (id)elementActionWithType:(int64_t)a3 title:(id)a4 actionHandler:(id)a5
{
  return +[_WKElementAction _elementActionWithType:title:actionHandler:](_WKElementAction, "_elementActionWithType:title:actionHandler:", a3, a4, a5);
}

+ (id)_elementActionWithType:(int64_t)a3 title:(id)a4 actionHandler:(id)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63___WKElementAction__elementActionWithType_title_actionHandler___block_invoke;
  v6[3] = &unk_1E34C2618;
  v6[4] = a5;
  return (id)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc((Class)a1), "_initWithTitle:actionHandler:type:assistant:", a4, v6, a3, 0));
}

+ (id)_elementActionWithType:(int64_t)a3 customTitle:(id)a4 assistant:(id)a5
{
  return (id)objc_msgSend(a1, "_elementActionWithType:customTitle:assistant:disabled:", a3, a4, a5, 0);
}

+ (id)_elementActionWithType:(int64_t)a3 customTitle:(id)a4 assistant:(id)a5 disabled:(BOOL)a6
{
  _BOOL8 v7;
  _QWORD *v11;
  const __CFString *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;
  WTF::StringImpl *v28;
  WTF::StringImpl *v29;
  WTF::StringImpl *v30;
  WTF::StringImpl *v31;
  WTF::StringImpl *v32;
  id result;
  id v34;
  id v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  WTF::StringImpl *v45;

  v7 = a6;
  v11 = 0;
  v12 = &stru_1E351F1B8;
  switch(a3)
  {
    case 1:
      WebCore::localizedString((WebCore *)CFSTR("Open"), (const __CFString *)a2);
      if (v45)
      {
        v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
        v14 = v45;
        v45 = 0;
        if (*(_DWORD *)v14 == 2)
          WTF::StringImpl::destroy(v14, v13);
        else
          *(_DWORD *)v14 -= 2;
      }
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_2;
      v43[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v43[4] = 1;
      v11 = v43;
      goto LABEL_63;
    case 2:
      WebCore::localizedString((WebCore *)CFSTR("Copy (ActionSheet)"), (const __CFString *)a2);
      if (v45)
      {
        v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
        v16 = v45;
        v45 = 0;
        if (*(_DWORD *)v16 == 2)
          WTF::StringImpl::destroy(v16, v15);
        else
          *(_DWORD *)v16 -= 2;
      }
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke;
      v44[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v44[4] = 2;
      v11 = v44;
      goto LABEL_63;
    case 3:
      WebCore::localizedString((WebCore *)CFSTR("Save to Photos"), (const __CFString *)a2);
      if (v45)
      {
        v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
        v18 = v45;
        v45 = 0;
        if (*(_DWORD *)v18 == 2)
          WTF::StringImpl::destroy(v18, v17);
        else
          *(_DWORD *)v18 -= 2;
      }
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_3;
      v42[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v42[4] = 3;
      v11 = v42;
      goto LABEL_63;
    case 4:
      WebCore::localizedString((WebCore *)CFSTR("Add to Reading List"), (const __CFString *)a2);
      if (v45)
      {
        v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
        v20 = v45;
        v45 = 0;
        if (*(_DWORD *)v20 == 2)
          WTF::StringImpl::destroy(v20, v19);
        else
          *(_DWORD *)v20 -= 2;
      }
      v11 = &__block_literal_global_21;
      goto LABEL_63;
    case 7:
      WebCore::localizedString((WebCore *)CFSTR("Share…"), (const __CFString *)a2);
      if (v45)
      {
        v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
        v22 = v45;
        v45 = 0;
        if (*(_DWORD *)v22 == 2)
          WTF::StringImpl::destroy(v22, v21);
        else
          *(_DWORD *)v22 -= 2;
      }
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_5;
      v41[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v41[4] = 7;
      v11 = v41;
      goto LABEL_63;
    case 11:
      goto LABEL_63;
    case 12:
      WebCore::localizedString((WebCore *)CFSTR("Show Text"), (const __CFString *)a2);
      if (v45)
      {
        v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
        v24 = v45;
        v45 = 0;
        if (*(_DWORD *)v24 == 2)
          WTF::StringImpl::destroy(v24, v23);
        else
          *(_DWORD *)v24 -= 2;
      }
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_6;
      v40[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v40[4] = 12;
      v11 = v40;
      goto LABEL_63;
    case 13:
      WebCore::contextMenuItemTagLookUpImage((WebCore *)a1);
      if (v45)
      {
        v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
        v26 = v45;
        v45 = 0;
        if (*(_DWORD *)v26 == 2)
          WTF::StringImpl::destroy(v26, v25);
        else
          *(_DWORD *)v26 -= 2;
      }
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_7;
      v39[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v39[4] = 13;
      v11 = v39;
      goto LABEL_63;
    case 14:
      WebCore::contextMenuItemTagCopySubject((WebCore *)a1);
      if (v45)
      {
        v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
        v28 = v45;
        v45 = 0;
        if (*(_DWORD *)v28 == 2)
          WTF::StringImpl::destroy(v28, v27);
        else
          *(_DWORD *)v28 -= 2;
      }
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_8;
      v38[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v38[4] = 14;
      v11 = v38;
      goto LABEL_63;
    case 15:
      WebCore::localizedString((WebCore *)CFSTR("Play Animation"), (const __CFString *)a2);
      if (v45)
      {
        v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
        v30 = v45;
        v45 = 0;
        if (*(_DWORD *)v30 == 2)
          WTF::StringImpl::destroy(v30, v29);
        else
          *(_DWORD *)v30 -= 2;
      }
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_9;
      v37[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v37[4] = 15;
      v11 = v37;
      goto LABEL_63;
    case 16:
      WebCore::localizedString((WebCore *)CFSTR("Pause Animation"), (const __CFString *)a2);
      if (v45)
      {
        v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
        v32 = v45;
        v45 = 0;
        if (*(_DWORD *)v32 == 2)
          WTF::StringImpl::destroy(v32, v31);
        else
          *(_DWORD *)v32 -= 2;
      }
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __74___WKElementAction__elementActionWithType_customTitle_assistant_disabled___block_invoke_10;
      v36[3] = &__block_descriptor_40_e60_v24__0__WKActionSheetAssistant_8___WKActivatedElementInfo_16l;
      v36[4] = 16;
      v11 = v36;
LABEL_63:
      v34 = objc_alloc((Class)a1);
      if (a4)
        v35 = a4;
      else
        v35 = (id)v12;
      result = (id)CFMakeCollectable((CFTypeRef)objc_msgSend(v34, "_initWithTitle:actionHandler:type:assistant:disabled:", v35, v11, a3, a5, v7));
      break;
    default:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("There is no standard web element action of type %ld."), a3);
      result = 0;
      break;
  }
  return result;
}

+ (id)_elementActionWithType:(int64_t)a3 info:(id)a4 assistant:(id)a5
{
  return (id)objc_msgSend(a1, "_elementActionWithType:info:assistant:disabled:", a3, a4, a5, 0);
}

+ (id)_elementActionWithType:(int64_t)a3 info:(id)a4 assistant:(id)a5 disabled:(BOOL)a6
{
  _BOOL8 v6;
  const __CFString *v11;
  const __CFString *v12;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;

  v6 = a6;
  if (a3 != 2 || objc_msgSend(a4, "type") || (objc_msgSend(a4, "_isImage") & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    WebCore::localizedString((WebCore *)CFSTR("Copy Link (ActionSheet)"), v11);
    if (v15)
    {
      v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v14);
      else
        *(_DWORD *)v15 -= 2;
    }
    else
    {
      v12 = &stru_1E351F1B8;
    }
  }
  return (id)objc_msgSend(a1, "_elementActionWithType:customTitle:assistant:disabled:", a3, v12, a5, v6);
}

+ (id)elementActionWithType:(int64_t)a3 customTitle:(id)a4
{
  return (id)objc_msgSend(a1, "_elementActionWithType:customTitle:assistant:", a3, a4, 0);
}

+ (id)elementActionWithType:(int64_t)a3
{
  return (id)objc_msgSend(a1, "elementActionWithType:customTitle:", a3, 0);
}

- (NSString)title
{
  return (NSString *)self->_title.m_ptr;
}

- (void)_runActionWithElementInfo:(id)a3 forActionSheetAssistant:(id)a4
{
  (*((void (**)(void))self->_actionHandler + 2))();
}

- (void)runActionWithElementInfo:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_defaultActionSheetAssistant.m_weakReference);
  -[_WKElementAction _runActionWithElementInfo:forActionSheetAssistant:](self, "_runActionWithElementInfo:forActionSheetAssistant:", a3, WeakRetained);
  if (WeakRetained)
    CFRelease(WeakRetained);
}

+ (id)imageForElementActionType:(int64_t)a3
{
  void *v3;
  const __CFString *v4;
  id result;
  void *v6;
  const __CFString *v7;

  switch(a3)
  {
    case 1:
    case 5:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("safari");
      goto LABEL_3;
    case 2:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("doc.on.doc");
      goto LABEL_3;
    case 3:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("square.and.arrow.down");
      goto LABEL_3;
    case 4:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("eyeglasses");
      goto LABEL_3;
    case 6:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("arrow.up.forward.app");
      goto LABEL_3;
    case 7:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("square.and.arrow.up");
      goto LABEL_3;
    case 8:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("plus.square.on.square");
      goto LABEL_3;
    case 9:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("square.grid.2x2");
      goto LABEL_3;
    case 10:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("arrow.down.circle");
      goto LABEL_3;
    case 12:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("text.viewfinder");
      goto LABEL_3;
    case 13:
      v6 = (void *)MEMORY[0x1E0CEA638];
      v7 = CFSTR("info.circle.and.sparkles");
      return (id)objc_msgSend(v6, "_systemImageNamed:", v7);
    case 14:
      v6 = (void *)MEMORY[0x1E0CEA638];
      v7 = CFSTR("circle.dashed.rectangle");
      return (id)objc_msgSend(v6, "_systemImageNamed:", v7);
    case 15:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("play.circle");
      goto LABEL_3;
    case 16:
      v3 = (void *)MEMORY[0x1E0CEA638];
      v4 = CFSTR("pause.circle");
LABEL_3:
      result = (id)objc_msgSend(v3, "systemImageNamed:", v4);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (int64_t)elementActionTypeForUIActionIdentifier:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeCustom")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeOpen")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeCopy")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeSaveImage")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeAddToReadingList")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeOpenInDefaultBrowser")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeOpenInExternalApplication")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeShare")) & 1) != 0)
    return 7;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeOpenInNewTab")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeOpenInNewWindow")) & 1) != 0)
    return 9;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeDownload")) & 1) != 0)
    return 10;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeToggleShowLinkPreviews")) & 1) != 0)
    return 11;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeImageExtraction")) & 1) != 0)
    return 12;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeRevealImage")) & 1) != 0)
    return 13;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionTypeCopySubject")) & 1) != 0)
    return 14;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionPlayAnimation")) & 1) != 0)
    return 15;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("WKElementActionPauseAnimation")))
    return 16;
  return 0;
}

- (id)uiActionForElementInfo:(id)a3
{
  id v5;
  const __CFString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  CFTypeRef v10;
  CFTypeRef v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  CFTypeRef v17;
  CFTypeRef cf;

  v5 = +[_WKElementAction imageForElementActionType:](_WKElementAction, "imageForElementActionType:", -[_WKElementAction type](self, "type"));
  v6 = elementActionTypeToUIActionIdentifier(-[_WKElementAction type](self, "type"));
  v7 = (void *)MEMORY[0x1E0CEA2A8];
  v8 = -[_WKElementAction title](self, "title");
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3321888768;
  v15 = __43___WKElementAction_uiActionForElementInfo___block_invoke;
  v16 = &__block_descriptor_48_e8_32c56_ZTSKZ43___WKElementAction_uiActionForElementInfo__E3__2_e18_v16__0__UIAction_8l;
  if (self)
    CFRetain(self);
  if (a3)
    CFRetain(a3);
  v17 = self;
  if (self)
    CFRetain(self);
  cf = a3;
  if (a3)
    CFRetain(a3);
  v9 = (void *)objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, v5, v6, &v13);
  if (a3)
    CFRelease(a3);
  if (self)
    CFRelease(self);
  if (-[_WKElementAction disabled](self, "disabled", v13, v14, v15, v16))
    objc_msgSend(v9, "setAttributes:", objc_msgSend(v9, "attributes") | 1);
  v10 = cf;
  cf = 0;
  if (v10)
    CFRelease(v10);
  v11 = v17;
  v17 = 0;
  if (v11)
    CFRelease(v11);
  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  void *m_ptr;

  objc_destroyWeak(&self->_defaultActionSheetAssistant.m_weakReference);
  m_ptr = self->_title.m_ptr;
  self->_title.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
