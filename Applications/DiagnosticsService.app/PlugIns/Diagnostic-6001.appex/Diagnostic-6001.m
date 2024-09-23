id sub_100003800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;

  v4 = *(void **)(a1 + 32);
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "result"));
    v6 = v5;
    v7 = &off_100004160;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readDeviceAnglesFrom:", a2));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
    objc_msgSend(v9, "setData:", v8);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
    v6 = v5;
    v7 = &off_100004178;
  }
  objc_msgSend(v5, "setStatusCode:", v7);

  return objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attitude");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_isDeviceMotionAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceMotionAvailable");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_motionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "motionManager");
}

id objc_msgSend_pitch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pitch");
}

id objc_msgSend_readDeviceAnglesFrom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDeviceAnglesFrom:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_roll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "roll");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDeviceMotionUpdateInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceMotionUpdateInterval:");
}

id objc_msgSend_setMotionManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMotionManager:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_startDeviceMotionUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDeviceMotionUpdatesToQueue:withHandler:");
}

id objc_msgSend_stopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopDeviceMotionUpdates");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_yaw(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "yaw");
}
