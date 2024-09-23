@implementation WKPaymentAuthorizationDelegate

- (void)completeMerchantValidation:(id)a3 error:(id)a4
{
  void (**m_block)(id, id, id);
  void *v8;

  m_block = (void (**)(id, id, id))self->_didRequestMerchantSessionCompletion.m_block;
  self->_didRequestMerchantSessionCompletion.m_block = 0;
  v8 = _Block_copy(0);
  _Block_release(self->_didRequestMerchantSessionCompletion.m_block);
  self->_didRequestMerchantSessionCompletion.m_block = v8;
  _Block_release(0);
  m_block[2](m_block, a3, a4);
  _Block_release(m_block);
}

- (void)completePaymentMethodSelection:(id)a3
{
  id v4;
  void *v5;
  void *m_ptr;
  void *v7;
  void *v8;
  void (**m_block)(id, id);
  void *v10;

  if (a3)
  {
    v4 = a3;
    CFRetain(a3);
    v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "paymentSummaryItems"), "copy");
    m_ptr = self->_summaryItems.m_ptr;
    self->_summaryItems.m_ptr = v5;
    if (m_ptr)
      CFRelease(m_ptr);
    v7 = (void *)objc_msgSend((id)objc_msgSend(v4, "availableShippingMethods"), "copy");
    v8 = self->_availableShippingMethods.m_ptr;
    self->_availableShippingMethods.m_ptr = v7;
    if (v8)
      CFRelease(v8);
  }
  else
  {
    v4 = (id)objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKPaymentAuthorizationDelegate *, SEL))*MEMORY[0x1E0DCE288])(self, a2)), "initWithPaymentSummaryItems:", self->_summaryItems.m_ptr);
    objc_msgSend(v4, "setAvailableShippingMethods:", self->_availableShippingMethods.m_ptr);
  }
  m_block = (void (**)(id, id))self->_didSelectPaymentMethodCompletion.m_block;
  self->_didSelectPaymentMethodCompletion.m_block = 0;
  v10 = _Block_copy(0);
  _Block_release(self->_didSelectPaymentMethodCompletion.m_block);
  self->_didSelectPaymentMethodCompletion.m_block = v10;
  _Block_release(0);
  m_block[2](m_block, v4);
  _Block_release(m_block);
  if (v4)
    CFRelease(v4);
}

- (void)completePaymentSession:(int64_t)a3 errors:(id)a4
{
  const void *v5;
  void (**m_block)(id, const void *);
  void *v7;

  v5 = (const void *)objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKPaymentAuthorizationDelegate *, SEL))*MEMORY[0x1E0DCE1D0])(self, a2)), "initWithStatus:errors:", a3, a4);
  m_block = (void (**)(id, const void *))self->_didAuthorizePaymentCompletion.m_block;
  self->_didAuthorizePaymentCompletion.m_block = 0;
  v7 = _Block_copy(0);
  _Block_release(self->_didAuthorizePaymentCompletion.m_block);
  self->_didAuthorizePaymentCompletion.m_block = v7;
  _Block_release(0);
  m_block[2](m_block, v5);
  _Block_release(m_block);
  if (v5)
    CFRelease(v5);
}

- (void)completePaymentSession:(int64_t)a3 errors:(id)a4 orderDetails:(id)a5
{
  void *v7;
  void (**m_block)(id, void *);
  void *v9;

  v7 = (void *)objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKPaymentAuthorizationDelegate *, SEL))*MEMORY[0x1E0DCE1D0])(self, a2)), "initWithStatus:errors:", a3, a4);
  objc_msgSend(v7, "setOrderDetails:", a5);
  m_block = (void (**)(id, void *))self->_didAuthorizePaymentCompletion.m_block;
  self->_didAuthorizePaymentCompletion.m_block = 0;
  v9 = _Block_copy(0);
  _Block_release(self->_didAuthorizePaymentCompletion.m_block);
  self->_didAuthorizePaymentCompletion.m_block = v9;
  _Block_release(0);
  m_block[2](m_block, v7);
  _Block_release(m_block);
  if (v7)
    CFRelease(v7);
}

- (void)completeShippingContactSelection:(id)a3
{
  id v4;
  void *v5;
  void *m_ptr;
  void *v7;
  void *v8;
  void (**m_block)(id, id);
  void *v10;

  if (a3)
  {
    v4 = a3;
    CFRetain(a3);
    v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "paymentSummaryItems"), "copy");
    m_ptr = self->_summaryItems.m_ptr;
    self->_summaryItems.m_ptr = v5;
    if (m_ptr)
      CFRelease(m_ptr);
    v7 = (void *)objc_msgSend((id)objc_msgSend(v4, "availableShippingMethods"), "copy");
    v8 = self->_availableShippingMethods.m_ptr;
    self->_availableShippingMethods.m_ptr = v7;
    if (v8)
      CFRelease(v8);
  }
  else
  {
    v4 = (id)objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKPaymentAuthorizationDelegate *, SEL))*MEMORY[0x1E0DCE2D0])(self, a2)), "initWithPaymentSummaryItems:", self->_summaryItems.m_ptr);
    objc_msgSend(v4, "setAvailableShippingMethods:", self->_availableShippingMethods.m_ptr);
  }
  m_block = (void (**)(id, id))self->_didSelectShippingContactCompletion.m_block;
  self->_didSelectShippingContactCompletion.m_block = 0;
  v10 = _Block_copy(0);
  _Block_release(self->_didSelectShippingContactCompletion.m_block);
  self->_didSelectShippingContactCompletion.m_block = v10;
  _Block_release(0);
  m_block[2](m_block, v4);
  _Block_release(m_block);
  if (v4)
    CFRelease(v4);
}

- (void)completeShippingMethodSelection:(id)a3
{
  id v4;
  void *v5;
  void *m_ptr;
  void *v7;
  void *v8;
  void (**m_block)(id, id);
  void *v10;

  if (a3)
  {
    v4 = a3;
    CFRetain(a3);
    v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "paymentSummaryItems"), "copy");
    m_ptr = self->_summaryItems.m_ptr;
    self->_summaryItems.m_ptr = v5;
    if (m_ptr)
      CFRelease(m_ptr);
    v7 = (void *)objc_msgSend((id)objc_msgSend(v4, "availableShippingMethods"), "copy");
    v8 = self->_availableShippingMethods.m_ptr;
    self->_availableShippingMethods.m_ptr = v7;
    if (v8)
      CFRelease(v8);
  }
  else
  {
    v4 = (id)objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKPaymentAuthorizationDelegate *, SEL))*MEMORY[0x1E0DCE2C8])(self, a2)), "initWithPaymentSummaryItems:", self->_summaryItems.m_ptr);
    objc_msgSend(v4, "setAvailableShippingMethods:", self->_availableShippingMethods.m_ptr);
  }
  m_block = (void (**)(id, id))self->_didSelectShippingMethodCompletion.m_block;
  self->_didSelectShippingMethodCompletion.m_block = 0;
  v10 = _Block_copy(0);
  _Block_release(self->_didSelectShippingMethodCompletion.m_block);
  self->_didSelectShippingMethodCompletion.m_block = v10;
  _Block_release(0);
  m_block[2](m_block, v4);
  _Block_release(m_block);
  if (v4)
    CFRelease(v4);
}

- (void)completeCouponCodeChange:(id)a3
{
  id v4;
  void *v5;
  void *m_ptr;
  void *v7;
  void *v8;
  void (**m_block)(id, id);
  void *v10;

  if (a3)
  {
    v4 = a3;
    CFRetain(a3);
    v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "paymentSummaryItems"), "copy");
    m_ptr = self->_summaryItems.m_ptr;
    self->_summaryItems.m_ptr = v5;
    if (m_ptr)
      CFRelease(m_ptr);
    v7 = (void *)objc_msgSend((id)objc_msgSend(v4, "availableShippingMethods"), "copy");
    v8 = self->_availableShippingMethods.m_ptr;
    self->_availableShippingMethods.m_ptr = v7;
    if (v8)
      CFRelease(v8);
  }
  else
  {
    v4 = (id)objc_msgSend(objc_alloc((Class)((uint64_t (*)(WKPaymentAuthorizationDelegate *, SEL))*MEMORY[0x1E0DCE238])(self, a2)), "initWithPaymentSummaryItems:", self->_summaryItems.m_ptr);
    objc_msgSend(v4, "setAvailableShippingMethods:", self->_availableShippingMethods.m_ptr);
  }
  m_block = (void (**)(id, id))self->_didChangeCouponCodeCompletion.m_block;
  self->_didChangeCouponCodeCompletion.m_block = 0;
  v10 = _Block_copy(0);
  _Block_release(self->_didChangeCouponCodeCompletion.m_block);
  self->_didChangeCouponCodeCompletion.m_block = v10;
  _Block_release(0);
  m_block[2](m_block, v4);
  _Block_release(m_block);
  if (v4)
    CFRelease(v4);
}

- (void)invalidate
{
  if (self->_didAuthorizePaymentCompletion.m_block)
    -[WKPaymentAuthorizationDelegate completePaymentSession:errors:](self, "completePaymentSession:errors:", 1, MEMORY[0x1E0C9AA60]);
}

- (void).cxx_destruct
{
  void *v3;
  void *m_ptr;
  void *v5;
  void *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;

  _Block_release(self->_didChangeCouponCodeCompletion.m_block);
  _Block_release(self->_didSelectShippingMethodCompletion.m_block);
  _Block_release(self->_didSelectShippingContactCompletion.m_block);
  _Block_release(self->_didSelectPaymentMethodCompletion.m_block);
  _Block_release(self->_didRequestMerchantSessionCompletion.m_block);
  _Block_release(self->_didAuthorizePaymentCompletion.m_block);
  m_ptr = self->_sessionError.m_ptr;
  self->_sessionError.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v5 = self->_availableShippingMethods.m_ptr;
  self->_availableShippingMethods.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_summaryItems.m_ptr;
  self->_summaryItems.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = (unsigned int *)self->_presenter.m_impl.m_ptr;
  self->_presenter.m_impl.m_ptr = 0;
  if (v7)
  {
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      atomic_store(1u, v7);
      WTF::fastFree((WTF *)v7, v3);
    }
  }
  v10 = self->_request.m_ptr;
  self->_request.m_ptr = 0;
  if (v10)
    CFRelease(v10);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (id)_initWithRequest:(id)a3 presenter:(void *)a4
{
  void *v6;
  WKPaymentAuthorizationDelegate *v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *m_ptr;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)WKPaymentAuthorizationDelegate;
  v7 = -[WKPaymentAuthorizationDelegate init](&v24, sel_init);
  if (!v7)
    return v7;
  v8 = *((_QWORD *)a4 + 1);
  if (v8)
    goto LABEL_29;
  v8 = WTF::fastCompactMalloc((WTF *)0x10);
  *(_DWORD *)v8 = 1;
  *(_QWORD *)(v8 + 8) = a4;
  v9 = (unsigned int *)*((_QWORD *)a4 + 1);
  *((_QWORD *)a4 + 1) = v8;
  if (!v9)
    goto LABEL_29;
  do
  {
    v10 = __ldaxr(v9);
    v11 = v10 - 1;
  }
  while (__stlxr(v11, v9));
  if (!v11)
  {
    atomic_store(1u, v9);
    WTF::fastFree((WTF *)v9, v6);
  }
  v8 = *((_QWORD *)a4 + 1);
  if (v8)
  {
LABEL_29:
    do
      v12 = __ldaxr((unsigned int *)v8);
    while (__stlxr(v12 + 1, (unsigned int *)v8));
  }
  m_ptr = (unsigned int *)v7->_presenter.m_impl.m_ptr;
  v7->_presenter.m_impl.m_ptr = (DefaultWeakPtrImpl *)v8;
  if (m_ptr)
  {
    do
    {
      v14 = __ldaxr(m_ptr);
      v15 = v14 - 1;
    }
    while (__stlxr(v15, m_ptr));
    if (!v15)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v6);
      if (!a3)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  if (a3)
LABEL_13:
    CFRetain(a3);
LABEL_14:
  v16 = v7->_request.m_ptr;
  v7->_request.m_ptr = a3;
  if (v16)
    CFRelease(v16);
  v17 = (void *)objc_msgSend(a3, "availableShippingMethods");
  v18 = v17;
  if (v17)
    CFRetain(v17);
  v19 = v7->_availableShippingMethods.m_ptr;
  v7->_availableShippingMethods.m_ptr = v18;
  if (v19)
    CFRelease(v19);
  v20 = (void *)objc_msgSend(a3, "paymentSummaryItems");
  v21 = v20;
  if (v20)
    CFRetain(v20);
  v22 = v7->_summaryItems.m_ptr;
  v7->_summaryItems.m_ptr = v21;
  if (v22)
    CFRelease(v22);
  return v7;
}

- (void)_didAuthorizePayment:(id)a3 completion:(id)a4
{
  void *v6;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[16];

  v6 = _Block_copy(a4);
  _Block_release(self->_didAuthorizePaymentCompletion.m_block);
  self->_didAuthorizePaymentCompletion.m_block = v6;
  _Block_release(0);
  m_ptr = self->_presenter.m_impl.m_ptr;
  if (m_ptr && (v8 = *((_QWORD *)m_ptr + 1)) != 0)
  {
    v9 = *(_QWORD *)(v8 + 16);
    if (a3)
      CFRetain(a3);
    WebCore::Payment::Payment();
    (*(void (**)(uint64_t, uint64_t, _BYTE *))(*(_QWORD *)v9 + 16))(v9, v8, v10);
    WebCore::Payment::~Payment((WebCore::Payment *)v10);
    if (a3)
      CFRelease(a3);
  }
  else
  {
    -[WKPaymentAuthorizationDelegate completePaymentSession:errors:](self, "completePaymentSession:errors:", 1, MEMORY[0x1E0C9AA60]);
  }
}

- (void)_didFinish
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v3;
  uint64_t v4;
  CFTypeRef v5;
  CFTypeRef v6;
  CFTypeRef cf;

  m_ptr = self->_presenter.m_impl.m_ptr;
  if (m_ptr)
  {
    v3 = *((_QWORD *)m_ptr + 1);
    if (v3)
    {
      v4 = *(_QWORD *)(v3 + 16);
      v6 = self->_sessionError.m_ptr;
      self->_sessionError.m_ptr = 0;
      WebCore::PaymentSessionError::PaymentSessionError();
      (*(void (**)(uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)v4 + 24))(v4, v3, &cf);
      v5 = cf;
      cf = 0;
      if (v5)
        CFRelease(v5);
      if (v6)
        CFRelease(v6);
    }
  }
}

- (void)_didRequestMerchantSession:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = _Block_copy(a3);
  _Block_release(self->_didRequestMerchantSessionCompletion.m_block);
  self->_didRequestMerchantSessionCompletion.m_block = v4;
  _Block_release(0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__WKPaymentAuthorizationDelegate_Protected___didRequestMerchantSession___block_invoke;
  v5[3] = &unk_1E34B68E8;
  v5[4] = self;
  -[WKPaymentAuthorizationDelegate _getPaymentServicesMerchantURL:](self, "_getPaymentServicesMerchantURL:", v5);
}

uint64_t __72__WKPaymentAuthorizationDelegate_Protected___didRequestMerchantSession___block_invoke(WTF::RunLoop *a1, const void *a2)
{
  const void *v4;
  _QWORD *v5;
  uint64_t result;
  _QWORD *v7;

  WTF::RunLoop::main(a1);
  v4 = (const void *)*((_QWORD *)a1 + 4);
  if (v4)
    CFRetain(v4);
  if (a2)
    CFRetain(a2);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v5 = &off_1E34B6B08;
  v5[1] = v4;
  v5[2] = v4;
  v5[3] = a2;
  v7 = v5;
  WTF::RunLoop::dispatch();
  result = (uint64_t)v7;
  if (v7)
    return (*(uint64_t (**)(_QWORD *))(*v7 + 8))(v7);
  return result;
}

- (void)_didSelectPaymentMethod:(id)a3 completion:(id)a4
{
  void *v6;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[16];

  v6 = _Block_copy(a4);
  _Block_release(self->_didSelectPaymentMethodCompletion.m_block);
  self->_didSelectPaymentMethodCompletion.m_block = v6;
  _Block_release(0);
  m_ptr = self->_presenter.m_impl.m_ptr;
  if (m_ptr && (v8 = *((_QWORD *)m_ptr + 1)) != 0)
  {
    v9 = *(_QWORD *)(v8 + 16);
    if (a3)
      CFRetain(a3);
    WebCore::PaymentMethod::PaymentMethod();
    (*(void (**)(uint64_t, uint64_t, _BYTE *))(*(_QWORD *)v9 + 32))(v9, v8, v10);
    WebCore::PaymentMethod::~PaymentMethod((WebCore::PaymentMethod *)v10);
    if (a3)
      CFRelease(a3);
  }
  else
  {
    -[WKPaymentAuthorizationDelegate completePaymentMethodSelection:](self, "completePaymentMethodSelection:", 0);
  }
}

- (void)_didSelectShippingContact:(id)a3 completion:(id)a4
{
  void *v6;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[16];

  v6 = _Block_copy(a4);
  _Block_release(self->_didSelectShippingContactCompletion.m_block);
  self->_didSelectShippingContactCompletion.m_block = v6;
  _Block_release(0);
  m_ptr = self->_presenter.m_impl.m_ptr;
  if (m_ptr && (v8 = *((_QWORD *)m_ptr + 1)) != 0)
  {
    v9 = *(_QWORD *)(v8 + 16);
    if (a3)
      CFRetain(a3);
    WebCore::PaymentContact::PaymentContact();
    (*(void (**)(uint64_t, uint64_t, _BYTE *))(*(_QWORD *)v9 + 40))(v9, v8, v10);
    WebCore::PaymentContact::~PaymentContact((WebCore::PaymentContact *)v10);
    if (a3)
      CFRelease(a3);
  }
  else
  {
    -[WKPaymentAuthorizationDelegate completeShippingContactSelection:](self, "completeShippingContactSelection:", 0);
  }
}

- (void)_didSelectShippingMethod:(id)a3 completion:(id)a4
{
  void *v6;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22[2];
  WTF::StringImpl *v23[2];
  int v24;
  char v25;
  int v26;
  char v27;
  int v28;
  char v29;
  int v30;
  char v31;
  int v32;
  char v33;
  int v34;
  char v35;
  int v36;
  char v37;
  int v38;
  char v39;
  char v40;
  char v41;
  WTF::StringImpl *v42;

  v6 = _Block_copy(a4);
  _Block_release(self->_didSelectShippingMethodCompletion.m_block);
  self->_didSelectShippingMethodCompletion.m_block = v6;
  _Block_release(0);
  m_ptr = self->_presenter.m_impl.m_ptr;
  if (m_ptr && (v8 = *((_QWORD *)m_ptr + 1)) != 0)
  {
    v9 = *(_QWORD *)(v8 + 16);
    v40 = 0;
    v41 = 0;
    LOBYTE(v24) = 0;
    MEMORY[0x19AEABCC8](&v42, objc_msgSend((id)objc_msgSend(a3, "amount"), "stringValue"));
    v23[0] = v42;
    MEMORY[0x19AEABCC8](&v42, objc_msgSend(a3, "detail"));
    v22[1] = v42;
    MEMORY[0x19AEABCC8](&v42, objc_msgSend(a3, "identifier"));
    v23[1] = v42;
    MEMORY[0x19AEABCC8](&v42, objc_msgSend(a3, "label", v42));
    v22[0] = v42;
    if (objc_msgSend(a3, "dateComponentsRange"))
    {
      v10 = (void *)objc_msgSend(a3, "dateComponentsRange");
      v11 = (void *)objc_msgSend(v10, "startDateComponents");
      v12 = objc_msgSend(v11, "year");
      v13 = objc_msgSend(v11, "month");
      v14 = objc_msgSend(v11, "day");
      v15 = objc_msgSend(v11, "hour");
      v16 = (void *)objc_msgSend(v10, "endDateComponents");
      v24 = v12;
      v25 = 1;
      v26 = v13;
      v27 = 1;
      v28 = v14;
      v29 = 1;
      v30 = v15;
      v31 = 1;
      v32 = objc_msgSend(v16, "year");
      v33 = 1;
      v34 = objc_msgSend(v16, "month");
      v35 = 1;
      v36 = objc_msgSend(v16, "day");
      v37 = 1;
      v38 = objc_msgSend(v16, "hour");
      v39 = 1;
      v40 = 1;
    }
    v41 = 1;
    (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **))(*(_QWORD *)v9 + 48))(v9, v8, v22);
    v18 = v23[1];
    v23[1] = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2)
        WTF::StringImpl::destroy(v18, v17);
      else
        *(_DWORD *)v18 -= 2;
    }
    v19 = v23[0];
    v23[0] = 0;
    if (v19)
    {
      if (*(_DWORD *)v19 == 2)
        WTF::StringImpl::destroy(v19, v17);
      else
        *(_DWORD *)v19 -= 2;
    }
    v20 = v22[1];
    v22[1] = 0;
    if (v20)
    {
      if (*(_DWORD *)v20 == 2)
        WTF::StringImpl::destroy(v20, v17);
      else
        *(_DWORD *)v20 -= 2;
    }
    v21 = v22[0];
    v22[0] = 0;
    if (v21)
    {
      if (*(_DWORD *)v21 == 2)
        WTF::StringImpl::destroy(v21, v17);
      else
        *(_DWORD *)v21 -= 2;
    }
  }
  else
  {
    -[WKPaymentAuthorizationDelegate completeShippingMethodSelection:](self, "completeShippingMethodSelection:", 0);
  }
}

- (void)_didChangeCouponCode:(id)a3 completion:(id)a4
{
  void *v6;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;

  v6 = _Block_copy(a4);
  _Block_release(self->_didChangeCouponCodeCompletion.m_block);
  self->_didChangeCouponCodeCompletion.m_block = v6;
  _Block_release(0);
  m_ptr = self->_presenter.m_impl.m_ptr;
  if (m_ptr && (v8 = *((_QWORD *)m_ptr + 1)) != 0)
  {
    v9 = *(_QWORD *)(v8 + 16);
    MEMORY[0x19AEABCC8](&v12, a3);
    (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **))(*(_QWORD *)v9 + 56))(v9, v8, &v12);
    v11 = v12;
    v12 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
        WTF::StringImpl::destroy(v11, v10);
      else
        *(_DWORD *)v11 -= 2;
    }
  }
  else
  {
    -[WKPaymentAuthorizationDelegate completeCouponCodeChange:](self, "completeCouponCodeChange:", 0);
  }
}

- (void)_getPaymentServicesMerchantURL:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)_willFinishWithError:(id)a3
{
  void *v5;
  void *m_ptr;

  v5 = (void *)objc_msgSend(a3, "domain");
  if (objc_msgSend(v5, "isEqualToString:", PAL::get_PassKitCore_PKPassKitErrorDomain((PAL *)v5)))
  {
    if (a3)
      CFRetain(a3);
    m_ptr = self->_sessionError.m_ptr;
    self->_sessionError.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
  }
}

@end
