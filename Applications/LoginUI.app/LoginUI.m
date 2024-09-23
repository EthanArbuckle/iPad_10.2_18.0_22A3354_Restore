void sub_1000020B4(id a1)
{
  LUIPrivacyController *v1;
  void *v2;

  v1 = objc_opt_new(LUIPrivacyController);
  v2 = (void *)qword_100088C98;
  qword_100088C98 = (uint64_t)v1;

}

void sub_10000215C(id a1)
{
  LUISignInController *v1;
  void *v2;

  v1 = objc_opt_new(LUISignInController);
  v2 = (void *)qword_100088CA8;
  qword_100088CA8 = (uint64_t)v1;

}

void sub_100002498(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void (*v9)(void);
  _QWORD v10[5];
  _QWORD block[4];
  id v12;
  uint64_t v13;

  v3 = a2;
  if (!v3)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_8:
    v9();
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000274C;
    v10[3] = &unk_100068C58;
    v10[4] = *(_QWORD *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    goto LABEL_9;
  }
  v4 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
    sub_10003AFA8(a1, (uint64_t)v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIAuthenticationController sharedController](LUIAuthenticationController, "sharedController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "errorMessageForError:", v3));

  if (!v6)
  {
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_8;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002600;
  block[3] = &unk_100068C30;
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_9:

}

void sub_100002600(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, *(_QWORD *)(a1 + 32), 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100069EB8, 0));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002714;
  v6[3] = &unk_100068C08;
  v6[4] = *(_QWORD *)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v4, 0, v6));

  objc_msgSend(v2, "addAction:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "presentViewController:animated:completion:", v2, 1, 0);

}

void sub_100002714(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uiUpdateSupport"));
  objc_msgSend(v1, "endDisablingViewUpdatesForReason:", off_100087BF8);

}

void sub_10000274C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uiUpdateSupport"));
  objc_msgSend(v1, "endDisablingViewUpdatesForReason:", off_100087BF8);

}

void sub_100002890(id a1)
{
  LUIContactCache *v1;
  void *v2;

  v1 = objc_alloc_init(LUIContactCache);
  v2 = (void *)qword_100088CB8;
  qword_100088CB8 = (uint64_t)v1;

}

void sub_100002BD0(uint64_t a1)
{
  UIImage *v2;
  UIImage *v3;
  NSData *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImage *v8;
  NSData *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v2 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "photo"));
  v3 = v2;
  if (v2)
  {
    v4 = UIImagePNGRepresentation(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (*(_BYTE *)(a1 + 56))
  {
    v6 = *(void **)(a1 + 40);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Guest")));
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_monogramImageFromTemplateImage:", v7));
    v9 = UIImagePNGRepresentation(v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (v5)
    {
LABEL_6:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100002CEC;
      v11[3] = &unk_100068C30;
      v12 = *(id *)(a1 + 48);
      v13 = v5;
      v10 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

    }
  }
LABEL_7:

}

id sub_100002CEC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImageData:", *(_QWORD *)(a1 + 40));
}

void sub_100002F20(uint64_t a1)
{
  UIImage *v2;
  UIImage *v3;
  NSData *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "photo"));
  v3 = v2;
  if (v2)
  {
    v4 = UIImagePNGRepresentation(v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100002FD8;
    v7[3] = &unk_100068C30;
    v8 = *(id *)(a1 + 40);
    v9 = v5;
    v6 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  }
}

id sub_100002FD8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImageData:", *(_QWORD *)(a1 + 40));
}

void sub_100003380(id a1)
{
  LUIUserInfoController *v1;
  void *v2;

  v1 = objc_opt_new(LUIUserInfoController);
  v2 = (void *)qword_100088CC8;
  qword_100088CC8 = (uint64_t)v1;

}

void sub_100004C44(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100004CA8;
  v2[3] = &unk_100068C30;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  BSRunLoopPerformAfterCACommit(v2);

}

void sub_100004CA8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("LUIAssignedStudentIDKey")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("LUIAssignedClassKey")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "integerValue")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("LUIAssignedStudentPasswordKey")));
  objc_msgSend(v2, "chooseUserWithIdentifier:inClassWithID:password:withCompletionHandler:", v6, v4, v5, 0);

}

void sub_1000059AC(uint64_t a1)
{
  void (**v1)(void);

  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "displayAnimationCompletionBlock"));
  v1[2]();

}

void sub_100005E34(id a1)
{
  LUISyncTaskMonitor *v1;
  void *v2;

  if (+[LUISyncTaskMonitor syncTaskMonitorShouldStart](LUISyncTaskMonitor, "syncTaskMonitorShouldStart"))
  {
    v1 = objc_opt_new(LUISyncTaskMonitor);
    v2 = (void *)qword_100088CE0;
    qword_100088CE0 = (uint64_t)v1;

  }
}

void sub_100006010(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  int v20;

  v2 = objc_msgSend(a1[4], "uid");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "uidPresenterMap"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "uidPresenterMap"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "uidPresenterMap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));
  objc_msgSend(v11, "addPointer:", a1[6]);

  objc_msgSend(a1[5], "_monitorQueueStartObservingSyncTaskStateChangeIfNeeded");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "uidSyncStateMap"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));

  if (v14)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000061E4;
    block[3] = &unk_100068D38;
    v15 = a1[6];
    v16 = a1[5];
    v18 = v15;
    v19 = v16;
    v20 = (int)v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

void sub_1000061E4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "uidSyncStateMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v3));
  objc_msgSend(v2, "setSyncTaskState:animated:", objc_msgSend(v4, "integerValue"), 1);

}

void sub_100006304(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uidPresenterMap", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "count"))
        {
          v9 = 0;
          while (1)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pointerAtIndex:", v9));
            v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 40));

            if ((v11 & 1) != 0)
              break;
            if ((unint64_t)objc_msgSend(v8, "count") <= ++v9)
              goto LABEL_12;
          }
          if ((v9 & 0x80000000) == 0)
          {
            objc_msgSend(v8, "removePointerAtIndex:", v9);
            goto LABEL_16;
          }
        }
LABEL_12:
        ;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_16:

}

id sub_100006558(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "isObservingSyncState");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_monitorQueueIncreaseUpdateFrequency");
    return objc_msgSend(*(id *)(a1 + 32), "_monitorQueueUpdateSyncTaskState");
  }
  return result;
}

void sub_1000067C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000067F4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = a2;
  if (objc_msgSend(a3, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "doneSyncingUIDs"));
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if ((v7 & 1) == 0)
    {
      v17 = 0;
      v18 = kMKBUserSessionIDKey;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v5, "intValue")));
      v19 = v8;
      v9 = (void *)MKBUserSessionListSyncMachServices(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1), &v17);

      v10 = v17;
      if (v17)
      {
        v11 = qword_100088F08;
        if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_ERROR))
          sub_10003B178((uint64_t)v5, (uint64_t)v10, v11);
      }
      else if (objc_msgSend(v9, "count"))
      {
        v14 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        if (objc_msgSend(v5, "intValue") == *(_DWORD *)(a1 + 48))
          v14 = 2;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uidSyncStateMap"));
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v5);

        objc_msgSend(*(id *)(a1 + 32), "_monitorQueueNotifyPresentersForUID:syncTaskState:", v5, v14);
        goto LABEL_11;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uidSyncStateMap"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", &off_10006C8C0, v5);

      objc_msgSend(*(id *)(a1 + 32), "_monitorQueueNotifyPresentersForUID:syncTaskState:", v5, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "doneSyncingUIDs"));
      objc_msgSend(v13, "addObject:", v5);

LABEL_11:
    }
  }

}

id sub_100006B78(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSyncTaskState:animated:", *(_QWORD *)(a1 + 40), 1);
}

void sub_100006C98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100006E4C(id a1)
{
  LUITemporarySessionSupport *v1;
  void *v2;

  v1 = objc_opt_new(LUITemporarySessionSupport);
  v2 = (void *)qword_100088CF0;
  qword_100088CF0 = (uint64_t)v1;

}

uint64_t sub_100007064(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t sub_100007108(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  return result;
}

uint64_t sub_1000071AC(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 10);
  return result;
}

void sub_100007218(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned __int8 *v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  unsigned int v11;
  __int16 v12;
  unsigned int v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = objc_msgSend(v2, "isSharedDeviceTemporarySessionAllowed");

  v4 = +[DMCMultiUserModeUtilities temporarySessionOnly](DMCMultiUserModeUtilities, "temporarySessionOnly");
  v5 = +[DMCMultiUserModeUtilities useDynamicQuotaSize](DMCMultiUserModeUtilities, "useDynamicQuotaSize");
  v6 = v5;
  v7 = *(unsigned __int8 **)(a1 + 32);
  if (v7[8] != v3 || v7[9] != v4 || v7[10] != v5)
  {
    v8 = qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109632;
      v9[1] = v3;
      v10 = 1024;
      v11 = v4;
      v12 = 1024;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Shared device anonymous temporary user setting changed. isTemporarySessionAllowed: %d, isTemporarySessionOnly: %d, useDynamicQuotaSize: %d", (uint8_t *)v9, 0x14u);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = v3;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = v4;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100068E18);
  }
}

void sub_10000736C(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
  objc_msgSend(v1, "setViewControllerStackAnimated:deferrable:", 1, 1);

}

id sub_100007EC4(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v2, "setAlpha:", 0.0);

  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

void sub_100007F04(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
  objc_msgSend(v2, "addSubview:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
  objc_msgSend(v6, "setAlpha:", 0.0);

  if (objc_msgSend(*(id *)(a1 + 48), "wallpaperVariant") != (id)-1
    && (SBSUIWallpaperSetVariant(objc_msgSend(*(id *)(a1 + 48), "wallpaperVariant")) & 1) == 0)
  {
    v7 = qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_ERROR))
      sub_10003B25C(v7);
  }
  if (objc_msgSend(*(id *)(a1 + 48), "backgroundStyle"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v8, "_setBackgroundStyle:", objc_msgSend(*(id *)(a1 + 48), "backgroundStyle"));

  }
  objc_msgSend(*(id *)(a1 + 48), "transitionDuration:", *(_QWORD *)(a1 + 56));
  v10 = v9 * 0.5;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000080F0;
  v14[3] = &unk_100068C30;
  v15 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 40);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000813C;
  v11[3] = &unk_100068E90;
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 56);
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, v11, v10);

}

void sub_1000080F0(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
  objc_msgSend(v2, "setAlpha:", 1.0);

}

id sub_10000813C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
}

void sub_100008200(id a1)
{
  LUILegibilityObserver *v1;
  void *v2;

  v1 = objc_opt_new(LUILegibilityObserver);
  v2 = (void *)qword_100088D00;
  qword_100088D00 = (uint64_t)v1;

}

void sub_100008330(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_refreshLegibilitySettings");
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", off_100087DE0, *(_QWORD *)(a1 + 32));

}

void sub_10000A630(id a1)
{
  LUIImageCache *v1;
  void *v2;

  v1 = objc_alloc_init(LUIImageCache);
  v2 = (void *)qword_100088D10;
  qword_100088D10 = (uint64_t)v1;

}

void sub_10000C2EC(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10006CC98));
  v2 = (void *)qword_100088D20;
  qword_100088D20 = v1;

}

id sub_10000C8B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTransitionProgress:", 0.0);
}

void sub_10000CAB4(id a1)
{
  LUIUserInfoStyle *v1;
  void *v2;

  v1 = objc_opt_new(LUIUserInfoStyle);
  v2 = (void *)qword_100088D30;
  qword_100088D30 = (uint64_t)v1;

}

void sub_10000D048(id a1)
{
  LUICollectionViewStyle *v1;
  void *v2;

  v1 = objc_opt_new(LUICollectionViewStyle);
  v2 = (void *)qword_100088D40;
  qword_100088D40 = (uint64_t)v1;

}

BOOL sub_10000D3E8()
{
  void *v0;
  double v1;
  double v2;
  void *v3;
  double v4;
  _BOOL8 v5;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v0, "bounds");
  v2 = v1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "bounds");
  v5 = v2 > v4;

  return v5;
}

void sub_10000D750(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v2, "setAlpha:", 0.0);

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "view"));
  objc_msgSend(v3, "setAlpha:", 1.0);

}

id sub_10000D7AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

void sub_10000DDB8(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "indicatorView"));
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_10000DDEC(uint64_t a1, int a2)
{
  id v2;

  if (a2)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "indicatorView"));
    objc_msgSend(v2, "removeFromSuperview");

  }
}

void sub_10000DECC(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "indicatorView"));
  objc_msgSend(v2, "setBackgroundColor:", v3);

}

void sub_10000E10C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "baseView"));
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void sub_10000E208(id a1)
{
  LUIUIUpdateSupport *v1;
  void *v2;

  v1 = objc_opt_new(LUIUIUpdateSupport);
  v2 = (void *)qword_100088D50;
  qword_100088D50 = (uint64_t)v1;

}

id sub_10000EB7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_synchronouslyDisableUserInteractionForReason:", *(_QWORD *)(a1 + 40));
}

id sub_10000ED4C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_synchronouslyReenableUserInteractionForReason:", *(_QWORD *)(a1 + 40));
}

void sub_10000F4CC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char isKindOfClass;
  NSObject *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;

  v3 = a2;
  v4 = objc_opt_class(SBSUIMutableLoginUISceneClientSettings);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  v6 = qword_100088F38;
  v7 = os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT);
  if ((isKindOfClass & 1) != 0)
  {
    if (v7)
    {
      if (*(_BYTE *)(a1 + 40))
        v8 = CFSTR("Locked");
      else
        v8 = CFSTR("Unlocked");
      v16 = 138412290;
      v17 = (uint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting idle timer mode: %@", (uint8_t *)&v16, 0xCu);
    }
    v9 = (void *)qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
      sub_10003B5A8(a1, v9);
    v10 = qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 41))
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v16 = 138412290;
      v17 = (uint64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting rotation allowed: %@", (uint8_t *)&v16, 0xCu);
    }
    v12 = *(void **)(a1 + 32);
    v13 = v3;
    objc_msgSend(v13, "setIdleTimerMode:", objc_msgSend(v12, "isIdleTimerModeLocked"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "statusBarUserName"));
    objc_msgSend(v13, "setStatusBarUserNameOverride:", v14);

    objc_msgSend(v13, "setRotationMode:", *(_BYTE *)(a1 + 41) == 0);
  }
  else if (v7)
  {
    v15 = v6;
    v16 = 138412290;
    v17 = objc_opt_class(v3);
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unexpected scene settings class: %@", (uint8_t *)&v16, 0xCu);

  }
}

void sub_10000F7BC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_100010D84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDefaultDomainSetting");
}

void sub_1000123E8(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"));
  objc_msgSend(v2, "setReturnKeyEnabled:", *(unsigned __int8 *)(a1 + 32));

}

void sub_10001288C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[DMCMultiUserModeUtilities managedAppleIDDefaultDomains](DMCMultiUserModeUtilities, "managedAppleIDDefaultDomains"));
  objc_msgSend(*(id *)(a1 + 32), "setDefaultDomains:", v2);

}

void sub_100012BF8(id a1)
{
  LUIPersistentImageCache *v1;
  void *v2;

  v1 = objc_opt_new(LUIPersistentImageCache);
  v2 = (void *)qword_100088D68;
  qword_100088D68 = (uint64_t)v1;

}

void sub_10001385C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(void);

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_100088F28;
    if (os_log_type_enabled((os_log_t)qword_100088F28, OS_LOG_TYPE_DEBUG))
      sub_10003B764(a1, v7, v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v5));
    v9 = qword_100088F28;
    v10 = os_log_type_enabled((os_log_t)qword_100088F28, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10)
        sub_10003B730(v9, v11, v12, v13, v14, v15, v16, v17);
      objc_msgSend(*(id *)(a1 + 32), "_cacheDownloadedImage:toDestionation:forURL:scaleToSquareImage:", v8, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72));
      v18 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    else
    {
      if (v10)
        sub_10003B6FC(v9, v11, v12, v13, v14, v15, v16, v17);
      v18 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    v18();

  }
}

id sub_100013AD0(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (id)(*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 32), 0);
  else
    return objc_msgSend(*(id *)(a1 + 40), "_downloadImageInURL:toDestination:scaleToSquareImage:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56));
}

id sub_100013CD8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_imageFetchDidFinishForOperation:user:imageSize:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_100014098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000140D4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_addImageFetchOperationToQueueForUser:imageSize:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

void sub_10001439C(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  id v4;

  v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100014418;
  v3[3] = &unk_100069190;
  v3[4] = v2;
  v4 = v1;
  objc_msgSend(v2, "_cachedImageForURL:fromDestionation:scaleToSquareImage:withCompletionHandler:", v4, 1, 1, v3);

}

void sub_100014418(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!a2)
  {
    v3 = *(void **)(a1 + 32);
    v8 = (id)objc_claimAutoreleasedReturnValue(+[LUIImageCache sharedInstance](LUIImageCache, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("BigGuest")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "monogramGroupImageColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tintedImageFromImage:color:", v4, v6));
    objc_msgSend(v3, "_cacheDownloadedImage:toDestionation:forURL:scaleToSquareImage:", v7, 1, *(_QWORD *)(a1 + 40), 0);

  }
}

void sub_1000144EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000144FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100014904(id a1, NSError *a2)
{
  void *v2;

  v2 = (void *)qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_ERROR))
    sub_10003B8DC(v2);
}

void sub_10001494C(id a1, FBSMutableSceneClientSettings *a2)
{
  FBSMutableSceneClientSettings *v2;
  uint64_t v3;
  char isKindOfClass;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;

  v2 = a2;
  v3 = objc_opt_class(SBSUIMutableLoginUISceneClientSettings);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);
  v5 = qword_100088F08;
  v6 = os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT);
  if ((isKindOfClass & 1) != 0)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting idle timer mode: Unlocked", (uint8_t *)&v10, 2u);
    }
    v7 = qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting wallpaper mode: Light", (uint8_t *)&v10, 2u);
    }
    v8 = v2;
    -[NSObject setIdleTimerMode:](v8, "setIdleTimerMode:", 0);
    -[NSObject setWallpaperMode:](v8, "setWallpaperMode:", 0);
    goto LABEL_9;
  }
  if (v6)
  {
    v8 = v5;
    v10 = 138412290;
    v11 = (id)objc_opt_class(v2);
    v9 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unexpected scene settings class: %@", (uint8_t *)&v10, 0xCu);

LABEL_9:
  }

}

void sub_100014AC4(id a1, NSNotification *a2)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "LUILegibilitySettingsDidChangeNotification is caught...", v6, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIImageCache sharedInstance](LUIImageCache, "sharedInstance"));
  objc_msgSend(v3, "clearAllCaches");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContactCache sharedInstance](LUIContactCache, "sharedInstance"));
  objc_msgSend(v4, "clearGroupAndGuestImageContact");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUIUpdateSupport sharedInstance](LUIUIUpdateSupport, "sharedInstance"));
  objc_msgSend(v5, "setViewControllerStackAnimated:deferrable:", 1, 0);

}

void sub_100014EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100014EDC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fetchConfiguration");

}

void sub_1000150A4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = qword_100088F08;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_ERROR))
      sub_10003B9C8(a1, (uint64_t)v3, v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEBUG))
  {
    sub_10003B95C(a1, v4, v5);
  }

}

id sub_10001532C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newClassRosterReceived:", *(_QWORD *)(a1 + 40));
}

id sub_100015338(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newClassRosterReceived:", 0);
}

void sub_100015570(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LUIPersistentImageCache sharedCache](LUIPersistentImageCache, "sharedCache"));
  objc_msgSend(v2, "cancelAllPendingImageFetchOperations");
  objc_msgSend(v2, "fetchImagesAsyncForUsers:", *(_QWORD *)(a1 + 32));

}

void sub_1000157A8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1000157D8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "logindAcceptedOurConnection"))
    objc_msgSend(WeakRetained, "checkInWithLoginD");

}

void sub_100015810(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnectionToLoginD:", 0);

}

void sub_100015890(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  if (v2)
  {
    v3 = qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Getting a proxy to logind failed, error: %@.", (uint8_t *)&v4, 0xCu);
    }
  }

}

void sub_10001597C(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[LUIPopUpController sharedInstance](LUIPopUpController, "sharedInstance"));
  objc_msgSend(v1, "showPopUp:forUser:completionHandler:", 3, 0, 0);

}

void sub_100015A4C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  LUIUserSwitchTestOngoingIndicatorController *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOngoingIndicatorController"));

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = (LUIUserSwitchTestOngoingIndicatorController *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOngoingIndicatorController"));
    -[LUIUserSwitchTestOngoingIndicatorController setCancelButtonActionBlock:](v4, "setCancelButtonActionBlock:", v3);
  }
  else
  {
    v4 = -[LUIUserSwitchTestOngoingIndicatorController initWithCancelButtonAction:]([LUIUserSwitchTestOngoingIndicatorController alloc], "initWithCancelButtonAction:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setTestOngoingIndicatorController:", v4);
  }

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOngoingIndicatorController"));
  objc_msgSend(v5, "show");

}

void sub_100015B60(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOngoingIndicatorController"));
  objc_msgSend(v1, "hide");

}

uint64_t sub_100015D60(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "presentUserLoginViewControllerForUserInfo:inClass:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void sub_100015F74(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  SBSSetAllApplicationsShowProgress(0, 100);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_1000161B8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "newClassRosterReceived:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

id sub_1000162A4(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000162F8;
  v3[3] = &unk_1000693D0;
  v3[4] = v1;
  return objc_msgSend(v1, "_fetchConfiguration:", v3);
}

void sub_1000162F8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  _QWORD block[5];
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;

  v5 = a2;
  v6 = a3;
  v7 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Response received from fetch configuration request.", buf, 2u);
  }
  v8 = qword_100088F08;
  v9 = os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Null configuration received.", buf, 2u);
    }
    v15 = (id)objc_claimAutoreleasedReturnValue(+[LUIContainerSupport sharedInstance](LUIContainerSupport, "sharedInstance"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "classRosterInformationFileURL"));
    if (v16)
    {
      v17 = (void *)v16;
      v46 = a1;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContainerSupport sharedInstance](LUIContainerSupport, "sharedInstance"));
      v20 = v6;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "classRosterInformationFileURL"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "path"));
      v23 = objc_msgSend(v18, "fileExistsAtPath:", v22);

      v6 = v20;
      if (!v23)
        goto LABEL_33;
      v24 = qword_100088F08;
      if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Removing the cached configuration.", buf, 2u);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContainerSupport sharedInstance](LUIContainerSupport, "sharedInstance"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "classRosterInformationFileURL"));
      v48 = 0;
      objc_msgSend(v25, "removeItemAtURL:error:", v27, &v48);
      v15 = v48;

      if (v15)
      {
        v28 = (void *)qword_100088F08;
        if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_ERROR))
          sub_10003BA4C(v28);
      }
      v29 = qword_100088F08;
      if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Setting up LoginUI with no configuration...", buf, 2u);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000168B0;
      block[3] = &unk_100068C58;
      block[4] = *(_QWORD *)(v46 + 32);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }

    goto LABEL_33;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Valid configuration fetched.", buf, 2u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContainerSupport sharedInstance](LUIContainerSupport, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cachedClassConfiguration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dictionary"));
  v13 = objc_msgSend(v5, "isEqualToDictionary:", v12);

  if ((v13 & 1) != 0)
  {
    v14 = qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "LoginUI has the same configuration with the fetched configuration. No need to update the UI...", buf, 2u);
    }
  }
  else
  {
    v30 = objc_msgSend(objc_alloc((Class)LKClassConfiguration), "initWithDictionary:", v5);
    v31 = (void *)qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContainerSupport sharedInstance](LUIContainerSupport, "sharedInstance"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "classRosterInformationFileURL"));
      v35 = v6;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "absoluteString"));
      *(_DWORD *)buf = 138412290;
      v53 = v36;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Archiving the configuration object to file path: %@ \n", buf, 0xCu);

      v6 = v35;
    }
    v51 = 0;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v30, 1, &v51));
    v38 = v51;
    if (v38)
    {
      v39 = qword_100088F08;
      if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_ERROR))
        sub_10003BB54(v39);
    }
    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContainerSupport sharedInstance](LUIContainerSupport, "sharedInstance"));
      v41 = v6;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "classRosterInformationFileURL"));
      objc_msgSend(v37, "writeToURL:atomically:", v42, 0);

      v6 = v41;
    }
    v43 = (void *)qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEBUG))
      sub_10003BACC(v43);
    v44 = qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Configuration is fetched and parsed successfully! Setting up LoginUI accordingly...", buf, 2u);
    }
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000168A4;
    v49[3] = &unk_100068C30;
    v49[4] = *(_QWORD *)(a1 + 32);
    v50 = v30;
    v45 = v30;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v49);

  }
LABEL_33:

}

id sub_1000168A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newClassRosterReceived:", *(_QWORD *)(a1 + 40));
}

id sub_1000168B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newClassRosterReceived:", 0);
}

uint64_t sub_100016938(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1000169A8(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[LUIWiFiManager sharedInstance](LUIWiFiManager, "sharedInstance"));
  objc_msgSend(v1, "enableWiFi");

}

void sub_100016A18(id a1)
{
  NSObject *v1;
  id v2;
  uint8_t v3[16];

  v1 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Disable Airplane mode", v3, 2u);
  }
  v2 = objc_alloc_init((Class)RadiosPreferences);
  objc_msgSend(v2, "setAirplaneMode:", 0);

}

void sub_100016C08(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[LUISetupController sharedController](LUISetupController, "sharedController"));
  objc_msgSend(v1, "updateRecentUsersViewControllersIfNeeded");

}

void sub_100016E68(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100016E8C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "menuButtonPressed");

}

id sub_10001700C(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  v2 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Goodbye view is about to appear...", v5, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
  objc_msgSend(v3, "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);

  return objc_msgSend(*(id *)(a1 + 40), "setDisplayAnimationCompletionBlock:", &stru_100069478);
}

void sub_1000170A4(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  objc_msgSend(v1, "switchToLoginUserWithCompletionHandler:", &stru_100069498);

}

void sub_1000170E0(id a1, NSError *a2)
{
  NSError *v2;
  void *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_ERROR))
      sub_10003BBD0(v3);
  }

}

id sub_1000171A8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupLogViewerIfNeeded");
}

void sub_10001745C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100017470(id a1)
{
  return a1;
}

void sub_100017478(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t sub_100017484()
{
  uint64_t v0;

  return v0;
}

void sub_1000174D0(id a1)
{
  LUISchoolManager *v1;
  void *v2;

  v1 = objc_opt_new(LUISchoolManager);
  v2 = (void *)qword_100088D80;
  qword_100088D80 = (uint64_t)v1;

}

void sub_100017BD4(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  id v3;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[1];
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "backOffMessage"));
  objc_msgSend(v2, "setHintLabelText:", v3);

}

id sub_100017E60(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setHintLabelText:", *(_QWORD *)(a1 + 40));
}

id sub_100017FE4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resignFirstResponder");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setHintLabelText:", 0);
}

id sub_100018290(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void sub_1000182A0(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "passcodeView"));
  objc_msgSend(v2, "resetForFailedPasscode");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "becomeFirstResponder");
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
  objc_msgSend(v3, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

id sub_10001839C(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "passcodeView"));
  objc_msgSend(v2, "resetForFailedPasscode");

  v3 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEBUG))
    sub_10003BC50(a1, v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setHintLabelText:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "becomeFirstResponder");
}

void sub_1000187B4(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    v3 = qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_ERROR))
      sub_10003BCC8((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }

}

void sub_1000188F8(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    v3 = qword_100088F38;
    if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_ERROR))
      sub_10003BD30((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }

}

void sub_100018AF0(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setIsFetchingAuthMode:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "swipeUpAnimationController"));
  objc_msgSend(v2, "setEnabled:", 1);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dashBoardView"));
  objc_msgSend(v3, "setCallToActionLabelEnabled:", 1);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018B9C;
  block[3] = &unk_100068C58;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100018B9C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dashBoardView"));
  objc_msgSend(v1, "stopProgressAnimation");

}

id sub_100019144(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void sub_100019154(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

void sub_100019320(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  void *v13;
  uint8_t buf[4];
  void *v15;

  v13 = 0;
  v2 = MKBCurrentSyncBubbleSessionID(&v13);
  v3 = v13;
  if ((v2 & 0x80000000) != 0)
  {
    v9 = qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v3;
      v6 = "Failed to get current sync bubble session ID: %{public}@";
      v7 = v9;
      v8 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    v4 = v2;
    if (objc_msgSend(*(id *)(a1 + 32), "uid") == (_DWORD)v2)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "currentBubbleUID") != (_DWORD)v4)
      {
        v11 = *(void **)(a1 + 40);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1000194DC;
        v12[3] = &unk_100068C58;
        v12[4] = v11;
        objc_msgSend(v11, "_queue_terminateBubbleForID:completionHandler:", v4, v12);
        goto LABEL_12;
      }
      v5 = qword_100088F08;
      if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v15) = v4;
        v6 = "We have scheduled sync bubble termination for uid: %d. Doing nothing this time";
        v7 = v5;
        v8 = 8;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
    else
    {
      v10 = qword_100088F08;
      if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v6 = "Asked to terminate a sync bubble session that is not live. Just return";
        v7 = v10;
        v8 = 2;
        goto LABEL_10;
      }
    }
  }
LABEL_12:

}

void sub_1000194DC(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionHandler"));

  if (v2)
  {
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionHandler"));
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  }
}

void sub_1000195FC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  void *v14;
  uint8_t buf[4];
  void *v16;

  v14 = 0;
  v2 = MKBCurrentSyncBubbleSessionID(&v14);
  v3 = v14;
  if ((v2 & 0x80000000) != 0)
  {
    v6 = qword_100088F08;
    if (!os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 138543362;
    v16 = v3;
    v7 = "Failed to get current sync bubble session ID: %{public}@";
    v8 = v6;
    v9 = 12;
    goto LABEL_10;
  }
  v4 = v2;
  if (objc_msgSend(*(id *)(a1 + 32), "uid") == (_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "setCompletionHandler:", *(_QWORD *)(a1 + 48));
    if (objc_msgSend(*(id *)(a1 + 40), "currentBubbleUID") == (_DWORD)v4)
    {
      v5 = qword_100088F08;
      if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sync bubble termination for the current session has been scheduled. Just waiting...", buf, 2u);
      }
    }
    else
    {
      v12 = *(void **)(a1 + 40);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000197C8;
      v13[3] = &unk_100068C58;
      v13[4] = v12;
      objc_msgSend(v12, "_queue_terminateBubbleForID:completionHandler:", v4, v13);
    }
    goto LABEL_14;
  }
  v10 = qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v7 = "Asked to terminate a sync bubble session that is not live. Just return";
    v8 = v10;
    v9 = 2;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
  }
LABEL_11:
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(void))(v11 + 16))();
LABEL_14:

}

void sub_1000197C8(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionHandler"));

  if (v2)
  {
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionHandler"));
    v3[2]();

    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  }
}

void sub_100019954(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "syncBubbleQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000199DC;
  v4[3] = &unk_100069330;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t sub_1000199DC(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentBubbleUID:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10001A910(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  float v17;
  id v18;
  void *v19;
  id obj;
  uint64_t v21;
  NSMutableDictionary *v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _QWORD v36[4];

  v23 = objc_opt_new(NSMutableDictionary);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  v36[0] = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 1));
  v36[1] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2));
  v36[2] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3));
  v36[3] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 4));

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v21 = *(_QWORD *)v31;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(obj);
        v25 = v6;
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v6);
        v8 = objc_opt_new(NSMutableDictionary);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v9 = *(id *)(a1 + 32);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v27;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v27 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v13);
              v15 = objc_alloc((Class)CNMonogrammer);
              v16 = objc_msgSend(v7, "integerValue");
              objc_msgSend(v14, "floatValue");
              v18 = objc_msgSend(v15, "initWithStyle:diameter:", v16, v17);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v18, v14);

              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v11);
        }

        -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v8, v7);
        v6 = v25 + 1;
      }
      while ((id)(v25 + 1) != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }

  v19 = (void *)qword_100088D90;
  qword_100088D90 = (uint64_t)v23;

}

void sub_10001AC0C(id a1)
{
  double v1;
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[6];

  LODWORD(v1) = 1132462080;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v1));
  v15[0] = v2;
  LODWORD(v3) = 1127481344;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v3));
  v15[1] = v4;
  LODWORD(v5) = 1123024896;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v5));
  v15[2] = v6;
  LODWORD(v7) = 1118961664;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
  v15[3] = v8;
  LODWORD(v9) = 1117257728;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
  v15[4] = v10;
  LODWORD(v11) = 1110704128;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
  v15[5] = v12;
  v13 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 6));
  v14 = (void *)qword_100088DA0;
  qword_100088DA0 = v13;

}

void sub_10001B4D0(id a1)
{
  LUIAuthenticationController *v1;
  void *v2;

  v1 = objc_opt_new(LUIAuthenticationController);
  v2 = (void *)qword_100088DB0;
  qword_100088DB0 = (uint64_t)v1;

}

void sub_10001C27C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

id sub_10001C2A0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loginFlowStepFinished:result:configuration:environment:", 1, a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_10001C2B8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loginFlowStepFinished:result:configuration:environment:", 4, a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_10001C2D0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loginFlowStepFinished:result:configuration:environment:", 5, a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10001C2E8(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001C380;
  v4[3] = &unk_100069748;
  v4[4] = v3;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_createUserAndUpdatePasscodeData:completionHandler:", v5, v4);

}

id sub_10001C380(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loginFlowStepFinished:result:configuration:environment:", 7, a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t sub_10001C398(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001C3A4(id *a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  id v13;
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "passcode"));

  v3 = qword_100088F30;
  v4 = os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      v5 = "Load user";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
    }
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    v5 = "Load user for passcode reset";
    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  objc_msgSend(a1[5], "_updateUserPasscodeLockGracePeriod:", a1[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "user"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "passcodeData"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001C508;
  v11[3] = &unk_100069798;
  v10 = *((int8x16_t *)a1 + 2);
  v9 = (id)v10.i64[0];
  v12 = vextq_s8(v10, v10, 8uLL);
  v13 = a1[6];
  objc_msgSend(v6, "loadUser:passcodeData:completionHandler:", v7, v8, v11);

}

void sub_10001C508(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)a1[4];
  if (a2)
  {
    v8 = CFSTR("userAuthError");
    v9 = a2;
    v4 = a2;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    objc_msgSend(v3, "_loginFlowStepFinished:result:configuration:environment:", 8, v5, a1[5], a1[6]);

  }
  else
  {
    v7 = a1[5];
    v6 = a1[6];
    v5 = 0;
    objc_msgSend(v3, "_loginFlowStepFinished:result:configuration:environment:", 8, 0, v7, v6);
  }

}

void sub_10001C5E8(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_loginFlowStepFinished:result:configuration:environment:", 9, v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_10001C640(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v3 = (void *)a1[4];
  v2 = (void *)a1[5];
  v4 = a1[6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001C6E0;
  v5[3] = &unk_100069748;
  v5[4] = v3;
  v6 = v2;
  v7 = (id)a1[6];
  objc_msgSend(v3, "_switchUserWithConfiguration:environment:completionHandler:", v6, v4, v5);

}

id sub_10001C6E0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loginFlowStepFinished:result:configuration:environment:", 10, a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10001D3E4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v1, "authenticationCanceled");

}

void sub_10001D9B4(uint64_t a1)
{
  id v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
  v1 = objc_msgSend(v2, "popToRootViewControllerAnimated:", 1);

}

void sub_10001D9F0(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

void sub_10001DA38(id a1, NSError *a2)
{
  NSError *v2;
  void *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (void *)qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_ERROR))
      sub_10003C0BC(v3);
  }

}

void sub_10001E1A8(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12[2];
  id location;

  v5 = a3;
  objc_initWeak(&location, a1[4]);
  v6 = a1[4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001E2B4;
  v8[3] = &unk_100069808;
  objc_copyWeak(v12, &location);
  v9 = a1[5];
  v12[1] = a2;
  v7 = v5;
  v10 = v7;
  v11 = a1[6];
  objc_msgSend(v6, "_queueBlock:", v8);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

}

void sub_10001E298(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_10001E2B4(uint64_t a1)
{
  id WeakRetained;
  unsigned int v3;
  void *v4;
  uint64_t v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_msgSend(*(id *)(a1 + 32), "isValid");
    WeakRetained = v6;
    if (v3)
    {
      objc_msgSend(v6, "invalidateAndNilTimer:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_fetchAuthResultDictionaryForAuthMode:error:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40)));
      v5 = *(_QWORD *)(a1 + 48);
      if (v5)
        (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

      WeakRetained = v6;
    }
  }

}

void sub_10001E434(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001E450(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetch auth mode is taking too long", v7, 2u);
    }
    objc_msgSend(WeakRetained, "_increaseTimeoutInterval");
    objc_msgSend(WeakRetained, "invalidateAndNilTimer:", *(_QWORD *)(a1 + 32));
    kdebug_trace(732758048, 0, 0, 0, 0);
    if (*(_QWORD *)(a1 + 40))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", LKErrorDomain, 30, 0));
      v5 = *(_QWORD *)(a1 + 40);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_fetchAuthResultDictionaryForAuthMode:error:", 0, v4));
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
  }

}

uint64_t sub_10001EA6C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10001EBF0(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(*(id *)(a1 + 32), "authEnded");
  kdebug_trace(732758048, 0, 0, 0, 0);
  v5 = v10;
  if (!v10)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a2));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "authModeCache"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "username"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    v5 = 0;
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v10);
    v5 = v10;
  }

}

void sub_10001EDC4(id a1, NSError *a2)
{
  NSError *v2;

  v2 = a2;
  if (v2 && os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_ERROR))
    sub_10003C14C();

}

void sub_10001EEE4(id a1, NSError *a2)
{
  NSError *v2;

  v2 = a2;
  if (v2 && os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_ERROR))
    sub_10003C1AC();

}

void sub_10001F000(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001F140;
  v10[3] = &unk_100068C30;
  v3 = *(_QWORD *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F14C;
  v7[3] = &unk_100068D60;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F15C;
  v4[3] = &unk_1000698E8;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "presentPasscodeViewControllerForUser:passcodeViewDidAppearAction:passcodeCanceledAction:passcodeEnteredAction:", v3, v10, v7, v4);

}

id sub_10001F140(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_passcodeViewDidAppearActionWithConfiguration:", *(_QWORD *)(a1 + 40));
}

id sub_10001F14C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_passcodeEnterDidCancelActionWithConfiguration:environment:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10001F15C(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v5 = (void *)a1[4];
  v9[0] = CFSTR("password");
  v9[1] = CFSTR("passwordResponder");
  v10[0] = a2;
  v10[1] = a3;
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
  objc_msgSend(v5, "_loginFlowStepFinished:result:configuration:environment:", 2, v8, a1[5], a1[6]);

}

void sub_10001F824(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id location;

  v5 = a2;
  v6 = a3;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001F954;
  v10[3] = &unk_100069938;
  objc_copyWeak(&v15, &location);
  v16 = *(_BYTE *)(a1 + 56);
  v11 = *(id *)(a1 + 40);
  v8 = v5;
  v12 = v8;
  v9 = v6;
  v13 = v9;
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v7, "_queueBlock:", v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void sub_10001F938(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_10001F954(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remote auth server response received", buf, 2u);
    }
    if (*(_BYTE *)(a1 + 72) || (objc_msgSend(*(id *)(a1 + 32), "isValid") & 1) != 0)
    {
      kdebug_trace(732758024, 0, 0, 0, 0);
      objc_msgSend(WeakRetained, "invalidateAndNilTimer:", *(_QWORD *)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_remoteAuthResultDictionaryForServerResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
      v5 = *(_QWORD *)(a1 + 56);
      if (v5)
        (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);

    }
    else
    {
      v6 = qword_100088F30;
      if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remote auth was overridden", v7, 2u);
      }
    }
  }

}

void sub_100020BAC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100020BC8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isPresentingFedAuthPrompt") & 1) == 0)
  {
    v4 = qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote auth is taking too long", v8, 2u);
    }
    objc_msgSend(v3, "_increaseTimeoutInterval");
    objc_msgSend(v3, "invalidateAndNilTimer:", *(_QWORD *)(a1 + 32));
    kdebug_trace(732758024, 0, 0, 0, 0);
    if (*(_QWORD *)(a1 + 40))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", LKErrorDomain, 30, 0));
      v6 = *(_QWORD *)(a1 + 40);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_remoteAuthResultDictionaryForServerResponse:error:", 0, v5));
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
  }

}

void sub_1000210CC(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;
  void (*v5)(uint64_t, _QWORD);
  const __CFString *v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v6 = CFSTR("userAuthError");
    v7 = a2;
    v3 = a2;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v4);

  }
  else
  {
    v5 = *(void (**)(uint64_t, _QWORD))(v2 + 16);
    v4 = 0;
    v5(v2, 0);
  }

}

void sub_1000217D8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  id v19;
  uint8_t buf[4];
  void *v21;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "code") == (id)16)
    {
      v5 = 15;
    }
    else
    {
      v14 = qword_100088F30;
      if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "createUser failed with error: %{public}@", buf, 0xCu);
      }
      v5 = 17;
    }
    v12 = (id)objc_claimAutoreleasedReturnValue(+[LKError errorWithCode:](LKError, "errorWithCode:", v5));

    v18 = CFSTR("userAuthError");
    v19 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Saving user keybag opaque data...", buf, 2u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "user"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeUtilities defaultPublicDictionaryForUMUserPasscodeType:](MCPasscodeUtilities, "defaultPublicDictionaryForUMUserPasscodeType:", objc_msgSend(v7, "passcodeType")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v8, 200, 0, 0));

    v10 = *(void **)(a1 + 40);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "user"));
    v15 = 0;
    objc_msgSend(v10, "setKeybagOpaqueDataForUser:withOpaqueData:withError:", v11, v9, &v15);
    v12 = v15;

    if (v12)
    {
      v16 = CFSTR("userAuthError");
      v17 = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    }
    else
    {
      v13 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

uint64_t (**sub_100021B08(uint64_t a1, char a2))(id, uint64_t)
{
  uint64_t (**result)(id, uint64_t);
  NSObject *v4;
  uint8_t v5[16];

  if ((a2 & 1) != 0)
  {
    result = *(uint64_t (***)(id, uint64_t))(a1 + 40);
    if (result)
      return (uint64_t (**)(id, uint64_t))result[2](result, 1);
  }
  else
  {
    v4 = qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to remove a clean user. Will try to purge cache data...", v5, 2u);
    }
    return (uint64_t (**)(id, uint64_t))objc_msgSend(*(id *)(a1 + 32), "_purgeSpaceWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

void sub_100021B9C(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LKLoginSupport findLeastRecentlyUsedCleanUser](LKLoginSupport, "findLeastRecentlyUsedCleanUser"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100021C60;
    v4[3] = &unk_100069380;
    v5 = *(id *)(a1 + 32);
    objc_msgSend(v3, "deleteUser:completionHandler:", v2, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_100021C60(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;

  v3 = a2;
  if (v3)
  {
    v4 = qword_100088F30;
    if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to delete a clean user due to error: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100021F30(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  double v12;
  __int16 v13;
  void *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT")));
  v5 = objc_msgSend(v4, "longLongValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ERROR")));
  v7 = qword_100088F30;
  if (os_log_type_enabled((os_log_t)qword_100088F30, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218498;
    v10 = v5;
    v11 = 2048;
    v12 = (double)(unint64_t)v5 / 1000000000.0;
    v13 = 2114;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cache delete completed with %llu bytes (%.2f GB) purged, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v6 == 0);

}

void sub_1000221BC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v8 = CFSTR("userAuthError");
      v9 = v3;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setUserAlreadyExist:", 0);
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }

}

id sub_100022428(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Getting ready view is about to appear...", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 40), 1);
  return objc_msgSend(*(id *)(a1 + 40), "setDisplayAnimationCompletionBlock:", *(_QWORD *)(a1 + 48));
}

void sub_10002277C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      v7 = CFSTR("userAuthError");
      v8 = v3;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
    }
  }

}

void sub_100022844(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      v7 = CFSTR("userAuthError");
      v8 = v3;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
    }
  }

}

void sub_1000235D4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "alertControllerForAuthError:", *(_QWORD *)(a1 + 48)));
  objc_msgSend(v1, "presentViewController:animated:completion:", v2, 1, 0);

}

void sub_100023624(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v1, "authenticationCanceled");

}

id sub_100023730(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startProgressAnimation");
}

id sub_100023814(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopProgressAnimation");
}

void sub_10002385C(id a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "window"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));
  v4 = (void *)qword_100088DC0;
  qword_100088DC0 = v3;

}

id sub_100023A58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

id sub_100023F38(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_passcodeViewDidAppearActionWithConfiguration:", *(_QWORD *)(a1 + 40));
}

id sub_100023F44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_passcodeEnterDidCancelActionWithConfiguration:environment:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_100023F54(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v5 = (void *)a1[4];
  v9[0] = CFSTR("password");
  v9[1] = CFSTR("passwordResponder");
  v10[0] = a2;
  v10[1] = a3;
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
  objc_msgSend(v5, "_loginFlowStepFinished:result:configuration:environment:", 2, v8, a1[5], a1[6]);

}

id sub_10002410C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsPresentingFedAuthPrompt:", 1);
}

id sub_1000241BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsPresentingFedAuthPrompt:", 0);
}

void sub_100024808(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10002486C(id a1)
{
  LUILockButtonController *v1;
  void *v2;

  v1 = objc_opt_new(LUILockButtonController);
  v2 = (void *)qword_100088DD0;
  qword_100088DD0 = (uint64_t)v1;

}

void sub_100024A4C(id a1)
{
  LUISetupController *v1;
  void *v2;

  v1 = objc_opt_new(LUISetupController);
  v2 = (void *)qword_100088DE0;
  qword_100088DE0 = (uint64_t)v1;

}

id sub_100025544(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

id sub_1000256E0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void sub_10002637C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1000263B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

uint64_t sub_1000263C4()
{
  uint64_t v0;

  return objc_opt_class(v0);
}

id sub_1000281D4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideCallToAction");
}

id sub_1000281DC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showCallToAction");
}

void sub_1000285C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000285DC(uint64_t a1, double a2, double a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_homeAffordancePositionAnimationWithDuration:beginTime:", a2, a3));
    v10 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_1000288C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000288E0(uint64_t a1, double a2, double a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_textPositionAnimationWithDuration:beginTime:", a2, a3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_textAlphaAnimationWithDuration:beginTime:", a2, a3));
    v11[0] = v7;
    v11[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t sub_100029794(uint64_t a1)
{
  uint64_t result;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "currentReachabilityStatus"))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "networkObservers"));
  v4 = objc_retainBlock(*(id *)(a1 + 40));
  objc_msgSend(v3, "addObject:", v4);

  result = (uint64_t)objc_msgSend(*(id *)(a1 + 32), "isWaitingForNetwork");
  if ((result & 1) == 0)
    return (uint64_t)objc_msgSend(*(id *)(a1 + 32), "_observeNetworkReachability");
  return result;
}

id sub_100029A34(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_networkReachabilityChanged:", a2);
}

id sub_100029A9C(uint64_t a1)
{
  id result;
  NSObject *v3;
  const __SCNetworkReachability *v4;
  __CFRunLoop *Main;
  uint8_t v6[16];

  result = objc_msgSend(*(id *)(a1 + 32), "networkStatusForFlags:", *(unsigned int *)(a1 + 40));
  if (result)
  {
    v3 = qword_100088F10;
    if (os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Network became available.", v6, 2u);
    }
    v4 = *(const __SCNetworkReachability **)(*(_QWORD *)(a1 + 32) + 16);
    Main = CFRunLoopGetMain();
    SCNetworkReachabilityUnscheduleFromRunLoop(v4, Main, kCFRunLoopCommonModes);
    objc_msgSend(*(id *)(a1 + 32), "setIsWaitingForNetwork:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyObservers");
  }
  return result;
}

void sub_100029BF4(id a1)
{
  LUIKeyboardStateListener *v1;
  void *v2;

  v1 = objc_opt_new(LUIKeyboardStateListener);
  v2 = (void *)qword_100088DF0;
  qword_100088DF0 = (uint64_t)v1;

}

void sub_100029FC4(id a1)
{
  LUISortingSupport *v1;
  void *v2;

  v1 = objc_opt_new(LUISortingSupport);
  v2 = (void *)qword_100088E00;
  qword_100088E00 = (uint64_t)v1;

}

uint64_t sub_10002A2DC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  id v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  if (objc_msgSend(v7, "length")
    && objc_msgSend(*(id *)(a1 + 32), "isSpecialCharacter:", objc_msgSend(v7, "characterAtIndex:", 0)))
  {
    if (objc_msgSend(v8, "length"))
      v9 = objc_msgSend(*(id *)(a1 + 32), "isSpecialCharacter:", objc_msgSend(v8, "characterAtIndex:", 0)) ^ 1;
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v7, "length")
    && (objc_msgSend(*(id *)(a1 + 32), "isSpecialCharacter:", objc_msgSend(v7, "characterAtIndex:", 0)) & 1) != 0)
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    v10 = objc_msgSend(v8, "length");
    if (v10)
      LOBYTE(v10) = objc_msgSend(*(id *)(a1 + 32), "isSpecialCharacter:", objc_msgSend(v8, "characterAtIndex:", 0));
  }
  if (v9)
    v11 = 1;
  else
    v11 = -1;
  if (((v9 | v10) & 1) == 0)
    v11 = (uint64_t)objc_msgSend(v7, "localizedCompare:", v8);

  return v11;
}

void sub_10002AACC(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isLoginSession"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentUser"));
    if (objc_msgSend(v3, "isLoginUser"))
    {
      byte_100088E10 = 0;
    }
    else
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      byte_100088E10 = objc_msgSend(v2, "BOOLForKey:", CFSTR("LUIDisableAttentionAwareIdleTimer")) ^ 1;

    }
  }
  else
  {
    byte_100088E10 = 0;
  }
}

void sub_10002ABAC(id a1)
{
  LUIAttentionAwareIdleTimer *v1;
  void *v2;

  v1 = objc_opt_new(LUIAttentionAwareIdleTimer);
  v2 = (void *)qword_100088E20;
  qword_100088E20 = (uint64_t)v1;

}

void sub_10002AD3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002AD60(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *WeakRetained;
  int v8;
  id v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "eventMask");
  v5 = qword_100088F40;
  v6 = os_log_type_enabled((os_log_t)qword_100088F40, OS_LOG_TYPE_DEFAULT);
  if (v4 == (id)1)
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attention lost.", (uint8_t *)&v8, 2u);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[NSObject _attentionLost](WeakRetained, "_attentionLost");
    goto LABEL_7;
  }
  if (v6)
  {
    WeakRetained = v5;
    v8 = 134217984;
    v9 = objc_msgSend(v3, "eventMask");
    _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "Untracked attention aware event: %llu", (uint8_t *)&v8, 0xCu);
LABEL_7:

  }
}

void sub_10002B1D0(id a1)
{
  LUIHomeButtonController *v1;
  void *v2;

  v1 = objc_opt_new(LUIHomeButtonController);
  v2 = (void *)qword_100088E30;
  qword_100088E30 = (uint64_t)v1;

}

void sub_10002BCD4(id a1)
{
  LUIWiFiManager *v1;
  void *v2;

  v1 = objc_opt_new(LUIWiFiManager);
  v2 = (void *)qword_100088E40;
  qword_100088E40 = (uint64_t)v1;

}

void sub_10002BDA0(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  v3 = qword_100088F10;
  if (os_log_type_enabled((os_log_t)qword_100088F10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_WiFiManagerClientServerRestartedCallback", v4, 2u);
  }
  objc_msgSend(v2, "enableWiFi");

}

void sub_10002C780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002C7AC(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = qword_100088F38;
  if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received profile list changed notification: %@", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(WeakRetained, "_updateFooterText");
  if (objc_msgSend(WeakRetained, "isDynamicHeightEnabled"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "superview"));
    objc_msgSend(v6, "setNeedsLayout");

  }
}

void sub_10002D414(id a1)
{
  LUIPrivacyStyle *v1;
  void *v2;

  v1 = objc_opt_new(LUIPrivacyStyle);
  v2 = (void *)qword_100088E50;
  qword_100088E50 = (uint64_t)v1;

}

void sub_10002D600(id a1)
{
  LUIImageManipulation *v1;
  void *v2;

  v1 = objc_opt_new(LUIImageManipulation);
  v2 = (void *)qword_100088E60;
  qword_100088E60 = (uint64_t)v1;

}

void sub_10002D808()
{
  if (qword_100088E70 != -1)
    dispatch_once(&qword_100088E70, &stru_100069CC0);
}

void sub_10002D830(id a1)
{
  os_log_t v1;
  void *v2;
  os_log_t v3;
  void *v4;
  os_log_t v5;
  void *v6;
  os_log_t v7;
  void *v8;
  os_log_t v9;
  void *v10;
  os_log_t v11;
  void *v12;
  os_log_t v13;
  void *v14;
  os_log_t v15;
  void *v16;

  v1 = os_log_create(off_100088A50, "Default");
  v2 = (void *)qword_100088F08;
  qword_100088F08 = (uint64_t)v1;

  v3 = os_log_create(off_100088A50, "WiFi");
  v4 = (void *)qword_100088F10;
  qword_100088F10 = (uint64_t)v3;

  v5 = os_log_create(off_100088A50, "WiFiUIBehavior");
  v6 = (void *)qword_100088F18;
  qword_100088F18 = (uint64_t)v5;

  v7 = os_log_create(off_100088A50, "Bluetooth");
  v8 = (void *)qword_100088F20;
  qword_100088F20 = (uint64_t)v7;

  v9 = os_log_create(off_100088A50, "ImageFetching");
  v10 = (void *)qword_100088F28;
  qword_100088F28 = (uint64_t)v9;

  v11 = os_log_create(off_100088A50, "Auth");
  v12 = (void *)qword_100088F30;
  qword_100088F30 = (uint64_t)v11;

  v13 = os_log_create(off_100088A50, "UIBehavior");
  v14 = (void *)qword_100088F38;
  qword_100088F38 = (uint64_t)v13;

  v15 = os_log_create(off_100088A50, "AttentionAwareIdleTimer");
  v16 = (void *)qword_100088F40;
  qword_100088F40 = (uint64_t)v15;

}

void sub_10002D988(id a1)
{
  LUIContainerSupport *v1;
  void *v2;

  v1 = objc_opt_new(LUIContainerSupport);
  v2 = (void *)qword_100088E78;
  qword_100088E78 = (uint64_t)v1;

}

void sub_10002E0E4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD block[5];
  id v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;

  v14 = 0;
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "monogramForContact:isContactImage:", *(_QWORD *)(a1 + 40), &v14));
  if (v2)
  {
    v3 = (void *)v2;
    if (objc_msgSend(*(id *)(a1 + 48), "_isDistortedImage:", v2))
    {
      v4 = (void *)qword_100088F38;
      if (os_log_type_enabled((os_log_t)qword_100088F38, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(void **)(a1 + 48);
        v6 = v4;
        objc_msgSend(v5, "monogramDiameter");
        *(_DWORD *)buf = 134217984;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CNMonogrammer monogramForContact: returned a distorted monogram with diameter: %lf. Drawing another monogram...", buf, 0xCu);

      }
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "monogramForContact:isContactImage:", *(_QWORD *)(a1 + 40), &v14));

      v3 = (void *)v8;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[LUIImageCache sharedInstance](LUIImageCache, "sharedInstance"));
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "monogramDiameter");
    objc_msgSend(v9, "cacheImage:forContact:monogramDiameter:imageType:", v3, v10, v14 == 0);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002E284;
    block[3] = &unk_100068C30;
    block[4] = *(_QWORD *)(a1 + 48);
    v13 = v3;
    v11 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

id sub_10002E284(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setImage:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

void sub_10002E2B8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contacts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "monogramForContacts:", v3));

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002E364;
  v6[3] = &unk_100068C30;
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

id sub_10002E364(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setImage:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

void sub_10002E48C(id a1)
{
  LUIRandomImageAssignment *v1;
  void *v2;

  v1 = objc_opt_new(LUIRandomImageAssignment);
  v2 = (void *)qword_100088E88;
  qword_100088E88 = (uint64_t)v1;

}

void sub_10002E794(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UIImage *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSData *v16;
  void *v17;
  id v18;

  v18 = a2;
  v7 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[LUIImageManipulation sharedInstance](LUIImageManipulation, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v18));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v9));
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "squareImageFromImage:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContainerSupport sharedInstance](LUIContainerSupport, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "containerLibraryDirectoryURL"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "suggestedFilename"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByAppendingPathComponent:", v14));

    v16 = UIImagePNGRepresentation(v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v17, "writeToURL:atomically:", v15, 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void sub_10002EAB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if (!a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setLocalMediumImageURL:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue(+[LUIContactCache sharedInstance](LUIContactCache, "sharedInstance"));
    objc_msgSend(v4, "updateContactImageDataForUser:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(AppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

void sub_10002F89C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithWallpaperVariant:", 0);
  v2 = (void *)qword_100088E98;
  qword_100088E98 = (uint64_t)v1;

}

void sub_10002F93C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithWallpaperVariant:", 1);
  v2 = (void *)qword_100088EA8;
  qword_100088EA8 = (uint64_t)v1;

}

void sub_10002F9A8(id a1)
{
  double v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "_referenceBounds");
  byte_100088EB8 = v1 > 834.0;

}

void sub_10002FB28(id a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc((Class)_UILegibilitySettings), "initWithStyle:", 1);
  v2 = (void *)qword_100088EC8;
  qword_100088EC8 = (uint64_t)v1;

}

id sub_100034E28(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  void *v18;
  _BYTE v19[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    v12 = v2;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "changeType") == (id)1)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "collectionView"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v7, "newIndex"), 0));
          v18 = v9;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
          objc_msgSend(v8, "insertItemsAtIndexPaths:", v10);
        }
        else if (objc_msgSend(v7, "changeType") == (id)2)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "collectionView"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v7, "oldIndex"), 0));
          v17 = v9;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
          objc_msgSend(v8, "deleteItemsAtIndexPaths:", v10);
        }
        else
        {
          if (objc_msgSend(v7, "changeType") != (id)3)
            continue;
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "collectionView"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v7, "oldIndex"), 0));
          v2 = v12;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v7, "newIndex"), 0));
          objc_msgSend(v8, "moveItemAtIndexPath:toIndexPath:", v9, v10);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "setArrangedObjects:", *(_QWORD *)(a1 + 48));
}

void sub_100035814(id a1)
{
  LUIPopUpController *v1;
  void *v2;

  v1 = objc_opt_new(LUIPopUpController);
  v2 = (void *)qword_100088ED8;
  qword_100088ED8 = (uint64_t)v1;

}

void sub_1000362E8(id a1)
{
  LUIWiFiController *v1;
  void *v2;

  v1 = objc_opt_new(LUIWiFiController);
  v2 = (void *)qword_100088EE8;
  qword_100088EE8 = (uint64_t)v1;

}

void sub_10003713C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1000373CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000373F4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (v8)
  {
    objc_msgSend(WeakRetained, "endOperationWithError:", v8);
  }
  else
  {
    v11 = (void *)qword_100088F28;
    v12 = os_log_type_enabled((os_log_t)qword_100088F28, OS_LOG_TYPE_DEBUG);
    if (a2 && v7)
    {
      if (v12)
        sub_10003CB58(v11);
      v13 = v10;
      v14 = v7;
    }
    else
    {
      if (v12)
        sub_10003CBDC(a1, v11);
      v13 = v10;
      v14 = 0;
    }
    objc_msgSend(v13, "endOperationWithResultObject:", v14);
  }

}

void sub_1000374C4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (v8)
  {
    objc_msgSend(WeakRetained, "endOperationWithError:", v8);
  }
  else
  {
    v11 = (void *)qword_100088F28;
    v12 = os_log_type_enabled((os_log_t)qword_100088F28, OS_LOG_TYPE_DEBUG);
    if (a2 && v7)
    {
      if (v12)
        sub_10003CC80(v11);
      v13 = v10;
      v14 = v7;
    }
    else
    {
      if (v12)
        sub_10003CD04(a1, v11);
      v13 = v10;
      v14 = 0;
    }
    objc_msgSend(v13, "endOperationWithResultObject:", v14);
  }

}

void sub_10003762C(id a1)
{
  LUIBluetoothSupport *v1;
  void *v2;

  v1 = objc_opt_new(LUIBluetoothSupport);
  v2 = (void *)qword_100088EF8;
  qword_100088EF8 = (uint64_t)v1;

}

void sub_10003AFA8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138478083;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Could not log in user: %{private}@, error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_10003B030(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Current sync bubble session ID: %d", (uint8_t *)v2, 8u);
}

void sub_10003B0A4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C98((void *)&_mh_execute_header, a2, a3, "Failed to get current sync bubble session ID: %{public}@", a5, a6, a7, a8, 2u);
  sub_100006CA8();
}

void sub_10003B108(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C98((void *)&_mh_execute_header, a1, a3, "%s: Will update sync task state", a5, a6, a7, a8, 2u);
  sub_100006CA8();
}

void sub_10003B178(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to get sync mach services list for bubble ID: %{public}@ with error %{public}@", (uint8_t *)&v3, 0x16u);
  sub_100006CA8();
}

void sub_10003B1F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C98((void *)&_mh_execute_header, a2, a3, "Updating sync state for uid: %@", a5, a6, a7, a8, 2u);
  sub_100006CA8();
}

void sub_10003B25C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to switch wallpaper variant", v1, 2u);
}

void sub_10003B29C(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v3 = a1;
  v4 = (void *)objc_opt_class(a2);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
  v8 = 138412547;
  v9 = v4;
  v10 = 2113;
  v11 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@ contact image changed: %{private}@", (uint8_t *)&v8, 0x16u);

}

void sub_10003B384(void *a1, uint64_t a2)
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;

  v3 = a1;
  v5 = 138477827;
  v6 = (id)objc_opt_class(a2);
  v4 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Class Table View: %{private}@ one or multiple contact images has changed.", (uint8_t *)&v5, 0xCu);

}

void sub_10003B428(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "wifiPickerSuppressionReasons"));
  sub_10000F7DC();
  sub_10000F7BC((void *)&_mh_execute_header, v5, v6, "WiFi picker suppressed for reasons: %@", v7, v8, v9, v10, v11);

  sub_10000F7D0();
}

void sub_10003B4B0(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "wifiPickerSuppressionReasons"));
  sub_10000F7DC();
  sub_10000F7BC((void *)&_mh_execute_header, v5, v6, "WiFi picker still suppressed for reasons: %@", v7, v8, v9, v10, v11);

  sub_10000F7D0();
}

void sub_10003B538()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10000F7DC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Removing reason to suppress WiFi picker: %@", v1, 0xCu);
}

void sub_10003B5A8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "statusBarUserName"));
  sub_10000F7DC();
  sub_10000F7BC((void *)&_mh_execute_header, v5, v6, "Setting status bar user: %{private}@", v7, v8, v9, v10, v11);

  sub_10000F7D0();
}

void sub_10003B630(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000144EC((void *)&_mh_execute_header, a2, a3, "Error creating user image download cache directory: %@", a5, a6, a7, a8, 2u);
  sub_100006CA8();
}

void sub_10003B694(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000144EC((void *)&_mh_execute_header, a2, a3, "Error getting system group container: %llu", a5, a6, a7, a8, 0);
  sub_100006CA8();
}

void sub_10003B6FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000144FC((void *)&_mh_execute_header, a1, a3, "No image downloaded.", a5, a6, a7, a8, 0);
}

void sub_10003B730(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000144FC((void *)&_mh_execute_header, a1, a3, "We have a downloaded image, about to cache it.", a5, a6, a7, a8, 0);
}

void sub_10003B764(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v4 = *(void **)(a1 + 40);
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "description"));
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "We have an error while fetching the image for URL: \n %@ \n ERROR: \n %@ \n This might be because the device is not enrolled to MDM.", (uint8_t *)&v8, 0x16u);

}

void sub_10003B834(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "displayName"));
  v5 = 138477827;
  v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Fetch image operation finished for user: %{private}@", (uint8_t *)&v5, 0xCu);

}

void sub_10003B8DC(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100017470(a1);
  v2 = objc_msgSend((id)sub_100017484(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000F7DC();
  sub_10001745C((void *)&_mh_execute_header, v4, v5, "Error checking in with keybagd: %{public}@", v6, v7, v8, v9, v10);

  sub_10000F7D0();
}

void sub_10003B95C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138477827;
  v5 = v3;
  sub_100017478((void *)&_mh_execute_header, a2, a3, "Deleted user: %{private}@", (uint8_t *)&v4);
  sub_100006CA8();
}

void sub_10003B9C8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138478083;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not delete user: %{private}@, error: %{public}@", (uint8_t *)&v4, 0x16u);
  sub_100006CA8();
}

void sub_10003BA4C(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100017470(a1);
  v2 = objc_msgSend((id)sub_100017484(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000F7DC();
  sub_10001745C((void *)&_mh_execute_header, v4, v5, "%@", v6, v7, v8, v9, v10);

  sub_10000F7D0();
}

void sub_10003BACC(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  sub_100017470(a1);
  v2 = objc_msgSend((id)sub_100017484(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000F7DC();
  sub_100017478((void *)&_mh_execute_header, v1, v4, " Configuration: %{private}@", v5);

  sub_10000F7D0();
}

void sub_10003BB54(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[AppDelegate fetchConfiguration]_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to archive classConfiguration", (uint8_t *)&v1, 0xCu);
  sub_100006CA8();
}

void sub_10003BBD0(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100017470(a1);
  v2 = objc_msgSend((id)sub_100017484(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000F7DC();
  sub_10001745C((void *)&_mh_execute_header, v4, v5, "Error switching to login user: %@", v6, v7, v8, v9, v10);

  sub_10000F7D0();
}

void sub_10003BC50(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Setting passcode hint: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10003BCC8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000144EC((void *)&_mh_execute_header, a2, a3, "Failed to set active student identifier: %@", a5, a6, a7, a8, 2u);
}

void sub_10003BD30(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000144EC((void *)&_mh_execute_header, a2, a3, "Failed to clear active student identifier: %@", a5, a6, a7, a8, 2u);
}

void sub_10003BD98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000144EC((void *)&_mh_execute_header, a1, a3, "%s We have a login ongoing, abort", a5, a6, a7, a8, 2u);
  sub_100006CA8();
}

void sub_10003BE08(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000144EC((void *)&_mh_execute_header, a1, a3, "%s We have a login ongoing, abort", a5, a6, a7, a8, 2u);
  sub_100006CA8();
}

void sub_10003BE78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000144EC((void *)&_mh_execute_header, a1, a3, "%s We have a login ongoing, abort", a5, a6, a7, a8, 2u);
  sub_100006CA8();
}

void sub_10003BEE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000144EC((void *)&_mh_execute_header, a1, a3, "%s We have a login ongoing, abort", a5, a6, a7, a8, 2u);
  sub_100006CA8();
}

void sub_10003BF58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F7DC();
  sub_1000144EC((void *)&_mh_execute_header, v0, v1, "We could not stash recovery data: %{private}@", v2, v3, v4, v5, v6);
  sub_100006CA8();
}

void sub_10003BFB8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "User is locked according to IdMS", v1, 2u);
}

void sub_10003BFF8(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[12];
  __int16 v9;
  uint64_t v10;

  v5 = sub_100017470(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "user"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "username"));
  sub_10000F7DC();
  v9 = 2114;
  v10 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Could not log in user: %{private}@, error: %{public}@", v8, 0x16u);

}

void sub_10003C0BC(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  uint8_t v4[24];

  sub_100017470(a1);
  v2 = objc_msgSend((id)sub_100017484(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000F7DC();
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Error switching to login user: %@", v4, 0xCu);

  sub_10000F7D0();
}

void sub_10003C14C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F7DC();
  sub_1000144EC((void *)&_mh_execute_header, v0, v1, "Failed to set active student identifier: %@", v2, v3, v4, v5, v6);
  sub_100006CA8();
}

void sub_10003C1AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F7DC();
  sub_1000144EC((void *)&_mh_execute_header, v0, v1, "Failed to clear active student identifier: %@", v2, v3, v4, v5, v6);
  sub_100006CA8();
}

void sub_10003C20C(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100017470(a1);
  v2 = objc_msgSend((id)sub_100017484(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000F7DC();
  sub_10000F7BC((void *)&_mh_execute_header, v4, v5, "Preferences to set: %@", v6, v7, v8, v9, v10);

  sub_10000F7D0();
}

void sub_10003C28C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100024818();
  sub_100024808((void *)&_mh_execute_header, v0, v1, "%s: Failed to create setupData with error: %{public}@", v2, v3, v4, v5, 2u);
  sub_100006CA8();
}

void sub_10003C2F8(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100017470(a1);
  v2 = objc_msgSend((id)sub_100017484(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000F7DC();
  sub_10000F7BC((void *)&_mh_execute_header, v4, v5, "We have preferences to set before login: %@", v6, v7, v8, v9, v10);

  sub_10000F7D0();
}

void sub_10003C378()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100024818();
  sub_100024808((void *)&_mh_execute_header, v0, v1, "%s: Failed to create setupData with error: %{public}@", v2, v3, v4, v5, 2u);
  sub_100006CA8();
}

void sub_10003C3E4(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100017470(a1);
  v2 = objc_msgSend((id)sub_100017484(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000F7DC();
  sub_10000F7BC((void *)&_mh_execute_header, v4, v5, "Presenting alert controller for error: %{private}@", v6, v7, v8, v9, v10);

  sub_10000F7D0();
}

void sub_10003C464(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  sub_100017470(a1);
  v5 = (objc_class *)sub_1000263C4();
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "recentUsersViewControllers"));
  objc_msgSend(v8, "count");
  sub_1000263A0();
  sub_10002637C((void *)&_mh_execute_header, v9, v10, "%@ is flagged. Flagged Recent User View Controller Count: %lu", v11, v12, v13, v14, v15);

  sub_100026390();
}

void sub_10003C504(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  sub_100017470(a1);
  v5 = (objc_class *)sub_1000263C4();
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "recentUsersViewControllers"));
  objc_msgSend(v8, "count");
  sub_1000263A0();
  sub_10002637C((void *)&_mh_execute_header, v9, v10, "%@ is unflagged. Flagged Recent User View Controller Count: %lu", v11, v12, v13, v14, v15);

  sub_100026390();
}

void sub_10003C5A4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1000263B8((void *)&_mh_execute_header, a3, (uint64_t)a3, "Updating the top view controller to reflect the user list update.", a1);
}

void sub_10003C5D8(uint8_t *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;

  v7 = a2;
  v8 = (objc_class *)objc_opt_class(a3);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  *(_DWORD *)a1 = 138412290;
  *a4 = v10;
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Recent User View Controller: %@", a1, 0xCu);

}

void sub_10003C65C(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  id v6;

  v3 = sub_100017470(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "recentUsersViewControllers"));
  v5 = 134217984;
  v6 = objc_msgSend(v4, "count");
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Recent User View Controller count: %lu", (uint8_t *)&v5, 0xCu);

}

void sub_10003C700(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_1000263B8((void *)&_mh_execute_header, a1, a3, "Update recent user view controllers if needed.", v3);
}

void sub_10003C738(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000144EC((void *)&_mh_execute_header, a2, a3, "Attention aware timer failed to start: error = %{public}@.", a5, a6, a7, a8, 2u);
}

void sub_10003C7A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000144EC((void *)&_mh_execute_header, a2, a3, "Attention aware timer failed to suspend: error = %{public}@.", a5, a6, a7, a8, 2u);
}

void sub_10003C808(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Disabling WiFi blacklisting...", v1, 2u);
}

void sub_10003C848(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "WiFi blacklisting disabled: %{private}@", (uint8_t *)&v2, 0xCu);
}

void sub_10003C8BC(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "absoluteString"));
  sub_10000F7BC((void *)&_mh_execute_header, v5, v6, "Reading roster information from %@", v7, v8, v9, v10, 2u);

  sub_10000F7D0();
}

void sub_10003C948(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "absoluteString"));
  sub_10000F7BC((void *)&_mh_execute_header, v5, v6, "Error: Create folder failed %@", v7, v8, v9, v10, 2u);

  sub_10000F7D0();
}

void sub_10003C9D4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to load random image url plist with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10003CA48(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Couldn't find index path for long pressed cell", v1, 2u);
}

void sub_10003CA88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003714C();
  sub_10003713C((void *)&_mh_execute_header, v0, v1, "Height of view size (%lf) is less than content height (%lf). We need to scroll!", v2, v3, v4, v5, v6);
}

void sub_10003CAF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003714C();
  sub_10003713C((void *)&_mh_execute_header, v0, v1, "Width of view size (%lf) is less than content width (%lf). :( Nooo!", v2, v3, v4, v5, v6);
}

void sub_10003CB58(void *a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = objc_msgSend((id)sub_100017484(), "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10000F7DC();
  sub_10000F7BC((void *)&_mh_execute_header, v5, v6, "About to save medium image to local URL: %{private}@", v7, v8, v9, v10, v11);

  sub_10000F7D0();
}

void sub_10003CBDC(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v3 = a2;
  v4 = objc_msgSend((id)sub_100017484(), "mediumImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
  sub_10000F7DC();
  sub_10000F7BC((void *)&_mh_execute_header, v7, v8, "Couldn't save the image with url: %{private}@", v9, v10, v11, v12, v13);

  sub_100026390();
}

void sub_10003CC80(void *a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = objc_msgSend((id)sub_100017484(), "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10000F7DC();
  sub_10000F7BC((void *)&_mh_execute_header, v5, v6, "About to save the large image local URL: %{private}@", v7, v8, v9, v10, v11);

  sub_10000F7D0();
}

void sub_10003CD04(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v3 = a2;
  v4 = objc_msgSend((id)sub_100017484(), "largeImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
  sub_10000F7DC();
  sub_10000F7BC((void *)&_mh_execute_header, v7, v8, "Couldn't save the large image with url: %{privatself->e}@", v9, v10, v11, v12, v13);

  sub_100026390();
}

void sub_10003CDA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003790C();
  sub_1000144FC((void *)&_mh_execute_header, v0, v1, "Bluetooth status is unknown.", v2, v3, v4, v5, v6);
  sub_100037904();
}

void sub_10003CDD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003790C();
  sub_1000144FC((void *)&_mh_execute_header, v0, v1, "Bluetooth is unavailable.", v2, v3, v4, v5, v6);
  sub_100037904();
}

void sub_10003CE00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003790C();
  sub_1000144FC((void *)&_mh_execute_header, v0, v1, "Bluetooth is ON", v2, v3, v4, v5, v6);
  sub_100037904();
}

void sub_10003CE2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10003790C();
  sub_1000144FC((void *)&_mh_execute_header, v0, v1, "Bluetooth is OFF.", v2, v3, v4, v5, v6);
  sub_100037904();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGImage");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGPath");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_URLsForDirectory_inDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLsForDirectory:inDomains:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_FBSScene");
}

id objc_msgSend__activateLayoutConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_activateLayoutConstraints");
}

id objc_msgSend__addColorChangeAnimationOnLayer_from_to_duration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addColorChangeAnimationOnLayer:from:to:duration:");
}

id objc_msgSend__addImageDataObserversToContacts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addImageDataObserversToContacts:");
}

id objc_msgSend__addImageFetchOperationToQueueForUser_imageSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addImageFetchOperationToQueueForUser:imageSize:");
}

id objc_msgSend__addLongPressGestureRecognizer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addLongPressGestureRecognizer");
}

id objc_msgSend__addNotUpdatedRecentUsersViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addNotUpdatedRecentUsersViewController:");
}

id objc_msgSend__addRepeatedAnimationWithProvider_animationDuration_toLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addRepeatedAnimationWithProvider:animationDuration:toLayer:");
}

id objc_msgSend__addResetAnimationForKeyPath_onLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addResetAnimationForKeyPath:onLayer:");
}

id objc_msgSend__addRotationAnimationOnLayer_duration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addRotationAnimationOnLayer:duration:");
}

id objc_msgSend__addStrokeEndAnimationOnLayer_duration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addStrokeEndAnimationOnLayer:duration:");
}

id objc_msgSend__addTextAnimation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addTextAnimation");
}

id objc_msgSend__addTextResetAnimation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addTextResetAnimation");
}

id objc_msgSend__allStudentsClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_allStudentsClass");
}

id objc_msgSend__analyzeRemoteAuthResult_andUpdateConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_analyzeRemoteAuthResult:andUpdateConfiguration:");
}

id objc_msgSend__animationKeyForKeyPath_iteration_reset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_animationKeyForKeyPath:iteration:reset:");
}

id objc_msgSend__anonymousUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_anonymousUser");
}

id objc_msgSend__attentionLost(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_attentionLost");
}

id objc_msgSend__cacheDownloadedImage_toDestionation_forURL_scaleToSquareImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheDownloadedImage:toDestionation:forURL:scaleToSquareImage:");
}

id objc_msgSend__cacheForDestination_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheForDestination:");
}

id objc_msgSend__cacheForImageType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cacheForImageType:");
}

id objc_msgSend__cachedImageForURL_fromDestionation_scaleToSquareImage_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cachedImageForURL:fromDestionation:scaleToSquareImage:withCompletionHandler:");
}

id objc_msgSend__canLocallyAuthUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_canLocallyAuthUser:");
}

id objc_msgSend__canLocallyAuthUserWithUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_canLocallyAuthUserWithUsername:");
}

id objc_msgSend__checkForCurrentUserPasscodeChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkForCurrentUserPasscodeChange:");
}

id objc_msgSend__checkNeedForScrolling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkNeedForScrolling");
}

id objc_msgSend__checkOpacities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkOpacities");
}

id objc_msgSend__cleanUpEverything(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanUpEverything");
}

id objc_msgSend__clearTextFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearTextFields");
}

id objc_msgSend__colorForSyncTaskState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_colorForSyncTaskState:");
}

id objc_msgSend__comparator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_comparator");
}

id objc_msgSend__connectToLoginD(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectToLoginD");
}

id objc_msgSend__contactSortOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_contactSortOrder");
}

id objc_msgSend__contactsForInstructors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_contactsForInstructors:");
}

id objc_msgSend__createFooterNoteLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createFooterNoteLabel");
}

id objc_msgSend__createInAppContextFromConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createInAppContextFromConfiguration:");
}

id objc_msgSend__createInitialConfigurationForAnonymousUserWithResultResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createInitialConfigurationForAnonymousUserWithResultResponder:");
}

id objc_msgSend__createInitialConfigurationForLocalUserWithUsername_altDSID_password_givenName_isTemporarySession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createInitialConfigurationForLocalUserWithUsername:altDSID:password:givenName:isTemporarySession:");
}

id objc_msgSend__createInitialConfigurationForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createInitialConfigurationForUser:");
}

id objc_msgSend__createInitialEnvironment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createInitialEnvironment");
}

id objc_msgSend__createTemporaryPreferencesToSetIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createTemporaryPreferencesToSetIfNeeded:");
}

id objc_msgSend__createTextLabelWithAttributedText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createTextLabelWithAttributedText:");
}

id objc_msgSend__createUserAndUpdatePasscodeData_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createUserAndUpdatePasscodeData:completionHandler:");
}

id objc_msgSend__defaultWallpaperLegibilitySettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_defaultWallpaperLegibilitySettings");
}

id objc_msgSend__deleteUserAndUpdateConfiguration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deleteUserAndUpdateConfiguration:completionHandler:");
}

id objc_msgSend__enableUserInteractionAndStartIdleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableUserInteractionAndStartIdleTimer");
}

id objc_msgSend__evictCleanUserOrCacheDeleteWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_evictCleanUserOrCacheDeleteWithCompletionHandler:");
}

id objc_msgSend__fakeAltDSIDForUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fakeAltDSIDForUsername:");
}

id objc_msgSend__fakeRestrictionlessLoginAuthenticationResultsWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fakeRestrictionlessLoginAuthenticationResultsWithConfiguration:");
}

id objc_msgSend__fetchAuthMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchAuthMode");
}

id objc_msgSend__fetchAuthModeWithUser_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchAuthModeWithUser:completionHandler:");
}

id objc_msgSend__fetchAuthResultDictionaryForAuthMode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchAuthResultDictionaryForAuthMode:error:");
}

id objc_msgSend__fetchConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchConfiguration:");
}

id objc_msgSend__fileStoreForDestination_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileStoreForDestination:");
}

id objc_msgSend__fileWrapperFromImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fileWrapperFromImage:");
}

id objc_msgSend__filteredUsers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_filteredUsers:");
}

id objc_msgSend__firstLineBaselineOffsetFromBoundsTop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_firstLineBaselineOffsetFromBoundsTop");
}

id objc_msgSend__fixedClassGroupDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fixedClassGroupDictionary");
}

id objc_msgSend__handleAuthenticationError_configuration_step_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleAuthenticationError:configuration:step:");
}

id objc_msgSend__headerFontSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_headerFontSize");
}

id objc_msgSend__headerHintText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_headerHintText");
}

id objc_msgSend__homeAffordancePositionAnimationWithDuration_beginTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_homeAffordancePositionAnimationWithDuration:beginTime:");
}

id objc_msgSend__homeAffordanceRestingFrame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_homeAffordanceRestingFrame");
}

id objc_msgSend__imageForImageType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_imageForImageType:");
}

id objc_msgSend__imageFromFileWrapper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_imageFromFileWrapper:");
}

id objc_msgSend__inEnglishLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_inEnglishLocale");
}

id objc_msgSend__increaseTimeoutInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_increaseTimeoutInterval");
}

id objc_msgSend__initializeBottomLeftVibrantButtonIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeBottomLeftVibrantButtonIfNeeded");
}

id objc_msgSend__initializeBottomRightVibrantButtonIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeBottomRightVibrantButtonIfNeeded");
}

id objc_msgSend__initializeLoginWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeLoginWindow");
}

id objc_msgSend__instructorsInClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_instructorsInClass:");
}

id objc_msgSend__isAuthErrorWithServerErrorCode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isAuthErrorWithServerErrorCode:error:");
}

id objc_msgSend__isDistortedImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isDistortedImage:");
}

id objc_msgSend__isNSURLDomainNoInternetError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isNSURLDomainNoInternetError:");
}

id objc_msgSend__isNSURLDomainTimeoutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isNSURLDomainTimeoutError:");
}

id objc_msgSend__isNetworkError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isNetworkError:");
}

id objc_msgSend__isRestrictionlessLoginEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isRestrictionlessLoginEnabled");
}

id objc_msgSend__isUnmanagedDeviceError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isUnmanagedDeviceError:");
}

id objc_msgSend__kickOffLoginFlowStep_configuration_environment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_kickOffLoginFlowStep:configuration:environment:");
}

id objc_msgSend__legalString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_legalString");
}

id objc_msgSend__localizedShortNameForComponents_withStyle_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localizedShortNameForComponents:withStyle:options:");
}

id objc_msgSend__loginFlowStepFinished_result_configuration_environment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loginFlowStepFinished:result:configuration:environment:");
}

id objc_msgSend__maxLabelWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_maxLabelWidth");
}

id objc_msgSend__monitorQueueIncreaseUpdateFrequency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_monitorQueueIncreaseUpdateFrequency");
}

id objc_msgSend__monitorQueueNotifyPresentersForUID_syncTaskState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_monitorQueueNotifyPresentersForUID:syncTaskState:");
}

id objc_msgSend__monitorQueueScheduleSyncTaskStateUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_monitorQueueScheduleSyncTaskStateUpdate");
}

id objc_msgSend__monitorQueueStartObservingSyncTaskStateChangeIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_monitorQueueStartObservingSyncTaskStateChangeIfNeeded");
}

id objc_msgSend__monogramImageFromTemplateImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_monogramImageFromTemplateImage:");
}

id objc_msgSend__moveElementsToView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_moveElementsToView:");
}

id objc_msgSend__nameForEnglishLocaleWithPersonNameComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nameForEnglishLocaleWithPersonNameComponents:");
}

id objc_msgSend__nameOfStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nameOfStep:");
}

id objc_msgSend__organizationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_organizationName");
}

id objc_msgSend__passcodeBackoffIntervalForUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_passcodeBackoffIntervalForUsername:");
}

id objc_msgSend__presentAlertControllerForError_inNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentAlertControllerForError:inNavigationController:");
}

id objc_msgSend__presentGettingReadyViewInNavigationController_forUser_isTemporarySession_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentGettingReadyViewInNavigationController:forUser:isTemporarySession:completionHandler:");
}

id objc_msgSend__presentPasswordViewControllerAndMoveOnForUser_configuration_environment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentPasswordViewControllerAndMoveOnForUser:configuration:environment:");
}

id objc_msgSend__printReachabilityStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_printReachabilityStatus:");
}

id objc_msgSend__purgeSpaceWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_purgeSpaceWithCompletionHandler:");
}

id objc_msgSend__queueBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queueBlock:");
}

id objc_msgSend__queue_notifyObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queue_notifyObservers");
}

id objc_msgSend__queue_terminateBubbleForID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queue_terminateBubbleForID:completionHandler:");
}

id objc_msgSend__recentUsersSection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recentUsersSection");
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_referenceBounds");
}

id objc_msgSend__refreshLegibilitySettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_refreshLegibilitySettings");
}

id objc_msgSend__remoteAuthResultDictionaryForServerResponse_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteAuthResultDictionaryForServerResponse:error:");
}

id objc_msgSend__removeImageDataObserversFromContacts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeImageDataObserversFromContacts:");
}

id objc_msgSend__removeNormalAnimationsForKeyPath_onLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeNormalAnimationsForKeyPath:onLayer:");
}

id objc_msgSend__removeResetAnimationForKeyPath_onLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeResetAnimationForKeyPath:onLayer:");
}

id objc_msgSend__resetTransition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resetTransition");
}

id objc_msgSend__savePreferenceIfNeededWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_savePreferenceIfNeededWithConfiguration:");
}

id objc_msgSend__savePreferences_forUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_savePreferences:forUsername:");
}

id objc_msgSend__secondHintText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_secondHintText");
}

id objc_msgSend__setBackgroundStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setBackgroundStyle:");
}

id objc_msgSend__setBypassSetupAssistantIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setBypassSetupAssistantIfNeeded:");
}

id objc_msgSend__setHeaderAndFooterViewsFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setHeaderAndFooterViewsFloat:");
}

id objc_msgSend__setPassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setPassword:");
}

id objc_msgSend__setTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setTitle");
}

id objc_msgSend__setup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setup");
}

id objc_msgSend__setupEnvironmentForAppleIDScreenTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupEnvironmentForAppleIDScreenTest");
}

id objc_msgSend__setupEnvironmentForAssignStudentScreenTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupEnvironmentForAssignStudentScreenTest");
}

id objc_msgSend__setupEnvironmentForClassScreenTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupEnvironmentForClassScreenTest");
}

id objc_msgSend__setupEnvironmentForRecentUserScreenTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupEnvironmentForRecentUserScreenTest");
}

id objc_msgSend__setupFastLaunch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupFastLaunch");
}

id objc_msgSend__setupFooterNote(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupFooterNote");
}

id objc_msgSend__setupGesture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupGesture");
}

id objc_msgSend__setupNavigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupNavigationItem");
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupViews");
}

id objc_msgSend__setupWIFIPicker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupWIFIPicker");
}

id objc_msgSend__skipRemoteAuthDueToBackoff_environment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_skipRemoteAuthDueToBackoff:environment:");
}

id objc_msgSend__skipRemoteAuthDueToUserDefaultsSetting_environment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_skipRemoteAuthDueToUserDefaultsSetting:environment:");
}

id objc_msgSend__startCircleAnimation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startCircleAnimation");
}

id objc_msgSend__startFetchingAuthModeWithTimeoutForUser_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startFetchingAuthModeWithTimeoutForUser:completionHandler:");
}

id objc_msgSend__startRemoteAuthWithConfiguration_environment_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startRemoteAuthWithConfiguration:environment:completionHandler:");
}

id objc_msgSend__stashRecoveryInfo_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stashRecoveryInfo:completionHandler:");
}

id objc_msgSend__subtitleAttributedString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_subtitleAttributedString");
}

id objc_msgSend__swapInstanceMethod_originalClass_forNewInstanceMethod_newClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_swapInstanceMethod:originalClass:forNewInstanceMethod:newClass:");
}

id objc_msgSend__switchUserWithConfiguration_environment_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_switchUserWithConfiguration:environment:completionHandler:");
}

id objc_msgSend__systemGroupContainerURLWithGroupIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemGroupContainerURLWithGroupIdentifier:");
}

id objc_msgSend__tableView_classCellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tableView:classCellForRowAtIndexPath:");
}

id objc_msgSend__tableView_didSelectClassRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tableView:didSelectClassRowAtIndexPath:");
}

id objc_msgSend__tableView_didSelectUserRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tableView:didSelectUserRowAtIndexPath:");
}

id objc_msgSend__tableView_recentUserCellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tableView:recentUserCellForRowAtIndexPath:");
}

id objc_msgSend__tableViewConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tableViewConstraints");
}

id objc_msgSend__terminateUserLoginFlowFromStep_error_configuration_environment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_terminateUserLoginFlowFromStep:error:configuration:environment:");
}

id objc_msgSend__test_applicationDidBecomeActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_test_applicationDidBecomeActive:");
}

id objc_msgSend__textAlphaAnimationWithDuration_beginTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_textAlphaAnimationWithDuration:beginTime:");
}

id objc_msgSend__textPositionAnimationWithDuration_beginTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_textPositionAnimationWithDuration:beginTime:");
}

id objc_msgSend__topConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_topConstraints");
}

id objc_msgSend__translateErrorToLKErrorIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_translateErrorToLKErrorIfNeeded:");
}

id objc_msgSend__underTestingEnvironment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_underTestingEnvironment");
}

id objc_msgSend__updateBottomLeftVibrantButtonIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateBottomLeftVibrantButtonIfNeeded");
}

id objc_msgSend__updateBottomRightVibrantButtonIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateBottomRightVibrantButtonIfNeeded");
}

id objc_msgSend__updateConfigurationWithFetchAuthModeResult_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateConfigurationWithFetchAuthModeResult:result:");
}

id objc_msgSend__updateConfigurationWithPasscodeEnterResult_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateConfigurationWithPasscodeEnterResult:result:");
}

id objc_msgSend__updateDefaultDomainSetting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDefaultDomainSetting");
}

id objc_msgSend__updateFooterText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateFooterText");
}

id objc_msgSend__updateGettingReadyToSwitchViewTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateGettingReadyToSwitchViewTitle");
}

id objc_msgSend__updateLabelsForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateLabelsForUser:");
}

id objc_msgSend__updateOrganizationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateOrganizationName");
}

id objc_msgSend__updateTransitionProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateTransitionProgress:");
}

id objc_msgSend__updateUserPasscodeLockGracePeriod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateUserPasscodeLockGracePeriod:");
}

id objc_msgSend__updatedAuthenticationResultsForVeryFirstTimeLogin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatedAuthenticationResultsForVeryFirstTimeLogin:");
}

id objc_msgSend__updatedUserWithOldUser_passcodeType_authenticationResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updatedUserWithOldUser:passcodeType:authenticationResults:");
}

id objc_msgSend__urlForDestination_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_urlForDestination:");
}

id objc_msgSend__username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_username");
}

id objc_msgSend__validateUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateUsername:");
}

id objc_msgSend__viewControllerForStudentProvider_withRosterHeader_containsRecentUsers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_viewControllerForStudentProvider:withRosterHeader:containsRecentUsers:");
}

id objc_msgSend__willNameFit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_willNameFit:");
}

id objc_msgSend__willNameFit_forFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_willNameFit:forFont:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessibilityIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessibilityIdentifier");
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryView");
}

id objc_msgSend_actionBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionBlock");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activateLayoutConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateLayoutConstraints");
}

id objc_msgSend_activateTapType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateTapType:");
}

id objc_msgSend_activeInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeInstance");
}

id objc_msgSend_activityIndicatorViewStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityIndicatorViewStyle");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addArrangedSubview:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addConstraint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addConstraint:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPointer:");
}

id objc_msgSend_addRecentUsersViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRecentUsersViewController:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addSyncTaskPresenter_forUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSyncTaskPresenter:forUser:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_alertControllerForAuthError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerForAuthError:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alertForPossibleLogoutError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertForPossibleLogoutError");
}

id objc_msgSend_alertForUserLimitReached(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertForUserLimitReached");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allUsers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allUsers");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_alternateDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alternateDSID");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_appDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appDelegate");
}

id objc_msgSend_appearanceWhenContainedInInstancesOfClasses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appearanceWhenContainedInInstancesOfClasses:");
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appleIDIndicatorLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleIDIndicatorLabel");
}

id objc_msgSend_appleIDLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleIDLabel");
}

id objc_msgSend_applyIndicatorLabelThemeToLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyIndicatorLabelThemeToLabel:");
}

id objc_msgSend_applyIndicatorLabelThemeToLabels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyIndicatorLabelThemeToLabels:");
}

id objc_msgSend_applyRowStackViewPropertiesToStackView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyRowStackViewPropertiesToStackView:");
}

id objc_msgSend_applyRowStackViewPropertiesToStackViews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyRowStackViewPropertiesToStackViews:");
}

id objc_msgSend_applyStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyStyle:");
}

id objc_msgSend_applyThemeToLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyThemeToLabel:");
}

id objc_msgSend_applyThemeToLabels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyThemeToLabels:");
}

id objc_msgSend_applyThemeToTitleLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyThemeToTitleLabel:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arguments");
}

id objc_msgSend_arrangedObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrangedObjectAtIndex:");
}

id objc_msgSend_arrangedObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrangedObjects");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ascender");
}

id objc_msgSend_assetTagTextLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetTagTextLabel");
}

id objc_msgSend_assignImagesRandomlyToUsers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assignImagesRandomlyToUsers:");
}

id objc_msgSend_attentionAwarenessClientQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attentionAwarenessClientQueue");
}

id objc_msgSend_authBegan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authBegan");
}

id objc_msgSend_authEnded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authEnded");
}

id objc_msgSend_authMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authMode");
}

id objc_msgSend_authModeCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authModeCache");
}

id objc_msgSend_authenticateWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticateWithContext:completion:");
}

id objc_msgSend_authenticateWithUser_password_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticateWithUser:password:completionHandler:");
}

id objc_msgSend_authenticationCanceled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationCanceled");
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "available");
}

id objc_msgSend_avatarImageForContacts_scope_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avatarImageForContacts:scope:");
}

id objc_msgSend_avatarNameFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avatarNameFont");
}

id objc_msgSend_avatarStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avatarStyle");
}

id objc_msgSend_avatarView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avatarView");
}

id objc_msgSend_avatarViewWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avatarViewWithFrame:");
}

id objc_msgSend_avatarViewWithFrame_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avatarViewWithFrame:style:");
}

id objc_msgSend_backOffMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backOffMessage");
}

id objc_msgSend_backgroundStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundStyle");
}

id objc_msgSend_baseView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baseView");
}

id objc_msgSend_baselineHintInsetForPasscodeStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baselineHintInsetForPasscodeStyle:");
}

id objc_msgSend_baselineInsetForFooterButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baselineInsetForFooterButton");
}

id objc_msgSend_baselineInsetForHeaderTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baselineInsetForHeaderTitle");
}

id objc_msgSend_baselineInsetForSpinner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baselineInsetForSpinner");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_beginBackOffForSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginBackOffForSeconds:");
}

id objc_msgSend_beginConsumingPressesForButtonKind_eventConsumer_priority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginConsumingPressesForButtonKind:eventConsumer:priority:");
}

id objc_msgSend_beginDisablingViewUpdatesForReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginDisablingViewUpdatesForReason:");
}

id objc_msgSend_beginSuppressingWiFiPickerForReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginSuppressingWiFiPickerForReason:");
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginUpdates");
}

id objc_msgSend_bezierPathWithArcCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_bindContentToObject_withKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bindContentToObject:withKeyPath:");
}

id objc_msgSend_blackBottomView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackBottomView");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_blackView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackView");
}

id objc_msgSend_blockOperationWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockOperationWithBlock:");
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blueColor");
}

id objc_msgSend_bluetoothStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothStatus");
}

id objc_msgSend_blurBackgroundStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blurBackgroundStyle");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldSystemFontOfSize:");
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

id objc_msgSend_bottomCenterConstraintsForPrivacyView_inView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomCenterConstraintsForPrivacyView:inView:");
}

id objc_msgSend_bottomInset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomInset");
}

id objc_msgSend_bottomPadding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomPadding");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_buttonTitleFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonTitleFont");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cacheImage_forContact_monogramDiameter_imageType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cacheImage:forContact:monogramDiameter:imageType:");
}

id objc_msgSend_cachedClassConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedClassConfiguration");
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_callToActionLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callToActionLabel");
}

id objc_msgSend_callToActionLabelText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callToActionLabelText");
}

id objc_msgSend_canLoginWithLocalAuthOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canLoginWithLocalAuthOnly");
}

id objc_msgSend_cancelAllPendingImageFetchOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAllPendingImageFetchOperations");
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelButton");
}

id objc_msgSend_cancelButtonActionBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelButtonActionBlock");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_canonicalLanguageIdentifierFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canonicalLanguageIdentifierFromString:");
}

id objc_msgSend_cellForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellForItemAtIndexPath:");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "center");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changeType");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_checkForUserBackOff(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkForUserBackOff");
}

id objc_msgSend_checkInWithLoginD(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInWithLoginD");
}

id objc_msgSend_chevronColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chevronColor");
}

id objc_msgSend_chooseUserWithIdentifier_inClassWithID_password_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chooseUserWithIdentifier:inClassWithID:password:withCompletionHandler:");
}

id objc_msgSend_circleLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "circleLayer");
}

id objc_msgSend_classConfigState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classConfigState");
}

id objc_msgSend_classConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classConfiguration");
}

id objc_msgSend_classFooterButtonTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classFooterButtonTitle");
}

id objc_msgSend_classGroupsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classGroupsDictionary");
}

id objc_msgSend_classID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classID");
}

id objc_msgSend_classInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classInfo");
}

id objc_msgSend_classInfoForClassID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classInfoForClassID:");
}

id objc_msgSend_className(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "className");
}

id objc_msgSend_classRosterInformationFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classRosterInformationFileURL");
}

id objc_msgSend_classRosterViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classRosterViewController");
}

id objc_msgSend_classes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classes");
}

id objc_msgSend_clearAllCaches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearAllCaches");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_clearGroupAndGuestImageContact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearGroupAndGuestImageContact");
}

id objc_msgSend_clearPasteboard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearPasteboard");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "client");
}

id objc_msgSend_cloudConfigurationDetails(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudConfigurationDetails");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_collectionController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionController");
}

id objc_msgSend_collectionControllerDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionControllerDictionary");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionView");
}

id objc_msgSend_collectionView_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionView:numberOfItemsInSection:");
}

id objc_msgSend_collectionViewConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionViewConstraints");
}

id objc_msgSend_colorAtPixel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorAtPixel:");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_columns(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "columns");
}

id objc_msgSend_combinedTintColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "combinedTintColor");
}

id objc_msgSend_commitChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitChanges");
}

id objc_msgSend_commonInit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commonInit");
}

id objc_msgSend_compact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compact");
}

id objc_msgSend_comparatorForNameSortOrder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "comparatorForNameSortOrder:");
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionHandler");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configureResidentUsersNumberForSharedDevice_preferenceDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureResidentUsersNumberForSharedDevice:preferenceDomain:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectionToLoginD(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionToLoginD");
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

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToConstant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contact");
}

id objc_msgSend_contactByIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactByIdentifier");
}

id objc_msgSend_contactForUser_isInstructor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactForUser:isInstructor:");
}

id objc_msgSend_contactForUser_isInstructor_isTemporarySession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactForUser:isInstructor:isTemporarySession:");
}

id objc_msgSend_contactWithGroupImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactWithGroupImage");
}

id objc_msgSend_contactWithGuestImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactWithGuestImage");
}

id objc_msgSend_contacts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contacts");
}

id objc_msgSend_containerAndButtonStackView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerAndButtonStackView");
}

id objc_msgSend_containerLibraryDirectoryURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerLibraryDirectoryURL");
}

id objc_msgSend_containerStackView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerStackView");
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerView");
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

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_contentViewTopEdgeInsetForCollectionViewFrame_contentHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentViewTopEdgeInsetForCollectionViewFrame:contentHeight:");
}

id objc_msgSend_contextWithSetupData_shortLivedToken_secondaryActionRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextWithSetupData:shortLivedToken:secondaryActionRequired:");
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertRect:toView:");
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

id objc_msgSend_createAndLoginLocalUserWithUsername_password_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAndLoginLocalUserWithUsername:password:completionHandler:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createUser_passcodeData_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createUser:passcodeData:completionHandler:");
}

id objc_msgSend_currentBubbleUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentBubbleUID");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentReachabilityStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentReachabilityStatus");
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUser");
}

id objc_msgSend_dashBoardView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dashBoardView");
}

id objc_msgSend_dataQuota(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataQuota");
}

id objc_msgSend_dataQuotaIndicatorLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataQuotaIndicatorLabel");
}

id objc_msgSend_dataQuotaLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataQuotaLabel");
}

id objc_msgSend_dataSizeStringFromBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSizeStringFromBytes:");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSource");
}

id objc_msgSend_dataUsed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsed");
}

id objc_msgSend_dataUsedIndicatorLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsedIndicatorLabel");
}

id objc_msgSend_dataUsedLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsedLabel");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_deactivateTapType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivateTapType:");
}

id objc_msgSend_defaultBackgroundStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultBackgroundStyle");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultConstraintsForBottomLeftVibrantButton_inView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultConstraintsForBottomLeftVibrantButton:inView:");
}

id objc_msgSend_defaultConstraintsForBottomRightVibrantButton_inView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultConstraintsForBottomRightVibrantButton:inView:");
}

id objc_msgSend_defaultDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultDomains");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultPrivacyView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultPrivacyView");
}

id objc_msgSend_defaultPublicDictionaryForUMUserPasscodeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultPublicDictionaryForUMUserPasscodeType:");
}

id objc_msgSend_defaultSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSettings");
}

id objc_msgSend_defaultVibrantButtonWithImageType_vibrancyAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultVibrantButtonWithImageType:vibrancyAllowed:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteAnyAccountsWeShould(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAnyAccountsWeShould");
}

id objc_msgSend_deleteContactCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteContactCache");
}

id objc_msgSend_deleteItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteItemsAtIndexPaths:");
}

id objc_msgSend_deleteSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteSections:withRowAnimation:");
}

id objc_msgSend_deleteUser_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteUser:completionHandler:");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_dequeueReusableCellWithReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");
}

id objc_msgSend_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:");
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descender");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deviceAssetTag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceAssetTag");
}

id objc_msgSend_deviceHasNetwork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceHasNetwork");
}

id objc_msgSend_deviceLockScreenFootnote(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceLockScreenFootnote");
}

id objc_msgSend_deviceOrganizationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceOrganizationName");
}

id objc_msgSend_diameterForFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diameterForFrame:");
}

id objc_msgSend_diameterMonogramCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diameterMonogramCache");
}

id objc_msgSend_diameterPhotoCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diameterPhotoCache");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:error:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_directSwitchToUser_passcodeData_context_preferences_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "directSwitchToUser:passcodeData:context:preferences:completionHandler:");
}

id objc_msgSend_disableAirplaneMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableAirplaneMode");
}

id objc_msgSend_disableUIUpdatesReasons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableUIUpdatesReasons");
}

id objc_msgSend_disableUser_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableUser:completionHandler:");
}

id objc_msgSend_disableUserInteractionForReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableUserInteractionForReason:");
}

id objc_msgSend_disableUserInteractionReasons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableUserInteractionReasons");
}

id objc_msgSend_disappearingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disappearingViewController");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayAnimationCompletionBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayAnimationCompletionBlock");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_doLocalAuthOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doLocalAuthOnly");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doneSyncingUIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doneSyncingUIDs");
}

id objc_msgSend_doubleTapActivated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleTapActivated");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadTaskWithRequest:completionHandler:");
}

id objc_msgSend_downloadURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadURL:completionHandler:");
}

id objc_msgSend_downloadedLargeImageFileStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadedLargeImageFileStore");
}

id objc_msgSend_downloadedMediumImageFileStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadedMediumImageFileStore");
}

id objc_msgSend_drawAtPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawAtPoint:");
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_dynamicHeightPrivacyView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicHeightPrivacyView");
}

id objc_msgSend_dynamicHomeAffordance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicHomeAffordance");
}

id objc_msgSend_edgeInsetsForCollectionViewFrame_layoutInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "edgeInsetsForCollectionViewFrame:layoutInfo:");
}

id objc_msgSend_edgeInsetsForFooterButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "edgeInsetsForFooterButton");
}

id objc_msgSend_edgeInsetsForHeader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "edgeInsetsForHeader");
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectWithStyle:");
}

id objc_msgSend_effectiveValueForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveValueForSetting:");
}

id objc_msgSend_emcsInfoDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emcsInfoDict");
}

id objc_msgSend_enableBluetooth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableBluetooth");
}

id objc_msgSend_enableEnglishLocaleNaming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableEnglishLocaleNaming");
}

id objc_msgSend_enableWiFi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableWiFi");
}

id objc_msgSend_endDisablingViewUpdatesForReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDisablingViewUpdatesForReason:");
}

id objc_msgSend_endObservingHomeButtonDoubleTapNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endObservingHomeButtonDoubleTapNotification");
}

id objc_msgSend_endOperationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endOperationWithError:");
}

id objc_msgSend_endOperationWithResultObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endOperationWithResultObject:");
}

id objc_msgSend_endSuppressingWiFiPickerForReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSuppressingWiFiPickerForReason:");
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endUpdates");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "environment");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorCausingLogout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorCausingLogout");
}

id objc_msgSend_errorMessageForError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorMessageForError:");
}

id objc_msgSend_errorWithCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:");
}

id objc_msgSend_errorWithCode_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:userInfo:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluateWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateWithObject:");
}

id objc_msgSend_eventMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventMask");
}

id objc_msgSend_executeDelayByUserDefaultIfSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeDelayByUserDefaultIfSet:");
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "familyName");
}

id objc_msgSend_familyNameIndicatorLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "familyNameIndicatorLabel");
}

id objc_msgSend_familyNameLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "familyNameLabel");
}

id objc_msgSend_fetchAllPhotosForUsers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAllPhotosForUsers:");
}

id objc_msgSend_fetchAuthModeIfNeededWithUser_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAuthModeIfNeededWithUser:completionHandler:");
}

id objc_msgSend_fetchAuthModeWithContext_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAuthModeWithContext:completion:");
}

id objc_msgSend_fetchConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchConfiguration");
}

id objc_msgSend_fetchConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchConfiguration:");
}

id objc_msgSend_fetchImageForURL_toDestination_scaleToSquareImage_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchImageForURL:toDestination:scaleToSquareImage:completion:");
}

id objc_msgSend_fetchImagesAsyncForUsers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchImagesAsyncForUsers:");
}

id objc_msgSend_fetchResourceFromURL_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchResourceFromURL:completion:");
}

id objc_msgSend_fileCache_loadFileWrapperNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileCache:loadFileWrapperNamed:");
}

id objc_msgSend_fileCache_storeFileWrapper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileCache:storeFileWrapper:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_findLeastRecentlyUsedCleanUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findLeastRecentlyUsedCleanUser");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_fixedHeaderHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fixedHeaderHeight");
}

id objc_msgSend_fixedWidthForClassTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fixedWidthForClassTable");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "font");
}

id objc_msgSend_fontName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontName");
}

id objc_msgSend_fontYDiameter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontYDiameter");
}

id objc_msgSend_footerButtonFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "footerButtonFont");
}

id objc_msgSend_footerButtonWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "footerButtonWidth");
}

id objc_msgSend_footerTitleFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "footerTitleFont");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_fullNameIndicatorLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullNameIndicatorLabel");
}

id objc_msgSend_fullNameLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullNameLabel");
}

id objc_msgSend_fullNameWithFamilyName_givenName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullNameWithFamilyName:givenName:");
}

id objc_msgSend_functionWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "functionWithName:");
}

id objc_msgSend_generalPasteboard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generalPasteboard");
}

id objc_msgSend_generateLoginUserView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateLoginUserView");
}

id objc_msgSend_getDiskAvailableSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDiskAvailableSize");
}

id objc_msgSend_gettingReadyString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gettingReadyString");
}

id objc_msgSend_gettingReadyToSwitchView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gettingReadyToSwitchView");
}

id objc_msgSend_gettingReadyViewEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gettingReadyViewEnabled");
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "givenName");
}

id objc_msgSend_givenNameIndicatorLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "givenNameIndicatorLabel");
}

id objc_msgSend_givenNameLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "givenNameLabel");
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "grayColor");
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "greenColor");
}

id objc_msgSend_greetingLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "greetingLabel");
}

id objc_msgSend_gridInfoForItemCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gridInfoForItemCount:");
}

id objc_msgSend_groupImageContact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupImageContact");
}

id objc_msgSend_guestImageContact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "guestImageContact");
}

id objc_msgSend_hasClasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasClasses");
}

id objc_msgSend_hasCleanUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasCleanUser");
}

id objc_msgSend_hasDataToSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDataToSync");
}

id objc_msgSend_hasDataToSyncIndicatorLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDataToSyncIndicatorLabel");
}

id objc_msgSend_hasDataToSyncLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDataToSyncLabel");
}

id objc_msgSend_hasDoneRemoteAuth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDoneRemoteAuth");
}

id objc_msgSend_hasManagedCredentialIndicatorLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasManagedCredentialIndicatorLabel");
}

id objc_msgSend_hasManagedCredentialLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasManagedCredentialLabel");
}

id objc_msgSend_hasManagedCredentials(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasManagedCredentials");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasStudents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasStudents");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_haveCellsInSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "haveCellsInSection:");
}

id objc_msgSend_haveRecentUsers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "haveRecentUsers");
}

id objc_msgSend_haveRecentUsersSection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "haveRecentUsersSection");
}

id objc_msgSend_haveStudentsWithNoClasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "haveStudentsWithNoClasses");
}

id objc_msgSend_headerEdgeInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerEdgeInsets");
}

id objc_msgSend_headerHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerHeight");
}

id objc_msgSend_headerSubTitleFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerSubTitleFont");
}

id objc_msgSend_headerTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerTitle");
}

id objc_msgSend_headerTitleFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerTitleFont");
}

id objc_msgSend_headerTitleMinimumScaleFactor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerTitleMinimumScaleFactor");
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerView");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_hide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hide");
}

id objc_msgSend_hintFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hintFont");
}

id objc_msgSend_homeScreenWallpaperLegibilitySettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeScreenWallpaperLegibilitySettings");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_idleTimerFired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idleTimerFired");
}

id objc_msgSend_ifFoundTextLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ifFoundTextLabel");
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageData");
}

id objc_msgSend_imageForContact_forMonogramDiameter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageForContact:forMonogramDiameter:");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageTypeForBottomLeftVibrantButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageTypeForBottomLeftVibrantButton");
}

id objc_msgSend_imageTypeForBottomRightVibrantButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageTypeForBottomRightVibrantButton");
}

id objc_msgSend_imageURLIndicatorLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageURLIndicatorLabel");
}

id objc_msgSend_imageURLLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageURLLabel");
}

id objc_msgSend_imageURLs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageURLs");
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithData:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_indexPathForCell_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForCell:");
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForItem:inSection:");
}

id objc_msgSend_indexPathForItemAtPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForItemAtPoint:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexPathForRowAtPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForRowAtPoint:");
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSetWithIndex:");
}

id objc_msgSend_indicatorView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indicatorView");
}

id objc_msgSend_initRegularFileWithContents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRegularFileWithContents:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithArrangedSubviews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArrangedSubviews:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithCancelButtonAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCancelButtonAction:");
}

id objc_msgSend_initWithClassArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClassArray:");
}

id objc_msgSend_initWithDeviceHasNetwork_isInternalBuild_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceHasNetwork:isInternalBuild:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDirectoryURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDirectoryURL:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_callToActionLabelText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:callToActionLabelText:");
}

id objc_msgSend_initWithFrame_collectionViewLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:collectionViewLayout:");
}

id objc_msgSend_initWithFrame_dynamicHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:dynamicHeight:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithFrame_withPasscodeLockViewForStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:withPasscodeLockViewForStyle:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithOrganizationName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOrganizationName:");
}

id objc_msgSend_initWithPasscodeView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPasscodeView:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSettings:");
}

id objc_msgSend_initWithStore_faultHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStore:faultHandler:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithStudents_instructors_className_classID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStudents:instructors:className:classID:");
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyle:");
}

id objc_msgSend_initWithStyle_diameter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyle:diameter:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithUser_imageSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUser:imageSize:");
}

id objc_msgSend_initWithUser_userAlreadyExist_isTemporarySession_currentUser_passcode_passcodeResetRequired_passcodeResultResponder_authMode_canLoginWithLocalAuthOnly_doLocalAuthOnly_hasDoneRemoteAuth_userSwitchContext_emcsInfoDict_shouldBypassSetupAssistant_preferencesToSet_needsToEvictCleanUser_navigationController_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUser:userAlreadyExist:isTemporarySession:currentUser:passcode:passcodeResetRequired:passcodeResultResponder:authMode:canLoginWithLocalAuthOnly:doLocalAuthOnly:hasDoneRemoteAuth:userSwitchContext:emcsInfoDict:shouldBypassSetupAssistant:preferencesToSet:needsToEvictCleanUser:navigationController:completionHandler:");
}

id objc_msgSend_initWithUsers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUsers:");
}

id objc_msgSend_initWithViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithViewController:");
}

id objc_msgSend_initWithWallpaperVariant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWallpaperVariant:");
}

id objc_msgSend_initWithWallpaperVariant_backgroundStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWallpaperVariant:backgroundStyle:");
}

id objc_msgSend_initWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWhite:alpha:");
}

id objc_msgSend_inputAssistantItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputAssistantItem");
}

id objc_msgSend_insertItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertItemsAtIndexPaths:");
}

id objc_msgSend_insertSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertSections:withRowAnimation:");
}

id objc_msgSend_instructorByIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instructorByIdentifier");
}

id objc_msgSend_instructorCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instructorCache");
}

id objc_msgSend_instructors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instructors");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAndNilTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateAndNilTimer");
}

id objc_msgSend_invalidateAndNilTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateAndNilTimer:");
}

id objc_msgSend_isAccountDisabledIndicatorLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccountDisabledIndicatorLabel");
}

id objc_msgSend_isAccountDisabledLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAccountDisabledLabel");
}

id objc_msgSend_isAuditor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAuditor");
}

id objc_msgSend_isCJKLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCJKLocale");
}

id objc_msgSend_isCallToActionLabelEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCallToActionLabelEnabled");
}

id objc_msgSend_isDeviceXL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceXL");
}

id objc_msgSend_isDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDisabled");
}

id objc_msgSend_isDynamicHeightEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDynamicHeightEnabled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEqualToUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToUser:");
}

id objc_msgSend_isFirstUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFirstUpdate");
}

id objc_msgSend_isIdleTimerModeLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIdleTimerModeLocked");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_isKeyAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKeyAvailable:");
}

id objc_msgSend_isLoginOngoing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLoginOngoing");
}

id objc_msgSend_isLoginSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLoginSession");
}

id objc_msgSend_isLoginUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLoginUser");
}

id objc_msgSend_isNewUserAbleToLogin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNewUserAbleToLogin");
}

id objc_msgSend_isObservingSyncState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isObservingSyncState");
}

id objc_msgSend_isPresentingFedAuthPrompt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPresentingFedAuthPrompt");
}

id objc_msgSend_isRotationEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRotationEnabled");
}

id objc_msgSend_isSharedDeviceTemporarySessionAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSharedDeviceTemporarySessionAllowed");
}

id objc_msgSend_isSpecialCharacter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSpecialCharacter:");
}

id objc_msgSend_isTemporarySession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTemporarySession");
}

id objc_msgSend_isTemporarySessionAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTemporarySessionAllowed");
}

id objc_msgSend_isTemporarySessionOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTemporarySessionOnly");
}

id objc_msgSend_isTransientUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTransientUser");
}

id objc_msgSend_isUserInteractionDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUserInteractionDisabled");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValid");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_isViewUpdateDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isViewUpdateDisabled");
}

id objc_msgSend_isWaitingForNetwork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWaitingForNetwork");
}

id objc_msgSend_isWiFiPickerSuppressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWiFiPickerSuppressed");
}

id objc_msgSend_italicSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "italicSystemFontOfSize:");
}

id objc_msgSend_itemSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemSize");
}

id objc_msgSend_itemSizeForItemCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemSizeForItemCount:");
}

id objc_msgSend_itemSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemSpacing");
}

id objc_msgSend_itemSpacingForItemCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemSpacingForItemCount:");
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPath");
}

id objc_msgSend_keyboardDidHide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyboardDidHide:");
}

id objc_msgSend_keyboardDidShow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyboardDidShow:");
}

id objc_msgSend_keyboardWillHide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyboardWillHide:");
}

id objc_msgSend_keyboardWillShow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyboardWillShow:");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelColor");
}

id objc_msgSend_languageAwareOutsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "languageAwareOutsets");
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "languageCode");
}

id objc_msgSend_languages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "languages");
}

id objc_msgSend_largeImageCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "largeImageCache");
}

id objc_msgSend_largeImageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "largeImageURL");
}

id objc_msgSend_lastLoginDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastLoginDate");
}

id objc_msgSend_lastLoginDateIndicatorLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastLoginDateIndicatorLabel");
}

id objc_msgSend_lastLoginDateLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastLoginDateLabel");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastOperation");
}

id objc_msgSend_lastRemoteAuthDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastRemoteAuthDate");
}

id objc_msgSend_lastRemoteAuthDateIndicatorLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastRemoteAuthDateIndicatorLabel");
}

id objc_msgSend_lastRemoteAuthDateLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastRemoteAuthDateLabel");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutAttributesForCellWithIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutAttributesForCellWithIndexPath:");
}

id objc_msgSend_layoutAttributesForSupplementaryViewOfKind_withIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:");
}

id objc_msgSend_layoutConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutConstraints");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_layoutInfoForItemCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutInfoForItemCount:");
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutSubviews");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftAnchor");
}

id objc_msgSend_legalTextLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "legalTextLabel");
}

id objc_msgSend_legibilityObserver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "legibilityObserver");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_letterCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "letterCharacterSet");
}

id objc_msgSend_loadContactForUser_isInstructor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadContactForUser:isInstructor:");
}

id objc_msgSend_loadUser_passcodeData_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadUser:passcodeData:completionHandler:");
}

id objc_msgSend_localWiFiStatusForFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localWiFiStatusForFlags:");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeIdentifier");
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizations");
}

id objc_msgSend_localizedCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedCompare:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedModel");
}

id objc_msgSend_localizedStringForKey_forLanguages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:forLanguages:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringFromPersonNameComponents_style_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringFromPersonNameComponents:style:options:");
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_lockScreenWallpaperLegibilitySettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockScreenWallpaperLegibilitySettings");
}

id objc_msgSend_logViewerVC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logViewerVC");
}

id objc_msgSend_loginUICheckInWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loginUICheckInWithCompletionHandler:");
}

id objc_msgSend_loginUICheckedIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loginUICheckedIn");
}

id objc_msgSend_loginUIContainerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loginUIContainerURL");
}

id objc_msgSend_logindAcceptedOurConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logindAcceptedOurConnection");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_longPressActivated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longPressActivated");
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

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_managedAppleIDDefaultDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedAppleIDDefaultDomains");
}

id objc_msgSend_managedDevicesEdgeInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedDevicesEdgeInsets");
}

id objc_msgSend_managedDevicesText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedDevicesText");
}

id objc_msgSend_managedDevicesTextColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedDevicesTextColor");
}

id objc_msgSend_managedDevicesTextFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedDevicesTextFont");
}

id objc_msgSend_managedDevicesTitleFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedDevicesTitleFont");
}

id objc_msgSend_managedDevicesTitleToTextPadding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedDevicesTitleToTextPadding");
}

id objc_msgSend_managedDevicesView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedDevicesView");
}

id objc_msgSend_managedDevicesViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedDevicesViewController");
}

id objc_msgSend_mc_userPasscodeTypeWithPasscode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mc_userPasscodeTypeWithPasscode:");
}

id objc_msgSend_mediumImageCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediumImageCache");
}

id objc_msgSend_mediumImageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediumImageURL");
}

id objc_msgSend_menuButtonPressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "menuButtonPressed");
}

id objc_msgSend_minimumScaleFactor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumScaleFactor");
}

id objc_msgSend_minuteStringForMinutes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minuteStringForMinutes:");
}

id objc_msgSend_monitorQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorQueue");
}

id objc_msgSend_monogramDiameter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monogramDiameter");
}

id objc_msgSend_monogramForContact_isContactImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monogramForContact:isContactImage:");
}

id objc_msgSend_monogramForContacts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monogramForContacts:");
}

id objc_msgSend_monogramGroupImageColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monogramGroupImageColor");
}

id objc_msgSend_monogramWithStyle_diameter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monogramWithStyle:diameter:");
}

id objc_msgSend_moreInfoButtonPressed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moreInfoButtonPressed:");
}

id objc_msgSend_mostRecentLoggedInUsersWithCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mostRecentLoggedInUsersWithCount:");
}

id objc_msgSend_moveItemAtIndexPath_toIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtIndexPath:toIndexPath:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_namingSimilarityInfoByClassID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "namingSimilarityInfoByClassID");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_needsToEvictCleanUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsToEvictCleanUser");
}

id objc_msgSend_networkObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkObservers");
}

id objc_msgSend_networkStatusForFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkStatusForFlags:");
}

id objc_msgSend_newClassRosterReceived_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newClassRosterReceived:");
}

id objc_msgSend_newIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newIndex");
}

id objc_msgSend_nonTableHorizontalMargin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonTableHorizontalMargin");
}

id objc_msgSend_notUpdatedRecentUsersViewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notUpdatedRecentUsersViewControllers");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberOfArrangedObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfArrangedObjects");
}

id objc_msgSend_numberOfRecentUsersToShow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfRecentUsersToShow");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
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

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
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

id objc_msgSend_observeHomeButtonDoubleTapNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observeHomeButtonDoubleTapNotification");
}

id objc_msgSend_observeHomeButtonLongPressNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observeHomeButtonLongPressNotification");
}

id objc_msgSend_observeLockButtonDoubleTapEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "observeLockButtonDoubleTapEvent");
}

id objc_msgSend_okButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "okButton");
}

id objc_msgSend_okButtonPressed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "okButtonPressed:");
}

id objc_msgSend_oldIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oldIndex");
}

id objc_msgSend_onlineAuthenticationGracePeriod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onlineAuthenticationGracePeriod");
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationQueue");
}

id objc_msgSend_organizationName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "organizationName");
}

id objc_msgSend_overallTextColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overallTextColor");
}

id objc_msgSend_panGesture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "panGesture");
}

id objc_msgSend_passcode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcode");
}

id objc_msgSend_passcodeBackOffInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeBackOffInterval");
}

id objc_msgSend_passcodeCanceledAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeCanceledAction");
}

id objc_msgSend_passcodeData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeData");
}

id objc_msgSend_passcodeEnteredAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeEnteredAction");
}

id objc_msgSend_passcodeHintText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeHintText");
}

id objc_msgSend_passcodeLockGracePeriod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeLockGracePeriod");
}

id objc_msgSend_passcodeLockViewCancelButtonPressed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeLockViewCancelButtonPressed:");
}

id objc_msgSend_passcodeLockViewEmergencyCallButtonPressed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeLockViewEmergencyCallButtonPressed:");
}

id objc_msgSend_passcodeLockViewForStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeLockViewForStyle:");
}

id objc_msgSend_passcodeLockViewPasscodeDidChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeLockViewPasscodeDidChange:");
}

id objc_msgSend_passcodeLockViewPasscodeEntered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeLockViewPasscodeEntered:");
}

id objc_msgSend_passcodeResetRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeResetRequired");
}

id objc_msgSend_passcodeResultResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeResultResponder");
}

id objc_msgSend_passcodeType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeType");
}

id objc_msgSend_passcodeTypeIndicatorLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeTypeIndicatorLabel");
}

id objc_msgSend_passcodeTypeLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeTypeLabel");
}

id objc_msgSend_passcodeVerificationFailedWithErrorMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeVerificationFailedWithErrorMessage:");
}

id objc_msgSend_passcodeView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeView");
}

id objc_msgSend_passcodeViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeViewController");
}

id objc_msgSend_passcodeViewDidAppearAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeViewDidAppearAction");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathForResource_ofType_inDirectory_forLocalization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForResource:ofType:inDirectory:forLocalization:");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pause");
}

id objc_msgSend_payloadCertificatePersistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadCertificatePersistentID");
}

id objc_msgSend_pendingChangeDescriptors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingChangeDescriptors");
}

id objc_msgSend_performBatchUpdates_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBatchUpdates:completion:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelectorOnMainThread:withObject:waitUntilDone:");
}

id objc_msgSend_photo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photo");
}

id objc_msgSend_photoURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoURL");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointSize");
}

id objc_msgSend_pointerAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointerAtIndex:");
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

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_powered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powered");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferencesToSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferencesToSet");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_preferredLocalizations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLocalizations");
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_presentAlertForErrorTitle_message_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAlertForErrorTitle:message:");
}

id objc_msgSend_presentInNavigationController_user_passcodeViewDidAppearAction_passcodeCanceledAction_passcodeEnteredAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentInNavigationController:user:passcodeViewDidAppearAction:passcodeCanceledAction:passcodeEnteredAction:");
}

id objc_msgSend_presentPasscodeViewControllerForUser_passcodeViewDidAppearAction_passcodeCanceledAction_passcodeEnteredAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentPasscodeViewControllerForUser:passcodeViewDidAppearAction:passcodeCanceledAction:passcodeEnteredAction:");
}

id objc_msgSend_presentPerformanceTestHintView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentPerformanceTestHintView");
}

id objc_msgSend_presentPrivacyViewWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentPrivacyViewWithCompletionHandler:");
}

id objc_msgSend_presentUserInfoForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentUserInfoForUser:");
}

id objc_msgSend_presentUserInfoForUser_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentUserInfoForUser:completionHandler:");
}

id objc_msgSend_presentUserLimitIsReachedAlertIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentUserLimitIsReachedAlertIfNeeded");
}

id objc_msgSend_presentUserLoginViewControllerForUserInfo_inClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentUserLoginViewControllerForUserInfo:inClass:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentWiFiPickerWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentWiFiPickerWithCompletionHandler:");
}

id objc_msgSend_presentationControllerForPopUpViewOnScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationControllerForPopUpViewOnScreen");
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationLayer");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryColor");
}

id objc_msgSend_privacyView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privacyView");
}

id objc_msgSend_privacyViewBaselineToBottomPadding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privacyViewBaselineToBottomPadding");
}

id objc_msgSend_privacyViewTextColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privacyViewTextColor");
}

id objc_msgSend_privacyViewTextFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privacyViewTextFont");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_programmaticallyAuthenticateWithUser_password_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "programmaticallyAuthenticateWithUser:password:completionHandler:");
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressView");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_reachability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reachability");
}

id objc_msgSend_reachabilityForInternetConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reachabilityForInternetConnection");
}

id objc_msgSend_reachabilityWithAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reachabilityWithAddress:");
}

id objc_msgSend_readCachedClassRoster(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readCachedClassRoster");
}

id objc_msgSend_recentUserState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recentUserState");
}

id objc_msgSend_recentUsers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recentUsers");
}

id objc_msgSend_recentUsersViewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recentUsersViewControllers");
}

id objc_msgSend_rectForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rectForRowAtIndexPath:");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "redColor");
}

id objc_msgSend_reenableUserInteractionForReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reenableUserInteractionForReason:");
}

id objc_msgSend_registerClass_forCellWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerClass:forCellWithReuseIdentifier:");
}

id objc_msgSend_registerClass_forSupplementaryViewOfKind_withReuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:");
}

id objc_msgSend_registerUserListUpdateObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerUserListUpdateObserver:");
}

id objc_msgSend_regularFileContents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularFileContents");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadData");
}

id objc_msgSend_reloadSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadSections:withRowAnimation:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllAnimations");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAnimationForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAnimationForKey:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeGestureRecognizer:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePointerAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePointerAtIndex:");
}

id objc_msgSend_removeRecentUsersViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeRecentUsersViewController:");
}

id objc_msgSend_removeSyncTaskPresenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSyncTaskPresenter:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_resetForFailedPasscode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetForFailedPasscode");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resignFirstResponder");
}

id objc_msgSend_resultObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultObject");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_resumeWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeWithError:");
}

id objc_msgSend_retrieveValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveValueForKey:");
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retryCount");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightBarButtonItem");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_rootViewControllerStack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootViewControllerStack");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "row");
}

id objc_msgSend_rows(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rows");
}

id objc_msgSend_saveKeyValuePairs_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveKeyValuePairs:error:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_scheduleSyncBubbleTerminationForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleSyncBubbleTerminationForUser:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_schoolName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "schoolName");
}

id objc_msgSend_scopeWithPointSize_scale_rightToLeft_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scopeWithPointSize:scale:rightToLeft:style:");
}

id objc_msgSend_secondaryColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryColor");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "section");
}

id objc_msgSend_sectionDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sectionDictionary");
}

id objc_msgSend_sectionTitles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sectionTitles");
}

id objc_msgSend_sectionTitlesSortDescriptors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sectionTitlesSortDescriptors");
}

id objc_msgSend_separatorView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "separatorView");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setActionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionBlock:");
}

id objc_msgSend_setActiveStudentIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveStudentIdentifier:completion:");
}

id objc_msgSend_setAdditionalSafeAreaInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditionalSafeAreaInsets:");
}

id objc_msgSend_setAdditive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdditive:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAirplaneMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAirplaneMode:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowedUnits:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAltDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAltDSID:");
}

id objc_msgSend_setAlternateDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlternateDSID:");
}

id objc_msgSend_setArrangedObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArrangedObjects:");
}

id objc_msgSend_setAssetTagText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetTagText:");
}

id objc_msgSend_setAttentionLostTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttentionLostTimeout:");
}

id objc_msgSend_setAttributedPlaceholder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedPlaceholder:");
}

id objc_msgSend_setAttributedSubtitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedSubtitle:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAuthMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthMode:");
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutocapitalizationType:");
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutocorrectionType:");
}

id objc_msgSend_setAutogeneratesPhoneticNameWithLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutogeneratesPhoneticNameWithLocale:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAvatarAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAvatarAlpha:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setBaseView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBaseView:");
}

id objc_msgSend_setBeginTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBeginTime:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setCalculationMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCalculationMode:");
}

id objc_msgSend_setCallToActionLabelEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCallToActionLabelEnabled:");
}

id objc_msgSend_setCanLoginWithLocalAuthOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCanLoginWithLocalAuthOnly:");
}

id objc_msgSend_setCancelButtonActionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelButtonActionBlock:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setChangeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChangeType:");
}

id objc_msgSend_setClassConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassConfiguration:");
}

id objc_msgSend_setClassConfigurationForDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassConfigurationForDictionary:");
}

id objc_msgSend_setClassID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassID:");
}

id objc_msgSend_setClassInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassInfo:");
}

id objc_msgSend_setClassProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassProvider:");
}

id objc_msgSend_setClassProvider_forController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassProvider:forController:");
}

id objc_msgSend_setClassProviderWithGroupDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassProviderWithGroupDictionary:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCollectionController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCollectionController:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setColumns_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColumns:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setConfiguration_shouldReset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:shouldReset:");
}

id objc_msgSend_setConnectionToLoginD_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionToLoginD:");
}

id objc_msgSend_setContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContact:");
}

id objc_msgSend_setContactByIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContactByIdentifier:");
}

id objc_msgSend_setContactType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContactType:");
}

id objc_msgSend_setContacts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContacts:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentView:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCurrentBubbleUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentBubbleUID:");
}

id objc_msgSend_setCustomBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomBackgroundColor:");
}

id objc_msgSend_setDashBoardView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDashBoardView:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDefaultDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultDomains:");
}

id objc_msgSend_setDelaysTouchesBegan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelaysTouchesBegan:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDidFinish_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidFinish:");
}

id objc_msgSend_setDiffUMUserPropertiesFromUMUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiffUMUserPropertiesFromUMUser:");
}

id objc_msgSend_setDisplayAnimationCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayAnimationCompletionBlock:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setDistribution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDistribution:");
}

id objc_msgSend_setDoubleTapActivated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoubleTapActivated:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEditable:");
}

id objc_msgSend_setEmcsInfoDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEmcsInfoDict:");
}

id objc_msgSend_setEnableBottomSeperator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableBottomSeperator:");
}

id objc_msgSend_setEnableEnglishLocaleNaming_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableEnglishLocaleNaming:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setErrorCausingLogout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErrorCausingLogout:");
}

id objc_msgSend_setEventHandlerWithQueue_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventHandlerWithQueue:block:");
}

id objc_msgSend_setEventMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventMask:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFamilyName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFamilyName:");
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFooterButtonTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFooterButtonTitle:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setGettingReadyString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGettingReadyString:");
}

id objc_msgSend_setGettingReadyToSwitchView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGettingReadyToSwitchView:");
}

id objc_msgSend_setGettingReadyViewEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGettingReadyViewEnabled:");
}

id objc_msgSend_setGivenName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGivenName:");
}

id objc_msgSend_setGlyphImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGlyphImage:");
}

id objc_msgSend_setGroupImageContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGroupImageContact:");
}

id objc_msgSend_setGuestImageContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGuestImageContact:");
}

id objc_msgSend_setHasDoneRemoteAuth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasDoneRemoteAuth:");
}

id objc_msgSend_setHasManagedCredentials_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasManagedCredentials:");
}

id objc_msgSend_setHaveRecentUsersSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHaveRecentUsersSection:");
}

id objc_msgSend_setHeaderTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderTitle");
}

id objc_msgSend_setHeaderTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeaderTitle:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHidesWhenStopped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidesWhenStopped:");
}

id objc_msgSend_setHintLabelText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHintLabelText:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdleTimerMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimerMode:");
}

id objc_msgSend_setIfFoundText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIfFoundText:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImageData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageData:");
}

id objc_msgSend_setInstructorByIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstructorByIdentifier:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsAuditor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsAuditor:");
}

id objc_msgSend_setIsEphemeral_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsEphemeral:");
}

id objc_msgSend_setIsFetchingAuthMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsFetchingAuthMode:");
}

id objc_msgSend_setIsFirstUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsFirstUpdate:");
}

id objc_msgSend_setIsIdleTimerModeLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsIdleTimerModeLocked:");
}

id objc_msgSend_setIsLoginOngoing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLoginOngoing:");
}

id objc_msgSend_setIsObservingSyncState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsObservingSyncState:");
}

id objc_msgSend_setIsRotationEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRotationEnabled:");
}

id objc_msgSend_setIsTemporarySession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsTemporarySession:");
}

id objc_msgSend_setIsTransientUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsTransientUser:");
}

id objc_msgSend_setIsUIUpdateAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUIUpdateAllowed:");
}

id objc_msgSend_setIsUsernameEditable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUsernameEditable:");
}

id objc_msgSend_setIsWaitingForNetwork_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsWaitingForNetwork:");
}

id objc_msgSend_setItemSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemSize:");
}

id objc_msgSend_setItemSpacing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemSpacing:");
}

id objc_msgSend_setKeyTimes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyTimes:");
}

id objc_msgSend_setKeybagOpaqueDataForUser_withOpaqueData_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeybagOpaqueDataForUser:withOpaqueData:withError:");
}

id objc_msgSend_setKeyboardStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyboardStyle");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setKeypadVisible_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeypadVisible:animated:");
}

id objc_msgSend_setLanguages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLanguages:");
}

id objc_msgSend_setLastRemoteAuthDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastRemoteAuthDate:");
}

id objc_msgSend_setLeadingBarButtonGroups_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLeadingBarButtonGroups:");
}

id objc_msgSend_setLegibilitySettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLegibilitySettings:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineCap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineCap:");
}

id objc_msgSend_setLineSpacing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineSpacing:");
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineWidth:");
}

id objc_msgSend_setLocalLargeImageURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalLargeImageURL:");
}

id objc_msgSend_setLocalMediumImageURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalMediumImageURL:");
}

id objc_msgSend_setLogViewerVC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogViewerVC:");
}

id objc_msgSend_setLogindAcceptedOurConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogindAcceptedOurConnection:");
}

id objc_msgSend_setManagedDevicesAttributedText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManagedDevicesAttributedText:");
}

id objc_msgSend_setManagedDevicesText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManagedDevicesText:");
}

id objc_msgSend_setManagedDevicesTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManagedDevicesTitle:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMaxTotalFileCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxTotalFileCount:");
}

id objc_msgSend_setMaxTotalFileSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxTotalFileSize:");
}

id objc_msgSend_setMinimumScaleFactor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumScaleFactor:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModalTransitionStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalTransitionStyle:");
}

id objc_msgSend_setMonogramDiameter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonogramDiameter:");
}

id objc_msgSend_setNavigationBarHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavigationBarHidden:");
}

id objc_msgSend_setNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavigationController:");
}

id objc_msgSend_setNeedsCredentialRecovery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsCredentialRecovery:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsNewAppleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsNewAppleID:");
}

id objc_msgSend_setNeedsToEvictCleanUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsToEvictCleanUser:");
}

id objc_msgSend_setNewIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNewIndex:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOldIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOldIndex:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setPanGesture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPanGesture:");
}

id objc_msgSend_setPassCodeView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPassCodeView:");
}

id objc_msgSend_setPasscode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscode:");
}

id objc_msgSend_setPasscodeCanceledAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeCanceledAction:");
}

id objc_msgSend_setPasscodeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeData:");
}

id objc_msgSend_setPasscodeDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeDelegate:");
}

id objc_msgSend_setPasscodeEnteredAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeEnteredAction:");
}

id objc_msgSend_setPasscodeHintText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeHintText:");
}

id objc_msgSend_setPasscodeLockGracePeriod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeLockGracePeriod:");
}

id objc_msgSend_setPasscodeResetRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeResetRequired:");
}

id objc_msgSend_setPasscodeResultResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeResultResponder:");
}

id objc_msgSend_setPasscodeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeType:");
}

id objc_msgSend_setPasscodeViewDidAppearAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasscodeViewDidAppearAction:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPendingChangeDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingChangeDescriptors:");
}

id objc_msgSend_setPhotoURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhotoURL:");
}

id objc_msgSend_setPreferencesToSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferencesToSet:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setPreferredFilename_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredFilename:");
}

id objc_msgSend_setPreferredMaxLayoutWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredMaxLayoutWidth:");
}

id objc_msgSend_setPrefetchingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrefetchingEnabled:");
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setPrivacyText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrivacyText:");
}

id objc_msgSend_setPrivacyView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrivacyView:");
}

id objc_msgSend_setProgressView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressView:");
}

id objc_msgSend_setRecentUsers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecentUsers:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemovedOnCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemovedOnCompletion:");
}

id objc_msgSend_setRepeatCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRepeatCount:");
}

id objc_msgSend_setRetryCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRetryCount:");
}

id objc_msgSend_setReturnKeyEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReturnKeyEnabled:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRotationMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRotationMode:");
}

id objc_msgSend_setRows_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRows:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSectionDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSectionDictionary:");
}

id objc_msgSend_setSectionTitles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSectionTitles:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setSeparatorColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorColor:");
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorInset:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setSeparatorViewHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorViewHidden:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setShouldAllowAppleIDCreation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldAllowAppleIDCreation:");
}

id objc_msgSend_setShouldRequestConfigurationInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldRequestConfigurationInfo:");
}

id objc_msgSend_setShouldRequestShortLivedToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldRequestShortLivedToken:");
}

id objc_msgSend_setShowNetworkSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowNetworkSettings:");
}

id objc_msgSend_setShowsEmergencyCallButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsEmergencyCallButton:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setSignInButtonEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSignInButtonEnabled:");
}

id objc_msgSend_setSingleTapActivated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSingleTapActivated:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setSpeed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpeed:");
}

id objc_msgSend_setStatusBarUserName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarUserName:");
}

id objc_msgSend_setStatusBarUserNameOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarUserNameOverride:");
}

id objc_msgSend_setStrength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrength:");
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeColor:");
}

id objc_msgSend_setStudents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStudents:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSubtitleString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubtitleString:");
}

id objc_msgSend_setSwipeUpAnimationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwipeUpAnimationController:");
}

id objc_msgSend_setSyncTaskState_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSyncTaskState:animated:");
}

id objc_msgSend_setTestOngoingIndicatorController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestOngoingIndicatorController:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setText_forLanguage_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:forLanguage:animated:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTimeoutInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutInterval:");
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimingFunction:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleColor:forState:");
}

id objc_msgSend_setTitleType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleType:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTrailingBarButtonGroups_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrailingBarButtonGroups:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUiUpdatePending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUiUpdatePending:");
}

id objc_msgSend_setUnitsStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnitsStyle:");
}

id objc_msgSend_setUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUser:");
}

id objc_msgSend_setUser_isTemporarySession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUser:isTemporarySession:");
}

id objc_msgSend_setUserAlreadyExist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserAlreadyExist:");
}

id objc_msgSend_setUserAuxiliaryString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserAuxiliaryString:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUserSwitchContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserSwitchContext:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setUsers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsers:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forPasteboardType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forPasteboardType:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setVibrancyAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVibrancyAllowed:");
}

id objc_msgSend_setVibrantSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVibrantSettings:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewControllerStackAnimated_deferrable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllerStackAnimated:deferrable:");
}

id objc_msgSend_setViewControllers_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllers:animated:");
}

id objc_msgSend_setVisible_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVisible:animated:");
}

id objc_msgSend_setWallpaperMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallpaperMode:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_settingsForPrivateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "settingsForPrivateStyle:");
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setup");
}

id objc_msgSend_setupPasscodeViewControllerEventAction_forUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupPasscodeViewControllerEventAction:forUser:");
}

id objc_msgSend_sha1Hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sha1Hash");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCache");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedController");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSession");
}

id objc_msgSend_sharedStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedStorage");
}

id objc_msgSend_sharedStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedStyle");
}

id objc_msgSend_sharedStyleForLoggedInState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedStyleForLoggedInState");
}

id objc_msgSend_shouldAllowUIUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldAllowUIUpdate");
}

id objc_msgSend_shouldAutorotate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldAutorotate");
}

id objc_msgSend_shouldBypassSetupAssistant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldBypassSetupAssistant");
}

id objc_msgSend_shouldSetIdleTimerAsIfLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldSetIdleTimerAsIfLocked");
}

id objc_msgSend_shouldSetupAttentionAwareIdleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldSetupAttentionAwareIdleTimer");
}

id objc_msgSend_shouldShowBottomLeftVibrantButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowBottomLeftVibrantButton");
}

id objc_msgSend_shouldShowBottomRightVibrantButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowBottomRightVibrantButton");
}

id objc_msgSend_shouldUpdateStudentStatusWithClassroom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldUpdateStudentStatusWithClassroom");
}

id objc_msgSend_show(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "show");
}

id objc_msgSend_showPopUp_forUser_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showPopUp:forUser:completionHandler:");
}

id objc_msgSend_showWiFiPicker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showWiFiPicker");
}

id objc_msgSend_sideInsetForHintLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sideInsetForHintLabel");
}

id objc_msgSend_sidePadding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sidePadding");
}

id objc_msgSend_signInButtonPressed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signInButtonPressed:");
}

id objc_msgSend_silhouetteMonogram(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "silhouetteMonogram");
}

id objc_msgSend_similarity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "similarity");
}

id objc_msgSend_singleLineCellHeightForTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singleLineCellHeightForTable:");
}

id objc_msgSend_singleTapActivated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singleTapActivated");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_sizeWithAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeWithAttributes:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_comparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:comparator:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_selector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:selector:");
}

id objc_msgSend_sortDescriptorWithKey_comparatorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:comparatorType:");
}

id objc_msgSend_sortDescriptors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptors");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_spaceBetweenAvatarAndName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spaceBetweenAvatarAndName");
}

id objc_msgSend_spaceBetweenAvatarAndNameForFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spaceBetweenAvatarAndNameForFont:");
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spinner");
}

id objc_msgSend_squareImageFromImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "squareImageFromImage:");
}

id objc_msgSend_squareImageFromImage_scaledToSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "squareImageFromImage:scaledToSize:");
}

id objc_msgSend_stackView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackView");
}

id objc_msgSend_stackViewSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stackViewSpacing");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_startConsumingLockButtonDoublePressEventWithAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startConsumingLockButtonDoublePressEventWithAction:");
}

id objc_msgSend_startLoginFlowForAnonymousTemporaryUserWithResultResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startLoginFlowForAnonymousTemporaryUserWithResultResponder:");
}

id objc_msgSend_startLoginFlowForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startLoginFlowForUser:");
}

id objc_msgSend_startPasscodeVerificationBackoff_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPasscodeVerificationBackoff:");
}

id objc_msgSend_startProgressAnimation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startProgressAnimation");
}

id objc_msgSend_startScanning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startScanning");
}

id objc_msgSend_startTrackingSwipeUpGestureForView_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTrackingSwipeUpGestureForView:delegate:");
}

id objc_msgSend_stashRecoveryDataWithInfo_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stashRecoveryDataWithInfo:completionBlock:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_statusBarStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusBarStyle");
}

id objc_msgSend_statusBarUserName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusBarUserName");
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAnimating");
}

id objc_msgSend_stopProgressAnimation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopProgressAnimation");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromTimeInterval:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_studentForStudentIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "studentForStudentIdentifier:");
}

id objc_msgSend_studentForStudentIdentifier_inClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "studentForStudentIdentifier:inClass:");
}

id objc_msgSend_studentForUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "studentForUsername:");
}

id objc_msgSend_students(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "students");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "style");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
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

id objc_msgSend_suggestedEdgeSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedEdgeSpacing");
}

id objc_msgSend_suggestedFilename(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedFilename");
}

id objc_msgSend_suggestedSizeForContentWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedSizeForContentWidth:");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superview");
}

id objc_msgSend_supportedMonogramDiametersSortedInDescendingOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedMonogramDiametersSortedInDescendingOrder");
}

id objc_msgSend_suppressesWiFiPicker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suppressesWiFiPicker");
}

id objc_msgSend_suspendWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suspendWithError:");
}

id objc_msgSend_swipeUpAnimationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "swipeUpAnimationController");
}

id objc_msgSend_swipeUpAnimationControllerSwipeGestureDidBegin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "swipeUpAnimationControllerSwipeGestureDidBegin:");
}

id objc_msgSend_swipeUpAnimationControllerSwipeGestureDidEnd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "swipeUpAnimationControllerSwipeGestureDidEnd:");
}

id objc_msgSend_swipeUpAnimationControllerSwipeGestureDidPassThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "swipeUpAnimationControllerSwipeGestureDidPassThreshold:");
}

id objc_msgSend_switchToLoginUserWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "switchToLoginUserWithCompletionHandler:");
}

id objc_msgSend_switchToLoginUserWithError_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "switchToLoginUserWithError:completionHandler:");
}

id objc_msgSend_switchToUser_passcodeData_context_preferences_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "switchToUser:passcodeData:context:preferences:completionHandler:");
}

id objc_msgSend_syncBubbleController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncBubbleController");
}

id objc_msgSend_syncBubbleQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncBubbleQueue");
}

id objc_msgSend_syncStateUpdateFrequency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncStateUpdateFrequency");
}

id objc_msgSend_syncTaskMonitorShouldStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncTaskMonitorShouldStart");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:weight:");
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGreenColor");
}

id objc_msgSend_systemGroupContainerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGroupContainerURL");
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemYellowColor");
}

id objc_msgSend_tableCellFont(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableCellFont");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView");
}

id objc_msgSend_tableView_numberOfRowsInSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView:numberOfRowsInSection:");
}

id objc_msgSend_tableViewConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableViewConstraints");
}

id objc_msgSend_tableViewContentInset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableViewContentInset");
}

id objc_msgSend_tableViewSeperatorColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableViewSeperatorColor");
}

id objc_msgSend_tableViewSeperatorInset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableViewSeperatorInset");
}

id objc_msgSend_temporarySessionOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporarySessionOnly");
}

id objc_msgSend_terminateSyncWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminateSyncWithCompletionHandler:");
}

id objc_msgSend_testOngoingIndicatorController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testOngoingIndicatorController");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textLabel");
}

id objc_msgSend_textSuggestionWithInputText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textSuggestionWithInputText:");
}

id objc_msgSend_timeoutInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutInterval");
}

id objc_msgSend_tintedImageCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tintedImageCache");
}

id objc_msgSend_tintedImageFromImage_color_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tintedImageFromImage:color:");
}

id objc_msgSend_titleForBottomLeftVibrantButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleForBottomLeftVibrantButton");
}

id objc_msgSend_titleForBottomRightVibrantButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleForBottomRightVibrantButton");
}

id objc_msgSend_titleForSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleForSection:");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_titleToSubTitleSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleToSubTitleSpacing");
}

id objc_msgSend_titleType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleType");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topViewController");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_transitionDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionDuration:");
}

id objc_msgSend_transitionWasCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionWasCancelled");
}

id objc_msgSend_translationInView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "translationInView:");
}

id objc_msgSend_turnBluetoothOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "turnBluetoothOn");
}

id objc_msgSend_uiUpdatePending(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uiUpdatePending");
}

id objc_msgSend_uiUpdateSupport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uiUpdateSupport");
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uid");
}

id objc_msgSend_uidPresenterMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uidPresenterMap");
}

id objc_msgSend_uidSyncStateMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uidSyncStateMap");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unbindContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unbindContent");
}

id objc_msgSend_unlockScreenTypeForUser_outSimplePasscodeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockScreenTypeForUser:outSimplePasscodeType:");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "update");
}

id objc_msgSend_updateClientSettingsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateClientSettingsWithBlock:");
}

id objc_msgSend_updateContactImageDataForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContactImageDataForUser:");
}

id objc_msgSend_updateContactImageDataForUser_isInstructor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContactImageDataForUser:isInstructor:");
}

id objc_msgSend_updateImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateImage");
}

id objc_msgSend_updateMonogram(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMonogram");
}

id objc_msgSend_updateName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateName");
}

id objc_msgSend_updateRecentUsersViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateRecentUsersViewController:");
}

id objc_msgSend_updateRecentUsersViewControllersIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateRecentUsersViewControllersIfNeeded");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_urlForAnonymousUserAvatar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlForAnonymousUserAvatar");
}

id objc_msgSend_useDynamicQuotaSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useDynamicQuotaSize");
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "user");
}

id objc_msgSend_userAlreadyExist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAlreadyExist");
}

id objc_msgSend_userAuxiliaryString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAuxiliaryString");
}

id objc_msgSend_userAvatarView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAvatarView");
}

id objc_msgSend_userCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userCache");
}

id objc_msgSend_userExists_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userExists:");
}

id objc_msgSend_userForStatusBarDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userForStatusBarDisplay");
}

id objc_msgSend_userForUsername_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userForUsername:");
}

id objc_msgSend_userFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userFromDictionary:");
}

id objc_msgSend_userFromUMUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userFromUMUser:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInfoView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfoView");
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceLayoutDirection");
}

id objc_msgSend_userSwitchContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSwitchContext");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_usernameField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usernameField");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_verticalItemSpaceForSpaceWithFontDescender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verticalItemSpaceForSpaceWithFontDescender:");
}

id objc_msgSend_vibrantSettingsWithReferenceColor_referenceContrast_legibilitySettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vibrantSettingsWithReferenceColor:referenceContrast:legibilitySettings:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewController");
}

id objc_msgSend_viewControllerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForKey:");
}

id objc_msgSend_viewControllerOnTopOfRootViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerOnTopOfRootViewController");
}

id objc_msgSend_viewControllerStack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerStack");
}

id objc_msgSend_viewControllerStackFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerStackFlow");
}

id objc_msgSend_viewControllerStackForAssignedUser_inClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerStackForAssignedUser:inClass:");
}

id objc_msgSend_viewType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewType");
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleCells");
}

id objc_msgSend_waitForNetworkAndExecuteBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForNetworkAndExecuteBlock:");
}

id objc_msgSend_waitUntilSyncBubbleIsTerminatedForUser_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilSyncBubbleIsTerminatedForUser:completionHandler:");
}

id objc_msgSend_wallpaperLegibilitySettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wallpaperLegibilitySettings");
}

id objc_msgSend_wallpaperVariant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wallpaperVariant");
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakObjectsPointerArray");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceCharacterSet");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_wifiPickerSuppressionReasons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiPickerSuppressionReasons");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowScene");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}
