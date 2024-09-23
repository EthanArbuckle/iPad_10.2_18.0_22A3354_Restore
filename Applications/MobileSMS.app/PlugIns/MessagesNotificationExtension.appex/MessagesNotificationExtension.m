void sub_100003448(uint64_t a1, void *a2)
{
  CKNotificationAudioController *v3;
  id v4;

  if (a2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "__ck_mediaObjects"));
    if (objc_msgSend(v4, "count"))
    {
      v3 = -[CKNotificationAudioController initWithMediaObjects:completionBlock:]([CKNotificationAudioController alloc], "initWithMediaObjects:completionBlock:", v4, *(_QWORD *)(a1 + 40));
      -[CKNotificationAudioController play](v3, "play");

    }
    else
    {
      _IMWarn(CFSTR("Message %@ didn't contain any media objects"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    _IMWarn(CFSTR("Failed to load message %@"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

id objc_msgSend___ck_mediaObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ck_mediaObjects");
}

id objc_msgSend_audioController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioController");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_initWithMediaObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMediaObjects:");
}

id objc_msgSend_initWithMediaObjects_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMediaObjects:completionBlock:");
}

id objc_msgSend_loadMessageWithGUID_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadMessageWithGUID:completionBlock:");
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "play");
}

id objc_msgSend_setAudioController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAudioController:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}
