@implementation NTPBNetworkEvent(FCNetworkBehaviorMonitorAdditions)

- (uint64_t)pbNetworkEventType
{
  unsigned int v1;

  v1 = objc_msgSend(a1, "type");
  if (v1 > 0x1A)
    return 0;
  else
    return dword_1A1E82248[v1];
}

- (uint64_t)totalDuration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "dnsDuration");
  v3 = objc_msgSend(a1, "connectDuration") + v2;
  v4 = objc_msgSend(a1, "requestDuration");
  return v3 + v4 + objc_msgSend(a1, "responseDuration");
}

- (uint64_t)endTime
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "startTime");
  return objc_msgSend(a1, "totalDuration") + v2;
}

- (BOOL)isSuccess
{
  if (objc_msgSend(a1, "errorCode"))
    return 0;
  if (objc_msgSend(a1, "httpStatusCode")
    && ((unint64_t)objc_msgSend(a1, "httpStatusCode") < 0xC8
     || (unint64_t)objc_msgSend(a1, "httpStatusCode") >= 0x12C))
  {
    return objc_msgSend(a1, "httpStatusCode") == 304;
  }
  return 1;
}

@end
