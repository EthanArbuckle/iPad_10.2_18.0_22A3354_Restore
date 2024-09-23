@implementation PKPencilTouchDetection

- (PKPencilTouchDetection)init
{
  PKPencilTouchDetection *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPencilTouchDetection;
  v2 = -[PKPencilTouchDetection init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)PKTouchDetectionUpdateCallback, CFSTR("com.apple.pencilkit.pktouchdetectionupdate"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.pencilkit.pktouchdetectionupdate"), 0);
  v4.receiver = self;
  v4.super_class = (Class)PKPencilTouchDetection;
  -[PKPencilTouchDetection dealloc](&v4, sel_dealloc);
}

- (void)didUpdateWithUserInfo:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.pencilkit.pktouchdetectionupdate.firstUse"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PKPencilTouchDetection delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_msgSend(v4, "integerValue");
      -[PKPencilTouchDetection delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didDetectFirstUseForType:", v7);

    }
  }
  objc_msgSend(v14, "objectForKey:", CFSTR("com.apple.pencilkit.pktouchdetectionupdate.reactivation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PKPencilTouchDetection delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_msgSend(v9, "integerValue");
      -[PKPencilTouchDetection delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "didDetectReactivationForType:", v12);

    }
  }

}

- (void)pencilType:(int64_t)a3 hasRecentlyBeenUsedWithCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a4;
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.pencilkit.pktouchdetection"), 0);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF5ABB00);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v7);
    objc_msgSend(v6, "resume");
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__PKPencilTouchDetection_pencilType_hasRecentlyBeenUsedWithCompletionHandler___block_invoke;
    v15[3] = &unk_1E77797C0;
    v9 = v5;
    v17 = v9;
    v10 = v6;
    v16 = v10;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12[0] = v8;
      v12[1] = 3221225472;
      v12[2] = __78__PKPencilTouchDetection_pencilType_hasRecentlyBeenUsedWithCompletionHandler___block_invoke_61;
      v12[3] = &unk_1E7778790;
      v14 = v9;
      v13 = v10;
      objc_msgSend(v11, "pencilType:hasRecentlyBeenUsedWithCompletionHandler:", a3, v12);

    }
    else
    {
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
      objc_msgSend(v10, "invalidate");
    }

  }
}

void __78__PKPencilTouchDetection_pencilType_hasRecentlyBeenUsedWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_1BE213000, v4, OS_LOG_TYPE_ERROR, "Error creating xpc connection for touch detection: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

uint64_t __78__PKPencilTouchDetection_pencilType_hasRecentlyBeenUsedWithCompletionHandler___block_invoke_61(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (PKPencilTouchDetectionDelegate)delegate
{
  return (PKPencilTouchDetectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
