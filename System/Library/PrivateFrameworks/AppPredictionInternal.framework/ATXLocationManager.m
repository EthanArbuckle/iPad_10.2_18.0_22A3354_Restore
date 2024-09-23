@implementation ATXLocationManager

void __47__ATXLocationManager_Singleton__sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D80DD0], "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_opt_new();
  v1 = objc_alloc(MEMORY[0x1E0D80DE0]);
  objc_msgSend(MEMORY[0x1E0CF8F70], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithLocationParameters:", v2);

  v4 = objc_alloc(MEMORY[0x1E0D80DC8]);
  objc_msgSend(MEMORY[0x1E0CF8F70], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "initWithGPS:routine:stateStore:now:modeGlobals:", v8, v0, v3, 0, v5);
  v7 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = v6;

}

@end
