void sub_100004358(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v1 = a1;
  if (qword_10003AE58)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
    v4 = 0;
    v5 = 0;
    if (sub_10001EAC8(qword_10003AE58, &v6, &v4))
    {
      v2 = v1;
      v3 = getpid();
      NSLog(CFSTR("%@, performance counters: pid: %u, context switchings: %d, CPU-time: %llu, memory footprint min/max/avg(K): %llu %llu %llu, memory sample count: %u, leak count/size(K): %llu %llu"), v2, v3, (DWORD2(v7) - v6), (_QWORD)v8 + *((_QWORD *)&v8 + 1) - (*((_QWORD *)&v6 + 1) + (_QWORD)v7), (unint64_t)v9 >> 10, *((_QWORD *)&v9 + 1) >> 10, (unint64_t)v10 >> 10, DWORD2(v10), v4, v5 >> 10);

    }
    qword_10003AE58 = 0;
  }

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v4 = objc_autoreleasePoolPush();
  global_queue = dispatch_get_global_queue(25, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v6, &stru_100031208);

  v7 = objc_msgSend(objc_alloc((Class)NSURLCache), "initWithMemoryCapacity:diskCapacity:diskPath:", 0, 0, 0);
  IMSetEmbeddedTempDirectory(+[NSURLCache setSharedURLCache:](NSURLCache, "setSharedURLCache:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMImagePreviewGenerator UTITypes](IMImagePreviewGenerator, "UTITypes"));
  v9 = objc_msgSend(v8, "mutableCopy");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMAnimatedImagePreviewGenerator UTITypes](IMAnimatedImagePreviewGenerator, "UTITypes"));
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  objc_msgSend(v9, "addObject:", CFSTR("com.microsoft.ico"));
  CGImageSourceSetAllowableTypes(v9);
  UIApplicationMain(a1, a2, CFSTR("SMSApplication"), CFSTR("SMSApplicationDelegate"));

  objc_autoreleasePoolPop(v4);
  return 0;
}

void sub_10000454C(id a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  IMPrewarmXPCInterfaces(a1);
  v1 = +[IMSuggestionsService sharedInstance](IMSuggestionsService, "sharedInstance");
  v2 = +[IMMobileNetworkManager sharedInstance](IMMobileNetworkManager, "sharedInstance");
  IMIsSupportedUTIType(&stru_100031270);
  v3 = +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v4 = +[IMParentalControls standardControls](IMParentalControls, "standardControls");
  v5 = +[IMSystemMonitor sharedInstance](IMSystemMonitor, "sharedInstance");
  v6 = +[FTEntitlementSupport sharedInstance](FTEntitlementSupport, "sharedInstance");
  v7 = +[FTDeviceSupport sharedInstance](FTDeviceSupport, "sharedInstance");
  +[CKFaceTimeUtilities initializeCachedValues](CKFaceTimeUtilities, "initializeCachedValues");
  v8 = +[IDSServerBag sharedInstanceForBagType:](IDSServerBag, "sharedInstanceForBagType:", 1);
}

void sub_100006CA4(id a1)
{
  uint64_t v1;

  objc_msgSend(+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  qword_10003AE40 = v1;
}

void sub_100006EA8(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 1);

  v3 = dispatch_time(0, 4000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006F54;
  block[3] = &unk_100030A30;
  v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100006F54(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("processCount")));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/AppleInternal/XCTests/com.apple.mobilesms/screenshotTest.xctest"), "lastPathComponent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByDeletingPathExtension"));

  v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MobileSMS invoking App test for %@\n"), CFSTR("/AppleInternal/XCTests/com.apple.mobilesms/screenshotTest.xctest")));
  v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_image%@"), v3, v1));

  +[SMSScreenshotUIImages saveImage:filePath:fileName:withHeader:](SMSScreenshotUIImages, "saveImage:filePath:fileName:withHeader:", objc_claimAutoreleasedReturnValue(+[SMSScreenshotUIImages captureScreenshot](SMSScreenshotUIImages, "captureScreenshot")), CFSTR("/tmp/"), v5, v4);
  exit(0);
}

uint64_t sub_1000073F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  if ((objc_msgSend(*(id *)(a1 + 32), "runTestNameOrFallback:", *(_QWORD *)(a1 + 40)) & 1) != 0)
    return 1;
  v2 = kShowMessagesTest;
  if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", kShowMessagesTest) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("ScrollConversations")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("ScrollTranscript")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("StaticTranscript")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("Rotat")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("Present")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", kShowPeoplePickerTest) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", kSelectContactPeoplePickerTest) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", kCancelPeoplePickerTest) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", kShowNewComposeTest) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("ResolveContact")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("Photo")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", kThrowAnimationPPTTestNamePrefix) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("ScrollPseudoContactNames")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("ComposeToPseudoContact")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("DetailsView")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("AudioReply")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("InvisibleInkStaticFPSTest")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("AudioWaveformFPSTest")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("GifPlaybackStaticFPSTest")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("StickerDragFPSTest")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("ExtensionLaunch")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("ExtensionTest")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("perfTestPushTranscriptToAppsShelf")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("perfTestScrollAppsDrawer")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("TestPriorityBoosting")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CKAudioBalloonPlaybackPPTName) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CKPluginChatItemPPTName) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("TestMarkAsRead")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("Resize")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("MacResize")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("MacActivate")) == (id)0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("MacEnterExitFullscreen")) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("Nano"));
    return 1;
  }
  v3 = objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("Landscape")) == (id)0x7FFFFFFFFFFFFFFFLL ? 1 : 3;
  if ((objc_msgSend(UIApp, "rotateIfNeeded:", v3) & 1) != 0)
    return 1;
  if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", v2) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "startShowMessagesTest:", *(_QWORD *)(a1 + 48));
    return 1;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", kShowPeoplePickerTest) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = *(void **)(a1 + 32);
    v7 = "startShowPeoplePickerTest:";
LABEL_61:
    objc_msgSend(v6, "performSelector:withObject:afterDelay:", v7, *(_QWORD *)(a1 + 48), 1.0);
    return 1;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", kCancelPeoplePickerTest) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = *(void **)(a1 + 32);
    v7 = "startCancelPeoplePickerTest:";
    goto LABEL_61;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", kSelectContactPeoplePickerTest) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = *(void **)(a1 + 32);
    v7 = "startSelectContactPeoplePickerTest:";
    goto LABEL_61;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", kShowNewComposeTest) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = *(void **)(a1 + 32);
    v7 = "startShowNewComposeTest:";
    goto LABEL_61;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", kResolveContactExistingConvTest) != (id)0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", kResolveContactNewConvTest) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "startResolveContactTest:", *(_QWORD *)(a1 + 48));
    return 1;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("ComposeToPseudoContact")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = *(void **)(a1 + 32);
    v7 = "startComposeMessageToPseudoContactTest:";
    goto LABEL_61;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("ScrollConversations")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "startScrollConversationsTest:", *(_QWORD *)(a1 + 48));
    return 1;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("ScrollTranscript")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "startScrollTranscriptTest:", *(_QWORD *)(a1 + 48));
    return 1;
  }
  v4 = objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("StaticTranscript"));
  v5 = *(void **)(a1 + 40);
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = objc_msgSend(v5, "rangeOfString:", CFSTR("FSM"));
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 48);
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v10, "startStaticTranscriptFPSTest:", v11);
    else
      objc_msgSend(v10, "startStaticFSMFPSTest:", v11);
    return 1;
  }
  if (objc_msgSend(v5, "rangeOfString:", CKAudioBalloonPlaybackPPTName) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "startAudioBalloonPlaybackTest:", *(_QWORD *)(a1 + 48));
    return 1;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("ScrollPseudoContactNames")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "startScrollPseudoContactNamesTest:", *(_QWORD *)(a1 + 48));
    return 1;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("Rotation")) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "startRotationTest:", *(_QWORD *)(a1 + 48));
    return 1;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("InvisibleInkStaticFPSTest")))
  {
    objc_msgSend(*(id *)(a1 + 32), "startInvisibleInkStaticFPSTest");
    return 1;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("AudioWaveformFPSTest")))
  {
    objc_msgSend(*(id *)(a1 + 32), "startAudioWaveformFPSTest");
    return 1;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("GifPlaybackStaticFPSTest")))
  {
    objc_msgSend(*(id *)(a1 + 32), "startGifPlaybackStaticFPSTest");
    return 1;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("RotateTranscript")))
  {
    objc_msgSend(*(id *)(a1 + 32), "startRotationTestWithTranscript:", *(_QWORD *)(a1 + 48));
    return 1;
  }
  v12 = objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("Photo"));
  v13 = *(void **)(a1 + 40);
  if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = objc_msgSend(v13, "rangeOfString:", kThrowAnimationPPTTestNamePrefix);
    v15 = *(void **)(a1 + 40);
    if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = objc_msgSend(v15, "rangeOfString:", CFSTR("NewCompose"));
      v17 = *(void **)(a1 + 32);
      if (v16 == (id)0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v17, "startSendAnimationExistingTest");
      else
        objc_msgSend(v17, "startSendAnimationNewComposeTest:", *(_QWORD *)(a1 + 48));
      return 1;
    }
    if (objc_msgSend(v15, "rangeOfString:", CFSTR("DetailsView")) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "startDetailsTest:", *(_QWORD *)(a1 + 48));
      return 1;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("AudioReply")) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "startStuckAudioPillTest:", *(_QWORD *)(a1 + 48));
      return 1;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("PresentKeyboardTest")) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "startKeyboardPresentationTest:", *(_QWORD *)(a1 + 48));
      return 1;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("PresentKeyboardResponsivenessTest")) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "startKeyboardResponsivenessTest:", *(_QWORD *)(a1 + 48));
      return 1;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("PresentQuicklookTest")) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "startQuicklookPresentationTest:", *(_QWORD *)(a1 + 48));
      return 1;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("StickerDragFPSTest")) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 32), "startInteractiveStickerDragTest:", *(_QWORD *)(a1 + 48));
      return 1;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("ExtensionLaunch")) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("ExtensionTest")) == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("TestPriorityBoosting")) == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CKPluginChatItemPPTName) == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("TestMarkAsReadLocally")) == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("TestMarkAsReadReceived")) == (id)0x7FFFFFFFFFFFFFFFLL)
              {
                if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("Resize")) == (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("MacResize")) == (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("MacActivate")) == (id)0x7FFFFFFFFFFFFFFFLL)
                    {
                      if (objc_msgSend(*(id *)(a1 + 40), "rangeOfString:", CFSTR("MacEnterExitFullscreen")) != (id)0x7FFFFFFFFFFFFFFFLL)
                        objc_msgSend(*(id *)(a1 + 32), "startMacFullscreenTestWithOptions:", *(_QWORD *)(a1 + 48));
                    }
                    else
                    {
                      objc_msgSend(*(id *)(a1 + 32), "startMacActivateTestWithOptions:", *(_QWORD *)(a1 + 48));
                    }
                  }
                  else
                  {
                    objc_msgSend(*(id *)(a1 + 32), "startMacResizeTestWithOptions:", *(_QWORD *)(a1 + 48));
                  }
                }
                else
                {
                  objc_msgSend(*(id *)(a1 + 32), "startResizeTestWithOptions:", *(_QWORD *)(a1 + 48));
                }
              }
              else
              {
                objc_msgSend(*(id *)(a1 + 32), "startMarkAsReadReceivedTestWithOptions:", *(_QWORD *)(a1 + 48));
              }
            }
            else
            {
              objc_msgSend(*(id *)(a1 + 32), "startMarkAsReadLocallyTestWithOptions:", *(_QWORD *)(a1 + 48));
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "startLiveBubbleLoadingTest:", qword_10003AE50);
          }
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "startPriorityBoostingTestWithOptions:", *(_QWORD *)(a1 + 48));
        }
        return 1;
      }
      v18 = *(void **)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 48);
      v20 = 0;
    }
    else
    {
      v18 = *(void **)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 48);
      v20 = 1;
    }
    objc_msgSend(v18, "startExtensionTest:launch:", v19, v20);
    return 1;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("ScrollPhotoPicker")))
    objc_msgSend(*(id *)(a1 + 32), "scrollPhotoPickerTestWithOptions:", *(_QWORD *)(a1 + 48));
  return 1;
}

void sub_1000080F0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversationForExistingChatWithChatIdentifier:", *(_QWORD *)(a1 + 32)));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
    objc_msgSend(v4, "setDraft:forConversation:", 0, v3);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
    objc_msgSend(v5, "saveCompositionAndFlushCache:", 1);

    v6 = *(void **)(a1 + 40);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100008258;
    v10[3] = &unk_100030AA8;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v6, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v7, CFSTR("PPTDidShowConversationEvent"), 1, v10);

    v8 = *(_QWORD *)(a1 + 56);
    if (v8)
      (*(void (**)(void))(v8 + 16))();
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "messagesController"));
    objc_msgSend(v9, "showConversation:animate:", v3, 1);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "startedTest:", __CurrentTestName);
    objc_msgSend(*(id *)(a1 + 40), "failedTest:", __CurrentTestName);
  }

}

uint64_t sub_100008258(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_10000834C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
}

uint64_t sub_100008360(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void sub_1000083F8(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  id v4;

  v2 = +[UIDevice __ck_currentDeviceIsPadOrMac](UIDevice, "__ck_currentDeviceIsPadOrMac");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "_hideConversationListForIPadPPTTest");

    objc_msgSend(*(id *)(a1 + 32), "didShowTranscriptList");
  }
  else
  {
    objc_msgSend(v3, "showConversationListWithAnimation:", *(unsigned __int8 *)(a1 + 40));

  }
}

id sub_100008914()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_10003AEB0;
  v7 = qword_10003AEB0;
  if (!qword_10003AEB0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001B0B8;
    v3[3] = &unk_100031068;
    v3[4] = &v4;
    sub_10001B0B8((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000089B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000089CC()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_10003AEC0;
  v7 = qword_10003AEC0;
  if (!qword_10003AEC0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001B1B0;
    v3[3] = &unk_100031068;
    v3[4] = &v4;
    sub_10001B1B0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100008A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100008C90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("Close Message Responsiveness"), __CurrentTestName);
}

void sub_1000090F8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "indexPathForCell:", v10));
  v7 = objc_opt_class(CKTranscriptSpeakerBalloonCell);
  if ((objc_opt_isKindOfClass(v10, v7) & 1) != 0)
  {
    NSLog(CFSTR("SHANA - trnscript cells %@ - index path %@"), v10, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "collectionViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "balloonView"));
    objc_msgSend(v8, "balloonViewTapped:withModifierFlags:selectedText:", v9, 0, 0);

    *a4 = 1;
  }

}

void sub_1000092FC(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "entryView"));
  objc_msgSend(v2, "performSelector:withObject:", "audioReplyButtonStart:", 0);

  v3 = dispatch_time(0, 1000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000093B0;
  v6[3] = &unk_100030B70;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v6);

}

void sub_1000093B0(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "entryView"));
  objc_msgSend(v2, "performSelector:withObject:", "audioReplyButtonStop:", 0);

  v3 = dispatch_time(0, 1000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009464;
  v6[3] = &unk_100030B70;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v6);

}

void sub_100009464(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "entryView"));
  objc_msgSend(v2, "touchUpInsideSendButton:", 0);

  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000094F8;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1000094F8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "playAudioMessage");
}

void sub_1000096B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000096D0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000096E0(uint64_t a1)
{

}

void sub_1000096E8(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  uint64_t v4;
  _QWORD v5[6];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showNewMessageCompositionPanelWithRecipients:composition:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

  v3 = dispatch_time(0, 1000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100009784;
  v5[3] = &unk_100030BC0;
  v4 = *(_QWORD *)(a1 + 56);
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = v4;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_100009784(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  __int128 v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "composeChatController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryView"));
  objc_msgSend(v4, "touchUpInsideSendButton:", 0);

  v5 = dispatch_time(0, 2000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009840;
  v6[3] = &unk_100030BC0;
  v7 = *(_OWORD *)(a1 + 32);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_100009840(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "showTranscriptListNotAnimated");
  v2 = dispatch_time(0, 2000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000098C0;
  v3[3] = &unk_100030BC0;
  v4 = *(_OWORD *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_1000098C0(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "sendAudioMessage");
  v2 = dispatch_time(0, 5000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100009944;
  v3[3] = &unk_100030B98;
  v4 = *(_OWORD *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_100009944(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  const __CFString *v13;
  dispatch_time_t v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chatController"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 1, v6);
  v8 = v7 & objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0, v6);
  v9 = objc_msgSend(*(id *)(a1 + 32), "validateNonzeroTranscriptInsets:expected:withResultsDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 1, v6);
  v10 = v8 & v9 & objc_msgSend(*(id *)(a1 + 32), "validateBottomInsetGreaterThanIAVHeight:expected:withResultsDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0, v6);
  v11 = v10 & objc_msgSend(*(id *)(a1 + 32), "validateIAVisExpanded:expected:withResultsDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0, v6);
  v12 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 1, v6);
  if ((v11 & v12) != 0)
    v13 = CFSTR(":D");
  else
    v13 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v11 & v12, CFSTR("|--All Tests Passed--|"), v13, v6);
  v14 = dispatch_time(0, 1000000000);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100009AF8;
  v16[3] = &unk_100030B70;
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v6;
  v15 = v6;
  dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v16);

}

id sub_100009AF8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deleteTopChat");
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, *(_QWORD *)(a1 + 40));
}

void sub_100009C50(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Test Alert"), &stru_100031270, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v3, 1));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

  v6 = dispatch_time(0, 2000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009D70;
  v8[3] = &unk_100030B70;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);

}

void sub_100009D70(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009E08;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100009E08(uint64_t a1)
{
  void *v2;
  id v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  const __CFString *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chatController"));

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", v8, 1, v3);
  v5 = v4 & objc_msgSend(*(id *)(a1 + 32), "validateTranscriptControllerIsFirstResponder:expected:withResultsDictionary:", v8, 1, v3);
  v6 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:", v8, 1, v3);
  if ((v5 & v6) != 0)
    v7 = CFSTR(":D");
  else
    v7 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v5 & v6, CFSTR("|--All Tests Passed--|"), v7, v3);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v3);

}

void sub_10000A01C(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A0B4;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000A0B4(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chatController"));

  objc_msgSend(v3, "performSelector:withObject:", "actionMenuGestureRecognizerButtonGestureDidBegin:", 0);
  v4 = dispatch_time(0, 2000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A184;
  v7[3] = &unk_100030B70;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v7);

}

void sub_10000A184(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(UIApp, "rotateIfNeeded:", 4);
  v2 = dispatch_time(0, 2000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A228;
  v5[3] = &unk_100030B70;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_10000A228(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "ckVideoMessageRecordingViewControllerRecordingCanceled:", 0);
  v2 = dispatch_time(0, 2000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A2C4;
  v5[3] = &unk_100030B70;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_10000A2C4(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  id v4;
  int8x16_t v5;
  _QWORD block[4];
  int8x16_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "entryView"));
  objc_msgSend(v2, "performSelector:withObject:", "actionMenuGestureRecognizerButtonGestureDidBegin:", 0);

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A384;
  block[3] = &unk_100030B70;
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10000A384(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  const __CFString *v4;
  id v5;

  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v5);
  v3 = objc_msgSend(*(id *)(a1 + 32), "validateActionMenuWindowOrientationExpectedOrientation:withResultsDictionary:", 4, v5);
  if ((v2 & v3) != 0)
    v4 = CFSTR(":D");
  else
    v4 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v2 & v3, CFSTR("|--All Tests Passed--|"), v4, v5);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v5);

}

void sub_10000A49C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversations"));

  v3 = qword_10003AE88;
  v4 = (char *)objc_msgSend(v6, "count") + 1;
  v5 = *(void **)(a1 + 32);
  if ((char *)v3 == v4)
    objc_msgSend(v5, "finishedTest:", __CurrentTestName);
  else
    objc_msgSend(v5, "failedTest:withFailure:", __CurrentTestName, CFSTR("conversation count not the same"));

}

void sub_10000A88C(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversationListController"));
  objc_msgSend(v1, "batchDeleteButtonTapped:", 0);

}

id sub_10000A8D8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "batchDeleteButtonTapped:", 0);
}

void sub_10000ABA0(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x10000AB1CLL);
  }
  _Unwind_Resume(a1);
}

void sub_10000ACB8(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, objc_msgSend(v2, "mapSectionIdentifierForCurrentConversationListClass:", 6)));
  objc_msgSend(v2, "deleteChat:", v3);

}

void sub_10000ADFC(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  dispatch_time_t v18;
  id v19;
  _QWORD v20[5];
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversations"));

  v4 = objc_msgSend(v3, "count");
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(v5, "failedTest:withFailure:", __CurrentTestName, CFSTR("No conversations in conversation list"));
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messagesController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chatController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationForExistingChatWithChatIdentifier:", *(_QWORD *)(a1 + 40)));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  if ((objc_msgSend(v10, "isCollapsed") & 1) != 0)
    goto LABEL_8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversation"));
  if (v9 != v11 || (unint64_t)objc_msgSend(v3, "count") < 3)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  v12 = *(unsigned __int8 *)(a1 + 48);

  if (v12)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v11 = v9;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "conversationForExistingChatWithChatIdentifier:", CFSTR("+14087240720")));
    goto LABEL_7;
  }
LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v13, "setDraft:forConversation:", 0, v9);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v14, "saveCompositionAndFlushCache:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v15, "showConversation:animate:", v9, 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "chatController"));

  v18 = dispatch_time(0, 1000000000);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000B054;
  v20[3] = &unk_100030B70;
  v20[4] = *(_QWORD *)(a1 + 32);
  v21 = v17;
  v19 = v17;
  dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, v20);

LABEL_11:
}

void sub_10000B054(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  const __CFString *v9;
  id v10;

  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v10);
  v3 = v2 & objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v10);
  v4 = objc_msgSend(*(id *)(a1 + 32), "validateNonzeroTranscriptInsets:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v10);
  v5 = v3 & v4 & objc_msgSend(*(id *)(a1 + 32), "validateBottomInsetGreaterThanIAVHeight:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v10);
  v6 = objc_msgSend(*(id *)(a1 + 32), "validateIAVisExpanded:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v10);
  v7 = v5 & v6 & objc_msgSend(*(id *)(a1 + 32), "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v10);
  v8 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptPreviewCacheHasResumed:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v10);
  if ((v7 & v8) != 0)
    v9 = CFSTR(":D");
  else
    v9 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v7 & v8, CFSTR("|--All Tests Passed--|"), v9, v10);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v10);

}

void sub_10000B2A4(uint64_t a1)
{
  void *v2;
  id v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  const __CFString *v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chatController"));

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", v12, 1, v3);
  v5 = v4 & objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", v12, 1, v3);
  v6 = objc_msgSend(*(id *)(a1 + 32), "validateNonzeroTranscriptInsets:expected:withResultsDictionary:", v12, 1, v3);
  v7 = v5 & v6 & objc_msgSend(*(id *)(a1 + 32), "validateBottomInsetGreaterThanIAVHeight:expected:withResultsDictionary:", v12, 1, v3);
  v8 = objc_msgSend(*(id *)(a1 + 32), "validateIAVisExpanded:expected:withResultsDictionary:", v12, 0, v3);
  v9 = v7 & v8 & objc_msgSend(*(id *)(a1 + 32), "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:", v12, 1, v3);
  v10 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptPreviewCacheHasResumed:expected:withResultsDictionary:", v12, 1, v3);
  if ((v9 & v10) != 0)
    v11 = CFSTR(":D");
  else
    v11 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v9 & v10, CFSTR("|--All Tests Passed--|"), v11, v3);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v3);

}

void sub_10000B474(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  id v25;
  _QWORD v26[5];
  id v27;

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversations"));

  v4 = objc_msgSend(v3, "count");
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(v5, "failedTest:withFailure:", __CurrentTestName, CFSTR("No conversations in conversation list"));
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messagesController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chatController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  if ((objc_msgSend(v10, "isCollapsed") & 1) != 0)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversation"));
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  v12 = objc_msgSend(v3, "count");

  if ((unint64_t)v12 >= 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "conversationForExistingChatWithChatIdentifier:", CFSTR("+14087240720")));
    v11 = v9;
    v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  v14 = objc_alloc((Class)NSAttributedString);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Test Draft!"), &stru_100031270, 0));
  v17 = objc_msgSend(v14, "initWithString:", v16);

  v18 = objc_msgSend(objc_alloc((Class)CKComposition), "initWithText:subject:", v17, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v19, "setDraft:forConversation:", v18, v9);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v20, "saveCompositionAndFlushCache:", 1);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v21, "showConversation:animate:", v9, 1);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "chatController"));

  v24 = dispatch_time(0, 2000000000);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000B74C;
  v26[3] = &unk_100030B70;
  v26[4] = *(_QWORD *)(a1 + 32);
  v27 = v23;
  v25 = v23;
  dispatch_after(v24, (dispatch_queue_t)&_dispatch_main_q, v26);

LABEL_10:
}

void sub_10000B74C(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  const __CFString *v8;
  id v9;

  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v9);
  v3 = v2 & objc_msgSend(*(id *)(a1 + 32), "validateNonzeroTranscriptInsets:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v9);
  v4 = v3 & objc_msgSend(*(id *)(a1 + 32), "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v6 = objc_msgSend(v5, "isCollapsed");

  if (v6)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v9);
    v4 = v4 & v7 & objc_msgSend(*(id *)(a1 + 32), "validateBottomInsetGreaterThanIAVHeight:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v9);
  }
  if ((_DWORD)v4)
    v8 = CFSTR(":D");
  else
    v8 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v4, CFSTR("|--All Tests Passed--|"), v8, v9);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v9);

}

void sub_10000B8D4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  uint64_t v30;
  id v31;

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversations"));

  v4 = objc_msgSend(v3, "count");
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(v5, "failedTest:withFailure:", __CurrentTestName, CFSTR("No conversations in conversation list"));
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messagesController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chatController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  if ((objc_msgSend(v10, "isCollapsed") & 1) != 0)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversation"));
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  v12 = objc_msgSend(v3, "count");

  if ((unint64_t)v12 >= 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "conversationForExistingChatWithChatIdentifier:", CFSTR("+14087240720")));
    v11 = v9;
    v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  v14 = objc_alloc((Class)NSAttributedString);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("This is a test draft that is very long so that it may expand the entry view."), &stru_100031270, 0));
  v17 = objc_msgSend(v14, "initWithString:", v16);

  v18 = objc_msgSend(objc_alloc((Class)CKComposition), "initWithText:subject:", v17, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v19, "setDraft:forConversation:", v18, v9);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v20, "saveCompositionAndFlushCache:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v21, "showConversation:animate:", v9, 1);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "chatController"));

  v24 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BBC0;
  block[3] = &unk_100030A58;
  v25 = *(_QWORD *)(a1 + 32);
  v29 = v23;
  v30 = v25;
  v31 = v9;
  v26 = v9;
  v27 = v23;
  dispatch_after(v24, (dispatch_queue_t)&_dispatch_main_q, block);

LABEL_10:
}

void sub_10000BBC0(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  int8x16_t v4;
  _QWORD block[4];
  int8x16_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "dismissKeyboard");
  v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BC78;
  block[3] = &unk_100030A58;
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  v7 = *(id *)(a1 + 48);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10000BC78(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v12);
  v3 = v2 & objc_msgSend(*(id *)(a1 + 32), "validateNonzeroTranscriptInsets:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v12);
  v4 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v12);
  v5 = v3 & v4 & objc_msgSend(*(id *)(a1 + 32), "validateIAVisExpanded:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v7 = objc_msgSend(v6, "isCollapsed");

  if (v7)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v12);
    v5 = v5 & v8 & objc_msgSend(*(id *)(a1 + 32), "validateBottomInsetGreaterThanIAVHeight:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v12);
  }
  if ((_DWORD)v5)
    v9 = CFSTR(":D");
  else
    v9 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v5, CFSTR("|--All Tests Passed--|"), v9, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v10, "setDraft:forConversation:", 0, *(_QWORD *)(a1 + 48));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v11, "saveCompositionAndFlushCache:", 1);

  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v12);
}

void sub_10000BE58(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversations"));

  v4 = objc_msgSend(v3, "count");
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(v5, "failedTest:withFailure:", __CurrentTestName, CFSTR("No conversations in conversation list"));
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messagesController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chatController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  if ((objc_msgSend(v10, "isCollapsed") & 1) != 0)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversation"));
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  v12 = objc_msgSend(v3, "count");

  if ((unint64_t)v12 >= 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "conversationForExistingChatWithChatIdentifier:", CFSTR("+14087240720")));
    v11 = v9;
    v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v14, "setDraft:forConversation:", 0, v9);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v15, "saveCompositionAndFlushCache:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v16, "showConversation:animate:", v9, 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "chatController"));

  v19 = dispatch_time(0, 1000000000);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000C0B0;
  v22[3] = &unk_100030B70;
  v20 = *(_QWORD *)(a1 + 32);
  v23 = v18;
  v24 = v20;
  v21 = v18;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v22);

LABEL_10:
}

void sub_10000C0B0(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", "_detailsButtonPressed", 0);
  v2 = dispatch_time(0, 2000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C154;
  v5[3] = &unk_100030B70;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_10000C154(uint64_t a1)
{
  void *v2;
  id v3;
  dispatch_time_t v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
  v3 = objc_msgSend(v2, "popToRootViewControllerAnimated:", 1);

  v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C214;
  block[3] = &unk_100030B70;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10000C214(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  const __CFString *v8;
  id v9;

  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v9);
  v3 = v2 & objc_msgSend(*(id *)(a1 + 32), "validateIAVisExpanded:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v9);
  v4 = objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v9);
  v5 = v3 & v4 & objc_msgSend(*(id *)(a1 + 32), "validateNonzeroTranscriptInsets:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v9);
  v6 = v5 & objc_msgSend(*(id *)(a1 + 32), "validateBottomInsetGreaterThanIAVHeight:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v9);
  v7 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v9);
  if ((v6 & v7) != 0)
    v8 = CFSTR(":D");
  else
    v8 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v6 & v7, CFSTR("|--All Tests Passed--|"), v8, v9);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v9);

}

void sub_10000C38C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversations"));

  v4 = objc_msgSend(v3, "count");
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(v5, "failedTest:withFailure:", __CurrentTestName, CFSTR("No conversations in conversation list"));
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messagesController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chatController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  if ((objc_msgSend(v10, "isCollapsed") & 1) != 0)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversation"));
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  v12 = objc_msgSend(v3, "count");

  if ((unint64_t)v12 >= 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "conversationForExistingChatWithChatIdentifier:", CFSTR("+14087240720")));
    v11 = v9;
    v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v14, "setDraft:forConversation:", 0, v9);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v15, "saveCompositionAndFlushCache:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v16, "showConversation:animate:", v9, 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "chatController"));

  v19 = dispatch_time(0, 1000000000);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000C5E4;
  v22[3] = &unk_100030B70;
  v20 = *(_QWORD *)(a1 + 32);
  v23 = v18;
  v24 = v20;
  v21 = v18;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v22);

LABEL_10:
}

void sub_10000C5E4(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "showKeyboardForReply");
  v2 = dispatch_time(0, 1000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C67C;
  v5[3] = &unk_100030B70;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_10000C67C(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", "_detailsButtonPressed", 0);
  v2 = dispatch_time(0, 2000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000C720;
  v5[3] = &unk_100030B70;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_10000C720(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C7F4;
  block[3] = &unk_100030B70;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10000C7F4(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  const __CFString *v8;
  id v9;

  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v9);
  v3 = v2 & objc_msgSend(*(id *)(a1 + 32), "validateIAVisExpanded:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v9);
  v4 = objc_msgSend(*(id *)(a1 + 32), "validateNonzeroTranscriptInsets:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v9);
  v5 = v3 & v4 & objc_msgSend(*(id *)(a1 + 32), "validateBottomInsetGreaterThanIAVHeight:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v9);
  v6 = v5 & objc_msgSend(*(id *)(a1 + 32), "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v9);
  v7 = objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v9);
  if ((v6 & v7) != 0)
    v8 = CFSTR(":D");
  else
    v8 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v6 & v7, CFSTR("|--All Tests Passed--|"), v8, v9);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v9);

}

void sub_10000CA04(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  dispatch_time_t v7;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sceneController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messagesSceneDelegate"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "madridRegistrationController"));
  objc_msgSend(v3, "setShouldShowRegistrationOverride:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "postNotificationName:object:", IMAccountControllerOperationalAccountsChangedNotification, 0);

  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionBlock"));
  v6[2](v6, 1);

  v7 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CB14;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10000CB14(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));

  if (v6)
  {
    v3 = *(void **)(a1 + 32);
    v4 = __CurrentTestName;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Still presenting %@"), v6));
    objc_msgSend(v3, "failedTest:withFailure:", v4, v5);
  }
  else
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(*(id *)(a1 + 32), "_recordAllTestsPassed:resultsDictionary:", 1, v5);
    objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v5);
  }

}

void sub_10000CC64(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  id v20;
  _QWORD v21[5];
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversations"));

  v4 = objc_msgSend(v3, "count");
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(v5, "failedTest:withFailure:", __CurrentTestName, CFSTR("No conversations in conversation list"));
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messagesController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chatController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  if ((objc_msgSend(v10, "isCollapsed") & 1) != 0)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversation"));
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  v12 = objc_msgSend(v3, "count");

  if ((unint64_t)v12 >= 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "conversationForExistingChatWithChatIdentifier:", CFSTR("+14087240720")));
    v11 = v9;
    v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v14, "setDraft:forConversation:", 0, v9);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v15, "saveCompositionAndFlushCache:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v16, "showConversation:animate:", v9, 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "chatController"));

  v19 = dispatch_time(0, 1000000000);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000CEBC;
  v21[3] = &unk_100030B70;
  v21[4] = *(_QWORD *)(a1 + 32);
  v22 = v18;
  v20 = v18;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v21);

LABEL_10:
}

void sub_10000CEBC(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(UIApp, "rotateIfNeeded:", 3);
  v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000CF60;
  v4[3] = &unk_100030B70;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);

}

void sub_10000CF60(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  const __CFString *v7;
  id v8;

  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v3 = v2 & objc_msgSend(*(id *)(a1 + 32), "validateNonzeroTranscriptInsets:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v4 = objc_msgSend(*(id *)(a1 + 32), "validateBottomInsetGreaterThanIAVHeight:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v8);
  v5 = v3 & v4 & objc_msgSend(*(id *)(a1 + 32), "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v6 = objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v8);
  if ((v5 & v6) != 0)
    v7 = CFSTR(":D");
  else
    v7 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v5 & v6, CFSTR("|--All Tests Passed--|"), v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v8);

}

void sub_10000D0C4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversations"));

  v4 = objc_msgSend(v3, "count");
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(v5, "failedTest:withFailure:", __CurrentTestName, CFSTR("No conversations in conversation list"));
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messagesController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chatController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  if ((objc_msgSend(v10, "isCollapsed") & 1) != 0)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversation"));
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  v12 = objc_msgSend(v3, "count");

  if ((unint64_t)v12 >= 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "conversationForExistingChatWithChatIdentifier:", CFSTR("+14087240720")));
    v11 = v9;
    v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v14, "setDraft:forConversation:", 0, v9);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v15, "saveCompositionAndFlushCache:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v16, "showConversation:animate:", v9, 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "chatController"));

  v19 = dispatch_time(0, 1000000000);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000D31C;
  v22[3] = &unk_100030B70;
  v20 = *(_QWORD *)(a1 + 32);
  v23 = v18;
  v24 = v20;
  v21 = v18;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v22);

LABEL_10:
}

void sub_10000D31C(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  int8x16_t v4;
  _QWORD block[4];
  int8x16_t v6;

  objc_msgSend(*(id *)(a1 + 32), "showKeyboardForReply");
  v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D3C0;
  block[3] = &unk_100030B70;
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10000D3C0(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(UIApp, "rotateIfNeeded:", 3);
  v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D464;
  v4[3] = &unk_100030B70;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);

}

void sub_10000D464(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  const __CFString *v7;
  id v8;

  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v3 = v2 & objc_msgSend(*(id *)(a1 + 32), "validateNonzeroTranscriptInsets:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v4 = objc_msgSend(*(id *)(a1 + 32), "validateBottomInsetGreaterThanIAVHeight:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v5 = v3 & v4 & objc_msgSend(*(id *)(a1 + 32), "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v6 = objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  if ((v5 & v6) != 0)
    v7 = CFSTR(":D");
  else
    v7 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v5 & v6, CFSTR("|--All Tests Passed--|"), v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v8);

}

void sub_10000D5C8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  id v20;
  _QWORD v21[5];
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversations"));

  v4 = objc_msgSend(v3, "count");
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(v5, "failedTest:withFailure:", __CurrentTestName, CFSTR("No conversations in conversation list"));
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messagesController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chatController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  if ((objc_msgSend(v10, "isCollapsed") & 1) != 0)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversation"));
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  v12 = objc_msgSend(v3, "count");

  if ((unint64_t)v12 >= 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "conversationForExistingChatWithChatIdentifier:", CFSTR("+14087240720")));
    v11 = v9;
    v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v14, "setDraft:forConversation:", 0, v9);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v15, "saveCompositionAndFlushCache:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v16, "showConversation:animate:", v9, 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "chatController"));

  v19 = dispatch_time(0, 1000000000);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000D820;
  v21[3] = &unk_100030B70;
  v21[4] = *(_QWORD *)(a1 + 32);
  v22 = v18;
  v20 = v18;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v21);

LABEL_10:
}

void sub_10000D820(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(UIApp, "rotateIfNeeded:", 3);
  v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D8C4;
  v4[3] = &unk_100030B70;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);

}

void sub_10000D8C4(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(UIApp, "rotateIfNeeded:", 1);
  v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D968;
  v4[3] = &unk_100030B70;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);

}

void sub_10000D968(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  const __CFString *v7;
  id v8;

  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v3 = v2 & objc_msgSend(*(id *)(a1 + 32), "validateNonzeroTranscriptInsets:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v4 = objc_msgSend(*(id *)(a1 + 32), "validateBottomInsetGreaterThanIAVHeight:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v8);
  v5 = v3 & v4 & objc_msgSend(*(id *)(a1 + 32), "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v6 = objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 0, v8);
  if ((v5 & v6) != 0)
    v7 = CFSTR(":D");
  else
    v7 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v5 & v6, CFSTR("|--All Tests Passed--|"), v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v8);

}

void sub_10000DACC(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversations"));

  v4 = objc_msgSend(v3, "count");
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(v5, "failedTest:withFailure:", __CurrentTestName, CFSTR("No conversations in conversation list"));
    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messagesController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chatController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  if ((objc_msgSend(v10, "isCollapsed") & 1) != 0)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "conversation"));
  if (v9 != v11)
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  v12 = objc_msgSend(v3, "count");

  if ((unint64_t)v12 >= 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "conversationForExistingChatWithChatIdentifier:", CFSTR("+14087240720")));
    v11 = v9;
    v9 = (void *)v13;
    goto LABEL_6;
  }
LABEL_8:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v14, "setDraft:forConversation:", 0, v9);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance"));
  objc_msgSend(v15, "saveCompositionAndFlushCache:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v16, "showConversation:animate:", v9, 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "chatController"));

  v19 = dispatch_time(0, 1000000000);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000DD24;
  v22[3] = &unk_100030B70;
  v20 = *(_QWORD *)(a1 + 32);
  v23 = v18;
  v24 = v20;
  v21 = v18;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v22);

LABEL_10:
}

void sub_10000DD24(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  int8x16_t v4;
  _QWORD block[4];
  int8x16_t v6;

  objc_msgSend(*(id *)(a1 + 32), "showKeyboardForReply");
  v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DDC8;
  block[3] = &unk_100030B70;
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10000DDC8(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(UIApp, "rotateIfNeeded:", 3);
  v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000DE6C;
  v4[3] = &unk_100030B70;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);

}

void sub_10000DE6C(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(UIApp, "rotateIfNeeded:", 1);
  v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000DF10;
  v4[3] = &unk_100030B70;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);

}

void sub_10000DF10(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  const __CFString *v7;
  id v8;

  v8 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v3 = v2 & objc_msgSend(*(id *)(a1 + 32), "validateNonzeroTranscriptInsets:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v4 = objc_msgSend(*(id *)(a1 + 32), "validateBottomInsetGreaterThanIAVHeight:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v5 = v3 & v4 & objc_msgSend(*(id *)(a1 + 32), "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  v6 = objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), 1, v8);
  if ((v5 & v6) != 0)
    v7 = CFSTR(":D");
  else
    v7 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v5 & v6, CFSTR("|--All Tests Passed--|"), v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v8);

}

void sub_10000E074(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E124;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000E124(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  const __CFString *v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "composeChatController"));

  if (v10
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController")),
        v4 = objc_msgSend(v3, "isCollapsed"),
        v3,
        !v4))
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", v10, 1, v5);
    v7 = v6 & objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", v10, 0, v5);
    v8 = objc_msgSend(*(id *)(a1 + 32), "validateRecipientSelectionControllerIsFirstResponder:expected:withResultsDictionary:", v10, 1, v5);
    if ((v7 & v8) != 0)
      v9 = CFSTR(":D");
    else
      v9 = CFSTR(":(");
    objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v7 & v8, CFSTR("|--All Tests Passed--|"), v9, v5);
    objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedTest:withFailure:", __CurrentTestName, CFSTR("Couldn't find modal transcript controller, when one should exist"));
  }

}

void sub_10000E3B4(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showNewMessageCompositionPanelWithRecipients:composition:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E460;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000E460(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  const __CFString *v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "composeChatController"));

  if (v10
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController")),
        v4 = objc_msgSend(v3, "isCollapsed"),
        v3,
        !v4))
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", v10, 1, v5);
    v7 = v6 & objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", v10, 1, v5);
    v8 = objc_msgSend(*(id *)(a1 + 32), "validateRecipientSelectionControllerIsFirstResponder:expected:withResultsDictionary:", v10, 0, v5);
    if ((v7 & v8) != 0)
      v9 = CFSTR(":D");
    else
      v9 = CFSTR(":(");
    objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v7 & v8, CFSTR("|--All Tests Passed--|"), v9, v5);
    objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedTest:withFailure:", __CurrentTestName, CFSTR("Couldn't find modal transcript controller, when one should exist"));
  }

}

void sub_10000E6F0(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showNewMessageCompositionPanelWithRecipients:composition:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E79C;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000E79C(uint64_t a1)
{
  id v2;
  dispatch_time_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = dispatch_time(0, 1000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000E848;
  v5[3] = &unk_100030B70;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v4 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_10000E848(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  dispatch_time_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "composeChatController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryView"));
  objc_msgSend(v4, "touchUpInsideSendButton:", 0);

  v5 = dispatch_time(0, 3000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E91C;
  v7[3] = &unk_100030B70;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);

}

void sub_10000E91C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  int v5;
  unsigned int v6;
  const __CFString *v7;
  dispatch_time_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v2, "chatController"));

  LODWORD(v2) = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", v3, 1, *(_QWORD *)(a1 + 40));
  v4 = v2 & objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", v3, 1, *(_QWORD *)(a1 + 40));
  LODWORD(v2) = objc_msgSend(*(id *)(a1 + 32), "validateNonzeroTranscriptInsets:expected:withResultsDictionary:", v3, 1, *(_QWORD *)(a1 + 40));
  LODWORD(v2) = v4 & v2 & objc_msgSend(*(id *)(a1 + 32), "validateBottomInsetGreaterThanIAVHeight:expected:withResultsDictionary:", v3, 1, *(_QWORD *)(a1 + 40));
  v5 = v2 & objc_msgSend(*(id *)(a1 + 32), "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:", v3, 1, *(_QWORD *)(a1 + 40));
  v6 = objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", v3, 1, *(_QWORD *)(a1 + 40));
  if ((v5 & v6) != 0)
    v7 = CFSTR(":D");
  else
    v7 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v5 & v6, CFSTR("|--All Tests Passed--|"), v7, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "showTranscriptListNotAnimated");
  v8 = dispatch_time(0, 3000000000);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000EA80;
  v10[3] = &unk_100030B70;
  v9 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v9;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v10);

}

void sub_10000EA80(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void *v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversations"));

  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
    v15 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    objc_msgSend(v6, "conversationListIsDeletingConversations:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationListController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "conversationList"));
    objc_msgSend(v10, "deleteConversation:", v5);

    v11 = dispatch_time(0, 1000000000);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000EC4C;
    v13[3] = &unk_100030B70;
    v12 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v12;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedTest:withFailure:", __CurrentTestName, CFSTR("New compose message draft wasn't sent"));
  }

}

id sub_10000EC4C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, *(_QWORD *)(a1 + 40));
}

void sub_10000ECE8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_recordAllTestsPassed:resultsDictionary:", 1, v4);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v4);

}

void sub_10000EDB8(uint64_t a1)
{
  void *v2;
  id v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  const __CFString *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "composeChatController"));

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", v8, 1, v3);
  v5 = v4 & objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", v8, 0, v3);
  v6 = objc_msgSend(*(id *)(a1 + 32), "validateRecipientSelectionControllerIsFirstResponder:expected:withResultsDictionary:", v8, 1, v3);
  if ((v5 & v6) != 0)
    v7 = CFSTR(":D");
  else
    v7 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v5 & v6, CFSTR("|--All Tests Passed--|"), v7, v3);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v3);

}

id sub_10000EF48(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000EFA0;
  v4[3] = &unk_100030A30;
  v4[4] = v2;
  return objc_msgSend(v2, "_dismissPeoplePickerWithCompletion:completion:", v1, v4);
}

void sub_10000EFA0(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000F03C;
  v4[3] = &unk_100030C60;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v3, CNContactPickerViewControllerPickerDidHideNotification, 1, v4);

}

id sub_10000F03C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contactPickerDidHide");
}

void sub_10000F0BC(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F16C;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000F16C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void **v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  id v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "composeChatController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "composeRecipientSelectionController"));
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v7 = CNContactPickerViewControllerPickerDidShowNotification;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_10000F27C;
  v13 = &unk_100030C88;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v4;
  v8 = v4;
  objc_msgSend(v5, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v6, v7, 1, &v10);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toField", v10, v11, v12, v13, v14));
  objc_msgSend(v8, "composeRecipientViewRequestAddRecipient:", v9);

}

id sub_10000F27C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newComposeDismissContactPicker:", *(_QWORD *)(a1 + 40));
}

void sub_10000F300(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F3B0;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000F3B0(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "composeChatController"));

  objc_msgSend(v3, "performSelector:withObject:", "cancelButtonTapped:", 0);
  v4 = dispatch_time(0, 2000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000F480;
  v6[3] = &unk_100030B70;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);

}

void sub_10000F480(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  const __CFString *v6;
  id v7;

  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = objc_msgSend(v2, "isCollapsed") ^ 1;

  v4 = objc_msgSend(*(id *)(a1 + 32), "validateTranscriptVendingIAV:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), v3, v7);
  v5 = objc_msgSend(*(id *)(a1 + 32), "validateEntryViewIsFirstResponder:expected:withResultsDictionary:", *(_QWORD *)(a1 + 40), v3, v7);
  if ((v4 & v5) != 0)
    v6 = CFSTR(":D");
  else
    v6 = CFSTR(":(");
  objc_msgSend(*(id *)(a1 + 32), "_recordResult:forKey:comment:resultsDictionary:", v4 & v5, CFSTR("|--All Tests Passed--|"), v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v7);

}

void sub_10000F608(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "__ck_shuffledArray"));
  v3 = objc_msgSend(v2, "mutableCopy");

  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F6C0;
  v7[3] = &unk_100030CB0;
  v7[4] = v5;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "_performNextSearchWithRemainingSearches:passedSoFar:resultsDictionary:finalCompletion:", v3, 1, v6, v7);

}

id sub_10000F6C0(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_recordAllTestsPassed:resultsDictionary:", a2, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, *(_QWORD *)(a1 + 40));
}

void sub_10000F7BC(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "__ck_shuffledArray"));
  v3 = objc_msgSend(v2, "mutableCopy");

  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F874;
  v7[3] = &unk_100030CB0;
  v7[4] = v5;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "_performNextSearchResultsClearingTestWithRemainingSearches:passedSoFar:resultsDictionary:finalCompletion:", v3, 1, v6, v7);

}

id sub_10000F874(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_recordAllTestsPassed:resultsDictionary:", a2, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, *(_QWORD *)(a1 + 40));
}

void sub_10000F970(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "__ck_shuffledArray"));
  v3 = objc_msgSend(v2, "mutableCopy");

  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000FA28;
  v7[3] = &unk_100030CB0;
  v7[4] = v5;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "_performNextSearchPartialFirstWithRemainingSearches:passedSoFar:resultsDictionary:finalCompletion:", v3, 1, v6, v7);

}

id sub_10000FA28(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_recordAllTestsPassed:resultsDictionary:", a2, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, *(_QWORD *)(a1 + 40));
}

void sub_10000FB24(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "__ck_shuffledArray"));
  v3 = objc_msgSend(v2, "mutableCopy");

  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = *(void **)(a1 + 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000FC18;
  v10[3] = &unk_100030CB0;
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v4;
  v9 = v4;
  objc_msgSend(v5, "_performNextTapIntoTapOutOfTestWithRemainingSearches:startTime:passedSoFar:resultsDictionary:finalCompletion:", v3, 1, v9, v10, v8);

}

id sub_10000FC18(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_recordAllTestsPassed:resultsDictionary:", a2, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, *(_QWORD *)(a1 + 40));
}

void sub_10000FCCC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversationListController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResultsController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FD8C;
  v8[3] = &unk_100030B70;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  ck_dispatch_main_after_seconds(v8, 1.5);

}

uint64_t sub_10000FD8C(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  objc_msgSend(v2, "selectItemAtIndexPath:animated:scrollPosition:", v3, 0, 0);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000FE30;
  v5[3] = &unk_100030A30;
  v5[4] = *(_QWORD *)(a1 + 40);
  return ck_dispatch_main_after_seconds(v5, 1.5);
}

void sub_10000FE30(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MaxY;
  double v21;
  double v22;
  double v23;
  _BOOL8 v24;
  id v25;
  CGRect v26;

  v25 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chatController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chatItems"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
  v7 = objc_opt_class(CKLoadMoreChatItem);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutAttributesForItemAtIndexPath:", v10));
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v26.origin.x = v13;
    v26.origin.y = v15;
    v26.size.width = v17;
    v26.size.height = v19;
    MaxY = CGRectGetMaxY(v26);
    objc_msgSend(v9, "contentOffset");
    v22 = MaxY - v21;
    objc_msgSend(v9, "contentInset");
    v24 = v22 <= v23;

  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_recordAllTestsPassed:resultsDictionary:", v24, v25);
  objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, v25);

}

void sub_1000101E0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSIndexPath *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  char v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversationListController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResultsController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));
  v6 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", arc4random() % (uint64_t)objc_msgSend(v5, "numberOfItemsInSection:", 0), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cellForItemAtIndexPath:", v7));

  objc_msgSend(v5, "scrollToItemAtIndexPath:atScrollPosition:animated:", v7, 16, 1);
  if (v8)
    v9 = 0.0;
  else
    v9 = 2.0;
  v14[0] = _NSConcreteStackBlock;
  v14[2] = sub_1000103AC;
  v14[3] = &unk_100030D00;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v16 = v7;
  v17 = v10;
  v14[1] = 3221225472;
  v15 = v5;
  v18 = v11;
  v19 = *(id *)(a1 + 48);
  v20 = *(id *)(a1 + 56);
  v21 = *(id *)(a1 + 64);
  v23 = *(_QWORD *)(a1 + 80);
  v24 = *(_BYTE *)(a1 + 88);
  v22 = *(id *)(a1 + 72);
  v12 = v7;
  v13 = v5;
  ck_dispatch_main_after_seconds(v14, v9);

}

void sub_1000103AC(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100010494;
  v3[3] = &unk_100030CD8;
  v2 = *(void **)(a1 + 56);
  v3[4] = *(_QWORD *)(a1 + 48);
  v4 = v2;
  v5 = *(id *)(a1 + 64);
  v6 = *(id *)(a1 + 72);
  v7 = *(id *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 96);
  v10 = *(_BYTE *)(a1 + 104);
  v8 = *(id *)(a1 + 88);
  ck_dispatch_main_after_seconds(v3, 1.5);

}

void sub_100010494(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversationListController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationController"));
  v5 = objc_msgSend(v4, "popViewControllerAnimated:", 1);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000105B4;
  v7[3] = &unk_100030CD8;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 80);
  v14 = *(_BYTE *)(a1 + 88);
  v12 = *(id *)(a1 + 72);
  ck_dispatch_main_after_seconds(v7, 1.5);

}

id sub_1000105B4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messagesController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversationListController"));
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("Count")));
  v7 = objc_msgSend(v2, "validateNumberOfSearchResultsInConversationListController:searchText:expectedNumber:withResultsDictionary:", v4, v5, objc_msgSend(v6, "integerValue"), *(_QWORD *)(a1 + 56));

  if (*(_BYTE *)(a1 + 88))
    v8 = v7;
  else
    v8 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_performNextTapIntoTapOutOfTestWithRemainingSearches:startTime:passedSoFar:resultsDictionary:finalCompletion:", *(_QWORD *)(a1 + 64), v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(double *)(a1 + 80));
}

id sub_1000108A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextSearchPartialFirstWithRemainingSearches:passedSoFar:resultsDictionary:finalCompletion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void sub_1000108B8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  char v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100010980;
  v6[3] = &unk_100030D50;
  v6[4] = v2;
  v7 = *(id *)(a1 + 64);
  v10 = *(_BYTE *)(a1 + 80);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v2, "_searchForString:validateExpectedSearchResults:resultsDictionary:completion:", v3, v4, v5, v6);

}

id sub_100010980(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 64))
    v2 = a2;
  else
    v2 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_performNextSearchPartialFirstWithRemainingSearches:passedSoFar:resultsDictionary:finalCompletion:", *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void sub_100010B1C(uint64_t a1, char a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  char v11;
  char v12;

  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  v4 = *(void **)(a1 + 48);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "stringByAppendingString:", CFSTR(" Great Googly Moogly!")));
  v6 = *(_QWORD *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010C18;
  v7[3] = &unk_100030DA0;
  v7[4] = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 80);
  v12 = a2;
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  objc_msgSend(v4, "_searchForString:validateExpectedSearchResults:resultsDictionary:completion:", v5, &off_100034DE8, v6, v7);

}

id sub_100010C18(uint64_t a1, unsigned int a2)
{
  void *v3;
  uint64_t v4;

  v3 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
  {
    if (*(_BYTE *)(a1 + 65))
      v4 = a2;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  return objc_msgSend(v3, "_performNextSearchResultsClearingTestWithRemainingSearches:passedSoFar:resultsDictionary:finalCompletion:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void sub_100010DC8(uint64_t a1, char a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  char v11;
  char v12;

  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  v4 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010EA0;
  v7[3] = &unk_100030DA0;
  v7[4] = v4;
  v8 = *(id *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 80);
  v12 = a2;
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  objc_msgSend(v4, "_clearSearchStringWithPreviousSearchText:resultsDictionary:completion:", v5, v6, v7);

}

id sub_100010EA0(uint64_t a1, unsigned int a2)
{
  void *v3;
  uint64_t v4;

  v3 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
  {
    if (*(_BYTE *)(a1 + 65))
      v4 = a2;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  return objc_msgSend(v3, "_performNextSearchWithRemainingSearches:passedSoFar:resultsDictionary:finalCompletion:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void sub_100010FF4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000110A0;
  v5[3] = &unk_100030DF0;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  ck_dispatch_main_after_seconds(v5, 0.5);

}

uint64_t sub_1000110A0(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Count")));
  v3 = objc_msgSend(v2, "integerValue");

  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messagesController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationListController"));
  objc_msgSend(v4, "validateNumberOfSearchResultsInConversationListController:searchText:expectedNumber:withResultsDictionary:", v6, *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 56));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void sub_1000112B4(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100011350;
  v3[3] = &unk_100030E18;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  ck_dispatch_main_after_seconds(v3, 0.5);

}

uint64_t sub_100011350(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)a1[4];
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messagesController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "conversationListController"));
  objc_msgSend(v2, "validateAtConversationListInConversationListController:previousSearchText:withResultsDictionary:", v4, a1[5], a1[6]);

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void sub_1000122C8(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showNewMessageCompositionPanelWithRecipients:composition:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012360;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100012360(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  dispatch_time_t v5;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "composeChatController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryView"));
  objc_msgSend(v4, "touchUpInsideSendButton:", 0);

  v5 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001241C;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10001241C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, 0);
}

void sub_100012560(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD block[5];

  if (objc_msgSend(*(id *)(a1 + 32), "isMuted"))
  {
    objc_msgSend(*(id *)(a1 + 32), "unmute");
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v3 = objc_alloc_init((Class)NSDateComponents);
    objc_msgSend(v3, "setHour:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v3, v2, 0));

    objc_msgSend(*(id *)(a1 + 32), "setMutedUntilDate:", v5);
  }
  v6 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012674;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100012674(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, 0);
}

id sub_10001282C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, 0);
}

id sub_100012ACC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("Open Message Responsiveness"), __CurrentTestName);
}

void sub_100012AE8(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversationListController"));
  objc_msgSend(v1, "endHoldingConversationListUpdatesForPPTTests");

}

uint64_t sub_100012D2C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100012DB8(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("ShowPeoplePicker"), __CurrentTestName);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100012E4C;
  v3[3] = &unk_100030B70;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

}

void sub_100012E4C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;

  if (dword_10003AE60 < 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ppt_chatController"));
    objc_msgSend(v5, "performSelector:withObject:", "cancelButtonTapped:", 0);

    v6 = *(void **)(a1 + 32);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100013010;
    v7[3] = &unk_100030A30;
    v7[4] = v6;
    objc_msgSend(v6, "installCACommitCompletionBlock:", v7);
  }
  else
  {
    --dword_10003AE60;
    v3 = *(void **)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100012F54;
    v8[3] = &unk_100030B70;
    v8[4] = v3;
    v9 = v2;
    objc_msgSend(v3, "_dismissPeoplePickerWithCompletion:completion:", v9, v8);

  }
}

void sub_100012F54(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v4 = CNContactPickerViewControllerPickerDidHideNotification;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013004;
  v6[3] = &unk_100030C88;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v3, v4, 1, v6);

}

id sub_100013004(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showPeoplePickerTest:", *(_QWORD *)(a1 + 40));
}

id sub_100013010(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:", __CurrentTestName);
}

void sub_100013074(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("ShowPeoplePicker"), __CurrentTestName);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ppt_chatController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "composeRecipientSelectionController"));
  v5 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013134;
  v6[3] = &unk_100030A30;
  v6[4] = v5;
  objc_msgSend(v5, "_dismissPeoplePickerWithCompletion:completion:", v4, v6);

}

id sub_100013134(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100013188;
  v3[3] = &unk_100030A30;
  v3[4] = v1;
  return objc_msgSend(v1, "installCACommitCompletionBlock:", v3);
}

id sub_100013188(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ppt_chatController"));
  objc_msgSend(v3, "performSelector:withObject:", "cancelButtonTapped:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:", __CurrentTestName);
}

id sub_1000132E0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tearDownShowPeoplePickerTest:", *(_QWORD *)(a1 + 40));
}

id sub_100013414(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startPeoplePickerTest");
}

void sub_10001346C(uint64_t a1)
{
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("SelectContact"), __CurrentTestName);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000134F0;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1000134F0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (dword_10003AE60 < 1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ppt_chatController"));
    objc_msgSend(v3, "cancelButtonTapped");

    v4 = *(void **)(a1 + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000135AC;
    v6[3] = &unk_100030A30;
    v6[4] = v4;
    return objc_msgSend(v4, "installCACommitCompletionBlock:", v6);
  }
  else
  {
    --dword_10003AE60;
    return objc_msgSend(*(id *)(a1 + 32), "_startSelectContactPeoplePickerTest");
  }
}

id sub_1000135AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:", __CurrentTestName);
}

void sub_1000138C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000138F0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  __int128 v12;
  uint64_t v13;

  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phoneNumbers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000139A4;
  v9[3] = &unk_100030E68;
  v10 = *(id *)(a1 + 32);
  v11 = v6;
  v12 = *(_OWORD *)(a1 + 40);
  v13 = a4;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void sub_1000139A4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    **(_BYTE **)(a1 + 64) = 1;
    *a4 = 1;
  }

}

id sub_100013BA8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_selectContact:", *(_QWORD *)(a1 + 40));
}

id sub_100013BB4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tearDownSelectContactPeoplePickerTest");
}

void sub_100013C80(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013CF8;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100013CF8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSelectContactPeoplePickerTest");
}

void sub_100013D50(uint64_t a1)
{
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("CancelPeoplePicker"), __CurrentTestName);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013DD4;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100013DD4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (dword_10003AE60 < 1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ppt_chatController"));
    objc_msgSend(v3, "performSelector:withObject:", "cancelButtonTapped:", 0);

    v4 = *(void **)(a1 + 32);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100013E9C;
    v6[3] = &unk_100030A30;
    v6[4] = v4;
    return objc_msgSend(v4, "installCACommitCompletionBlock:", v6);
  }
  else
  {
    --dword_10003AE60;
    return objc_msgSend(*(id *)(a1 + 32), "_startCancelPeoplePickerTest");
  }
}

id sub_100013E9C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:", __CurrentTestName);
}

id sub_1000140B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelPeoplePicker");
}

id sub_1000140B8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tearDownCancelPeoplePickerTest");
}

id sub_100014184(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startCancelPeoplePickerTest");
}

uint64_t sub_10001427C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1000145D4(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  v2 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014678;
  block[3] = &unk_100030A58;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_100014678(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startedTest:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "typeInContactName:", *(_QWORD *)(a1 + 48));
}

id sub_1000146A8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:", *(_QWORD *)(a1 + 40));
}

void sub_1000148E8(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = dispatch_time(0, 500000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014978;
  v4[3] = &unk_100030B70;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);

}

id sub_100014978(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "typeInContactName:", *(_QWORD *)(a1 + 40));
}

id sub_100014984(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isSearchResultsHidden") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "startedTest:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "scrollPseudoContacts");
}

void sub_100014AF0(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = dispatch_time(0, 500000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014B80;
  v4[3] = &unk_100030B70;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);

}

id sub_100014B80(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  return objc_msgSend(*(id *)(a1 + 32), "_resolveContactTest:", *(_QWORD *)(a1 + 40));
}

id sub_100014BB4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:", __CurrentTestName);
}

void sub_100014D08(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "_keyboardDidShow:", UIKeyboardDidShowNotification, 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "didShowNewCompose", CFSTR("PPTDidShowNewComposeEvent"), 0);

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v4, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);

}

void sub_100014EAC(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "showTranscriptListNotAnimated");
  v2 = dispatch_time(0, 1000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100014F2C;
  v3[3] = &unk_100030BC0;
  v4 = *(_OWORD *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_100014F2C(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  uint64_t v5;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

  v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014FF8;
  block[3] = &unk_100030EE0;
  v5 = *(_QWORD *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100014FF8(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  uint64_t v4;
  _QWORD v5[6];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v3 = dispatch_time(0, 1000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015094;
  v5[3] = &unk_100030B98;
  v4 = *(_QWORD *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = v4;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_100015094(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  __int128 v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chatController"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "showKeyboard");
  v6 = dispatch_time(0, 1000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015144;
  v7[3] = &unk_100030B98;
  v8 = *(_OWORD *)(a1 + 32);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
}

void sub_100015144(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "entryView"));
  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  objc_msgSend(v5, "startRecordingForRaiseGesture");
  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waveformView"));
  objc_msgSend(v3, "_recordResult:forKey:comment:resultsDictionary:", v4 == 0, CFSTR("Photo is zoomed"), 0, v2);

  objc_msgSend(*(id *)(a1 + 32), "finishedTest:", __CurrentTestName);
}

void sub_1000152DC(id *a1)
{
  id v2;
  _QWORD v3[5];
  id v4;

  objc_msgSend(a1[4], "startedSubTest:forTest:withMetrics:", CFSTR("SendAnimation-FPS"), __CurrentTestName, &off_100034E50);
  objc_msgSend(a1[5], "touchUpInsideSendButton:", 0);
  v2 = a1[4];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100015384;
  v3[3] = &unk_100030F08;
  v3[4] = v2;
  v4 = a1[6];
  objc_msgSend(v2, "installCACommitCompletionBlock:", v3);

}

void sub_100015384(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000153F4;
  v2[3] = &unk_100030F08;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "installCACommitCompletionBlock:", v2);

}

void sub_1000153F4(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100015464;
  v2[3] = &unk_100030F08;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "installCACommitCompletionBlock:", v2);

}

void sub_100015464(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000154D4;
  v2[3] = &unk_100030F08;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "installCACommitCompletionBlock:", v2);

}

uint64_t sub_1000154D4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("SendAnimation-FPS"), __CurrentTestName);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1000155EC(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "showTranscriptListNotAnimated");
  v2 = dispatch_time(0, 1000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001566C;
  v3[3] = &unk_100030BC0;
  v4 = *(_OWORD *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_10001566C(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  uint64_t v5;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversationForExistingChatWithChatIdentifier:", CFSTR("chat339741476857344860")));

  v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015738;
  block[3] = &unk_100030EE0;
  v5 = *(_QWORD *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100015738(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  id v4;
  __int128 v5;
  _QWORD block[5];
  __int128 v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000157F8;
  block[3] = &unk_100030F58;
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_1000157F8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chatController"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = objc_msgSend(objc_alloc((Class)CKDetailsControllerAdapter), "initWithConversation:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "detailsController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "navigationController"));
  objc_msgSend(v8, "pushViewController:animated:", v7, 1);

  v9 = dispatch_time(0, 1000000000);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100015914;
  v11[3] = &unk_100030B70;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v10 = v7;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v11);

}

void sub_100015914(uint64_t a1)
{
  id v2;
  dispatch_time_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  if (objc_msgSend(__CurrentTestName, "rangeOfString:", CFSTR("DetailsViewScrollingPerfTest")) == (id)0x7FFFFFFFFFFFFFFFLL)
    NSLog(CFSTR("Unrecognized TranscriptManagement test found"));
  else
    objc_msgSend(*(id *)(a1 + 32), "_detailsViewScrollingPerfTest:", *(_QWORD *)(a1 + 40));
  v2 = objc_alloc_init((Class)NSDictionary);
  v3 = dispatch_time(0, 5000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015A0C;
  v5[3] = &unk_100030B70;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v4 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);

}

id sub_100015A0C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, *(_QWORD *)(a1 + 40));
}

void sub_100015C54(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD v4[5];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showNewMessageCompositionPanelWithRecipients:composition:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

  v3 = dispatch_time(0, 2000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015D08;
  v4[3] = &unk_100030B70;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);

}

void sub_100015D08(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "composeChatController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryView"));
  objc_msgSend(v4, "touchUpInsideSendButton:", 0);
  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chatController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryView"));
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100015E08;
  v10[3] = &unk_100030A30;
  v10[4] = v8;
  objc_msgSend(v8, "sendMultipleMessagesEntryView:composition:handler:", v7, v9, v10);

}

void sub_100015E08(uint64_t a1)
{
  id v2;
  dispatch_time_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = dispatch_time(0, 2000000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015EB4;
  v5[3] = &unk_100030B70;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v4 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_100015EB4(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "showTranscriptListNotAnimated");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conversations"));

  if (v3)
  {
    qword_10003AE88 = (uint64_t)objc_msgSend(v3, "count");
    v4 = dispatch_time(0, 500000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100015F90;
    v6[3] = &unk_100030B70;
    v5 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);

  }
}

void sub_100015F90(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, objc_msgSend(v2, "mapSectionIdentifierForCurrentConversationListClass:", 6)));
  objc_msgSend(v2, "deleteChat:", v3);

  v4 = dispatch_time(0, 2000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016068;
  v6[3] = &unk_100030B70;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);

}

id sub_100016068(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, *(_QWORD *)(a1 + 40));
}

void sub_10001644C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

}

void sub_1000164F4(id a1)
{
  (*(void (**)(void))(qword_10003AE68 + 16))();
}

void sub_100016788(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

}

id sub_10001687C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, 0);
}

void sub_100016A28(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

}

id sub_100016B58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
}

id sub_100017070(id *a1)
{
  void *v2;

  objc_msgSend(a1[4], "invalidate");
  objc_msgSend(a1[5], "setHidden:", 1);
  v2 = (void *)qword_10003AE90;
  qword_10003AE90 = 0;

  xmmword_10003AEA0 = (__int128)CGPointZero;
  return objc_msgSend(a1[6], "finishedTest:extraResults:", __CurrentTestName, 0);
}

void sub_100017314(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "_chatControllerWillRotate:", kPPTChatControllerWillRotateNotification, 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "_chatControllerDidRotate:", kPPTChatControllerDidRotateNotification, 0);
  objc_msgSend(UIApp, "rotateIfNeeded:", 3);

}

void sub_1000173A8(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017454;
  block[3] = &unk_100030E40;
  v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_100017454(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_1000174D4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
}

void sub_100017728(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  dispatch_time_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chatController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "entryView"));
  objc_msgSend(v4, "performSelector:withObject:", "audioReplyButtonStart:", 0);

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v5 = dispatch_time(0, 10000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100017820;
  v8[3] = &unk_100030B70;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v8);

}

id sub_100017820(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "entryView"));
  objc_msgSend(v2, "performSelector:withObject:", "audioReplyButtonStop:", 0);

  return objc_msgSend(*(id *)(a1 + 40), "finishedTest:extraResults:", __CurrentTestName, 0);
}

void sub_100017874(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017920;
  block[3] = &unk_100030E40;
  v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_100017920(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100017AE8(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017B78;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100017B78(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, 0);
}

void sub_100017B90(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017C3C;
  block[3] = &unk_100030E40;
  v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_100017C3C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100017E04(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  v2 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017E94;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100017E94(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:extraResults:", __CurrentTestName, 0);
}

void sub_100017EAC(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v3 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017F5C;
  block[3] = &unk_100030E40;
  v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_100017F5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100018154(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "_keyboardWillShow:", UIKeyboardRenderDidFinishNotification, 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "_keyboardDidShow:", UIKeyboardDidShowNotification, 0);
  objc_msgSend(*(id *)(a1 + 32), "showKeyboard");

}

void sub_1000181DC(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018288;
  block[3] = &unk_100030E40;
  v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_100018288(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100018480(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "_keyboardDidShow:", UIKeyboardDidShowNotification, 0);
  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  objc_msgSend(*(id *)(a1 + 32), "showKeyboard");

}

void sub_1000184F8(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000185A4;
  block[3] = &unk_100030E40;
  v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_1000185A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100018854(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  dispatch_time_t v18;
  void *v19;
  _QWORD block[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chatController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionView"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleCells"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v6)
  {

    v15 = 0;
    goto LABEL_17;
  }
  v19 = v4;
  v7 = *(_QWORD *)v22;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v22 != v7)
      objc_enumerationMutation(v5);
    v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
    v10 = objc_opt_class(CKTranscriptBalloonCell);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
      goto LABEL_9;
    v11 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "balloonView"));
    v13 = objc_opt_class(CKImageBalloonView);
    isKindOfClass = objc_opt_isKindOfClass(v12, v13);

    if ((isKindOfClass & 1) != 0)
      break;

LABEL_9:
    if (v6 == (id)++v8)
    {
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
        goto LABEL_3;

      v15 = 0;
      goto LABEL_16;
    }
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "balloonView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "chatItemForCell:", v11));

  if (!v6)
  {
LABEL_16:
    v4 = v19;
    goto LABEL_17;
  }
  v4 = v19;
  if (v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewController"));
    objc_msgSend(v3, "transcriptCollectionViewController:balloonView:tappedForChatItem:", v17, v6, v15);

    v18 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018AE0;
    block[3] = &unk_100030A30;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, block);
  }
LABEL_17:

}

id sub_100018AE0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedTest:", __CurrentTestName);
}

void sub_100018AF4(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018BA0;
  block[3] = &unk_100030E40;
  v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_100018BA0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100018F84(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isNewConversationList");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messagesController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversationListController"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));
  }
  else
  {
    if (!objc_msgSend(v3, "isOldConversationList"))
      return;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conversationListController"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  }
  v13 = (id)v6;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("recapBased")));
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8 && objc_msgSend(sub_100008914(), "isRecapAvailable"))
  {
    v9 = objc_msgSend(objc_alloc((Class)sub_1000089CC()), "initWithTestName:scrollView:completionHandler:", __CurrentTestName, v13, 0);
    objc_msgSend(sub_100008914(), "runTestWithParameters:", v9);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10003AE50, "objectForKey:", CFSTR("offset")));
    dword_10003AE74 = objc_msgSend(v10, "intValue");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("length")));
    v12 = objc_msgSend(v11, "intValue");

    objc_msgSend(v13, "_performScrollTest:iterations:delta:length:", __CurrentTestName, dword_10003AE60, dword_10003AE74, v12);
  }

}

id sub_100019408(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startedTest:", __CurrentTestName);
  return objc_msgSend(*(id *)(a1 + 32), "failedTest:", __CurrentTestName);
}

void sub_100019440(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  dispatch_time_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chatController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "inputController"));
  objc_msgSend(v4, "showPhotosBrowser");
  v5 = dispatch_time(0, 2000000000);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001953C;
  v10[3] = &unk_100030FA0;
  v11 = v4;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v14 = v6;
  v12 = v7;
  v13 = v8;
  v9 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v10);

}

void sub_10001953C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  float v14;
  float v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentInputViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewController"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subviews"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
      v11 = objc_opt_class(UIScrollView);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v10;

    if (!v12)
      goto LABEL_12;
    objc_msgSend(*(id *)(a1 + 40), "startedTest:", __CurrentTestName);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKey:", CFSTR("offset")));
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    objc_msgSend(v12, "_performScrollTest:iterations:delta:scrollAxis:", __CurrentTestName, dword_10003AE60, (int)v15, 1);
  }
  else
  {
LABEL_9:

LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_10001970C(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v3 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000197A0;
  v4[3] = &unk_100030E40;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "installCACommitCompletionBlock:", v4);

}

uint64_t sub_1000197A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001986C(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  char v10;
  char v11;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100019900;
  v6[3] = &unk_100030FF0;
  v10 = a2;
  v3 = *(id *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

void sub_100019900(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  if (*(_BYTE *)(a1 + 56))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("extensionIdentifier")));
    if (*(_BYTE *)(a1 + 57))
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("supportsLaunchSubtest")));
      v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("YES"));

    }
    else
    {
      v3 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "showMessagesApplicationAndStartTestForIdentifier:supportsLaunchSubtest:", v4, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "startAndFailTestNamed:withFailure:", __CurrentTestName, CFSTR("Failed to enter conversation with chat identifier %@"), *(_QWORD *)(a1 + 48));
  }
}

void sub_10001A73C(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "_willConfigureCellWithTranscriptPluginChatItem:", CKPPTWillConfigureCellWithTranscriptPluginChatItemNotification, 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v3, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v4 = dispatch_time(0, 4000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A80C;
  block[3] = &unk_100030A30;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10001A80C(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  id v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "chatController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionViewController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionView"));

  objc_msgSend(v6, "contentInset");
  objc_msgSend(v6, "setContentOffset:", v5, v4);

}

void sub_10001AA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001ACD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_10001ACFC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v8 = v3;
    if (*(_BYTE *)(a1 + 56))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = 0;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = v8;
  }

}

void sub_10001AF28(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "messagesController"));
  objc_msgSend(v2, "showConversation:animate:", *(_QWORD *)(a1 + 40), 0);

  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AFD4;
  block[3] = &unk_100030E40;
  v5 = *(id *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_10001AFD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

Class sub_10001B0B8(uint64_t a1)
{
  Class result;

  sub_10001B10C();
  result = objc_getClass("RPTTestRunner");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_10001F790();
  qword_10003AEB0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10001B10C()
{
  void *v0;
  __int128 v1;
  uint64_t v2;

  v0 = 0;
  if (!qword_10003AEB8)
  {
    v1 = off_100031088;
    v2 = 0;
    qword_10003AEB8 = _sl_dlopen(&v1, &v0);
  }
  if (!qword_10003AEB8)
    sub_10001F808(&v0);
  if (v0)
    free(v0);
}

Class sub_10001B1B0(uint64_t a1)
{
  Class result;

  sub_10001B10C();
  result = objc_getClass("RPTScrollViewTestParameters");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_10001F884();
  qword_10003AEC0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10001B204(id a1)
{
  qword_10003AEC8 = IMWeakLinkClass(CFSTR("LSPlugInKitProxy"), CFSTR("CoreServices"));
}

Class sub_10001B230(uint64_t a1)
{
  Class result;

  sub_10001B10C();
  result = objc_getClass("RPTResizeTestParameters");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_10001F8FC();
  qword_10003AED8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10001B720(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Messages", "SMSApplicationDelegate");
  v2 = (void *)qword_10003AEE0;
  qword_10003AEE0 = (uint64_t)v1;

}

void sub_10001C294(id a1)
{
  void *v1;
  void *v2;
  dispatch_time_t v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"));
  objc_msgSend(v1, "_setDefaultNumberOfMessagesToLoad:", objc_msgSend(v2, "defaultConversationViewingMessageCount"));

  v3 = dispatch_time(0, 5000000000);
  global_queue = dispatch_get_global_queue(9, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_after(v3, v5, &stru_100031100);

}

void sub_10001C338(id a1)
{
  IMWeakLinkClass(CFSTR("FMFSession"), CFSTR("FMF"));
  +[IMChat _initializeFindMyController](IMChat, "_initializeFindMyController");
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100031120);
}

void sub_10001C378(id a1)
{
  void *v1;
  id v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[FTCServiceAvailabilityCenter sharedInstance](FTCServiceAvailabilityCenter, "sharedInstance"));
  objc_msgSend(v1, "addListenerID:forService:", CFSTR("SMSApplication"), 0);

  v2 = +[IMNicknameController sharedInstance](IMNicknameController, "sharedInstance");
}

void sub_10001C3CC(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance"));
  objc_msgSend(v1, "startMonitor");

}

void sub_10001C400(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kHasSetupHashtagImages"));

  if ((v3 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v4))
    {
      v5 = OSLogHandleForIMFoundationCategory("SMSApplication");
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Calling into CoreParsec to load their bag", buf, 2u);
      }

    }
    v7 = (void *)IMWeakLinkClass(CFSTR("PARSession"), CFSTR("CoreParsec"));
    v8 = objc_msgSend((id)IMWeakLinkClass(CFSTR("PARSessionConfiguration"), CFSTR("CoreParsec")), "defaultSessionConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sessionWithConfiguration:", v9));

    objc_msgSend(v10, "setDelegate:", *(_QWORD *)(a1 + 32));
  }
  v11 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
  v16 = 0;
  v12 = objc_msgSend(v11, "addMessagesFileProviderDomain:", &v16);
  v13 = v16;
  if (v13)
  {
    v14 = IMLogHandleForCategory("SMSApplication");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10001F974(v13, v15);

  }
}

id sub_10001C9E0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playMessageReceivedForMessage:inChat:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10001CAFC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "soundHelper"));
  objc_msgSend(v2, "playSendSoundForMessage:", *(_QWORD *)(a1 + 40));

}

void sub_10001CDFC(id a1, UIAlertAction *a2)
{
  UIAlertAction *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)qword_10003AF00;
  v11 = qword_10003AF00;
  if (!qword_10003AF00)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001E644;
    v7[3] = &unk_100031068;
    v7[4] = &v8;
    sub_10001E644((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultWorkspace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:")));
  objc_msgSend(v5, "openSensitiveURL:withOptions:", v6, 0);

}

void sub_10001CEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001DE78(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001DE88(uint64_t a1)
{

}

id sub_10001DE90(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  v2 = objc_msgSend(objc_alloc((Class)NSFileProviderDomain), "initWithIdentifier:displayName:pathRelativeToDocumentStorage:", CFSTR("MessagesAttachments"), CFSTR("Messages"), CFSTR("MessagesAttachments"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001DF38;
  v8[3] = &unk_1000311A8;
  v8[4] = v5;
  return +[NSFileProviderManager addDomain:completionHandler:](NSFileProviderManager, "addDomain:completionHandler:", v6, v8);
}

void sub_10001DF38(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (IMOSLoggingEnabled(v5))
  {
    v6 = OSLogHandleForIMFoundationCategory("SMSApplication");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "debugDescription"));
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "In addDomain completion block. Error: %@", (uint8_t *)&v9, 0xCu);

    }
  }

}

Class sub_10001E644(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_10003AF08)
  {
    v4 = off_1000311F0;
    v5 = 0;
    qword_10003AF08 = _sl_dlopen(&v4, &v3);
  }
  if (!qword_10003AF08)
    sub_10001FA0C(&v3);
  if (v3)
    free(v3);
  result = objc_getClass("LSApplicationWorkspace");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_10001FA88();
  qword_10003AF00 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

char *sub_10001E720()
{
  char *v0;
  char *v1;
  int *v2;
  char *v3;

  v0 = (char *)malloc_type_calloc(1uLL, 0xA0uLL, 0x10200401F787ECFuLL);
  v1 = v0;
  if (v0)
  {
    *v0 = 0;
    pthread_mutex_init((pthread_mutex_t *)(v0 + 16), 0);
    if (pthread_create((pthread_t *)v1 + 1, 0, (void *(__cdecl *)(void *))sub_10001E7E4, v1) < 0)
    {
      v2 = __error();
      v3 = strerror(*v2);
      NSLog(CFSTR("pthread_create failed, %s"), v3);
      pthread_mutex_destroy((pthread_mutex_t *)(v1 + 16));
      free(v1);
      return 0;
    }
  }
  else
  {
    NSLog(CFSTR("out of memory"));
  }
  return v1;
}

uint64_t sub_10001E7E4(unsigned __int8 *a1)
{
  uint64_t v2;
  pthread_mutex_t *v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unint64_t v8;
  pthread_mutex_t *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD *v15;
  unint64_t v16;
  int v17;
  unsigned __int8 *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD v23[2];
  __int128 v24;

  v2 = getpid();
  sub_10001ED44(v2, (uint64_t)(a1 + 80));
  v3 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v4 = *a1;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  v20 = v2;
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = -1;
    goto LABEL_32;
  }
  v7 = 0;
  v6 = 0;
  v5 = 0;
  v21 = (int)v2;
  v19 = a1;
  v8 = -1;
  while (1)
  {
    usleep(0x2710u);
    v24 = 0u;
    memset(v23, 0, sizeof(v23));
    if ((ledger(0, v21, v23, 0) & 0x80000000) != 0)
    {
      NSLog(CFSTR("getMemoryFootPrint, ledger fails: %u"), v20);
      goto LABEL_32;
    }
    v9 = v3;
    v22 = *((_QWORD *)&v24 + 1);
    v10 = malloc_type_malloc(96 * *((_QWORD *)&v24 + 1), 0x1000040565EDBD2uLL);
    if (!v10)
    {
      NSLog(CFSTR("getMemoryFootPrintIndex: out of memory"));
LABEL_27:
      NSLog(CFSTR("getMemoryFootPrintIndex failed: %u"), v20);
      goto LABEL_32;
    }
    v11 = v10;
    if ((ledger(2, v10, &v22, 0) & 0x80000000) != 0)
    {
      free(v11);
      goto LABEL_27;
    }
    v12 = v22;
    if (v22 < 1)
    {
      v13 = 0;
    }
    else
    {
      v13 = 0;
      v14 = (const char *)v11;
      while (strcmp(v14, "phys_footprint"))
      {
        ++v13;
        v14 += 96;
        if (v12 == v13)
        {
          free(v11);
          a1 = v19;
          goto LABEL_15;
        }
      }
      a1 = v19;
    }
    free(v11);
    v12 = v13;
LABEL_15:
    v15 = malloc_type_malloc(56 * *((_QWORD *)&v24 + 1), 0xAC4DD482uLL);
    if ((ledger(1, v21, v15, (char *)&v24 + 8) & 0x80000000) != 0)
    {
      NSLog(CFSTR("getMemoryFootPrintIndex, ledger failed: %u"), v20);
      goto LABEL_31;
    }
    if (v12 >= *((uint64_t *)&v24 + 1))
      break;
    v16 = v15[7 * v12];
    free(v15);
    if (v16 != -1)
    {
      if (v8 >= v16)
        v8 = v16;
      if (v5 <= v16)
        v5 = v16;
      v6 += v16;
      ++v7;
      v3 = v9;
      pthread_mutex_lock(v9);
      v17 = *a1;
      pthread_mutex_unlock(v9);
      if (!v17)
        continue;
    }
    goto LABEL_32;
  }
  NSLog(CFSTR("getMemoryFootPrintIndex, bad index: %lld %lld"), v12, *((_QWORD *)&v24 + 1));
LABEL_31:
  free(v15);
LABEL_32:
  sub_10001ED44(v20, (uint64_t)(a1 + 104));
  *((_QWORD *)a1 + 16) = v8;
  *((_QWORD *)a1 + 17) = v5;
  *((_DWORD *)a1 + 38) = v7;
  if (v7)
    *((_QWORD *)a1 + 18) = v6 / v7;
  return 0;
}

uint64_t sub_10001EAC8(uint64_t result, _OWORD *a2, uint64_t *a3)
{
  _BYTE *v5;
  pthread_mutex_t *v6;
  int *v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  pid_t v12;
  FILE *v13;
  FILE *v14;
  char *v15;
  char *v16;
  char *v17;
  const char *v18;
  char *v19;
  int *v20;
  char *v21;
  char __s2[16];
  char __s1[1024];
  char __str[16];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  if (result)
  {
    v5 = (_BYTE *)result;
    v6 = (pthread_mutex_t *)(result + 16);
    pthread_mutex_lock((pthread_mutex_t *)(result + 16));
    *v5 = 1;
    pthread_mutex_unlock(v6);
    if (pthread_join(*((pthread_t *)v5 + 1), 0))
    {
      v7 = __error();
      v8 = strerror(*v7);
      NSLog(CFSTR("pthread_join failed, %s"), v8);
      pthread_mutex_destroy(v6);
      free(v5);
      return 0;
    }
    if (a2)
    {
      *a2 = *((_OWORD *)v5 + 5);
      v9 = *((_OWORD *)v5 + 6);
      v10 = *((_OWORD *)v5 + 7);
      v11 = *((_OWORD *)v5 + 9);
      a2[3] = *((_OWORD *)v5 + 8);
      a2[4] = v11;
      a2[1] = v9;
      a2[2] = v10;
    }
    if (!a3)
      goto LABEL_16;
    v39 = 0u;
    v38 = 0u;
    v37 = 0u;
    v36 = 0u;
    v35 = 0u;
    v34 = 0u;
    v33 = 0u;
    v32 = 0u;
    v31 = 0u;
    v30 = 0u;
    v29 = 0u;
    v28 = 0u;
    v27 = 0u;
    v26 = 0u;
    v25 = 0u;
    *(_OWORD *)__str = 0u;
    bzero(__s1, 0x400uLL);
    v12 = getpid();
    strcpy(__s2, " leaks for ");
    snprintf(__str, 0x100uLL, "leaks %u 2>&1 | grep \"Process %u:\" | grep \"%s\"", v12, v12, __s2);
    v13 = popen(__str, "r");
    if (v13)
    {
      v14 = v13;
      if (fgets(__s1, 1024, v13))
      {
        pclose(v14);
        v15 = strstr(__s1, ": ");
        if (v15)
        {
          v16 = v15;
          v17 = strstr(__s1, __s2);
          if (v17)
          {
            *v17 = 0;
            v18 = v17 + 11;
            v19 = strchr(v17 + 11, 32);
            if (v19)
            {
              *v19 = 0;
              *a3 = strtoll(v16 + 2, 0, 10);
              a3[1] = strtoll(v18, 0, 10);
LABEL_16:
              pthread_mutex_destroy(v6);
              free(v5);
              return 1;
            }
          }
        }
      }
      else
      {
        NSLog(CFSTR("getLeaks, no leak information"));
        pclose(v14);
      }
    }
    else
    {
      v20 = __error();
      v21 = strerror(*v20);
      NSLog(CFSTR("getLeaks, popen failed: [%s], %s"), __str, v21);
    }
    NSLog(CFSTR("getLeaks failed"));
    *a3 = 0;
    a3[1] = 0;
    goto LABEL_16;
  }
  return result;
}

void sub_10001ED44(uint64_t a1, uint64_t a2)
{
  int *v4;
  char *v5;
  __int128 buffer;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  buffer = 0u;
  v7 = 0u;
  if (proc_pidinfo(a1, 4, 0, &buffer, 96) == 96)
  {
    *(_DWORD *)a2 = v11;
    *(_OWORD *)(a2 + 8) = v7;
  }
  else
  {
    v4 = __error();
    v5 = strerror(*v4);
    NSLog(CFSTR("getCPUCounter, proc_pidinfo failed: %u, %s"), a1, v5);
  }
}

void sub_10001EE20(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", IMServiceNameiMessage));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", IMServiceNameSMS));
  v4 = objc_alloc((Class)CKIMSimulatedChat);
  v47 = a1[4];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
  v6 = objc_msgSend(v4, "initWithIncomingIDs:outgoingID:messageIDOffset:service:", v5, a1[5], 100000, v2);
  v7 = (void *)qword_10003AF10;
  qword_10003AF10 = (uint64_t)v6;

  v8 = objc_alloc((Class)CKIMSimulatedChat);
  v46 = a1[5];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
  v10 = objc_msgSend(v8, "initWithIncomingIDs:outgoingID:messageIDOffset:service:", v9, a1[4], 1, v2);
  v11 = (void *)qword_10003AF18;
  qword_10003AF18 = (uint64_t)v10;

  v12 = objc_alloc((Class)CKIMSimulatedChat);
  v45 = a1[6];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
  v14 = objc_msgSend(v12, "initWithIncomingIDs:outgoingID:messageIDOffset:service:", v13, a1[7], 300000, v2);
  v15 = (void *)qword_10003AF20;
  qword_10003AF20 = (uint64_t)v14;

  v16 = objc_alloc((Class)CKIMSimulatedChat);
  v44 = a1[7];
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
  v18 = objc_msgSend(v16, "initWithIncomingIDs:outgoingID:messageIDOffset:service:", v17, a1[6], 200001, v2);
  v19 = (void *)qword_10003AF28;
  qword_10003AF28 = (uint64_t)v18;

  v20 = objc_alloc((Class)CKIMSimulatedChat);
  v21 = a1[7];
  v43[0] = a1[6];
  v43[1] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 2));
  v23 = objc_msgSend(v20, "initWithIncomingIDs:outgoingID:messageIDOffset:service:", v22, a1[4], 500000, v2);
  v24 = (void *)qword_10003AF30;
  qword_10003AF30 = (uint64_t)v23;

  v25 = objc_alloc((Class)CKIMSimulatedChat);
  v26 = a1[7];
  v42[0] = a1[4];
  v42[1] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 2));
  v28 = objc_msgSend(v25, "initWithIncomingIDs:outgoingID:messageIDOffset:service:", v27, a1[6], 400001, v2);
  v29 = (void *)qword_10003AF38;
  qword_10003AF38 = (uint64_t)v28;

  v30 = objc_alloc((Class)CKIMSimulatedChat);
  v31 = a1[5];
  v41[0] = a1[4];
  v41[1] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 2));
  v33 = objc_msgSend(v30, "initWithIncomingIDs:outgoingID:messageIDOffset:service:", v32, a1[8], 700000, v3);
  v34 = (void *)qword_10003AF40;
  qword_10003AF40 = (uint64_t)v33;

  v35 = objc_alloc((Class)CKIMSimulatedChat);
  v36 = a1[8];
  v40[0] = a1[5];
  v40[1] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
  v38 = objc_msgSend(v35, "initWithIncomingIDs:outgoingID:messageIDOffset:service:", v37, a1[4], 600001, v3);
  v39 = (void *)qword_10003AF48;
  qword_10003AF48 = (uint64_t)v38;

  objc_msgSend((id)qword_10003AF10, "setDelegate:", qword_10003AF18);
  objc_msgSend((id)qword_10003AF18, "setDelegate:", qword_10003AF10);
  objc_msgSend((id)qword_10003AF20, "setDelegate:", qword_10003AF28);
  objc_msgSend((id)qword_10003AF28, "setDelegate:", qword_10003AF20);
  objc_msgSend((id)qword_10003AF30, "setDelegate:", qword_10003AF38);
  objc_msgSend((id)qword_10003AF38, "setDelegate:", qword_10003AF30);
  objc_msgSend((id)qword_10003AF40, "setDelegate:", qword_10003AF48);
  objc_msgSend((id)qword_10003AF48, "setDelegate:", qword_10003AF40);
  +[CKIMDaemonController beginSimulatingDaemon](CKIMDaemonController, "beginSimulatingDaemon");

}

void sub_10001F420(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v18 = a1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", *(_QWORD *)(a1 + 32), 0));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "queryItems"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("test"));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));
        if (v12)
        {

          v7 = v13;
          if ((objc_msgSend(v13, "containsString:", CFSTR("Screenshot")) & 1) == 0)
            goto LABEL_14;
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
          objc_msgSend(v2, "setObject:forKey:", v13, v14);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v13 = v7;
    }
    while (v6);
  }
  else
  {
    v13 = 0;
  }
LABEL_14:

  if (objc_msgSend(v13, "containsString:", CFSTR("Screenshot")))
  {
    objc_msgSend(*(id *)(v18 + 40), "startScreenshotTestWithOptions:", v2);
  }
  else if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "im_lastPathComponent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/AppleInternal/XCTests/com.apple.mobilesms/"), "stringByAppendingPathComponent:", v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CKUnitTestRunner sharedInstance](CKUnitTestRunner, "sharedInstance"));
    objc_msgSend(v17, "runUnitTestBundleAtPath:writeToFile:", v16, 1);

  }
}

void sub_10001F790()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getRPTTestRunnerClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("mSMSApplicationTesting.m"), 111, CFSTR("Unable to find class %s"), "RPTTestRunner");

  __break(1u);
}

void sub_10001F808(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *RecapPerformanceTestingLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("mSMSApplicationTesting.m"), 110, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_10001F884()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getRPTScrollViewTestParametersClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("mSMSApplicationTesting.m"), 113, CFSTR("Unable to find class %s"), "RPTScrollViewTestParameters");

  __break(1u);
}

void sub_10001F8FC()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getRPTResizeTestParametersClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("mSMSApplicationTesting.m"), 112, CFSTR("Unable to find class %s"), "RPTResizeTestParameters");

  __break(1u);
}

void sub_10001F974(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to add Messages Fileprovider domain: %@", (uint8_t *)&v4, 0xCu);

}

void sub_10001FA0C(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *CoreServicesLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SMSApplicationDelegate.m"), 74, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_10001FA88()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getLSApplicationWorkspaceClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SMSApplicationDelegate.m"), 75, CFSTR("Unable to find class %s"), "LSApplicationWorkspace");

  __break(1u);
  CFNotificationCenterGetDarwinNotifyCenter();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ID");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLContexts");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTITypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTITypes");
}

id objc_msgSend___ck_bottomOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ck_bottomOffset");
}

id objc_msgSend___ck_currentDeviceIsPadOrMac(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ck_currentDeviceIsPadOrMac");
}

id objc_msgSend___ck_isAcknowledgmentMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ck_isAcknowledgmentMessage");
}

id objc_msgSend___ck_isCarrierBased(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ck_isCarrierBased");
}

id objc_msgSend___ck_isScrolledToBottom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ck_isScrolledToBottom");
}

id objc_msgSend___ck_isiMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ck_isiMessage");
}

id objc_msgSend___ck_shuffledArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__ck_shuffledArray");
}

id objc_msgSend___setCurrentTestName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__setCurrentTestName:");
}

id objc_msgSend__automation_markAsRead_messageGUID_forChatGUID_fromMe_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_automation_markAsRead:messageGUID:forChatGUID:fromMe:");
}

id objc_msgSend__backbuttonPressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_backbuttonPressed");
}

id objc_msgSend__clearFailureBadge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearFailureBadge");
}

id objc_msgSend__clearSearchStringWithPreviousSearchText_resultsDictionary_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearSearchStringWithPreviousSearchText:resultsDictionary:completion:");
}

id objc_msgSend__connectToDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectToDaemon");
}

id objc_msgSend__detailsViewScrollingPerfTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_detailsViewScrollingPerfTest:");
}

id objc_msgSend__dismissPeoplePicker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissPeoplePicker");
}

id objc_msgSend__dismissPeoplePickerWithCompletion_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissPeoplePickerWithCompletion:completion:");
}

id objc_msgSend__fsmIdentifierForTestName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fsmIdentifierForTestName:");
}

id objc_msgSend__hideConversationListForIPadPPTTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hideConversationListForIPadPPTTest");
}

id objc_msgSend__initializeFindMyController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeFindMyController");
}

id objc_msgSend__isLoading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isLoading");
}

id objc_msgSend__orientationForViewTransform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_orientationForViewTransform");
}

id objc_msgSend__performNextSearchPartialFirstWithRemainingSearches_passedSoFar_resultsDictionary_finalCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performNextSearchPartialFirstWithRemainingSearches:passedSoFar:resultsDictionary:finalCompletion:");
}

id objc_msgSend__performNextSearchResultsClearingTestWithRemainingSearches_passedSoFar_resultsDictionary_finalCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performNextSearchResultsClearingTestWithRemainingSearches:passedSoFar:resultsDictionary:finalCompletion:");
}

id objc_msgSend__performNextSearchWithRemainingSearches_passedSoFar_resultsDictionary_finalCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performNextSearchWithRemainingSearches:passedSoFar:resultsDictionary:finalCompletion:");
}

id objc_msgSend__performNextTapIntoTapOutOfTestWithRemainingSearches_startTime_passedSoFar_resultsDictionary_finalCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performNextTapIntoTapOutOfTestWithRemainingSearches:startTime:passedSoFar:resultsDictionary:finalCompletion:");
}

id objc_msgSend__performScrollTest_iterations_delta_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performScrollTest:iterations:delta:");
}

id objc_msgSend__performScrollTest_iterations_delta_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performScrollTest:iterations:delta:length:");
}

id objc_msgSend__performScrollTest_iterations_delta_scrollAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performScrollTest:iterations:delta:scrollAxis:");
}

id objc_msgSend__playMessageReceivedForMessage_inChat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_playMessageReceivedForMessage:inChat:");
}

id objc_msgSend__recordAllTestsPassed_resultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recordAllTestsPassed:resultsDictionary:");
}

id objc_msgSend__recordResult_forKey_comment_resultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recordResult:forKey:comment:resultsDictionary:");
}

id objc_msgSend__registerForAppleEventsIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerForAppleEventsIfNecessary");
}

id objc_msgSend__resetIdleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resetIdleTimer");
}

id objc_msgSend__scrollPseudoContactTest_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scrollPseudoContactTest:withOptions:");
}

id objc_msgSend__searchForString_validateExpectedSearchResults_resultsDictionary_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_searchForString:validateExpectedSearchResults:resultsDictionary:completion:");
}

id objc_msgSend__searchForString_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_searchForString:withCompletion:");
}

id objc_msgSend__searchForStringWithNoCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_searchForStringWithNoCompletion:");
}

id objc_msgSend__setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setCornerRadius:");
}

id objc_msgSend__setDefaultNumberOfMessagesToLoad_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setDefaultNumberOfMessagesToLoad:");
}

id objc_msgSend__setPostMessageSentNotifications_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setPostMessageSentNotifications:");
}

id objc_msgSend__setSimulatedChats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setSimulatedChats:");
}

id objc_msgSend__showPeoplePickerTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showPeoplePickerTest:");
}

id objc_msgSend__startResolveContactTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startResolveContactTest:");
}

id objc_msgSend__startcomposePseudoContactTest_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startcomposePseudoContactTest:withOptions:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionButton");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationState");
}

id objc_msgSend_activeTUConversationHasActivitySession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeTUConversationHasActivitySession:");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityType");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addDomain_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDomain:completionHandler:");
}

id objc_msgSend_addListenerID_forService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addListenerID:forService:");
}

id objc_msgSend_addMessagesFileProviderDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMessagesFileProviderDomain:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addToRunLoop:forMode:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alertSuppressionContextsFromForegroundActiveScenes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertSuppressionContextsFromForegroundActiveScenes");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allowedByScreenTimeToPlayReceiveSoundForChat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedByScreenTimeToPlayReceiveSoundForChat:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_arrayWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithContentsOfFile:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_avMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avMode");
}

id objc_msgSend_balloonPluginForBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "balloonPluginForBundleID:");
}

id objc_msgSend_balloonView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "balloonView");
}

id objc_msgSend_balloonViewTapped_withModifierFlags_selectedText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "balloonViewTapped:withModifierFlags:selectedText:");
}

id objc_msgSend_batchDeleteButtonTapped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batchDeleteButtonTapped:");
}

id objc_msgSend_beginHoldingConversationListUpdatesForPPTTests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginHoldingConversationListUpdatesForPPTTests");
}

id objc_msgSend_beginSimulatingDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginSimulatingDaemon");
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockUntilConnected");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bottomSeperator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomSeperator");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bulletinSuppressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bulletinSuppressed");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_cachedChats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedChats");
}

id objc_msgSend_canRunTests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canRunTests");
}

id objc_msgSend_cancelButtonTapped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelButtonTapped");
}

id objc_msgSend_captureScreenshot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureScreenshot");
}

id objc_msgSend_cellForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellForItemAtIndexPath:");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_chat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chat");
}

id objc_msgSend_chatController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chatController");
}

id objc_msgSend_chatIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chatIdentifier");
}

id objc_msgSend_chatItemForCell_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chatItemForCell:");
}

id objc_msgSend_chatItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chatItems");
}

id objc_msgSend_chatMatchesActiveFocusMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chatMatchesActiveFocusMode:");
}

id objc_msgSend_ckTUConversationStateForTUConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckTUConversationStateForTUConversation:");
}

id objc_msgSend_ckVideoMessageRecordingViewControllerRecordingCanceled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckVideoMessageRecordingViewControllerRecordingCanceled:");
}

id objc_msgSend_cleanupCurrentTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanupCurrentTest");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFile");
}

id objc_msgSend_cnContactWithKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cnContactWithKeys:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionView");
}

id objc_msgSend_collectionView_didSelectItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionView:didSelectItemAtIndexPath:");
}

id objc_msgSend_collectionViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionViewController");
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionBlock");
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_composeChatController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "composeChatController");
}

id objc_msgSend_composeRecipientSelectionController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "composeRecipientSelectionController");
}

id objc_msgSend_composeRecipientView_textDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "composeRecipientView:textDidChange:");
}

id objc_msgSend_composeRecipientViewRequestAddRecipient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "composeRecipientViewRequestAddRecipient:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_configureActionButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureActionButton");
}

id objc_msgSend_configureIconView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureIconView");
}

id objc_msgSend_configureSubtitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureSubtitle");
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedScenes");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToConstant:");
}

id objc_msgSend_contactImageSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactImageSize");
}

id objc_msgSend_contactPicker_didSelectContactProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactPicker:didSelectContactProperty:");
}

id objc_msgSend_contactPickerDidCancel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactPickerDidCancel:");
}

id objc_msgSend_contactPickerViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactPickerViewController");
}

id objc_msgSend_contactPropertyWithContact_propertyKey_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactPropertyWithContact:propertyKey:identifier:");
}

id objc_msgSend_containerClassForType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerClassForType:");
}

id objc_msgSend_containingBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containingBundle");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentInset");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentOffset");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_conversation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversation");
}

id objc_msgSend_conversationForExistingChatWithChatIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationForExistingChatWithChatIdentifier:");
}

id objc_msgSend_conversationIsVideoCall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationIsVideoCall:");
}

id objc_msgSend_conversationList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationList");
}

id objc_msgSend_conversationListController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationListController");
}

id objc_msgSend_conversationListControllerClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationListControllerClass");
}

id objc_msgSend_conversationListIsDeletingConversations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversationListIsDeletingConversations:");
}

id objc_msgSend_conversations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conversations");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentConversation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConversation");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentInputViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentInputViewController");
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentNotificationCenter");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingComponents:toDate:options:");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultConversationViewingMessageCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultConversationViewingMessageCount");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSessionConfiguration");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delayBeforeEffectWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delayBeforeEffectWithIdentifier:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteChat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteChat:");
}

id objc_msgSend_deleteConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteConversation:");
}

id objc_msgSend_deleteTopChat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteTopChat");
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptorForRequiredKeys");
}

id objc_msgSend_detailsController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detailsController");
}

id objc_msgSend_detailsTUConversationDetailsSummaryImageDiameter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detailsTUConversationDetailsSummaryImageDiameter");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dismissKeyboard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissKeyboard");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayLinkWithTarget:selector:");
}

id objc_msgSend_dissmissComposeSheet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dissmissComposeSheet");
}

id objc_msgSend_doPushToTranscriptTestForChatIdentifierPerformanceTest_testBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doPushToTranscriptTestForChatIdentifierPerformanceTest:testBlock:");
}

id objc_msgSend_drawViewHierarchyInRect_afterScreenUpdates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawViewHierarchyInRect:afterScreenUpdates:");
}

id objc_msgSend_endHoldingConversationListUpdatesForPPTTests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endHoldingConversationListUpdatesForPPTTests");
}

id objc_msgSend_entryView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryView");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_existingChatWithGUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingChatWithGUID:");
}

id objc_msgSend_existingConversationForTelephonyConversationUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "existingConversationForTelephonyConversationUUID:");
}

id objc_msgSend_expanseActivityViewIconTintColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expanseActivityViewIconTintColor");
}

id objc_msgSend_extractValueFromURL_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractValueFromURL:forKey:");
}

id objc_msgSend_faceTimeIconForTUConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "faceTimeIconForTUConversation:");
}

id objc_msgSend_failedTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failedTest:");
}

id objc_msgSend_failedTest_withFailure_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failedTest:withFailure:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileHandleForWritingAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForWritingAtPath:");
}

id objc_msgSend_finishedSubTest_forTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedSubTest:forTest:");
}

id objc_msgSend_finishedTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedTest:");
}

id objc_msgSend_finishedTest_extraResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedTest:extraResults:");
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstResponder");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_formatSubtitleForText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatSubtitleForText");
}

id objc_msgSend_formatTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatTitle");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_getContactStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getContactStore");
}

id objc_msgSend_getKeyWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getKeyWindow");
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "guid");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconView");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_im_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "im_lastPathComponent");
}

id objc_msgSend_imageFromView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageFromView:");
}

id objc_msgSend_indexPathForCell_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForCell:");
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForItem:inSection:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_initWithConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConversation:");
}

id objc_msgSend_initWithDragImage_inSourceRect_withSourcePoint_keyboardSourceRect_keyboardSourcePoint_withGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDragImage:inSourceRect:withSourcePoint:keyboardSourceRect:keyboardSourcePoint:withGestureRecognizer:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithFrame_allowsRotation_restrictedToPortraitOrientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:allowsRotation:restrictedToPortraitOrientation:");
}

id objc_msgSend_initWithIdentifier_displayName_pathRelativeToDocumentStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:displayName:pathRelativeToDocumentStorage:");
}

id objc_msgSend_initWithImages_durations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImages:durations:");
}

id objc_msgSend_initWithIncomingIDs_outgoingID_messageIDOffset_service_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIncomingIDs:outgoingID:messageIDOffset:service:");
}

id objc_msgSend_initWithMemoryCapacity_diskCapacity_diskPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMemoryCapacity:diskCapacity:diskPath:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTestName_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTestName:scrollView:completionHandler:");
}

id objc_msgSend_initWithTestName_window_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTestName:window:completionHandler:");
}

id objc_msgSend_initWithText_subject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithText:subject:");
}

id objc_msgSend_initializeCachedValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeCachedValues");
}

id objc_msgSend_inputAccessoryView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputAccessoryView");
}

id objc_msgSend_inputController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputController");
}

id objc_msgSend_installCACommitCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installCACommitCompletionBlock:");
}

id objc_msgSend_installNotificationObserverForNotificationName_notificationName_forOneNotification_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interitemSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interitemSpacing");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateTranscriptDrawerWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateTranscriptDrawerWidth");
}

id objc_msgSend_isAccessibilityPreferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccessibilityPreferredContentSizeCategory");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActive");
}

id objc_msgSend_isAirplaneModeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAirplaneModeEnabled");
}

id objc_msgSend_isApplicationActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isApplicationActive");
}

id objc_msgSend_isBulletinSuppressed_messageContexts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBulletinSuppressed:messageContexts:");
}

id objc_msgSend_isCNContactAKnownContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCNContactAKnownContact:");
}

id objc_msgSend_isCarPlayConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCarPlayConnected");
}

id objc_msgSend_isCategorized(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCategorized");
}

id objc_msgSend_isCollapsed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCollapsed");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFiltered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFiltered");
}

id objc_msgSend_isFromFilteredSender_fromSender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFromFilteredSender:fromSender:");
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFromMe");
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalInstall");
}

id objc_msgSend_isKeyWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKeyWindow");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isMuted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMuted");
}

id objc_msgSend_isNewConversationList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNewConversationList");
}

id objc_msgSend_isOldConversationList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOldConversationList");
}

id objc_msgSend_isRead(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRead");
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRecapAvailable");
}

id objc_msgSend_isRunningViaTestRunner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunningViaTestRunner");
}

id objc_msgSend_isSearchResultsHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSearchResultsHidden");
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSuspended");
}

id objc_msgSend_isWiFiEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWiFiEnabled");
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "item");
}

id objc_msgSend_joinExistingConversationForTUCoversation_videoEnabled_wantsStagingArea_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "joinExistingConversationForTUCoversation:videoEnabled:wantsStagingArea:");
}

id objc_msgSend_joinStateStatusStringForTUConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "joinStateStatusStringForTUConversation:");
}

id objc_msgSend_lastFinishedMessageItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastFinishedMessageItem");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutAttributesForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutAttributesForItemAtIndexPath:");
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutFrame");
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMargins");
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMarginsGuide");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_leaveTUConversation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leaveTUConversation");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_locationSubtitleFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationSubtitleFont");
}

id objc_msgSend_logHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logHandle");
}

id objc_msgSend_madridRegistrationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "madridRegistrationController");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_manuallyInitializeDragAtPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manuallyInitializeDragAtPoint:");
}

id objc_msgSend_manuallyUpdateDragPositionToPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manuallyUpdateDragPositionToPoint:");
}

id objc_msgSend_mapSectionIdentifierForCurrentConversationListClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapSectionIdentifierForCurrentConversationListClass:");
}

id objc_msgSend_messagesController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messagesController");
}

id objc_msgSend_messagesSceneDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messagesSceneDelegate");
}

id objc_msgSend_multiplexedConnectionWithLabel_capabilities_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiplexedConnectionWithLabel:capabilities:context:");
}

id objc_msgSend_multiwayButtonColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiwayButtonColor");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfItemsInSection:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:options:completionHandler:");
}

id objc_msgSend_openURL_sourceApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:sourceApplication:");
}

id objc_msgSend_performSearch_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSearch:completion:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentID");
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentIdentifier");
}

id objc_msgSend_personCentricID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personCentricID");
}

id objc_msgSend_phoneNumberWithStringValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumberWithStringValue:");
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phoneNumbers");
}

id objc_msgSend_pinnedConversationIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pinnedConversationIdentifiers");
}

id objc_msgSend_platformSupportsStagingArea(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platformSupportsStagingArea");
}

id objc_msgSend_playIncomingMessageSoundAndHapticForMessage_messageIsForCurrentTranscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playIncomingMessageSoundAndHapticForMessage:messageIsForCurrentTranscript:");
}

id objc_msgSend_playSendSoundForMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playSendSoundForMessage:");
}

id objc_msgSend_playTapbackReceivedSoundForMessageInCurrentTranscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playTapbackReceivedSoundForMessageInCurrentTranscript:");
}

id objc_msgSend_pluginKitProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pluginKitProxyForIdentifier:");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_ppt_chatController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ppt_chatController");
}

id objc_msgSend_predicateForContactsMatchingPhoneNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForContactsMatchingPhoneNumber:");
}

id objc_msgSend_preferencesActions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferencesActions");
}

id objc_msgSend_prepopulatedChat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepopulatedChat");
}

id objc_msgSend_presentFromViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentFromViewController:animated:completion:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_primaryLabelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryLabelColor");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItems");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_recipientNameFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recipientNameFont");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redColor");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_resetsIdleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetsIdleTimer");
}

id objc_msgSend_resourceSpecifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceSpecifier");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_rotateIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rotateIfNeeded:");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "row");
}

id objc_msgSend_runTestNameOrFallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTestNameOrFallback:");
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTestWithParameters:");
}

id objc_msgSend_runUnitTestBundleAtPath_writeToFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runUnitTestBundleAtPath:writeToFile:");
}

id objc_msgSend_saveCompositionAndFlushCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCompositionAndFlushCache:");
}

id objc_msgSend_saveImage_filePath_fileName_withHeader_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveImage:filePath:fileName:withHeader:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_sceneClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sceneClass");
}

id objc_msgSend_sceneController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sceneController");
}

id objc_msgSend_screenshotTestNameEnumValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenshotTestNameEnumValue:");
}

id objc_msgSend_scrollPhotoPickerTestWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollPhotoPickerTestWithOptions:");
}

id objc_msgSend_scrollToItemAtIndexPath_atScrollPosition_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollToItemAtIndexPath:atScrollPosition:animated:");
}

id objc_msgSend_searchListController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchListController");
}

id objc_msgSend_searchResultsController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchResultsController");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryLabelColor");
}

id objc_msgSend_selectItemAtIndexPath_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectItemAtIndexPath:animated:scrollPosition:");
}

id objc_msgSend_selectRowAtIndexPath_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectRowAtIndexPath:animated:scrollPosition:");
}

id objc_msgSend_sendAudioMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAudioMessage");
}

id objc_msgSend_sendMultipleMessagesEntryView_composition_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMultipleMessagesEntryView:composition:handler:");
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sender");
}

id objc_msgSend_senderMatchesActiveFocusModeForMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "senderMatchesActiveFocusModeForMessage:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_serviceWithInternalName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceWithInternalName:");
}

id objc_msgSend_serviceWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceWithName:");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:");
}

id objc_msgSend_setActionButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionButton:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setChatItemRulesClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChatItemRulesClass:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setComposition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComposition:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentEdgeInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentEdgeInsets:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConversation:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegateClass:");
}

id objc_msgSend_setDraft_forConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDraft:forConversation:");
}

id objc_msgSend_setDraftForPendingConversation_withRecipients_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDraftForPendingConversation:withRecipients:");
}

id objc_msgSend_setEditing_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEditing:animated:");
}

id objc_msgSend_setEditingMode_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEditingMode:animated:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setIconView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIconView:");
}

id objc_msgSend_setIdleTimerDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimerDisabled:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsRunningPPT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRunningPPT:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setListeners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListeners:");
}

id objc_msgSend_setMaximumWindowSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumWindowSize:");
}

id objc_msgSend_setMinimumWindowSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumWindowSize:");
}

id objc_msgSend_setMutedUntilDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMutedUntilDate:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPredictionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredictionEnabled:");
}

id objc_msgSend_setRunningViaTestRunner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunningViaTestRunner:");
}

id objc_msgSend_setSceneClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSceneClass:");
}

id objc_msgSend_setSceneController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSceneController:");
}

id objc_msgSend_setSharedURLCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSharedURLCache:");
}

id objc_msgSend_setShouldShowRegistrationOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldShowRegistrationOverride:");
}

id objc_msgSend_setSoundHelper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSoundHelper:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setSubtitleLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubtitleLabel:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleLabel:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupView");
}

id objc_msgSend_sharePlayIcon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharePlayIcon");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedBehaviors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedBehaviors");
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedController");
}

id objc_msgSend_sharedControllerWithAppIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedControllerWithAppIdentifier:");
}

id objc_msgSend_sharedConversationList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConversationList");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedInstanceForBagType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstanceForBagType:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedPreferencesController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPreferencesController");
}

id objc_msgSend_sharedRegistry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedRegistry");
}

id objc_msgSend_shouldAutorotate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldAutorotate");
}

id objc_msgSend_shouldFilterConversationsByFocus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldFilterConversationsByFocus");
}

id objc_msgSend_shouldGetBulletinSuppressedStateFromHelper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldGetBulletinSuppressedStateFromHelper");
}

id objc_msgSend_shouldSuppressNotificationForMessageWithRelevantContext_withAlertSupressionContextForScenes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldSuppressNotificationForMessageWithRelevantContext:withAlertSupressionContextForScenes:");
}

id objc_msgSend_showBrowserForPlugin_dataSource_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showBrowserForPlugin:dataSource:style:");
}

id objc_msgSend_showConversation_animate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showConversation:animate:");
}

id objc_msgSend_showConversationForChatIdentifier_forceReload_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showConversationForChatIdentifier:forceReload:options:completion:");
}

id objc_msgSend_showConversationForChatIdentifier_willShowConversation_didShowConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showConversationForChatIdentifier:willShowConversation:didShowConversation:");
}

id objc_msgSend_showConversationListWithAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showConversationListWithAnimation:");
}

id objc_msgSend_showDTCompose(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showDTCompose");
}

id objc_msgSend_showHandwritingBrowser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showHandwritingBrowser");
}

id objc_msgSend_showKeyboard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showKeyboard");
}

id objc_msgSend_showKeyboardForReply(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showKeyboardForReply");
}

id objc_msgSend_showMessagesApplicationAndStartTestForIdentifier_supportsLaunchSubtest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showMessagesApplicationAndStartTestForIdentifier:supportsLaunchSubtest:");
}

id objc_msgSend_showNewMessageCompositionPanelWithRecipients_composition_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showNewMessageCompositionPanelWithRecipients:composition:animated:");
}

id objc_msgSend_showNextMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showNextMessage");
}

id objc_msgSend_showPhotosBrowser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showPhotosBrowser");
}

id objc_msgSend_showTranscriptListNotAnimated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showTranscriptListNotAnimated");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_smsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "smsEnabled");
}

id objc_msgSend_soundHelper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "soundHelper");
}

id objc_msgSend_standardControls(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardControls");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startAndFailTestNamed_withFailure_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAndFailTestNamed:withFailure:");
}

id objc_msgSend_startAudioBalloonPlaybackTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAudioBalloonPlaybackTest:");
}

id objc_msgSend_startAudioWaveformFPSTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAudioWaveformFPSTest");
}

id objc_msgSend_startDetailsTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDetailsTest:");
}

id objc_msgSend_startExtensionTest_launch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startExtensionTest:launch:");
}

id objc_msgSend_startGifPlaybackStaticFPSTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startGifPlaybackStaticFPSTest");
}

id objc_msgSend_startInteractiveStickerDragTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInteractiveStickerDragTest:");
}

id objc_msgSend_startInvisibleInkStaticFPSTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startInvisibleInkStaticFPSTest");
}

id objc_msgSend_startKeyboardPresentationTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startKeyboardPresentationTest:");
}

id objc_msgSend_startKeyboardResponsivenessTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startKeyboardResponsivenessTest:");
}

id objc_msgSend_startLiveBubbleLoadingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startLiveBubbleLoadingTest:");
}

id objc_msgSend_startMacActivateTestWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMacActivateTestWithOptions:");
}

id objc_msgSend_startMacFullscreenTestWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMacFullscreenTestWithOptions:");
}

id objc_msgSend_startMacResizeTestWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMacResizeTestWithOptions:");
}

id objc_msgSend_startMarkAsReadLocallyTestWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMarkAsReadLocallyTestWithOptions:");
}

id objc_msgSend_startMarkAsReadReceivedTestWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMarkAsReadReceivedTestWithOptions:");
}

id objc_msgSend_startMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitor");
}

id objc_msgSend_startPriorityBoostingTestWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPriorityBoostingTestWithOptions:");
}

id objc_msgSend_startQuicklookPresentationTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startQuicklookPresentationTest:");
}

id objc_msgSend_startRecordingForRaiseGesture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRecordingForRaiseGesture");
}

id objc_msgSend_startResizeTestWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startResizeTestWithOptions:");
}

id objc_msgSend_startResolveContactTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startResolveContactTest:");
}

id objc_msgSend_startRotationTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRotationTest:");
}

id objc_msgSend_startRotationTestWithTranscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRotationTestWithTranscript:");
}

id objc_msgSend_startScreenshotTestWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startScreenshotTestWithOptions:");
}

id objc_msgSend_startScrollConversationsTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startScrollConversationsTest:");
}

id objc_msgSend_startScrollPseudoContactNamesTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startScrollPseudoContactNamesTest:");
}

id objc_msgSend_startScrollTranscriptTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startScrollTranscriptTest:");
}

id objc_msgSend_startSendAnimationExistingTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSendAnimationExistingTest");
}

id objc_msgSend_startSendAnimationNewComposeTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSendAnimationNewComposeTest:");
}

id objc_msgSend_startShowMessagesTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startShowMessagesTest:");
}

id objc_msgSend_startStaticFSMFPSTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startStaticFSMFPSTest:");
}

id objc_msgSend_startStaticTranscriptFPSTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startStaticTranscriptFPSTest:");
}

id objc_msgSend_startStuckAudioPillTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startStuckAudioPillTest:");
}

id objc_msgSend_startTranscriptOnlyScreenshotTestwithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTranscriptOnlyScreenshotTestwithOptions:");
}

id objc_msgSend_startedIPTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startedIPTest:");
}

id objc_msgSend_startedSubTest_forTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startedSubTest:forTest:");
}

id objc_msgSend_startedSubTest_forTest_withMetrics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startedSubTest:forTest:withMetrics:");
}

id objc_msgSend_startedTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startedTest:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_statusButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusButton");
}

id objc_msgSend_stopPlayingAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopPlayingAlert");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
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

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subtitleLabel");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subviews");
}

id objc_msgSend_supportsCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsCapability:");
}

id objc_msgSend_supportsFilteringExtensions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsFilteringExtensions");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemRedColor");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView");
}

id objc_msgSend_tableView_didSelectRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView:didSelectRowAtIndexPath:");
}

id objc_msgSend_tapFSMIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tapFSMIfNecessary");
}

id objc_msgSend_teamID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teamID");
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textView");
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "theme");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_titleForAVMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleForAVMode:");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_toField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toField");
}

id objc_msgSend_toFieldIsFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toFieldIsFirstResponder");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_topSeperator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topSeperator");
}

id objc_msgSend_touchUpInsideCellStatusButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchUpInsideCellStatusButton:");
}

id objc_msgSend_touchUpInsideSendButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchUpInsideSendButton:");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_transcriptCollectionViewController_balloonView_tappedForChatItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transcriptCollectionViewController:balloonView:tappedForChatItem:");
}

id objc_msgSend_transcriptPreviewCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transcriptPreviewCache");
}

id objc_msgSend_tuConversationButtonInteritemSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tuConversationButtonInteritemSpacing");
}

id objc_msgSend_tuConversationButtonTitleHorizontalSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tuConversationButtonTitleHorizontalSpacing");
}

id objc_msgSend_tuConversationButtonTitleVerticalSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tuConversationButtonTitleVerticalSpacing");
}

id objc_msgSend_tuConversationInsetPadding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tuConversationInsetPadding");
}

id objc_msgSend_tuConversationInteritemSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tuConversationInteritemSpacing");
}

id objc_msgSend_tuConversationJoinButtonCornerRadius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tuConversationJoinButtonCornerRadius");
}

id objc_msgSend_tuConversationJoinButtonHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tuConversationJoinButtonHeight");
}

id objc_msgSend_tuConversationJoinButtonMinWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tuConversationJoinButtonMinWidth");
}

id objc_msgSend_tuConversationViewActionButtonFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tuConversationViewActionButtonFont");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unifiedContactsMatchingPredicate:keysToFetch:error:");
}

id objc_msgSend_unmute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmute");
}

id objc_msgSend_updateView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateView");
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userActivities");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_validateActionMenuWindowOrientationExpectedOrientation_withResultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateActionMenuWindowOrientationExpectedOrientation:withResultsDictionary:");
}

id objc_msgSend_validateAtConversationListInConversationListController_previousSearchText_withResultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateAtConversationListInConversationListController:previousSearchText:withResultsDictionary:");
}

id objc_msgSend_validateBottomInsetGreaterThanIAVHeight_expected_withResultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateBottomInsetGreaterThanIAVHeight:expected:withResultsDictionary:");
}

id objc_msgSend_validateEntryViewIsFirstResponder_expected_withResultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateEntryViewIsFirstResponder:expected:withResultsDictionary:");
}

id objc_msgSend_validateIAVisExpanded_expected_withResultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateIAVisExpanded:expected:withResultsDictionary:");
}

id objc_msgSend_validateNonzeroTranscriptInsets_expected_withResultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateNonzeroTranscriptInsets:expected:withResultsDictionary:");
}

id objc_msgSend_validateNumberOfSearchResultsInConversationListController_searchText_expectedNumber_withResultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateNumberOfSearchResultsInConversationListController:searchText:expectedNumber:withResultsDictionary:");
}

id objc_msgSend_validateRecipientSelectionControllerIsFirstResponder_expected_withResultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateRecipientSelectionControllerIsFirstResponder:expected:withResultsDictionary:");
}

id objc_msgSend_validateTranscriptControllerIsFirstResponder_expected_withResultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateTranscriptControllerIsFirstResponder:expected:withResultsDictionary:");
}

id objc_msgSend_validateTranscriptIsScrolledToBottom_expected_withResultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateTranscriptIsScrolledToBottom:expected:withResultsDictionary:");
}

id objc_msgSend_validateTranscriptPreviewCacheHasResumed_expected_withResultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateTranscriptPreviewCacheHasResumed:expected:withResultsDictionary:");
}

id objc_msgSend_validateTranscriptVendingIAV_expected_withResultsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateTranscriptVendingIAV:expected:withResultsDictionary:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_valueForChatProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForChatProperty:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewController");
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleCells");
}

id objc_msgSend_waveformView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waveformView");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windows");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}
