@implementation CSEndpointerFactory

+ (id)endpointerProxy
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  __objc2_class **v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D19260], "isAttentiveSiriEnabled");
  v3 = *MEMORY[0x1E0D18F40];
  v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v7 = 136315138;
      v8 = "+[CSEndpointerFactory endpointerProxy]";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s endpointer running on corespeechd", (uint8_t *)&v7, 0xCu);
    }
    v5 = &off_1E7C21900;
  }
  else
  {
    if (v4)
    {
      v7 = 136315138;
      v8 = "+[CSEndpointerFactory endpointerProxy]";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s endpointer running on assistantd", (uint8_t *)&v7, 0xCu);
    }
    v5 = off_1E7C218F8;
  }
  return objc_alloc_init(*v5);
}

@end
