@implementation CAMPreventConnectionHandoverAssertionController

- (CAMPreventConnectionHandoverAssertionController)init
{
  CAMPreventConnectionHandoverAssertionController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *accessQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMPreventConnectionHandoverAssertionController;
  v2 = -[CAMPreventConnectionHandoverAssertionController init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.camera.preventConnectionHandoverAssertionControllerQueue", v3);
    accessQueue = v2->__accessQueue;
    v2->__accessQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CAMPreventConnectionHandoverAssertionController _releaseAssertionIfHeld](self, "_releaseAssertionIfHeld");
  v3.receiver = self;
  v3.super_class = (Class)CAMPreventConnectionHandoverAssertionController;
  -[CAMPreventConnectionHandoverAssertionController dealloc](&v3, sel_dealloc);
}

- (void)requestAssertionIfUnheld
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[CAMPreventConnectionHandoverAssertionController _accessQueue](self, "_accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__CAMPreventConnectionHandoverAssertionController_requestAssertionIfUnheld__block_invoke;
  v4[3] = &unk_1EA329490;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __75__CAMPreventConnectionHandoverAssertionController_requestAssertionIfUnheld__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_requestAssertionIfUnheld");

}

- (void)_requestAssertionIfUnheld
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "CAMPreventConnectionHandoverAssertionController - assertion request did fail with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)releaseAssertionIfHeld
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[CAMPreventConnectionHandoverAssertionController _accessQueue](self, "_accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__CAMPreventConnectionHandoverAssertionController_releaseAssertionIfHeld__block_invoke;
  v4[3] = &unk_1EA329490;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __73__CAMPreventConnectionHandoverAssertionController_releaseAssertionIfHeld__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_releaseAssertionIfHeld");

}

- (void)_releaseAssertionIfHeld
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  -[CAMPreventConnectionHandoverAssertionController _preventConnectionHandoverAssertion](self, "_preventConnectionHandoverAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D51948], "sharedHardwareManagerWithNoUI");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreventConnectionHandoverAssertionController _preventConnectionHandoverAssertion](self, "_preventConnectionHandoverAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "releaseAssertion:", v5);

    -[CAMPreventConnectionHandoverAssertionController _setPreventConnectionHandoverAssertion:](self, "_setPreventConnectionHandoverAssertion:", 0);
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "CAMPreventConnectionHandoverAssertionController - assertion released", v8, 2u);
    }

  }
}

- (NFAssertion)_preventConnectionHandoverAssertion
{
  return self->__preventConnectionHandoverAssertion;
}

- (void)_setPreventConnectionHandoverAssertion:(id)a3
{
  objc_storeStrong((id *)&self->__preventConnectionHandoverAssertion, a3);
}

- (OS_dispatch_queue)_accessQueue
{
  return self->__accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessQueue, 0);
  objc_storeStrong((id *)&self->__preventConnectionHandoverAssertion, 0);
}

@end
