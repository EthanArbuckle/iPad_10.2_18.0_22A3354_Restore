uint64_t start(int a1, char **a2)
{
  void *v4;

  v4 = objc_autoreleasePoolPush();
  UIApplicationMain(a1, a2, CFSTR("DemoApplication"), CFSTR("DemoApplication"));
  objc_autoreleasePoolPop(v4);
  return 0;
}

id sub_1000018EC(uint64_t a1)
{
  void *v1;
  __int128 v3;
  CMTimeEpoch epoch;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_OWORD *)&kCMTimeZero.value;
  epoch = kCMTimeZero.epoch;
  return objc_msgSend(v1, "seekToTime:", &v3);
}

void sub_100001AB4(int8x16_t *a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  int8x16_t v10;
  _QWORD block[4];
  int8x16_t v12;
  id v13;
  id v14;

  v2 = (void *)a1[2].i64[0];
  v14 = 0;
  v3 = objc_msgSend(v2, "statusOfValueForKey:error:", CFSTR("duration"), &v14);
  v4 = v14;
  v5 = v4;
  if (v3 != (id)2)
    sub_100001EB0(v4);
  v6 = (void *)a1[2].i64[0];
  v13 = v5;
  v7 = objc_msgSend(v6, "statusOfValueForKey:error:", CFSTR("tracks"), &v13);
  v8 = v13;

  if (v7 != (id)2)
    sub_100001E7C(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001BB8;
  block[3] = &unk_100004190;
  v10 = a1[2];
  v9 = (id)v10.i64[0];
  v12 = vextq_s8(v10, v10, 8uLL);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100001BB8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CMTime time;

  v2 = *(void **)(a1 + 40);
  if (v2)
    objc_msgSend(v2, "duration");
  else
    memset(&time, 0, sizeof(time));
  *(Float64 *)(*(_QWORD *)(a1 + 32) + 32) = CMTimeGetSeconds(&time);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayerItem playerItemWithAsset:](AVPlayerItem, "playerItemWithAsset:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("status"), 4, &unk_100009038);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "_playerItemDidPlayToEndTime:", AVPlayerItemDidPlayToEndTimeNotification, v3);

  v5 = objc_claimAutoreleasedReturnValue(+[AVPlayer playerWithPlayerItem:](AVPlayer, "playerWithPlayerItem:", v3));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setActionAtItemEnd:", 2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setPlayer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

}

void sub_100001E7C(void *a1)
{
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  NSLog(CFSTR("error loading movie tracks: %@"), v1);

  abort();
}

void sub_100001EB0(void *a1)
{
  void *v1;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  NSLog(CFSTR("error loading movie duration: %@"), v1);

  abort();
}

id objc_msgSend__prepareMovie(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_prepareMovie");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentItem");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithURL_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:options:");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_loadValuesAsynchronouslyForKeys_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadValuesAsynchronouslyForKeys:completionHandler:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player");
}

id objc_msgSend_playerItemWithAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playerItemWithAsset:");
}

id objc_msgSend_playerWithPlayerItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playerWithPlayerItem:");
}

id objc_msgSend_seekToTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToTime:");
}

id objc_msgSend_seekToTime_toleranceBefore_toleranceAfter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToTime:toleranceBefore:toleranceAfter:");
}

id objc_msgSend_setActionAtItemEnd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionAtItemEnd:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setPlayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlayer:");
}

id objc_msgSend_setRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRate:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_statusOfValueForKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusOfValueForKey:error:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suspend");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}
