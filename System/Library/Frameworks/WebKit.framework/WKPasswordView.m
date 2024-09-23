@implementation WKPasswordView

- (WKPasswordView)initWithFrame:(CGRect)a3 documentName:(id)a4
{
  WKPasswordView *v5;
  uint64_t v6;
  void *m_ptr;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WKPasswordView;
  v5 = -[WKPasswordView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = objc_msgSend(a4, "copy");
    m_ptr = v5->_documentName.m_ptr;
    v5->_documentName.m_ptr = (void *)v6;
    if (m_ptr)
      CFRelease(m_ptr);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA540]), "initWithDocumentName:", v5->_documentName.m_ptr);
    v9 = v5->_passwordView.m_ptr;
    v5->_passwordView.m_ptr = v8;
    if (v9)
    {
      CFRelease(v9);
      v8 = v5->_passwordView.m_ptr;
    }
    -[WKPasswordView bounds](v5, "bounds");
    objc_msgSend(v8, "setFrame:");
    objc_msgSend(v5->_passwordView.m_ptr, "setPasswordDelegate:", v5);
    objc_msgSend(v5->_passwordView.m_ptr, "setAutoresizingMask:", 18);
    -[WKPasswordView setAutoresizesSubviews:](v5, "setAutoresizesSubviews:", 1);
    -[WKPasswordView addSubview:](v5, "addSubview:", v5->_passwordView.m_ptr);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKPasswordView;
  -[WKPasswordView dealloc](&v3, sel_dealloc);
}

- (NSString)documentName
{
  return (NSString *)self->_documentName.m_ptr;
}

- (void)layoutSubviews
{
  void *m_ptr;
  double v3;
  double v4;

  m_ptr = self->_scrollView.m_ptr;
  if (m_ptr)
  {
    -[WKPasswordView frame](self, "frame");
    objc_msgSend(m_ptr, "setContentSize:", v3, v4);
  }
}

- (void)showInScrollView:(id)a3
{
  void *m_ptr;
  id v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_scrollView.m_ptr;
  self->_scrollView.m_ptr = a3;
  v6 = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v6 = self->_scrollView.m_ptr;
  }
  objc_msgSend(v6, "minimumZoomScale");
  self->_savedMinimumZoomScale = v7;
  objc_msgSend(self->_scrollView.m_ptr, "maximumZoomScale");
  self->_savedMaximumZoomScale = v8;
  objc_msgSend(self->_scrollView.m_ptr, "zoomScale");
  self->_savedZoomScale = v9;
  objc_msgSend(self->_scrollView.m_ptr, "contentSize");
  self->_savedContentSize.width = v10;
  self->_savedContentSize.height = v11;
  v12 = (void *)objc_msgSend(self->_scrollView.m_ptr, "backgroundColor");
  v13 = v12;
  if (v12)
    CFRetain(v12);
  v14 = self->_savedBackgroundColor.m_ptr;
  self->_savedBackgroundColor.m_ptr = v13;
  if (v14)
    CFRelease(v14);
  objc_msgSend(self->_scrollView.m_ptr, "setMinimumZoomScale:", 1.0);
  objc_msgSend(self->_scrollView.m_ptr, "setMaximumZoomScale:", 1.0);
  objc_msgSend(self->_scrollView.m_ptr, "setZoomScale:", 1.0);
  v15 = self->_scrollView.m_ptr;
  -[WKPasswordView frame](self, "frame");
  objc_msgSend(v15, "setContentSize:", v16, v17);
  objc_msgSend(self->_scrollView.m_ptr, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor"));
  objc_msgSend(a3, "addSubview:", self);
}

- (void)hide
{
  void *m_ptr;
  void *v4;

  objc_msgSend(self->_scrollView.m_ptr, "setMinimumZoomScale:", self->_savedMinimumZoomScale);
  objc_msgSend(self->_scrollView.m_ptr, "setMaximumZoomScale:", self->_savedMaximumZoomScale);
  objc_msgSend(self->_scrollView.m_ptr, "setZoomScale:", self->_savedZoomScale);
  objc_msgSend(self->_scrollView.m_ptr, "setContentSize:", self->_savedContentSize.width, self->_savedContentSize.height);
  objc_msgSend(self->_scrollView.m_ptr, "setBackgroundColor:", self->_savedBackgroundColor.m_ptr);
  m_ptr = self->_scrollView.m_ptr;
  self->_scrollView.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_savedBackgroundColor.m_ptr;
  self->_savedBackgroundColor.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  -[WKPasswordView removeFromSuperview](self, "removeFromSuperview");
}

- (void)showPasswordFailureAlert
{
  WebKit *v3;
  const __CFString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  void *v7;
  const __CFString *v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  WTF::StringImpl *v15;
  id v16;

  v3 = (WebKit *)&stru_1E351F1B8;
  objc_msgSend((id)objc_msgSend(self->_passwordView.m_ptr, "passwordField"), "setText:", &stru_1E351F1B8);
  WebCore::localizedString((WebCore *)CFSTR("The document could not be opened with that password."), v4);
  if (v15)
    v3 = (WebKit *)WTF::StringImpl::operator NSString *();
  WebKit::createUIAlertController(v3, &stru_1E351F1B8.isa, &v16);
  v6 = v15;
  v15 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = (void *)MEMORY[0x1E0CEA2E0];
  WebCore::localizedString((WebCore *)CFSTR("OK (password failure alert)"), (const __CFString *)v5);
  if (v15)
    v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v8 = &stru_1E351F1B8;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3321888768;
  v14[2] = __42__WKPasswordView_showPasswordFailureAlert__block_invoke;
  v14[3] = &__block_descriptor_33_e8_32c55_ZTSKZ42__WKPasswordView_showPasswordFailureAlert_E3__9_e23_v16__0__UIAlertAction_8l;
  v10 = objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v14);
  v11 = v15;
  v15 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v9);
    else
      *(_DWORD *)v11 -= 2;
  }
  objc_msgSend(v16, "addAction:", v10);
  v12 = (void *)objc_msgSend((id)-[WKPasswordView window](self, "window"), "rootViewController");
  objc_msgSend(v12, "presentViewController:animated:completion:", v16, 1, 0);
  v13 = v16;
  v16 = 0;
  if (v13)
    CFRelease(v13);
}

- (void)_keyboardDidShow:(id)a3
{
  void *v4;
  double x;
  double y;
  double width;
  double height;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v4 = (void *)objc_msgSend(self->_passwordView.m_ptr, "passwordField", a3);
  if (objc_msgSend(v4, "isEditing"))
  {
    objc_msgSend(MEMORY[0x1E0CEA828], "visiblePeripheralFrame");
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
    if (!CGRectIsEmpty(v30))
    {
      v9 = (void *)objc_msgSend(self->_scrollView.m_ptr, "window");
      objc_msgSend(v9, "convertRect:fromWindow:", 0, x, y, width, height);
      objc_msgSend(self->_scrollView.m_ptr, "convertRect:fromView:", v9);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v4, "bounds");
      objc_msgSend(v4, "convertRect:toView:", self->_scrollView.m_ptr);
      v28 = v19;
      v29 = v18;
      v21 = v20;
      v23 = v22;
      objc_msgSend(self->_passwordView.m_ptr, "bounds");
      v25 = v24;
      v27 = v26;
      v31.origin.x = v11;
      v31.origin.y = v13;
      v31.size.width = v15;
      v31.size.height = v17;
      objc_msgSend(self->_scrollView.m_ptr, "setContentSize:", v25, CGRectGetHeight(v31) + v27);
      v32.origin.x = v29;
      v32.origin.y = v21;
      v32.size.width = v28;
      v32.size.height = v23;
      v35.origin.x = v11;
      v35.origin.y = v13;
      v35.size.width = v15;
      v35.size.height = v17;
      if (CGRectIntersectsRect(v32, v35))
      {
        v33.origin.x = v29;
        v33.origin.y = v21;
        v33.size.width = v28;
        v33.size.height = v23;
        CGRectGetMaxY(v33);
        v34.origin.x = v11;
        v34.origin.y = v13;
        v34.size.width = v15;
        v34.size.height = v17;
        CGRectGetMinY(v34);
        objc_msgSend(self->_scrollView.m_ptr, "contentOffset");
        objc_msgSend(self->_scrollView.m_ptr, "setContentOffset:animated:", 1);
      }
    }
  }
}

- (void)userDidEnterPassword:(id)a3 forPasswordView:(id)a4
{
  void (**userDidEnterPassword)(id, id, id, id);

  if (self)
    CFRetain(self);
  userDidEnterPassword = (void (**)(id, id, id, id))self->_userDidEnterPassword;
  if (userDidEnterPassword)
    userDidEnterPassword[2](userDidEnterPassword, a3, a3, a4);
  CFRelease(self);
}

- (void)didBeginEditingPassword:(id)a3 inView:(id)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__keyboardDidShow_, *MEMORY[0x1E0CEB828], 0);
}

- (void)didEndEditingPassword:(id)a3 inView:(id)a4
{
  void *m_ptr;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  m_ptr = self->_scrollView.m_ptr;
  objc_msgSend(self->_passwordView.m_ptr, "frame", a3, a4);
  objc_msgSend(m_ptr, "setContentSize:", v6, v7);
  objc_msgSend(self->_scrollView.m_ptr, "contentInset");
  objc_msgSend(self->_scrollView.m_ptr, "setContentOffset:animated:", 1, -v8, -v9);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v10, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB828], 0);
}

- (id)userDidEnterPassword
{
  return self->_userDidEnterPassword;
}

- (void)setUserDidEnterPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;

  m_ptr = self->_savedBackgroundColor.m_ptr;
  self->_savedBackgroundColor.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_passwordView.m_ptr;
  self->_passwordView.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_scrollView.m_ptr;
  self->_scrollView.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_documentName.m_ptr;
  self->_documentName.m_ptr = 0;
  if (v6)
    CFRelease(v6);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 52) = 0;
  *((_QWORD *)self + 53) = 0;
  *((_QWORD *)self + 54) = 0;
  *((_QWORD *)self + 60) = 0;
  return self;
}

@end
