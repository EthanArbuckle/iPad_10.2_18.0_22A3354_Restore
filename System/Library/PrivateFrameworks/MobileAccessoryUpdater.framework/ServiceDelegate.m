@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[5];
  AUServiceAdapter *v18;

  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  objc_msgSend(a4, "setExportedInterface:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25511D8B8));
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_deviceClassAttached_options_withReply_, 1, 0);
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_bootstrapWithOptions_, 0, 0);
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_findFirmwareWithOptions_remote_, 0, 0);
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_downloadFirmwareWithOptions_, 0, 0);
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_prepareFirmwareWithOptions_, 0, 0);
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_applyFirmwareWithOptions_, 0, 0);
  objc_msgSend((id)objc_msgSend(a4, "exportedInterface"), "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_finishWithOptions_, 0, 0);
  objc_msgSend(a4, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25511F318));
  objc_msgSend(a4, "setExportedObject:", +[AUServiceAdapter sharedInstance](AUServiceAdapter, "sharedInstance"));
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3052000000;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  v18 = 0;
  v18 = +[AUServiceAdapter sharedInstance](AUServiceAdapter, "sharedInstance");
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3052000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  v16[5] = a4;
  v11 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke;
  v15[3] = &unk_24DE13F00;
  v15[4] = v16;
  v15[5] = v17;
  objc_msgSend(a4, "setInvalidationHandler:", v15);
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke_2;
  v14[3] = &unk_24DE13F00;
  v14[4] = v16;
  v14[5] = v17;
  objc_msgSend(a4, "setInterruptionHandler:", v14);
  if (-[AUServiceAdapter hasActiveConnection](+[AUServiceAdapter sharedInstance](AUServiceAdapter, "sharedInstance"), "hasActiveConnection")|| !objc_msgSend(a4, "valueForEntitlement:", CFSTR("com.apple.private.accessoryupdater.client")))
  {
    NSLog(CFSTR("%s: Denying incoming connection, connection status=%d"), "-[ServiceDelegate listener:shouldAcceptNewConnection:]", -[AUServiceAdapter hasActiveConnection](+[AUServiceAdapter sharedInstance](AUServiceAdapter, "sharedInstance"), "hasActiveConnection"));
    v12 = 0;
  }
  else
  {
    -[AUServiceAdapter setActiveConnection:](+[AUServiceAdapter sharedInstance](AUServiceAdapter, "sharedInstance"), "setActiveConnection:", a4);
    objc_msgSend(a4, "resume");
    v12 = 1;
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);
  return v12;
}

uint64_t __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSLog(CFSTR("XPC connection invalidated"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setInterruptionHandler:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setActiveConnection:", 0);
}

uint64_t __54__ServiceDelegate_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  NSLog(CFSTR("XPC connection interrupted"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setInterruptionHandler:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setActiveConnection:", 0);
}

@end
