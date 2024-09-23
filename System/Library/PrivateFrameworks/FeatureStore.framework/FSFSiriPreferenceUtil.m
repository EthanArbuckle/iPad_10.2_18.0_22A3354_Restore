@implementation FSFSiriPreferenceUtil

+ (BOOL)isOptedIn
{
  void *v2;
  unint64_t v3;
  _BOOL4 v4;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "siriDataSharingOptInStatus");

  if (v3 >= 4)
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
    if (v4)
    {
      v6 = 134217984;
      v7 = v3;
      _os_log_impl(&dword_212552000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Unexpected siriPreferenceDataSharingOptInStatus value %ld", (uint8_t *)&v6, 0xCu);
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = (v3 & 0xF) == 1;
  }
  return v4;
}

@end
