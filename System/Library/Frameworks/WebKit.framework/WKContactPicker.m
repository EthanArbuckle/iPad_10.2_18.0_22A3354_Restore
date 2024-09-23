@implementation WKContactPicker

- (WKContactPickerDelegate)delegate
{
  WKContactPickerDelegate *WeakRetained;
  WKContactPickerDelegate *v3;

  WeakRetained = (WKContactPickerDelegate *)objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v3 = WeakRetained;
  if (WeakRetained)
    CFRelease(WeakRetained);
  return v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate.m_weakReference, a3);
}

- (WKContactPicker)initWithView:(id)a3
{
  WKContactPicker *v4;
  WKContactPicker *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKContactPicker;
  v4 = -[WKContactPicker init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeWeak(&v4->_webView.m_weakReference, a3);
  return v5;
}

- (void)presentWithRequestData:(const void *)a3 completionHandler:(void *)a4
{
  Vector<WebCore::ContactProperty, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_properties;
  unsigned int m_size;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *value;
  __objc2_class *v13;
  void *v14;
  void *m_ptr;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  p_properties = &self->_properties;
  if (&self->_properties != a3)
  {
    m_size = self->_properties.m_size;
    v9 = *((_DWORD *)a3 + 3);
    if (m_size <= v9)
    {
      if (v9 > self->_properties.m_capacity)
      {
        WTF::Vector<WebCore::AuthenticatorTransport,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&self->_properties, 0);
        WTF::Vector<WebCore::AuthenticatorTransport,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)p_properties, (WTF *)*((unsigned int *)a3 + 3));
        m_size = self->_properties.m_size;
      }
    }
    else
    {
      self->_properties.m_size = v9;
      m_size = v9;
    }
    if (m_size)
    {
      memmove(self->_properties.m_buffer, *(const void **)a3, m_size);
      v10 = self->_properties.m_size;
    }
    else
    {
      v10 = 0;
    }
    memcpy(&self->_properties.m_buffer[v10], (const void *)(*(_QWORD *)a3 + v10), *(_QWORD *)a3 + *((unsigned int *)a3 + 3) - (*(_QWORD *)a3 + v10));
    self->_properties.m_size = *((_DWORD *)a3 + 3);
  }
  v11 = *(void **)a4;
  *(_QWORD *)a4 = 0;
  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = v11;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  if (*((_BYTE *)a3 + 16))
    v13 = WKCNContactPickerMultiSelectDelegate;
  else
    v13 = WKCNContactPickerSingleSelectDelegate;
  v14 = (void *)objc_msgSend([v13 alloc], "initWithContactPickerDelegate:", self);
  m_ptr = self->_contactPickerDelegate.m_ptr;
  self->_contactPickerDelegate.m_ptr = v14;
  if (m_ptr)
    CFRelease(m_ptr);
  v16 = (void *)objc_msgSend(objc_alloc((Class)getCNContactPickerViewControllerClass()), "init");
  v17 = self->_contactPickerViewController.m_ptr;
  self->_contactPickerViewController.m_ptr = v16;
  if (v17)
  {
    CFRelease(v17);
    v16 = self->_contactPickerViewController.m_ptr;
  }
  objc_msgSend(v16, "setDelegate:", self->_contactPickerDelegate.m_ptr);
  v18 = self->_contactPickerViewController.m_ptr;
  if (*((_QWORD *)a3 + 3))
    v19 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v19 = &stru_1E351F1B8;
  objc_msgSend(v18, "setPrompt:", v19);
  v20 = (void *)objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "_wk_viewControllerForFullScreenPresentation");
  v21 = self->_contactPickerViewController.m_ptr;
  v22 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3321888768;
  v23[2] = __60__WKContactPicker_presentWithRequestData_completionHandler___block_invoke;
  v23[3] = &__block_descriptor_40_e8_32c73_ZTSKZ60__WKContactPicker_presentWithRequestData_completionHandler__E3__8_e5_v8__0l;
  objc_initWeak(&v22, self);
  v24 = 0;
  objc_copyWeak(&v24, &v22);
  objc_msgSend(v20, "presentViewController:animated:completion:", v21, 1, v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
}

void __60__WKContactPicker_presentWithRequestData_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend((id)objc_msgSend(v2, "delegate"), "contactPickerDidPresent:", v2);
    CFRelease(v2);
  }
}

- (void)dismiss
{
  -[WKContactPicker dismissWithContacts:](self, "dismissWithContacts:", 0);
}

- (BOOL)dismissIfNeededWithReason:(unsigned __int8)a3
{
  if (a3 == 1)
  {
    if ((objc_msgSend(self->_contactPickerViewController.m_ptr, "_wk_isInFullscreenPresentation") & 1) != 0)
      return 0;
    goto LABEL_5;
  }
  if ((a3 - 1) <= 1)
LABEL_5:
    -[WKContactPicker setDelegate:](self, "setDelegate:", 0);
  -[WKContactPicker dismiss](self, "dismiss");
  return 1;
}

- (void)contactPickerDidCancel:(id)a3
{
  void *v3;
  _QWORD v4[2];

  v4[0] = 0;
  v4[1] = 0;
  -[WKContactPicker _contactPickerDidDismissWithContactInfo:](self, "_contactPickerDidDismissWithContactInfo:", v4);
  WTF::Vector<WebCore::ContactInfo,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v4, v3);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    -[WKContactPicker _contactInfoFromCNContact:](self, "_contactInfoFromCNContact:", a4);
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
  }
  v10 = 1;
  v9 = WTF::fastMalloc((WTF *)0x30);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v9, (uint64_t)&v12);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v9 + 16, (uint64_t)&v13);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v9 + 32, (uint64_t)&v14);
  v11 = 1;
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v14, v5);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v13, v6);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v12, v7);
  -[WKContactPicker _contactPickerDidDismissWithContactInfo:](self, "_contactPickerDidDismissWithContactInfo:", &v9);
  WTF::Vector<WebCore::ContactInfo,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v9, v8);
}

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;

  v6 = objc_msgSend(a4, "count", a3);
  v24 = 0;
  v25 = 0;
  if (!v6)
  {
LABEL_8:
    -[WKContactPicker _contactPickerDidDismissWithContactInfo:](self, "_contactPickerDidDismissWithContactInfo:", &v24);
    WTF::Vector<WebCore::ContactInfo,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v24, v23);
    return;
  }
  v7 = v6;
  if (v6 < 0x5555556)
  {
    v8 = 0;
    LODWORD(v25) = 48 * (int)v6 / 0x30u;
    v24 = WTF::fastMalloc((WTF *)(48 * v6));
    v9 = v24 + 24;
    do
    {
      v10 = objc_msgSend(a4, "objectAtIndexedSubscript:", v8, v24, v25);
      if (self)
      {
        -[WKContactPicker _contactInfoFromCNContact:](self, "_contactInfoFromCNContact:", v10);
        v12 = v26;
        v14 = v27;
        v13 = v28;
        v15 = v29;
        v17 = v30;
        v16 = v31;
        v18 = v32;
        v20 = v33;
        v19 = v34;
      }
      else
      {
        v19 = 0;
        v20 = 0;
        v18 = 0;
        v16 = 0;
        v17 = 0;
        v15 = 0;
        v13 = 0;
        v14 = 0;
        v12 = 0;
      }
      v26 = 0;
      *(_QWORD *)(v9 - 24) = v12;
      v27 = 0;
      *(_DWORD *)(v9 - 16) = v14;
      v28 = 0;
      *(_DWORD *)(v9 - 12) = v13;
      *(_QWORD *)v9 = 0;
      v29 = 0;
      *(_QWORD *)(v9 - 8) = v15;
      v30 = 0;
      *(_DWORD *)v9 = v17;
      v31 = 0;
      *(_DWORD *)(v9 + 4) = v16;
      *(_QWORD *)(v9 + 16) = 0;
      v32 = 0;
      *(_QWORD *)(v9 + 8) = v18;
      v33 = 0;
      *(_DWORD *)(v9 + 16) = v20;
      v34 = 0;
      *(_DWORD *)(v9 + 20) = v19;
      HIDWORD(v25) = ++v8;
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v32, v11);
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v29, v21);
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v26, v22);
      v9 += 48;
    }
    while (v7 != v8);
    goto LABEL_8;
  }
  __break(0xC471u);
}

- (void)_contactPickerDidDismissWithContactInfo:(void *)a3
{
  uint64_t v4;
  void *value;
  void *v6;
  _QWORD v7[2];
  char v8;

  v7[0] = *(_QWORD *)a3;
  v4 = *((_QWORD *)a3 + 1);
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  v7[1] = v4;
  v8 = 1;
  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  (*(void (**)(void *, _QWORD *))(*(_QWORD *)value + 16))(value, v7);
  (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  if (v8)
    WTF::Vector<WebCore::ContactInfo,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v7, v6);
  objc_loadWeak(&self->_delegate.m_weakReference);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(objc_loadWeak(&self->_delegate.m_weakReference), "contactPickerDidDismiss:", self);
}

- (ContactInfo)_contactInfoFromCNContact:(SEL)a3
{
  uint64_t m_buffer_high;
  ContactInfo *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  void *v11;
  uint64_t m_size;
  String *m_buffer;
  uint64_t v14;
  WTF::StringImpl *v15;
  void *v17;
  ContactInfo *v18;
  uint64_t v19;
  ContactInfo *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  int v24;
  void *v25;
  ContactInfo *v26;
  uint64_t v27;
  ContactInfo *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  String *v38;
  uint64_t v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _DWORD *v42[2];

  v42[1] = *(_DWORD **)MEMORY[0x1E0C80C00];
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  retstr->var0 = 0u;
  m_buffer_high = HIDWORD(self->var2.m_buffer);
  if ((_DWORD)m_buffer_high)
  {
    v7 = self;
    v8 = 0;
    v9 = *(unsigned __int8 **)&self->var1.m_capacity;
    do
    {
      if (v9[v8] == 1)
      {
        v10 = objc_msgSend((id)getCNContactFormatterClass(), "stringFromContact:style:", a4, 0);
        MEMORY[0x19AEABCC8](v42, v10);
        WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)&v38, v42, 1uLL);
        m_size = retstr->var0.m_size;
        if ((_DWORD)m_size)
          WTF::VectorDestructor<true,WTF::String>::destruct((WTF::StringImpl *)retstr->var0.m_buffer, (WTF::StringImpl *)&retstr->var0.m_buffer[m_size]);
        m_buffer = retstr->var0.m_buffer;
        if (retstr->var0.m_buffer)
        {
          retstr->var0.m_buffer = 0;
          retstr->var0.m_capacity = 0;
          WTF::fastFree((WTF *)m_buffer, v11);
        }
        retstr->var0.m_buffer = v38;
        v14 = v39;
        v38 = 0;
        v39 = 0;
        *(_QWORD *)&retstr->var0.m_capacity = v14;
        WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v38, v11);
        self = (ContactInfo *)v42[0];
        v42[0] = 0;
        if (self)
        {
          if (LODWORD(self->var0.m_buffer) == 2)
            self = (ContactInfo *)WTF::StringImpl::destroy((WTF::StringImpl *)self, v15);
          else
            LODWORD(self->var0.m_buffer) -= 2;
        }
        m_buffer_high = HIDWORD(v7->var2.m_buffer);
        if ((_DWORD)m_buffer_high)
        {
          v9 = *(unsigned __int8 **)&v7->var1.m_capacity;
          break;
        }
        return self;
      }
      ++v8;
    }
    while (m_buffer_high != v8);
    while (*v9++)
    {
      if (!--m_buffer_high)
        goto LABEL_30;
    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v17 = (void *)objc_msgSend(a4, "emailAddresses");
    self = (ContactInfo *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    v18 = self;
    if (self)
    {
      v19 = *(_QWORD *)v35;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v17);
          v38 = (String *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v20), "value");
          v21 = retstr->var1.m_size;
          if ((_DWORD)v21 == retstr->var1.m_capacity)
          {
            WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,NSString *&>((uint64_t)&retstr->var1, &v38);
          }
          else
          {
            MEMORY[0x19AEABCC8](&retstr->var1.m_buffer[v21]);
            ++retstr->var1.m_size;
          }
          v20 = (ContactInfo *)((char *)v20 + 1);
        }
        while (v18 != v20);
        self = (ContactInfo *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        v18 = self;
      }
      while (self);
    }
LABEL_30:
    v22 = HIDWORD(v7->var2.m_buffer);
    if ((_DWORD)v22)
    {
      v23 = *(unsigned __int8 **)&v7->var1.m_capacity;
      while (1)
      {
        v24 = *v23++;
        if (v24 == 2)
          break;
        if (!--v22)
          return self;
      }
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v25 = (void *)objc_msgSend(a4, "phoneNumbers", 0);
      self = (ContactInfo *)objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      v26 = self;
      if (self)
      {
        v27 = *(_QWORD *)v31;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v31 != v27)
              objc_enumerationMutation(v25);
            v38 = (String *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v28), "value"), "stringValue");
            v29 = retstr->var2.m_size;
            if ((_DWORD)v29 == retstr->var2.m_capacity)
            {
              WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,NSString *&>((uint64_t)&retstr->var2, &v38);
            }
            else
            {
              MEMORY[0x19AEABCC8](&retstr->var2.m_buffer[v29]);
              ++retstr->var2.m_size;
            }
            v28 = (ContactInfo *)((char *)v28 + 1);
          }
          while (v26 != v28);
          self = (ContactInfo *)objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
          v26 = self;
        }
        while (self);
      }
    }
  }
  return self;
}

- (void)dismissWithContacts:(id)a3
{
  void *m_ptr;
  CFTypeRef v5;
  CFTypeRef v6;
  id v8;
  CFTypeRef cf;
  _QWORD v10[5];
  id v11;
  CFTypeRef v12;

  m_ptr = self->_contactPickerViewController.m_ptr;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3321888768;
  v10[2] = __39__WKContactPicker_dismissWithContacts___block_invoke;
  v10[3] = &__block_descriptor_56_e8_32c52_ZTSKZ39__WKContactPicker_dismissWithContacts__E3__9_e5_v8__0l;
  v8 = 0;
  objc_initWeak(&v8, self);
  cf = a3;
  if (a3)
    CFRetain(a3);
  v10[4] = self;
  v11 = 0;
  objc_copyWeak(&v11, &v8);
  v12 = cf;
  if (cf)
    CFRetain(cf);
  objc_msgSend(m_ptr, "dismissViewControllerAnimated:completion:", 0, v10, self);
  v5 = cf;
  cf = 0;
  if (v5)
    CFRelease(v5);
  objc_destroyWeak(&v8);
  v6 = v12;
  v12 = 0;
  if (v6)
    CFRelease(v6);
  objc_destroyWeak(&v11);
}

void __39__WKContactPicker_dismissWithContacts___block_invoke(uint64_t a1)
{
  id WeakRetained;
  const void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "contactPicker:didSelectContacts:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), objc_msgSend(WeakRetained, "_contactsFromJSContacts:", *(_QWORD *)(a1 + 48)));
    CFRelease(v3);
  }
}

- (id)_contactsFromJSContacts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *cf;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[4];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = a3;
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v25 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self isKindOfClass: %@"), objc_opt_class());
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v4)
  {
    v26 = *(_QWORD *)v38;
    v22 = v3;
    do
    {
      v5 = 0;
      v24 = v4;
      do
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(v3);
        v6 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          cf = (void *)objc_msgSend(objc_alloc((Class)off_1ECE6C580()), "init");
          v7 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("name"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            memset(v36, 0, sizeof(v36));
            if (objc_msgSend((id)objc_msgSend(v7, "filteredArrayUsingPredicate:", v25), "countByEnumeratingWithState:objects:count:", v36, v43, 16))
            {
              objc_msgSend(cf, "setGivenName:", **((_QWORD **)&v36[0] + 1));
            }
          }
          v8 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("email"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            v10 = (void *)objc_msgSend(v8, "filteredArrayUsingPredicate:", v25);
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
            if (v11)
            {
              v12 = *(_QWORD *)v33;
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v33 != v12)
                    objc_enumerationMutation(v10);
                  objc_msgSend(v9, "addObject:", objc_msgSend((id)_MergedGlobals_132(), "labeledValueWithLabel:value:", 0, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i)));
                }
                v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
              }
              while (v11);
            }
            objc_msgSend(cf, "setEmailAddresses:", v9);
            v3 = v22;
            v4 = v24;
          }
          v14 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("tel"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v30 = 0u;
            v31 = 0u;
            v28 = 0u;
            v29 = 0u;
            v16 = (void *)objc_msgSend(v14, "filteredArrayUsingPredicate:", v25);
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
            if (v17)
            {
              v18 = *(_QWORD *)v29;
              do
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v29 != v18)
                    objc_enumerationMutation(v16);
                  v20 = objc_msgSend((id)off_1ECE6C578(), "phoneNumberWithStringValue:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
                  objc_msgSend(v15, "addObject:", objc_msgSend((id)_MergedGlobals_132(), "labeledValueWithLabel:value:", 0, v20));
                }
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
              }
              while (v17);
            }
            objc_msgSend(cf, "setPhoneNumbers:", v15);
            v4 = v24;
          }
          objc_msgSend(v23, "addObject:", cf);
          if (cf)
            CFRelease(cf);
        }
        ++v5;
      }
      while (v5 != v4);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v4);
  }
  return v23;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *value;
  unsigned __int8 *m_buffer;

  m_ptr = self->_contactPickerViewController.m_ptr;
  self->_contactPickerViewController.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_contactPickerDelegate.m_ptr;
  self->_contactPickerDelegate.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *, SEL))(*(_QWORD *)value + 8))(value, a2);
  m_buffer = self->_properties.m_buffer;
  if (m_buffer)
  {
    self->_properties.m_buffer = 0;
    self->_properties.m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
  objc_destroyWeak(&self->_delegate.m_weakReference);
  objc_destroyWeak(&self->_webView.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
