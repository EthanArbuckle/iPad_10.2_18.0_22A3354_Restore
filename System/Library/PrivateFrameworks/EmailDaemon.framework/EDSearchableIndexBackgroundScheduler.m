@implementation EDSearchableIndexBackgroundScheduler

- (EDSearchableIndexBackgroundScheduler)init
{
  return (EDSearchableIndexBackgroundScheduler *)EDSearchableIndexBackgroundScheduler.init()();
}

+ (void)deregister
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  void *v5;
  unsigned int v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *oslog;
  uint64_t v13;

  if (qword_1ED11B4B0 != -1)
    swift_once();
  v0 = sub_1D3124D4C();
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED11B498);
  v1 = sub_1D3124D34();
  v2 = sub_1D3124F38();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D2F2C000, v1, v2, "Deregistering background task", v3, 2u);
    MEMORY[0x1D824BA60](v3, -1, -1);
  }

  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedScheduler);
  v5 = (void *)sub_1D3124DC4();
  v6 = objc_msgSend(v4, sel_deregisterTaskWithIdentifier_, v5);

  oslog = sub_1D3124D34();
  v7 = sub_1D3124F38();
  if (os_log_type_enabled(oslog, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v13 = v9;
    *(_DWORD *)v8 = 136315138;
    if (v6)
      v10 = 0xD000000000000019;
    else
      v10 = 0xD000000000000016;
    if (v6)
      v11 = 0x80000001D3199B20;
    else
      v11 = 0x80000001D3199B00;
    sub_1D3109804(v10, v11, &v13);
    sub_1D3124FB0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1D2F2C000, oslog, v7, "%s background task", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D824BA60](v9, -1, -1);
    MEMORY[0x1D824BA60](v8, -1, -1);

  }
  else
  {

  }
}

@end
