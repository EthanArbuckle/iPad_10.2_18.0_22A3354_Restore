void sub_100004350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100004D2C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100004D3C(uint64_t a1)
{

}

void sub_100004D44(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004DC8;
  v5[3] = &unk_1000084D0;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v1, "loadItemForTypeIdentifier:options:completionHandler:", v2, 0, v5);

}

void sub_100004DC8(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100004E14(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  id *v15;
  id v16;
  uint64_t v17;
  _UNKNOWN **v18;
  void *v19;
  void **v20;
  void *v21;
  uint64_t v22;
  uint64_t Log;
  NSObject *v24;
  char *v25;
  void *v26;
  char *v27;
  id v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  _QWORD v41[6];
  _QWORD v42[4];
  id v43;
  NSObject *v44;
  void *v45;
  id v46;
  _QWORD v47[4];
  _QWORD v48[2];
  NSObject *v49;
  _QWORD v50[4];
  _QWORD v51[2];
  NSObject *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];

  v2 = dispatch_group_create();
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeImage, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeMovie, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeLivePhoto, "identifier"));
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "inputItems"));

  obj = v6;
  v7 = _NSConcreteStackBlock;
  v32 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v58;
    v8 = &NSExtensionMain_ptr;
    v34 = v2;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v58 != v31)
          objc_enumerationMutation(obj);
        v33 = v9;
        v10 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v9);
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attachments"));
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        if (v37)
        {
          v11 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(_QWORD *)v54 != v11)
                objc_enumerationMutation(v36);
              v13 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
              v14 = objc_alloc_init((Class)v8[13]);
              if (objc_msgSend(v13, "hasItemConformingToTypeIdentifier:", v4))
              {
                dispatch_group_enter(v2);
                v50[0] = v7;
                v50[1] = 3221225472;
                v50[2] = sub_10000535C;
                v50[3] = &unk_100008390;
                v51[0] = v14;
                v51[1] = v13;
                v52 = v2;
                objc_msgSend(v13, "loadItemForTypeIdentifier:options:completionHandler:", v4, 0, v50);

                v15 = (id *)v51;
              }
              else if (objc_msgSend(v13, "hasItemConformingToTypeIdentifier:", v3))
              {
                dispatch_group_enter(v2);
                v47[0] = v7;
                v47[1] = 3221225472;
                v47[2] = sub_10000545C;
                v47[3] = &unk_1000083B8;
                v48[0] = v14;
                v48[1] = v13;
                v49 = v2;
                v16 = objc_msgSend(v13, "loadFileRepresentationForTypeIdentifier:completionHandler:", v3, v47);

                v15 = (id *)v48;
              }
              else
              {
                if (!objc_msgSend(v13, "hasItemConformingToTypeIdentifier:", v35))
                  goto LABEL_18;
                dispatch_group_enter(v2);
                v42[0] = v7;
                v42[1] = 3221225472;
                v42[2] = sub_1000056A0;
                v42[3] = &unk_100008430;
                v43 = v14;
                v44 = v2;
                v45 = v13;
                v46 = v35;
                objc_msgSend(v13, "loadItemForTypeIdentifier:options:completionHandler:", v46, 0, v42);

                v15 = &v43;
              }

LABEL_18:
              dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
              if (objc_msgSend(v14, "mediaType"))
              {
                objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
              }
              else
              {
                v17 = v11;
                v18 = v8;
                v19 = v4;
                v20 = v7;
                v21 = v3;
                v22 = a1;
                Log = PLPhotoSharingGetLog();
                v24 = objc_claimAutoreleasedReturnValue(Log);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v62 = v13;
                  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Couldn't share item with provider %@", buf, 0xCu);
                }

                a1 = v22;
                v3 = v21;
                v7 = v20;
                v4 = v19;
                v8 = v18;
                v11 = v17;
                v2 = v34;
              }

            }
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
          }
          while (v37);
        }

        v9 = v33 + 1;
      }
      while ((id)(v33 + 1) != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    }
    while (v32);
  }

  v25 = (char *)+[PLPhotoSharingHelper maxAssetsPerStream](PLPhotoSharingHelper, "maxAssetsPerStream");
  v26 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v26
    && (v27 = (char *)objc_msgSend(v26, "assetsCount"), &v27[(_QWORD)objc_msgSend(*(id *)(a1 + 40), "count")] > v25))
  {
    v41[0] = v7;
    v41[1] = 3221225472;
    v41[2] = sub_10000577C;
    v41[3] = &unk_100008480;
    v41[4] = *(_QWORD *)(a1 + 32);
    v41[5] = v25;
    pl_dispatch_async(&_dispatch_main_q, v41);
  }
  else
  {
    v38[0] = v7;
    v38[1] = 3221225472;
    v38[2] = sub_100005904;
    v38[3] = &unk_1000084A8;
    v28 = *(id *)(a1 + 40);
    v29 = *(_QWORD *)(a1 + 32);
    v39 = v28;
    v40 = v29;
    pl_dispatch_async(&_dispatch_main_q, v38);

  }
}

void sub_10000535C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t Log;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;

  v5 = a3;
  if (a2)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "videoComplement"));
    objc_msgSend(*(id *)(a1 + 32), "setVideoComplement:", v6);
    objc_msgSend(*(id *)(a1 + 32), "setMediaType:", 3);
  }
  else
  {
    Log = PLPhotoSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Couldn't get live photo from provider:%@ error:%@", (uint8_t *)&v9, 0x16u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10000545C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t Log;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathExtension"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathExtension:", v9));

    v11 = NSTemporaryDirectory();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingPathComponent:", v10));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v22 = 0;
    v16 = objc_msgSend(v15, "copyItemAtURL:toURL:error:", v5, v14, &v22);
    v17 = v22;

    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "setMediaURL:", v14);
      objc_msgSend(*(id *)(a1 + 32), "setMediaType:", 1);
    }
    else
    {
      Log = PLPhotoSharingGetLog();
      v21 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v5;
        v25 = 2112;
        v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Failed to copy shared video from URL:%@ error:%@", buf, 0x16u);
      }

    }
  }
  else
  {
    v18 = PLPhotoSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v24 = v19;
      v25 = 2112;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Couldn't get image from provider:%@ error:%@", buf, 0x16u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1000056A0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setMediaURL:", a2);
    objc_msgSend(*(id *)(a1 + 32), "setMediaType:", 2);
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v3 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000059A0;
    v8[3] = &unk_100008408;
    v9 = *(id *)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(void **)(a1 + 56);
    v10 = v5;
    v11 = v6;
    v12 = v7;
    objc_msgSend(v3, "loadItemForTypeIdentifier:options:completionHandler:", v4, 0, v8);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_10000577C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v2 = PLServicesLocalizedFrameworkString(CFSTR("CANNOT_ADD_PHOTOS_TITLE"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "localizedTitle"));
  v5 = PFStringWithValidatedFormat(v3, CFSTR("%@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = PLServicesLocalizedFrameworkString(CFSTR("PHOTOS_IN_STREAM_LIMIT_REACHED_MESSAGE"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = PFLocalizedStringWithValidatedFormat(v8, CFSTR("%lu"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v10, 1));
  v12 = PLLocalizedFrameworkString(CFSTR("OK"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100005998;
  v15[3] = &unk_100008458;
  v15[4] = *(_QWORD *)(a1 + 32);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 1, v15));
  objc_msgSend(v11, "addAction:", v14);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v11, 1, 0);
}

void sub_100005904(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[PXVideoTrimQueueController photoLibraryFromSources:album:](PXVideoTrimQueueController, "photoLibraryFromSources:album:", *(_QWORD *)(a1 + 32), 0));
  v2 = objc_msgSend(objc_alloc((Class)PXVideoTrimQueueController), "initWithPhotoLibrary:videoSources:videoSourcesSharingInfo:customExportsInfo:album:", v5, *(_QWORD *)(a1 + 32), 0, 0, 0);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "start");

}

id sub_100005998(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void sub_1000059A0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  id v8;
  int8x16_t v9;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setMediaData:", a2);
    objc_msgSend(*(id *)(a1 + 32), "setMediaType:", 2);
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v3 = *(void **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100005A78;
    v7[3] = &unk_1000083E0;
    v8 = *(id *)(a1 + 32);
    v6 = *(int8x16_t *)(a1 + 40);
    v5 = (id)v6.i64[0];
    v9 = vextq_s8(v6, v6, 8uLL);
    objc_msgSend(v3, "loadItemForTypeIdentifier:options:completionHandler:", v4, 0, v7);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100005A78(uint64_t a1, UIImage *a2, void *a3)
{
  id v5;
  NSData *v6;
  NSObject *v7;
  uint64_t Log;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v5 = a3;
  if (a2)
  {
    v6 = UIImageJPEGRepresentation(a2, 0.899999976);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(*(id *)(a1 + 32), "setMediaData:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setMediaType:", 2);
  }
  else
  {
    Log = PLPhotoSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Couldn't get image from provider:%@ error:%@", (uint8_t *)&v10, 0x16u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_100005B80(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.mobileslideshow.StreamShareService.post", 0);
  v2 = (void *)qword_10000CD88;
  qword_10000CD88 = (uint64_t)v1;

}

id sub_100005BAC(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
  v3 = objc_msgSend(v2, "popViewControllerAnimated:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "reloadSheetActions");
}

void sub_100005BF0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id *v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;

  v10 = (id)objc_opt_new(PUPhotoStreamAlbumsTableViewController);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationItem"));
  v4 = PULocalizedString(CFSTR("ADD_TO_PHOTO_STREAM"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v2, "setTitle:", v5);

  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v10, "setPickerDelegate:", WeakRetained);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cloudGUID"));
  objc_msgSend(v10, "addSelectedCloudGuid:", v8);

  v9 = objc_loadWeakRetained(v6);
  objc_msgSend(v9, "pushActionViewController:", v10);

}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__pushTitleController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pushTitleController");
}

id objc_msgSend__setBuiltinTransitionStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setBuiltinTransitionStyle:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSelectedCloudGuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSelectedCloudGuid:");
}

id objc_msgSend_addToExistingWorkflow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addToExistingWorkflow");
}

id objc_msgSend_albumListAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "albumListAction");
}

id objc_msgSend_albumListForContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "albumListForContentMode:");
}

id objc_msgSend_albums(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "albums");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetsCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetsCount");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachments");
}

id objc_msgSend_canContributeToCloudSharedAlbum(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canContributeToCloudSharedAlbum");
}

id objc_msgSend_canPerformEditOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canPerformEditOperation:");
}

id objc_msgSend_cloudGUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudGUID");
}

id objc_msgSend_conformsToType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToType:");
}

id objc_msgSend_containers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containers");
}

id objc_msgSend_contentText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentText");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_hasItemConformingToTypeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasItemConformingToTypeIdentifier:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithPhotoLibrary_videoSources_videoSourcesSharingInfo_customExportsInfo_album_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPhotoLibrary:videoSources:videoSourcesSharingInfo:customExportsInfo:album:");
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputItems");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadFileRepresentationForTypeIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadFileRepresentationForTypeIdentifier:completionHandler:");
}

id objc_msgSend_loadItemForTypeIdentifier_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadItemForTypeIdentifier:options:completionHandler:");
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedTitle");
}

id objc_msgSend_maxAssetsPerStream(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxAssetsPerStream");
}

id objc_msgSend_maxCharactersPerComment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxCharactersPerComment");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaType");
}

id objc_msgSend_mediaURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaURL");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_photoLibraryFromSources_album_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoLibraryFromSources:album:");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_publishMediaFromSources_toNewSharedAlbumWithName_withCommentText_recipients_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publishMediaFromSources:toNewSharedAlbumWithName:withCommentText:recipients:");
}

id objc_msgSend_publishMediaFromSources_toSharedAlbum_withCommentText_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publishMediaFromSources:toSharedAlbum:withCommentText:completionHandler:");
}

id objc_msgSend_pushActionViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushActionViewController:");
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recipients");
}

id objc_msgSend_reloadSheetActions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadSheetActions");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_setCharactersRemaining_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCharactersRemaining:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setMediaData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaData:");
}

id objc_msgSend_setMediaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaType:");
}

id objc_msgSend_setMediaURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMediaURL:");
}

id objc_msgSend_setNextButtonTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNextButtonTitle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPickerDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPickerDelegate:");
}

id objc_msgSend_setTapHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTapHandler:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleDelegate:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setVideoComplement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVideoComplement:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_systemPhotoLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemPhotoLibrary");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_trimmedVideoInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trimmedVideoInfo");
}

id objc_msgSend_typeWithFilenameExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeWithFilenameExtension:");
}

id objc_msgSend_videoComplement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "videoComplement");
}
