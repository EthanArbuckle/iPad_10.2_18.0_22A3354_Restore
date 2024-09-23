@implementation WKActionSheetAssistant

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate.m_weakReference, a3);
}

- (WKActionSheetAssistant)initWithView:(id)a3
{
  objc_storeWeak(&self->_view.m_weakReference, a3);
  return self;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 672) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 1) = 0;
  *((_BYTE *)self + 32) = 0;
  *((_OWORD *)self + 43) = 0u;
  *((_OWORD *)self + 44) = 0u;
  *((_OWORD *)self + 45) = 0u;
  *((_QWORD *)self + 92) = 0;
  return self;
}

- (WKActionSheetAssistantDelegate)delegate
{
  return (WKActionSheetAssistantDelegate *)objc_loadWeak(&self->_delegate.m_weakReference);
}

- (void)dealloc
{
  objc_super v3;

  -[WKActionSheetAssistant cleanupSheet](self, "cleanupSheet");
  -[WKActionSheetAssistant _resetDataDetectorContextMenuPresenter](self, "_resetDataDetectorContextMenuPresenter");
  -[WKActionSheetAssistant _resetMediaControlsContextMenuPresenter](self, "_resetMediaControlsContextMenuPresenter");
  v3.receiver = self;
  v3.super_class = (Class)WKActionSheetAssistant;
  -[WKActionSheetAssistant dealloc](&v3, sel_dealloc);
}

- (BOOL)synchronouslyRetrievePositionInformation
{
  id WeakRetained;
  const void *v4;
  void *v5;
  optional<WebKit::InteractionInformationAtPosition> *p_positionInformation;
  void *v7;
  BOOL v8;
  unsigned __int8 v9;
  _BYTE v11[640];
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "positionInformationForActionSheetAssistant:", self);
    p_positionInformation = &self->_positionInformation;
    if (self->_anon_210[144] == v12)
    {
      if (!self->_anon_210[144])
      {
LABEL_12:
        v8 = self->_anon_210[144] != 0;
        CFRelease(v4);
        return v8;
      }
      WebKit::InteractionInformationAtPosition::operator=((uint64_t)p_positionInformation, (uint64_t)v11);
    }
    else
    {
      if (self->_anon_210[144])
      {
        WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)p_positionInformation, v5);
        v9 = 0;
      }
      else
      {
        WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((uint64_t)p_positionInformation, (uint64_t)v11);
        v9 = 1;
      }
      self->_anon_210[144] = v9;
    }
    if (v12)
      WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v11, v7);
    goto LABEL_12;
  }
  return 0;
}

- (id)superviewForSheet
{
  id Weak;
  UIView *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  Weak = objc_loadWeak(&self->_view.m_weakReference);
  v4 = (void *)objc_msgSend(Weak, "window");
  if (!Weak)
    return v4;
  v5 = 0;
  do
  {
    v6 = WebCore::viewController((WebCore *)Weak, v3);
    if (v6)
      v5 = (void *)v6;
    Weak = (id)objc_msgSend(Weak, "superview");
  }
  while (Weak);
  if (v5)
    return (id)objc_msgSend(v5, "view");
  else
    return v4;
}

- (CGRect)_presentationRectForSheetGivenPoint:(CGPoint)a3 inHostView:(id)a4
{
  CGRect v4;

  objc_msgSend(a4, "convertPoint:fromView:", objc_loadWeak(&self->_view.m_weakReference), a3.x, a3.y);
  v4.size.width = 1.0;
  v4.size.height = 1.0;
  return CGRectInset(v4, -22.0, -22.0);
}

- (CGRect)presentationRectForElementUsingClosestIndicatedRect
{
  id v3;
  id WeakRetained;
  const void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  WTF *v12;
  unsigned int v13;
  float32x4_t v14;
  WTF *v15;
  uint64_t v16;
  float32x4_t v17;
  void *v18;
  WebCore::Path *v19;
  uint64_t v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  WTF *v30;
  _DWORD *v31;
  _DWORD *v32;
  _DWORD *v33;
  WTF *v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  WebCore::Path *v39;
  unsigned int v40;
  WTF *v41;
  uint64_t v42;
  _BYTE v43[8];
  _BYTE v44[16];
  double v45[4];
  WTF *v46;
  int v47;
  unsigned int v48;
  _DWORD *v49;
  _DWORD *v50;
  _DWORD *v51;
  uint64_t v52;
  CGRect v53;
  CGRect v54;
  CGRect result;

  v3 = -[WKActionSheetAssistant superviewForSheet](self, "superviewForSheet");
  WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v5 = WeakRetained;
  if (v3 && WeakRetained && self->_anon_210[144])
  {
    WebCore::TextIndicatorData::TextIndicatorData((WebCore::TextIndicatorData *)v44, &self->_positionInformation.var0.__val_.linkIndicator);
    if (!v48)
    {
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_25:
      if ((v52 & 0x8000000000000) != 0)
      {
        v35 = (unsigned int *)(v52 & 0xFFFFFFFFFFFFLL);
        do
        {
          v36 = __ldaxr(v35);
          v37 = v36 - 1;
        }
        while (__stlxr(v37, v35));
        if (!v37)
        {
          atomic_store(1u, v35);
          WTF::fastFree((WTF *)v35, v6);
        }
      }
      v31 = v51;
      v51 = 0;
      if (v31)
      {
        if (v31[2] == 1)
          (*(void (**)(_DWORD *))(*(_QWORD *)v31 + 8))(v31);
        else
          --v31[2];
      }
      v32 = v50;
      v50 = 0;
      if (v32)
      {
        if (v32[2] == 1)
          (*(void (**)(_DWORD *))(*(_QWORD *)v32 + 8))(v32);
        else
          --v32[2];
      }
      v33 = v49;
      v49 = 0;
      if (v33)
      {
        if (v33[2] == 1)
          (*(void (**)(_DWORD *))(*(_QWORD *)v33 + 8))(v33);
        else
          --v33[2];
      }
      v34 = v46;
      if (v46)
      {
        v46 = 0;
        v47 = 0;
        WTF::fastFree(v34, v6);
      }
      goto LABEL_18;
    }
    if (self->_anon_210[144])
    {
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v43, (const IntPoint *)&self->_positionInformation);
      v7 = v45[0];
      v41 = 0;
      v42 = 0;
      v11 = v48;
      if (!v48)
      {
LABEL_12:
        WebCore::PathUtilities::pathsWithShrinkWrappedRects();
        if (v40)
        {
          v19 = v39;
          v20 = 72 * v40;
          while (1)
          {
            WebCore::Path::fastBoundingRect(v19);
            if (WebCore::FloatRect::contains())
              break;
            v19 = (WebCore::Path *)((char *)v19 + 72);
            v20 -= 72;
            if (!v20)
              goto LABEL_16;
          }
          WebCore::FloatRect::operator CGRect();
          objc_msgSend(v3, "convertRect:fromView:", objc_loadWeak(&self->_view.m_weakReference), v25, v26, v27, v28);
          v54 = CGRectInset(v53, -15.0, -15.0);
          x = v54.origin.x;
          y = v54.origin.y;
          width = v54.size.width;
          height = v54.size.height;
          WTF::Vector<WebCore::Path,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v39, v29);
        }
        else
        {
LABEL_16:
          WTF::Vector<WebCore::Path,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v39, v18);
          x = *MEMORY[0x1E0C9D648];
          y = *(double *)(MEMORY[0x1E0C9D648] + 8);
          width = *(double *)(MEMORY[0x1E0C9D648] + 16);
          height = *(double *)(MEMORY[0x1E0C9D648] + 24);
        }
        v30 = v41;
        if (v41)
        {
          v41 = 0;
          LODWORD(v42) = 0;
          WTF::fastFree(v30, v6);
        }
        goto LABEL_25;
      }
      v38 = *(_QWORD *)&v45[0];
      if (!(v48 >> 28))
      {
        v12 = (WTF *)WTF::fastMalloc((WTF *)(16 * v48));
        LODWORD(v42) = v11;
        v41 = v12;
        v13 = v48;
        v14.i64[0] = v38;
        if (v48)
        {
          v15 = v46;
          v14.i64[1] = 0x4000000040000000;
          v16 = v48;
          do
          {
            v17 = *(float32x4_t *)v15;
            v15 = (WTF *)((char *)v15 + 16);
            *(float32x4_t *)v12 = vaddq_f32(v14, vaddq_f32(v17, (float32x4_t)xmmword_1978D0310));
            v12 = (WTF *)((char *)v12 + 16);
            --v16;
          }
          while (v16);
          HIDWORD(v42) = v13;
        }
        goto LABEL_12;
      }
    }
    else
    {
      __break(1u);
    }
    __break(0xC471u);
    goto LABEL_46;
  }
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_18:
  if (v5)
    CFRelease(v5);
  v7 = x;
  v8 = y;
  v9 = width;
  v10 = height;
LABEL_46:
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)presentationRectForIndicatedElement
{
  id v3;
  id WeakRetained;
  const void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  CGRect v19;
  CGRect v20;
  CGRect result;

  v3 = -[WKActionSheetAssistant superviewForSheet](self, "superviewForSheet");
  WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v5 = WeakRetained;
  if (!v3)
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    if (!WeakRetained)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (WeakRetained)
  {
    if (self->_anon_210[144])
    {
      v18 = *((_OWORD *)&self->_positionInformation.var0.__engaged_ + 11);
      WebCore::IntRect::operator CGRect();
      objc_msgSend(v3, "convertRect:fromView:", objc_loadWeak(&self->_view.m_weakReference), v6, v7, v8, v9, v18);
      v20 = CGRectInset(v19, -15.0, -15.0);
      x = v20.origin.x;
      y = v20.origin.y;
      width = v20.size.width;
      height = v20.size.height;
    }
    else
    {
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
LABEL_9:
    CFRelease(v5);
    goto LABEL_10;
  }
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_10:
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)initialPresentationRectInHostViewForSheet
{
  id v3;
  id WeakRetained;
  const void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v3 = -[WKActionSheetAssistant superviewForSheet](self, "superviewForSheet");
  WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v5 = WeakRetained;
  if (!v3)
  {
    v7 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    if (!WeakRetained)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (WeakRetained)
  {
    if (self->_anon_210[144])
    {
      WebCore::IntPoint::operator CGPoint();
      -[WKActionSheetAssistant _presentationRectForSheetGivenPoint:inHostView:](self, "_presentationRectForSheetGivenPoint:inHostView:", v3);
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
    }
    else
    {
      v7 = *MEMORY[0x1E0C9D648];
      v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
LABEL_9:
    CFRelease(v5);
    goto LABEL_10;
  }
  v7 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_10:
  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)presentationRectInHostViewForSheet
{
  id v3;
  id WeakRetained;
  const void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double MidX;
  double v16;
  double MidY;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPoint v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  v3 = -[WKActionSheetAssistant superviewForSheet](self, "superviewForSheet");
  WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v5 = WeakRetained;
  if (!v3)
  {
    v19 = *MEMORY[0x1E0C9D648];
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    if (!WeakRetained)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (WeakRetained)
  {
    if (self->_anon_210[144])
    {
      WebCore::IntRect::operator CGRect();
      if (!self->_anon_210[144])
      {
        __break(1u);
        goto LABEL_15;
      }
      v10 = v6;
      v11 = v7;
      v12 = v8;
      v13 = v9;
      WebCore::IntPoint::operator CGPoint();
      MidX = v14;
      MidY = v16;
      v27.origin.x = v10;
      v27.origin.y = v11;
      v27.size.width = v12;
      v27.size.height = v13;
      v26.x = MidX;
      v26.y = MidY;
      if (!CGRectContainsPoint(v27, v26))
      {
        v28.origin.x = v10;
        v28.origin.y = v11;
        v28.size.width = v12;
        v28.size.height = v13;
        MidX = CGRectGetMidX(v28);
        v29.origin.x = v10;
        v29.origin.y = v11;
        v29.size.width = v12;
        v29.size.height = v13;
        MidY = CGRectGetMidY(v29);
      }
      -[WKActionSheetAssistant _presentationRectForSheetGivenPoint:inHostView:](self, "_presentationRectForSheetGivenPoint:inHostView:", v3, MidX, MidY);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
    }
    else
    {
      v19 = *MEMORY[0x1E0C9D648];
      v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
LABEL_12:
    CFRelease(v5);
    goto LABEL_13;
  }
  v19 = *MEMORY[0x1E0C9D648];
  v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v23 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_13:
  v6 = v19;
  v7 = v21;
  v8 = v23;
  v9 = v25;
LABEL_15:
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)updatePositionInformation
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "updatePositionInformationForActionSheetAssistant:", self);
  if (WeakRetained)
    CFRelease(WeakRetained);
}

- (BOOL)presentSheet
{
  double x;
  double y;
  double width;
  double height;
  CGRect v8;

  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom")
    && (-[WKActionSheetAssistant initialPresentationRectInHostViewForSheet](self, "initialPresentationRectInHostViewForSheet"), x = v8.origin.x, y = v8.origin.y, width = v8.size.width, height = v8.size.height, CGRectIsEmpty(v8)))
  {
    return 0;
  }
  else
  {
    return objc_msgSend(self->_interactionSheet.m_ptr, "presentSheetFromRect:", x, y, width, height);
  }
}

- (void)updateSheetPosition
{
  objc_msgSend(self->_interactionSheet.m_ptr, "updateSheetPosition");
}

- (BOOL)isShowingSheet
{
  return self->_interactionSheet.m_ptr != 0;
}

- (void)interactionDidStartWithPositionInformation:(const void *)a3
{
  const WTF::URL *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (objc_loadWeak(&self->_delegate.m_weakReference))
  {
    if (WebCore::DataDetection::canBePresentedByDataDetectors((WebCore::DataDetection *)((char *)a3 + 72), v4))
    {
      v5 = WTF::URL::operator NSURL *();
      if (v5)
      {
        v6 = v5;
        v7 = (void *)objc_msgSend((id)((uint64_t (*)(void))*MEMORY[0x1E0DCE0B8])(), "sharedController");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "interactionDidStartForURL:", v6);
      }
    }
  }
}

- (optional<WebKit::InteractionInformationAtPosition>)currentPositionInformation
{
  optional<WebKit::InteractionInformationAtPosition> *result;

  retstr->var0.__null_state_ = 0;
  *(&retstr[1].var0.__engaged_ + 144) = 0;
  if (*(&result[1].var0.__engaged_ + 176))
  {
    result = (optional<WebKit::InteractionInformationAtPosition> *)WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)retstr, (const WebKit::InteractionInformationAtPosition *)(&result->var0.__engaged_ + 32));
    *(&retstr[1].var0.__engaged_ + 144) = 1;
  }
  return result;
}

- (void)_createSheetWithElementActions:(id)a3 defaultTitle:(id)a4 showLinkTitle:(BOOL)a5
{
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v10;
  WKActionSheet *v11;
  void *m_ptr;
  void *v13;
  NSURL *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;
  id cf;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[6];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  WTF::StringImpl *v37;
  _BYTE v38[128];
  uint64_t v39;

  v7 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  cf = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (cf)
  {
    if (!self->_anon_210[144])
    {
LABEL_32:
      CFRelease(cf);
      return;
    }
    v10 = (void *)WTF::URL::operator NSURL *();
    v11 = objc_alloc_init(WKActionSheet);
    m_ptr = self->_interactionSheet.m_ptr;
    self->_interactionSheet.m_ptr = v11;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v11 = (WKActionSheet *)self->_interactionSheet.m_ptr;
    }
    -[WKActionSheet setSheetDelegate:](v11, "setSheetDelegate:", self, cf);
    objc_msgSend(self->_interactionSheet.m_ptr, "setPreferredStyle:", 0);
    if (v7 && objc_msgSend((id)objc_msgSend(v10, "absoluteString"), "length"))
    {
      v13 = (void *)objc_msgSend(v10, "scheme");
      if (!v13 || objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("javascript")))
      {
        v15 = (void *)WTF::userVisibleString((WTF *)v10, v14);
LABEL_14:
        a4 = v15;
        goto LABEL_15;
      }
      WebCore::localizedString((WebCore *)CFSTR("JavaScript Action Sheet Title"), (const __CFString *)v14);
      if (v37)
      {
        a4 = (id)WTF::StringImpl::operator NSString *();
        v27 = v37;
        v37 = 0;
        if (*(_DWORD *)v27 == 2)
          WTF::StringImpl::destroy(v27, v26);
        else
          *(_DWORD *)v27 -= 2;
LABEL_15:
        if (objc_msgSend(a4, "length"))
          objc_msgSend(self->_interactionSheet.m_ptr, "setTitle:", a4);
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        v6 = MEMORY[0x1E0C809B0];
        if (v17)
        {
          v18 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v34 != v18)
                objc_enumerationMutation(a3);
              v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              v21 = self->_interactionSheet.m_ptr;
              v22 = objc_msgSend(v20, "title");
              v31[4] = v20;
              v32[0] = v6;
              v32[1] = 3221225472;
              v32[2] = __84__WKActionSheetAssistant__createSheetWithElementActions_defaultTitle_showLinkTitle___block_invoke;
              v32[3] = &unk_1E34C8CA8;
              v32[4] = v20;
              v32[5] = self;
              v31[0] = v6;
              v31[1] = 3221225472;
              v31[2] = __84__WKActionSheetAssistant__createSheetWithElementActions_defaultTitle_showLinkTitle___block_invoke_2;
              v31[3] = &unk_1E34CDA18;
              objc_msgSend(v21, "_addActionWithTitle:style:handler:shouldDismissHandler:", v22, 0, v32, v31);
            }
            v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          }
          while (v17);
        }
        v5 = self->_interactionSheet.m_ptr;
        a4 = (id)MEMORY[0x1E0CEA2E0];
        WebCore::localizedString((WebCore *)CFSTR("Cancel button label in button bar"), v16);
        if (v37)
        {
          v23 = (const __CFString *)WTF::StringImpl::operator NSString *();
LABEL_26:
          v30[0] = v6;
          v30[1] = 3221225472;
          v30[2] = __84__WKActionSheetAssistant__createSheetWithElementActions_defaultTitle_showLinkTitle___block_invoke_3;
          v30[3] = &unk_1E34CDA40;
          v30[4] = self;
          objc_msgSend(v5, "addAction:", objc_msgSend(a4, "actionWithTitle:style:handler:", v23, 1, v30));
          v25 = v37;
          v37 = 0;
          if (v25)
          {
            if (*(_DWORD *)v25 == 2)
              WTF::StringImpl::destroy(v25, v24);
            else
              *(_DWORD *)v25 -= 2;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(cf, "actionSheetAssistant:willStartInteractionWithElement:", self, self->_elementInfo.m_ptr);
          goto LABEL_32;
        }
LABEL_39:
        v23 = &stru_1E351F1B8;
        goto LABEL_26;
      }
    }
    else
    {
      if (a4)
        goto LABEL_15;
      if (!self->_anon_210[144])
      {
        __break(1u);
        goto LABEL_39;
      }
      if (self->_positionInformation.var0.__val_.title.m_impl.m_ptr)
      {
        v15 = (void *)WTF::StringImpl::operator NSString *();
        goto LABEL_14;
      }
    }
    a4 = &stru_1E351F1B8;
    goto LABEL_15;
  }
}

uint64_t __84__WKActionSheetAssistant__createSheetWithElementActions_defaultTitle_showLinkTitle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_runActionWithElementInfo:forActionSheetAssistant:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  return objc_msgSend(*(id *)(a1 + 40), "cleanupSheet");
}

uint64_t __84__WKActionSheetAssistant__createSheetWithElementActions_defaultTitle_showLinkTitle___block_invoke_2(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "dismissalHandler"))
    return (*(uint64_t (**)(void))(objc_msgSend(*(id *)(a1 + 32), "dismissalHandler") + 16))();
  else
    return 1;
}

uint64_t __84__WKActionSheetAssistant__createSheetWithElementActions_defaultTitle_showLinkTitle___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanupSheet");
}

- (void)showImageSheet
{
  const void *v2;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  CFTypeRef v7;
  StringImpl *m_ptr;
  void *v9;
  CFTypeRef v10;
  CFTypeRef v11;
  _QWORD v12[5];
  CFTypeRef cf;
  CFTypeRef v14;
  _QWORD v15[2];
  void (*v16)(uint64_t, uint64_t, uint64_t);
  void *v17;
  WKActionSheetAssistant *v18;
  CFTypeRef v19;

  WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (!-[WKActionSheetAssistant synchronouslyRetrievePositionInformation](self, "synchronouslyRetrievePositionInformation"))
    {
LABEL_17:
      CFRelease(v5);
      return;
    }
    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3321888768;
    v16 = __40__WKActionSheetAssistant_showImageSheet__block_invoke;
    v17 = &unk_1E34CDA68;
    v18 = self;
    v19 = v5;
    v7 = CFRetain(v5);
    if (!self->_anon_210[144])
      goto LABEL_19;
    m_ptr = self->_positionInformation.var0.__val_.url.m_string.m_impl.m_ptr;
    if (m_ptr && *((_DWORD *)m_ptr + 1)
      || !self->_positionInformation.var0.__val_.image.m_ptr
      || (objc_opt_respondsToSelector() & 1) == 0)
    {
      v16((uint64_t)v15, 0, 0);
LABEL_15:
      v11 = v19;
      v19 = 0;
      if (v11)
        CFRelease(v11);
      goto LABEL_17;
    }
    v7 = objc_alloc(MEMORY[0x1E0CEA638]);
    if (self->_anon_210[144])
    {
      v9 = (void *)v7;
      WebCore::ShareableBitmap::makeCGImageCopy((WebCore::ShareableBitmap *)self->_positionInformation.var0.__val_.image.m_ptr);
      v2 = (const void *)objc_msgSend(v9, "initWithCGImage:", v14);
      v7 = v14;
      v14 = 0;
      if (!v7)
      {
LABEL_10:
        self->_hasPendingActionSheet = 1;
        CFRetain(self);
        v12[0] = v6;
        v12[1] = 3321888768;
        v12[2] = __40__WKActionSheetAssistant_showImageSheet__block_invoke_237;
        v12[3] = &unk_1E34CDAA0;
        cf = self;
        CFRetain(self);
        v12[4] = v15;
        objc_msgSend(v5, "actionSheetAssistant:getAlternateURLForImage:completion:", self, v2, v12);
        v10 = cf;
        cf = 0;
        if (v10)
          CFRelease(v10);
        CFRelease(self);
        if (v2)
          CFRelease(v2);
        goto LABEL_15;
      }
    }
    else
    {
LABEL_19:
      __break(1u);
    }
    CFRelease(v7);
    goto LABEL_10;
  }
}

void __40__WKActionSheetAssistant_showImageSheet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _WKActivatedElementInfo *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  CFTypeRef v19;
  CFTypeRef v20;
  void *v21;
  CFTypeRef v22;
  CFTypeRef cf;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 672))
    goto LABEL_35;
  v6 = WTF::URL::operator NSURL *();
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 672))
    goto LABEL_35;
  v7 = v6;
  v8 = WTF::URL::operator NSURL *();
  v9 = [_WKActivatedElementInfo alloc];
  v10 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v10 + 672))
    goto LABEL_35;
  if (v7)
    v11 = v7;
  else
    v11 = a2;
  v12 = -[_WKActivatedElementInfo _initWithType:URL:imageURL:userInfo:information:](v9, "_initWithType:URL:imageURL:userInfo:information:", 1, v11, v8, a3, v10 + 32);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(*(id *)(a1 + 40), "actionSheetAssistant:showCustomSheetForElement:", *(_QWORD *)(a1 + 32), v12) & 1) == 0)
  {
    v13 = *(void **)(a1 + 32);
    if (v13)
    {
      objc_msgSend(v13, "defaultActionsForImageSheet:", v12);
      v14 = *(_QWORD *)(a1 + 32);
      v13 = (void *)cf;
    }
    else
    {
      v14 = 0;
    }
    v15 = *(void **)(a1 + 40);
    cf = 0;
    v21 = v13;
    if (v15)
    {
      objc_msgSend(v15, "actionSheetAssistant:decideActionsForElement:defaultActions:", v14, v12, &v21);
      v13 = v21;
    }
    else
    {
      v22 = 0;
    }
    v21 = 0;
    if (v13)
      CFRelease(v13);
    if (!objc_msgSend((id)v22, "count"))
      goto LABEL_27;
    if (!a2 && a3)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "_cancelAllTouches");
LABEL_27:
      v19 = v22;
      v22 = 0;
      if (v19)
        CFRelease(v19);
      v20 = cf;
      cf = 0;
      if (v20)
        CFRelease(v20);
      goto LABEL_31;
    }
    objc_msgSend(*(id *)(a1 + 32), "_createSheetWithElementActions:defaultTitle:showLinkTitle:", v22, 0, 1);
    v16 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v16 + 16))
      goto LABEL_27;
    v17 = *(const void **)(v16 + 24);
    *(_QWORD *)(v16 + 24) = v12;
    if (v17)
      CFRelease(v17);
    v18 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v18 + 672))
    {
      v12 = 0;
      if ((objc_msgSend(*(id *)(v18 + 16), "presentSheet:", objc_msgSend((id)v18, "_presentationStyleForPositionInfo:elementInfo:", v18 + 32, *(_QWORD *)(v18 + 24))) & 1) == 0)objc_msgSend(*(id *)(a1 + 32), "cleanupSheet");
      goto LABEL_27;
    }
    std::__throw_bad_optional_access[abi:sn180100]();
LABEL_35:
    __break(1u);
    return;
  }
LABEL_31:
  if (v12)
    CFRelease(v12);
}

uint64_t __40__WKActionSheetAssistant_showImageSheet__block_invoke_237(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (*(_BYTE *)(v1 + 746))
  {
    *(_BYTE *)(v1 + 746) = 0;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

- (int64_t)_presentationStyleForPositionInfo:(const void *)a3 elementInfo:(id)a4
{
  WeakObjCPtr<UIView> *p_view;
  id Weak;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int64_t v17;
  id WeakRetained;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  BOOL v37;
  double MaxY;
  double v40;
  double MinY;
  double v42;
  double MaxX;
  double v44;
  double MinX;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  p_view = &self->_view;
  Weak = objc_loadWeak(&self->_view.m_weakReference);
  WebCore::IntRect::operator CGRect();
  objc_msgSend(Weak, "convertRect:toView:", objc_msgSend(objc_loadWeak(&p_view->m_weakReference), "window"), v9, v10, v11, v12);
  x = v46.origin.x;
  y = v46.origin.y;
  width = v46.size.width;
  height = v46.size.height;
  if (CGRectIsEmpty(v46))
    return 0;
  WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "unoccludedWindowBoundsForActionSheetAssistant:", self);
  else
    objc_msgSend((id)objc_msgSend(objc_loadWeak(&p_view->m_weakReference), "window"), "bounds");
  v23 = v19;
  v24 = v20;
  v25 = v21;
  v26 = v22;
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v58.origin.x = v23;
  v58.origin.y = v24;
  v58.size.width = v25;
  v58.size.height = v26;
  v48 = CGRectIntersection(v47, v58);
  v27 = v48.origin.x;
  v28 = v48.origin.y;
  v29 = v48.size.width;
  v30 = v48.size.height;
  MinX = CGRectGetMinX(v48);
  v49.origin.x = v23;
  v49.origin.y = v24;
  v49.size.width = v25;
  v49.size.height = v26;
  v44 = CGRectGetMinX(v49);
  v50.origin.x = v27;
  v50.origin.y = v28;
  v50.size.width = v29;
  v50.size.height = v30;
  MinY = CGRectGetMinY(v50);
  v51.origin.x = v23;
  v51.origin.y = v24;
  v51.size.width = v25;
  v51.size.height = v26;
  v40 = CGRectGetMinY(v51);
  v52.origin.x = v23;
  v52.origin.y = v24;
  v52.size.width = v25;
  v52.size.height = v26;
  MaxX = CGRectGetMaxX(v52);
  v53.origin.x = v27;
  v53.origin.y = v28;
  v53.size.width = v29;
  v53.size.height = v30;
  v42 = CGRectGetMaxX(v53);
  v54.origin.x = v23;
  v54.origin.y = v24;
  v54.size.width = v25;
  v54.size.height = v26;
  MaxY = CGRectGetMaxY(v54);
  v55.origin.x = v27;
  v55.origin.y = v28;
  v55.size.width = v29;
  v55.size.height = v30;
  v31 = CGRectGetMaxY(v55);
  v56.origin.x = v23;
  v56.origin.y = v24;
  v56.size.width = v25;
  v56.size.height = v26;
  v32 = CGRectGetWidth(v56);
  v33 = MinX - v44;
  if (MinX - v44 < MaxX - v42)
    v33 = MaxX - v42;
  if (v33 <= v32 * 0.4)
  {
    v57.origin.x = v23;
    v57.origin.y = v24;
    v57.size.width = v25;
    v57.size.height = v26;
    v34 = CGRectGetHeight(v57);
    v35 = MinY - v40;
    if (MinY - v40 < MaxY - v31)
      v35 = MaxY - v31;
    if (v35 <= v34 * 0.4)
    {
      v17 = 0;
      if (!WeakRetained)
        return v17;
      goto LABEL_19;
    }
  }
  v36 = objc_msgSend(a4, "type");
  if (*((_DWORD *)a3 + 85))
    v37 = v36 == 0;
  else
    v37 = 0;
  if (v37)
    v17 = 2;
  else
    v17 = 1;
  if (WeakRetained)
LABEL_19:
    CFRelease(WeakRetained);
  return v17;
}

- (BOOL)_appendAppLinkOpenActionsForURL:(id)a3 actions:(id)a4 elementInfo:(id)a5
{
  id WeakRetained;
  char v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  WTF::StringImpl *v14;
  const __CFString *v15;
  WTF::StringImpl *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  CFTypeRef v22;
  _QWORD v24[5];
  _QWORD v25[5];
  CFTypeRef arg;

  if (HIBYTE(word_1ECE72C41) == 1)
  {
    if (!(_BYTE)word_1ECE72C41)
    {
LABEL_10:
      LOBYTE(v11) = 0;
      return v11;
    }
  }
  else
  {
    if ((WTF::processHasEntitlement() & 1) == 0)
    {
      LOBYTE(v11) = 0;
      word_1ECE72C41 = 256;
      return v11;
    }
    LODWORD(v11) = WTF::processHasEntitlement();
    LOBYTE(word_1ECE72C41) = v11;
    HIBYTE(word_1ECE72C41) = 1;
    if (!(_DWORD)v11)
      return v11;
  }
  WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v10 = objc_msgSend(WeakRetained, "actionSheetAssistant:shouldIncludeAppLinkActionsForElement:", self, a5);
  if (WeakRetained)
    CFRelease(WeakRetained);
  if ((v10 & 1) == 0)
    goto LABEL_10;
  v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CA5838], "appLinksWithURL:limit:error:", a3, 1, 0), "firstObject");
  if (v11)
  {
    v13 = (void *)v11;
    WebCore::localizedString((WebCore *)CFSTR("Open in Safari"), v12);
    if (arg)
    {
      v15 = (const __CFString *)WTF::StringImpl::operator NSString *();
      v16 = (WTF::StringImpl *)arg;
      arg = 0;
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v14);
      else
        *(_DWORD *)v16 -= 2;
    }
    else
    {
      v15 = &stru_1E351F1B8;
    }
    v17 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __78__WKActionSheetAssistant__appendAppLinkOpenActionsForURL_actions_elementInfo___block_invoke;
    v25[3] = &unk_1E34CDAD8;
    v25[4] = v13;
    objc_msgSend(a4, "addObject:", +[_WKElementAction _elementActionWithType:title:actionHandler:](_WKElementAction, "_elementActionWithType:title:actionHandler:", 5, v15, v25));
    v18 = objc_msgSend((id)objc_msgSend(v13, "targetApplicationProxy"), "localizedName");
    if (v18)
    {
      v20 = v18;
      v21 = (void *)MEMORY[0x1E0CB3940];
      WebCore::copyLocalizedString((WebCore *)CFSTR("Open in “%@”"), v19);
      if (arg)
      {
        CFAutorelease(arg);
        v22 = arg;
      }
      else
      {
        v22 = 0;
      }
      v24[0] = v17;
      v24[1] = 3221225472;
      v24[2] = __78__WKActionSheetAssistant__appendAppLinkOpenActionsForURL_actions_elementInfo___block_invoke_2;
      v24[3] = &unk_1E34CDAD8;
      v24[4] = v13;
      objc_msgSend(a4, "addObject:", +[_WKElementAction _elementActionWithType:title:actionHandler:](_WKElementAction, "_elementActionWithType:title:actionHandler:", 6, objc_msgSend(v21, "stringWithFormat:", v22, v20), v24));
    }
    LOBYTE(v11) = 1;
  }
  return v11;
}

uint64_t __78__WKActionSheetAssistant__appendAppLinkOpenActionsForURL_actions_elementInfo___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "openWithCompletionHandler:", 0);
}

uint64_t __78__WKActionSheetAssistant__appendAppLinkOpenActionsForURL_actions_elementInfo___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "openWithCompletionHandler:", 0);
}

- (void)_appendOpenActionsForURL:(id)a3 actions:(id)a4 elementInfo:(id)a5
{
  if (!-[WKActionSheetAssistant _appendAppLinkOpenActionsForURL:actions:elementInfo:](self, "_appendAppLinkOpenActionsForURL:actions:elementInfo:", a3))objc_msgSend(a4, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 1, a5, self));
}

- (void)_appendAnimationAction:(id)a3 elementInfo:(id)a4
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  if ((objc_msgSend(a4, "isAnimatedImage") & 1) != 0 || *(_DWORD *)(objc_msgSend(a4, "_animationsUnderElement") + 12))
  {
    if (objc_msgSend(a4, "canShowAnimationControls"))
    {
      objc_loadWeak(&self->_delegate.m_weakReference);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "_allowAnimationControls"))
        {
          v7 = objc_msgSend(a4, "isAnimating");
          if ((objc_msgSend(a4, "isAnimatedImage") & 1) != 0
            || (v8 = objc_msgSend(a4, "_animationsUnderElement"), v9 = *(unsigned int *)(v8 + 12), !(_DWORD)v9))
          {
LABEL_11:
            if (!v7)
            {
              v13 = 15;
LABEL_15:
              objc_msgSend(a3, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", v13, a4, self));
              return;
            }
          }
          else
          {
            v10 = (unsigned __int8 *)(*(_QWORD *)v8 + 80);
            v11 = 96 * v9;
            while (1)
            {
              v12 = *v10;
              v10 += 96;
              if (v12)
                break;
              v11 -= 96;
              if (!v11)
                goto LABEL_11;
            }
          }
          v13 = 16;
          goto LABEL_15;
        }
      }
    }
  }
}

- (RetainPtr<NSArray<_WKElementAction)defaultActionsForLinkSheet:(id)a3
{
  _QWORD *v3;
  _QWORD *v6;
  RetainPtr<NSArray<_WKElementAction *>> v7;
  void *var0;
  id v9;
  WebKit *v10;
  WebKit *TCC_kTCCServicePhotos;
  const __CFDictionary *v12;
  void *v13;

  v6 = v3;
  v7.var0 = (void *)objc_msgSend(a3, "URL");
  if (v7.var0)
  {
    var0 = v7.var0;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[WKActionSheetAssistant _appendOpenActionsForURL:actions:elementInfo:](self, "_appendOpenActionsForURL:actions:elementInfo:", var0, v9, a3);
    if (objc_msgSend((id)getSSReadingListClass(), "supportsURL:", var0))
      objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 4, a3, self));
    v10 = (WebKit *)objc_msgSend(a3, "imageURL");
    if (v10)
    {
      TCC_kTCCServicePhotos = (WebKit *)WebKit::get_TCC_kTCCServicePhotos(v10);
      if (WebKit::softLinkTCCTCCAccessPreflight(TCC_kTCCServicePhotos, 0, v12) != 1)
        objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 3, a3, self));
    }
    v13 = (void *)objc_msgSend(var0, "scheme");
    if (!v13 || objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("javascript")))
    {
      objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 2, a3, self));
      objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 7, a3, self));
    }
    if (objc_msgSend(a3, "type") == 1 || objc_msgSend(a3, "_isImage"))
    {
      objc_loadWeak(&self->_delegate.m_weakReference);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "actionSheetAssistantShouldIncludeCopySubjectAction:", self))
      {
        objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 14, a3, self));
      }
      objc_loadWeak(&self->_delegate.m_weakReference);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "actionSheetAssistant:shouldIncludeShowTextActionForElement:", self, a3))
      {
        objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 12, a3, self));
      }
      objc_loadWeak(&self->_delegate.m_weakReference);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "actionSheetAssistant:shouldIncludeLookUpImageActionForElement:", self, a3))
      {
        objc_msgSend(v9, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 13, a3, self));
      }
    }
    v7.var0 = (void *)-[WKActionSheetAssistant _appendAnimationAction:elementInfo:](self, "_appendAnimationAction:elementInfo:", v9, a3);
  }
  else
  {
    v9 = 0;
  }
  *v6 = v9;
  return v7;
}

- (RetainPtr<NSArray<_WKElementAction)defaultActionsForImageSheet:(id)a3
{
  _QWORD *v3;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  WebKit *v9;
  WebKit *TCC_kTCCServicePhotos;
  const __CFDictionary *v11;
  int v12;
  int v13;
  RetainPtr<NSArray<_WKElementAction *>> v14;

  v6 = v3;
  v7 = objc_msgSend(a3, "URL");
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7)
  {
    -[WKActionSheetAssistant _appendOpenActionsForURL:actions:elementInfo:](self, "_appendOpenActionsForURL:actions:elementInfo:", v7, v8, a3);
  }
  else if (!objc_msgSend(a3, "imageURL"))
  {
    goto LABEL_5;
  }
  objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 7, a3, self));
LABEL_5:
  v9 = (WebKit *)objc_msgSend((id)getSSReadingListClass(), "supportsURL:", v7);
  if ((_DWORD)v9)
    v9 = (WebKit *)objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 4, a3, self));
  TCC_kTCCServicePhotos = (WebKit *)WebKit::get_TCC_kTCCServicePhotos(v9);
  if (WebKit::softLinkTCCTCCAccessPreflight(TCC_kTCCServicePhotos, 0, v11) != 1)
    objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 3, a3, self));
  objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 2, a3, self));
  objc_loadWeak(&self->_delegate.m_weakReference);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "actionSheetAssistantShouldIncludeCopySubjectAction:", self);
  else
    v12 = 0;
  objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:disabled:](_WKElementAction, "_elementActionWithType:info:assistant:disabled:", 14, a3, self, v12 ^ 1u));
  objc_loadWeak(&self->_delegate.m_weakReference);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "actionSheetAssistant:shouldIncludeShowTextActionForElement:", self, a3))
  {
    objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 12, a3, self));
  }
  objc_loadWeak(&self->_delegate.m_weakReference);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "actionSheetAssistant:shouldIncludeLookUpImageActionForElement:", self, a3);
  else
    v13 = 0;
  objc_msgSend(v8, "addObject:", +[_WKElementAction _elementActionWithType:info:assistant:disabled:](_WKElementAction, "_elementActionWithType:info:assistant:disabled:", 13, a3, self, v13 ^ 1u));
  v14.var0 = (void *)-[WKActionSheetAssistant _appendAnimationAction:elementInfo:](self, "_appendAnimationAction:elementInfo:", v8, a3);
  *v6 = v8;
  return v14;
}

- (BOOL)needsLinkIndicator
{
  return self->_needsLinkIndicator;
}

- (void)showLinkSheet
{
  WeakObjCPtr<id<WKActionSheetAssistantDelegate>> *p_delegate;
  uint64_t v4;
  uint64_t v5;
  _WKActivatedElementInfo *v6;
  id v7;
  id Weak;
  CFTypeRef v9;
  void *m_ptr;
  void *v11;
  CFTypeRef v12;
  CFTypeRef v13;
  CFTypeRef v14;
  CFTypeRef v15;
  CFTypeRef cf;

  p_delegate = &self->_delegate;
  if (objc_loadWeak(&self->_delegate.m_weakReference))
  {
    self->_needsLinkIndicator = 1;
    if (-[WKActionSheetAssistant synchronouslyRetrievePositionInformation](self, "synchronouslyRetrievePositionInformation"))
    {
      if (self->_anon_210[144])
      {
        v4 = WTF::URL::operator NSURL *();
        if (!v4)
        {
          self->_needsLinkIndicator = 0;
          return;
        }
        v5 = v4;
        v6 = [_WKActivatedElementInfo alloc];
        if (self->_anon_210[144])
        {
          v7 = -[_WKActivatedElementInfo _initWithType:URL:information:](v6, "_initWithType:URL:information:", 0, v5, &self->_positionInformation);
          objc_loadWeak(&p_delegate->m_weakReference);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && objc_msgSend(objc_loadWeak(&p_delegate->m_weakReference), "actionSheetAssistant:showCustomSheetForElement:", self, v7))
          {
            self->_needsLinkIndicator = 0;
LABEL_28:
            if (v7)
              CFRelease(v7);
            return;
          }
          -[WKActionSheetAssistant defaultActionsForLinkSheet:](self, "defaultActionsForLinkSheet:", v7);
          Weak = objc_loadWeak(&p_delegate->m_weakReference);
          v9 = cf;
          cf = 0;
          v14 = v9;
          if (Weak)
          {
            objc_msgSend(Weak, "actionSheetAssistant:decideActionsForElement:defaultActions:", self, v7, &v14);
            v9 = v14;
          }
          else
          {
            v15 = 0;
          }
          v14 = 0;
          if (v9)
            CFRelease(v9);
          if (!objc_msgSend((id)v15, "count")
            || (-[WKActionSheetAssistant _createSheetWithElementActions:defaultTitle:showLinkTitle:](self, "_createSheetWithElementActions:defaultTitle:showLinkTitle:", v15, 0, 1), (m_ptr = self->_interactionSheet.m_ptr) == 0))
          {
            self->_needsLinkIndicator = 0;
LABEL_24:
            v12 = v15;
            v15 = 0;
            if (v12)
              CFRelease(v12);
            v13 = cf;
            cf = 0;
            if (v13)
              CFRelease(v13);
            goto LABEL_28;
          }
          v11 = self->_elementInfo.m_ptr;
          self->_elementInfo.m_ptr = v7;
          if (v11)
          {
            CFRelease(v11);
            m_ptr = self->_interactionSheet.m_ptr;
          }
          if (self->_anon_210[144])
          {
            v7 = 0;
            if ((objc_msgSend(m_ptr, "presentSheet:", -[WKActionSheetAssistant _presentationStyleForPositionInfo:elementInfo:](self, "_presentationStyleForPositionInfo:elementInfo:", &self->_positionInformation, self->_elementInfo.m_ptr)) & 1) == 0)-[WKActionSheetAssistant cleanupSheet](self, "cleanupSheet");
            goto LABEL_24;
          }
          std::__throw_bad_optional_access[abi:sn180100]();
        }
      }
      __break(1u);
    }
  }
}

- (void)_dataDetectorContextMenuPresenter
{
  id **p_dataDetectorContextMenuPresenter;
  id WeakRetained;
  id *v5;

  p_dataDetectorContextMenuPresenter = (id **)&self->_dataDetectorContextMenuPresenter;
  if (!self->_dataDetectorContextMenuPresenter.__ptr_.__value_)
  {
    WeakRetained = objc_loadWeakRetained(&self->_view.m_weakReference);
    v5 = (id *)WTF::fastMalloc((WTF *)0x10);
    WebKit::CompactContextMenuPresenter::CompactContextMenuPresenter(v5, WeakRetained, (uint64_t)self);
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_dataDetectorContextMenuPresenter, v5);
    if (WeakRetained)
      CFRelease(WeakRetained);
  }
  return *p_dataDetectorContextMenuPresenter;
}

- (void)_resetDataDetectorContextMenuPresenter
{
  if (self->_dataDetectorContextMenuPresenter.__ptr_.__value_)
  {
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_dataDetectorContextMenuPresenter, 0);
    objc_loadWeak(&self->_delegate.m_weakReference);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "removeContextMenuViewIfPossibleForActionSheetAssistant:", self);
  }
}

- (void)_mediaControlsContextMenuPresenter
{
  id **p_mediaControlsContextMenuPresenter;
  id WeakRetained;
  id *v5;

  p_mediaControlsContextMenuPresenter = (id **)&self->_mediaControlsContextMenuPresenter;
  if (!self->_mediaControlsContextMenuPresenter.__ptr_.__value_)
  {
    WeakRetained = objc_loadWeakRetained(&self->_view.m_weakReference);
    v5 = (id *)WTF::fastMalloc((WTF *)0x10);
    WebKit::CompactContextMenuPresenter::CompactContextMenuPresenter(v5, WeakRetained, (uint64_t)self);
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100](p_mediaControlsContextMenuPresenter, v5);
    if (WeakRetained)
      CFRelease(WeakRetained);
  }
  return *p_mediaControlsContextMenuPresenter;
}

- (void)_resetMediaControlsContextMenuPresenter
{
  void *m_ptr;
  void *value;

  if (self->_mediaControlsContextMenuPresenter.__ptr_.__value_)
  {
    std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_mediaControlsContextMenuPresenter, 0);
    m_ptr = self->_mediaControlsContextMenu.m_ptr;
    self->_mediaControlsContextMenu.m_ptr = 0;
    if (m_ptr)
      CFRelease(m_ptr);
    self->_mediaControlsContextMenuTargetFrame = 0u;
    value = self->_mediaControlsContextMenuCallback.m_function.m_callableWrapper.__ptr_.__value_;
    self->_mediaControlsContextMenuCallback.m_function.m_callableWrapper.__ptr_.__value_ = 0;
    if (value)
    {
      (*(void (**)(void *, _QWORD))(*(_QWORD *)value + 16))(value, 0);
      (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
    }
    objc_loadWeak(&self->_delegate.m_weakReference);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "removeContextMenuViewIfPossibleForActionSheetAssistant:", self);
  }
}

- (BOOL)hasContextMenuInteraction
{
  return self->_dataDetectorContextMenuPresenter.__ptr_.__value_
      || self->_mediaControlsContextMenuPresenter.__ptr_.__value_ != 0;
}

- (id)_elementActionForDDAction:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _WKElementAction *v7;
  CFTypeRef v8;
  _QWORD v10[5];
  _QWORD v11[5];
  CFTypeRef cf;

  if (self)
    CFRetain(self);
  v5 = objc_msgSend(a3, "localizedName");
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3321888768;
  v11[2] = __52__WKActionSheetAssistant__elementActionForDDAction___block_invoke;
  v11[3] = &unk_1E34CDB00;
  cf = self;
  if (self)
    CFRetain(self);
  v11[4] = a3;
  v7 = +[_WKElementAction elementActionWithTitle:actionHandler:](_WKElementAction, "elementActionWithTitle:actionHandler:", v5, v11);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __52__WKActionSheetAssistant__elementActionForDDAction___block_invoke_258;
  v10[3] = &unk_1E34CDA18;
  v10[4] = a3;
  -[_WKElementAction setDismissalHandler:](v7, "setDismissalHandler:", v10);
  v8 = cf;
  cf = 0;
  if (v8)
    CFRelease(v8);
  if (self)
    CFRelease(self);
  return v7;
}

uint64_t __52__WKActionSheetAssistant__elementActionForDDAction___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 745) = objc_msgSend(*(id *)(a1 + 32), "hasUserInterface");
  return objc_msgSend((id)objc_msgSend((id)((uint64_t (*)(void))*MEMORY[0x1E0DCE0B8])(), "sharedController"), "performAction:fromAlertController:interactionDelegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
}

uint64_t __52__WKActionSheetAssistant__elementActionForDDAction___block_invoke_258(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasUserInterface") ^ 1;
}

- (void)showDataDetectorsUIForPositionInformation:(const void *)a3
{
  void *v3;
  uint64_t v4;
  WeakObjCPtr<id<WKActionSheetAssistantDelegate>> *p_delegate;
  const WTF::URL *v8;
  const void *v9;
  id Weak;
  uint64_t v11;
  const __CFString *v12;
  id *v13;
  id *v14;
  CGRect v15;

  p_delegate = &self->_delegate;
  if (objc_loadWeak(&self->_delegate.m_weakReference))
  {
    if (self->_anon_210[144])
    {
      WebKit::InteractionInformationAtPosition::operator=((uint64_t)&self->_positionInformation, (uint64_t)a3);
      if (!self->_anon_210[144])
        goto LABEL_29;
    }
    else
    {
      WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)&self->_positionInformation, (const WebKit::InteractionInformationAtPosition *)a3);
      self->_anon_210[144] = 1;
    }
    a3 = &self->_positionInformation.var0.__engaged_ + 72;
    if (WebCore::DataDetection::canBePresentedByDataDetectors((WebCore::DataDetection *)(&self->_positionInformation.var0.__engaged_ + 72), v8))
    {
      if (!self->_anon_210[144])
        goto LABEL_29;
      v9 = (const void *)WTF::URL::operator NSURL *();
      if (v9)
      {
        a3 = v9;
        v3 = (void *)objc_msgSend((id)((uint64_t (*)(void))*MEMORY[0x1E0DCE0B8])(), "sharedController");
        objc_loadWeak(&p_delegate->m_weakReference);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          Weak = objc_loadWeak(&p_delegate->m_weakReference);
          if (!self->_anon_210[144])
            goto LABEL_29;
          v4 = objc_msgSend(Weak, "dataDetectionContextForActionSheetAssistant:positionInformation:", self, &self->_positionInformation);
        }
        else
        {
          v4 = 0;
        }
        objc_loadWeak(&p_delegate->m_weakReference);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          p_delegate = (WeakObjCPtr<id<WKActionSheetAssistantDelegate>> *)objc_msgSend(objc_loadWeak(&p_delegate->m_weakReference), "selectedTextForActionSheetAssistant:", self);
        else
          p_delegate = 0;
        if ((objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v3, "shouldImmediatelyLaunchDefaultActionForURL:", a3))
        {
          if (!self->_anon_210[144])
            goto LABEL_29;
          objc_msgSend(-[WKActionSheetAssistant _elementActionForDDAction:](self, "_elementActionForDDAction:", objc_msgSend(v3, "defaultActionForURL:results:context:", a3, self->_positionInformation.var0.__val_.dataDetectorResults.m_ptr, v4)), "_runActionWithElementInfo:forActionSheetAssistant:", self->_elementInfo.m_ptr, self);
        }
        else
        {
          if (self->_anon_210[144])
          {
            if (!self->_positionInformation.var0.__val_.dataDetectorIdentifier.m_impl.m_ptr)
              goto LABEL_30;
            v11 = WTF::StringImpl::operator NSString *();
            if (self->_anon_210[144])
            {
              v12 = (const __CFString *)v11;
              goto LABEL_24;
            }
          }
LABEL_29:
          while (1)
          {
            __break(1u);
LABEL_30:
            v12 = &stru_1E351F1B8;
LABEL_24:
            if (!objc_msgSend((id)objc_msgSend(v3, "actionsForURL:identifier:selectedText:results:context:", a3, v12, p_delegate, self->_positionInformation.var0.__val_.dataDetectorResults.m_ptr, v4), "count")|| !objc_msgSend(objc_loadWeak(&self->_view.m_weakReference), "window"))
            {
              break;
            }
            v13 = -[WKActionSheetAssistant _dataDetectorContextMenuPresenter](self, "_dataDetectorContextMenuPresenter");
            if (self->_anon_210[144])
            {
              v14 = v13;
              WebCore::IntPoint::operator CGPoint();
              v15.size.width = *(CGFloat *)MEMORY[0x1E0C9D820];
              v15.size.height = *(CGFloat *)(MEMORY[0x1E0C9D820] + 8);
              WebKit::CompactContextMenuPresenter::present(v14, v15);
              return;
            }
          }
        }
      }
    }
  }
}

- (id)_uiMenuElementsForMediaControlContextMenuItems:(void *)a3
{
  void *v5;
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
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26[2];

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned int *)a3 + 3));
  v6 = *((unsigned int *)a3 + 3);
  if ((_DWORD)v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)a3;
    v9 = 48 * v6;
    do
    {
      if (!*(_QWORD *)(v8 + v7))
      {
        v10 = *(_QWORD *)(v8 + v7 + 8);
        if (!v10 || !*(_DWORD *)(v10 + 4))
        {
          v11 = *(_QWORD *)(v8 + v7 + 16);
          if (v11)
          {
            if (!(*(_DWORD *)(v11 + 4) | *(_DWORD *)(v8 + v7 + 44)))
              goto LABEL_8;
          }
          else if (!*(_DWORD *)(v8 + v7 + 44))
          {
LABEL_8:
            v12 = objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E351F1B8, 0, 0, 1, MEMORY[0x1E0C9AA60]);
            goto LABEL_18;
          }
        }
      }
      v13 = v8 + v7;
      v14 = *(_QWORD *)(v8 + v7 + 16);
      if (v14 && *(_DWORD *)(v14 + 4))
        v15 = objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", WTF::StringImpl::operator NSString *());
      else
        v15 = 0;
      if (*(_DWORD *)(v13 + 44))
      {
        v16 = (void *)MEMORY[0x1E0CEA740];
        if (*(_QWORD *)(v8 + v7 + 8))
          v17 = (const __CFString *)WTF::StringImpl::operator NSString *();
        else
          v17 = &stru_1E351F1B8;
        v12 = objc_msgSend(v16, "menuWithTitle:image:identifier:options:children:", v17, v15, 0, 0, -[WKActionSheetAssistant _uiMenuElementsForMediaControlContextMenuItems:](self, "_uiMenuElementsForMediaControlContextMenuItems:", v13 + 32));
LABEL_18:
        v18 = (void *)v12;
        if (!v12)
          goto LABEL_26;
        goto LABEL_25;
      }
      v19 = (void *)MEMORY[0x1E0CEA2A8];
      v20 = *(void **)(v8 + v7);
      if (*(_QWORD *)(v8 + v7 + 8))
        v21 = (const __CFString *)WTF::StringImpl::operator NSString *();
      else
        v21 = &stru_1E351F1B8;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3321888768;
      v25[2] = ___ZZ73__WKActionSheetAssistant__uiMenuElementsForMediaControlContextMenuItems__ENK3__6clERN7WebCore28MediaControlsContextMenuItemE_block_invoke;
      v25[3] = &__block_descriptor_48_e8_32c148_ZTSKZZ73__WKActionSheetAssistant__uiMenuElementsForMediaControlContextMenuItems__ENK3__6clERN7WebCore28MediaControlsContextMenuItemEEUlP8UIActionE__e18_v16__0__UIAction_8l;
      v23 = 0;
      objc_initWeak(&v23, self);
      v24 = v20;
      v26[0] = 0;
      objc_copyWeak(v26, &v23);
      v26[1] = v24;
      v18 = (void *)objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", v21, v15, 0, v25);
      objc_destroyWeak(&v23);
      if (*(_BYTE *)(v8 + v7 + 24))
        objc_msgSend(v18, "setState:", 1);
      objc_destroyWeak(v26);
      if (!v18)
        goto LABEL_26;
LABEL_25:
      objc_msgSend(v5, "addObject:", v18);
LABEL_26:
      v7 += 48;
    }
    while (v9 != v7);
  }
  return (id)(id)CFMakeCollectable(v5);
}

- (void)showMediaControlsContextMenu:(FloatRect *)a3 items:(void *)a4 completionHandler:(void *)a5
{
  unsigned int v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *m_ptr;
  void *v21;
  void *value;
  id *v23;
  void *v24;
  void *v25;
  WTF::StringImpl *v26;
  uint64_t v27;
  unint64_t v28;
  CGRect v29;

  v27 = 0;
  v28 = 0;
  v8 = *((_DWORD *)a4 + 3);
  if (v8 == 1)
  {
    v9 = *(WTF::StringImpl **)(*(_QWORD *)a4 + 8);
    *(_QWORD *)(*(_QWORD *)a4 + 8) = 0;
    v10 = *(_QWORD *)a4;
    a4 = (void *)(*(_QWORD *)a4 + 32);
    v8 = *(_DWORD *)(v10 + 44);
    v11 = (unsigned int *)(v10 + 40);
  }
  else
  {
    v9 = 0;
    v11 = (unsigned int *)((char *)a4 + 8);
  }
  v12 = *v11;
  v13 = *(_QWORD *)a4;
  *(_QWORD *)a4 = 0;
  *((_QWORD *)a4 + 1) = 0;
  v27 = v13;
  v28 = __PAIR64__(v8, v12);
  objc_loadWeak(&self->_delegate.m_weakReference);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = (void *)objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "additionalMediaControlsContextMenuItemsForActionSheetAssistant:", self, v27, v28);
  else
    v14 = 0;
  if (objc_msgSend(objc_loadWeak(&self->_view.m_weakReference), "window")
    && (HIDWORD(v28) || objc_msgSend(v14, "count")))
  {
    v15 = objc_msgSend(-[WKActionSheetAssistant _uiMenuElementsForMediaControlContextMenuItems:](self, "_uiMenuElementsForMediaControlContextMenuItems:", &v27), "arrayByAddingObjectsFromArray:", v14);
    v16 = (void *)MEMORY[0x1E0CEA740];
    if (v9)
      v17 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v17 = &stru_1E351F1B8;
    v18 = (void *)objc_msgSend(v16, "menuWithTitle:children:", v17, v15, v27, v28);
    v19 = v18;
    if (v18)
      CFRetain(v18);
    m_ptr = self->_mediaControlsContextMenu.m_ptr;
    self->_mediaControlsContextMenu.m_ptr = v19;
    if (m_ptr)
      CFRelease(m_ptr);
    self->_mediaControlsContextMenuTargetFrame = *a3;
    v21 = *(void **)a5;
    *(_QWORD *)a5 = 0;
    value = self->_mediaControlsContextMenuCallback.m_function.m_callableWrapper.__ptr_.__value_;
    self->_mediaControlsContextMenuCallback.m_function.m_callableWrapper.__ptr_.__value_ = v21;
    if (value)
      (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
    v23 = -[WKActionSheetAssistant _mediaControlsContextMenuPresenter](self, "_mediaControlsContextMenuPresenter");
    WebCore::FloatRect::operator CGRect();
    WebKit::CompactContextMenuPresenter::present(v23, v29);
  }
  else
  {
    v25 = *(void **)a5;
    *(_QWORD *)a5 = 0;
    (*(void (**)(void *, _QWORD))(*(_QWORD *)v25 + 16))(v25, 0);
    (*(void (**)(void *))(*(_QWORD *)v25 + 8))(v25);
  }
  WTF::Vector<WebCore::MediaControlsContextMenuItem,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v27, v24);
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v26);
    else
      *(_DWORD *)v9 -= 2;
  }
}

- (id)suggestedActionsForContextMenuWithPositionInformation:(const void *)a3
{
  id v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  WKActionSheetAssistant *cf;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[_WKActivatedElementInfo _initWithInteractionInformationAtPosition:isUsingAlternateURLForImage:userInfo:]([_WKActivatedElementInfo alloc], "_initWithInteractionInformationAtPosition:isUsingAlternateURLForImage:userInfo:", a3, 0, 0);
  if (*((_BYTE *)a3 + 24))
  {
    if (self)
    {
      -[WKActionSheetAssistant defaultActionsForLinkSheet:](self, "defaultActionsForLinkSheet:", v5);
      goto LABEL_6;
    }
LABEL_9:
    cf = 0;
LABEL_10:
    v6 = 1;
    if (!v5)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (!self)
    goto LABEL_9;
  -[WKActionSheetAssistant defaultActionsForImageSheet:](self, "defaultActionsForImageSheet:", v5);
LABEL_6:
  self = cf;
  if (!cf)
    goto LABEL_10;
  CFRetain(cf);
  v6 = 0;
  if (v5)
LABEL_11:
    CFRetain(v5);
LABEL_12:
  if (-[WKActionSheetAssistant count](self, "count"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[WKActionSheetAssistant count](self, "count"));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = -[WKActionSheetAssistant countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(self);
          objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "uiActionForElementInfo:", v5));
        }
        v8 = -[WKActionSheetAssistant countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    if (v5)
      goto LABEL_21;
  }
  else
  {
    v7 = 0;
    if (v5)
LABEL_21:
      CFRelease(v5);
  }
  if ((v6 & 1) == 0)
    CFRelease(self);
  if (cf)
    CFRelease(cf);
  if (v5)
    CFRelease(v5);
  return v7;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  CompactContextMenuPresenter *value;
  CompactContextMenuPresenter *v10;
  void *v11;
  void *v12;
  id Weak;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *i;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v29;
  _QWORD v31[4];
  id v32;
  id location;

  value = self->_dataDetectorContextMenuPresenter.__ptr_.__value_;
  if (value && (id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction", a4.x, a4.y) == a3)
  {
    v12 = (void *)objc_msgSend((id)((uint64_t (*)(void))*MEMORY[0x1E0DCE0B8])(), "sharedController");
    objc_loadWeak(&self->_delegate.m_weakReference);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      Weak = objc_loadWeak(&self->_delegate.m_weakReference);
      if (!self->_anon_210[144])
        goto LABEL_29;
      v4 = (void *)objc_msgSend(Weak, "dataDetectionContextForActionSheetAssistant:positionInformation:", self, &self->_positionInformation);
    }
    else
    {
      v4 = 0;
    }
    objc_loadWeak(&self->_delegate.m_weakReference);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "selectedTextForActionSheetAssistant:", self);
    else
      v5 = 0;
    location = 0;
    if (!self->_anon_210[144])
      goto LABEL_29;
    v15 = WTF::URL::operator NSURL *();
    if (!self->_anon_210[144])
      goto LABEL_29;
    v6 = v15;
    if (!self->_positionInformation.var0.__val_.dataDetectorIdentifier.m_impl.m_ptr)
      goto LABEL_30;
    v16 = WTF::StringImpl::operator NSString *();
    if (!self->_anon_210[144])
      goto LABEL_29;
    for (i = (const __CFString *)v16; ; i = &stru_1E351F1B8)
    {
      v18 = objc_msgSend(v12, "resultForURL:identifier:selectedText:results:context:extendedContext:", v6, i, v5, self->_positionInformation.var0.__val_.dataDetectorResults.m_ptr, v4, &location);
      if (self->_anon_210[144])
      {
        v12 = (void *)v18;
        if (self->_positionInformation.var0.__val_.isLink)
          v19 = WebCore::FloatRect::operator CGRect();
        else
          v19 = WebCore::IntRect::operator CGRect();
        v24 = v20;
        v25 = v21;
        v26 = v22;
        v27 = v23;
        v4 = (void *)((uint64_t (*)(uint64_t))*MEMORY[0x1E0DCE078])(v19);
        v5 = objc_msgSend(v4, "updateContext:withSourceRect:", location, v24, v25, v26, v27);
        if (v12)
          return (id)objc_msgSend(v4, "contextMenuConfigurationWithResult:inView:context:menuIdentifier:", v12, objc_loadWeak(&self->_view.m_weakReference), v5, 0);
        if (self->_anon_210[144])
          break;
      }
LABEL_29:
      __break(1u);
LABEL_30:
      ;
    }
    v29 = WTF::URL::operator NSURL *();
    return (id)objc_msgSend(v4, "contextMenuConfigurationWithURL:inView:context:menuIdentifier:", v29, objc_loadWeak(&self->_view.m_weakReference), v5, 0);
  }
  else
  {
    v10 = self->_mediaControlsContextMenuPresenter.__ptr_.__value_;
    if (v10 && (id)objc_msgSend(*((id *)v10 + 1), "contextMenuInteraction", a4.x, a4.y) == a3)
    {
      v14 = (void *)MEMORY[0x1E0CEA4B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3321888768;
      v31[2] = __80__WKActionSheetAssistant_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
      v31[3] = &__block_descriptor_40_e8_32c93_ZTSKZ80__WKActionSheetAssistant_contextMenuInteraction_configurationForMenuAtLocation__E3__7_e25___UIMenu_16__0__NSArray_8l;
      location = 0;
      objc_initWeak(&location, self);
      v32 = 0;
      objc_copyWeak(&v32, &location);
      v11 = (void *)objc_msgSend(v14, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v31);
      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
    else
    {
      return 0;
    }
  }
  return v11;
}

uint64_t __80__WKActionSheetAssistant_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    return 0;
  v2 = WeakRetained[88];
  CFRelease(WeakRetained);
  return v2;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  CompactContextMenuPresenter *value;
  CompactContextMenuPresenter *v8;
  void *v9;
  id result;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  id Weak;
  const void *v20;
  CFTypeRef v21;
  WeakObjCPtr<UIView> *p_view;
  const void *v23;

  value = self->_dataDetectorContextMenuPresenter.__ptr_.__value_;
  if (!value || (id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction", a3, a4, a5) != a3)
  {
    v8 = self->_mediaControlsContextMenuPresenter.__ptr_.__value_;
    if (!v8 || (id)objc_msgSend(*((id *)v8 + 1), "contextMenuInteraction", a3, a4, a5) != a3)
      return 0;
    v16 = objc_alloc(MEMORY[0x1E0CEABB0]);
    WebCore::FloatRect::operator CGRect();
    v11 = (id)objc_msgSend(v16, "initWithFrame:");
    v17 = objc_alloc_init(MEMORY[0x1E0CEA8B8]);
    v18 = objc_alloc(MEMORY[0x1E0CEA8C0]);
    Weak = objc_loadWeak(&self->_view.m_weakReference);
    WebCore::FloatPoint::operator CGPoint();
    v20 = (const void *)objc_msgSend(v18, "initWithContainer:center:", Weak);
    v21 = (id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:parameters:target:", v11, v17, v20));
    goto LABEL_11;
  }
  result = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (self->_anon_210[144])
  {
    v11 = result;
    WebCore::IntPoint::operator CGPoint();
    v13 = v12;
    v15 = v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v11, "createTargetedContextMenuHintForActionSheetAssistant:", self);
LABEL_15:
      if (v11)
        CFRelease(v11);
      return v9;
    }
    v17 = objc_alloc_init(MEMORY[0x1E0CEA8B8]);
    p_view = &self->_view;
    v20 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA8C0]), "initWithContainer:center:", objc_loadWeak(&p_view->m_weakReference), v13, v15);
    v23 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:parameters:target:", objc_loadWeak(&p_view->m_weakReference), v17, v20);
    v21 = (id)CFMakeCollectable(v23);
LABEL_11:
    v9 = (void *)v21;
    if (v20)
      CFRelease(v20);
    if (v17)
      CFRelease(v17);
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3321888768;
  v7[2] = __90__WKActionSheetAssistant_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c103_ZTSKZ90__WKActionSheetAssistant_contextMenuInteraction_willDisplayMenuForConfiguration_animator__E3__8_e5_v8__0l;
  objc_initWeak(&v6, self);
  v8 = 0;
  objc_copyWeak(&v8, &v6);
  objc_msgSend(a5, "addCompletion:", v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
}

void __90__WKActionSheetAssistant_contextMenuInteraction_willDisplayMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    v3 = WeakRetained + 1;
    objc_loadWeak(WeakRetained + 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(objc_loadWeak(v3), "actionSheetAssistantDidShowContextMenu:", v2);
    CFRelease(v2);
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  CompactContextMenuPresenter *value;
  CompactContextMenuPresenter *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  value = self->_dataDetectorContextMenuPresenter.__ptr_.__value_;
  if (value && (id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction", a3, a4) == a3)
    -[WKActionSheetAssistant _resetDataDetectorContextMenuPresenter](self, "_resetDataDetectorContextMenuPresenter");
  v9 = self->_mediaControlsContextMenuPresenter.__ptr_.__value_;
  if (v9 && (id)objc_msgSend(*((id *)v9 + 1), "contextMenuInteraction", a3, a4) == a3)
    -[WKActionSheetAssistant _resetMediaControlsContextMenuPresenter](self, "_resetMediaControlsContextMenuPresenter");
  v10 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3321888768;
  v11[2] = __82__WKActionSheetAssistant_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32c95_ZTSKZ82__WKActionSheetAssistant_contextMenuInteraction_willEndForConfiguration_animator__E3__9_e5_v8__0l;
  objc_initWeak(&v10, self);
  v12 = 0;
  objc_copyWeak(&v12, &v10);
  objc_msgSend(a5, "addCompletion:", v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
}

void __82__WKActionSheetAssistant_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    v3 = WeakRetained + 1;
    objc_loadWeak(WeakRetained + 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(objc_loadWeak(v3), "actionSheetAssistantDidDismissContextMenu:", v2);
    CFRelease(v2);
  }
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  CompactContextMenuPresenter *value;

  value = self->_dataDetectorContextMenuPresenter.__ptr_.__value_;
  if (value && (id)objc_msgSend(*((id *)value + 1), "contextMenuInteraction", a3, a4) == a3 && self->_anon_210[144])
    return -[WKActionSheetAssistant suggestedActionsForContextMenuWithPositionInformation:](self, "suggestedActionsForContextMenuWithPositionInformation:", &self->_positionInformation);
  else
    return 0;
}

- (void)handleElementActionWithType:(int64_t)a3 element:(id)a4 needsInteraction:(BOOL)a5
{
  _BOOL4 v5;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  WTF::StringImpl *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  WTF::StringImpl *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  char v27;
  WTF::StringImpl *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  WTF::StringImpl *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  WTF::StringImpl *v37;
  uint64_t v38;

  v5 = a5;
  WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "actionSheetAssistant:willStartInteractionWithElement:", self, a4);
  v10 = 0;
  switch(a3)
  {
    case 1:
      if (objc_msgSend(a4, "_isUsingAlternateURLForImage"))
      {
        v23 = (void *)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v24 = objc_msgSend(a4, "URL");
        objc_msgSend(v23, "openURL:options:completionHandler:", v24, MEMORY[0x1E0C9AA70], 0);
      }
      else
      {
        v37 = (WTF::StringImpl *)objc_msgSend(a4, "_interactionLocation");
        WebCore::IntPoint::operator CGPoint();
        objc_msgSend(WeakRetained, "actionSheetAssistant:openElementAtLocation:", self);
      }
      goto LABEL_43;
    case 2:
      goto LABEL_19;
    case 3:
      v10 = 1;
LABEL_19:
      objc_msgSend(WeakRetained, "actionSheetAssistant:performAction:", self, v10);
      goto LABEL_43;
    case 7:
      MEMORY[0x19AEABB18](&v37, objc_msgSend(a4, "imageURL"));
      if (!WTF::URL::protocolIs() || !objc_msgSend(a4, "image"))
      {
        v32 = v37;
        v37 = 0;
        if (v32)
        {
          if (*(_DWORD *)v32 == 2)
            WTF::StringImpl::destroy(v32, v25);
          else
            *(_DWORD *)v32 -= 2;
        }
        goto LABEL_37;
      }
      v27 = objc_opt_respondsToSelector();
      v28 = v37;
      v37 = 0;
      if (!v28)
        goto LABEL_29;
      if (*(_DWORD *)v28 == 2)
      {
        WTF::StringImpl::destroy(v28, v26);
        if ((v27 & 1) != 0)
        {
LABEL_50:
          v36 = objc_msgSend(a4, "image");
          objc_msgSend(a4, "boundingRect");
          objc_msgSend(WeakRetained, "actionSheetAssistant:shareElementWithImage:rect:", self, v36);
          goto LABEL_43;
        }
      }
      else
      {
        *(_DWORD *)v28 -= 2;
LABEL_29:
        if ((v27 & 1) != 0)
          goto LABEL_50;
      }
LABEL_37:
      if (objc_msgSend(a4, "URL")
        && ((v33 = (void *)objc_msgSend((id)objc_msgSend(a4, "URL"), "scheme")) == 0
         || objc_msgSend(v33, "caseInsensitiveCompare:", CFSTR("javascript"))))
      {
        v34 = objc_msgSend(a4, "URL");
      }
      else
      {
        v34 = objc_msgSend(a4, "imageURL");
      }
      v35 = v34;
      objc_msgSend(a4, "boundingRect");
      objc_msgSend(WeakRetained, "actionSheetAssistant:shareElementWithURL:rect:", self, v35);
LABEL_43:
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "actionSheetAssistantDidStopInteraction:", self);
      if (WeakRetained)
        CFRelease(WeakRetained);
      return;
    case 12:
      v29 = objc_msgSend(a4, "image");
      v30 = objc_msgSend(a4, "imageURL");
      v31 = objc_msgSend(a4, "title");
      objc_msgSend(a4, "boundingRect");
      objc_msgSend(WeakRetained, "actionSheetAssistant:showTextForImage:imageURL:title:imageBounds:", self, v29, v30, v31);
      goto LABEL_43;
    case 13:
      v20 = objc_msgSend(a4, "image");
      v21 = objc_msgSend(a4, "imageURL");
      v22 = objc_msgSend(a4, "title");
      objc_msgSend(a4, "boundingRect");
      objc_msgSend(WeakRetained, "actionSheetAssistant:lookUpImage:imageURL:title:imageBounds:", self, v20, v21, v22);
      goto LABEL_43;
    case 14:
      objc_msgSend(WeakRetained, "actionSheetAssistant:copySubject:sourceMIMEType:", self, objc_msgSend(a4, "image"), objc_msgSend(a4, "imageMIMEType"));
      goto LABEL_43;
    case 15:
    case 16:
      if (a3 == 16)
        v11 = 2;
      else
        v11 = 3;
      objc_msgSend(WeakRetained, "actionSheetAssistant:performAction:", self, v11);
      if (!*(_DWORD *)(objc_msgSend(a4, "_animationsUnderElement") + 12) || (objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_43;
      v12 = objc_msgSend(a4, "_animationsUnderElement");
      v37 = 0;
      v38 = 0;
      v13 = *(unsigned int *)(v12 + 12);
      if (!(_DWORD)v13)
        goto LABEL_16;
      if (v13 >= 0x3333334)
      {
        __break(0xC471u);
        return;
      }
      v14 = 80 * v13;
      v15 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)(80 * v13));
      LODWORD(v38) = v14 / 0x50;
      v37 = v15;
      if (*(_DWORD *)(v12 + 12))
      {
        v16 = 0;
        v17 = 0;
        do
        {
          memmove(v15, (const void *)(*(_QWORD *)v12 + v16), 0x50uLL);
          ++v17;
          v15 = (WTF::StringImpl *)((char *)v15 + 80);
          v16 += 96;
        }
        while (v17 < *(unsigned int *)(v12 + 12));
        HIDWORD(v38) = v17;
      }
LABEL_16:
      objc_msgSend(WeakRetained, "_actionSheetAssistant:performAction:onElements:", self, v11, &v37);
      v19 = v37;
      if (v37)
      {
        v37 = 0;
        LODWORD(v38) = 0;
        WTF::fastFree(v19, v18);
      }
      goto LABEL_43;
    default:
      goto LABEL_43;
  }
}

- (void)cleanupSheet
{
  id WeakRetained;
  void *v4;
  void *m_ptr;
  void *v6;

  WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "actionSheetAssistantDidStopInteraction:", self);
  objc_msgSend(self->_interactionSheet.m_ptr, "doneWithSheet:", !self->_isPresentingDDUserInterface);
  objc_msgSend(self->_interactionSheet.m_ptr, "setSheetDelegate:", 0);
  m_ptr = self->_interactionSheet.m_ptr;
  self->_interactionSheet.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v6 = self->_elementInfo.m_ptr;
  self->_elementInfo.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  if (self->_anon_210[144])
  {
    WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)&self->_positionInformation, v4);
    self->_anon_210[144] = 0;
  }
  *(_WORD *)&self->_needsLinkIndicator = 0;
  self->_hasPendingActionSheet = 0;
  if (WeakRetained)
    CFRelease(WeakRetained);
}

- (id)currentlyAvailableActionTitles
{
  void *m_ptr;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  m_ptr = self->_interactionSheet.m_ptr;
  if (!m_ptr)
    return (id)MEMORY[0x1E0C9AA60];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(m_ptr, "actions"), "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_msgSend(self->_interactionSheet.m_ptr, "actions", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "title"));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  return v4;
}

- (id)_contentsOfContextMenuItem:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (objc_msgSend((id)objc_msgSend(a3, "title"), "length"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "title"), CFSTR("title"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "children"), "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (void *)objc_msgSend(a3, "children", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "addObject:", -[WKActionSheetAssistant _contentsOfContextMenuItem:](self, "_contentsOfContextMenuItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++)));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("children"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "state") == 1)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("checked"));
  return v5;
}

- (id)currentlyAvailableMediaControlsContextMenuItems
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (self->_mediaControlsContextMenu.m_ptr)
    objc_msgSend(v3, "addObject:", -[WKActionSheetAssistant _contentsOfContextMenuItem:](self, "_contentsOfContextMenuItem:"));
  return v3;
}

- (void)setNeedsLinkIndicator:(BOOL)a3
{
  self->_needsLinkIndicator = a3;
}

- (void).cxx_destruct
{
  void *value;
  void *m_ptr;
  void *v5;
  void *v6;
  void *v7;

  objc_destroyWeak(&self->_view.m_weakReference);
  value = self->_mediaControlsContextMenuCallback.m_function.m_callableWrapper.__ptr_.__value_;
  self->_mediaControlsContextMenuCallback.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  m_ptr = self->_mediaControlsContextMenu.m_ptr;
  self->_mediaControlsContextMenu.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_mediaControlsContextMenuPresenter, 0);
  std::unique_ptr<WebKit::CompactContextMenuPresenter>::reset[abi:sn180100]((id **)&self->_dataDetectorContextMenuPresenter, 0);
  if (self->_anon_210[144])
    WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)&self->_positionInformation, v5);
  v6 = self->_elementInfo.m_ptr;
  self->_elementInfo.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = self->_interactionSheet.m_ptr;
  self->_interactionSheet.m_ptr = 0;
  if (v7)
    CFRelease(v7);
  objc_destroyWeak(&self->_delegate.m_weakReference);
}

@end
