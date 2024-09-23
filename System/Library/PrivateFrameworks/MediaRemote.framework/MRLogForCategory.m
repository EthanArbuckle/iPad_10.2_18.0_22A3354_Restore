@implementation MRLogForCategory

void ___MRLogForCategory_block_invoke()
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

  v0 = os_log_create("com.apple.amp.mediaremote", "MediaRemote");
  v1 = (void *)_MRLogForCategory___logs[0];
  _MRLogForCategory___logs[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.amp.mediaremote", "NowPlaying");
  v3 = (void *)qword_1ECF90CE0;
  qword_1ECF90CE0 = (uint64_t)v2;

  v4 = os_log_create("com.apple.amp.mediaremote", "RemoteControl");
  v5 = (void *)qword_1ECF90CE8;
  qword_1ECF90CE8 = (uint64_t)v4;

  v6 = os_log_create("com.apple.amp.mediaremote", "ExternalDevice");
  v7 = (void *)qword_1ECF90CF0;
  qword_1ECF90CF0 = (uint64_t)v6;

  v8 = os_log_create("com.apple.amp.mediaremote", "Television");
  v9 = (void *)qword_1ECF90CF8;
  qword_1ECF90CF8 = (uint64_t)v8;

  v10 = os_log_create("com.apple.amp.mediaremote", "AudioInputPlugin");
  v11 = (void *)qword_1ECF90D00;
  qword_1ECF90D00 = (uint64_t)v10;

  v12 = os_log_create("com.apple.amp.mediaremote", "Assertion");
  v13 = (void *)qword_1ECF90D08;
  qword_1ECF90D08 = (uint64_t)v12;

  v14 = os_log_create("com.apple.amp.mediaremote", "Proximity");
  v15 = (void *)qword_1ECF90D10;
  qword_1ECF90D10 = (uint64_t)v14;

  v16 = os_log_create("com.apple.amp.mediaremote", "XPC");
  v17 = (void *)qword_1ECF90D18;
  qword_1ECF90D18 = (uint64_t)v16;

  v18 = os_log_create("com.apple.amp.mediaremote", "IDS");
  v19 = (void *)qword_1ECF90D20;
  qword_1ECF90D20 = (uint64_t)v18;

  v20 = os_log_create("com.apple.amp.mediaremote", "rr");
  v21 = (void *)qword_1ECF90D28;
  qword_1ECF90D28 = (uint64_t)v20;

  v22 = os_log_create("com.apple.amp.mediaremote", "UI");
  v23 = (void *)qword_1ECF90D30;
  qword_1ECF90D30 = (uint64_t)v22;

  v24 = os_log_create("com.apple.amp.mediaremote", "GroupSession");
  v25 = (void *)qword_1ECF90D38;
  qword_1ECF90D38 = (uint64_t)v24;

  v26 = os_log_create("com.apple.amp.mediaremote", "RouteRecommendation");
  v27 = (void *)qword_1ECF90D40;
  qword_1ECF90D40 = (uint64_t)v26;

  v28 = os_log_create("com.apple.amp.mediaremote", "GroupSessionOversize");
  v29 = (void *)qword_1ECF90D48;
  qword_1ECF90D48 = (uint64_t)v28;

}

@end
