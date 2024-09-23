@implementation NMLogForCategory

void __NMLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;
  os_log_t v24;
  void *v25;
  os_log_t v26;
  void *v27;
  os_log_t v28;
  void *v29;

  v0 = os_log_create("com.apple.nanomusic", "NanoMusicCore");
  v1 = (void *)NMLogForCategory_logObjects;
  NMLogForCategory_logObjects = (uint64_t)v0;

  v2 = os_log_create("com.apple.nanomusic", "NanoMusicCore-Oversize");
  v3 = (void *)qword_253F244B8;
  qword_253F244B8 = (uint64_t)v2;

  v4 = os_log_create("com.apple.nanomusic", "NanoMediaRemote");
  v5 = (void *)qword_253F244C0;
  qword_253F244C0 = (uint64_t)v4;

  v6 = os_log_create("com.apple.nanomusic", "NanoMediaRemote-Oversize");
  v7 = (void *)qword_253F244C8;
  qword_253F244C8 = (uint64_t)v6;

  v8 = os_log_create("com.apple.nanomusic", "NanoAudioControl");
  v9 = (void *)qword_253F244D0;
  qword_253F244D0 = (uint64_t)v8;

  v10 = os_log_create("com.apple.nanomusic", "NanoMusicSync");
  v11 = (void *)qword_253F244D8;
  qword_253F244D8 = (uint64_t)v10;

  v12 = os_log_create("com.apple.nanomusic", "NanoMusicSync-Oversize");
  v13 = (void *)qword_253F244E0;
  qword_253F244E0 = (uint64_t)v12;

  v14 = os_log_create("com.apple.nanomusic", "NanoMediaUI");
  v15 = (void *)qword_253F244E8;
  qword_253F244E8 = (uint64_t)v14;

  v16 = os_log_create("com.apple.nanomusic", "NanoMediaUI-Oversize");
  v17 = (void *)qword_253F244F0;
  qword_253F244F0 = (uint64_t)v16;

  v18 = os_log_create("com.apple.nanomusic", "NanoMediaAPI");
  v19 = (void *)qword_253F244F8;
  qword_253F244F8 = (uint64_t)v18;

  v20 = os_log_create("com.apple.nanomusic", "NanoMediaAPI-Oversize");
  v21 = (void *)qword_253F24500;
  qword_253F24500 = (uint64_t)v20;

  v22 = os_log_create("com.apple.nanomusic", "NanoMediaTool");
  v23 = (void *)qword_253F24508;
  qword_253F24508 = (uint64_t)v22;

  v24 = os_log_create("com.apple.nanomusic", "NanoMediaBridgeUI");
  v25 = (void *)qword_253F24518;
  qword_253F24518 = (uint64_t)v24;

  v26 = os_log_create("com.apple.nanomusic", "NanoMediaBridgeUI-Oversize");
  v27 = (void *)qword_253F24520;
  qword_253F24520 = (uint64_t)v26;

  v28 = os_log_create("com.apple.nanomusic", "NanoMediaAppActivity");
  v29 = (void *)qword_253F24510;
  qword_253F24510 = (uint64_t)v28;

}

@end
