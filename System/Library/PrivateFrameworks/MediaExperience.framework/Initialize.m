@implementation Initialize

void __mx_telephonyClient_Initialize_block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (!CoreTelephonyLibraryCore_frameworkLibrary)
    CoreTelephonyLibraryCore_frameworkLibrary = _sl_dlopen();
  if (CoreTelephonyLibraryCore_frameworkLibrary)
  {
    gTelephonyClient = objc_alloc_init(MX_TelephonyClient);
    if (!gTelephonyClient)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

void __mx_geoCountryConfigurationObserver_Initialize_block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (!GeoServicesLibraryCore_frameworkLibrary)
    GeoServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (GeoServicesLibraryCore_frameworkLibrary)
  {
    gGeoCountryConfigurationObserver = objc_alloc_init(MX_GEOCountryConfigurationObserver);
    if (!gGeoCountryConfigurationObserver)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

void __mx_networkObserver_Initialize_block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (!NetworkLibraryCore_frameworkLibrary)
    NetworkLibraryCore_frameworkLibrary = _sl_dlopen();
  if (NetworkLibraryCore_frameworkLibrary)
  {
    gNetworkObserver = objc_alloc_init(MX_NetworkObserver);
    if (!gNetworkObserver)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

@end
