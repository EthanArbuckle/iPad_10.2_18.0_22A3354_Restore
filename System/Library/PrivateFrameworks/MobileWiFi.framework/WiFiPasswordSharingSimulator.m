@implementation WiFiPasswordSharingSimulator

- (WiFiPasswordSharingSimulator)init
{
  WiFiPasswordSharingSimulator *v2;
  objc_class *v3;
  SFPasswordSharingService *v4;
  objc_super v6;
  _QWORD v7[5];
  __int128 v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)WiFiPasswordSharingSimulator;
  v2 = -[WiFiPasswordSharingSimulator init](&v6, sel_init);
  if (v2)
  {
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("mobilewifitool.wifi-password-sharing", 0);
    if (!SharingLibraryCore_frameworkLibrary)
    {
      v8 = xmmword_1E713C730;
      v9 = 0;
      SharingLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (SharingLibraryCore_frameworkLibrary)
    {
      *(_QWORD *)&v8 = 0;
      *((_QWORD *)&v8 + 1) = &v8;
      v9 = 0x3052000000;
      v10 = __Block_byref_object_copy__0;
      v11 = __Block_byref_object_dispose__0;
      v3 = (objc_class *)getSFPasswordSharingServiceClass_softClass;
      v12 = getSFPasswordSharingServiceClass_softClass;
      if (!getSFPasswordSharingServiceClass_softClass)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __getSFPasswordSharingServiceClass_block_invoke;
        v7[3] = &unk_1E713B950;
        v7[4] = &v8;
        __getSFPasswordSharingServiceClass_block_invoke((uint64_t)v7);
        v3 = *(objc_class **)(*((_QWORD *)&v8 + 1) + 40);
      }
      _Block_object_dispose(&v8, 8);
      v4 = (SFPasswordSharingService *)objc_alloc_init(v3);
      v2->_service = v4;
      -[SFPasswordSharingService setDelegate:](v4, "setDelegate:", v2);
      -[SFPasswordSharingService setDispatchQueue:](v2->_service, "setDispatchQueue:", v2->_queue);
    }
  }
  return v2;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;

  -[SFPasswordSharingService invalidate](self->_service, "invalidate");
  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  v4.receiver = self;
  v4.super_class = (Class)WiFiPasswordSharingSimulator;
  -[WiFiPasswordSharingSimulator dealloc](&v4, sel_dealloc);
}

- (void)runWithSSID:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WiFiPasswordSharingSimulator_runWithSSID_reply___block_invoke;
  block[3] = &unk_1E713C6E8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

uint64_t __50__WiFiPasswordSharingSimulator_runWithSSID_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (!SharingLibraryCore_frameworkLibrary)
    SharingLibraryCore_frameworkLibrary = _sl_dlopen();
  if (SharingLibraryCore_frameworkLibrary)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setNetworkName:", *(_QWORD *)(a1 + 40));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(*(id *)(a1 + 48), "copy");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "activate");
  }
  else
  {
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  }
  return result;
}

- (void)service:(id)a3 receivedNetworkInfo:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WiFiPasswordSharingSimulator_service_receivedNetworkInfo___block_invoke;
  block[3] = &unk_1E713C710;
  block[4] = a3;
  block[5] = a4;
  block[6] = self;
  dispatch_async(queue, block);
}

uint64_t __60__WiFiPasswordSharingSimulator_service_receivedNetworkInfo___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  result = printf("Received '%s' [ch=%ld psk=%s]\n", (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "networkName"), "UTF8String"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "channel"), "integerValue"), (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "psk"), "UTF8String"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24);
  if (v3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(*(id *)(a1 + 40), "channel"), objc_msgSend(*(id *)(a1 + 40), "psk"));
  return result;
}

- (BOOL)service:(id)a3 shouldPromptForNetwork:(id)a4
{
  return 0;
}

@end
