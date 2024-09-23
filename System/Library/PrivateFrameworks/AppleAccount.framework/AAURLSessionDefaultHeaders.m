@implementation AAURLSessionDefaultHeaders

void ___AAURLSessionDefaultHeaders_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[AADeviceInfo currentInfo](AADeviceInfo, "currentInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clientInfoHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(v0, "setObject:forKeyedSubscript:", v2, CFSTR("X-MMe-Client-Info"));
  if (+[AAPreferences isExperimentalModeEnabled](AAPreferences, "isExperimentalModeEnabled"))
  {
    _AALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19EACA000, v3, OS_LOG_TYPE_DEFAULT, "Adding exp mode header", v6, 2u);
    }

    objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("X-iCloud-Experiment-Mode"));
  }
  v4 = objc_msgSend(v0, "copy");
  v5 = (void *)_AAURLSessionDefaultHeaders_defaultHeaders;
  _AAURLSessionDefaultHeaders_defaultHeaders = v4;

}

@end
