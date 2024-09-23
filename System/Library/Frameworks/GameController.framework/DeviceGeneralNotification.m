@implementation DeviceGeneralNotification

void __DeviceGeneralNotification_block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "Posting GCRacingWheelDidDisconnectNotification for: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("GCRacingWheelDidDisconnectNotification"), *(_QWORD *)(a1 + 32), 0);

}

@end
