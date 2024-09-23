id deviceConnectedCallback(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a1, "deviceConnected:", a4);
}

id deviceRemovedCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a1, "deviceDisconnected:", a4);
}

void sub_100002978(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "deviceWasAdded:", *(_QWORD *)(a1 + 32));

}

id sub_1000029C4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend(a1, "hidReportCallback:result:type:reportID:report:reportLength:", a3, a2, a4, a5, a6, a7);
}

void sub_100002AFC(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "deviceWasRemoved:", *(_QWORD *)(a1 + 32));

}

void sub_100003184(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "hidReportCallback:result:type:reportID:report:reportLength:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void sub_10000321C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100004E7C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006F0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000321C((void *)&_mh_execute_header, a1, a3, "Device not connected, cannot get report.", a5, a6, a7, a8, 0);
}

void sub_100006F40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000321C((void *)&_mh_execute_header, a1, a3, "Device not connected, cannot set report.", a5, a6, a7, a8, 0);
}

void sub_100006F74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004E8C();
  sub_100004E7C((void *)&_mh_execute_header, v0, v1, "Unable to disable gap subtraction with error %@", v2, v3, v4, v5, v6);
  sub_100004E98();
}

void sub_100006FD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004E8C();
  sub_100004E7C((void *)&_mh_execute_header, v0, v1, "Unable to enable frequent sampling with error %@", v2, v3, v4, v5, v6);
  sub_100004E98();
}

void sub_100007034()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004E8C();
  sub_100004E7C((void *)&_mh_execute_header, v0, v1, "Unable to re-enable gap subtraction with error %@", v2, v3, v4, v5, v6);
  sub_100004E98();
}

void sub_100007094()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004E8C();
  sub_100004E7C((void *)&_mh_execute_header, v0, v1, "Unable to re-disable frequent sampling with error %@", v2, v3, v4, v5, v6);
  sub_100004E98();
}

void sub_1000070F4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Turtle disconnected!", v1, 2u);
}

void sub_100007134(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  sub_100004E8C();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Turtle Packet:\n{\n%@\n}", v4, 0xCu);

}

id objc_msgSend__frequentScanPeriodMs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_frequentScanPeriodMs:");
}

id objc_msgSend__getReport_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getReport:error:");
}

id objc_msgSend_acceptedDeviation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptedDeviation");
}

id objc_msgSend_addDevice_forUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDevice:forUsage:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubscriber_forUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubscriber:forUsage:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_brightnesschange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brightnesschange");
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buffer");
}

id objc_msgSend_bufferSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bufferSize");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_bytesToInputPacket_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytesToInputPacket:");
}

id objc_msgSend_cacheDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cacheDevices");
}

id objc_msgSend_capValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capValue");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_configureFrequentBackgroundScan_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureFrequentBackgroundScan:error:");
}

id objc_msgSend_cookie(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cookie");
}

id objc_msgSend_cookie_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cookie_type");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_criticalErrors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "criticalErrors:");
}

id objc_msgSend_csv(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "csv");
}

id objc_msgSend_current(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "current");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteCharactersInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteCharactersInRange:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionDictionary");
}

id objc_msgSend_detectionMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detectionMask");
}

id objc_msgSend_deviceConnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceConnected:");
}

id objc_msgSend_deviceManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceManager");
}

id objc_msgSend_deviceUsageMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceUsageMap");
}

id objc_msgSend_deviceWasAdded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceWasAdded:");
}

id objc_msgSend_deviceWasRemoved_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceWasRemoved:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableGapSubtraction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableGapSubtraction");
}

id objc_msgSend_dk_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_dk_numberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_forceValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceValue");
}

id objc_msgSend_frameNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameNumber");
}

id objc_msgSend_frequentSampling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frequentSampling");
}

id objc_msgSend_gapSubtraction_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gapSubtraction:error:");
}

id objc_msgSend_gapValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gapValue");
}

id objc_msgSend_getReportForDevice_reportType_reportID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getReportForDevice:reportType:reportID:error:");
}

id objc_msgSend_getReportForDevice_reportType_reportID_error_domain_code_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getReportForDevice:reportType:reportID:error:domain:code:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_hidManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hidManager");
}

id objc_msgSend_hidReportCallback_result_type_reportID_report_reportLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hidReportCallback:result:type:reportID:report:reportLength:");
}

id objc_msgSend_humidity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "humidity");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initWithPrimaryUsage_primaryUsagePage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPrimaryUsage:primaryUsagePage:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isDownEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDownEvent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "level");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "location");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mesaFd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mesaFd");
}

id objc_msgSend_mesaFdStuck(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mesaFdStuck");
}

id objc_msgSend_mesaTemperature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mesaTemperature");
}

id objc_msgSend_mesaTemperatureProcessed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mesaTemperatureProcessed");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orientation");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_primaryUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryUsage");
}

id objc_msgSend_primaryUsagePage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryUsagePage");
}

id objc_msgSend_rawchannel0(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawchannel0");
}

id objc_msgSend_rawchannel1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawchannel1");
}

id objc_msgSend_rawchannel2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawchannel2");
}

id objc_msgSend_rawchannel3(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawchannel3");
}

id objc_msgSend_registerDevice_forNotificationsFromDeviceWithUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDevice:forNotificationsFromDeviceWithUsage:");
}

id objc_msgSend_removeDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDevice:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeSample(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSample");
}

id objc_msgSend_removeSubscriber_forUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSubscriber:forUsage:");
}

id objc_msgSend_reportID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportID");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_sampleDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sampleDuration");
}

id objc_msgSend_sendRawData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRawData");
}

id objc_msgSend_sequence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sequence");
}

id objc_msgSend_setAcceptedDeviation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAcceptedDeviation:");
}

id objc_msgSend_setCapValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCapValue:");
}

id objc_msgSend_setCookie_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCookie:");
}

id objc_msgSend_setCookie_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCookie_type:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableGapSubtraction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableGapSubtraction:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setForceValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForceValue:");
}

id objc_msgSend_setFrameNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrameNumber:");
}

id objc_msgSend_setFrequentSampling_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrequentSampling:");
}

id objc_msgSend_setGapValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGapValue:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setIsFull_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsFull:");
}

id objc_msgSend_setMesaFd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMesaFd:");
}

id objc_msgSend_setMesaFdStuck_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMesaFdStuck:");
}

id objc_msgSend_setMesaTemperature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMesaTemperature:");
}

id objc_msgSend_setMesaTemperatureProcessed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMesaTemperatureProcessed:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setReportForDevice_reportType_reportID_buffer_error_domain_code_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReportForDevice:reportType:reportID:buffer:error:domain:code:");
}

id objc_msgSend_setReportID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReportID:");
}

id objc_msgSend_setSampleDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSampleDuration:");
}

id objc_msgSend_setSendRawData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSendRawData:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setStatusCodeSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCodeSet:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setTurtle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTurtle:");
}

id objc_msgSend_setTurtleData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTurtleData:");
}

id objc_msgSend_setTurtleRef_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTurtleRef:");
}

id objc_msgSend_statusCodeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCodeSet");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_subscribersFromUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscribersFromUsage:");
}

id objc_msgSend_temperature(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temperature");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamp");
}

id objc_msgSend_turtle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "turtle");
}

id objc_msgSend_turtleCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "turtleCallback:");
}

id objc_msgSend_turtleData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "turtleData");
}

id objc_msgSend_turtleRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "turtleRef");
}

id objc_msgSend_turtleWasConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "turtleWasConnected");
}

id objc_msgSend_turtleWasDisconnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "turtleWasDisconnected");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedShortValue");
}

id objc_msgSend_usageDeviceMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageDeviceMap");
}

id objc_msgSend_usageFromDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageFromDevice:");
}

id objc_msgSend_usageSubscribers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageSubscribers");
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_voltage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voltage");
}

id objc_msgSend_waitForDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForDuration:");
}

id objc_msgSend_wattage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wattage");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}

id objc_msgSend_x(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "x");
}

id objc_msgSend_y(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "y");
}

id objc_msgSend_z(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "z");
}
