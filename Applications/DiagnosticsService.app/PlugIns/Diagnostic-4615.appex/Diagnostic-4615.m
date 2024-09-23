void sub_1000016C0(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100008A18;
  qword_100008A18 = (uint64_t)v1;

}

void sub_1000020D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000020E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100002108(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000027E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002120();
  sub_100002108((void *)&_mh_execute_header, v0, v1, "Class %s not found", v2, v3, v4, v5, v6);
  sub_100002118();
}

void sub_100002844()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002120();
  sub_100002108((void *)&_mh_execute_header, v0, v1, "IO service for %s not found", v2, v3, v4, v5, v6);
  sub_100002118();
}

void sub_1000028A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002120();
  sub_100002108((void *)&_mh_execute_header, v0, v1, "ioreg entry %@ does not exist", v2, v3, v4, v5, v6);
  sub_100002118();
}

void sub_100002904()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000020FC();
  sub_1000020E4((void *)&_mh_execute_header, v0, v1, "   Got CFData", v2, v3, v4, v5, v6);
  sub_1000020F4();
}

void sub_100002930()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000020FC();
  sub_1000020E4((void *)&_mh_execute_header, v0, v1, "   Got CFString", v2, v3, v4, v5, v6);
  sub_1000020F4();
}

void sub_10000295C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000020FC();
  sub_1000020D4((void *)&_mh_execute_header, v0, v1, "Unsupported type from ioreg", v2, v3, v4, v5, v6);
  sub_1000020F4();
}

void sub_100002988()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000020FC();
  sub_1000020D4((void *)&_mh_execute_header, v0, v1, "Class/name not found", v2, v3, v4, v5, v6);
  sub_1000020F4();
}

void sub_1000029B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000020FC();
  sub_1000020D4((void *)&_mh_execute_header, v0, v1, "IO service not found", v2, v3, v4, v5, v6);
  sub_1000020F4();
}

void sub_1000029E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000020FC();
  sub_1000020D4((void *)&_mh_execute_header, v0, v1, "ioreg entry does not exist", v2, v3, v4, v5, v6);
  sub_1000020F4();
}

void sub_100002A0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000020FC();
  sub_1000020E4((void *)&_mh_execute_header, v0, v1, "   Got Boolean", v2, v3, v4, v5, v6);
  sub_1000020F4();
}

void sub_100002A38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000020FC();
  sub_1000020E4((void *)&_mh_execute_header, v0, v1, "   Got Float", v2, v3, v4, v5, v6);
  sub_1000020F4();
}

void sub_100002A64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002120();
  sub_100002108((void *)&_mh_execute_header, v0, v1, "[ERROR] Could not find the service matched by: %@", v2, v3, v4, v5, v6);
  sub_100002118();
}

void sub_100002AC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000020FC();
  sub_1000020D4((void *)&_mh_execute_header, v0, v1, "[ERROR] Could not create properties", v2, v3, v4, v5, v6);
  sub_1000020F4();
}

void sub_100002AF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000020F4();
}

void sub_100002B20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000020D4((void *)&_mh_execute_header, a1, a3, "Base64Encode failed", a5, a6, a7, a8, 0);
  sub_1000020F4();
}

void sub_100002B50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000020D4((void *)&_mh_execute_header, a1, a3, "MFAAComponentAuthCreateSignature() failed to response", a5, a6, a7, a8, 0);
  sub_1000020F4();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__applyChallengeParameter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyChallengeParameter:");
}

id objc_msgSend__applyKeyIndexParameter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applyKeyIndexParameter:");
}

id objc_msgSend_base64EncodeData_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodeData:result:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_challenge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "challenge");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dk_numberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_dk_stringFromRequiredKey_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromRequiredKey:maxLength:failed:");
}

id objc_msgSend_getIOService_optionalKey_optionalClassValidator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIOService:optionalKey:optionalClassValidator:");
}

id objc_msgSend_getMatchingDict_property_optionalKey_optionalClassValidator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMatchingDict:property:optionalKey:optionalClassValidator:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_keyIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyIndex");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_setChallenge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChallenge:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setKeyIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyIndex:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}
