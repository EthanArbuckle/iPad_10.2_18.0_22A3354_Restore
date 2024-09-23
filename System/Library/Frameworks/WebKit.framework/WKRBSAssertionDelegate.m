@implementation WKRBSAssertionDelegate

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKRBSAssertionDelegate;
  -[WKRBSAssertionDelegate dealloc](&v3, sel_dealloc);
}

- (void)assertionWillInvalidate:(id)a3
{
  NSObject *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  id location;
  _QWORD buf[4];

  buf[3] = *MEMORY[0x1E0C80C00];
  v4 = qword_1ECE71640;
  v5 = os_log_type_enabled((os_log_t)qword_1ECE71640, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    LODWORD(buf[0]) = 134217984;
    *(_QWORD *)((char *)buf + 4) = self;
    _os_log_impl(&dword_196BCC000, v4, OS_LOG_TYPE_DEFAULT, "%p - WKRBSAssertionDelegate: assertionWillInvalidate", (uint8_t *)buf, 0xCu);
  }
  WTF::RunLoop::main((WTF::RunLoop *)v5);
  location = 0;
  objc_initWeak(&location, self);
  v6 = WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v6 = off_1E34C99F0;
  *(_QWORD *)(v6 + 8) = 0;
  objc_moveWeak((id *)(v6 + 8), &location);
  buf[0] = v6;
  WTF::RunLoop::dispatch();
  v7 = buf[0];
  buf[0] = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  objc_destroyWeak(&location);
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  NSObject *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  id location;
  _BYTE buf[12];
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = qword_1ECE71640;
  v7 = os_log_type_enabled((os_log_t)qword_1ECE71640, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = self;
    v12 = 2114;
    v13 = a4;
    _os_log_impl(&dword_196BCC000, v6, OS_LOG_TYPE_DEFAULT, "%p - WKRBSAssertionDelegate: assertion was invalidated, error: %{public}@", buf, 0x16u);
  }
  WTF::RunLoop::main((WTF::RunLoop *)v7);
  location = 0;
  objc_initWeak(&location, self);
  v8 = WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v8 = off_1E34C9A18;
  *(_QWORD *)(v8 + 8) = 0;
  objc_moveWeak((id *)(v8 + 8), &location);
  *(_QWORD *)buf = v8;
  WTF::RunLoop::dispatch();
  v9 = *(_QWORD *)buf;
  *(_QWORD *)buf = 0;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  objc_destroyWeak(&location);
}

- (id)prepareForInvalidationCallback
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setPrepareForInvalidationCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)invalidationCallback
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setInvalidationCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (uint64_t)assertionWillInvalidate:(uint64_t)a1
{
  *(_QWORD *)a1 = off_1E34C99F0;
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (uint64_t)assertionWillInvalidate:(id *)a1
{
  void *v2;

  *a1 = off_1E34C99F0;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)assertionWillInvalidate:(uint64_t)a1
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    if (objc_msgSend(WeakRetained, "prepareForInvalidationCallback"))
      (*(void (**)(void))(objc_msgSend(v2, "prepareForInvalidationCallback") + 16))();
    CFRelease(v2);
  }
}

- (uint64_t)assertion:(uint64_t)a1 didInvalidateWithError:
{
  *(_QWORD *)a1 = off_1E34C9A18;
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (uint64_t)assertion:(id *)a1 didInvalidateWithError:
{
  void *v2;

  *a1 = off_1E34C9A18;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)assertion:(uint64_t)a1 didInvalidateWithError:
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    if (objc_msgSend(WeakRetained, "invalidationCallback"))
      (*(void (**)(void))(objc_msgSend(v2, "invalidationCallback") + 16))();
    CFRelease(v2);
  }
}

@end
