void sub_100003784(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PHCloudSharedAlbumChangeRequest changeRequestForCloudSharedAlbum:](PHCloudSharedAlbumChangeRequest, "changeRequestForCloudSharedAlbum:", *(_QWORD *)(a1 + 32)));
  v4 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));
  objc_msgSend(v2, "setInvitationStateLocalForInvitationRecords:invitationStateLocal:", v3, &off_100071A10);

}

void sub_100003894(id a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = -[PhotosApplication px_photoLibrary]_0();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = objc_msgSend(v2, "photoLibrary");

  +[PHQuery photoLibraryWasAccessed](PHQuery, "photoLibraryWasAccessed");
}

void sub_100003B70(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "px_photoLibrary"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003E18;
  v8[3] = &unk_10006AD40;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void sub_100003D6C(id a1, NSError *a2)
{
  NSError *v2;
  int v3;
  NSError *v4;

  v2 = a2;
  if (v2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error while synchronizing key/value store: %@", (uint8_t *)&v3, 0xCu);
  }

}

void sub_100003E18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id obj;
  _QWORD block[5];
  id v45;
  id v46;
  id v47;
  _QWORD v48[5];
  _QWORD v49[4];
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  id v62;

  v5 = a2;
  v41 = a1;
  v42 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "librarySpecificFetchOptions"));
  v39 = v5;
  v62 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v62, 1));
  v38 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHCloudSharedAlbum fetchCloudSharedAlbumsWithGUIDs:options:](PHCloudSharedAlbum, "fetchCloudSharedAlbumsWithGUIDs:options:", v7, v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  v40 = v9;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "invitationRecords"));
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "invitationState"));
        v16 = objc_msgSend(v15, "intValue");

        if (v16 == 1)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "inviteePhones"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v17));

          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v19 = v42;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v53;
            while (2)
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(_QWORD *)v53 != v22)
                  objc_enumerationMutation(v19);
                if (objc_msgSend(v18, "containsObject:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)j)))
                {
                  v24 = *(void **)(v41 + 32);
                  v49[0] = _NSConcreteStackBlock;
                  v49[1] = 3221225472;
                  v49[2] = sub_100003784;
                  v49[3] = &unk_10006D648;
                  v50 = v40;
                  v51 = v14;
                  v48[0] = _NSConcreteStackBlock;
                  v48[1] = 3221225472;
                  v48[2] = sub_100020ECC;
                  v48[3] = &unk_10006D1C0;
                  v48[4] = v14;
                  objc_msgSend(v24, "performChanges:completionHandler:", v49, v48);

                  goto LABEL_17;
                }
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
              if (v21)
                continue;
              break;
            }
          }
LABEL_17:

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v11);
  }
  if ((unint64_t)objc_msgSend(v42, "count") < 2)
  {
    v32 = PLLocalizedFrameworkString(CFSTR("CANNOT_ADD_SUBSCRIBER_BY_PHONE_TITLE"), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v33 = PLLocalizedFrameworkString(CFSTR("CANNOT_ADD_SUBSCRIBER_BY_PHONE_MESSAGE"), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v29 = v40;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedTitle"));
    v31 = PFStringWithValidatedFormat(v28, CFSTR("%@"));
  }
  else
  {
    v25 = PLLocalizedFrameworkString(CFSTR("CANNOT_ADD_SUBSCRIBER_BY_PHONES_TITLE"), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = PLLocalizedFrameworkString(CFSTR("CANNOT_ADD_SUBSCRIBER_BY_PHONES_MESSAGE"), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = v40;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedTitle"));
    v31 = PFLocalizedStringWithValidatedFormat(v28, CFSTR("%lu %@"));
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(v31);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021018;
  block[3] = &unk_10006B268;
  block[4] = *(_QWORD *)(v41 + 40);
  v45 = v26;
  v46 = v34;
  v47 = v29;
  v35 = v29;
  v36 = v34;
  v37 = v26;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;

  v4 = objc_autoreleasePoolPush();
  PLPushPhotoLibraryClient(1);
  +[PHPhotoLibrary enableMultiLibraryMode](PHPhotoLibrary, "enableMultiLibraryMode");
  global_queue = dispatch_get_global_queue(33, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v6, &stru_10006D510);

  v7 = (objc_class *)objc_opt_class(PhotosApplication);
  v8 = NSStringFromClass(v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
  v10 = UIApplicationMain(a1, a2, v9, v9);

  objc_autoreleasePoolPop(v4);
  return v10;
}

void sub_100004D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *sub_1000067E0(unint64_t a1)
{
  if (a1 >= 5)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a1));
  else
    return *(&off_10006D480 + a1);
}

void sub_100006830(id a1, BOOL a2, NSError *a3)
{
  NSError *v4;
  int v5;
  NSError *v6;

  v4 = a3;
  if (!a2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed setting application audio session category for Photos Application! Error: %@", (uint8_t *)&v5, 0xCu);
  }

}

uint64_t sub_100006A60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = &v11[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for LocalizedStringResource(0);
  sub_1000077B8(v8, qword_10007AC48);
  sub_1000077A0(v8, (uint64_t)qword_10007AC48);
  v9 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001BLL, 0x80000001000504E0);
  static Locale.current.getter(v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v7, 0x6E65746E49707041, 0xEA00000000007374, v5, v3, 0, 0, 256);
}

uint64_t sub_100006BE0()
{
  uint64_t v0;

  if (qword_100079830 != -1)
    swift_once(&qword_100079830, sub_100006A60);
  v0 = type metadata accessor for LocalizedStringResource(0);
  return sub_1000077A0(v0, (uint64_t)qword_10007AC48);
}

uint64_t sub_100006C28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  Swift::String v6;
  uint64_t KeyPath;
  uint64_t v8;
  Swift::String v9;

  sub_1000076E0(&qword_1000798D8);
  sub_100007DF4();
  __chkstk_darwin();
  sub_100007E58();
  v1 = sub_1000076E0(&qword_1000798E0);
  sub_100007DF4();
  __chkstk_darwin();
  sub_100007E34();
  v4 = v3 - v2;
  v5 = sub_100007524();
  ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)(34, 1, &type metadata for OpenCollectionIntent, v5);
  v6._object = (void *)0x80000001000504B0;
  v6._countAndFlagsBits = 0xD000000000000022;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v6);
  KeyPath = swift_getKeyPath(&unk_100055FE8);
  v8 = sub_1000076E0(&qword_1000798E8);
  ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)(KeyPath, v1, v8);
  swift_release(KeyPath);
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v9);
  ParameterSummaryString.init(stringInterpolation:)(v4, &type metadata for OpenCollectionIntent, v5);
  return IntentParameterSummary.init(_:table:)(v0, 0x6E65746E49707041, 0xEA00000000007374, &type metadata for OpenCollectionIntent, v5);
}

void sub_100006D78()
{
  IntentParameter.projectedValue.getter();
  sub_100007E50();
}

uint64_t sub_100006D94(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[2] = a1;
  v2[3] = a2;
  v3 = type metadata accessor for URL(0);
  v2[4] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[5] = v4;
  v2[6] = sub_100007E70(v4);
  v5 = sub_100007EB0();
  v2[7] = v5;
  v2[8] = sub_100007E70(*(_QWORD *)(v5 - 8));
  v6 = type metadata accessor for MainActor(0);
  v2[9] = static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6);
  return swift_task_switch(sub_100006E30, v7, v8);
}

id sub_100006E30()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSURL *v8;
  void *v9;
  void *v10;

  swift_release(*(_QWORD *)(v0 + 72));
  result = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  if (result)
  {
    v2 = result;
    v4 = *(_QWORD *)(v0 + 56);
    v3 = *(_QWORD *)(v0 + 64);
    v6 = *(_QWORD *)(v0 + 40);
    v5 = *(_QWORD *)(v0 + 48);
    v7 = *(_QWORD *)(v0 + 32);
    IntentParameter.wrappedValue.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v3 + *(int *)(v4 + 28), v7);
    sub_100007760(v3);
    URL._bridgeToObjectiveC()(v8);
    v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    objc_msgSend(v2, "openSensitiveURL:withOptions:", v10, 0);

    static IntentResult.result<>()();
    swift_task_dealloc(v3);
    swift_task_dealloc(v5);
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100006F34()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006F54(uint64_t a1)
{
  uint64_t v1;

  sub_100007EB0();
  sub_100007DF4();
  __chkstk_darwin();
  sub_100007E58();
  sub_1000077F8(a1, v1);
  IntentParameter.wrappedValue.setter(v1);
  return sub_100007760(a1);
}

uint64_t sub_100006FB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v37 = *(_QWORD *)(v0 - 8);
  v38 = v0;
  ((void (*)(void))__chkstk_darwin)();
  sub_100007E90();
  v36 = v1;
  sub_1000076E0(&qword_1000798B8);
  sub_100007DF4();
  v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v35 = (uint64_t)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v34 = (uint64_t)&v32 - v4;
  sub_1000076E0(&qword_1000798C0);
  sub_100007DF4();
  __chkstk_darwin(v5);
  sub_100007E90();
  v33 = v6;
  sub_1000076E0(&qword_10007A1B0);
  sub_100007DF4();
  __chkstk_darwin(v7);
  sub_100007E34();
  v10 = v9 - v8;
  v11 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  __chkstk_darwin(v11);
  sub_100007E34();
  type metadata accessor for Locale(0);
  sub_100007DF4();
  __chkstk_darwin(v12);
  sub_100007E34();
  type metadata accessor for String.LocalizationValue(0);
  sub_100007DF4();
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v32 - v17;
  type metadata accessor for LocalizedStringResource(0);
  sub_100007DF4();
  __chkstk_darwin(v19);
  sub_100007E34();
  v22 = v21 - v20;
  v23 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000002DLL, 0x8000000100050440);
  static Locale.current.getter(v23);
  sub_100007E80();
  sub_100007E04((uint64_t)v18);
  String.LocalizationValue.init(stringLiteral:)(0xD000000000000033, 0x8000000100050470);
  v24 = sub_1000076E0(&qword_1000798C8);
  static Locale.current.getter(v24);
  sub_100007E80();
  sub_100007E04((uint64_t)v16);
  sub_100007E44(v10, 0);
  v25 = sub_100007EB0();
  v26 = v33;
  sub_100007720(v33, 1, 1, v25);
  type metadata accessor for IntentDialog(0);
  v27 = v34;
  sub_100007E44(v34, 1);
  v28 = v35;
  sub_100007E44(v35, 1);
  v29 = v36;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v37 + 104))(v36, enum case for InputConnectionBehavior.default(_:), v38);
  sub_10000772C(qword_100079F70, type metadata accessor for CollectionEntity);
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v22, v10, v26, v27, v28, v29, v30);
}

uint64_t sub_1000072D8()
{
  return sub_100006F34();
}

uint64_t sub_1000072E0(uint64_t a1)
{
  return sub_100006F54(a1);
}

void (*sub_1000072E8(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100007330;
}

void sub_100007330(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t sub_100007360@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100006BE0();
  v3 = type metadata accessor for LocalizedStringResource(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

uint64_t sub_1000073A0()
{
  return byte_100079838;
}

uint64_t sub_1000073BC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc(dword_1000798D4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100007414;
  return sub_100006D94(a1, v4);
}

uint64_t sub_100007414()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000745C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_100006FB4();
  *a1 = result;
  return result;
}

uint64_t sub_100007480(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100007524();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t variable initialization expression of GenerativeStoryFeedbackActionPerformer.previousMemoryUUID()
{
  return 0;
}

unint64_t sub_1000074B8()
{
  unint64_t result;

  result = qword_100079868;
  if (!qword_100079868)
  {
    result = swift_getWitnessTable(&unk_100055EC0, &type metadata for OpenCollectionIntent);
    atomic_store(result, (unint64_t *)&qword_100079868);
  }
  return result;
}

void sub_1000074F4()
{
  sub_10000772C(&qword_100079870, type metadata accessor for CollectionEntity);
}

unint64_t sub_100007524()
{
  unint64_t result;

  result = qword_100079878;
  if (!qword_100079878)
  {
    result = swift_getWitnessTable(&unk_100055EE8, &type metadata for OpenCollectionIntent);
    atomic_store(result, (unint64_t *)&qword_100079878);
  }
  return result;
}

unint64_t sub_100007564()
{
  unint64_t result;

  result = qword_100079880;
  if (!qword_100079880)
  {
    result = swift_getWitnessTable(&unk_100055F78, &type metadata for OpenCollectionIntent);
    atomic_store(result, (unint64_t *)&qword_100079880);
  }
  return result;
}

unint64_t sub_1000075A4()
{
  unint64_t result;

  result = qword_100079888;
  if (!qword_100079888)
  {
    result = swift_getWitnessTable(&unk_100055FA0, &type metadata for OpenCollectionIntent);
    atomic_store(result, (unint64_t *)&qword_100079888);
  }
  return result;
}

uint64_t sub_1000075E0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100056D28, 1);
}

uint64_t sub_1000075F0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100056D00, 1);
}

ValueMetadata *type metadata accessor for OpenCollectionIntent()
{
  return &type metadata for OpenCollectionIntent;
}

void sub_100007610()
{
  sub_1000076AC(&qword_100079898, &qword_1000798A0);
}

uint64_t sub_10000763C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_100007680()
{
  sub_1000076AC(&qword_1000798A8, &qword_1000798B0);
}

void sub_1000076AC(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = sub_10000763C(a2);
    atomic_store(sub_100007EA4(v3), a1);
  }
  sub_100007E50();
}

uint64_t sub_1000076E0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

void sub_10000772C(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = a2(255);
    atomic_store(sub_100007EA4(v3), a1);
  }
  sub_100007E50();
}

uint64_t sub_100007760(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CollectionEntity(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000077A0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_1000077B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_1000077F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CollectionEntity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_10000783C()
{
  uint64_t *v0;

  sub_100007DC0(*v0, (void (*)(uint64_t))&String._bridgeToObjectiveC());
}

NSString sub_100007864@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  NSString result;

  result = sub_100007D8C(a1);
  *a2 = result;
  return result;
}

void sub_100007888()
{
  uint64_t *v0;

  sub_100007DC0(*v0, (void (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000078A8(uint64_t a1)
{
  uint64_t *v1;

  return sub_100007A3C(a1, *v1);
}

Swift::Int sub_1000078B0(uint64_t a1)
{
  uint64_t *v1;

  return sub_10001300C(a1, *v1);
}

uint64_t sub_1000078B8(uint64_t *a1, uint64_t *a2)
{
  return sub_1000079B8(*a1, *a2);
}

uint64_t sub_1000078C4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100007908@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100007934(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000772C(&qword_100079930, (uint64_t (*)(uint64_t))type metadata accessor for Key);
  v3 = v2;
  sub_10000772C(&qword_100079938, (uint64_t (*)(uint64_t))type metadata accessor for Key);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v4, &protocol witness table for String);
}

uint64_t sub_1000079B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v3 = ((uint64_t (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_100007A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_100007BD4(a1, &qword_1000798F0, (uint64_t)&unk_100069E78);
}

__n128 sub_100007A90(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100007AA0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100007AC0(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_100007BD4(a1, &qword_1000798F8, (uint64_t)&unk_100069EF8);
}

uint64_t sub_100007AFC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_100007B2C(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_100007B40(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100007B60(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
  sub_100007BD4(a1, &qword_100079900, (uint64_t)&unk_100069F78);
}

void type metadata accessor for CGImage(uint64_t a1)
{
  sub_100007BD4(a1, &qword_100079908, (uint64_t)&unk_100069FB0);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_100007BD4(a1, &qword_100079910, (uint64_t)&unk_100069FE0);
}

void sub_100007BD4(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void sub_100007C18()
{
  sub_10000772C(&qword_100079918, (uint64_t (*)(uint64_t))type metadata accessor for Key);
}

void sub_100007C44()
{
  sub_10000772C(&qword_100079920, (uint64_t (*)(uint64_t))type metadata accessor for Key);
}

void sub_100007C70()
{
  sub_10000772C(&qword_100079928, (uint64_t (*)(uint64_t))type metadata accessor for Key);
}

uint64_t sub_100007C9C(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_100007D10(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

NSString sub_100007D8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSString v3;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v2 = v1;
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return v3;
}

void sub_100007DC0(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v5 = v4;
  a2(v3);
  swift_bridgeObjectRelease(v5);
  sub_100007E50();
}

uint64_t sub_100007E04(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(a1, 0x6E65746E49707041, 0xEA00000000007374, v2, v1, 0, 0, 256);
}

uint64_t sub_100007E44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100007720(a1, a2, 1, v2);
}

uint64_t sub_100007E70@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(_QWORD *)(a1 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_100007E80()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(v3, v0, v2);
}

uint64_t sub_100007EA4(uint64_t a1)
{
  uint64_t v1;

  return swift_getWitnessTable(v1, a1);
}

uint64_t sub_100007EB0()
{
  return type metadata accessor for CollectionEntity(0);
}

void sub_100007EB8()
{
  _QWORD *v0;
  uint64_t v1;

  sub_100009738();
  *v0 = v1;
  sub_100007E50();
}

uint64_t sub_100007ED4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t KeyPath;
  uint64_t v53;
  void (*v54)(void);
  void (*v55)(uint64_t);
  uint64_t v56;
  uint64_t v57;
  Swift::String v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, _QWORD, uint64_t);
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  uint64_t v67;
  Swift::String v68;
  uint64_t v69;
  Swift::String v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t);
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  void (*v84)(char *, uint64_t, uint64_t);
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(uint64_t);
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(char *, uint64_t, uint64_t);
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(char *, uint64_t);
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void (*v115)(void);
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void (*v129)(uint64_t);
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  Swift::String v146;
  Swift::String v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t OpaqueTypeConformance2;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _QWORD v161[16];
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void (*v176)(uint64_t);
  void (*v177)(char *, _QWORD, uint64_t);
  unsigned int v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  _QWORD v184[6];
  Swift::String v185;
  Swift::String v186;
  Swift::String v187;
  Swift::String v188;
  Swift::String v189;
  Swift::String v190;
  Swift::String v191;
  Swift::String v192;
  Swift::String v193;
  Swift::String v194;
  Swift::String v195;
  Swift::String v196;
  Swift::String v197;
  Swift::String v198;
  Swift::String v199;
  Swift::String v200;
  Swift::String v201;
  Swift::String v202;
  Swift::String v203;
  Swift::String v204;
  Swift::String v205;
  Swift::String v206;
  Swift::String v207;
  Swift::String v208;
  Swift::String v209;
  Swift::String v210;
  Swift::String v211;
  Swift::String v212;
  Swift::String v213;
  Swift::String v214;
  Swift::String v215;

  sub_1000076E0(&qword_100079970);
  sub_100007DF4();
  __chkstk_darwin(v1);
  sub_100007E90();
  v174 = v2;
  v172 = sub_1000076E0(&qword_100079978);
  sub_100007DF4();
  __chkstk_darwin(v3);
  sub_100007E90();
  v171 = v4;
  sub_1000076E0(&qword_100079980);
  sub_100007DF4();
  __chkstk_darwin(v5);
  sub_100007E90();
  v173 = v6;
  sub_1000076E0(&qword_100079988);
  sub_100007DF4();
  __chkstk_darwin(v7);
  sub_100007E90();
  v175 = v8;
  v9 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v169 = *(_QWORD *)(v9 - 8);
  v170 = v9;
  __chkstk_darwin(v9);
  sub_100007E90();
  v11 = sub_1000095D8(v10);
  type metadata accessor for Locale(v11);
  sub_100007DF4();
  __chkstk_darwin(v12);
  sub_100007E90();
  v14 = sub_1000095D8(v13);
  type metadata accessor for String.LocalizationValue(v14);
  sub_100007DF4();
  __chkstk_darwin(v15);
  sub_100007E90();
  v17 = sub_1000095D8(v16);
  type metadata accessor for LocalizedStringResource(v17);
  sub_100007DF4();
  __chkstk_darwin(v18);
  sub_100007E90();
  v20 = sub_1000095D8(v19);
  v182 = type metadata accessor for AppShortcutPhraseToken(v20);
  v21 = *(_QWORD *)(v182 - 8);
  __chkstk_darwin(v182);
  v23 = (char *)v161 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_1000076E0(&qword_100079990);
  sub_100007DF4();
  __chkstk_darwin(v25);
  sub_100009550();
  __chkstk_darwin(v26);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v27);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v28);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v29);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v30);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v31);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v32);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v33);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v34);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v35);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v36);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v37);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v38);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v39);
  sub_10000956C();
  sub_100009550();
  __chkstk_darwin(v40);
  sub_10000956C();
  sub_100009550();
  v42 = __chkstk_darwin(v41);
  v44 = (char *)v161 - v43;
  __chkstk_darwin(v42);
  v167 = type metadata accessor for AppShortcut(0);
  v166 = *(_QWORD *)(v167 - 8);
  __chkstk_darwin(v167);
  sub_100007E90();
  v163 = v45;
  v184[5] = sub_100006FB4();
  v46 = sub_1000076E0(&qword_100079998);
  v47 = *(_QWORD *)(sub_1000076E0(&qword_1000799A0) - 8);
  v180 = *(_QWORD *)(v47 + 72);
  v48 = *(unsigned __int8 *)(v47 + 80);
  v49 = (v48 + 32) & ~v48;
  v50 = swift_allocObject(v46, v49 + 18 * v180, v48 | 7);
  v162 = v50;
  *(_OWORD *)(v50 + 16) = xmmword_100056200;
  v51 = v50 + v49;
  v183 = sub_100007524();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(9, 2, &type metadata for OpenCollectionIntent, v183);
  v185._countAndFlagsBits = sub_100009744();
  sub_100009548(v185);
  KeyPath = swift_getKeyPath(&unk_1000562A0);
  v181 = sub_1000076E0(&qword_1000798E8);
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(KeyPath, v24, v181);
  sub_1000095B8();
  v186._countAndFlagsBits = 544106784;
  v186._object = (void *)0xE400000000000000;
  sub_100009548(v186);
  v53 = enum case for AppShortcutPhraseToken.applicationName(_:);
  v177 = *(void (**)(char *, _QWORD, uint64_t))(v21 + 104);
  v178 = enum case for AppShortcutPhraseToken.applicationName(_:);
  sub_100009670();
  v54();
  sub_100009560();
  v55 = *(void (**)(uint64_t))(v21 + 8);
  v56 = sub_100009708();
  v55(v56);
  v176 = v55;
  sub_100009538();
  v179 = v51;
  v57 = sub_1000095E8();
  sub_1000095AC(v57, (uint64_t)&type metadata for OpenCollectionIntent);
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(12, 2, &type metadata for OpenCollectionIntent, v0);
  v58._countAndFlagsBits = sub_1000096D4(0x6E65704Fu);
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v58);
  v59 = swift_getKeyPath(&unk_1000562A0);
  sub_100009720(v59);
  sub_1000095B8();
  v187._countAndFlagsBits = 544106784;
  v187._object = (void *)0xE400000000000000;
  sub_100009548(v187);
  v60 = v53;
  v61 = v182;
  v62 = v177;
  v177(v23, v60, v182);
  sub_100009560();
  ((void (*)(char *, uint64_t))v55)(v23, v61);
  sub_100009538();
  v63 = v183;
  AppShortcutPhrase.init(stringInterpolation:)(v44, &type metadata for OpenCollectionIntent, v183);
  v64 = v161[0];
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(13, 2, &type metadata for OpenCollectionIntent, v63);
  v188._countAndFlagsBits = 0x656874206E65704FLL;
  v188._object = (void *)0xE900000000000020;
  sub_10000972C(v188);
  v65 = swift_getKeyPath(&unk_1000562A0);
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(v65, v24, v181);
  sub_1000095B8();
  v189._countAndFlagsBits = 544106784;
  v189._object = (void *)0xE400000000000000;
  sub_100009548(v189);
  v62(v23, v178, v61);
  sub_100009560();
  v66 = (void (*)(char *, uint64_t))v176;
  ((void (*)(char *, uint64_t))v176)(v23, v61);
  sub_100009538();
  AppShortcutPhrase.init(stringInterpolation:)(v64, &type metadata for OpenCollectionIntent, v63);
  v67 = v161[1];
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(12, 2, &type metadata for OpenCollectionIntent, v63);
  v68._countAndFlagsBits = sub_1000096D4(0x776F6853u);
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v68);
  v69 = swift_getKeyPath(&unk_1000562A0);
  sub_10000968C(v69, v24);
  sub_1000095B8();
  v161[0] = v179 + 3 * v180;
  v70._countAndFlagsBits = 544106784;
  v70._object = (void *)0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v70);
  v71 = sub_10000967C();
  v72 = v182;
  v73 = v177;
  ((void (*)(uint64_t))v177)(v71);
  sub_100009560();
  v66(v23, v72);
  sub_100009538();
  sub_1000095AC(v67, (uint64_t)&type metadata for OpenCollectionIntent);
  sub_1000095C0(9);
  v190._countAndFlagsBits = 0x20776F6853;
  v190._object = (void *)0xE500000000000000;
  sub_100009548(v190);
  v74 = swift_getKeyPath(&unk_1000562A0);
  sub_1000095F4(v74);
  sub_100009578();
  v191._countAndFlagsBits = 544106784;
  v191._object = (void *)0xE400000000000000;
  sub_100009548(v191);
  v75 = v182;
  v73(v23, v61, v182);
  sub_100009560();
  v76 = v75;
  v77 = (void (*)(char *, uint64_t))v176;
  ((void (*)(char *, uint64_t))v176)(v23, v75);
  sub_100009538();
  v78 = sub_1000095E8();
  v79 = v183;
  sub_1000095D0(v78, (uint64_t)&type metadata for OpenCollectionIntent);
  sub_100009648();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(13, 2, &type metadata for OpenCollectionIntent, v79);
  v192._countAndFlagsBits = 0x65687420776F6853;
  v192._object = (void *)0xE900000000000020;
  sub_100009548(v192);
  v80 = swift_getKeyPath(&unk_1000562A0);
  sub_100009638(v80);
  sub_100009578();
  v193._countAndFlagsBits = 544106784;
  v193._object = (void *)0xE400000000000000;
  sub_100009548(v193);
  v81 = v23;
  v82 = v23;
  v83 = v178;
  v84 = v177;
  v177(v82, v178, v76);
  sub_1000096E8();
  v77(v81, v76);
  sub_100009538();
  v85 = sub_1000095E8();
  sub_1000095D0(v85, (uint64_t)&type metadata for OpenCollectionIntent);
  sub_100009580(9);
  v194._countAndFlagsBits = 0x20776F6853;
  v194._object = (void *)0xE500000000000000;
  sub_100009548(v194);
  v84(v81, v83, v76);
  sub_1000096E8();
  v86 = v81;
  v77(v81, v76);
  v87 = v179;
  v195._countAndFlagsBits = 543584032;
  v195._object = (void *)0xE400000000000000;
  sub_100009548(v195);
  v88 = swift_getKeyPath(&unk_1000562A0);
  sub_10000968C(v88, v24);
  sub_1000095B8();
  sub_100009538();
  v89 = sub_1000095E8();
  sub_100009614(v89, (uint64_t)&type metadata for OpenCollectionIntent);
  sub_1000096C4(11);
  v196._countAndFlagsBits = sub_100009660() & 0xFFFFFFFFFFFFLL | 0x6D20000000000000;
  sub_100009620(v196);
  v90 = swift_getKeyPath(&unk_1000562A0);
  sub_10000968C(v90, v24);
  sub_100009578();
  v197._countAndFlagsBits = 32;
  v197._object = (void *)0xE100000000000000;
  sub_100009548(v197);
  sub_10000967C();
  sub_100009670();
  v91 = (void (*)(uint64_t))v177;
  ((void (*)(void))v177)();
  sub_100009560();
  v92 = sub_100009708();
  v176(v92);
  sub_100009538();
  v93 = sub_1000095E8();
  sub_100009614(v93, (uint64_t)&type metadata for OpenCollectionIntent);
  v94 = v161[6];
  sub_1000096C4(8);
  v198._countAndFlagsBits = sub_100009660() & 0xFFFFFFFFFFFFLL | 0x20000000000000;
  v198._object = (void *)0xE700000000000000;
  sub_10000972C(v198);
  v95 = swift_getKeyPath(&unk_1000562A0);
  sub_100009720(v95);
  sub_100009578();
  v199._countAndFlagsBits = 32;
  v199._object = (void *)0xE100000000000000;
  sub_100009548(v199);
  v96 = sub_1000096F4();
  v91(v96);
  sub_100009560();
  sub_100009608();
  sub_100009538();
  sub_1000096A4(v94);
  sub_10000962C();
  sub_1000096B4(12);
  v200._countAndFlagsBits = sub_100009660() & 0xFFFFFFFFFFFFLL | 0x7420000000000000;
  v200._object = (void *)0xEB00000000206568;
  sub_100009590(v200);
  v97 = swift_getKeyPath(&unk_1000562A0);
  sub_1000095F4(v97);
  sub_100009578();
  v201._countAndFlagsBits = 32;
  v201._object = (void *)0xE100000000000000;
  sub_100009548(v201);
  v98 = v178;
  sub_100009670();
  v99 = v177;
  ((void (*)(void))v177)();
  v100 = v87;
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v86, v24);
  v101 = sub_100009708();
  v176(v101);
  sub_100009538();
  v102 = sub_100009654();
  sub_1000095AC(v102, (uint64_t)&type metadata for OpenCollectionIntent);
  sub_10000962C();
  sub_1000095C0(13);
  v202._countAndFlagsBits = sub_100009694() & 0xFFFFFFFFFFFFLL | 0x796D000000000000;
  v202._object = (void *)0xE900000000000020;
  sub_100009590(v202);
  v103 = swift_getKeyPath(&unk_1000562A0);
  sub_100009638(v103);
  sub_100009578();
  v203._countAndFlagsBits = 544106784;
  v203._object = (void *)0xE400000000000000;
  sub_100009548(v203);
  v104 = v182;
  v99(v86, v98, v182);
  sub_100009560();
  v105 = (void (*)(char *, uint64_t))v176;
  ((void (*)(char *, uint64_t))v176)(v86, v104);
  sub_100009538();
  v106 = sub_100009654();
  sub_1000095D0(v106, (uint64_t)&type metadata for OpenCollectionIntent);
  sub_10000962C();
  sub_100009580(10);
  v204._countAndFlagsBits = sub_100009694();
  v204._object = (void *)0xE600000000000000;
  sub_100009590(v204);
  v107 = swift_getKeyPath(&unk_1000562A0);
  v108 = v181;
  sub_10000968C(v107, v24);
  sub_100009578();
  v205._countAndFlagsBits = 544106784;
  v205._object = (void *)0xE400000000000000;
  sub_100009548(v205);
  v109 = v178;
  sub_100009670();
  ((void (*)(void))v177)();
  sub_100009560();
  sub_100009714();
  sub_100009538();
  v110 = sub_100009654();
  sub_1000095AC(v110, (uint64_t)&type metadata for OpenCollectionIntent);
  sub_10000962C();
  sub_1000095C0(14);
  v206._countAndFlagsBits = sub_100009694() & 0xFFFFFFFFFFFFLL | 0x6874000000000000;
  v206._object = (void *)0xEA00000000002065;
  sub_100009590(v206);
  v111 = swift_getKeyPath(&unk_1000562A0);
  v112 = v108;
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(v111, v24, v108);
  sub_100009578();
  v207._countAndFlagsBits = 544106784;
  v207._object = (void *)0xE400000000000000;
  sub_100009548(v207);
  v113 = v109;
  v114 = v182;
  v115 = (void (*)(void))v177;
  v177(v86, v113, v182);
  sub_100009560();
  v105(v86, v114);
  sub_100009538();
  v116 = sub_100009654();
  sub_1000095D0(v116, (uint64_t)&type metadata for OpenCollectionIntent);
  sub_10000962C();
  sub_100009580(11);
  v208._countAndFlagsBits = 0x20646E6946;
  v208._object = (void *)0xE500000000000000;
  sub_100009590(v208);
  v117 = swift_getKeyPath(&unk_1000562A0);
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(v117, v24, v112);
  sub_100009578();
  v209._countAndFlagsBits = 0x206874697720;
  v209._object = (void *)0xE600000000000000;
  sub_100009548(v209);
  v118 = v178;
  sub_100009670();
  v115();
  sub_100009560();
  v119 = sub_100009708();
  v176(v119);
  sub_100009538();
  v120 = sub_100009654();
  v121 = v183;
  AppShortcutPhrase.init(stringInterpolation:)(v120, &type metadata for OpenCollectionIntent, v183);
  sub_100009648();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(4, 2, &type metadata for OpenCollectionIntent, v121);
  sub_100009538();
  ((void (*)(char *, uint64_t, uint64_t))v115)(v86, v118, v112);
  sub_100009560();
  sub_100009714();
  v122 = v179;
  v210._countAndFlagsBits = 543584032;
  v210._object = (void *)0xE400000000000000;
  sub_100009548(v210);
  v123 = swift_getKeyPath(&unk_1000562A0);
  AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(v123, v24, v181);
  sub_1000095B8();
  sub_100009538();
  v124 = sub_1000095E8();
  sub_1000096A4(v124);
  sub_100009648();
  sub_1000096B4(1);
  sub_100009538();
  v125 = swift_getKeyPath(&unk_1000562A0);
  sub_10000959C(v125);
  sub_100009578();
  v126 = v122 + 15 * v180;
  v211._countAndFlagsBits = 32;
  v211._object = (void *)0xE100000000000000;
  sub_100009548(v211);
  v127 = sub_10000967C();
  v128 = v112;
  v129 = (void (*)(uint64_t))v177;
  ((void (*)(uint64_t))v177)(v127);
  sub_100009560();
  ((void (*)(char *, uint64_t))v176)(v86, v128);
  sub_100009538();
  v130 = sub_1000095E8();
  sub_100009614(v130, (uint64_t)&type metadata for OpenCollectionIntent);
  v131 = v161[14];
  v132 = v126;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 2, &type metadata for OpenCollectionIntent, v126);
  v212._countAndFlagsBits = 543516756;
  v212._object = (void *)0xE400000000000000;
  sub_100009620(v212);
  v133 = swift_getKeyPath(&unk_1000562A0);
  sub_10000959C(v133);
  sub_100009578();
  v213._countAndFlagsBits = 32;
  v213._object = (void *)0xE100000000000000;
  sub_100009548(v213);
  v134 = sub_1000096F4();
  v129(v134);
  sub_100009560();
  sub_100009608();
  sub_100009538();
  sub_1000095D0(v131, (uint64_t)&type metadata for OpenCollectionIntent);
  v135 = v161[15];
  sub_100009580(4);
  v214._countAndFlagsBits = 2128205;
  v214._object = (void *)0xE300000000000000;
  sub_100009620(v214);
  v136 = swift_getKeyPath(&unk_1000562A0);
  sub_10000959C(v136);
  sub_100009578();
  v215._countAndFlagsBits = 32;
  v215._object = (void *)0xE100000000000000;
  sub_100009548(v215);
  ((void (*)(char *, _QWORD, unint64_t))v129)(v86, v178, v121);
  sub_100009560();
  sub_100009608();
  sub_100009538();
  sub_1000095D0(v135, (uint64_t)&type metadata for OpenCollectionIntent);
  v137 = v164;
  String.LocalizationValue.init(stringLiteral:)(0xD00000000000001BLL, 0x80000001000504E0);
  sub_100009648();
  static Locale.current.getter(v138);
  v139 = v168;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v169 + 104))(v168, enum case for LocalizedStringResource.BundleDescription.main(_:), v170);
  v140 = v165;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v137, 0x6E65746E49707041, 0xEA00000000007374, v100, v139, 0, 0, 256);
  v182 = swift_getKeyPath(&unk_1000562A0);
  v141 = type metadata accessor for CollectionEntity(0);
  v142 = sub_1000076E0(&qword_1000798C8);
  v143 = sub_100009478();
  v144 = v171;
  v145 = v181;
  AppShortcutParameterPresentationSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 1, &type metadata for OpenCollectionIntent, v141, v142, v181, v132, v143);
  v146._countAndFlagsBits = sub_100009744();
  AppShortcutParameterPresentationSummaryString.StringInterpolation.appendLiteral(_:)(v146);
  swift_getKeyPath(&unk_1000562A0);
  AppShortcutParameterPresentationSummaryString.StringInterpolation.appendInterpolation(_:)();
  sub_1000095B8();
  v147._countAndFlagsBits = 0;
  v147._object = (void *)0xE000000000000000;
  v148 = v144;
  AppShortcutParameterPresentationSummaryString.StringInterpolation.appendLiteral(_:)(v147);
  v149 = v174;
  AppShortcutParameterPresentationSummaryString.init(stringInterpolation:)(v148, &type metadata for OpenCollectionIntent, v141, v142, v145, v132, v143);
  v150 = v173;
  AppShortcutParameterPresentationSummary.init(_:table:)(v149, "AppIntents", 10, 2, &type metadata for OpenCollectionIntent, v141, v142, v145, v132, v143);
  v151 = sub_1000076E0(&qword_1000799B0);
  v152 = sub_10000763C(&qword_1000799B8);
  v153 = sub_1000094B8();
  v184[0] = v141;
  v184[1] = v152;
  v184[2] = v143;
  v184[3] = v153;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v184, &opaque type descriptor for <<opaque return type of static AppShortcutOptionsCollectionSpecificationBuilder.buildBlock<A>(_:)>>, 1);
  AppShortcutParameterPresentation.init<A>(for:summary:optionsCollections:)(v182, v150, sub_1000090E8, 0, v145, v151, v132, OpaqueTypeConformance2);
  sub_100009648();
  AppShortcut.init<A, B, C, D>(intent:phrases:shortTitle:systemImageName:parameterPresentation:)(v155, v162, v140, 0x6C676E6174636572);
  v156 = static AppShortcutsBuilder.buildExpression(_:)(v151);
  (*(void (**)(uint64_t, uint64_t))(v166 + 8))(v151, v167);
  v157 = sub_1000076E0(&qword_1000799C8);
  v158 = swift_allocObject(v157, 40, 7);
  *(_OWORD *)(v158 + 16) = xmmword_100056210;
  *(_QWORD *)(v158 + 32) = v156;
  v159 = static AppShortcutsBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v158);
  return v159;
}

uint64_t sub_1000090E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _BYTE v23[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v23[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v10);
  v12 = &v23[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_1000076E0(&qword_1000799B8);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v23[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x8000000100050550);
  static Locale.current.getter(v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v9, 0x6E65746E49707041, 0xEA00000000007374, v6, v3, 0, 0, 256);
  v18 = sub_1000094FC();
  AppShortcutOptionsCollection.init(_:title:systemImageName:)(v18, v12, 0x736F746F6870, 0xE600000000000000, &type metadata for CollectionQuery, v18);
  v19 = type metadata accessor for CollectionEntity(0);
  v20 = sub_100009478();
  v21 = sub_1000094B8();
  static AppShortcutOptionsCollectionSpecificationBuilder.buildBlock<A>(_:)(v16, v19, v13, v20, v21);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v14 + 8))(v16, v13);
}

void sub_100009330()
{
  sub_100009420();
  static AppShortcutsProvider.updateAppShortcutParameters()();
  sub_100007E50();
}

id sub_100009370()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosAppShortcutsProviderWrapper();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_1000093C0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosAppShortcutsProviderWrapper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PhotosAppShortcutsProviderWrapper()
{
  return objc_opt_self(_TtC15MobileSlideShow33PhotosAppShortcutsProviderWrapper);
}

ValueMetadata *type metadata accessor for PhotosAppShortcutsProvider()
{
  return &type metadata for PhotosAppShortcutsProvider;
}

unint64_t sub_100009420()
{
  unint64_t result;

  result = qword_100079968;
  if (!qword_100079968)
  {
    result = swift_getWitnessTable(&unk_100056220, &type metadata for PhotosAppShortcutsProvider);
    atomic_store(result, (unint64_t *)&qword_100079968);
  }
  return result;
}

void sub_10000945C()
{
  _QWORD *v0;
  uint64_t v1;

  sub_100009738();
  *v0 = v1;
  sub_100007E50();
}

unint64_t sub_100009478()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000799A8;
  if (!qword_1000799A8)
  {
    v1 = type metadata accessor for CollectionEntity(255);
    result = swift_getWitnessTable(&unk_10005681C, v1);
    atomic_store(result, (unint64_t *)&qword_1000799A8);
  }
  return result;
}

unint64_t sub_1000094B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000799C0;
  if (!qword_1000799C0)
  {
    v1 = sub_10000763C(&qword_1000799B8);
    result = swift_getWitnessTable(&protocol conformance descriptor for AppShortcutOptionsCollection<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000799C0);
  }
  return result;
}

unint64_t sub_1000094FC()
{
  unint64_t result;

  result = qword_100079F60;
  if (!qword_100079F60)
  {
    result = swift_getWitnessTable(&unk_100056954, &type metadata for CollectionQuery);
    atomic_store(result, (unint64_t *)&qword_100079F60);
  }
  return result;
}

void sub_100009538()
{
  Swift::String v0;

  v0._countAndFlagsBits = 0;
  v0._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v0);
}

void sub_100009548(Swift::String a1)
{
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(a1);
}

void sub_100009550()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t sub_100009560()
{
  uint64_t v0;
  uint64_t v1;

  return AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v0, v1);
}

uint64_t sub_100009578()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_100009580(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(a1, 2, v1, v2);
}

void sub_100009590(Swift::String a1)
{
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(a1);
}

uint64_t sub_10000959C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(a1, v2, v1);
}

uint64_t sub_1000095AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return AppShortcutPhrase.init(stringInterpolation:)(a1, a2, *(_QWORD *)(v2 - 144));
}

uint64_t sub_1000095B8()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_1000095C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(a1, 2, v1, v2);
}

uint64_t sub_1000095D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return AppShortcutPhrase.init(stringInterpolation:)(a1, a2, v2);
}

uint64_t sub_1000095D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

uint64_t sub_1000095E8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1000095F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(a1, v1, *(_QWORD *)(v2 - 160));
}

uint64_t sub_100009608()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v2, v0);
}

uint64_t sub_100009614(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return AppShortcutPhrase.init(stringInterpolation:)(a1, a2, *(_QWORD *)(v2 - 144));
}

void sub_100009620(Swift::String a1)
{
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(a1);
}

uint64_t sub_100009638(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(a1, v2, v1);
}

uint64_t sub_100009654()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_100009660()
{
  return 0x6573776F7242;
}

uint64_t sub_10000967C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10000968C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(a1, a2, v2);
}

uint64_t sub_100009694()
{
  return 0x206F74206F47;
}

uint64_t sub_1000096A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return AppShortcutPhrase.init(stringInterpolation:)(a1, v1, *(_QWORD *)(v2 - 144));
}

uint64_t sub_1000096B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(a1, 2, v1, v2);
}

uint64_t sub_1000096C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(a1, 2, v2, v1);
}

uint64_t sub_1000096D4(unsigned int a1)
{
  return a1 | 0x20796D2000000000;
}

uint64_t sub_1000096E8()
{
  uint64_t v0;
  uint64_t v1;

  return AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v0, v1);
}

uint64_t sub_1000096F4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_100009708()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_100009714()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t sub_100009720(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return AppShortcutPhrase.StringInterpolation.appendInterpolation<A, B>(_:)(a1, v1, *(_QWORD *)(v2 - 160));
}

void sub_10000972C(Swift::String a1)
{
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(a1);
}

void sub_100009738()
{
  sub_100006D78();
}

uint64_t sub_100009744()
{
  return 0x206E65704FLL;
}

uint64_t sub_100009758()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_1000077B8(v0, qword_1000799D0);
  sub_1000077A0(v0, (uint64_t)qword_1000799D0);
  return Logger.init(subsystem:category:)(0xD000000000000010, 0x8000000100050960, 0xD000000000000026, 0x8000000100056370);
}

id sub_1000097D4(void *a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char *v7;
  char v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _WORD *v15;
  uint64_t v16;
  objc_super v18;
  _QWORD v19[5];

  v3 = &v1[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryFeedbackActionPerformer_previousMemoryUUID];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = type metadata accessor for FeedbackFeatureFlags(0);
  v19[3] = v4;
  sub_10000772C(&qword_100079AB8, (uint64_t (*)(uint64_t))&type metadata accessor for FeedbackFeatureFlags);
  v19[4] = v5;
  v6 = sub_10000CA20(v19);
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(v6, enum case for FeedbackFeatureFlags.CentralizedFeedback(_:), v4);
  v7 = v1;
  v8 = isFeatureEnabled(_:)(v19);
  sub_10000CAA0(v19);
  if ((v8 & 1) != 0)
  {
    type metadata accessor for FBKEvaluationController(0);
    sub_10000CA5C(&qword_100079AC0);
    v9 = a1;
    *(_QWORD *)&v7[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryFeedbackActionPerformer_feedbackController] = FBKEvaluationController.__allocating_init(delegate:)();

    v18.receiver = v7;
    v18.super_class = (Class)type metadata accessor for GenerativeStoryFeedbackActionPerformer();
    v10 = objc_msgSendSuper2(&v18, "init");

  }
  else
  {
    if (qword_100079840 != -1)
      swift_once(&qword_100079840, sub_100009758);
    v11 = sub_10000CC24();
    v12 = sub_1000077A0(v11, (uint64_t)qword_1000799D0);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (_WORD *)sub_10000CBDC(2);
      *v15 = 0;
      sub_10000CD8C((void *)&_mh_execute_header, v13, v14, "FeedbackFrameworks/CentralizedFeedback feature flag disabled. Skipping Centralized Feedback");
      sub_10000CBA0((uint64_t)v15);
    }

    sub_10000CD7C();
    v16 = type metadata accessor for GenerativeStoryFeedbackActionPerformer();
    swift_deallocPartialClassInstance(v7, v16, 32, 7);
    return 0;
  }
  return v10;
}

uint64_t GenerativeStoryFeedbackActionPerformer.reportFeedback(type:memory:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5[9] = a4;
  v5[10] = v4;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  v5[11] = swift_getObjectType(v4);
  v6 = sub_1000076E0(&qword_100079A10);
  v5[12] = sub_100007E70(*(_QWORD *)(v6 - 8));
  v7 = sub_10000CC80();
  v5[13] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[14] = v8;
  v5[15] = *(_QWORD *)(v8 + 64);
  v5[16] = sub_10000CC70();
  v5[17] = sub_10000CC70();
  v9 = type metadata accessor for GenerativeStoryGMCentralizedFeedbackType(0);
  v5[18] = v9;
  v5[19] = *(_QWORD *)(v9 - 8);
  v5[20] = sub_10000CC70();
  v5[21] = sub_10000CC70();
  v5[22] = sub_10000CC70();
  sub_10000CC08();
  return sub_10000CB94();
}

uint64_t sub_100009A78()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __n128 v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  id v35;
  _WORD *v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  void (*v48)(uint64_t, uint64_t, uint64_t);
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  __n128 v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  _QWORD *v67;
  void *v69;
  uint64_t v70;
  id v71;
  NSObject *log;
  uint64_t v73;
  os_log_type_t type;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v1 = (void *)xmmword_1000799E8;
  if ((_QWORD)xmmword_1000799E8)
  {
    v2 = unk_100079A00;
    v3 = (void *)*((_QWORD *)&xmmword_1000799E8 + 1);
    sub_10000C944(0, (unint64_t *)&qword_100079A40, NSObject_ptr);
    v4 = (void *)sub_10000CCFC();
    sub_10000C8C0(v4, v5, v6, v2);
    v7 = v3;
    v8 = static NSObject.== infix(_:_:)();

    if ((v8 & 1) != 0)
    {
      v75 = v7;
      v77 = v2;
      if (qword_100079840 != -1)
        swift_once(&qword_100079840, sub_100009758);
      v9 = *(_QWORD *)(v0 + 176);
      v10 = *(_QWORD *)(v0 + 152);
      v11 = *(void **)(v0 + 56);
      v12 = sub_10000CC24();
      v13 = sub_1000077A0(v12, (uint64_t)qword_1000799D0);
      v14 = *(void (**)(uint64_t))(v10 + 16);
      v15 = sub_10000CD70();
      v14(v15);
      Logger.logObject.getter(v11);
      v16 = sub_10000CD44();
      v17 = sub_10000CCA4(v16);
      v18 = *(_QWORD *)(v0 + 176);
      if (v17)
      {
        log = v13;
        v19 = *(_QWORD *)(v0 + 168);
        type = v9;
        v20 = *(_QWORD *)(v0 + 144);
        v70 = *(_QWORD *)(v0 + 152);
        v71 = *(id *)(v0 + 56);
        v21 = sub_10000CBDC(22);
        v73 = sub_10000CBDC(64);
        v79 = v73;
        *(_DWORD *)v21 = 136315394;
        ((void (*)(uint64_t, uint64_t, uint64_t))v14)(v19, v18, v20);
        v22 = String.init<A>(describing:)(v19, v20);
        v24 = v23;
        *(_QWORD *)(v0 + 32) = sub_10000C15C(v22, v23, &v79);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v21 + 4, v21 + 12);
        v25 = swift_bridgeObjectRelease(v24);
        (*(void (**)(uint64_t, uint64_t, __n128))(v70 + 8))(v18, v20, v25);
        *(_WORD *)(v21 + 12) = 2080;
        v26 = objc_msgSend(v71, "uuid");
        v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
        v29 = v28;

        *(_QWORD *)(v0 + 40) = sub_10000C15C(v27, v29, &v79);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v21 + 14, v21 + 22);

        swift_bridgeObjectRelease(v29);
        _os_log_impl((void *)&_mh_execute_header, log, type, "Skipping reporting feedback of type: %s for memory %s because previous request was not completed", (uint8_t *)v21, 0x16u);
        sub_10000CD64(v30, v31, (uint64_t)&type metadata for Any + 8);
        sub_10000CBA0(v73);
        sub_10000CBA0(v21);
        swift_release(v77);

      }
      else
      {
        v69 = *(void **)(v0 + 56);
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 144));

        swift_release(v77);
      }
      sub_10000CC88();
      sub_10000CC2C();
      sub_10000CD5C();
      sub_10000CD54();
      sub_10000CD84();
      sub_10000CD4C();
      return sub_10000CBE4(*(uint64_t (**)(void))(v0 + 8));
    }
    if (qword_100079840 != -1)
      swift_once(&qword_100079840, sub_100009758);
    v32 = sub_10000CC24();
    v33 = sub_1000077A0(v32, (uint64_t)qword_1000799D0);
    Logger.logObject.getter(v33);
    v34 = sub_10000CD44();
    if (sub_10000CCA4(v34))
    {
      v35 = v7;
      v36 = (_WORD *)sub_10000CBDC(2);
      *v36 = 0;
      sub_10000CD8C((void *)&_mh_execute_header, v33, (os_log_type_t)v3, "Ignoring previous request because feedback controller does not match");
      v37 = (uint64_t)v36;
      v7 = v35;
      sub_10000CBA0(v37);
    }

    v38 = xmmword_1000799E8;
    v39 = qword_1000799F8;
    v40 = unk_100079A00;
    xmmword_1000799E8 = 0u;
    *(_OWORD *)&qword_1000799F8 = 0u;
    sub_10000C128((void *)v38, *((void **)&v38 + 1), v39, v40);
    swift_release(v2);

  }
  if (qword_100079840 != -1)
    swift_once(&qword_100079840, sub_100009758);
  v42 = *(_QWORD *)(v0 + 152);
  v41 = *(_QWORD *)(v0 + 160);
  v43 = *(_QWORD *)(v0 + 144);
  v44 = *(_QWORD *)(v0 + 48);
  v45 = *(void **)(v0 + 56);
  v46 = sub_10000CC24();
  v47 = sub_1000077A0(v46, (uint64_t)qword_1000799D0);
  v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16);
  v48(v41, v44, v43);
  v49 = v47;
  Logger.logObject.getter(v45);
  v50 = sub_10000CD44();
  if (os_log_type_enabled(v47, v50))
  {
    v52 = *(_QWORD *)(v0 + 160);
    v51 = *(_QWORD *)(v0 + 168);
    v53 = *(_QWORD *)(v0 + 144);
    v76 = *(_QWORD *)(v0 + 152);
    v54 = *(void **)(v0 + 56);
    v55 = sub_10000CBDC(22);
    v78 = sub_10000CBDC(64);
    *(_DWORD *)v55 = 136315394;
    v79 = v78;
    v48(v51, v52, v53);
    v56 = String.init<A>(describing:)(v51, v53);
    v58 = v57;
    *(_QWORD *)(v0 + 16) = sub_10000C15C(v56, v57, &v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v55 + 4, v55 + 12);
    v59 = swift_bridgeObjectRelease(v58);
    (*(void (**)(uint64_t, uint64_t, __n128))(v76 + 8))(v52, v53, v59);
    *(_WORD *)(v55 + 12) = 2080;
    v60 = objc_msgSend(v54, "uuid");
    v61 = static String._unconditionallyBridgeFromObjectiveC(_:)(v60);
    v63 = v62;

    *(_QWORD *)(v0 + 24) = sub_10000C15C(v61, v63, &v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v55 + 14, v55 + 22);

    swift_bridgeObjectRelease(v63);
    _os_log_impl((void *)&_mh_execute_header, v49, v50, "Reporting feedback of type: %s for memory %s", (uint8_t *)v55, 0x16u);
    sub_10000CD64(v64, v65, (uint64_t)&type metadata for Any + 8);
    sub_10000CBA0(v78);
    sub_10000CBA0(v55);

  }
  else
  {
    v66 = *(void **)(v0 + 56);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));

  }
  v67 = (_QWORD *)swift_task_alloc(dword_100079A1C);
  *(_QWORD *)(v0 + 184) = v67;
  *v67 = v0;
  v67[1] = sub_10000A07C;
  return sub_10000AB18(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 56));
}

uint64_t sub_10000A07C()
{
  uint64_t v0;

  sub_10000CD24();
  sub_10000CBCC(*(_QWORD *)(v0 + 184));
  sub_10000CC08();
  return sub_10000CB94();
}

uint64_t sub_10000A0B0()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v1 = (uint64_t *)(v0[10] + OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryFeedbackActionPerformer_previousMemoryUUID);
  v2 = v1[1];
  if (v2)
  {
    v3 = *v1;
    v4 = (void *)v0[7];
    swift_bridgeObjectRetain(v1[1]);
    v5 = objc_msgSend(v4, "uuid");
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v8 = v7;

    if (v3 == v6 && v2 == v8)
    {
      sub_10000CC78();
      sub_10000CD34();
    }
    else
    {
      v10 = sub_10000CD70();
      v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v11, v6, v8, 0);
      sub_10000CC78();
      v13 = sub_10000CD34();
      if ((v12 & 1) == 0)
        dispatch thunk of FBKEvaluationController.reset()(v13);
    }
  }
  v15 = v0[16];
  v14 = v0[17];
  v16 = v0[14];
  v17 = v0[15];
  v19 = v0[12];
  v18 = v0[13];
  v20 = v0[11];
  v44 = v0[9];
  v21 = (void *)v0[7];
  v42 = v0[10];
  v43 = v0[8];
  v22 = type metadata accessor for TaskPriority(0);
  sub_100007720(v19, 1, 1, v22);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v15, v14, v18);
  v23 = *(unsigned __int8 *)(v16 + 80);
  v24 = (v23 + 32) & ~v23;
  v25 = (v17 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v26 = swift_allocObject(&unk_10006A1D8, v25 + 8, v23 | 7);
  *(_QWORD *)(v26 + 16) = 0;
  *(_QWORD *)(v26 + 24) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v26 + v24, v15, v18);
  *(_QWORD *)(v26 + v25) = v20;
  v27 = sub_10000A604(v19, (uint64_t)&unk_100079A30, v26);
  swift_release(v27);
  v28 = objc_msgSend(v21, "uuid");
  v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  v31 = v30;

  sub_10000AAFC(v29, v31);
  v32 = *(void **)(v42 + OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryFeedbackActionPerformer_feedbackController);
  v33 = xmmword_1000799E8;
  v34 = qword_1000799F8;
  v35 = unk_100079A00;
  *(_QWORD *)&xmmword_1000799E8 = v21;
  *((_QWORD *)&xmmword_1000799E8 + 1) = v32;
  qword_1000799F8 = v43;
  unk_100079A00 = v44;
  v36 = v21;
  v37 = v32;
  swift_retain(v44);
  sub_10000C128((void *)v33, *((void **)&v33 + 1), v34, v35);
  v38 = type metadata accessor for MainActor(0);
  v0[24] = static MainActor.shared.getter();
  v39 = dispatch thunk of Actor.unownedExecutor.getter(v38);
  return swift_task_switch(sub_10000A318, v39, v40);
}

uint64_t sub_10000A318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release(*(_QWORD *)(v0 + 192));
  v1 = sub_10000CCFC();
  sub_10000A748(v1, v2, v3);
  sub_10000CC08();
  return swift_task_switch(v4, v5, v6);
}

uint64_t sub_10000A370()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 104));
  sub_10000CC88();
  sub_10000CC2C();
  sub_10000CD5C();
  sub_10000CD54();
  sub_10000CD84();
  sub_10000CD4C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000A3D0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(async function pointer to FBKSEvaluation.Subject.presented()[1]);
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_10000A41C;
  return FBKSEvaluation.Subject.presented()();
}

uint64_t sub_10000A41C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  sub_10000CD24();
  v3 = *(_QWORD *)(v2 + 32);
  v4 = *v1;
  *v5 = v4;
  *(_QWORD *)(v2 + 40) = v0;
  swift_task_dealloc(v3);
  if (!v0)
    return sub_10000CC3C(*(uint64_t (**)(void))(v4 + 8));
  sub_10000CC08();
  return sub_10000CB94();
}

uint64_t sub_10000A46C()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BOOL v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;

  if (qword_100079840 != -1)
    swift_once(&qword_100079840, sub_100009758);
  v2 = sub_10000CC24();
  sub_1000077A0(v2, (uint64_t)qword_1000799D0);
  sub_10000CC9C();
  v3 = sub_10000CC9C();
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  v6 = sub_10000CCEC(v5);
  v7 = *(_QWORD *)(v0 + 40);
  if (v6)
  {
    v8 = (uint8_t *)sub_10000CBDC(12);
    v9 = sub_10000CBDC(32);
    v15 = v9;
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)(v0 + 16) = v7;
    swift_errorRetain(v7);
    v10 = sub_1000076E0((uint64_t *)&unk_100079A58);
    v11 = String.init<A>(describing:)(v0 + 16, v10);
    v13 = v12;
    *(_QWORD *)(v0 + 24) = sub_10000C15C(v11, v12, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v13);
    sub_10000CC34();
    sub_10000CC34();
    sub_10000CD3C((void *)&_mh_execute_header, v4, v1, ".presented() failed to report with error: %s", v8);
    sub_10000CCB4((uint64_t)&type metadata for Any);
    sub_10000CBA0(v9);
    sub_10000CBA0((uint64_t)v8);

    sub_10000CC34();
  }
  else
  {
    sub_10000CC34();
    sub_10000CC34();
    sub_10000CC34();

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000A604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD v17[4];

  v6 = type metadata accessor for TaskPriority(0);
  if (sub_10000C914(a1, 1, v6) == 1)
  {
    sub_10000CAC4(a1, &qword_100079A10);
    v7 = 7168;
  }
  else
  {
    v8 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    v7 = v8 | 0x1C00;
  }
  v9 = *(_QWORD *)(a3 + 16);
  if (v9)
  {
    ObjectType = swift_getObjectType(*(_QWORD *)(a3 + 16));
    swift_unknownObjectRetain(v9);
    v11 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType);
    v13 = v12;
    swift_unknownObjectRelease(v9);
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  v14 = swift_allocObject(&unk_10006A200, 32, 7);
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  if (v13 | v11)
  {
    v17[0] = 0;
    v17[1] = 0;
    v15 = v17;
    v17[2] = v11;
    v17[3] = v13;
  }
  else
  {
    v15 = 0;
  }
  return swift_task_create(v7, v15, (char *)&type metadata for () + 8, &unk_100079AE0, v14);
}

uint64_t sub_10000A748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  uint64_t v11;

  v5 = type metadata accessor for GenerativeStoryGMCentralizedFeedbackType(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v9 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v8, v5);
  if (v9 == enum case for GenerativeStoryGMCentralizedFeedbackType.thumbsUp(_:))
    return dispatch thunk of FBKEvaluationController.userDidLike(subject:showFeedbackForm:)(a3, 1);
  if (v9 == enum case for GenerativeStoryGMCentralizedFeedbackType.thumbsDown(_:))
    return dispatch thunk of FBKEvaluationController.userDidDislike(subject:showFeedbackForm:)(a3, 1);
  if (v9 == enum case for GenerativeStoryGMCentralizedFeedbackType.reportConcern(_:))
    return dispatch thunk of FBKEvaluationController.userDidReportAConcern(subject:showFeedbackForm:)(a3, 1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id GenerativeStoryFeedbackActionPerformer.actionIcon(type:hasResponse:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = type metadata accessor for FBKSEvaluation.Action(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  sub_10000CCC4();
  type metadata accessor for FBKEvaluationController(0);
  sub_10000A94C(v2);
  static FBKEvaluationController.systemImageName(for:hasResponse:)(v2, a2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  sub_10000C944(0, &qword_100079A48, UIImage_ptr);
  v6 = sub_10000CD70();
  return sub_10000AA9C(v6, v7);
}

uint64_t sub_10000A94C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  unsigned int *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  v4 = type metadata accessor for GenerativeStoryGMCentralizedFeedbackType(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == enum case for GenerativeStoryGMCentralizedFeedbackType.thumbsUp(_:))
  {
    v9 = (unsigned int *)&enum case for FBKSEvaluation.Action.thumbsUp(_:);
LABEL_5:
    v11 = *v9;
    v12 = type metadata accessor for FBKSEvaluation.Action(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(a1, v11, v12);
  }
  v10 = v8;
  if (v8 == enum case for GenerativeStoryGMCentralizedFeedbackType.thumbsDown(_:))
  {
    v9 = (unsigned int *)&enum case for FBKSEvaluation.Action.thumbsDown(_:);
    goto LABEL_5;
  }
  v14 = enum case for GenerativeStoryGMCentralizedFeedbackType.reportConcern(_:);
  v15 = enum case for FBKSEvaluation.Action.reportConcern(_:);
  v16 = type metadata accessor for FBKSEvaluation.Action(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(a1, v15, v16);
  if (v10 != v14)
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return result;
}

id sub_10000AA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSString v4;
  id v5;

  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(v2), "systemImageNamed:", v4);

  return v5;
}

uint64_t sub_10000AAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryFeedbackActionPerformer_previousMemoryUUID);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryFeedbackActionPerformer_previousMemoryUUID + 8);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_10000AB18(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v2[2] = a1;
  v2[3] = a2;
  v4 = (*(_QWORD *)(*(_QWORD *)(sub_1000076E0(&qword_100079AE8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[4] = swift_task_alloc(v4);
  v2[5] = swift_task_alloc(v4);
  v5 = type metadata accessor for FBKSInteraction.FeatureDomain(0);
  v2[6] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[7] = v6;
  v2[8] = sub_100007E70(v6);
  v7 = type metadata accessor for FBKSInteraction.Content(0);
  v2[9] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v2[10] = v8;
  v2[11] = sub_100007E70(v8);
  v9 = sub_1000076E0(&qword_10007A150);
  v10 = sub_100007E70(*(_QWORD *)(v9 - 8));
  v2[12] = v10;
  v11 = type metadata accessor for UUID(0);
  v2[13] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v2[14] = v12;
  v2[15] = sub_100007E70(v12);
  v13 = (_QWORD *)swift_task_alloc(dword_100079AA4);
  v2[16] = v13;
  *v13 = v2;
  v13[1] = sub_10000AC14;
  return sub_10000B04C(v10, a2);
}

uint64_t sub_10000AC14()
{
  uint64_t v0;

  sub_10000CD24();
  sub_10000CBCC(*(_QWORD *)(v0 + 128));
  sub_10000CC08();
  return sub_10000CB94();
}

id sub_10000AC48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id result;
  void *v23;
  void *v24;
  UIImage *v25;
  NSData *v26;
  NSData *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  void (*v52)(uint64_t, _QWORD, uint64_t);
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  if (sub_10000C914(v1, 1, v2) != 1)
  {
    v33 = *(_QWORD *)(v0 + 120);
    v34 = *(_QWORD *)(v0 + 16);
    v35 = *(void (**)(uint64_t))(*(_QWORD *)(v0 + 112) + 32);
    v36 = sub_10000CCFC();
    v35(v36);
    ((void (*)(uint64_t, uint64_t, uint64_t))v35)(v34, v33, v2);
    v37 = enum case for FBKSEvaluation.Subject.id(_:);
    v38 = sub_10000CC80();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 104))(v34, v37, v38);
LABEL_10:
    swift_task_dealloc(*(_QWORD *)(v0 + 120));
    sub_10000CC2C();
    sub_10000CD5C();
    sub_10000CD54();
    sub_10000CD84();
    sub_10000CD4C();
    return (id)sub_10000CBE4(*(uint64_t (**)(void))(v0 + 8));
  }
  v3 = *(void **)(v0 + 24);
  sub_10000CAC4(v1, &qword_10007A150);
  v4 = sub_1000076E0(&qword_100079AF0);
  v5 = sub_1000076E0(&qword_100079AF8);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 72);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = (v8 + 32) & ~v8;
  v10 = swift_allocObject(v4, v9 + v7, v8 | 7);
  *(_OWORD *)(v10 + 16) = xmmword_100056210;
  v11 = *(int *)(v5 + 48);
  FBKSForm.Question.init(stringValue:)(0x617261705F65643ALL, 0xED0000726574656DLL);
  v12 = sub_1000076E0(&qword_100079B00);
  v13 = swift_allocObject(v12, 48, 7);
  *(_OWORD *)(v13 + 16) = xmmword_100056210;
  v14 = objc_msgSend(v3, "localIdentifier");
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v17 = v16;

  *(_QWORD *)(v13 + 32) = v15;
  *(_QWORD *)(v13 + 40) = v17;
  *(_QWORD *)(v10 + v9 + v11) = v13;
  v18 = type metadata accessor for FBKSForm.Question(0);
  v19 = sub_1000076E0(&qword_100079B08);
  sub_10000772C(&qword_100079B10, (uint64_t (*)(uint64_t))&type metadata accessor for FBKSForm.Question);
  v21 = Dictionary.init(dictionaryLiteral:)(v10, v18, v19, v20);
  result = objc_msgSend(v3, "photoLibrary");
  v61 = v21;
  if (result)
  {
    v23 = result;
    v24 = *(void **)(v0 + 24);
    type metadata accessor for PhotosGenerativeStoryFactory();
    v25 = (UIImage *)sub_100011278(v24, v23);

    if (v25)
    {
      v26 = UIImagePNGRepresentation(v25);
      if (v26)
      {
        v27 = v26;
        v28 = *(uint64_t **)(v0 + 88);
        v29 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v31 = v30;

        *v28 = v29;
        v28[1] = v31;
        v32 = (unsigned int *)&enum case for FBKSInteraction.Content.image(_:);
LABEL_9:
        v45 = *(_QWORD *)(v0 + 80);
        v44 = *(_QWORD *)(v0 + 88);
        v47 = *(_QWORD *)(v0 + 64);
        v46 = *(_QWORD *)(v0 + 72);
        v49 = *(_QWORD *)(v0 + 48);
        v48 = *(_QWORD *)(v0 + 56);
        v51 = *(_QWORD *)(v0 + 32);
        v50 = *(char **)(v0 + 40);
        v60 = *(uint64_t **)(v0 + 16);
        v52 = *(void (**)(uint64_t, _QWORD, uint64_t))(v45 + 104);
        v52(v44, *v32, v46);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v48 + 104))(v47, enum case for FBKSInteraction.FeatureDomain.memoryCreation(_:), v49);
        strcpy(v50, "Prompt unknown");
        v50[15] = -18;
        v52((uint64_t)v50, enum case for FBKSInteraction.Content.text(_:), v46);
        sub_10000CD14((uint64_t)v50);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16))(v51, v44, v46);
        sub_10000CD14(v51);
        v53 = objc_allocWithZone((Class)type metadata accessor for FBKSInteraction(0));
        sub_10000CC08();
        v57 = FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)(v54, v55, v56, v61);
        (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v44, v46);
        *v60 = v57;
        v58 = enum case for FBKSEvaluation.Subject.interaction(_:);
        v59 = sub_10000CC80();
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 104))(v60, v58, v59);
        goto LABEL_10;
      }

    }
    v39 = *(uint64_t **)(v0 + 88);
    v40 = objc_msgSend(*(id *)(v0 + 24), "uuid");
    v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
    v43 = v42;

    *v39 = v41;
    v39[1] = v43;
    v32 = (unsigned int *)&enum case for FBKSInteraction.Content.text(_:);
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000B04C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[15] = a1;
  v2[16] = a2;
  v3 = sub_1000076E0(&qword_10007A150);
  v2[17] = sub_100007E70(*(_QWORD *)(v3 - 8));
  v4 = type metadata accessor for UUID(0);
  v2[18] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[19] = v5;
  v2[20] = sub_100007E70(v5);
  sub_10000CC08();
  return sub_10000CB94();
}

uint64_t sub_10000B0AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  _QWORD *v19;

  if (!sub_10000C97C(*(void **)(v0 + 128)))
    goto LABEL_10;
  v1 = v0 + 16;
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("generativeMemoryData"));
  sub_10000CCDC(v2, v3);
  sub_10000CD7C();
  sub_10000CC78();
  if (!*(_QWORD *)(v0 + 40))
    goto LABEL_8;
  sub_1000076E0(&qword_100079AB0);
  v4 = sub_10000CD70();
  if ((swift_dynamicCast(v4, v5, v6, v7, 6) & 1) == 0)
  {
LABEL_10:
    sub_10000CC48();
    sub_10000CC2C();
    return sub_10000CC14(*(uint64_t (**)(void))(v0 + 8));
  }
  v1 = v0 + 48;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("donationId"));
  sub_10000CCDC(v8, v9);
  sub_10000CD7C();
  sub_10000CC78();
  if (!*(_QWORD *)(v0 + 72))
  {
LABEL_8:
    v13 = (uint64_t *)&unk_100079AA8;
    v12 = v1;
    goto LABEL_9;
  }
  if ((swift_dynamicCast(v0 + 80, v0 + 48, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
    goto LABEL_10;
  v10 = *(_QWORD *)(v0 + 136);
  v11 = *(_QWORD *)(v0 + 144);
  UUID.init(uuidString:)(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
  sub_10000CC78();
  if (sub_10000C914(v10, 1, v11) == 1)
  {
    v12 = *(_QWORD *)(v0 + 136);
    v13 = &qword_10007A150;
LABEL_9:
    sub_10000CAC4(v12, v13);
    goto LABEL_10;
  }
  v15 = *(_QWORD *)(v0 + 160);
  v16 = *(_QWORD *)(v0 + 136);
  v17 = *(_QWORD *)(v0 + 144);
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 152) + 32);
  *(_QWORD *)(v0 + 168) = v18;
  v18(v15, v16, v17);
  type metadata accessor for FBKSDonation(0);
  v19 = (_QWORD *)swift_task_alloc(async function pointer to static FBKSDonation.fetch(evaluationID:)[1]);
  *(_QWORD *)(v0 + 176) = v19;
  *v19 = v0;
  v19[1] = sub_10000B234;
  return static FBKSDonation.fetch(evaluationID:)(*(_QWORD *)(v0 + 160));
}

uint64_t sub_10000B234(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 176);
  *(_QWORD *)(v3 + 184) = a1;
  *(_QWORD *)(v3 + 192) = v1;
  swift_task_dealloc(v4);
  sub_10000CC08();
  return sub_10000CB94();
}

uint64_t sub_10000B294()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;

  v1 = *(void **)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 120);
  if (v1)
  {
    v4 = *(_QWORD *)(v0 + 160);
    v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 168);

    v5(v3, v4, v2);
    v6 = 0;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
    v6 = 1;
  }
  sub_100007720(v3, v6, 1, v2);
  swift_task_dealloc(*(_QWORD *)(v0 + 160));
  sub_10000CC2C();
  return sub_10000CC14(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10000B31C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (qword_100079840 != -1)
    swift_once(&qword_100079840, sub_100009758);
  v1 = sub_10000CC24();
  sub_1000077A0(v1, (uint64_t)qword_1000799D0);
  sub_10000CC9C();
  v2 = sub_10000CC9C();
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.error.getter();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(_QWORD *)(v0 + 192);
  v8 = *(_QWORD *)(v0 + 152);
  v7 = *(_QWORD *)(v0 + 160);
  v9 = *(_QWORD *)(v0 + 144);
  if (v5)
  {
    v18 = *(_QWORD *)(v0 + 144);
    v17 = *(_QWORD *)(v0 + 160);
    v10 = (uint8_t *)sub_10000CBDC(12);
    v11 = sub_10000CBDC(32);
    v19 = v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v0 + 104) = v6;
    sub_10000CD0C();
    v12 = sub_1000076E0((uint64_t *)&unk_100079A58);
    v13 = String.init<A>(describing:)(v0 + 104, v12);
    v15 = v14;
    *(_QWORD *)(v0 + 112) = sub_10000C15C(v13, v14, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 112, v0 + 120, v10 + 4, v10 + 12);
    swift_bridgeObjectRelease(v15);
    sub_10000CC00();
    sub_10000CC00();
    sub_10000CD3C((void *)&_mh_execute_header, v3, v4, "Error occurred while retrieving donation. Reason: %s", v10);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    sub_10000CBA0(v11);
    sub_10000CBA0((uint64_t)v10);

    sub_10000CC00();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v17, v18);
  }
  else
  {

    sub_10000CC00();
    sub_10000CC00();
    sub_10000CC00();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  sub_10000CC48();
  sub_10000CC2C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

double sub_10000B500@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_100014028(a1, a2), (v7 & 1) != 0))
  {
    sub_10000C9E4(*(_QWORD *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

void sub_10000B550(char a1, uint64_t a2)
{
  unint64_t v3;
  char v4;

  if (*(_QWORD *)(a2 + 16))
  {
    v3 = sub_1000140BC(a1 & 1);
    if ((v4 & 1) != 0)
      swift_bridgeObjectRetain(*(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v3));
  }
  sub_100007E50();
}

void sub_10000B590(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  char v4;
  id v5;

  if (*(_QWORD *)(a2 + 16))
  {
    v3 = sub_10001408C(a1);
    if ((v4 & 1) != 0)
      v5 = *(id *)(*(_QWORD *)(a2 + 56) + 8 * v3);
  }
  sub_100007E50();
}

void *sub_10000B5D0(char a1, void *a2)
{
  void *v2;
  void *v5;
  uint64_t v6;
  void (*v7)(_QWORD);
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  _QWORD *v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  os_log_t log;
  char v48;
  uint64_t v49;
  os_log_t v50;
  uint64_t v51;

  v2 = (void *)xmmword_1000799E8;
  if (!(_QWORD)xmmword_1000799E8)
  {
    if (qword_100079840 != -1)
      swift_once(&qword_100079840, sub_100009758);
    v23 = type metadata accessor for Logger(0);
    v24 = sub_1000077A0(v23, (uint64_t)qword_1000799D0);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Unexpected report completion with missing feedback report request", v27, 2u);
      swift_slowDealloc(v27, -1, -1);
    }
LABEL_15:

    goto LABEL_19;
  }
  v5 = (void *)*((_QWORD *)&xmmword_1000799E8 + 1);
  v7 = (void (*)(_QWORD))qword_1000799F8;
  v6 = unk_100079A00;
  sub_10000C944(0, (unint64_t *)&qword_100079A40, NSObject_ptr);
  sub_10000C8C0(v2, v5, (uint64_t)v7, v6);
  v8 = v5;
  v9 = static NSObject.== infix(_:_:)();

  if ((v9 & 1) == 0)
  {
    if (qword_100079840 != -1)
      swift_once(&qword_100079840, sub_100009758);
    v28 = type metadata accessor for Logger(0);
    sub_1000077A0(v28, (uint64_t)qword_1000799D0);
    v29 = v8;
    v30 = v2;
    swift_retain_n(v6, 2);
    v31 = a2;
    v32 = v29;
    v33 = v30;
    v34 = v31;
    v35 = Logger.logObject.getter(v34);
    v36 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v35, v36))
    {

      swift_release_n(v6, 3);
      goto LABEL_19;
    }
    v37 = swift_slowAlloc(22, -1);
    v38 = (_QWORD *)swift_slowAlloc(16, -1);
    *(_DWORD *)v37 = 138412546;
    v50 = v32;
    v46 = v6;
    v39 = v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51, v37 + 4, v37 + 12);
    *v38 = v5;
    swift_release_n(v6, 2);

    *(_WORD *)(v37 + 12) = 2112;
    v50 = v34;
    v40 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51, v37 + 14, v37 + 22);
    v38[1] = v34;

    v25 = v35;
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "Unexpected report completion with mismatching controllers. %@ %@", (uint8_t *)v37, 0x16u);
    v41 = sub_1000076E0(&qword_100079AC8);
    swift_arrayDestroy(v38, 2, v41);
    swift_slowDealloc(v38, -1, -1);
    swift_slowDealloc(v37, -1, -1);
    swift_release(v46);

    goto LABEL_15;
  }
  if (qword_100079840 != -1)
    swift_once(&qword_100079840, sub_100009758);
  v10 = type metadata accessor for Logger(0);
  sub_1000077A0(v10, (uint64_t)qword_1000799D0);
  v11 = v8;
  v12 = v2;
  swift_retain_n(v6, 2);
  v13 = v11;
  v14 = v12;
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc(18, -1);
    log = (os_log_t)swift_slowAlloc(32, -1);
    v50 = log;
    *(_DWORD *)v17 = 136315394;
    v18 = objc_msgSend(v14, "uuid");
    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    v48 = a1;
    v21 = v20;

    v49 = sub_10000C15C(v19, v21, (uint64_t *)&v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50, v17 + 4, v17 + 12);
    swift_release_n(v6, 2);

    v22 = v21;
    a1 = v48;
    swift_bridgeObjectRelease(v22);
    *(_WORD *)(v17 + 12) = 1024;
    LODWORD(v49) = v48 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, (char *)&v49 + 4, v17 + 14, v17 + 18);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Completing feedback report for memory %s with status: %{BOOL}d", (uint8_t *)v17, 0x12u);
    swift_arrayDestroy(log, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(log, -1, -1);
    swift_slowDealloc(v17, -1, -1);

  }
  else
  {

    swift_release_n(v6, 2);
  }
  v7(a1 & 1);
  swift_release(v6);

LABEL_19:
  v42 = xmmword_1000799E8;
  v43 = qword_1000799F8;
  v44 = unk_100079A00;
  xmmword_1000799E8 = 0u;
  *(_OWORD *)&qword_1000799F8 = 0u;
  return sub_10000C128((void *)v42, *((void **)&v42 + 1), v43, v44);
}

id GenerativeStoryFeedbackActionPerformer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

void GenerativeStoryFeedbackActionPerformer.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("MobileSlideShow.GenerativeStoryFeedbackActionPerformer", 54, "init()", 6, 0);
  __break(1u);
}

id GenerativeStoryFeedbackActionPerformer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeStoryFeedbackActionPerformer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_10000BC30(uint64_t a1, uint64_t a2)
{
  return GenerativeStoryFeedbackActionPerformer.actionIcon(type:hasResponse:)(a1, a2);
}

uint64_t sub_10000BC44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc(dword_100079A0C);
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_10000CB90;
  return GenerativeStoryFeedbackActionPerformer.reportFeedback(type:memory:completionHandler:)(a1, a2, a3, a4);
}

void *sub_10000BCBC(void *a1)
{
  return UIViewController.evaluationDidComplete(controller:evaluation:)(a1);
}

void *UIViewController.evaluationDidComplete(controller:evaluation:)(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = sub_1000076E0(&qword_100079A50);
  __chkstk_darwin(v3);
  sub_10000CCC4();
  FBKSEvaluation.formResponse.getter();
  v4 = type metadata accessor for FBKSEvaluation.FormResponse(0);
  v5 = sub_10000C914(v1, 1, v4) != 1;
  sub_10000CAC4(v1, &qword_100079A50);
  type metadata accessor for GenerativeStoryFeedbackActionPerformer();
  return sub_10000B5D0(v5, a1);
}

uint64_t sub_10000BD74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UIViewController, a3);
  return FBKEvaluationControllerDelegate.evaluationDidComplete(controller:response:)(a1, a2, a3, WitnessTable);
}

void *sub_10000BDC0(void *a1, uint64_t a2)
{
  return UIViewController.evaluationDidFail(controller:error:)(a1, a2);
}

void *UIViewController.evaluationDidFail(controller:error:)(void *a1, uint64_t a2)
{
  os_log_type_t v2;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;

  if (qword_100079840 != -1)
    swift_once(&qword_100079840, sub_100009758);
  v5 = sub_10000CC24();
  sub_1000077A0(v5, (uint64_t)qword_1000799D0);
  sub_10000CD0C();
  v6 = sub_10000CD0C();
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.error.getter();
  if (sub_10000CCEC(v8))
  {
    v9 = (uint8_t *)sub_10000CBDC(12);
    v10 = sub_10000CBDC(32);
    v16 = a2;
    v17 = v10;
    *(_DWORD *)v9 = 136315138;
    sub_10000CD0C();
    v11 = sub_1000076E0((uint64_t *)&unk_100079A58);
    v12 = String.init<A>(describing:)(&v16, v11);
    v14 = v13;
    v16 = sub_10000C15C(v12, v13, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v16, &v17, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v14);
    sub_10000CC00();
    sub_10000CC00();
    sub_10000CD3C((void *)&_mh_execute_header, v7, v2, "Received error: %s", v9);
    sub_10000CCB4((uint64_t)&type metadata for Any);
    sub_10000CBA0(v10);
    sub_10000CBA0((uint64_t)v9);
  }
  else
  {
    sub_10000CC00();
    sub_10000CC00();
  }

  type metadata accessor for GenerativeStoryFeedbackActionPerformer();
  return sub_10000B5D0(0, a1);
}

uint64_t sub_10000BF5C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000BFC0;
  return v6(a1);
}

uint64_t sub_10000BFC0()
{
  uint64_t v0;

  sub_10000CBAC();
  return sub_10000CC3C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10000BFE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = sub_10000CC80();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v3 | 7;
  v6 = ((*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10000C064()
{
  uint64_t v0;
  _QWORD *v1;

  sub_10000CC80();
  v1 = (_QWORD *)swift_task_alloc(dword_100079A2C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000C104;
  return sub_10000A3D0();
}

uint64_t sub_10000C104()
{
  uint64_t v0;

  sub_10000CBAC();
  return sub_10000CC3C(*(uint64_t (**)(void))(v0 + 8));
}

void *sub_10000C128(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {

    return (void *)swift_release(a4);
  }
  return result;
}

uint64_t sub_10000C15C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[3];
  void *ObjectType;

  sub_10000CC08();
  v9 = sub_10000C228(v6, v7, v8, 1, a1, a2);
  v10 = v15[0];
  if (v9)
  {
    v11 = v9;
    ObjectType = (void *)swift_getObjectType(v9);
    v15[0] = v11;
    v12 = *a3;
    if (*a3)
    {
      sub_10000C9E4((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v15[0] = a1;
    v15[1] = a2;
    v13 = *a3;
    if (*a3)
    {
      sub_10000C9E4((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000CAA0(v15);
  return v10;
}

_QWORD *sub_10000C228(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  _QWORD *result;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10000C37C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_10000C440(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return (_QWORD *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

void *sub_10000C37C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory with negative count", 60, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1170, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1173, 0);
  }
  __break(1u);
  return result;
}

_QWORD *sub_10000C440(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_10000C4D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000C6A8(0, v2[2] + 1, 1, (uint64_t)v2);
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = sub_10000C6A8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

_QWORD *sub_10000C4D4(uint64_t a1, unint64_t a2)
{
  Swift::Int v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v4 = String.UTF8View._foreignCount()();
    if (v4)
      goto LABEL_6;
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return &_swiftEmptyArrayStorage;
LABEL_6:
  v5 = sub_10000C644(v4, 0);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, 2, 71, 0);
    __break(1u);
    goto LABEL_14;
  }
  v6 = v5;
  v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    goto LABEL_15;
  }
  if (v7 == v4)
    return v6;
  result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, 2, 1122, 0);
LABEL_15:
  __break(1u);
  return result;
}

_QWORD *sub_10000C644(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_1000076E0(&qword_100079AD0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_10000C6A8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000076E0(&qword_100079AD0);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_10000C840(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000C77C(v14, v8, v13);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_10000C77C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

char *sub_10000C840(char *__src, size_t __len, char *__dst)
{
  char v4;

  if ((__len & 0x8000000000000000) != 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void *sub_10000C8C0(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  id v7;

  if (result)
  {
    v6 = result;
    v7 = a2;
    return (void *)swift_retain(a4);
  }
  return result;
}

uint64_t type metadata accessor for GenerativeStoryFeedbackActionPerformer()
{
  return objc_opt_self(_TtC15MobileSlideShow38GenerativeStoryFeedbackActionPerformer);
}

uint64_t sub_10000C914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void sub_10000C920()
{
  sub_10000CA5C(&qword_100079A68);
}

uint64_t sub_10000C944(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10000C97C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, "photosGraphProperties");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v1, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

  return v3;
}

uint64_t sub_10000C9E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *sub_10000CA20(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

void sub_10000CA5C(unint64_t *a1)
{
  uint64_t v2;

  if (!*a1)
  {
    v2 = sub_10000C944(255, &qword_100079A70, UIViewController_ptr);
    atomic_store(sub_100007EA4(v2), a1);
  }
  sub_100007E50();
}

uint64_t sub_10000CAA0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_10000CAC4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000076E0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_100007E50();
}

uint64_t sub_10000CAFC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CB20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100079ADC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000C104;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100079AD8 + dword_100079AD8))(a1, v4);
}

uint64_t sub_10000CB94()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_10000CBA0(uint64_t a1)
{
  return swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_10000CBAC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_10000CBCC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 8) = *v1;
  return swift_task_dealloc(a1);
}

uint64_t sub_10000CBDC(uint64_t a1)
{
  return swift_slowAlloc(a1, -1);
}

uint64_t sub_10000CBE4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000CC00()
{
  uint64_t v0;

  return swift_errorRelease(v0);
}

uint64_t sub_10000CC14(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000CC24()
{
  return type metadata accessor for Logger(0);
}

uint64_t sub_10000CC2C()
{
  uint64_t v0;

  return swift_task_dealloc(v0);
}

uint64_t sub_10000CC34()
{
  uint64_t v0;

  return swift_errorRelease(v0);
}

uint64_t sub_10000CC3C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10000CC48()
{
  uint64_t *v0;

  sub_100007720(v0[15], 1, 1, v0[18]);
  return swift_task_dealloc(v0[20]);
}

uint64_t sub_10000CC70()
{
  uint64_t v0;

  return swift_task_alloc(v0);
}

uint64_t sub_10000CC78()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000CC80()
{
  return type metadata accessor for FBKSEvaluation.Subject(0);
}

uint64_t sub_10000CC88()
{
  uint64_t v0;

  return swift_task_dealloc(*(_QWORD *)(v0 + 176));
}

uint64_t sub_10000CC9C()
{
  uint64_t v0;

  return swift_errorRetain(v0);
}

BOOL sub_10000CCA4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10000CCB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return swift_arrayDestroy(v1, 1, a1 + 8);
}

double sub_10000CCDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _OWORD *v3;

  return sub_10000B500(a1, a2, v2, v3);
}

BOOL sub_10000CCEC(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10000CCFC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10000CD0C()
{
  uint64_t v0;

  return swift_errorRetain(v0);
}

uint64_t sub_10000CD14(uint64_t a1)
{
  uint64_t v1;

  return sub_100007720(a1, 0, 1, v1);
}

void sub_10000CD24()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t sub_10000CD34()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

void sub_10000CD3C(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t sub_10000CD44()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000CD4C()
{
  uint64_t v0;

  return swift_task_dealloc(v0);
}

uint64_t sub_10000CD54()
{
  uint64_t v0;

  return swift_task_dealloc(v0);
}

uint64_t sub_10000CD5C()
{
  uint64_t v0;

  return swift_task_dealloc(v0);
}

uint64_t sub_10000CD64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return swift_arrayDestroy(v3, 2, a3);
}

uint64_t sub_10000CD70()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10000CD7C()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000CD84()
{
  uint64_t v0;

  return swift_task_dealloc(v0);
}

void sub_10000CD8C(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

char *sub_10000CD98(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  char *v13;
  char *v14;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain(v4);
  }
  else
  {
    v5 = a1;
    v7 = a2[1];
    v6 = a2[2];
    *((_QWORD *)a1 + 1) = v7;
    *((_QWORD *)a1 + 2) = v6;
    v8 = *(int *)(a3 + 24);
    v9 = &a1[v8];
    v10 = (uint64_t)a2 + v8;
    v11 = type metadata accessor for Logger(0);
    v12 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v13 = v4;
    v14 = v7;
    swift_retain(v6);
    v12(v9, v10, v11);
  }
  return v5;
}

uint64_t sub_10000CE48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release(*(_QWORD *)(a1 + 16));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for Logger(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_10000CEA0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  id v12;
  id v13;

  v4 = *(void **)a2;
  v5 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v5;
  v6 = *(_QWORD *)(a2 + 16);
  a1[2] = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for Logger(0);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v12 = v4;
  v13 = v5;
  swift_retain(v6);
  v11(v8, v9, v10);
  return a1;
}

uint64_t sub_10000CF28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  v9 = *(void **)(a2 + 8);
  v10 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v9;
  v11 = v9;

  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v13;
  swift_retain(v13);
  swift_release(v12);
  v14 = *(int *)(a3 + 24);
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

uint64_t sub_10000CFC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_10000D028(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = a2[1];

  v8 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[2];
  swift_release(v8);
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_10000D0B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000D0C0);
}

uint64_t sub_10000D0C0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_10000CC24();
    return sub_10000C914((uint64_t)a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_10000D130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000D13C);
}

void sub_10000D13C(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *a1 = (a2 - 1);
    sub_10000F018();
  }
  else
  {
    v7 = sub_10000CC24();
    sub_100007720((uint64_t)a1 + *(int *)(a4 + 24), a2, a2, v7);
  }
}

uint64_t type metadata accessor for PhotosGenerativeStoryGMCentralizedFeedbackAlert(uint64_t a1)
{
  uint64_t result;

  result = qword_100079B70;
  if (!qword_100079B70)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PhotosGenerativeStoryGMCentralizedFeedbackAlert);
  return result;
}

uint64_t sub_10000D1D4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = &unk_1000563F0;
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_10000D254(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100056F0C, 1);
}

void sub_10000D264(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = sub_1000076E0(&qword_100079AE8);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v16 - v6;
  v8 = type metadata accessor for FBKSInteraction.FeatureDomain(0);
  __chkstk_darwin(v8);
  sub_100007E34();
  v11 = v10 - v9;
  (*(void (**)(uint64_t, _QWORD))(v12 + 104))(v10 - v9, enum case for FBKSInteraction.FeatureDomain.memoryCreation(_:));
  type metadata accessor for FBKSInteraction.Content(0);
  sub_10000EFF8((uint64_t)v7);
  sub_10000EFF8((uint64_t)v5);
  v13 = objc_allocWithZone((Class)type metadata accessor for FBKSInteraction(0));
  *a1 = FBKSInteraction.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)(v11, 0, 0, 0);
  v14 = enum case for FBKSEvaluation.Subject.interaction(_:);
  v15 = type metadata accessor for FBKSEvaluation.Subject(0);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(a1, v14, v15);
  sub_10000F008();
}

uint64_t sub_10000D3B8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v0 = sub_1000076E0(&qword_100079BB8);
  v1 = sub_10000EA28();
  return NavigationStack.init<>(root:)(sub_10000EA20, &v3, v0, v1);
}

void sub_10000D410(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[6];

  v59 = a1;
  v3 = type metadata accessor for TaskPriority(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v63 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PhotosGenerativeStoryGMCentralizedFeedbackAlert(0);
  v56 = *(_QWORD *)(v6 - 8);
  v7 = *(_QWORD *)(v56 + 64);
  __chkstk_darwin(v6);
  v57 = (uint64_t)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_1000076E0(&qword_100079BD8);
  __chkstk_darwin(v55);
  v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000076E0(&qword_100079BF0);
  v60 = *(_QWORD *)(v10 - 8);
  v61 = v10;
  __chkstk_darwin(v10);
  v58 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000076E0(&qword_100079BD0);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v62 = (uint64_t)&v50 - v16;
  v17 = sub_1000076E0(&qword_100079BF8);
  __chkstk_darwin(v17);
  v19 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for FeedbackFeatureFlags(0);
  v66[3] = v20;
  sub_10000772C(&qword_100079AB8, (uint64_t (*)(uint64_t))&type metadata accessor for FeedbackFeatureFlags);
  v66[4] = v21;
  v22 = sub_10000CA20(v66);
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, enum case for FeedbackFeatureFlags.CentralizedFeedback(_:), v20);
  LOBYTE(v20) = isFeatureEnabled(_:)(v66);
  v23 = sub_10000CAA0(v66);
  if ((v20 & 1) != 0)
  {
    *(_QWORD *)v9 = static HorizontalAlignment.center.getter(v23);
    *((_QWORD *)v9 + 1) = 0x4030000000000000;
    v9[16] = 0;
    v24 = (uint64_t)&v9[*(int *)(sub_1000076E0(&qword_100079C00) + 44)];
    v54 = v17;
    v25 = v59;
    sub_10000D8BC(v59, v24);
    v26 = *(_QWORD *)(v25 + 16);
    v64 = *(_QWORD *)(v25 + 8);
    v65 = v26;
    v27 = sub_1000076E0(&qword_100079C08);
    State.projectedValue.getter(v66, v27);
    v52 = v3;
    v53 = a2;
    v29 = v66[0];
    v28 = v66[1];
    v50 = v12;
    v51 = v4;
    v30 = (void *)v66[2];
    sub_1000076AC(&qword_100079BE0, &qword_100079BD8);
    v31 = v58;
    View.inlineFeedback(controller:completion:)(v29, v28, v30, 0, 0, v55, v32);

    swift_release(v28);
    swift_release(v29);
    sub_10000ED40((uint64_t)v9, &qword_100079BD8);
    v33 = v25;
    v34 = v57;
    sub_10000EB60(v33, v57);
    v35 = *(unsigned __int8 *)(v56 + 80);
    v36 = (v35 + 16) & ~v35;
    v37 = swift_allocObject(&unk_10006A270, v36 + v7, v35 | 7);
    v38 = sub_10000EBA8(v34, v37 + v36);
    v39 = v63;
    static TaskPriority.userInitiated.getter(v38);
    v40 = v50;
    v41 = &v15[*(int *)(v50 + 36)];
    v42 = type metadata accessor for _TaskModifier(0);
    v44 = v51;
    v43 = v52;
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(&v41[*(int *)(v42 + 20)], v39, v52);
    *(_QWORD *)v41 = &unk_100079C18;
    *((_QWORD *)v41 + 1) = v37;
    v46 = v60;
    v45 = v61;
    (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v15, v31, v61);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v39, v43);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v31, v45);
    v47 = v62;
    sub_10000EC98((uint64_t)v15, v62, &qword_100079BD0);
    sub_10000ECC4(v47, (uint64_t)v19, &qword_100079BD0);
    swift_storeEnumTagMultiPayload(v19, v54, 1);
    v48 = sub_10000EA94();
    _ConditionalContent<>.init(storage:)(v53, v19, &type metadata for Text, v40, &protocol witness table for Text, v48);
    sub_10000ED40(v47, &qword_100079BD0);
  }
  else
  {
    *(_QWORD *)v19 = 0xD000000000000040;
    *((_QWORD *)v19 + 1) = 0x8000000100050980;
    v19[16] = 0;
    *((_QWORD *)v19 + 3) = &_swiftEmptyArrayStorage;
    swift_storeEnumTagMultiPayload(v19, v17, 0);
    v49 = sub_10000EA94();
    _ConditionalContent<>.init(storage:)(a2, v19, &type metadata for Text, v12, &protocol witness table for Text, v49);
  }
}

double sub_10000D8BC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  double v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  Swift::String v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  int v38;
  Swift::String v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  int *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double result;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  void *v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  char v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned __int8 v62;

  v4 = sub_1000076E0(&qword_100079C20);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v49 - v9;
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v49 - v12;
  *(_QWORD *)v10 = static VerticalAlignment.center.getter(v11);
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  v14 = sub_1000076E0(&qword_100079C28);
  sub_10000DD4C(&v10[*(int *)(v14 + 44)]);
  v52 = v13;
  sub_10000EC98((uint64_t)v10, (uint64_t)v13, &qword_100079C20);
  v15 = *(_QWORD *)(a1 + 8);
  v16 = *(_QWORD *)(a1 + 16);
  v58 = v15;
  v59 = v16;
  v17 = sub_1000076E0(&qword_100079C08);
  v18 = State.wrappedValue.getter(&v53, v17);
  v19 = v53;
  v20 = (void *)dispatch thunk of FBKEvaluationController.evaluation.getter(v18);
  v22 = v21;
  v23 = -1;
  LODWORD(v13) = ~v21;

  if ((_DWORD)v13)
  {
    if ((v22 & 1) == 0)
    {
      v58 = 0;
      v59 = 0xE000000000000000;
      _StringGuts.grow(_:)(19);
      *(_QWORD *)&v24 = swift_bridgeObjectRelease(v59).n128_u64[0];
      v58 = 0xD000000000000011;
      v59 = 0x80000001000509F0;
      v25 = objc_msgSend(v20, "description", v24);
      v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
      v28 = v27;

      v29._countAndFlagsBits = v26;
      v29._object = v28;
      String.append(_:)(v29);
      swift_bridgeObjectRelease(v28);
      v30 = v59;
      v53 = (void *)v58;
      v54 = v59;
      v55 = 0;
      v56 = &_swiftEmptyArrayStorage;
      v57 = 0;
      swift_bridgeObjectRetain_n(v59, 2);
      _ConditionalContent<>.init(storage:)(&v58, &v53, &type metadata for Text, &type metadata for Text, &protocol witness table for Text, &protocol witness table for Text);
      sub_10000EDB8(v20, v22);
      swift_bridgeObjectRelease_n(v30, 2);
      v31 = v60;
      v50 = v59;
      v51 = v58;
      v32 = v61;
      v23 = v62;
      goto LABEL_10;
    }
    sub_10000EDB8(v20, v22);
  }
  v58 = v15;
  v59 = v16;
  v33 = State.wrappedValue.getter(&v53, v17);
  v34 = v53;
  v35 = (void *)dispatch thunk of FBKEvaluationController.evaluation.getter(v33);
  v37 = v36;
  v38 = ~v36;

  if (v38)
  {
    if ((v37 & 1) != 0)
    {
      v58 = 0;
      v59 = 0xE000000000000000;
      v39._countAndFlagsBits = 0x203A726F727245;
      v39._object = (void *)0xE700000000000000;
      String.append(_:)(v39);
      v53 = v35;
      v40 = sub_1000076E0((uint64_t *)&unk_100079A58);
      _print_unlocked<A, B>(_:_:)(&v53, &v58, v40, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
      v41 = v59;
      v53 = (void *)v58;
      v54 = v59;
      v55 = 0;
      v56 = &_swiftEmptyArrayStorage;
      v57 = 1;
      swift_bridgeObjectRetain_n(v59, 2);
      _ConditionalContent<>.init(storage:)(&v58, &v53, &type metadata for Text, &type metadata for Text, &protocol witness table for Text, &protocol witness table for Text);
      sub_10000EDB8(v35, v37);
      swift_bridgeObjectRelease_n(v41, 2);
      v31 = v60;
      v50 = v59;
      v51 = v58;
      v32 = v61;
      v23 = v62;
      goto LABEL_10;
    }
    sub_10000EDB8(v35, v37);
  }
  v50 = 0;
  v51 = 0;
  v31 = 0;
  v32 = 0;
LABEL_10:
  v42 = (uint64_t)v52;
  sub_10000ECC4((uint64_t)v52, (uint64_t)v7, &qword_100079C20);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  *(_QWORD *)(a2 + 16) = 0xD000000000000019;
  *(_QWORD *)(a2 + 24) = 0x80000001000509D0;
  *(_BYTE *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = &_swiftEmptyArrayStorage;
  v43 = (int *)sub_1000076E0(&qword_100079C30);
  sub_10000ECC4((uint64_t)v7, a2 + v43[16], &qword_100079C20);
  v44 = a2 + v43[20];
  *(_QWORD *)v44 = 0;
  *(_BYTE *)(v44 + 8) = 1;
  v45 = a2 + v43[24];
  v47 = v50;
  v46 = v51;
  *(_QWORD *)v45 = v51;
  *(_QWORD *)(v45 + 8) = v47;
  *(_QWORD *)(v45 + 16) = v31;
  *(_QWORD *)(v45 + 24) = v32;
  *(_BYTE *)(v45 + 32) = v23;
  sub_10000ECF0(0xD000000000000019, 0x80000001000509D0, 0);
  swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
  sub_10000ED00(v46, v47, v31, v32, v23);
  sub_10000ED40(v42, &qword_100079C20);
  sub_10000ED68(v46, v47, v31, v32, v23);
  sub_10000ED40((uint64_t)v7, &qword_100079C20);
  sub_10000EDA8(0xD000000000000019, 0x80000001000509D0, 0);
  *(_QWORD *)&result = swift_bridgeObjectRelease(&_swiftEmptyArrayStorage).n128_u64[0];
  return result;
}

uint64_t sub_10000DD4C@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  char *v27;
  char *v28;

  v28 = a1;
  v1 = sub_1000076E0(&qword_100079C38);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v3);
  v8 = (char *)&v27 - v7;
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v27 - v10;
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v27 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v27 - v16;
  __chkstk_darwin(v15);
  v19 = (char *)&v27 - v18;
  sub_10000DF98((uint64_t)&unk_10006A310, (uint64_t)sub_10000EF24, (uint64_t)sub_10000EF30, (uint64_t)&v27 - v18);
  sub_10000DF98((uint64_t)&unk_10006A2E8, (uint64_t)sub_10000EE1C, (uint64_t)sub_10000EE64, (uint64_t)v17);
  sub_10000DF98((uint64_t)&unk_10006A2C0, (uint64_t)sub_10000EDD4, (uint64_t)sub_10000EDE0, (uint64_t)v14);
  v20 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v21 = v11;
  v27 = v11;
  v20(v11, v19, v1);
  v20(v8, v17, v1);
  v22 = v5;
  v20(v5, v14, v1);
  v23 = v28;
  v20(v28, v21, v1);
  v24 = sub_1000076E0(&qword_100079C40);
  v20(&v23[*(int *)(v24 + 48)], v8, v1);
  v20(&v23[*(int *)(v24 + 64)], v22, v1);
  v25 = *(void (**)(char *, uint64_t))(v2 + 8);
  v25(v14, v1);
  v25(v17, v1);
  v25(v19, v1);
  v25(v22, v1);
  v25(v8, v1);
  return ((uint64_t (*)(char *, uint64_t))v25)(v27, v1);
}

void sub_10000DF98(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[16];
  uint64_t v34;

  v29 = a2;
  v30 = a3;
  v6 = v4;
  v32 = a4;
  v7 = type metadata accessor for IconOnlyLabelStyle(0);
  v31 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_100007E34();
  v10 = v9 - v8;
  v11 = sub_10000EFC4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  __chkstk_darwin(v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000076E0(&qword_100079C48);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  sub_100007E34();
  v19 = v18 - v17;
  sub_10000EB60(v6, (uint64_t)v14);
  v20 = *(unsigned __int8 *)(v12 + 80);
  v21 = (v20 + 16) & ~v20;
  v22 = swift_allocObject(a1, v21 + v13, v20 | 7);
  sub_10000EBA8((uint64_t)v14, v22 + v21);
  v34 = v6;
  v23 = sub_1000076E0(&qword_100079C50);
  sub_1000076AC(&qword_100079C58, &qword_100079C50);
  v25 = Button.init(action:label:)(v29, v22, v30, v33, v23, v24);
  IconOnlyLabelStyle.init()(v25);
  sub_1000076AC(&qword_100079C60, &qword_100079C48);
  v27 = v26;
  sub_10000772C(&qword_100079C68, (uint64_t (*)(uint64_t))&type metadata accessor for IconOnlyLabelStyle);
  View.labelStyle<A>(_:)(v10, v15, v7, v27, v28);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v10, v7);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v19, v15);
  sub_10000EFAC();
}

uint64_t sub_10000E178(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1[5] = a1;
  v2 = *(_QWORD *)(type metadata accessor for PhotosGenerativeStoryGMCentralizedFeedbackAlert(0) - 8);
  v1[6] = v2;
  v3 = *(_QWORD *)(v2 + 64);
  v1[7] = v3;
  v1[8] = swift_task_alloc((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for FBKSEvaluation.Subject(0);
  v1[9] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v1[10] = v5;
  v1[11] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MainActor(0);
  v1[12] = static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6);
  return swift_task_switch(sub_10000E234, v7, v8);
}

uint64_t sub_10000E234()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD **)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v6 = *(_QWORD *)(v0 + 40);
  v7 = *(_QWORD *)(v0 + 48);
  swift_release(*(_QWORD *)(v0 + 96));
  v8 = *(_QWORD *)(v6 + 16);
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v6 + 8);
  *(_QWORD *)(v0 + 24) = v8;
  v9 = sub_1000076E0(&qword_100079C08);
  State.wrappedValue.getter((_QWORD *)(v0 + 32), v9);
  v10 = *(void **)(v0 + 32);
  sub_10000D264(v1);
  sub_10000EB60(v6, v4);
  v11 = *(unsigned __int8 *)(v7 + 80);
  v12 = (v11 + 16) & ~v11;
  v13 = swift_allocObject(&unk_10006A298, v12 + v5, v11 | 7);
  sub_10000EBA8(v4, v13 + v12);
  dispatch thunk of FBKEvaluationController.checkForExistingEvaluation(subject:completion:)(v1, sub_10000EC44, v13);
  swift_release(v13);

  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E340(void *a1, char a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v38 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v38 - v14;
  if ((a2 & 1) != 0)
  {
    v24 = type metadata accessor for PhotosGenerativeStoryGMCentralizedFeedbackAlert(0);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a3 + *(int *)(v24 + 24), v6);
    sub_10000EC80(a1, 1);
    swift_errorRetain(a1);
    v25 = swift_errorRetain(a1);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(12, -1);
      v29 = (uint64_t *)swift_slowAlloc(8, -1);
      v40 = v6;
      *(_DWORD *)v28 = 138412290;
      swift_errorRetain(a1);
      v30 = _swift_stdlib_bridgeErrorToNSError(a1);
      v41 = v30;
      v6 = v40;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v28 + 4, v28 + 12);
      *v29 = v30;
      sub_10000EC8C(a1, 1);
      sub_10000EC8C(a1, 1);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Failed to fetch existing response: %@", v28, 0xCu);
      v31 = sub_1000076E0(&qword_100079AC8);
      swift_arrayDestroy(v29, 1, v31);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v28, -1, -1);

      sub_10000EC8C(a1, 1);
    }
    else
    {
      sub_10000EC8C(a1, 1);
      sub_10000EC8C(a1, 1);
      swift_errorRelease(a1);

    }
    v13 = v10;
  }
  else if (a1)
  {
    v16 = type metadata accessor for PhotosGenerativeStoryGMCentralizedFeedbackAlert(0);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v13, a3 + *(int *)(v16 + 24), v6);
    sub_10000EC80(a1, 0);
    sub_10000EC80(a1, 0);
    v17 = a1;
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v40 = v7;
      v20 = (uint8_t *)swift_slowAlloc(12, -1);
      v39 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v20 = 138412290;
      v41 = (uint64_t)v17;
      v21 = v17;
      v7 = v40;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v20 + 4, v20 + 12);
      v22 = v39;
      *v39 = a1;
      sub_10000EC8C(a1, 0);
      sub_10000EC8C(a1, 0);
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Found existing response %@", v20, 0xCu);
      v23 = sub_1000076E0(&qword_100079AC8);
      swift_arrayDestroy(v22, 1, v23);
      swift_slowDealloc(v22, -1, -1);
      swift_slowDealloc(v20, -1, -1);

      sub_10000EC8C(a1, 0);
      sub_10000EC8C(a1, 0);
    }
    else
    {
      sub_10000EC8C(a1, 0);
      sub_10000EC8C(a1, 0);

    }
  }
  else
  {
    v32 = type metadata accessor for PhotosGenerativeStoryGMCentralizedFeedbackAlert(0);
    v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v15, a3 + *(int *)(v32 + 24), v6);
    v34 = Logger.logObject.getter(v33);
    v35 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v34, (os_log_type_t)v35))
    {
      v36 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, (os_log_type_t)v35, "No existing response", v36, 2u);
      swift_slowDealloc(v36, -1, -1);

      sub_10000EC8C(0, 0);
    }
    else
    {

    }
    v13 = v15;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

void sub_10000E7D8(uint64_t a1, uint64_t a2, void (*a3)(_QWORD *, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = type metadata accessor for FBKSEvaluation.Subject(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_100007E34();
  v9 = (_QWORD *)(v8 - v7);
  v10 = sub_1000076E0(&qword_100079C08);
  State.wrappedValue.getter(&v12, v10);
  v11 = v12;
  sub_10000D264(v9);
  a3(v9, a2);

  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v9, v5);
  sub_10000F008();
}

void sub_10000E884(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v7 = type metadata accessor for FBKSEvaluation.Action(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_100007E34();
  v11 = v10 - v9;
  v12 = LocalizedStringKey.init(stringLiteral:)(a2, a3);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = sub_1000076E0(&qword_100079C08);
  State.wrappedValue.getter(&v24, v19);
  v20 = v24;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v11, *a4, v7);
  v21 = dispatch thunk of FBKEvaluationController.systemImageName(action:)(v11);
  v23 = v22;

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  Label<>.init(_:systemImage:)(v12, v14, v16 & 1, v18, v21, v23);
  sub_10000EFAC();
}

id sub_10000E98C()
{
  id *v0;

  return *v0;
}

void sub_10000E994(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*sub_10000E9BC())()
{
  return nullsub_9;
}

uint64_t sub_10000E9D8()
{
  return static View._viewListCount(inputs:)();
}

void sub_10000E9F4()
{
  sub_10000772C(&qword_100079BB0, type metadata accessor for PhotosGenerativeStoryGMCentralizedFeedbackAlert);
}

void sub_10000EA20(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_10000D410(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_10000EA28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100079BC0;
  if (!qword_100079BC0)
  {
    v1 = sub_10000763C(&qword_100079BB8);
    sub_10000EA94();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100079BC0);
  }
  return result;
}

unint64_t sub_10000EA94()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_100079BC8;
  if (!qword_100079BC8)
  {
    v1 = sub_10000763C(&qword_100079BD0);
    v2 = sub_10000763C(&qword_100079BD8);
    sub_1000076AC(&qword_100079BE0, &qword_100079BD8);
    v4[0] = v2;
    v4[1] = v3;
    swift_getOpaqueTypeConformance2(v4, &opaque type descriptor for <<opaque return type of View.inlineFeedback(controller:completion:)>>, 1);
    sub_10000772C(&qword_100079BE8, (uint64_t (*)(uint64_t))&type metadata accessor for _TaskModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100079BC8);
  }
  return result;
}

uint64_t sub_10000EB60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PhotosGenerativeStoryGMCentralizedFeedbackAlert(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000EBA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PhotosGenerativeStoryGMCentralizedFeedbackAlert(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000EBEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  sub_10000EFC4();
  sub_10000EF98();
  v3 = v0 + v2;
  v4 = (_QWORD *)swift_task_alloc(dword_100079C14);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_100007414;
  return sub_10000E178(v3);
}

uint64_t sub_10000EC44(void *a1, char a2)
{
  uint64_t v2;
  char v4;
  uint64_t v5;

  v4 = a2 & 1;
  sub_10000EFC4();
  sub_10000EF98();
  return sub_10000E340(a1, v4, v2 + v5);
}

id sub_10000EC80(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    return (id)swift_errorRetain(a1);
  else
    return a1;
}

void sub_10000EC8C(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    swift_errorRelease(a1);
  else

}

void sub_10000EC98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_10000EFE8(a1, a2, a3);
  sub_10000F024(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_100007E50();
}

void sub_10000ECC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_10000EFE8(a1, a2, a3);
  sub_10000F024(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_100007E50();
}

uint64_t sub_10000ECF0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_10000ED00(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 255)
    return sub_10000ED18(a1, a2, a3, a4);
  return a1;
}

uint64_t sub_10000ED18(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_10000ECF0(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain(a4);
}

void sub_10000ED40(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = sub_1000076E0(a2);
  sub_10000EFD4(v2);
  sub_100007E50();
}

double sub_10000ED68(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unsigned __int8 a5)
{
  double result;

  if (a5 != 255)
    return sub_10000ED80(a1, a2, a3, a4);
  return result;
}

double sub_10000ED80(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  double result;

  sub_10000EDA8(a1, a2, a3 & 1);
  *(_QWORD *)&result = swift_bridgeObjectRelease(a4).n128_u64[0];
  return result;
}

uint64_t sub_10000EDA8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

void sub_10000EDB8(void *a1, unsigned __int8 a2)
{
  if (a2 != 255)
    sub_10000EC8C(a1, a2 & 1);
}

void sub_10000EDD4(uint64_t a1)
{
  sub_10000EFCC(a1, (void (*)(_QWORD *, uint64_t))&dispatch thunk of FBKEvaluationController.userDidReportAConcern(subject:showFeedbackForm:));
}

void sub_10000EDE0()
{
  uint64_t v0;

  sub_10000E884(*(_QWORD *)(v0 + 16), 0xD000000000000010, 0x8000000100050A10, (unsigned int *)&enum case for FBKSEvaluation.Action.reportConcern(_:));
}

void sub_10000EE1C()
{
  sub_10000EE2C(0, (void (*)(_QWORD *, uint64_t))&dispatch thunk of FBKEvaluationController.userDidLike(subject:showFeedbackForm:));
}

void sub_10000EE2C(uint64_t a1, void (*a2)(_QWORD *, uint64_t))
{
  uint64_t v2;
  uint64_t v5;

  sub_10000EFC4();
  sub_10000EF98();
  sub_10000E7D8(v2 + v5, a1, a2);
  sub_10000F018();
}

void sub_10000EE64()
{
  uint64_t v0;

  sub_10000E884(*(_QWORD *)(v0 + 16), 0x552073626D756854, 0xE900000000000070, (unsigned int *)&enum case for FBKSEvaluation.Action.thumbsUp(_:));
}

uint64_t sub_10000EEA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(sub_10000EFC4() - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 16) & ~v2;
  v4 = v3 + *(_QWORD *)(v1 + 64);
  v5 = v2 | 7;
  v6 = v0 + v3;

  swift_release(*(_QWORD *)(v6 + 16));
  v7 = sub_10000CC24();
  sub_10000EFD4(v7);
  return swift_deallocObject(v0, v4, v5);
}

void sub_10000EF24(uint64_t a1)
{
  sub_10000EFCC(a1, (void (*)(_QWORD *, uint64_t))&dispatch thunk of FBKEvaluationController.userDidDislike(subject:showFeedbackForm:));
}

void sub_10000EF30()
{
  uint64_t v0;

  sub_10000E884(*(_QWORD *)(v0 + 16), 0x442073626D756854, 0xEB000000006E776FLL, (unsigned int *)&enum case for FBKSEvaluation.Action.thumbsDown(_:));
}

void sub_10000EF6C()
{
  sub_1000076AC(&qword_100079C70, &qword_100079C78);
}

uint64_t sub_10000EFC4()
{
  return type metadata accessor for PhotosGenerativeStoryGMCentralizedFeedbackAlert(0);
}

void sub_10000EFCC(uint64_t a1, void (*a2)(_QWORD *, uint64_t))
{
  sub_10000EE2C(1, a2);
}

uint64_t sub_10000EFD4(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t sub_10000EFE8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000076E0(a3);
}

uint64_t sub_10000EFF8(uint64_t a1)
{
  uint64_t v1;

  return sub_100007720(a1, 1, 1, v1);
}

uint64_t sub_10000F024@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void sub_10000F030()
{
  qword_100079C80 = 0x404A800000000000;
}

id sub_10000F044()
{
  uint64_t v0;
  id *v1;
  _BYTE v3[24];

  v1 = (id *)(v0 + OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_generativeMemory);
  sub_100011250(v0 + OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_generativeMemory, (uint64_t)v3, 0);
  return *v1;
}

void sub_10000F084(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  char v5[24];

  v3 = (void **)(v1 + OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_generativeMemory);
  sub_100011250((uint64_t)v3, (uint64_t)v5, 1);
  v4 = *v3;
  *v3 = a1;

}

void sub_10000F0D0(char a1)
{
  void *v1;
  float v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  uint64_t v9;

  if (*((_BYTE *)v1 + OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_isShown) != (a1 & 1))
  {
    if ((a1 & 1) != 0)
      v2 = 1.0;
    else
      v2 = 0.0;
    v3 = (void *)objc_opt_self(UIView);
    v4 = swift_allocObject(&unk_10006A410, 28, 7);
    *(_QWORD *)(v4 + 16) = v1;
    *(float *)(v4 + 24) = v2;
    v8[4] = sub_100010F08;
    v9 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_10000F278;
    v8[3] = &unk_10006A428;
    v5 = _Block_copy(v8);
    v6 = v9;
    v7 = v1;
    swift_release(v6);
    objc_msgSend(v3, "animateWithDuration:animations:", v5, 0.2);
    _Block_release(v5);
  }
}

id sub_10000F1CC(char *a1, float a2)
{
  id v4;
  double v5;
  void *v6;
  id v7;
  double v8;

  v4 = objc_msgSend(*(id *)&a1[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_toastView], "layer");
  *(float *)&v5 = a2;
  objc_msgSend(v4, "setOpacity:", v5);

  v6 = *(void **)&a1[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_showEvaluationButton];
  if (v6)
  {
    v7 = objc_msgSend(v6, "layer");
    *(float *)&v8 = vabds_f32(1.0, a2);
    objc_msgSend(v7, "setOpacity:", v8);

  }
  return objc_msgSend(a1, "layoutIfNeeded");
}

uint64_t sub_10000F278(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

char *sub_10000F2A4(void *a1, void *a2)
{
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v6;
  id v7;
  char *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  char *v18;
  unint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  Class isa;
  id v36;
  id v37;
  unint64_t inited;
  id v39;
  id v40;
  void *v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  id v61;
  id v62;
  id v63;
  char *v64;
  id v65;
  id v66;
  id v67;
  double v68;
  uint64_t v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  void *v85;
  char *v86;
  id v87;
  id v88;
  Class super_class;
  uint64_t v90;
  id v91;
  id v92;
  void *v93;
  uint64_t v94;
  char *v95;
  _QWORD v96[4];
  char v97[56];
  char v98[48];
  objc_super v99;

  v3 = v2;
  v6 = OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_showEvaluationButton;
  *(_QWORD *)&v2[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_showEvaluationButton] = 0;
  v2[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_isShown] = 0;
  v2[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_hasAnswered] = 0;
  v7 = objc_allocWithZone((Class)type metadata accessor for GenerativeStoryFeedbackActionPerformer());
  v8 = v2;
  v9 = a2;
  v10 = sub_1000097D4(v9);
  if (!v10)
  {

    v78 = *(void **)&v2[v6];
    v79 = type metadata accessor for GenerativeStoryToastFeedbackBannerView();
    swift_deallocPartialClassInstance(v8, v79, 48, 7);
    return 0;
  }
  v11 = v10;
  *(_QWORD *)&v8[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_actionPerformer] = v10;
  *(_QWORD *)&v8[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_generativeMemory] = a1;
  v12 = objc_allocWithZone((Class)UIView);
  v91 = v11;
  v92 = a1;
  v13 = objc_msgSend(v12, "init");
  *(_QWORD *)&v8[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_toastView] = v13;
  v14 = *(void **)&v3[v6];
  *(_QWORD *)&v3[v6] = 0;

  v99.receiver = v8;
  v99.super_class = (Class)type metadata accessor for GenerativeStoryToastFeedbackBannerView();
  super_class = v99.super_class;
  v15 = (char *)objc_msgSendSuper2(&v99, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v16 = OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_toastView;
  v17 = *(void **)&v15[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_toastView];
  v18 = v15;
  sub_100011128(v17, "setTranslatesAutoresizingMaskIntoConstraints:");
  sub_10001121C(v18, "addSubview:");
  v19 = (unint64_t)objc_msgSend(v17, "heightAnchor");
  if (qword_100079848 != -1)
    goto LABEL_25;
  while (1)
  {
    v20 = objc_msgSend((id)v19, "constraintEqualToConstant:", *(double *)&qword_100079C80);

    v21 = objc_msgSend(*(id *)&v15[v16], "centerXAnchor");
    v22 = sub_100011230((uint64_t)v21, "centerXAnchor");
    v23 = objc_msgSend(v21, "constraintEqualToAnchor:", v22);

    v24 = objc_msgSend(*(id *)&v15[v16], "topAnchor");
    v95 = v18;
    v25 = sub_100011230((uint64_t)v24, "topAnchor");
    v26 = objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 8.0);
    sub_1000111BC();

    v27 = *(void **)&v15[v16];
    v28 = (void *)objc_opt_self(UIColor);
    v29 = v27;
    v30 = objc_msgSend(v28, "systemBackgroundColor");
    sub_10001121C(v29, "setBackgroundColor:");

    v31 = objc_msgSend(*(id *)&v15[v16], "layer");
    objc_msgSend(v31, "setCornerRadius:", *(double *)&qword_100079C80 * 0.5);

    v32 = (void *)objc_opt_self(NSLayoutConstraint);
    v33 = sub_1000076E0(&qword_100079D00);
    v34 = sub_100011130(v33, 56);
    *(_OWORD *)(v34 + 16) = xmmword_1000564B0;
    *(_QWORD *)(v34 + 32) = v20;
    *(_QWORD *)(v34 + 40) = v23;
    *(_QWORD *)(v34 + 48) = v18;
    v96[0] = v34;
    sub_100011140();
    sub_10000C944(0, &qword_100079D10, NSLayoutConstraint_ptr);
    v88 = v20;
    v87 = v23;
    v86 = v18;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v96[0]);
    sub_10001121C(v32, "activateConstraints:");

    v36 = objc_msgSend(objc_allocWithZone((Class)UIStackView), "init");
    v90 = v16;
    objc_msgSend(*(id *)&v15[v16], "addSubview:", v36);
    sub_100011128(v36, "setTranslatesAutoresizingMaskIntoConstraints:");
    objc_msgSend(v36, "setAxis:", 0);
    objc_msgSend(v36, "setSpacing:", 16.0);
    v37 = objc_msgSend(objc_allocWithZone((Class)UIStackView), "init");
    sub_100011128(v37, "setTranslatesAutoresizingMaskIntoConstraints:");
    objc_msgSend(v37, "setAxis:", 1);
    objc_msgSend(v37, "setSpacing:", 2.0);
    objc_msgSend(v37, "setAlignment:", 3);
    v94 = v33;
    inited = swift_initStackObject(v33, v98);
    *(_OWORD *)(inited + 16) = xmmword_1000564C0;
    *(_QWORD *)(inited + 32) = sub_10000FEC0();
    *(_QWORD *)(inited + 40) = sub_10000FEE0();
    v96[0] = inited;
    sub_100011140();
    v19 = inited;
    v93 = v9;
    if (inited >> 62)
    {
      if (v96[0] < 0)
        v81 = v96[0];
      else
        v81 = v96[0] & 0xFFFFFFFFFFFFFF8;
      v82 = v37;
      sub_1000111C4();
      v18 = (char *)_CocoaArrayWrapper.endIndex.getter(v81);
    }
    else
    {
      v18 = *(char **)((inited & 0xFFFFFFFFFFFFF8) + 0x10);
      v39 = v37;
      sub_1000111C4();
    }
    if (v18)
    {
      v9 = (id)(v19 & 0xC000000000000001);
      v16 = 4;
      while (1)
      {
        v40 = v9 ? (id)sub_100011258() : *(id *)(v19 + 8 * v16);
        v41 = v40;
        v42 = (char *)(v16 - 3);
        if (__OFADD__(v16 - 4, 1))
          break;
        objc_msgSend(v37, "addArrangedSubview:", v40);

        ++v16;
        if (v42 == v18)
          goto LABEL_12;
      }
      __break(1u);
      goto LABEL_24;
    }
LABEL_12:

    sub_100011244();
    v43 = swift_initStackObject(v94, v97);
    *(_OWORD *)(v43 + 16) = xmmword_1000564B0;
    sub_100010108();
    *(_QWORD *)(v43 + 32) = v44;
    *(_QWORD *)(v43 + 40) = v37;
    v45 = v37;
    sub_10000FFE8();
    *(_QWORD *)(v43 + 48) = v46;
    v96[0] = v43;
    sub_100011140();
    v19 = v43;
    if (!(v43 >> 62))
    {
      v47 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
      v48 = v36;
      sub_1000111C4();
      if (!v47)
        break;
      goto LABEL_14;
    }
    v83 = v96[0] < 0 ? v96[0] : v96[0] & 0xFFFFFFFFFFFFFF8;
    v84 = v36;
    sub_1000111C4();
    v47 = _CocoaArrayWrapper.endIndex.getter(v83);
    if (!v47)
      break;
LABEL_14:
    v9 = (id)(v19 & 0xC000000000000001);
    v16 = 4;
    while (1)
    {
      v49 = v9 ? (char *)sub_100011258() : (char *)*(id *)(v19 + 8 * v16);
      v18 = v49;
      v50 = v16 - 3;
      if (__OFADD__(v16 - 4, 1))
        break;
      objc_msgSend(v36, "addArrangedSubview:", v49);

      ++v16;
      if (v50 == v47)
        goto LABEL_20;
    }
LABEL_24:
    __break(1u);
LABEL_25:
    swift_once(&qword_100079848, sub_10000F030);
  }
LABEL_20:

  sub_100011244();
  v85 = v45;
  v51 = sub_100011130(v94, 56);
  *(_OWORD *)(v51 + 16) = xmmword_1000564B0;
  v52 = sub_100011214(v51, "centerXAnchor");
  v53 = objc_msgSend(*(id *)&v15[v90], "centerXAnchor");
  v54 = sub_1000111AC();
  sub_1000111BC();

  *(_QWORD *)(v51 + 32) = v18;
  v56 = sub_100011214(v55, "centerYAnchor");
  v57 = objc_msgSend(*(id *)&v15[v90], "centerYAnchor");
  v58 = sub_1000111AC();
  sub_1000111BC();

  *(_QWORD *)(v51 + 40) = v18;
  v60 = sub_100011214(v59, "leftAnchor");
  v61 = objc_msgSend(*(id *)&v15[v90], "leftAnchor");
  v62 = objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, 12.0);
  sub_1000111BC();

  *(_QWORD *)(v51 + 48) = v18;
  sub_100011140();
  sub_100011184();
  sub_1000111DC();
  sub_1000111A4(v32, "activateConstraints:");

  v96[3] = super_class;
  v96[0] = v95;
  v63 = objc_allocWithZone((Class)UISwipeGestureRecognizer);
  v64 = v95;
  v65 = sub_100010F90(v96, (uint64_t)"_handleSwipe:");
  objc_msgSend(v65, "setDirection:", 4);
  v66 = sub_10000FCC8((uint64_t)objc_msgSend(*(id *)&v15[v90], "addGestureRecognizer:", v65));
  v67 = sub_100011270((uint64_t)objc_msgSend(v64, "addSubview:", v66), "layer");
  LODWORD(v68) = 0;
  objc_msgSend(v67, "setOpacity:", v68);

  v69 = sub_100011130(v94, 48);
  *(_OWORD *)(v69 + 16) = xmmword_1000564C0;
  v70 = sub_100011270(v69, "centerYAnchor");
  v71 = objc_msgSend(*(id *)&v15[v90], "centerYAnchor");
  v72 = objc_msgSend(v70, "constraintEqualToAnchor:", v71);

  *(_QWORD *)(v69 + 32) = v72;
  v74 = sub_100011270(v73, "rightAnchor");
  v75 = sub_100011230((uint64_t)v74, "rightAnchor");
  v76 = objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, -16.0);

  *(_QWORD *)(v69 + 40) = v76;
  v96[0] = v69;
  sub_100011140();
  sub_100011184();
  sub_1000111DC();
  sub_1000111A4(v32, "activateConstraints:");

  v77 = *(void **)&v64[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_showEvaluationButton];
  *(_QWORD *)&v64[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_showEvaluationButton] = v66;

  return v64;
}

void sub_10000FC4C(void *a1)
{
  uint64_t v1;

  if (objc_msgSend(a1, "state") == (id)3)
  {
    sub_10000F0D0(0);
    *(_BYTE *)(v1 + OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_isShown) = 0;
  }
}

id sub_10000FCC8(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  sub_1000111E8(a1, &qword_100079D08, PXCuratedLibraryOverlayButtonConfiguration_ptr);
  v1 = sub_10000FE54(0xD000000000000016, 0x8000000100050BF0, objc_msgSend(objc_allocWithZone((Class)PXCuratedLibrarySectionHeaderLayoutSpec), "init"));
  v2 = (void *)objc_opt_self(UIColor);
  v3 = objc_msgSend(v2, "whiteColor");
  sub_100011238((uint64_t)v3, "setTintColor:");

  objc_msgSend(v1, "setStyle:", 0);
  v4 = objc_msgSend(v2, "tertiarySystemFillColor");
  sub_100011238((uint64_t)v4, "setBackgroundColor:");

  v5 = objc_msgSend(objc_allocWithZone((Class)PXCuratedLibraryOverlayButton), "init");
  sub_1000111A4(v5, "setUserData:");
  sub_100011128(v5, "setTranslatesAutoresizingMaskIntoConstraints:");
  v6 = v5;
  v7 = objc_msgSend(v2, "whiteColor");
  objc_msgSend(v6, "setTintColor:", v7);

  sub_100011224(v6, "addTarget:action:forControlEvents:", v8, (uint64_t)"handleShowEvaluationWithSender:");
  return v6;
}

id sub_10000FE54(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  NSString v6;
  id v7;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(v3), "configurationWithSystemImageName:spec:", v6, a3);

  return v7;
}

id sub_10000FEC0()
{
  return sub_100011138(33, 0x8000000100050BC0, (double *)&UIFontWeightSemibold);
}

id sub_10000FEE0()
{
  return sub_100011138(35, 0x8000000100050B90, (double *)&UIFontWeightRegular);
}

id sub_10000FF00(uint64_t a1, uint64_t a2, double *a3)
{
  id v4;
  NSString v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  sub_100011128(v4, "setTranslatesAutoresizingMaskIntoConstraints:");
  v5 = String._bridgeToObjectiveC()();
  v6 = (id)PXMemoryCreationLocalizedString();

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v9 = v8;

  sub_10001107C(v7, v9, v4);
  v10 = objc_msgSend((id)objc_opt_self(UIFont), "systemFontOfSize:weight:", 12.0, *a3);
  sub_1000111A4(v4, "setFont:");

  return v4;
}

void sub_10000FFE8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;

  v1 = sub_1000110F4();
  __chkstk_darwin(v1);
  sub_10001115C();
  v2 = objc_msgSend((id)objc_opt_self(UIButton), "buttonWithType:", 0);
  sub_1000111CC();
  v3 = GenerativeStoryFeedbackActionPerformer.actionIcon(type:hasResponse:)(v0, 0);
  sub_100011264();
  objc_msgSend(v2, "setImage:forState:", v3, 0);

  sub_1000111CC();
  v4 = GenerativeStoryFeedbackActionPerformer.actionIcon(type:hasResponse:)(v0, 1);
  sub_100011264();
  sub_100011208(v2, "setImage:forState:");

  sub_100011224(v2, "addTarget:action:forControlEvents:", v5, (uint64_t)"handleThumbsUpWithSender:");
  sub_100011128(v2, "setTranslatesAutoresizingMaskIntoConstraints:");
  sub_10000EFAC();
}

void sub_100010108()
{
  char *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  id v7;
  void *v8;
  void (*v9)(uint64_t, _QWORD, uint64_t);
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSString v13;
  id v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  Swift::String v21;
  Class isa;
  id v23;
  Swift::OpaquePointer v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  id v26;
  void *v27;
  id v28;
  unsigned int v29;
  UIMenuElementSize v30;
  UIImage_optional v31;

  v2 = v0;
  v3 = sub_1000110F4();
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_100007E58();
  sub_1000111E8(v5, &qword_100079CF0, UIAction_ptr);
  v6 = sub_100011148();
  v7 = (id)PXMemoryCreationLocalizedString();

  static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v8 = *(void **)&v2[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_actionPerformer];
  v29 = enum case for GenerativeStoryGMCentralizedFeedbackType.thumbsDown(_:);
  v9 = *(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104);
  sub_1000111FC(v10, enum case for GenerativeStoryGMCentralizedFeedbackType.thumbsDown(_:));
  sub_100011194();
  v25 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
  sub_1000111F0(v25);
  *(_QWORD *)(sub_100011130((uint64_t)&unk_10006A460, 24) + 16) = v2;
  v11 = v2;
  v12 = sub_1000110FC();
  v27 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(v12);
  v13 = sub_100011148();
  v14 = (id)PXMemoryCreationLocalizedString();

  static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  sub_1000111FC(v15, enum case for GenerativeStoryGMCentralizedFeedbackType.reportConcern(_:));
  sub_100011194();
  v25(v1, v3);
  *(_QWORD *)(sub_100011130((uint64_t)&unk_10006A488, 24) + 16) = v11;
  v16 = v11;
  v17 = sub_1000110FC();
  v18 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(v17);
  sub_1000111E8((uint64_t)v18, &qword_100079CF8, UIMenu_ptr);
  v19 = sub_1000076E0(&qword_100079D00);
  v20 = sub_100011130(v19, 48);
  *(_OWORD *)(v20 + 16) = xmmword_1000564C0;
  *(_QWORD *)(v20 + 32) = v27;
  *(_QWORD *)(v20 + 40) = v18;
  v30 = v20;
  specialized Array._endMutation()();
  v28 = v27;
  v26 = v18;
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  v31.value.super.isa = 0;
  v31.is_nil = 0;
  isa = UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(v21, (Swift::String_optional)0, v31, 0, 0xFFFFFFFFFFFFFFFFLL, v30, v24).super.super.isa;
  v23 = objc_msgSend((id)objc_opt_self(UIButton), "buttonWithType:", 0);
  v9(v1, v29, v3);
  GenerativeStoryFeedbackActionPerformer.actionIcon(type:hasResponse:)(v1, 0);
  sub_100011174();
  objc_msgSend(v23, "setImage:forState:", v8, 0);

  v9(v1, v29, v3);
  GenerativeStoryFeedbackActionPerformer.actionIcon(type:hasResponse:)(v1, 1);
  sub_100011174();
  sub_100011208(v23, "setImage:forState:");

  objc_msgSend(v23, "setMenu:", isa);
  objc_msgSend(v23, "setShowsMenuAsPrimaryAction:", 1);
  sub_100011128(v23, "setTranslatesAutoresizingMaskIntoConstraints:");

  sub_10000EFAC();
}

uint64_t sub_100010454(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  double v8;
  uint64_t v10;

  v4 = sub_1000110F4();
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *a3, v4);
  v8 = sub_1000106A4((uint64_t)v7);
  return (*(uint64_t (**)(char *, uint64_t, double))(v5 + 8))(v7, v4, v8);
}

void sub_1000104E8()
{
  _BYTE *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_showEvaluationButton] = 0;
  v0[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_isShown] = 0;
  v0[OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_hasAnswered] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100050CA0, "MobileSlideShow/GenerativeStoryToastFeedbackBannerView.swift", 60, 2, 181, 0);
  __break(1u);
}

uint64_t sub_100010580()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = sub_1000110F4();
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_100007E58();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v0, enum case for GenerativeStoryGMCentralizedFeedbackType.thumbsUp(_:), v1);
  sub_1000106A4(v0);
  return sub_1000111F0(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
}

void sub_100010634()
{
  uint64_t v0;

  sub_10000F0D0(1);
  *(_BYTE *)(v0 + OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_isShown) = 1;
}

double sub_1000106A4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  double result;
  uint64_t v17;

  v4 = sub_1000110F4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  __chkstk_darwin(v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000076E0(&qword_100079A10);
  __chkstk_darwin(v8);
  sub_10001115C();
  v9 = type metadata accessor for TaskPriority(0);
  sub_100007720(v2, 1, 1, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  type metadata accessor for MainActor(0);
  v10 = v1;
  v11 = static MainActor.shared.getter();
  v12 = *(unsigned __int8 *)(v5 + 80);
  v13 = (v12 + 40) & ~v12;
  v14 = (char *)swift_allocObject(&unk_10006A398, v13 + v6, v12 | 7);
  *((_QWORD *)v14 + 2) = v11;
  *((_QWORD *)v14 + 3) = &protocol witness table for MainActor;
  *((_QWORD *)v14 + 4) = v10;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v14[v13], v7, v4);
  v15 = sub_10000A604(v2, (uint64_t)&unk_100079CE8, (uint64_t)v14);
  *(_QWORD *)&result = swift_release(v15).n128_u64[0];
  return result;
}

uint64_t sub_1000107E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5[5] = a4;
  v5[6] = a5;
  v6 = type metadata accessor for GenerativeStoryGMCentralizedFeedbackType(0);
  v5[7] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[8] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[9] = v8;
  v5[10] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MainActor(0);
  v5[11] = static MainActor.shared.getter();
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v9);
  v5[12] = v10;
  v5[13] = v11;
  return swift_task_switch(sub_100010880, v10, v11);
}

uint64_t sub_100010880()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD *v16;

  v2 = v0[9];
  v1 = v0[10];
  v3 = v0[7];
  v4 = v0[8];
  v6 = v0[5];
  v5 = v0[6];
  v7 = (void **)(v6 + OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_generativeMemory);
  sub_100011250(v6 + OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_generativeMemory, (uint64_t)(v0 + 2), 0);
  v8 = *v7;
  v0[14] = *v7;
  v9 = sub_100011130((uint64_t)&unk_10006A3C0, 24);
  v0[15] = v9;
  swift_unknownObjectWeakInit(v9 + 16, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v5, v3);
  v10 = *(unsigned __int8 *)(v4 + 80);
  v11 = (v10 + 16) & ~v10;
  v12 = (v2 + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  v13 = swift_allocObject(&unk_10006A3E8, v12 + 8, v10 | 7);
  v0[16] = v13;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v13 + v11, v1, v3);
  *(_QWORD *)(v13 + v12) = v9;
  v14 = dword_100079A0C;
  v15 = v8;
  swift_retain(v9);
  v16 = (_QWORD *)swift_task_alloc(v14);
  v0[17] = v16;
  *v16 = v0;
  v16[1] = sub_1000109D4;
  return GenerativeStoryFeedbackActionPerformer.reportFeedback(type:memory:completionHandler:)(v0[6], (uint64_t)v15, (uint64_t)sub_100010E98, v13);
}

uint64_t sub_1000109D4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 128);
  v4 = *(void **)(*v0 + 112);
  v3 = *(_QWORD *)(*v0 + 120);
  swift_task_dealloc(*(_QWORD *)(*v0 + 136));

  swift_release(v2);
  swift_release(v3);
  return swift_task_switch(sub_100010A40, *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104));
}

uint64_t sub_100010A40()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_release(*(_QWORD *)(v0 + 88));
  swift_task_dealloc(v1);
  return sub_10000CC3C(*(uint64_t (**)(void))(v0 + 8));
}

void sub_100010A70(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t Strong;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BYTE v17[24];

  v6 = type metadata accessor for GenerativeStoryGMCentralizedFeedbackType(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v10 = a3 + 16;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for GenerativeStoryGMCentralizedFeedbackType.thumbsUp(_:), v6);
  LOBYTE(a2) = static GenerativeStoryGMCentralizedFeedbackType.== infix(_:_:)(a2, v9);
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  if ((a2 & 1) != 0)
  {
    swift_beginAccess(v10, v17, 0, 0);
    Strong = swift_unknownObjectWeakLoadStrong(v10);
    if (!Strong)
      return;
    v12 = (void *)Strong;
    sub_10000FFE8();
  }
  else
  {
    swift_beginAccess(v10, v17, 0, 0);
    v14 = swift_unknownObjectWeakLoadStrong(v10);
    if (!v14)
      return;
    v12 = (void *)v14;
    sub_100010108();
  }
  v15 = v13;

  objc_msgSend(v15, "setSelected:", a1 & 1);
}

void sub_100010B8C()
{
  _swift_stdlib_reportUnimplementedInitializer("MobileSlideShow.GenerativeStoryToastFeedbackBannerView", 54, "init(frame:)", 12, 0);
  __break(1u);
}

id sub_100010BC4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeStoryToastFeedbackBannerView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for GenerativeStoryToastFeedbackBannerView()
{
  return objc_opt_self(_TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView);
}

void *sub_100010C74(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC15MobileSlideShow38GenerativeStoryToastFeedbackBannerView_generativeMemory, a1, 33, 0);
  return &j__swift_endAccess;
}

uint64_t sub_100010CBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_1000110F4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100010D34(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000110F4() - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc(dword_100079CE4);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_100010DC4;
  return sub_1000107E8(a1, v5, v6, v7, v8);
}

uint64_t sub_100010DC4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return sub_10000CC3C(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_100010E04()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010E28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = sub_1000110F4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

void sub_100010E98(char a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_1000110F4() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_100010A70(a1, v1 + v4, *(_QWORD *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_100010EE4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 28, 7);
}

id sub_100010F08()
{
  uint64_t v0;

  return sub_10000F1CC(*(char **)(v0 + 16), *(float *)(v0 + 24));
}

uint64_t sub_100010F14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100010F24(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100010F2C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100010F50(uint64_t a1)
{
  uint64_t v1;

  return sub_100010454(a1, *(_QWORD *)(v1 + 16), (unsigned int *)&enum case for GenerativeStoryGMCentralizedFeedbackType.thumbsDown(_:));
}

uint64_t sub_100010F70(uint64_t a1)
{
  uint64_t v1;

  return sub_100010454(a1, *(_QWORD *)(v1 + 16), (unsigned int *)&enum case for GenerativeStoryGMCentralizedFeedbackType.reportConcern(_:));
}

id sub_100010F90(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v13;

  v4 = a1[3];
  if (v4)
  {
    v6 = sub_1000110CC(a1, a1[3]);
    v7 = *(_QWORD *)(v4 - 8);
    __chkstk_darwin(v6);
    v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    v10 = _bridgeAnythingToObjectiveC<A>(_:)(v9, v4);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v4);
    sub_10000CAA0(a1);
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(v2, "initWithTarget:action:", v10, a2);
  swift_unknownObjectRelease(v10);
  return v11;
}

void sub_10001107C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  objc_msgSend(a3, "setText:", v5);

}

_QWORD *sub_1000110CC(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000110F4()
{
  return type metadata accessor for GenerativeStoryGMCentralizedFeedbackType(0);
}

uint64_t sub_1000110FC()
{
  uint64_t v0;

  return v0;
}

id sub_100011128(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0);
}

uint64_t sub_100011130(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7);
}

id sub_100011138(uint64_t a1, uint64_t a2, double *a3)
{
  return sub_10000FF00(a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a2, a3);
}

uint64_t sub_100011140()
{
  return specialized Array._endMutation()();
}

NSString sub_100011148()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100011174()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

NSArray sub_100011184()
{
  return Array._bridgeToObjectiveC()();
}

id sub_100011194()
{
  uint64_t v0;

  return GenerativeStoryFeedbackActionPerformer.actionIcon(type:hasResponse:)(v0, 0);
}

id sub_1000111A4(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

id sub_1000111AC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, *(SEL *)(v2 + 3344), v1);
}

void sub_1000111BC()
{
  void *v0;

}

uint64_t sub_1000111C4()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_1000111CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v2, v0);
}

uint64_t sub_1000111DC()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000111E8(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  return sub_10000C944(0, a2, a3);
}

uint64_t sub_1000111F0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_1000111FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(v3, a2, v2);
}

id sub_100011208(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2, 4);
}

id sub_100011214(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_10001121C(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

id sub_100011224(id a1, SEL a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return objc_msgSend(a1, a2, v4, a4, 64);
}

id sub_100011230(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_100011238(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_100011244()
{
  uint64_t v0;

  return swift_bridgeObjectRelease_n(v0, 2);
}

uint64_t sub_100011250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0);
}

uint64_t sub_100011258()
{
  uint64_t v0;
  uint64_t v1;

  return specialized _ArrayBuffer._getElementSlowPath(_:)(v0, v1);
}

uint64_t sub_100011264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

id sub_100011270(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_100011278(void *a1, void *a2)
{
  void *v4;
  id v5;
  uint64_t isEscapingClosureAtFileLocation;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_semaphore_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CGFloat ty;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  CGFloat v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  CGAffineTransform v54;
  char v55[24];
  CGAffineTransform aBlock;

  v4 = (void *)objc_opt_self(PHAsset);
  v5 = objc_msgSend(a2, "librarySpecificFetchOptions");
  isEscapingClosureAtFileLocation = (uint64_t)objc_msgSend(v4, "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", a1, 0, v5);

  if (!isEscapingClosureAtFileLocation)
    return 0;
  v7 = objc_msgSend((id)isEscapingClosureAtFileLocation, "firstObject");
  if (!v7)
    goto LABEL_8;
  v8 = v7;
  v9 = PHCollection.title.getter();
  if (!v10)
  {
LABEL_7:

LABEL_8:
    return 0;
  }
  v50 = v9;
  v52 = v10;
  v11 = dispatch_semaphore_create(0);
  v12 = objc_msgSend((id)objc_opt_self(PHImageManager), "defaultManager");
  v13 = objc_msgSend(objc_allocWithZone((Class)PHImageRequestOptions), "init");
  objc_msgSend(v13, "setSynchronous:", 1);
  objc_msgSend(v13, "setResizeMode:", 2);
  objc_msgSend(v13, "setDeliveryMode:", 1);
  v14 = sub_100011130((uint64_t)&unk_10006A4D0, 24);
  *(_QWORD *)(v14 + 16) = 0;
  v15 = sub_100011130((uint64_t)&unk_10006A4F8, 32);
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = v11;
  *(_QWORD *)&aBlock.tx = sub_100012DA8;
  *(_QWORD *)&aBlock.ty = v15;
  *(_QWORD *)&aBlock.a = _NSConcreteStackBlock;
  *(_QWORD *)&aBlock.b = 1107296256;
  *(_QWORD *)&aBlock.c = sub_1000123F4;
  *(_QWORD *)&aBlock.d = &unk_10006A510;
  v16 = _Block_copy(&aBlock);
  ty = aBlock.ty;
  v53 = v14;
  swift_retain(v14);
  v18 = v11;
  swift_release(*(_QWORD *)&ty);
  objc_msgSend(v12, "requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:", v8, 1, v13, v16, 400.0, 500.0);
  _Block_release(v16);
  v51 = v18;
  OS_dispatch_semaphore.wait()();
  swift_beginAccess(v14 + 16, v55, 0, 0);
  v19 = *(void **)(v14 + 16);
  if (!v19)
  {

    swift_bridgeObjectRelease(v52);
    sub_1000130EC(v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v50, v18);

    swift_release(v14);
    return 0;
  }
  CGAffineTransformMakeScale(&aBlock, 1.0, -1.0);
  v49 = v12;
  CGAffineTransformTranslate(&v54, &aBlock, 0.0, -500.0);
  aBlock = v54;
  v20 = objc_allocWithZone((Class)UIGraphicsImageRenderer);
  v21 = v19;
  v22 = objc_msgSend(v20, "initWithSize:", 400.0, 500.0);
  v23 = sub_100011130((uint64_t)&unk_10006A548, 72);
  *(_QWORD *)(v23 + 16) = &aBlock;
  *(_QWORD *)(v23 + 24) = v21;
  *(_OWORD *)(v23 + 32) = xmmword_100056550;
  *(_QWORD *)(v23 + 48) = v50;
  *(_QWORD *)(v23 + 56) = v52;
  *(_QWORD *)(v23 + 64) = a1;
  v24 = sub_100011130((uint64_t)&unk_10006A570, 32);
  *(_QWORD *)(v24 + 16) = sub_100012DFC;
  *(_QWORD *)(v24 + 24) = v23;
  *(_QWORD *)&v54.tx = sub_100012E20;
  *(_QWORD *)&v54.ty = v24;
  *(_QWORD *)&v54.a = _NSConcreteStackBlock;
  *(_QWORD *)&v54.b = 1107296256;
  *(_QWORD *)&v54.c = sub_100012B78;
  *(_QWORD *)&v54.d = &unk_10006A588;
  v25 = _Block_copy(&v54);
  v26 = v54.ty;
  v27 = v21;
  v28 = a1;
  swift_retain(v24);
  v29 = objc_msgSend(v22, "imageWithActions:", v25, swift_release(*(_QWORD *)&v26).n128_f64[0]);

  sub_1000130EC(v30, v31, v32, v33, v34, v35, v36, v37, v47, (uint64_t)v49, v50, v51);
  _Block_release(v25);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v24, "", 120, 102, 36, 1);
  swift_release(v23);
  swift_release(v53);
  swift_release(v24);
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  return v29;
}

uint64_t sub_1000116D0()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_1000077B8(v0, qword_10007AC60);
  sub_1000077A0(v0, (uint64_t)qword_10007AC60);
  return Logger.init(subsystem:category:)(0xD000000000000019, 0x8000000100050DE0, 0xD00000000000001CLL, 0x8000000100056580);
}

uint64_t static PhotosGenerativeStoryFactory.makePhotosGenerativeStoryGMCentralizedFeedbackAlertController(with:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v2 = sub_1000076E0(&qword_100079D18);
  __chkstk_darwin(v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PhotosGenerativeStoryGMCentralizedFeedbackAlert(0);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (uint64_t *)((char *)&v18 - v9);
  v11 = type metadata accessor for FBKSEvaluation.Subject(0);
  sub_100007720((uint64_t)v4, 1, 1, v11);
  v12 = (objc_class *)type metadata accessor for FBKEvaluationController(0);
  objc_allocWithZone(v12);
  v13 = a1;
  v19 = FBKEvaluationController.init(subject:)(v4);
  State.init(wrappedValue:)(v20, &v19, v12);
  v14 = v20[1];
  v10[1] = v20[0];
  v10[2] = v14;
  Logger.init(subsystem:category:)(0xD000000000000020, 0x8000000100050CD0, 0xD00000000000002FLL, 0x8000000100050D00);
  *v10 = v13;
  sub_10000EB60((uint64_t)v10, (uint64_t)v8);
  v15 = objc_allocWithZone((Class)sub_1000076E0(&qword_100079D20));
  v16 = UIHostingController.init(rootView:)(v8);
  sub_1000118F0((uint64_t)v10);
  return v16;
}

uint64_t sub_1000118F0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PhotosGenerativeStoryGMCentralizedFeedbackAlert(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *static PhotosGenerativeStoryFactory.makePhotosGenerativeStoryToastFeedbackBannerView(with:parentViewController:)(void *a1, void *a2)
{
  id v4;

  v4 = objc_allocWithZone((Class)type metadata accessor for GenerativeStoryToastFeedbackBannerView());
  return sub_10000F2A4(a1, a2);
}

id static PhotosGenerativeStoryFactory.makeCentralizedFeedbackActionPerformer(parentViewController:)(void *a1)
{
  id v2;

  v2 = objc_allocWithZone((Class)type metadata accessor for GenerativeStoryFeedbackActionPerformer());
  return sub_1000097D4(a1);
}

uint64_t static PhotosGenerativeStoryFactory.createDonation(memory:prompt:photoLibrary:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6[14] = a5;
  v6[15] = v5;
  v6[12] = a3;
  v6[13] = a4;
  v6[10] = a1;
  v6[11] = a2;
  v7 = type metadata accessor for UUID(0);
  v6[16] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[17] = v8;
  v6[18] = sub_100007E70(v8);
  v9 = type metadata accessor for FBKSInteraction.Content(0);
  v6[19] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v6[20] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v6[21] = swift_task_alloc(v11);
  v6[22] = swift_task_alloc(v11);
  v12 = type metadata accessor for FBKSInteraction.FeatureDomain(0);
  v6[23] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v6[24] = v13;
  v6[25] = sub_100007E70(v13);
  return swift_task_switch(sub_100011B14, 0, 0);
}

uint64_t sub_100011B14()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  UIImage *v9;
  UIImage *v10;
  NSData *v11;
  NSData *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void (*v22)(uint64_t *, _QWORD, uint64_t);
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  _QWORD *v41;
  uint64_t v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  _WORD *v47;
  const char *v48;
  uint64_t v49;
  os_log_type_t v50;
  uint64_t v51;
  os_log_type_t v52;
  _WORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*v61)(_QWORD);

  v1 = type metadata accessor for FeedbackFeatureFlags(0);
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = sub_100012E7C(&qword_100079AB8, (uint64_t (*)(uint64_t))&type metadata accessor for FeedbackFeatureFlags, (uint64_t)&protocol conformance descriptor for FeedbackFeatureFlags);
  v2 = sub_10000CA20((_QWORD *)(v0 + 16));
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v2, enum case for FeedbackFeatureFlags.CentralizedFeedback(_:), v1);
  LOBYTE(v1) = isFeatureEnabled(_:)(v0 + 16);
  sub_10000CAA0((_QWORD *)(v0 + 16));
  if ((v1 & 1) == 0)
  {
    if (qword_100079850 != -1)
      swift_once(&qword_100079850, sub_1000116D0);
    v43 = sub_10000CC24();
    v3 = (void *)sub_1000130D0(v43, (uint64_t)qword_10007AC60);
    v44 = static os_log_type_t.default.getter();
    if (!sub_10000CCA4(v44))
      goto LABEL_19;
    v47 = (_WORD *)sub_10000CBDC(2);
    *v47 = 0;
    v48 = "Skipping feedback donation, feature flag disabled.";
LABEL_13:
    sub_1000130BC((void *)&_mh_execute_header, v45, v46, v48);
    sub_10000CBA0((uint64_t)v47);
    goto LABEL_19;
  }
  v3 = *(void **)(v0 + 112);
  v4 = *(void **)(v0 + 88);
  v5 = objc_msgSend(v4, "localIdentifier");
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v8 = v7;

  *(_QWORD *)(v0 + 208) = v6;
  *(_QWORD *)(v0 + 216) = v8;
  v9 = (UIImage *)sub_100011278(v4, v3);
  *(_QWORD *)(v0 + 224) = v9;
  if (!v9)
  {
    swift_bridgeObjectRelease(v8);
    if (qword_100079850 != -1)
      swift_once(&qword_100079850, sub_1000116D0);
    v49 = sub_10000CC24();
    sub_1000130D0(v49, (uint64_t)qword_10007AC60);
    v50 = sub_1000130E4();
    if (!sub_10000CCA4(v50))
      goto LABEL_19;
    v47 = (_WORD *)sub_10000CBDC(2);
    *v47 = 0;
    v48 = "Skipping feedback donation, couldn't generate image for feedback.";
    goto LABEL_13;
  }
  v10 = v9;
  v11 = UIImageJPEGRepresentation(v9, 0.5);
  if (v11)
  {
    v12 = v11;
    v14 = *(_QWORD *)(v0 + 192);
    v13 = *(_QWORD *)(v0 + 200);
    v15 = *(uint64_t **)(v0 + 176);
    v16 = *(uint64_t **)(v0 + 168);
    v57 = *(_QWORD *)(v0 + 184);
    v58 = *(_QWORD *)(v0 + 160);
    v17 = *(_QWORD *)(v0 + 152);
    v56 = *(_QWORD *)(v0 + 104);
    v60 = v8;
    v18 = *(_QWORD *)(v0 + 96);
    v59 = v6;
    v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v21 = v20;

    *(_QWORD *)(v0 + 232) = v19;
    *(_QWORD *)(v0 + 240) = v21;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v13, enum case for FBKSInteraction.FeatureDomain.memoryCreation(_:), v57);
    *v15 = v18;
    v15[1] = v56;
    v22 = *(void (**)(uint64_t *, _QWORD, uint64_t))(v58 + 104);
    v22(v15, enum case for FBKSInteraction.Content.text(_:), v17);
    *v16 = v19;
    v16[1] = v21;
    v22(v16, enum case for FBKSInteraction.Content.image(_:), v17);
    v23 = objc_allocWithZone((Class)type metadata accessor for FBKSDonation(0));
    swift_bridgeObjectRetain(v56);
    sub_100012CB0(v19, v21);
    v24 = (void *)FBKSDonation.init(featureDomain:bundleID:prefillQuestions:originalContent:generatedContent:modelVersion:diagnostics:auxiliaryMetrics:isHighPriority:)(v13, 0, 0, 0, v15, v16, 0, 0, 0, 0, 0, 0);
    *(_QWORD *)(v0 + 248) = v24;
    v25 = sub_1000076E0(&qword_100079AF0);
    v26 = sub_1000076E0(&qword_100079AF8);
    v27 = *(_QWORD *)(v26 - 8);
    v28 = *(_QWORD *)(v27 + 72);
    v29 = *(unsigned __int8 *)(v27 + 80);
    v30 = (v29 + 32) & ~v29;
    v31 = swift_allocObject(v25, v30 + v28, v29 | 7);
    *(_OWORD *)(v31 + 16) = xmmword_100056210;
    v32 = v31 + v30;
    v33 = *(int *)(v26 + 48);
    FBKSForm.Question.init(stringValue:)(0x617261705F65643ALL, 0xED0000726574656DLL);
    v34 = sub_1000076E0(&qword_100079B00);
    v35 = sub_100011130(v34, 48);
    *(_OWORD *)(v35 + 16) = xmmword_100056210;
    *(_QWORD *)(v35 + 32) = v59;
    *(_QWORD *)(v35 + 40) = v60;
    *(_QWORD *)(v32 + v33) = v35;
    v36 = type metadata accessor for FBKSForm.Question(0);
    swift_bridgeObjectRetain(v60);
    v37 = sub_1000076E0(&qword_100079B08);
    v38 = sub_100012E7C(&qword_100079B10, (uint64_t (*)(uint64_t))&type metadata accessor for FBKSForm.Question, (uint64_t)&protocol conformance descriptor for FBKSForm.Question);
    v39 = Dictionary.init(dictionaryLiteral:)(v31, v36, v37, v38);
    v40 = v24;
    dispatch thunk of FBKSInteraction.prefillQuestions.setter(v39);

    v61 = (uint64_t (*)(_QWORD))((char *)&async function pointer to dispatch thunk of FBKSDonation.donate()
                                         + async function pointer to dispatch thunk of FBKSDonation.donate());
    v41 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of FBKSDonation.donate()
                                     + 1));
    *(_QWORD *)(v0 + 256) = v41;
    *v41 = v0;
    v41[1] = sub_100012024;
    return v61(*(_QWORD *)(v0 + 144));
  }
  swift_bridgeObjectRelease(v8);
  if (qword_100079850 != -1)
    swift_once(&qword_100079850, sub_1000116D0);
  v51 = sub_10000CC24();
  sub_1000130D0(v51, (uint64_t)qword_10007AC60);
  v52 = sub_1000130E4();
  if (sub_10000CCA4(v52))
  {
    v53 = (_WORD *)sub_10000CBDC(2);
    *v53 = 0;
    sub_1000130BC((void *)&_mh_execute_header, v54, v55, "Skipping feedback donation, couldn't retrieve data for image generated.");
    sub_10000CBA0((uint64_t)v53);
  }

LABEL_19:
  sub_10001308C();
  sub_10000CD5C();
  sub_10000CD54();
  sub_10000CD84();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012024()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 256);
  *(_QWORD *)(*v1 + 264) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_100012130;
  }
  else
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v2 + 216));
    v4 = sub_100012090;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_100012090()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(void **)(v0 + 248);
  v2 = *(void **)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  v5 = *(_QWORD *)(v0 + 128);
  v6 = *(_QWORD *)(v0 + 80);
  sub_100012CF4(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v6, v3, v5);
  v7 = *(_QWORD *)(v0 + 200);
  sub_100007720(*(_QWORD *)(v0 + 80), 0, 1, *(_QWORD *)(v0 + 128));
  swift_task_dealloc(v7);
  sub_10000CD5C();
  sub_10000CD54();
  sub_10000CD84();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012130()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  if (qword_100079850 != -1)
    swift_once(&qword_100079850, sub_1000116D0);
  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = sub_10000CC24();
  v4 = sub_1000077A0(v3, (uint64_t)qword_10007AC60);
  swift_errorRetain(v1);
  swift_bridgeObjectRetain(v2);
  v5 = swift_errorRetain(v1);
  v6 = v4;
  Logger.logObject.getter(v5);
  v7 = sub_1000130E4();
  v8 = os_log_type_enabled(v4, v7);
  v9 = *(_QWORD *)(v0 + 264);
  v10 = *(void **)(v0 + 248);
  v11 = *(void **)(v0 + 224);
  v12 = *(_QWORD *)(v0 + 216);
  if (v8)
  {
    v30 = *(void **)(v0 + 224);
    v31 = *(_QWORD *)(v0 + 232);
    v13 = *(_QWORD *)(v0 + 208);
    v32 = *(_QWORD *)(v0 + 240);
    v14 = sub_10000CBDC(22);
    v15 = sub_10000CBDC(64);
    v33 = v15;
    *(_DWORD *)v14 = 136315394;
    swift_bridgeObjectRetain(v12);
    *(_QWORD *)(v0 + 56) = sub_10000C15C(v13, v12, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease_n(v12, 3);
    *(_WORD *)(v14 + 12) = 2080;
    *(_QWORD *)(v0 + 64) = v9;
    swift_errorRetain(v9);
    v16 = sub_1000076E0((uint64_t *)&unk_100079A58);
    v17 = String.init<A>(describing:)(v0 + 64, v16);
    v19 = v18;
    *(_QWORD *)(v0 + 72) = sub_10000C15C(v17, v18, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80, v14 + 14, v14 + 22);
    swift_bridgeObjectRelease(v19);
    sub_10000CC34();
    sub_10000CC34();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Donation for memory %s failed. Reason: %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy(v15, 2, (char *)&type metadata for Any + 8);
    sub_10000CBA0(v15);
    v20 = sub_10000CBA0(v14);
    sub_1000130EC(v20, v21, v22, v23, v24, v25, v26, v27, v0 + 56, v0 + 72, (uint64_t)v10, v30);

    sub_10000CC34();
    sub_100012CF4(v31, v32);
  }
  else
  {
    sub_100012CF4(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));

    sub_10000CC34();
    swift_bridgeObjectRelease_n(v12, 2);
    sub_10000CC34();
    sub_10000CC34();

  }
  sub_10001308C();
  sub_10000CD5C();
  sub_10000CD54();
  sub_10000CD84();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Int sub_100012398(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  _BYTE v8[24];

  swift_beginAccess(a3 + 16, v8, 1, 0);
  v5 = *(void **)(a3 + 16);
  *(_QWORD *)(a3 + 16) = a1;
  v6 = a1;

  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_1000123F4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void (*v5)(void *, uint64_t);
  uint64_t v6;
  id v7;

  v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (a3)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  swift_retain(v4);
  v7 = a2;
  v5(a2, v6);
  swift_release(v4);

  return swift_bridgeObjectRelease(v6);
}

void sub_100012488(void *a1, _OWORD *a2, CGImage *a3, uint64_t a4, uint64_t a5, void *a6, CGFloat a7, CGFloat a8)
{
  CGContext *v15;
  __int128 v16;
  __int128 v17;
  id v18;
  uint64_t v19;
  uint64_t inited;
  void *v21;
  NSString *v22;
  void *v23;
  NSString *v24;
  id v25;
  NSString *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  CGFloat b;
  uint64_t v37;
  uint64_t v38;
  NSString v39;
  _OWORD *v40;
  uint64_t v41;
  CGAffineTransform transform;
  CGRect v43;

  v15 = (CGContext *)objc_msgSend(a1, "CGContext");
  v16 = a2[1];
  *(_OWORD *)&transform.a = *a2;
  *(_OWORD *)&transform.c = v16;
  *(_OWORD *)&transform.tx = a2[2];
  CGContextConcatCTM(v15, &transform);
  v43.origin.x = 0.0;
  v43.origin.y = 0.0;
  v43.size.width = a7;
  v43.size.height = a8;
  CGContextRef.draw(_:in:byTiling:)(a3, v43, 0);
  v17 = a2[1];
  *(_OWORD *)&transform.a = *a2;
  *(_OWORD *)&transform.c = v17;
  *(_OWORD *)&transform.tx = a2[2];
  CGContextConcatCTM(v15, &transform);
  v18 = objc_msgSend(objc_allocWithZone((Class)NSMutableParagraphStyle), "init");
  objc_msgSend(v18, "setAlignment:", 1);
  v19 = sub_1000076E0(&qword_100079D60);
  inited = swift_initStackObject(v19, &v41);
  *(_OWORD *)(inited + 16) = xmmword_100056560;
  *(_QWORD *)(inited + 32) = NSFontAttributeName;
  v21 = (void *)objc_opt_self(UIFont);
  v22 = NSFontAttributeName;
  *(_QWORD *)(inited + 40) = objc_msgSend(v21, "systemFontOfSize:", 36.0);
  *(_QWORD *)(inited + 48) = NSParagraphStyleAttributeName;
  *(_QWORD *)(inited + 56) = v18;
  *(_QWORD *)(inited + 64) = NSForegroundColorAttributeName;
  v23 = (void *)objc_opt_self(UIColor);
  v24 = NSParagraphStyleAttributeName;
  v25 = v18;
  v26 = NSForegroundColorAttributeName;
  *(_QWORD *)(inited + 72) = objc_msgSend(v23, "whiteColor");
  type metadata accessor for Key(0);
  v28 = v27;
  v29 = sub_100012E40();
  v30 = sub_100012E7C(&qword_100079930, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1000561B0);
  v31 = Dictionary.init(dictionaryLiteral:)(inited, v28, v29, v30);
  *(_QWORD *)&transform.a = 10;
  transform.b = -1.7573882e159;
  v32 = sub_100012EBC(a6);
  if (v33)
  {
    v34 = v33;
  }
  else
  {
    v32 = 0;
    v34 = 0xE000000000000000;
  }
  v35 = v34;
  String.append(_:)(*(Swift::String *)&v32);
  swift_bridgeObjectRelease(v34);
  b = transform.b;
  sub_100012764(*(uint64_t *)&transform.a, *(uint64_t *)&transform.b, a4, a5);
  v38 = v37;
  swift_bridgeObjectRelease(*(_QWORD *)&b);
  v39 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v38);
  v40 = sub_1000127E0(v31);
  swift_bridgeObjectRelease(v31);
  sub_100012F1C(1, (uint64_t)v40, 0, v39, 0.0, a8 - a8 * 0.25, a7, a8 * 0.25);

}

uint64_t sub_100012764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[0] = a1;
  v8[1] = a2;
  v6 = a3;
  v7 = a4;
  swift_bridgeObjectRetain(a4);
  v6 = String.init<A>(_:)(&v6, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
  v7 = v4;
  String.append<A>(contentsOf:)(v8, &type metadata for String, &protocol witness table for String);
  return v6;
}

_OWORD *sub_1000127E0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  _OWORD *result;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  Swift::Int v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  _OWORD v38[4];
  _OWORD v39[2];
  _OWORD v40[3];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_1000076E0(&qword_100079D68);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v35 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v34 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = (_OWORD *)swift_retain(v3);
  v36 = 0;
  if (!v6)
    goto LABEL_9;
LABEL_8:
  v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v10 = v9 | (v36 << 6);
  while (1)
  {
    v16 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v10);
    *(_QWORD *)&v40[0] = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v10);
    v15 = *(void **)&v40[0];
    *(_QWORD *)&v39[0] = v16;
    v17 = sub_100012E40();
    v18 = v15;
    v19 = v16;
    swift_dynamicCast((char *)v40 + 8, v39, v17, (char *)&type metadata for Any + 8, 7);
    v20 = *(_QWORD *)&v40[0];
    sub_100012FFC((_OWORD *)((char *)v40 + 8), v38);
    sub_100012FFC(v38, v40);
    sub_100012FFC(v40, v39);
    v21 = v3[5];
    v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
    v24 = v23;
    Hasher.init(_seed:)(&v37, v21);
    String.hash(into:)(&v37, v22, v24);
    v25 = Hasher._finalize()();
    result = (_OWORD *)swift_bridgeObjectRelease(v24);
    v26 = -1 << *((_BYTE *)v3 + 32);
    v27 = v25 & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)&v7[8 * (v27 >> 6)]) == 0)
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v26) >> 6;
      while (++v28 != v31 || (v30 & 1) == 0)
      {
        v32 = v28 == v31;
        if (v28 == v31)
          v28 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)&v7[8 * v28];
        if (v33 != -1)
        {
          v29 = __clz(__rbit64(~v33)) + (v28 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)&v7[8 * (v27 >> 6)])) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)&v7[(v29 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v29;
    *(_QWORD *)(v3[6] + 8 * v29) = v20;
    result = sub_100012FFC(v39, (_OWORD *)(v3[7] + 32 * v29));
    ++v3[2];
    if (v6)
      goto LABEL_8;
LABEL_9:
    v11 = v36 + 1;
    if (__OFADD__(v36, 1))
      goto LABEL_38;
    if (v11 >= v34)
      goto LABEL_36;
    v12 = *(_QWORD *)(v35 + 8 * v11);
    v13 = v36 + 1;
    if (!v12)
    {
      v13 = v36 + 2;
      if (v36 + 2 >= v34)
        goto LABEL_36;
      v12 = *(_QWORD *)(v35 + 8 * v13);
      if (!v12)
      {
        v13 = v36 + 3;
        if (v36 + 3 >= v34)
          goto LABEL_36;
        v12 = *(_QWORD *)(v35 + 8 * v13);
        if (!v12)
        {
          v13 = v36 + 4;
          if (v36 + 4 >= v34)
            goto LABEL_36;
          v12 = *(_QWORD *)(v35 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v36 = v13;
  }
  v14 = v36 + 5;
  if (v36 + 5 >= v34)
  {
LABEL_36:
    swift_release(v3);
    sub_10001307C(a1);
    return v3;
  }
  v12 = *(_QWORD *)(v35 + 8 * v14);
  if (v12)
  {
    v13 = v36 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v34)
      goto LABEL_36;
    v12 = *(_QWORD *)(v35 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_24;
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_100012B78(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

id PhotosGenerativeStoryFactory.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosGenerativeStoryFactory();
  return objc_msgSendSuper2(&v2, "init");
}

id PhotosGenerativeStoryFactory.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosGenerativeStoryFactory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100012C30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;

  v11 = (_QWORD *)swift_task_alloc(dword_100079D2C);
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_100007414;
  return static PhotosGenerativeStoryFactory.createDonation(memory:prompt:photoLibrary:)(a1, a2, a3, a4, a5);
}

uint64_t sub_100012CB0(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100012CF4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t type metadata accessor for PhotosGenerativeStoryFactory()
{
  return objc_opt_self(PUPhotosGenerativeStoryFactory);
}

uint64_t sub_100012D58()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100012D7C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_100012DA8(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100012398(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_100012DB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100012DC0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100012DC8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 72, 7);
}

void sub_100012DFC(void *a1)
{
  uint64_t v1;

  sub_100012488(a1, *(_OWORD **)(v1 + 16), *(CGImage **)(v1 + 24), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(void **)(v1 + 64), *(CGFloat *)(v1 + 32), *(CGFloat *)(v1 + 40));
}

uint64_t sub_100012E10()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100012E20()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_100012E40()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100079A40;
  if (!qword_100079A40)
  {
    v1 = objc_opt_self(NSObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100079A40);
  }
  return result;
}

uint64_t sub_100012E7C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100012EBC(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, "subtitle");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v3;
}

void sub_100012F1C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, double a5, double a6, double a7, double a8)
{
  Class isa;

  type metadata accessor for Key(0);
  sub_100012E7C(&qword_100079930, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1000561B0);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a2);
  objc_msgSend(a4, "drawWithRect:options:attributes:context:", a1, isa, a3, a5, a6, a7, a8);

}

_OWORD *sub_100012FFC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

Swift::Int sub_10001300C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_10001307C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001308C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = v0[25];
  sub_100007720(v0[10], 1, 1, v0[16]);
  return swift_task_dealloc(v1);
}

void sub_1000130BC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t sub_1000130D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = sub_1000077A0(a1, a2);
  return Logger.logObject.getter(v2);
}

uint64_t sub_1000130E4()
{
  return static os_log_type_t.error.getter();
}

void sub_1000130EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{

}

uint64_t sub_1000130F4(void *a1)
{
  id *v1;
  os_unfair_lock_s *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  if (qword_100079858 != -1)
    swift_once(&qword_100079858, sub_10001328C);
  v4 = qword_100079D70;
  sub_100014688();
  os_unfair_lock_lock(v2);
  sub_1000132F0(v1, a1, &v7);
  os_unfair_lock_unlock(v2);
  v5 = v7;
  swift_release(v4);
  return v5;
}

BOOL sub_100013188(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_100013198(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

_UNKNOWN **sub_1000131BC()
{
  return &off_100069BF8;
}

Swift::Int sub_1000131C8(char a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

BOOL sub_10001320C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100013188(*a1, *a2);
}

Swift::Int sub_100013218()
{
  char *v0;

  return sub_1000131C8(*v0);
}

void sub_100013220(uint64_t a1)
{
  char *v1;

  sub_100013198(a1, *v1);
}

Swift::Int sub_100013228(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

_UNKNOWN **sub_100013268@<X0>(_QWORD *a1@<X8>)
{
  _UNKNOWN **result;

  result = sub_1000131BC();
  *a1 = result;
  return result;
}

uint64_t sub_10001328C()
{
  id v0;
  uint64_t v1;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(NSMapTable), "weakToStrongObjectsMapTable");
  v1 = sub_1000076E0((uint64_t *)&unk_100079EE0);
  result = swift_allocObject(v1, 28, 7);
  *(_DWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 16) = v0;
  qword_100079D70 = result;
  return result;
}

id sub_1000132F0@<X0>(id *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  id v5;
  id result;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = *a1;
  result = objc_msgSend(*a1, "objectForKey:", a2);
  v7 = (uint64_t)result;
  if (!result)
  {
    v8 = type metadata accessor for PhotosCollectionEntityCache();
    swift_allocObject(v8, 72, 7);
    v9 = a2;
    v7 = sub_100013394(v9);
    result = objc_msgSend(v5, "setObject:forKey:", v7, v9);
  }
  *a3 = v7;
  return result;
}

uint64_t sub_100013394(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[24];
  _QWORD v10[5];

  v2 = v1;
  swift_unknownObjectWeakInit(v2 + 16, 0);
  *(_QWORD *)(v2 + 56) = 0;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  v4 = sub_100013510();
  v5 = sub_1000076E0(&qword_100079ED0);
  v6 = swift_allocObject(v5, 28, 7);
  *(_DWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v2 + 64) = v6;
  swift_unknownObjectWeakAssign(v2 + 16, a1);
  v7 = swift_allocObject(&unk_10006A660, 24, 7);
  swift_weakInit(v7 + 16, v2);
  swift_retain(v7);
  PHPhotoLibrary.registerObserver(_:block:)(v10, sub_100014638, v7, nullsub_9, 0);
  swift_release_n(v7, 2);

  swift_beginAccess(v2 + 24, v9, 33, 0);
  sub_100014640((uint64_t)v10, v2 + 24);
  swift_endAccess(v9);
  return v2;
}

uint64_t sub_1000134B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;
  _BYTE v7[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v7, 0, 0);
  Strong = swift_weakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    sub_1000136C0(a1);
    swift_release(v5);
  }
  return 0;
}

_QWORD *sub_100013510()
{
  char v0;
  unint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  char v8;
  uint64_t v9;
  _BOOL8 v10;
  Swift::Int v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *result;

  v0 = 0;
  v1 = 0;
  while (1)
  {
    v2 = v0;
    if (v1 >= 2)
      break;
    v3 = *((_BYTE *)&off_100069C20 + v1 + 32);
    v4 = sub_1000076E0(&qword_100079ED8);
    v5 = Dictionary.init(dictionaryLiteral:)(&_swiftEmptyArrayStorage, &type metadata for AnyHashable, v4, &protocol witness table for AnyHashable);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(_swiftEmptyDictionarySingleton);
    v7 = sub_1000140BC(v3);
    v9 = _swiftEmptyDictionarySingleton[2];
    v10 = (v8 & 1) == 0;
    v11 = v9 + v10;
    if (__OFADD__(v9, v10))
      goto LABEL_14;
    v12 = v7;
    v13 = v8;
    sub_1000076E0(&qword_100079EB8);
    if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v11))
    {
      v14 = sub_1000140BC(v3);
      if ((v13 & 1) != (v15 & 1))
        goto LABEL_16;
      v12 = v14;
    }
    if ((v13 & 1) != 0)
    {
      v16 = _swiftEmptyDictionarySingleton[7];
      swift_bridgeObjectRelease(*(_QWORD *)(v16 + 8 * v12));
      *(_QWORD *)(v16 + 8 * v12) = v5;
    }
    else
    {
      _swiftEmptyDictionarySingleton[(v12 >> 6) + 8] |= 1 << v12;
      *(_BYTE *)(_swiftEmptyDictionarySingleton[6] + v12) = v3;
      *(_QWORD *)(_swiftEmptyDictionarySingleton[7] + 8 * v12) = v5;
      v17 = _swiftEmptyDictionarySingleton[2];
      v18 = __OFADD__(v17, 1);
      v19 = v17 + 1;
      if (v18)
        goto LABEL_15;
      _swiftEmptyDictionarySingleton[2] = v19;
    }
    swift_bridgeObjectRelease(0x8000000000000000);
    v0 = 1;
    v1 = &_mh_execute_header.magic + 1;
    if ((v2 & 1) != 0)
      return _swiftEmptyDictionarySingleton;
  }
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
LABEL_16:
  result = (_QWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for PhotosCollectionEntityCache.CacheCategory);
  __break(1u);
  return result;
}

double sub_1000136C0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  os_unfair_lock_s *v3;
  uint64_t v5;
  double result;

  v5 = *(_QWORD *)(v1 + 64);
  sub_100014688();
  os_unfair_lock_lock(v3);
  sub_100013718(v2, a1);
  os_unfair_lock_unlock(v3);
  *(_QWORD *)&result = swift_release(v5).n128_u64[0];
  return result;
}

void sub_100013718(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v32;
  char v33;
  uint64_t v34;
  _BOOL8 v35;
  Swift::Int v36;
  char v37;
  char v38;
  void *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  char v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  _BOOL8 v47;
  Swift::Int v48;
  unint64_t v49;
  char v50;
  Swift::Bool v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  ValueMetadata *v59;
  uint64_t v60;
  int64_t v61;
  uint64_t v62;
  int64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int64_t v67;
  char v68;
  uint64_t v69;
  unint64_t v70;
  int64_t v71;
  unint64_t v72;
  _BYTE v73[40];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;

  v3 = a1;
  v4 = *a1;
  v5 = 1 << *(_BYTE *)(v4 + 32);
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v64 = v6 & *(_QWORD *)(v4 + 64);
  v61 = (unint64_t)(v5 + 63) >> 6;
  v62 = v4;
  swift_bridgeObjectRetain(v4);
  v7 = 0;
LABEL_5:
  if (!v64)
  {
    v10 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
LABEL_70:
      __break(1u);
      goto LABEL_71;
    }
    if (v10 >= v61)
      goto LABEL_64;
    v11 = *(_QWORD *)(v60 + 8 * v10);
    v12 = v7 + 1;
    if (!v11)
    {
      v12 = v7 + 2;
      if (v7 + 2 >= v61)
        goto LABEL_64;
      v11 = *(_QWORD *)(v60 + 8 * v12);
      if (!v11)
      {
        v12 = v7 + 3;
        if (v7 + 3 >= v61)
          goto LABEL_64;
        v11 = *(_QWORD *)(v60 + 8 * v12);
        if (!v11)
        {
          v13 = v7 + 4;
          if (v7 + 4 < v61)
          {
            v11 = *(_QWORD *)(v60 + 8 * v13);
            if (v11)
            {
              v12 = v7 + 4;
              goto LABEL_20;
            }
            while (1)
            {
              v12 = v13 + 1;
              if (__OFADD__(v13, 1))
                goto LABEL_72;
              if (v12 >= v61)
                break;
              v11 = *(_QWORD *)(v60 + 8 * v12);
              ++v13;
              if (v11)
                goto LABEL_20;
            }
          }
LABEL_64:
          swift_release(v62);
          return;
        }
      }
    }
LABEL_20:
    v63 = v12;
    v64 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
    goto LABEL_21;
  }
  v8 = __clz(__rbit64(v64));
  v63 = v7;
  v64 &= v64 - 1;
  v9 = v8 | (v7 << 6);
LABEL_21:
  v68 = *(_BYTE *)(*(_QWORD *)(v62 + 48) + v9);
  v14 = *(_QWORD *)(*(_QWORD *)(v62 + 56) + 8 * v9);
  v65 = v14 + 64;
  v15 = 1 << *(_BYTE *)(v14 + 32);
  if (v15 < 64)
    v16 = ~(-1 << v15);
  else
    v16 = -1;
  v17 = v16 & *(_QWORD *)(v14 + 64);
  v67 = (unint64_t)(v15 + 63) >> 6;
  swift_bridgeObjectRetain(v14);
  v18 = 0;
  v66 = v14;
  while (v17)
  {
    v19 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    v20 = v19 | (v18 << 6);
LABEL_27:
    sub_100014488(*(_QWORD *)(v14 + 48) + 40 * v20, (uint64_t)&v74);
    *((_QWORD *)&v76 + 1) = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v20);
    v21 = *((id *)&v76 + 1);
LABEL_46:
    sub_1000144C4((uint64_t)&v74, (uint64_t)&v77);
    if (!*((_QWORD *)&v78 + 1))
    {
      swift_release(v14);
      v7 = v63;
      goto LABEL_5;
    }
    v74 = v77;
    v75 = v78;
    v25 = v80;
    *(_QWORD *)&v76 = v79;
    v26 = sub_10001450C();
    v27 = (void *)PHChange.changeDetails<A>(for:)(v25, v26);
    if (v27
      && (v28 = v27,
          v29 = objc_msgSend(v27, "fetchResultAfterChanges"),
          v28,
          v29))
    {
      v70 = v17;
      v71 = v18;
      sub_100014488((uint64_t)&v74, (uint64_t)v73);
      v30 = v29;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
      v81 = *v3;
      v32 = v81;
      *v3 = 0x8000000000000000;
      v72 = sub_1000140BC(v68);
      v34 = *(_QWORD *)(v32 + 16);
      v35 = (v33 & 1) == 0;
      v36 = v34 + v35;
      if (__OFADD__(v34, v35))
      {
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
        goto LABEL_70;
      }
      v37 = v33;
      sub_1000076E0(&qword_100079EB8);
      if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v36))
      {
        v72 = sub_1000140BC(v68);
        if ((v37 & 1) != (v38 & 1))
          goto LABEL_73;
      }
      if ((v37 & 1) == 0)
        goto LABEL_66;
      v39 = v25;
      v40 = v3;
      v41 = a2;
      v69 = v81;
      v42 = *(_QWORD **)(*(_QWORD *)(v81 + 56) + 8 * v72);
      v43 = swift_isUniquelyReferenced_nonNull_native(v42);
      v44 = sub_10001408C((uint64_t)v73);
      v46 = v42[2];
      v47 = (v45 & 1) == 0;
      v48 = v46 + v47;
      if (__OFADD__(v46, v47))
        goto LABEL_67;
      v49 = v44;
      v50 = v45;
      sub_1000076E0(&qword_100079EC0);
      v51 = _NativeDictionary.ensureUnique(isUnique:capacity:)(v43, v48);
      a2 = v41;
      v3 = v40;
      if (v51)
      {
        v52 = sub_10001408C((uint64_t)v73);
        if ((v50 & 1) != (v53 & 1))
        {
          v59 = (ValueMetadata *)&type metadata for AnyHashable;
          goto LABEL_75;
        }
        v49 = v52;
      }
      if ((v50 & 1) != 0)
      {
        v54 = v42[7];
        v55 = *(void **)(v54 + 8 * v49);
        *(_QWORD *)(v54 + 8 * v49) = v30;

      }
      else
      {
        v42[(v49 >> 6) + 8] |= 1 << v49;
        sub_100014488((uint64_t)v73, v42[6] + 40 * v49);
        *(_QWORD *)(v42[7] + 8 * v49) = v30;
        v56 = v42[2];
        v57 = __OFADD__(v56, 1);
        v58 = v56 + 1;
        if (v57)
          goto LABEL_69;
        v42[2] = v58;
      }
      swift_bridgeObjectRelease(0x8000000000000000);
      sub_100014548((uint64_t)v73);
      *(_QWORD *)(*(_QWORD *)(v69 + 56) + 8 * v72) = v42;
      *v40 = v69;

      sub_100014548((uint64_t)&v74);
      v14 = v66;
      v17 = v70;
      v18 = v71;
    }
    else
    {

      sub_100014548((uint64_t)&v74);
    }
  }
  v22 = v18 + 1;
  if (__OFADD__(v18, 1))
    goto LABEL_68;
  if (v22 >= v67)
  {
LABEL_45:
    v17 = 0;
    v75 = 0u;
    v76 = 0u;
    v74 = 0u;
    goto LABEL_46;
  }
  v23 = *(_QWORD *)(v65 + 8 * v22);
  if (v23)
  {
LABEL_31:
    v17 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v22 << 6);
    v18 = v22;
    goto LABEL_27;
  }
  v24 = v18 + 2;
  ++v18;
  if (v22 + 1 >= v67)
    goto LABEL_45;
  v23 = *(_QWORD *)(v65 + 8 * v24);
  if (v23)
    goto LABEL_34;
  v18 = v22 + 1;
  if (v22 + 2 >= v67)
    goto LABEL_45;
  v23 = *(_QWORD *)(v65 + 8 * (v22 + 2));
  if (v23)
  {
    v22 += 2;
    goto LABEL_31;
  }
  v24 = v22 + 3;
  v18 = v22 + 2;
  if (v22 + 3 >= v67)
    goto LABEL_45;
  v23 = *(_QWORD *)(v65 + 8 * v24);
  if (v23)
  {
LABEL_34:
    v22 = v24;
    goto LABEL_31;
  }
  while (1)
  {
    v22 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v22 >= v67)
    {
      v18 = v67 - 1;
      goto LABEL_45;
    }
    v23 = *(_QWORD *)(v65 + 8 * v22);
    ++v24;
    if (v23)
      goto LABEL_31;
  }
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  v59 = &type metadata for PhotosCollectionEntityCache.CacheCategory;
LABEL_75:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v59);
  __break(1u);
}

void sub_100013CD4(uint64_t *a1@<X0>, char a2@<W1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  char v6;
  _QWORD *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[40];

  v6 = a2 & 1;
  v7 = sub_1000110CC(a3, a3[3]);
  __chkstk_darwin(v7);
  v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(_BYTE *))(v10 + 16))(v9);
  AnyHashable.init<A>(_:)(v9);
  sub_10000B550(v6, *a1);
  if (v11)
  {
    v12 = v11;
    sub_10000B590((uint64_t)v16, v11);
    v14 = v13;
    swift_bridgeObjectRelease(v12);
    *a4 = v14;
    sub_100014548((uint64_t)v16);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100013DC0()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  sub_1000145D4(v0 + 24);
  swift_release(*(_QWORD *)(v0 + 64));
  return v0;
}

uint64_t sub_100013DEC()
{
  uint64_t v0;

  sub_100013DC0();
  return swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for PhotosCollectionEntityCache()
{
  return objc_opt_self(_TtC15MobileSlideShow27PhotosCollectionEntityCache);
}

_BYTE *initializeBufferWithCopyOfBuffer for PhotosCollectionEntityCache.CacheCategory(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PhotosCollectionEntityCache.CacheCategory(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 1) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotosCollectionEntityCache.CacheCategory(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_100013F0C + 4 * byte_1000565C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100013F40 + 4 * asc_1000565C0[v4]))();
}

uint64_t sub_100013F40(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013F48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100013F50);
  return result;
}

uint64_t sub_100013F5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100013F64);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100013F68(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013F70(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013F7C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100013F84(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PhotosCollectionEntityCache.CacheCategory()
{
  return &type metadata for PhotosCollectionEntityCache.CacheCategory;
}

unint64_t sub_100013FA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100079E90;
  if (!qword_100079E90)
  {
    v1 = sub_10000763C(&qword_100079E98);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100079E90);
  }
  return result;
}

unint64_t sub_100013FEC()
{
  unint64_t result;

  result = qword_100079EA0;
  if (!qword_100079EA0)
  {
    result = swift_getWitnessTable(&unk_100056694, &type metadata for PhotosCollectionEntityCache.CacheCategory);
    atomic_store(result, (unint64_t *)&qword_100079EA0);
  }
  return result;
}

unint64_t sub_100014028(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100014118(a1, a2, v5);
}

unint64_t sub_10001408C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_1000141F8(a1, v4);
}

unint64_t sub_1000140BC(char a1)
{
  uint64_t v1;
  uint64_t v2;
  char v4;
  Swift::Int v5;
  _QWORD v7[9];

  v2 = v1;
  v4 = a1 & 1;
  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  Hasher._combine(_:)(a1 & 1);
  v5 = Hasher._finalize()();
  return sub_1000142BC(v4, v5);
}

unint64_t sub_100014118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000141F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_100014488(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100014548((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1000142BC(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (((((a1 & 1) == 0) ^ *(_BYTE *)(v7 + result)) & 1) != 0)
          break;
      }
    }
  }
  return result;
}

void sub_100014370(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  _BOOL8 v12;
  Swift::Int v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_10001408C(a2);
  v11 = v8[2];
  v12 = (v10 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_9;
  }
  v14 = v9;
  v15 = v10;
  sub_1000076E0(&qword_100079EC0);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13))
    goto LABEL_5;
  v16 = sub_10001408C(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_9:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
    __break(1u);
    return;
  }
  v14 = v16;
LABEL_5:
  v18 = *v4;
  if ((v15 & 1) != 0)
  {
    v19 = v18[7];
    v20 = *(void **)(v19 + 8 * v14);
    *(_QWORD *)(v19 + 8 * v14) = a1;

  }
  else
  {
    sub_100014488(a2, (uint64_t)v21);
    sub_10001457C(v14, (uint64_t)v21, a1, v18);
  }
}

uint64_t sub_100014488(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1000144C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000076E0(&qword_100079EA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001450C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100079EB0;
  if (!qword_100079EB0)
  {
    v1 = objc_opt_self(PHObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100079EB0);
  }
  return result;
}

uint64_t sub_100014548(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

unint64_t sub_10001457C(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(result >> 6) + 8] |= 1 << result;
  v4 = a4[6] + 40 * result;
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v4 = *(_OWORD *)a2;
  *(_OWORD *)(v4 + 16) = v5;
  *(_QWORD *)(v4 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

uint64_t sub_1000145D4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000076E0(&qword_100079EC8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100014614()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100014638(uint64_t a1)
{
  uint64_t v1;

  return sub_1000134B0(a1, v1);
}

uint64_t sub_100014640(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000076E0(&qword_100079EC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014688()
{
  uint64_t v0;

  return swift_retain(v0);
}

uint64_t sub_100014698()
{
  return sub_100014728(&qword_100079870, type metadata accessor for CollectionEntity);
}

uint64_t type metadata accessor for CollectionEntity(uint64_t a1)
{
  uint64_t result;

  result = qword_10007A0A0;
  if (!qword_10007A0A0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CollectionEntity);
  return result;
}

uint64_t sub_1000146FC()
{
  return sub_100014728(&qword_100079F00, type metadata accessor for CollectionEntity);
}

uint64_t sub_100014728(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = a2(255);
    result = sub_100007EA4(v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100014760()
{
  return sub_100014728(&qword_100079F08, type metadata accessor for CollectionEntity);
}

unint64_t sub_100014790()
{
  unint64_t result;

  result = qword_100079F10;
  if (!qword_100079F10)
  {
    result = swift_getWitnessTable(&unk_1000568FC, &type metadata for CollectionQuery);
    atomic_store(result, (unint64_t *)&qword_100079F10);
  }
  return result;
}

void *sub_1000147CC()
{
  return &protocol witness table for UUID;
}

uint64_t sub_1000147D8(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = a1;
  v3 = *(_QWORD *)&aRecents_2[8 * a1];
  v4 = *(_QWORD *)&aOneyeara[8 * v2 + 8];
  v5 = *(_QWORD *)&aRecents_2[8 * a2];
  v6 = *(_QWORD *)&aOneyeara[8 * a2 + 8];
  if (v3 == v5 && v4 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v5, v6, 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v8 & 1;
}

uint64_t sub_10001485C(uint64_t *a1, _QWORD *a2, char a3, void *a4)
{
  uint64_t v4;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  _BOOL8 v19;
  Swift::Int v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t result;
  _QWORD v33[5];
  _BYTE v34[40];
  _BYTE v35[40];
  uint64_t v36;

  v7 = a3 & 1;
  v8 = sub_1000110CC(a2, a2[3]);
  __chkstk_darwin(v8);
  sub_100019888();
  (*(void (**)(uint64_t))(v9 + 16))(v4);
  AnyHashable.init<A>(_:)(v4);
  sub_100014488((uint64_t)v35, (uint64_t)v33);
  sub_1000199B0();
  sub_10000B550(v7, *a1);
  if (!v10)
    goto LABEL_16;
  v11 = v10;
  sub_10000B590((uint64_t)v34, v10);
  v13 = v12;
  swift_bridgeObjectRelease(v11);
  sub_100014548((uint64_t)v34);
  if (v13)
  {
    sub_100014548((uint64_t)v35);
    return (uint64_t)v13;
  }
  sub_100014488((uint64_t)v35, (uint64_t)v33);
  sub_1000199B0();
  v13 = a4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  v33[0] = *a1;
  v15 = v33[0];
  *a1 = 0x8000000000000000;
  v16 = sub_1000140BC(v7);
  v18 = *(_QWORD *)(v15 + 16);
  v19 = (v17 & 1) == 0;
  v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v21 = v16;
  v22 = v17;
  sub_1000076E0(&qword_100079EB8);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v20))
  {
LABEL_8:
    if ((v22 & 1) != 0)
    {
      v25 = v33[0];
      v26 = *(_QWORD *)(*(_QWORD *)(v33[0] + 56) + 8 * v21);
      v27 = swift_isUniquelyReferenced_nonNull_native(v26);
      v36 = v26;
      sub_100014370((uint64_t)v13, (uint64_t)v34, v27);
      v28 = v36;
      swift_bridgeObjectRelease(0x8000000000000000);
      sub_100014548((uint64_t)v34);
      if (v28)
      {
        *(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v21) = v28;
      }
      else
      {
        v29 = sub_1000076E0(&qword_10007A140);
        v30 = sub_1000194C8();
        _NativeDictionary._delete(at:)(v21, v25, &type metadata for PhotosCollectionEntityCache.CacheCategory, v29, v30);
      }
      *a1 = v25;
      sub_100014548((uint64_t)v35);
      v31 = v13;
      return (uint64_t)v13;
    }
    goto LABEL_15;
  }
  v23 = sub_1000140BC(v7);
  if ((v22 & 1) == (v24 & 1))
  {
    v21 = v23;
    goto LABEL_8;
  }
LABEL_17:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for PhotosCollectionEntityCache.CacheCategory);
  __break(1u);
  return result;
}

void sub_100014AC4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_1000076E0(&qword_10007A150);
  v3 = __chkstk_darwin(v2);
  v4 = __chkstk_darwin(v3);
  v5 = __chkstk_darwin(v4);
  __chkstk_darwin(v5);
  __asm { BR              X10 }
}

uint64_t sub_100014B88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  UUID.init(uuidString:)(0xD000000000000024, 0x80000001000510D0);
  v2 = type metadata accessor for UUID(0);
  if (sub_10000C914(v1, 1, v2) == 1)
  {
    __break(1u);
    JUMPOUT(0x100014D14);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v0, v1, v2);
}

void sub_100014D28(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = type metadata accessor for String.LocalizationValue(0);
  v3 = __chkstk_darwin(v2);
  v4 = __chkstk_darwin(v3);
  v5 = __chkstk_darwin(v4);
  __chkstk_darwin(v5);
  v6 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  __chkstk_darwin(v6);
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  __asm { BR              X10 }
}

uint64_t sub_100014E60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = ((uint64_t (*)(unint64_t, unint64_t))String.LocalizationValue.init(stringLiteral:))(0xD000000000000015, 0x8000000100051190);
  ((void (*)(uint64_t))static Locale.current.getter)(v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v0, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v3, 0x6E65746E49707041, 0xEA00000000007374, v1, v0, 0, 0, 256);
}

id sub_100014FF8()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PlacesAlbumThumbnailGenerator()), "init");
  qword_100079EF0 = (uint64_t)result;
  return result;
}

id sub_100015028(void *a1, char a2)
{
  uint64_t v4;
  uint64_t Strong;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v14;
  _QWORD v15[5];

  type metadata accessor for PhotosCollectionEntityCache();
  v4 = sub_1000130F4(a1);
  v15[3] = &type metadata for StaticAlbum;
  v15[4] = sub_100019304();
  LOBYTE(v15[0]) = a2;
  Strong = swift_unknownObjectWeakLoadStrong(v4 + 16);
  if (!Strong)
    goto LABEL_7;
  v6 = (void *)Strong;
  v7 = *(_QWORD *)(v4 + 64);
  swift_retain(v7);
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 24));
  sub_100013CD4((uint64_t *)(v7 + 16), 1, v15, &v14);
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 24));
  v8 = v14;
  swift_release(v7);
  if (!v8)
  {
    sub_1000151B0(v6, a2);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)(v4 + 64);
      swift_retain(v11);
      os_unfair_lock_lock((os_unfair_lock_t)(v11 + 24));
      sub_10001949C((uint64_t *)(v11 + 16), v15, 1, v10, (uint64_t *)&v14);
      os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 24));
      v8 = v14;
      swift_release(v11);

      goto LABEL_8;
    }

LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }

LABEL_8:
  sub_10000CAA0(v15);
  v12 = objc_msgSend(v8, "firstObject");
  swift_release(v4);

  return v12;
}

void sub_1000151B0(void *a1, char a2)
{
  id v3;

  v3 = objc_msgSend(a1, "librarySpecificFetchOptions");
  __asm { BR              X10 }
}

id sub_1000151F4()
{
  void *v0;
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(PHAssetCollection), "fetchAssetCollectionsWithType:subtype:options:", 2, 209, v0);

  return v1;
}

id sub_1000152C4(void *a1, unsigned __int8 a2)
{
  uint64_t v4;
  uint64_t Strong;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v14;
  _QWORD v15[5];

  type metadata accessor for PhotosCollectionEntityCache();
  v4 = sub_1000130F4(a1);
  v15[3] = &type metadata for StaticAlbum;
  v15[4] = sub_100019304();
  LOBYTE(v15[0]) = a2;
  Strong = swift_unknownObjectWeakLoadStrong(v4 + 16);
  if (!Strong)
    goto LABEL_7;
  v6 = (void *)Strong;
  v7 = *(_QWORD *)(v4 + 64);
  swift_retain(v7);
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 24));
  sub_100013CD4((uint64_t *)(v7 + 16), 0, v15, &v14);
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 24));
  v8 = v14;
  swift_release(v7);
  if (!v8)
  {
    v9 = sub_10001544C(v6, a2);
    if (v9)
    {
      v10 = (void *)v9;
      v11 = *(_QWORD *)(v4 + 64);
      swift_retain(v11);
      os_unfair_lock_lock((os_unfair_lock_t)(v11 + 24));
      sub_10001949C((uint64_t *)(v11 + 16), v15, 0, v10, (uint64_t *)&v14);
      os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 24));
      v8 = v14;
      swift_release(v11);

      goto LABEL_8;
    }

LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }

LABEL_8:
  sub_10000CAA0(v15);
  v12 = objc_msgSend(v8, "firstObject");
  swift_release(v4);

  return v12;
}

uint64_t sub_10001544C(void *a1, unsigned __int8 a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t result;
  char *v44;
  void (*v45)(char *, char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  Class isa;
  uint64_t v52;
  unint64_t v53;
  NSDate v54;
  void *v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;

  v4 = a2;
  v5 = sub_1000076E0(&qword_10007A158);
  v6 = __chkstk_darwin(v5);
  v64 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v65 = (char *)&v57 - v9;
  __chkstk_darwin(v8);
  v11 = (char *)&v57 - v10;
  v12 = sub_1000076E0(&qword_10007A160);
  __chkstk_darwin(v12);
  v14 = (char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000076E0(&qword_10007A168);
  __chkstk_darwin(v15);
  v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for DateComponents(0);
  v62 = *(_QWORD *)(v18 - 8);
  v63 = v18;
  __chkstk_darwin(v18);
  v20 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for Date(0);
  v68 = *(_QWORD *)(v21 - 8);
  v22 = __chkstk_darwin(v21);
  v61 = (char *)&v57 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v22);
  v66 = (char *)&v57 - v25;
  v26 = __chkstk_darwin(v24);
  v67 = (char *)&v57 - v27;
  __chkstk_darwin(v26);
  v29 = (char *)&v57 - v28;
  v30 = type metadata accessor for Calendar(0);
  v31 = __chkstk_darwin(v30);
  v34 = (char *)&v57 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v4 <= 2)
  {
    v35 = sub_100015028(a1, a2);
    if (!v35)
      return 0;
    v36 = v35;
    v37 = objc_msgSend(a1, "librarySpecificFetchOptions");
    objc_msgSend(v37, "setFetchLimit:", 1);
    objc_msgSend(v37, "setReverseSortOrder:", objc_msgSend(v36, "keyAssetsAtEnd"));
    v38 = objc_msgSend((id)objc_opt_self(PHAsset), "fetchAssetsInAssetCollection:options:", v36, v37);

    return (uint64_t)v38;
  }
  v59 = v32;
  v39 = v31;
  v40 = objc_msgSend(a1, "librarySpecificFetchOptions");
  v41 = static Calendar.current.getter();
  Date.init()(v41);
  v60 = v39;
  sub_100007720((uint64_t)v17, 1, 1, v39);
  v42 = type metadata accessor for TimeZone(0);
  sub_100007720((uint64_t)v14, 1, 1, v42);
  DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)(v17, v14, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0,
    1,
    0,
    1,
    0,
    1,
    0,
    1,
    0,
    1,
    0,
    1);
  DateComponents.year.setter(-1, 0);
  Calendar.date(byAdding:to:wrappingComponents:)(v20, v29, 0);
  result = sub_10000C914((uint64_t)v11, 1, v21);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_11;
  }
  v44 = v67;
  v45 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
  v45(v67, v11, v21);
  DateComponents.year.setter(0, 0);
  DateComponents.day.setter(-3, 0);
  v46 = (uint64_t)v65;
  Calendar.date(byAdding:to:wrappingComponents:)(v20, v44, 0);
  result = sub_10000C914(v46, 1, v21);
  if ((_DWORD)result == 1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v58 = v29;
  v45(v66, (char *)v46, v21);
  DateComponents.day.setter(3, 0);
  v47 = (uint64_t)v64;
  Calendar.date(byAdding:to:wrappingComponents:)(v20, v44, 0);
  result = sub_10000C914(v47, 1, v21);
  if ((_DWORD)result != 1)
  {
    v48 = v61;
    v45(v61, (char *)v47, v21);
    sub_10000C944(0, &qword_10007A170, NSPredicate_ptr);
    v49 = sub_1000076E0(&qword_10007A178);
    v50 = swift_allocObject(v49, 112, 7);
    *(_OWORD *)(v50 + 16) = xmmword_100056B90;
    isa = Date._bridgeToObjectiveC()().super.isa;
    v52 = sub_10000C944(0, &qword_10007A180, NSDate_ptr);
    *(_QWORD *)(v50 + 56) = v52;
    v53 = sub_100019504();
    *(_QWORD *)(v50 + 64) = v53;
    *(_QWORD *)(v50 + 32) = isa;
    v54.super.isa = Date._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)(v50 + 96) = v52;
    *(_QWORD *)(v50 + 104) = v53;
    *(NSDate *)(v50 + 72) = v54;
    v55 = (void *)NSPredicate.init(format:_:)(0xD000000000000026, 0x8000000100051100, v50);
    objc_msgSend(v40, "setPredicate:", v55);

    objc_msgSend(v40, "setFetchLimit:", 1);
    v38 = objc_msgSend((id)objc_opt_self(PHAsset), "fetchAssetsWithOptions:", v40);

    v56 = *(void (**)(char *, uint64_t))(v68 + 8);
    v56(v48, v21);
    v56(v66, v21);
    v56(v67, v21);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v20, v63);
    v56(v58, v21);
    (*(void (**)(char *, uint64_t))(v59 + 8))(v34, v60);
    return (uint64_t)v38;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_100015AC0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  unint64_t v4;

  *(_BYTE *)(v3 + 88) = a3;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  v4 = (*(_QWORD *)(*(_QWORD *)(sub_1000076E0(&qword_10007A108) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v3 + 32) = swift_task_alloc(v4);
  *(_QWORD *)(v3 + 40) = swift_task_alloc(v4);
  *(_QWORD *)(v3 + 48) = swift_task_alloc(v4);
  return swift_task_switch(sub_100015B3C, 0, 0);
}

void sub_100015B3C()
{
  __asm { BR              X10 }
}

uint64_t sub_100015B6C()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = sub_1000152C4(*(void **)(v0 + 24), 0);
  if (v1)
  {
    v2 = v1;
    sub_1000197EC((uint64_t)v1);

    v3 = sub_10001980C();
    v4 = sub_1000197C4(v3);
    v5 = *(_QWORD *)(v0 + 48);
    if ((_DWORD)v4 != 1)
    {
      (*(void (**)(_QWORD, uint64_t, void *))(*((_QWORD *)v2 - 1) + 32))(*(_QWORD *)(v0 + 16), v5, v2);
      goto LABEL_6;
    }
    sub_100019950(v4, v5);
  }
  DisplayRepresentation.Image.init(systemName:isTemplate:)(0x69662E6B636F6C63, 0xEA00000000006C6CLL, 2);
LABEL_6:
  sub_100019870();
  sub_10000CC2C();
  sub_10000CD5C();
  return sub_1000197B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100015D34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100019814();
  sub_1000197FC();
  *(_QWORD *)(v3 + 72) = v1;
  *(_QWORD *)(v3 + 80) = v2;
  sub_1000198EC(v4);
  if (v0)
    swift_errorRelease(v0);
  sub_10000CC08();
  return sub_10000CB94();
}

uint64_t sub_100015D88()
{
  uint64_t v0;
  void *v1;

  if (*(_QWORD *)(v0 + 80) >> 60 == 15)
  {

    sub_100019824();
  }
  else
  {
    v1 = *(void **)(v0 + 56);
    DisplayRepresentation.Image.init(data:isTemplate:)(*(_QWORD *)(v0 + 72));

  }
  sub_100019870();
  sub_10000CC2C();
  sub_10000CD5C();
  return sub_1000197B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100015DF8()
{
  uint64_t v0;

  sub_100019824();
  sub_100019870();
  sub_10000CC2C();
  sub_10000CD5C();
  return sub_1000197B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100015E3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = v1;
  return swift_task_switch(sub_100015E54, 0, 0);
}

uint64_t sub_100015E54()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  char *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);

  v1 = (char *)v0[5];
  v2 = OBJC_IVAR____TtC15MobileSlideShowP33_930791859ABA27FEF46CC4997DEF78B829PlacesAlbumThumbnailGenerator_lock;
  v0[6] = OBJC_IVAR____TtC15MobileSlideShowP33_930791859ABA27FEF46CC4997DEF78B829PlacesAlbumThumbnailGenerator_lock;
  v3 = *(void **)&v1[v2];
  v4 = v1;
  v5 = v3;
  objc_msgSend(v5, "lock");
  v6 = OBJC_IVAR____TtC15MobileSlideShowP33_930791859ABA27FEF46CC4997DEF78B829PlacesAlbumThumbnailGenerator_cachedThumbnail;
  v0[7] = OBJC_IVAR____TtC15MobileSlideShowP33_930791859ABA27FEF46CC4997DEF78B829PlacesAlbumThumbnailGenerator_cachedThumbnail;
  v7 = *(_QWORD *)&v4[v6 + 8];
  sub_10001987C();
  objc_msgSend(v5, "unlock");

  if (v7 >> 60 == 15)
  {
    v0[8] = objc_msgSend(objc_allocWithZone((Class)PXPlacesAlbumCoverProvider), "initWithDelegate:andPlacesCollection:", v0[5], v0[4]);
    v0[9] = objc_opt_self(UIScreen);
    v0[10] = type metadata accessor for MainActor(0);
    v0[11] = static MainActor.shared.getter();
    v8 = sub_1000199BC();
    return sub_1000197BC((uint64_t)sub_100015F78, v8, v9);
  }
  else
  {
    v11 = sub_100019988();
    return v12(v11);
  }
}

uint64_t sub_100015F78()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 96) = objc_msgSend(*(id *)(v0 + 72), "mainScreen", swift_release(*(_QWORD *)(v0 + 88)).n128_f64[0]);
  sub_10000CC08();
  return sub_10000CB94();
}

uint64_t sub_100015FC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v0 + 104) = static MainActor.shared.getter();
  v1 = sub_1000199BC();
  return sub_1000197BC((uint64_t)sub_10001601C, v1, v2);
}

uint64_t sub_10001601C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;

  v1 = (void *)v0[12];
  objc_msgSend(v1, "scale", swift_release(v0[13]).n128_f64[0]);
  v0[14] = v2;

  sub_10000CC08();
  return sub_10000CB94();
}

uint64_t sub_100016064()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = objc_msgSend(objc_allocWithZone((Class)PXAppIntentsExtendedTraitCollection), "initWithUserInterfaceStyle:displayScale:", 1, *(double *)(v0 + 112));
  *(_QWORD *)(v0 + 120) = v2;
  v3 = swift_task_alloc(32);
  *(_QWORD *)(v0 + 128) = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 136) = v4;
  sub_1000076E0(&qword_10007A118);
  *v4 = v0;
  v4[1] = sub_100016144;
  sub_10000CC08();
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

uint64_t sub_100016144()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 136);
  *(_QWORD *)(*v1 + 144) = v0;
  swift_task_dealloc(v3);
  if (!v0)
    swift_task_dealloc(*(_QWORD *)(v2 + 128));
  sub_10000CC08();
  return sub_1000197BC(v4, v5, v6);
}

void sub_1000161A8()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  char *v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  char *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;

  v1 = (void *)v0[15];
  v2 = (void *)v0[8];
  v3 = (char *)v0[5];
  v4 = (uint64_t *)&v3[v0[7]];
  v6 = v0[2];
  v5 = v0[3];
  v7 = *(void **)&v3[v0[6]];
  v8 = v3;
  sub_10001987C();
  v9 = v7;
  objc_msgSend(v9, "lock");
  v10 = *v4;
  v11 = v4[1];
  *v4 = v6;
  v4[1] = v5;
  sub_10001987C();
  sub_100018CDC(v10, v11);
  objc_msgSend(v9, "unlock");

  sub_100018CDC(v6, v5);
  sub_100019988();
  sub_1000198A0();
  __asm { BR              X2 }
}

uint64_t sub_100016260()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 120);

  sub_10000CC2C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000162A0(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_1000076E0(&qword_10007A100);
  v3 = __chkstk_darwin(v2);
  v4 = __chkstk_darwin(v3);
  v5 = __chkstk_darwin(v4);
  __chkstk_darwin(v5);
  __asm { BR              X10 }
}

uint64_t sub_100016364()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  ((void (*)(unint64_t, unint64_t))URL.init(string:))(0xD00000000000001FLL, 0x8000000100050FB0);
  v2 = type metadata accessor for URL(0);
  if (sub_10000C914(v1, 1, v2) == 1)
  {
    __break(1u);
    JUMPOUT(0x100016500);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v0, v1, v2);
}

unint64_t sub_100016514(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100069C48, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4)
    return 4;
  else
    return v3;
}

_UNKNOWN **sub_10001655C()
{
  return &off_100069CC8;
}

uint64_t sub_100016568(char a1)
{
  return *(_QWORD *)&aRecents_2[8 * a1];
}

uint64_t sub_100016588(char *a1, char *a2)
{
  return sub_1000147D8(*a1, *a2);
}

Swift::Int sub_100016594()
{
  char *v0;

  return sub_10001659C(*v0);
}

Swift::Int sub_10001659C(char a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  sub_1000165E8((uint64_t)v3, a1);
  return Hasher._finalize()();
}

uint64_t sub_1000165E0(uint64_t a1)
{
  char *v1;

  return sub_1000165E8(a1, *v1);
}

uint64_t sub_1000165E8(uint64_t a1, char a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)&aOneyeara[8 * a2 + 8];
  String.hash(into:)(a1, *(_QWORD *)&aRecents_2[8 * a2], v2);
  return swift_bridgeObjectRelease(v2);
}

Swift::Int sub_100016628(uint64_t a1)
{
  char *v1;

  return sub_100016630(a1, *v1);
}

Swift::Int sub_100016630(uint64_t a1, char a2)
{
  _QWORD v4[9];

  Hasher.init(_seed:)(v4, a1);
  sub_1000165E8((uint64_t)v4, a2);
  return Hasher._finalize()();
}

unint64_t sub_100016670@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100016514(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10001669C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_100016568(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

_UNKNOWN **sub_1000166C4@<X0>(_QWORD *a1@<X8>)
{
  _UNKNOWN **result;

  result = sub_10001655C();
  *a1 = result;
  return result;
}

void sub_1000166E8(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[10];

  sub_1000076E0(&qword_10007A150);
  sub_100007DF4();
  v3 = __chkstk_darwin(v2);
  v14[9] = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v14[8] = (char *)v14 - v6;
  v7 = __chkstk_darwin(v5);
  __chkstk_darwin(v7);
  v8 = type metadata accessor for UUID(0);
  __chkstk_darwin(v8);
  sub_100007E34();
  v9 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v9);
  sub_100007E34();
  v14[0] = v11 - v10;
  v14[1] = v12;
  v14[2] = v13;
  v14[3] = a1;
  v14[6] = 0x80000001000510A0;
  v14[7] = 0x80000001000510D0;
  v14[4] = 0x8000000100051070;
  v14[5] = 0x8000000100051040;
  JUMPOUT(0x100016874);
}

void sub_1000169CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_1000076E0(&qword_10007A1B0);
  sub_100007DF4();
  __chkstk_darwin(v3);
  sub_100007E34();
  v6 = v5 - v4;
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_100007E58();
  type metadata accessor for Locale(0);
  sub_100007DF4();
  __chkstk_darwin(v9);
  sub_100007E34();
  v12 = v11 - v10;
  type metadata accessor for String.LocalizationValue(0);
  sub_100007DF4();
  __chkstk_darwin(v13);
  v14 = sub_10001983C();
  type metadata accessor for LocalizedStringResource(v14);
  sub_100007DF4();
  __chkstk_darwin(v15);
  sub_100019888();
  v16 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x80000001000511B0);
  static Locale.current.getter(v16);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v0, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v1, 0x6E65746E49707041, 0xEA00000000007374, v12, v0, 0, 0, 256);
  sub_100019920(v6, 1);
  TypeDisplayRepresentation.init(name:numericFormat:)(v2, v6);
  sub_10000EFAC();
}

void sub_100016B40(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  Class isa;
  id v19;
  void *v20;
  void *v21;
  Swift::String v22;
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = a1;
  sub_1000076E0(&qword_10007A108);
  sub_100007DF4();
  __chkstk_darwin(v4);
  sub_100007E58();
  sub_1000076E0(&qword_10007A1B0);
  sub_100007DF4();
  __chkstk_darwin(v5);
  sub_100007E34();
  v8 = v7 - v6;
  v9 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v9);
  v10 = sub_10001983C();
  type metadata accessor for String.LocalizationValue.StringInterpolation(v10);
  sub_100007DF4();
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v30 = type metadata accessor for CollectionEntity(0);
  v15 = v1;
  v16 = v1 + *(int *)(v30 + 24);
  if ((*(_BYTE *)(v16 + 8) & 1) != 0 || *(uint64_t *)v16 < 1)
  {
    sub_100019858();
    sub_1000198CC();
    sub_100019970();
    sub_1000198BC();
    sub_1000198DC();
    sub_100019864();
    sub_100019964();
    v24 = v8;
    v25 = 1;
  }
  else
  {
    v17 = (void *)objc_opt_self(NSNumberFormatter);
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    v19 = objc_msgSend(v17, "localizedStringFromNumber:numberStyle:", isa, 1);

    v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
    v21 = v20;

    sub_100019858();
    sub_1000198CC();
    sub_100019970();
    sub_1000198BC();
    sub_1000198DC();
    sub_100019864();
    sub_100019964();
    sub_100019858();
    v22._countAndFlagsBits = 0;
    v22._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v22);
    v23._countAndFlagsBits = v29;
    v23._object = v21;
    String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v23);
    swift_bridgeObjectRelease(v21);
    sub_100019864();
    LocalizedStringResource.init(stringInterpolation:)(v14);
    v24 = v8;
    v25 = 0;
  }
  sub_100019920(v24, v25);
  v26 = v15 + *(int *)(v30 + 20);
  v27 = sub_10001980C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v2, v26, v27);
  sub_100007720(v2, 0, 1, v27);
  DisplayRepresentation.init(title:subtitle:image:)(v3, v8, v2);
  sub_10000EFAC();
}

uint64_t sub_100016DA0()
{
  return sub_100014728(&qword_100079F18, type metadata accessor for CollectionEntity);
}

uint64_t sub_100016DCC()
{
  return sub_100014728((unint64_t *)&unk_100079F20, type metadata accessor for CollectionEntity);
}

uint64_t sub_100016DF8()
{
  return sub_100014728((unint64_t *)&qword_1000799A8, type metadata accessor for CollectionEntity);
}

uint64_t sub_100016E24()
{
  return sub_100014728(&qword_100079F30, type metadata accessor for CollectionEntity);
}

uint64_t sub_100016E50()
{
  return sub_100014728(&qword_100079F38, (uint64_t (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t sub_100016E7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_100016EBC()
{
  return sub_100019718(&qword_100079F40, &qword_100079F48);
}

uint64_t sub_100016EE8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100014728(qword_100079F70, type metadata accessor for CollectionEntity);
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_100016F38()
{
  return sub_100014728((unint64_t *)&unk_100079F50, type metadata accessor for CollectionEntity);
}

uint64_t sub_100016F68(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100014728(&qword_100079F30, type metadata accessor for CollectionEntity);
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100016FB8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return sub_1000197A4((uint64_t)sub_100016FC8);
}

uint64_t sub_100016FC8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  *(_QWORD *)(v0 + 24) = -[PhotosApplication px_photoLibrary]_0();
  v1 = (_QWORD *)swift_task_alloc(dword_10007A0EC);
  *(_QWORD *)(v0 + 32) = v1;
  v2 = sub_1000198F4(v1, (uint64_t)sub_100017014);
  return sub_100019798(v2);
}

uint64_t sub_100017014()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100019814();
  sub_1000197FC();
  *(_QWORD *)(v1 + 40) = v0;
  sub_1000198EC(v2);
  sub_10000CC08();
  return sub_10000CB94();
}

uint64_t sub_100017050()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain(v2);
  v4 = sub_1000170A8(v1, v2);

  return sub_1000197D8(v4, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1000170A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  char v25;
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;

  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000076E0(&qword_10007A150);
  __chkstk_darwin(v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for CollectionEntity(0);
  v36 = *(_QWORD *)(v11 - 8);
  v12 = __chkstk_darwin(v11);
  v30 = (uint64_t)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = __chkstk_darwin(v12);
  v38 = (uint64_t)&v29 - v15;
  v16 = &_swiftEmptyArrayStorage;
  v39 = &_swiftEmptyArrayStorage;
  v35 = *(_QWORD *)(a1 + 16);
  if (v35)
  {
    v17 = 0;
    v33 = a2;
    v34 = a1;
    while (v17 < *(_QWORD *)(a1 + 16))
    {
      v18 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
      v19 = *(_QWORD *)(v36 + 72);
      v37 = v17;
      sub_1000077F8(a1 + v18 + v19 * v17, v38);
      v20 = *(_QWORD *)(a2 + 16);
      if (v20)
      {
        v31 = v19;
        v32 = v18;
        v21 = a2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
        swift_bridgeObjectRetain(a2);
        v22 = *(_QWORD *)(v5 + 72);
        v23 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        while (1)
        {
          v23(v10, v21, v4);
          sub_100007720((uint64_t)v10, 0, 1, v4);
          if (sub_10000C914((uint64_t)v10, 1, v4) == 1)
            break;
          (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
          v24 = sub_100014728(&qword_10007A198, (uint64_t (*)(uint64_t))&type metadata accessor for UUID);
          v25 = dispatch thunk of static Equatable.== infix(_:_:)(v7, v38, v4, v24);
          (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
          if ((v25 & 1) != 0)
          {
            a2 = v33;
            swift_bridgeObjectRelease(v33);
            sub_100018EC0(v38, v30);
            v26 = v39;
            if ((swift_isUniquelyReferenced_nonNull_native(v39) & 1) == 0)
            {
              sub_100019340(0, v26[2] + 1, 1);
              v26 = v39;
            }
            v28 = v26[2];
            v27 = v26[3];
            if (v28 >= v27 >> 1)
            {
              sub_100019340(v27 > 1, v28 + 1, 1);
              v26 = v39;
            }
            v26[2] = v28 + 1;
            result = sub_100018EC0(v30, (uint64_t)v26 + v32 + v28 * v31);
            goto LABEL_18;
          }
          v21 += v22;
          if (!--v20)
            goto LABEL_11;
        }
      }
      else
      {
        swift_bridgeObjectRetain(a2);
LABEL_11:
        sub_100007720((uint64_t)v10, 1, 1, v4);
      }
      a2 = v33;
      swift_bridgeObjectRelease(v33);
      result = sub_100007760(v38);
LABEL_18:
      v17 = v37 + 1;
      a1 = v34;
      if (v37 + 1 == v35)
      {
        v16 = v39;
        goto LABEL_20;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_20:
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a1);
    return (uint64_t)v16;
  }
  return result;
}

uint64_t sub_1000173E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *object;
  Swift::String v20;
  Swift::String v21;
  unint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  Swift::String v34;
  Swift::String v35;
  _QWORD *v36;

  v32 = a2;
  v33 = a3;
  v4 = type metadata accessor for LocalizedStringResource(0);
  v30 = *(_QWORD *)(v4 - 8);
  v31 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CollectionEntity(0);
  v29 = *(_QWORD *)(v7 - 8);
  v8 = __chkstk_darwin(v7);
  v28 = (uint64_t)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = __chkstk_darwin(v8);
  v12 = (char *)&v26 - v11;
  v13 = &_swiftEmptyArrayStorage;
  v36 = &_swiftEmptyArrayStorage;
  v27 = *(_QWORD *)(a1 + 16);
  if (v27)
  {
    v14 = 0;
    while (v14 < *(_QWORD *)(a1 + 16))
    {
      v15 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
      v16 = *(_QWORD *)(v29 + 72);
      v17 = a1;
      sub_1000077F8(a1 + v15 + v16 * v14, (uint64_t)v12);
      v35._countAndFlagsBits = 0;
      v35._object = (void *)0xE000000000000000;
      sub_1000166E8((uint64_t)v6);
      v18 = v31;
      _print_unlocked<A, B>(_:_:)(v6, &v35, v31, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v18);
      object = v35._object;
      v20 = String.lowercased()();
      swift_bridgeObjectRelease(object);
      v35 = v20;
      v21 = String.lowercased()();
      v34 = v21;
      v22 = sub_100019554();
      LOBYTE(object) = StringProtocol.contains<A>(_:)(&v34, &type metadata for String, &type metadata for String, v22, v22);
      swift_bridgeObjectRelease(v20._object);
      swift_bridgeObjectRelease(v21._object);
      if ((object & 1) != 0)
      {
        sub_100018EC0((uint64_t)v12, v28);
        v23 = v36;
        if ((swift_isUniquelyReferenced_nonNull_native(v36) & 1) == 0)
        {
          sub_100019340(0, v23[2] + 1, 1);
          v23 = v36;
        }
        v25 = v23[2];
        v24 = v23[3];
        if (v25 >= v24 >> 1)
        {
          sub_100019340(v24 > 1, v25 + 1, 1);
          v23 = v36;
        }
        v23[2] = v25 + 1;
        result = sub_100018EC0(v28, (uint64_t)v23 + v15 + v25 * v16);
      }
      else
      {
        result = sub_100007760((uint64_t)v12);
      }
      ++v14;
      a1 = v17;
      if (v27 == v14)
      {
        v13 = v36;
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease(v33);
    swift_bridgeObjectRelease(a1);
    return (uint64_t)v13;
  }
  return result;
}

uint64_t sub_100017688()
{
  return sub_1000197A4((uint64_t)sub_100017694);
}

uint64_t sub_100017694()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  *(_QWORD *)(v0 + 16) = -[PhotosApplication px_photoLibrary]_0();
  v1 = (_QWORD *)swift_task_alloc(dword_10007A0EC);
  *(_QWORD *)(v0 + 24) = v1;
  v2 = sub_1000198F4(v1, (uint64_t)sub_1000176E0);
  return sub_100019798(v2);
}

uint64_t sub_1000176E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100019814();
  sub_1000197FC();
  *(_QWORD *)(v1 + 32) = v0;
  sub_1000198EC(v2);
  sub_10000CC08();
  return sub_10000CB94();
}

uint64_t sub_10001771C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 32));
}

uint64_t sub_100017754(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v1[2] = a1;
  v2 = type metadata accessor for DisplayRepresentation.Image(0);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for UUID(0);
  v1[6] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v1[7] = v5;
  v1[8] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for CollectionEntity(0);
  v1[9] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v1[10] = v7;
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[11] = swift_task_alloc(v8);
  v1[12] = swift_task_alloc(v8);
  return swift_task_switch(sub_100017814, 0, 0);
}

uint64_t sub_100017814()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  id v4;
  uint64_t v5;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v0 + 104) = 4;
  v1 = 0;
  while (1)
  {
    *(_QWORD *)(v0 + 112) = v1;
    *(_QWORD *)(v0 + 120) = &_swiftEmptyArrayStorage;
    v2 = *(void **)(v0 + 16);
    v3 = *((_BYTE *)&off_100069CC8 + v1 + 32);
    *(_BYTE *)(v0 + 136) = v3;
    v4 = sub_1000152C4(v2, v3);
    if (v4)
      break;
    v1 = *(_QWORD *)(v0 + 112) + 1;
    if (v1 == *(_QWORD *)(v0 + 104))
    {
      v5 = *(_QWORD *)(v0 + 40);
      swift_task_dealloc(*(_QWORD *)(v0 + 96));
      sub_10000CC2C();
      sub_10000CD5C();
      swift_task_dealloc(v5);
      return (*(uint64_t (**)(void *))(v0 + 8))(&_swiftEmptyArrayStorage);
    }
  }

  sub_100014AC4(v3);
  v7 = (_QWORD *)swift_task_alloc(dword_10007A0F4);
  *(_QWORD *)(v0 + 128) = v7;
  v8 = sub_10001999C(v7);
  return sub_100015AC0(v8, v9, v3);
}

uint64_t sub_10001790C()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 128));
  sub_10000CC08();
  return sub_10000CB94();
}

uint64_t sub_100017954()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;

  v30 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 56);
  v7 = *(_QWORD *)(v0 + 32);
  v8 = *(_QWORD *)(v0 + 40);
  v9 = *(_QWORD *)(v0 + 24);
  sub_1000162A0(*(_BYTE *)(v0 + 136));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v1, v3, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v1 + *(int *)(v4 + 20), v8, v9);
  v10 = v1 + *(int *)(v4 + 24);
  *(_QWORD *)v10 = 0;
  *(_BYTE *)(v10 + 8) = 1;
  sub_1000077F8(v1, v2);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v30);
  v12 = *(_QWORD *)(v0 + 120);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    v12 = sub_100019914(0, *(_QWORD *)(v12 + 16) + 1);
  v14 = *(_QWORD *)(v12 + 16);
  v13 = *(_QWORD *)(v12 + 24);
  if (v14 >= v13 >> 1)
    v12 = sub_100019914(v13 > 1, v14 + 1);
  v15 = *(_QWORD *)(v0 + 88);
  v16 = *(_QWORD *)(v0 + 96);
  v17 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v12 + 16) = v14 + 1;
  sub_100018EC0(v15, v12+ ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))+ *(_QWORD *)(v17 + 72) * v14);
  sub_100007760(v16);
  do
  {
    v18 = *(_QWORD *)(v0 + 112) + 1;
    if (v18 == *(_QWORD *)(v0 + 104))
    {
      v27 = *(_QWORD *)(v0 + 64);
      v28 = *(_QWORD *)(v0 + 40);
      swift_task_dealloc(*(_QWORD *)(v0 + 96));
      sub_10000CD5C();
      swift_task_dealloc(v27);
      swift_task_dealloc(v28);
      sub_1000198A0();
      __asm { BR              X1 }
    }
    *(_QWORD *)(v0 + 112) = v18;
    *(_QWORD *)(v0 + 120) = v12;
    v19 = *(void **)(v0 + 16);
    v20 = *((_BYTE *)&off_100069CC8 + v18 + 32);
    *(_BYTE *)(v0 + 136) = v20;
    v21 = sub_1000152C4(v19, v20);
  }
  while (!v21);

  sub_100014AC4(v20);
  v22 = (_QWORD *)swift_task_alloc(dword_10007A0F4);
  *(_QWORD *)(v0 + 128) = v22;
  sub_10001999C(v22);
  sub_1000198A0();
  return sub_100015AC0(v23, v24, v25);
}

uint64_t sub_100017B34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return sub_1000197A4((uint64_t)sub_100017B44);
}

uint64_t sub_100017B44()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  *(_QWORD *)(v0 + 32) = -[PhotosApplication px_photoLibrary]_0();
  v1 = (_QWORD *)swift_task_alloc(dword_10007A0EC);
  *(_QWORD *)(v0 + 40) = v1;
  v2 = sub_1000198F4(v1, (uint64_t)sub_100017B90);
  return sub_100019798(v2);
}

uint64_t sub_100017B90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100019814();
  sub_1000197FC();
  *(_QWORD *)(v1 + 48) = v0;
  sub_1000198EC(v2);
  sub_10000CC08();
  return sub_10000CB94();
}

uint64_t sub_100017BCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(void **)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain(v2);
  v5 = sub_1000173E4(v1, v4, v2);

  return sub_1000197D8(v5, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100017C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;

  *(_QWORD *)(v3 + 16) = a1;
  v6 = (_QWORD *)swift_task_alloc(dword_10007A1A4);
  *(_QWORD *)(v3 + 24) = v6;
  *v6 = v3;
  v6[1] = sub_100017C84;
  return sub_100017B34(a2, a3);
}

uint64_t sub_100017C84(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 24);
  v6 = *v2;
  swift_task_dealloc(v5);
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v6 + 8))();
}

unint64_t sub_100017CE8()
{
  unint64_t result;

  result = qword_100079F68;
  if (!qword_100079F68)
  {
    result = swift_getWitnessTable(&unk_1000569B4, &type metadata for CollectionQuery);
    atomic_store(result, (unint64_t *)&qword_100079F68);
  }
  return result;
}

uint64_t sub_100017D24()
{
  return sub_100014728(qword_100079F70, type metadata accessor for CollectionEntity);
}

uint64_t sub_100017D50(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10007A194);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_100017D9C;
  return sub_100016FB8(a1);
}

uint64_t sub_100017D9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = sub_10000CBAC();
  if (!v1)
    v4 = a1;
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

uint64_t sub_100017DD4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = (_QWORD *)swift_task_alloc(dword_10007A0E4);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_100019794;
  return sub_100017688();
}

unint64_t sub_100017E20()
{
  unint64_t result;

  result = qword_100079F88;
  if (!qword_100079F88)
  {
    result = swift_getWitnessTable(&unk_1000569DC, &type metadata for CollectionQuery);
    atomic_store(result, (unint64_t *)&qword_100079F88);
  }
  return result;
}

unint64_t sub_100017E60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100079F90;
  if (!qword_100079F90)
  {
    v1 = sub_10000763C(qword_100079F98);
    sub_100014728((unint64_t *)&qword_1000799A8, type metadata accessor for CollectionEntity);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_100079F90);
  }
  return result;
}

uint64_t sub_100017EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100014790();
  *v5 = v2;
  v5[1] = sub_100017F48;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100017F48()
{
  uint64_t v0;

  sub_10000CBAC();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100017F74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to DynamicOptionsProvider.defaultResult()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100017F48;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

void sub_100017FE4(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  uint64_t v18;

  v6 = objc_msgSend(objc_allocWithZone((Class)NSLock), "init");
  v7 = sub_1000076E0(&qword_10007A120);
  v8 = swift_allocBox(v7);
  v10 = v9;
  v11 = sub_1000076E0(&qword_10007A128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v10, a1, v11);
  sub_100007720(v10, 0, 1, v11);
  v12 = objc_msgSend(objc_allocWithZone((Class)UITraitCollection), "init");
  v13 = swift_allocObject(&unk_10006A700, 32, 7);
  *(_QWORD *)(v13 + 16) = v6;
  *(_QWORD *)(v13 + 24) = v8;
  v17[4] = sub_10001929C;
  v18 = v13;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_1000183E0;
  v17[3] = &unk_10006A718;
  v14 = _Block_copy(v17);
  v15 = v18;
  v16 = v6;
  swift_retain(v8);
  objc_msgSend(a2, "requestPlacesAlbumCover:snapshotTraitCollection:completion:", a3, v12, v14, swift_release(v15).n128_f64[0]);
  _Block_release(v14);

  swift_release(v8);
}

id sub_10001815C(void *a1, char a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  UIImage *v22;
  NSData *v23;
  NSData *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  __int128 v29;
  _BYTE v30[24];

  v11 = sub_1000076E0(&qword_10007A120);
  __chkstk_darwin(v11);
  v13 = &v30[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v14 = sub_1000076E0(&qword_10007A128);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = &v30[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v16);
  v20 = &v30[-v19 - 8];
  v21 = swift_projectBox(a6);
  objc_msgSend(a5, "lock");
  if ((a2 & 1) == 0)
  {
    if (a1)
    {
      swift_beginAccess(v21, v30, 0, 0);
      if (!sub_10000C914(v21, 1, v14))
      {
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v15 + 16))(v20, v21, v14);
        v22 = a1;
        v23 = UIImagePNGRepresentation(v22);
        if (v23)
        {
          v24 = v23;
          v25 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v27 = v26;

        }
        else
        {
          v25 = 0;
          v27 = 0xF000000000000000;
        }
        *(_QWORD *)&v29 = v25;
        *((_QWORD *)&v29 + 1) = v27;
        CheckedContinuation.resume(returning:)(&v29, v14);

        (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v20, v14);
      }
      goto LABEL_14;
    }
    if (a4)
    {
      swift_beginAccess(v21, v30, 0, 0);
      if (!sub_10000C914(v21, 1, v14))
      {
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v15 + 16))(v18, v21, v14);
        *(_QWORD *)&v29 = a4;
        swift_errorRetain(a4);
        CheckedContinuation.resume(throwing:)(&v29, v14);
LABEL_11:
        (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v18, v14);
      }
    }
    else
    {
      swift_beginAccess(v21, v30, 0, 0);
      if (!sub_10000C914(v21, 1, v14))
      {
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v15 + 16))(v18, v21, v14);
        v29 = xmmword_100056BA0;
        CheckedContinuation.resume(returning:)(&v29, v14);
        goto LABEL_11;
      }
    }
LABEL_14:
    sub_100007720((uint64_t)v13, 1, 1, v14);
    swift_beginAccess(v21, &v29, 1, 0);
    sub_1000192BC((uint64_t)v13, v21);
  }
  return objc_msgSend(a5, "unlock");
}

void sub_1000183E0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9;
  void (*v10)(void *, uint64_t, uint64_t, void *);
  id v11;
  id v12;

  v10 = *(void (**)(void *, uint64_t, uint64_t, void *))(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  swift_retain(v9);
  v12 = a2;
  v11 = a5;
  v10(a2, a3, a4, a5);
  swift_release(v9);

}

void sub_1000184A0()
{
  char *v0;
  void *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  char *v5;

  v1 = *(void **)&v0[OBJC_IVAR____TtC15MobileSlideShowP33_930791859ABA27FEF46CC4997DEF78B829PlacesAlbumThumbnailGenerator_lock];
  v5 = v0;
  v2 = v1;
  objc_msgSend(v2, "lock");
  v3 = *(_QWORD *)&v5[OBJC_IVAR____TtC15MobileSlideShowP33_930791859ABA27FEF46CC4997DEF78B829PlacesAlbumThumbnailGenerator_cachedThumbnail];
  v4 = *(_QWORD *)&v5[OBJC_IVAR____TtC15MobileSlideShowP33_930791859ABA27FEF46CC4997DEF78B829PlacesAlbumThumbnailGenerator_cachedThumbnail
                    + 8];
  *(_OWORD *)&v5[OBJC_IVAR____TtC15MobileSlideShowP33_930791859ABA27FEF46CC4997DEF78B829PlacesAlbumThumbnailGenerator_cachedThumbnail] = xmmword_100056BA0;
  sub_100018CDC(v3, v4);
  objc_msgSend(v2, "unlock");

}

id sub_100018524()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  id v3;
  char *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  *(_OWORD *)&v0[OBJC_IVAR____TtC15MobileSlideShowP33_930791859ABA27FEF46CC4997DEF78B829PlacesAlbumThumbnailGenerator_cachedThumbnail] = xmmword_100056BA0;
  v2 = OBJC_IVAR____TtC15MobileSlideShowP33_930791859ABA27FEF46CC4997DEF78B829PlacesAlbumThumbnailGenerator_lock;
  v3 = objc_allocWithZone((Class)NSLock);
  v4 = v0;
  *(_QWORD *)&v0[v2] = objc_msgSend(v3, "init");

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return objc_msgSendSuper2(&v6, "init");
}

id sub_1000185DC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PlacesAlbumThumbnailGenerator()
{
  return objc_opt_self(_TtC15MobileSlideShowP33_930791859ABA27FEF46CC4997DEF78B829PlacesAlbumThumbnailGenerator);
}

ValueMetadata *type metadata accessor for CollectionQuery()
{
  return &type metadata for CollectionQuery;
}

uint64_t *sub_10001867C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v19);
  }
  else
  {
    v7 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for DisplayRepresentation.Image(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = a3[7];
    v14 = (char *)a1 + v12;
    v15 = (char *)a2 + v12;
    *(_QWORD *)v14 = *(_QWORD *)v15;
    v14[8] = v15[8];
    v16 = (char *)a1 + v13;
    v17 = (char *)a2 + v13;
    v18 = type metadata accessor for URL(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  }
  return a1;
}

uint64_t sub_100018770(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + *(int *)(a2 + 28);
  v8 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t sub_1000187F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a3[7];
  v13 = a1 + v11;
  v14 = a2 + v11;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  v15 = a1 + v12;
  v16 = a2 + v12;
  v17 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  return a1;
}

uint64_t sub_1000188C0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = *(_BYTE *)(v13 + 8);
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = v14;
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  return a1;
}

uint64_t sub_10001898C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = a3[7];
  v13 = a1 + v11;
  v14 = a2 + v11;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  v15 = a1 + v12;
  v16 = a2 + v12;
  v17 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

uint64_t sub_100018A54(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a3[7];
  v13 = a1 + v11;
  v14 = a2 + v11;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  v15 = a1 + v12;
  v16 = a2 + v12;
  v17 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v15, v16, v17);
  return a1;
}

uint64_t sub_100018B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100018B28);
}

uint64_t sub_100018B28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_100019904();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    v9 = sub_10001980C();
    if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)v3)
    {
      v7 = v9;
      v10 = *(int *)(a3 + 20);
    }
    else
    {
      v7 = type metadata accessor for URL(0);
      v10 = *(int *)(a3 + 28);
    }
    v8 = v4 + v10;
  }
  return sub_10000C914(v8, v3, v7);
}

uint64_t sub_100018BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100018BB0);
}

uint64_t sub_100018BB0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = sub_100019904();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    v11 = sub_10001980C();
    if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
    {
      v9 = v11;
      v12 = *(int *)(a4 + 20);
    }
    else
    {
      v9 = type metadata accessor for URL(0);
      v12 = *(int *)(a4 + 28);
    }
    v10 = v5 + v12;
  }
  return sub_100007720(v10, v4, v4, v9);
}

uint64_t sub_100018C34(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD v6[4];

  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for DisplayRepresentation.Image(319);
    if (v4 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(result - 8) + 64;
      v6[2] = "\t";
      result = type metadata accessor for URL(319);
      if (v5 <= 0x3F)
      {
        v6[3] = *(_QWORD *)(result - 8) + 64;
        swift_initStructMetadata(a1, 256, 4, v6, a1 + 16);
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100018CDC(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100012CF4(result, a2);
  return result;
}

uint64_t sub_100018CF0(char a1, int64_t a2, char a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_24:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_26:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000076E0(&qword_10007A0F8);
  v11 = *(_QWORD *)(type metadata accessor for CollectionEntity(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_24;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_26;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CollectionEntity(0) - 8) + 80);
  v19 = (v18 + 32) & ~v18;
  v20 = (unint64_t)v15 + v19;
  if ((a1 & 1) != 0)
  {
    sub_100019024(a4 + v19, v8, v20);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    sub_100018F04(0, v8, v20, a4);
  }
  return (uint64_t)v15;
}

uint64_t sub_100018EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CollectionEntity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100018F04(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = type metadata accessor for CollectionEntity(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = *(_QWORD *)(v9 + 72);
  v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  v13 = v11 * v4;
  v14 = a3 + v13;
  v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3, v12, v4, v8);
    swift_bridgeObjectRelease(a4);
    return v14;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100019024(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  char v8;

  if (a2 < 0)
  {
    v8 = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v8, 1046, 0);
    __break(1u);
  }
  else if (a3 < a1
         || (result = type metadata accessor for CollectionEntity(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    v7 = type metadata accessor for CollectionEntity(0);
    return swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v7);
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront(a3, a1, a2, result);
  }
  return result;
}

uint64_t sub_100019120(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    v6 = type metadata accessor for CollectionEntity(0);
    v7 = *(_QWORD *)(*(_QWORD *)(v6 - 8) + 72) * a2;
    v8 = a3 + v7;
    v9 = a1 + v7;
    if (v8 <= a1 || v9 <= a3)
      return swift_arrayInitWithCopy(a3, a1, a2, v6);
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

uint64_t sub_100019214(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000076E0(&qword_10007A108);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100019254(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100012CB0(result, a2);
  return result;
}

void sub_100019268(uint64_t a1)
{
  uint64_t v1;

  sub_100017FE4(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_100019270()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

id sub_10001929C(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_10001815C(a1, a2, a3, a4, *(void **)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t sub_1000192A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000192B4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000192BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000076E0(&qword_10007A120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_100019304()
{
  unint64_t result;

  result = qword_10007A130;
  if (!qword_10007A130)
  {
    result = swift_getWitnessTable(&unk_100056B04, &type metadata for StaticAlbum);
    atomic_store(result, (unint64_t *)&qword_10007A130);
  }
  return result;
}

size_t sub_100019340(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_10001935C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_10001935C(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000076E0(&qword_10007A0F8);
  v11 = *(_QWORD *)(type metadata accessor for CollectionEntity(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  result = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_24;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  v17 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CollectionEntity(0) - 8) + 80);
  v18 = (v17 + 32) & ~v17;
  v19 = (unint64_t)v15 + v18;
  v20 = a4 + v18;
  if ((v5 & 1) != 0)
  {
    sub_100019024(v20, v8, v19);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100019120(v20, v8, v19);
  }
  swift_release(a4);
  return (size_t)v15;
}

uint64_t sub_10001949C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, char a3@<W2>, void *a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t result;

  result = sub_10001485C(a1, a2, a3 & 1, a4);
  if (!v5)
    *a5 = result;
  return result;
}

unint64_t sub_1000194C8()
{
  unint64_t result;

  result = qword_10007A148;
  if (!qword_10007A148)
  {
    result = swift_getWitnessTable(&unk_100056654, &type metadata for PhotosCollectionEntityCache.CacheCategory);
    atomic_store(result, (unint64_t *)&qword_10007A148);
  }
  return result;
}

unint64_t sub_100019504()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10007A188;
  if (!qword_10007A188)
  {
    v1 = sub_10000C944(255, &qword_10007A180, NSDate_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, &qword_10007A188);
  }
  return result;
}

unint64_t sub_100019554()
{
  unint64_t result;

  result = qword_10007A1A8;
  if (!qword_10007A1A8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10007A1A8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for StaticAlbum(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 3) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for StaticAlbum(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_100019664 + 4 * byte_1000566CD[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100019698 + 4 * byte_1000566C8[v4]))();
}

uint64_t sub_100019698(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000196A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000196A8);
  return result;
}

uint64_t sub_1000196B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000196BCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1000196C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000196C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1000196D4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StaticAlbum()
{
  return &type metadata for StaticAlbum;
}

uint64_t sub_1000196EC()
{
  return sub_100019718(&qword_10007A1B8, &qword_10007A1C0);
}

uint64_t sub_100019718(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000763C(a2);
    result = sub_100007EA4(v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100019754()
{
  unint64_t result;

  result = qword_10007A1C8;
  if (!qword_10007A1C8)
  {
    result = swift_getWitnessTable(&unk_100056ADC, &type metadata for StaticAlbum);
    atomic_store(result, (unint64_t *)&qword_10007A1C8);
  }
  return result;
}

uint64_t sub_100019798(uint64_t a1)
{
  return sub_100017754(a1);
}

uint64_t sub_1000197A4(uint64_t a1)
{
  return swift_task_switch(a1, 0, 0);
}

uint64_t sub_1000197B0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000197BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_task_switch(a1, a2, a3);
}

uint64_t sub_1000197C4(uint64_t a1)
{
  uint64_t v1;

  return sub_10000C914(v1, 1, a1);
}

uint64_t sub_1000197D8(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_1000197EC(uint64_t a1)
{
  return PXDisplayRepresentationImageForAsset(_:badgeName:)(a1, 0, 0);
}

void sub_1000197FC()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t sub_10001980C()
{
  return type metadata accessor for DisplayRepresentation.Image(0);
}

void sub_100019814()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t sub_100019824()
{
  uint64_t v0;

  return DisplayRepresentation.Image.init(systemName:isTemplate:)(0xD000000000000012, (v0 - 32) | 0x8000000000000000, 2);
}

uint64_t sub_10001983C()
{
  return 0;
}

uint64_t sub_100019858()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(0, 1);
}

void sub_100019864()
{
  Swift::String v0;

  v0._countAndFlagsBits = 0;
  v0._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_100019870()
{
  uint64_t v0;

  return swift_task_dealloc(*(_QWORD *)(v0 + 48));
}

uint64_t sub_10001987C()
{
  unint64_t v0;
  uint64_t v1;

  return sub_100019254(v1, v0);
}

uint64_t sub_1000198BC()
{
  uint64_t v0;
  uint64_t v1;

  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:)(v0, v1);
}

void sub_1000198CC()
{
  Swift::String v0;

  v0._countAndFlagsBits = 0;
  v0._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_1000198DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_1000198EC@<X0>(uint64_t a1@<X8>)
{
  return swift_task_dealloc(a1);
}

uint64_t sub_1000198F4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t sub_100019904()
{
  return type metadata accessor for UUID(0);
}

uint64_t sub_100019914(char a1, int64_t a2)
{
  uint64_t v2;

  return sub_100018CF0(a1, a2, 1, v2);
}

uint64_t sub_100019920(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100007720(a1, a2, 1, v2);
}

uint64_t sub_10001992C()
{
  uint64_t v0;
  uint64_t v1;

  return sub_10000C914(v1, 1, v0);
}

uint64_t sub_100019950(uint64_t a1, uint64_t a2)
{
  return sub_100019214(a2);
}

unint64_t sub_100019958()
{
  return 0xD000000000000024;
}

uint64_t sub_100019964()
{
  uint64_t v0;

  return LocalizedStringResource.init(stringInterpolation:)(v0);
}

void sub_100019970()
{
  uint64_t v0;

  sub_1000166E8(v0);
}

uint64_t sub_10001997C(uint64_t a1)
{
  uint64_t v1;

  return sub_10000C914(a1, 1, v1);
}

uint64_t sub_100019988()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10001999C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 40);
}

uint64_t sub_1000199B0()
{
  uint64_t v0;

  return AnyHashable.init<A>(_:)(v0 - 200);
}

uint64_t sub_1000199BC()
{
  uint64_t v0;

  return dispatch thunk of Actor.unownedExecutor.getter(v0);
}

uint64_t sub_1000199C8()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC15MobileSlideShowP33_7FAB6AF36A3D0EC34AFDCB7531A24C3A19ResourceBundleClass);
}

void sub_10001B244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001B7E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001C9B4(uint64_t a1, uint64_t a2)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "actionPerformerForActionType:", a2));
  objc_msgSend(v2, "performActionWithCompletionHandler:", 0);

}

void sub_10001C9EC(id a1)
{
  NSString *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v1 = NSStringFromSelector("internal_wantsLemonadeUI");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  v4 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));
  v5 = (void *)qword_10007C0A0;
  qword_10007C0A0 = v4;

}

void *sub_10001CAA4()
{
  void *v0;
  void *v1;
  void *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_10007C0B8)
  {
    v5 = off_10006AB80;
    v6 = 0;
    qword_10007C0B8 = _sl_dlopen(&v5, &v4);
  }
  v0 = (void *)qword_10007C0B8;
  if (!qword_10007C0B8)
  {
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *SpringBoardServicesLibrary(void)"));
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PhotosWindowSceneDelegate.m"), 88, CFSTR("%s"), v4);

    __break(1u);
    goto LABEL_7;
  }
  v1 = v4;
  if (v4)
LABEL_7:
    free(v1);
  return v0;
}

void sub_10001CBA8(id a1)
{
  exit(0);
}

void sub_10001CBB8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;

  v5 = a3;
  Log = PLSharingGetLog();
  v7 = objc_claimAutoreleasedReturnValue(Log);
  v8 = v7;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v15 = 138543362;
      v16 = v9;
      v10 = "Did open iCloud Link with UUID: %{public}@";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543874;
    v16 = v14;
    v17 = 2048;
    v18 = a2;
    v19 = 2112;
    v20 = v5;
    v10 = "Failed to open iCloud Link with UUID: %{public}@, result: %li, error: %@";
    v11 = v8;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 32;
    goto LABEL_6;
  }

}

void sub_10001CCD8(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_openMomentShareWithURL:", *(_QWORD *)(a1 + 32));

  }
}

void sub_10001CD1C(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  uint64_t (**v8)(_QWORD);
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = PLUIGetLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (a2)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Item provider import suceeded.", buf, 2u);
    }

    if (v8)
    {
      v12 = v8[2](v8);
      v11 = objc_claimAutoreleasedReturnValue(v12);
    }
    else
    {
      v11 = 0;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastObject](v11, "lastObject"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uuid"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stringByAppendingFormat:", CFSTR("&revealassetuuid=%@"), v14));
      v16 = *(void **)(a1 + 40);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v15));
      objc_msgSend(v16, "openRoutingURL:", v17);

    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to import item providers (error: %@)", buf, 0xCu);
  }

}

void sub_10001CEC8(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleFetchedMomentShare:forURL:error:", v7, *(_QWORD *)(a1 + 32), v6);

}

void sub_10001CF34(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;

  v5 = a3;
  Log = PLSharedLibraryGetLog();
  v7 = objc_claimAutoreleasedReturnValue(Log);
  v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v15 = 138412290;
      v16 = v9;
      v10 = "Did open Shared Library invitation with URL: %@";
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = 138412546;
    v16 = v14;
    v17 = 2112;
    v18 = v5;
    v10 = "Failed to open Shared Library invitation with URL: %@, error: %@";
    v11 = v8;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 22;
    goto LABEL_6;
  }

}

void sub_10001D044(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;

  v5 = a3;
  v6 = PLUIGetLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "publicDescription"));
    v20 = 138413058;
    v21 = v8;
    v22 = 2114;
    v23 = v9;
    v24 = 2048;
    v25 = a2;
    v26 = 2112;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "OpenRoutingURL completion handler for %@ (%{public}@): result=%ti error=%@", (uint8_t *)&v20, 0x2Au);

  }
  if (a2 == 1)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "libraryViewMode"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "tabbedLibraryViewController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "photoLibrary"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v13));
      if (objc_msgSend(v14, "hasSharedLibraryOrPreview"))
        v15 = -[NSObject integerValue](v11, "integerValue");
      else
        v15 = 0;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "libraryFilterState"));
      objc_msgSend(v19, "setViewMode:", v15);

    }
    if (objc_msgSend(*(id *)(a1 + 40), "assetCollectionSubtype") == (id)1000000201)
      +[PLUserActivityDaemonJob userDidViewSharedLibraryParticipantAssetTrashNotification](PLUserActivityDaemonJob, "userDidViewSharedLibraryParticipantAssetTrashNotification");
  }
  else
  {
    v16 = PLUIGetLog(v10);
    v11 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "publicDescription"));
      v20 = 138413058;
      v21 = v17;
      v22 = 2114;
      v23 = v18;
      v24 = 2048;
      v25 = a2;
      v26 = 2112;
      v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "failed to programmatically navigate to %@ (%{public}@): result=%ti error=%@", (uint8_t *)&v20, 0x2Au);

    }
  }

}

id sub_10001D288(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInProgressURLNavigationRequest:", 0);
}

id sub_10001D294(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInProgressURLNavigationRequest:", 0);
}

void sub_10001D2A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;

  v5 = a3;
  v6 = PLUIGetLog(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "publicDescription"));
      v11 = 138543362;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Retry succeeeded to programmatically navigate to %{public}@", (uint8_t *)&v11, 0xCu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "publicDescription"));
    v11 = 138543874;
    v12 = v10;
    v13 = 2048;
    v14 = a2;
    v15 = 2112;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Retry failed to programmatically navigate to %{public}@: result=%ti error=%@", (uint8_t *)&v11, 0x20u);

  }
}

void sub_10001D3E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;

  v5 = a3;
  v6 = v5;
  if (a2 != 1)
  {
    v7 = PLUIGetLog(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "publicDescription"));
      v10 = 138543874;
      v11 = v9;
      v12 = 2048;
      v13 = a2;
      v14 = 2112;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "failed to programmatically navigate to %{public}@: result=%ti error=%@", (uint8_t *)&v10, 0x20u);

    }
  }

}

void sub_10001D4D0(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  uint64_t Log;
  uint8_t v11[16];
  _QWORD block[4];
  id v13;
  id v14;

  if (a2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "selectedNavigationController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));
    v5 = objc_opt_class(PUSearchHomeViewController);
    isKindOfClass = objc_opt_isKindOfClass(v4, v5);

    if ((isKindOfClass & 1) == 0)
      v7 = objc_msgSend(v3, "popToRootViewControllerAnimated:", 0);
    v8 = dispatch_time(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D614;
    block[3] = &unk_10006D648;
    v13 = v3;
    v14 = *(id *)(a1 + 40);
    v9 = v3;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    Log = PLPhotosSearchGetLog();
    v9 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Spotlight Search: Failed to navigate to Search tab.", v11, 2u);
    }
  }

}

void sub_10001D614(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t Log;
  NSObject *v5;
  uint8_t v6[16];
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "topViewController"));
  v3 = objc_opt_class(PUSearchHomeViewController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001D71C;
    v7[3] = &unk_10006D648;
    v8 = v2;
    v9 = *(id *)(a1 + 40);
    +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v7);

  }
  else
  {
    Log = PLPhotosSearchGetLog();
    v5 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Spotlight Search: Failed to find Search Home View Controller.", v6, 2u);
    }

  }
}

id sub_10001D71C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "presentSpotlightSearch:", *(_QWORD *)(a1 + 40));
}

void sub_10001D728(id a1)
{
  uint64_t Log;
  NSObject *v2;
  id v3;
  uint8_t v4[16];

  Log = PLAppIntentsGetLog(a1);
  v2 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Perform deferred presentation of PXRetailExperienceManager", v4, 2u);
  }

  v3 = objc_alloc_init((Class)PXRetailExperienceManager);
  objc_msgSend(v3, "presentRetailExperienceView");

}

void sub_10001D7A4(id a1, BOOL a2, NSError *a3)
{
  NSError *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  NSError *v9;

  v3 = a3;
  if (v3)
  {
    v4 = PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "+[PhotosWindowSceneDelegate _showContactsPromptIfNecessary]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s: Error requesting contacts access: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void sub_10001DEA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  _Unwind_Resume(exception_object);
}

void sub_10001E658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1000200D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = PXPeopleErrorKey;
  v6 = a2;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", v5));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10002014C(id a1, id a2)
{
  (*((void (**)(id))a2 + 2))(a2);
}

id sub_100020158(uint64_t a1)
{
  uint64_t Log;
  NSObject *v3;
  uint8_t v5[16];

  Log = PLAppIntentsGetLog(a1);
  v3 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Perform deferred check for App Intents URL navigation to workaround rdar://117412505", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_satisfyAppIntentsURLNavigationPerformerProviderRequestsIfNecessary");
}

void sub_1000201C8(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t Log;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;

  v2 = objc_msgSend(objc_alloc((Class)PXProgrammaticNavigationDestination), "initWithURL:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v2, "type"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "keyRootViewController"));
    if (!v3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PhotosApplication.m"), 1012, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant"));

    }
    v4 = objc_msgSend(v3, "routingOptionsForDestination:", v2);
    if (v4)
    {
      Log = PLAppIntentsGetLog(v4);
      v6 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Will perform App Intents URL navigation request", buf, 2u);
      }

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10002045C;
      v13[3] = &unk_10006AE00;
      v14 = *(id *)(a1 + 48);
      objc_msgSend(v3, "navigateToDestination:options:completionHandler:", v2, 0, v13);
      v7 = v14;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError px_genericErrorWithDebugDescription:](NSError, "px_genericErrorWithDebugDescription:", CFSTR("No routing options for destination")));
      v10 = PLAppIntentsGetLog(v7);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to perform App Intents URL navigation request: %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError px_genericErrorWithDebugDescription:](NSError, "px_genericErrorWithDebugDescription:", CFSTR("No matching destination for URL")));
    v8 = PLAppIntentsGetLog(v3);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to perform App Intents URL navigation request: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_10002045C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  id v14;

  v5 = a3;
  Log = PLAppIntentsGetLog();
  v7 = objc_claimAutoreleasedReturnValue(Log);
  v8 = v7;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      v9 = "Did perform App Intents URL navigation request";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v13 = 138412290;
    v14 = v5;
    v9 = "Failed to perform App Intents URL navigation request: %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 12;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 1);
}

void sub_10002056C(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_nebulaDaemonProxyManager"));

  if (!v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2050000000;
    v5 = (void *)qword_10007C0F8;
    v12 = qword_10007C0F8;
    if (!qword_10007C0F8)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100020684;
      v8[3] = &unk_10006D288;
      v8[4] = &v9;
      sub_100020684((uint64_t)v8);
      v5 = (void *)v10[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v9, 8);
    v4 = objc_alloc_init(v6);
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "_setNebulaDaemonProxyManager:", v4);

  }
  objc_msgSend(v4, "performCrashRecoveryIfNeededForceEndLastTimelapseSession:", *(unsigned __int8 *)(a1 + 40));

}

void sub_10002066C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100020684(uint64_t a1)
{
  uint64_t v2;
  Class result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;

  v8 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v2 = qword_10007C100;
  v12 = qword_10007C100;
  if (!qword_10007C100)
  {
    v13 = off_10006AEC8;
    v2 = _sl_dlopen(&v13, &v8);
    v10[3] = v2;
    qword_10007C100 = v2;
  }
  _Block_object_dispose(&v9, 8);
  if (!v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *CameraUILibrary(void)"));
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PhotosApplication.m"), 114, CFSTR("%s"), v8);

    goto LABEL_10;
  }
  if (v8)
    free(v8);
  result = objc_getClass("CAMNebulaDaemonProxyManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getCAMNebulaDaemonProxyManagerClass(void)_block_invoke"));
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PhotosApplication.m"), 115, CFSTR("Unable to find class %s"), "CAMNebulaDaemonProxyManager");

LABEL_10:
    __break(1u);
  }
  qword_10007C0F8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100020850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100020870(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.apple.photos.nebulad-access-queue", v4);
  v3 = (void *)qword_10007C0D8;
  qword_10007C0D8 = (uint64_t)v2;

}

void sub_1000208C4(uint64_t a1)
{
  +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 5, 0);
  sub_100020908(1, *(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
}

void sub_1000208FC(uint64_t a1)
{
  sub_100020908(0, *(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
}

void sub_100020908(int a1, unint64_t a2, void *a3)
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  if ((uint64_t)a2 >= 1)
  {
    v3 = CFSTR("com.apple.photos.CPAnalytics.exitPrompt30DaysStorageCanceled");
    v4 = CFSTR("com.apple.photos.CPAnalytics.exitPrompt1DayStorageCanceled");
    if (a2 > 1)
      v4 = CFSTR("com.apple.photos.CPAnalytics.exitPrompt7DaysStorageCanceled");
    if (a2 <= 7)
      v3 = v4;
    v5 = CFSTR("com.apple.photos.CPAnalytics.exitPrompt7DaysStorageSettingsSelected");
    if (a2 <= 1)
      v5 = CFSTR("com.apple.photos.CPAnalytics.exitPrompt1DayStorageSettingsSelected");
    if (a2 > 7)
      v5 = CFSTR("com.apple.photos.CPAnalytics.exitPrompt30DaysStorageSettingsSelected");
    if (a1)
      v6 = v5;
    else
      v6 = v3;
    v9 = CPAnalyticsPayloadClassNameKey;
    v10 = a3;
    v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    +[CPAnalytics sendEvent:withPayload:](CPAnalytics, "sendEvent:withPayload:", v6, v8);

  }
}

Class sub_100020A18(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;

  v6 = 0;
  if (!qword_10007C0F0)
  {
    v7 = off_10006AEB0;
    v8 = 0;
    qword_10007C0F0 = _sl_dlopen(&v7, &v6);
  }
  if (!qword_10007C0F0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *PreferencesLibrary(void)"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PhotosApplication.m"), 118, CFSTR("%s"), v6);

    goto LABEL_10;
  }
  if (v6)
    free(v6);
  result = objc_getClass("PSOAuthAccountRedirectURLController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getPSOAuthAccountRedirectURLControllerClass(void)_block_invoke"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PhotosApplication.m"), 119, CFSTR("Unable to find class %s"), "PSOAuthAccountRedirectURLController");

LABEL_10:
    __break(1u);
  }
  qword_10007C0E8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100020BB4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "undoActionsInvalidator"));

  if (!v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationScene"));
    v4 = objc_opt_class(UIWindowScene);
    if (v4 && (objc_opt_isKindOfClass(v3, v4) & 1) != 0)
      v5 = v3;
    else
      v5 = 0;

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyWindow"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "undoManager"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[PXContentPrivacyController privacyControllerForCollection:](PXContentPrivacyController, "privacyControllerForCollection:", *(_QWORD *)(a1 + 40)));
      v9 = objc_msgSend(objc_alloc((Class)PXUndoActionsInvalidator), "initWithUndoManager:privacyController:", v7, v8);
      objc_msgSend(*(id *)(a1 + 32), "setUndoActionsInvalidator:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "undoActionsInvalidator"));
      objc_msgSend(v10, "beginObservingSystemEventsForAutomaticInvalidation");

    }
    else
    {
      v11 = PLUIGetLog(0);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[UndoActionsInvalidator] Unable to get an undo manager for the key window.", v13, 2u);
      }

    }
  }
}

uint64_t sub_100020D18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100020D28(uint64_t a1)
{

}

void sub_100020D30(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication pu_debugCurrentAsset](UIApplication, "pu_debugCurrentAsset"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  v3 = (void *)v2;
  if (v2)
    v4 = (__CFString *)v2;
  else
    v4 = CFSTR("<none>");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v4);

}

void sub_100020D9C(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  id v16;

  v5 = a3;
  if (a2)
  {
    v6 = PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      v8 = "User granted authorization for user notifications";
LABEL_9:
      v11 = v7;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 2;
      goto LABEL_10;
    }
  }
  else
  {
    v9 = PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v7 = v10;
    if (v5)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412290;
        v16 = v5;
        v8 = "Error requesting authorization for user notifications: %@";
        v11 = v7;
        v12 = OS_LOG_TYPE_ERROR;
        v13 = 12;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v8, (uint8_t *)&v15, v13);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      v8 = "User did not grant authorization for user notifications";
      goto LABEL_9;
    }
  }

  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v14);
}

void sub_100020ECC(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;

  v5 = a3;
  if (a2)
  {
    v6 = PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v16 = 138543362;
      v17 = v8;
      v9 = "Succeeded setting failure state on invitation record %{public}@.";
LABEL_9:
      v13 = v7;
      v14 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    v10 = PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue(v10);
    v11 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v11)
      {
        v12 = *(_QWORD *)(a1 + 32);
        v16 = 138543618;
        v17 = v12;
        v18 = 2112;
        v19 = v5;
        v9 = "Failed to set failure state on invitation record %{public}@. Error: %@";
        v13 = v7;
        v14 = 22;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v16, v14);
      }
    }
    else if (v11)
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138543362;
      v17 = v15;
      v9 = "Failed to set failure state on invitation record %{public}@.";
      goto LABEL_9;
    }
  }

}

void sub_100021018(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "px_firstKeyWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1));
  v4 = PLLocalizedFrameworkString(CFSTR("CLOSE"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v5, 1, 0));
  objc_msgSend(v3, "addAction:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedViewController"));

  if (!v8)
  {
    v9 = PLLocalizedFrameworkString(CFSTR("DETAILS_BUTTON_TEXT"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_100021198;
    v17 = &unk_10006AD18;
    v11 = *(id *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 32);
    v18 = v11;
    v19 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v10, 0, &v14));
    objc_msgSend(v3, "addAction:", v13, v14, v15, v16, v17);

  }
  objc_msgSend(v2, "pl_presentViewController:animated:", v3, 1);

}

void sub_100021198(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("photos://album?uuid=%@&show-options=true"), v2));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));
  objc_msgSend(*(id *)(a1 + 40), "navigateToURLDestination:completionHandler:", v3, &stru_10006ACF0);

}

void sub_100021230(id a1, BOOL a2, NSError *a3)
{
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  NSError *v8;

  v4 = a3;
  if (!a2)
  {
    v5 = PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to navigate to shared album details with error %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

void sub_1000212E0(id a1)
{
  +[PXWidgetTimeline requestReloadForAllWidgetTimelines](PXWidgetTimeline, "requestReloadForAllWidgetTimelines");
}

void sub_1000212EC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[6];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002149C;
  v10[3] = &unk_10006AC90;
  v2 = *(_QWORD *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[5] = v2;
  PLDisableCPLIfExited(v10);
  +[PXRemoteDiagnosticsService startServerOnInternalDevicesWithAgentClass:](PXRemoteDiagnosticsService, "startServerOnInternalDevicesWithAgentClass:", objc_opt_class(PUPhotosDiagnosticsAgent));
  +[PURootSettings setupStatusBarInternalSettingsGestureOnInternalDevices](PURootSettings, "setupStatusBarInternalSettingsGestureOnInternalDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PXMediaTypeInfoManager sharedManager](PXMediaTypeInfoManager, "sharedManager"));
  objc_msgSend(v3, "prepareInformationForLookups");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler"));
  objc_msgSend(v4, "scheduleDeferredTaskWithQoS:block:", 0, &stru_10006ACB0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000214F0;
  v9[3] = &unk_10006D620;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "scheduleDeferredTaskWithQoS:block:", 1, v9);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "undoActionsInvalidator"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100021508;
    v8[3] = &unk_10006D620;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "scheduleDeferredTaskWithQoS:block:", 1, v8);

  }
}

id sub_10002146C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "performNebuladCrashRecoveryIfNeededForceEndLastTimelapseSession:", objc_msgSend(*(id *)(a1 + 32), "applicationState") == 0);
}

uint64_t sub_10002149C(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002151C;
  v3[3] = &unk_10006AC68;
  v1 = *(_QWORD *)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = v1;
  return px_dispatch_on_main_queue(v3);
}

id sub_1000214F0(uint64_t a1)
{
  void *v1;

  v1 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
  return _objc_msgSend(v1, "_donateTipsAppPhotosSignals");
}

id sub_100021508(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_beginUndoActionsInvalidator");
}

void sub_100021510(id a1)
{
  +[CPAnalytics activateEventQueue](CPAnalytics, "activateEventQueue");
}

id sub_10002151C(uint64_t a1)
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "_showCloudPhotoLibraryExitPromptIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_showSyncReminderPromptIfNecessary");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002161C;
  v5[3] = &unk_10006AC40;
  v5[4] = *(_QWORD *)(a1 + 32);
  +[PXUserPromptCoordinator schedulePromptWithIdentifier:action:](PXUserPromptCoordinator, "schedulePromptWithIdentifier:action:", CFSTR("WelcomeView"), v5);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021628;
  v4[3] = &unk_10006AC40;
  v4[4] = *(_QWORD *)(a1 + 32);
  +[PXUserPromptCoordinator schedulePromptWithIdentifier:action:](PXUserPromptCoordinator, "schedulePromptWithIdentifier:action:", CFSTR("AppleMusic"), v4);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100021634;
  v3[3] = &unk_10006AC40;
  v3[4] = *(_QWORD *)(a1 + 32);
  +[PXUserPromptCoordinator schedulePromptWithIdentifier:action:](PXUserPromptCoordinator, "schedulePromptWithIdentifier:action:", CFSTR("UserNotifications"), v3);
  return +[PXCloudQuotaUpsellSheetManager presentUpsellSheetIfNecessaryWithActivationOptions:](PXCloudQuotaUpsellSheetManager, "presentUpsellSheetIfNecessaryWithActivationOptions:", *(_QWORD *)(a1 + 40));
}

id sub_10002161C(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_showWelcomeViewControllersIfNecessaryWithCompletion:", a2);
}

id sub_100021628(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_showAppleMusicPromptsIfNecessaryWithCompletion:", a2);
}

id sub_100021634(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_showUserNotificationsPromptIfNecessaryWithCompletion:", a2);
}

id sub_100021640(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "synchronizeWithCompletionHandler:", &stru_10006ABF8);
}

id sub_100021650(uint64_t a1)
{
  uint64_t v2;

  v2 = PXAsynchronousAddDragAndDropFileProviderDomain();
  PXAsynchronousAddBoopFileProviderDomain(v2);

  return objc_msgSend(*(id *)(a1 + 32), "updateShowHiddenAlbumCachedValue");
}

void sub_10002168C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  dispatch_time_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v2 = PXPhotosApplicationURLToOpenWhenLaunchedForTesting();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
    v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("photos://shelf?"));

    if (v6)
    {
      v7 = dispatch_time(0, 5000000000);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100021784;
      v9[3] = &unk_10006D648;
      v9[4] = *(_QWORD *)(a1 + 32);
      v10 = v4;
      dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "photosWindowSceneDelegate"));
      objc_msgSend(v8, "openRoutingURL:", v4);

    }
  }

}

void sub_100021784(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "photosWindowSceneDelegate"));
  objc_msgSend(v2, "openRoutingURL:", *(_QWORD *)(a1 + 40));

}

void sub_1000217C4(id a1)
{
  +[PhotosAppShortcutsProviderWrapper updateAppShortcutParameters](_TtC15MobileSlideShow33PhotosAppShortcutsProviderWrapper, "updateAppShortcutParameters");
}

id sub_100023808(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = PXLocalizedString(CFSTR("DESELECT_ALL_SHORTCUT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v5, 0, "deselectAll:", CFSTR("a"), 1572864, 0));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObject:", v6));

  }
  else
  {
    v7 = v3;
  }

  return v7;
}

id sub_1000238CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = PXFilter(a2, &stru_10006AF80);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v5 = PXLocalizedString(CFSTR("NAVIGATE_TO_AND_START_SEARCH"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v6, 0, "find:", CFSTR("f"), 0x100000, 0));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObject:", v7));

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

BOOL sub_1000239A4(id a1, UIMenuElement *a2)
{
  UIMenuElement *v2;
  uint64_t v3;
  UIMenuElement *v4;
  UIMenuElement *v5;
  BOOL v6;

  v2 = a2;
  v3 = objc_opt_class(UIKeyCommand);
  if (v3 && (objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = v2;

    if (!v4)
    {
      v6 = 1;
      goto LABEL_8;
    }
    v5 = (UIMenuElement *)objc_claimAutoreleasedReturnValue(-[UIMenuElement input](v4, "input"));
    if (-[UIMenuElement isEqualToString:](v5, "isEqualToString:", CFSTR("e")))
      v6 = -[UIMenuElement modifierFlags](v4, "modifierFlags") != (id)0x100000;
    else
      v6 = 1;
  }
  else
  {
    v4 = 0;
    v6 = 1;
    v5 = v2;
  }

LABEL_8:
  return v6;
}

BOOL sub_100023A60(id a1, SEL a2, NSArray *a3)
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100023AB8;
  v4[3] = &unk_10006AF18;
  v4[4] = a2;
  return PXExists(a3, v4) ^ 1;
}

BOOL sub_100023AB8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char isKindOfClass;
  _BOOL8 v6;

  v3 = a2;
  v4 = objc_opt_class(UIKeyCommand);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);
  v6 = 0;
  if (v3 && (isKindOfClass & 1) != 0)
    v6 = objc_msgSend(v3, "action") == *(id *)(a1 + 32);

  return v6;
}

void sub_100024060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100024724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1000259CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100025B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027588(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000277C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000280E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002835C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1000287B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100028A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100028B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100028C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100028D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100028E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100029680(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100029B3C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10002B8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a65;

  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_10002BCC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_10002BF20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002BFE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002C0A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002C1EC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_10002C4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002C5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002C6F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002C808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002CA70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002D92C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_10002E530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10002E6D0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  _QWORD block[5];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "librarySpecificFetchOptions"));

  objc_msgSend(v5, "setIncludeAllPhotosSmartAlbum:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000205, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsInAssetCollection:options:](PHAsset, "fetchAssetsInAssetCollection:options:", v7, v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PXPhotoKitAssetsDataSourceManager dataSourceManagerWithAssets:](PXPhotoKitAssetsDataSourceManager, "dataSourceManagerWithAssets:", v8));
  v10 = objc_msgSend(objc_alloc((Class)PXSectionedSelectionManager), "initWithDataSourceManager:", v9);
  objc_msgSend(v10, "performChanges:", &stru_10006D408);
  v11 = objc_msgSend(objc_alloc((Class)PXPhotoKitAssetActionManager), "initWithSelectionManager:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionPerformerForActionType:", PXAssetActionTypeShare));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PXViewControllerPresenter defaultPresenterWithViewController:](PXViewControllerPresenter, "defaultPresenterWithViewController:", v3));

  objc_msgSend(v12, "setPresentationEnvironment:", v13);
  objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
  objc_msgSend(v12, "performActionWithCompletionHandler:", 0);
  v14 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E8BC;
  block[3] = &unk_10006D620;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_10002E8BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_10002E8C4(id a1, PXMutableSelectionManager *a2)
{
  -[PXMutableSelectionManager selectAllItems](a2, "selectAllItems");
}

id sub_10002E8CC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "applySettings:", *(_QWORD *)(a1 + 40));
}

void sub_10002E8D8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
  v5 = objc_msgSend(objc_alloc((Class)PXCMMMomentsInvitationsDataSourceManager), "initWithPhotoLibrary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataSource"));
  v7 = objc_msgSend(v6, "numberOfItemsInSection:", 0);

  if ((unint64_t)v7 < 0x32)
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Insufficient number of invitations: %lu (should have at least: %lu)"), v7, 50);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationHelper"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002EA70;
    v11[3] = &unk_10006D3A0;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v14 = &v15;
    v11[4] = v9;
    v12 = v10;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v8, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:", 1, 0, v11);

  }
  if (!*((_BYTE *)v16 + 24))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  _Block_object_dispose(&v15, 8);
}

void sub_10002EA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002EA70(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  dispatch_time_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = objc_opt_class(PXGadgetUIViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v5 = dispatch_time(0, 1000000000);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002EB74;
    v9[3] = &unk_10006D378;
    v6 = v3;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v10 = v6;
    v11 = v7;
    v12 = v8;
    v13 = *(id *)(a1 + 48);
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Unexpected gadget type."));
  }

}

void sub_10002EB74(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v2 = *(id *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionView"));
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTestName"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002EC3C;
  v7[3] = &unk_10006D350;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:completionHandler:", v5, v6, v3, 1, v7);

}

uint64_t sub_10002EC3C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_10002EC48(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_retainBlock(*(id *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_10002EC70(uint64_t a1)
{

}

void sub_10002EC78(_QWORD *a1, int a2, unint64_t a3)
{
  dispatch_time_t v4;
  void *v5;
  _QWORD block[5];

  if (a1[6] <= a3)
  {
    v5 = (void *)a1[4];
    if (a2)
      objc_msgSend(v5, "finishedCurrentTest");
    else
      objc_msgSend(v5, "failedCurrentTest");
  }
  else if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v4 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002EF34;
    block[3] = &unk_10006D288;
    block[4] = a1[5];
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_10002ED34(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002EDBC;
  v6[3] = &unk_10006D300;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "_runImportTestCommonInit:navigateToImportTab:completionHandler:", v3, 1, v6);

}

void sub_10002EDBC(uint64_t a1, int a2, void *a3)
{
  id v5;
  dispatch_time_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a3;
  if (a2)
  {
    v6 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002EE9C;
    block[3] = &unk_10006C510;
    v11 = v5;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v12 = v7;
    v13 = v8;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    (*(void (**)(void))(v9 + 16))();
  }

}

void sub_10002EE9C(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002EF14;
  v5[3] = &unk_10006D2D8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "ppt_removeImportDataSourceWithOptions:completionHandler:", 0, v5);

}

uint64_t sub_10002EF14(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
}

uint64_t sub_10002EF34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
}

id sub_10002EF48(uint64_t a1, int a2, void *a3)
{
  uint64_t v3;
  _QWORD v5[5];

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 40), "failedCurrentTest");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002EFB8;
  v5[3] = &unk_10006B218;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a3, "ppt_performThumbnailWithOptions:completionHandler:", v3, v5);
}

id sub_10002EFB8(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishedCurrentTestWithExtraResults:");
  else
    return objc_msgSend(v2, "failedCurrentTestWithFailure:", CFSTR("Thumbnailing failed"));
}

id sub_10002EFD0(uint64_t a1, int a2, void *a3)
{
  uint64_t v3;
  _QWORD v5[5];

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 40), "failedCurrentTest");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002F040;
  v5[3] = &unk_10006B218;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a3, "ppt_performImportToLibraryWithOptions:completionHandler:", v3, v5);
}

id sub_10002F040(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishedCurrentTestWithExtraResults:");
  else
    return objc_msgSend(v2, "failedCurrentTestWithFailure:", CFSTR("Import to library all failed"));
}

id sub_10002F058(uint64_t a1, int a2, void *a3)
{
  uint64_t v3;
  _QWORD v5[5];

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 40), "failedCurrentTest");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002F0C8;
  v5[3] = &unk_10006B218;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a3, "ppt_performDeleteWithOptions:completionHandler:", v3, v5);
}

id sub_10002F0C8(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishedCurrentTestWithExtraResults:");
  else
    return objc_msgSend(v2, "failedCurrentTestWithFailure:", CFSTR("Delete all failed"));
}

void sub_10002F0E0(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "additionalResults"));
  v6 = *(void **)(a1 + 32);
  v7 = (id)v5;
  if (a2)
    objc_msgSend(v6, "finishedCurrentTestWithExtraResults:", v5);
  else
    objc_msgSend(v6, "failedCurrentTestWithFailure:", CFSTR("Content loading failed"));

}

void sub_10002F140(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_tabbedLibraryViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedNavigationController"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentScrollView"));
    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentTestName"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002F238;
    v11[3] = &unk_10006B218;
    v10 = *(_QWORD *)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v9, v10, v7, v11);

  }
  else
  {
    objc_msgSend(v3, "failedCurrentTest");
  }
}

id sub_10002F238(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishedCurrentTest");
  else
    return objc_msgSend(v2, "failedCurrentTestWithFailure:", CFSTR("Scroll failed"));
}

id *sub_10002F250(id *result, char a2)
{
  uint64_t (**v2)(id, uint64_t, id);

  if ((a2 & 1) == 0)
    return (id *)objc_msgSend(result[4], "failedCurrentTestWithFailure:", CFSTR("Missing import test content"));
  v2 = (uint64_t (**)(id, uint64_t, id))result[6];
  if (v2)
    return (id *)v2[2](result[6], 1, result[5]);
  return result;
}

void sub_10002F284(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v2 = objc_alloc((Class)PXDisplayAssetViewPPTPerformer);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v4 = objc_msgSend(v2, "initWithContainerView:delegate:testOptions:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v6 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002F348;
  v7[3] = &unk_10006D1C0;
  v8 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, id, uint64_t, _QWORD *))(v5 + 16))(v5, v4, v6, v7);

}

void sub_10002F348(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    v7 = PLUIGetLog(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "asset view test failed: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);

}

void sub_10002F414(id a1, PXDisplayAssetViewPPTPerformer *a2, NSArray *a3, id a4)
{
  -[PXDisplayAssetViewPPTPerformer runLocalizedTitleTestWithConfigurations:completionHandler:](a2, "runLocalizedTitleTestWithConfigurations:completionHandler:", a3, a4);
}

void sub_10002F41C(id a1, PXDisplayAssetViewPPTPerformer *a2, NSArray *a3, id a4)
{
  -[PXDisplayAssetViewPPTPerformer runScrubbingTestWithConfigurations:completionHandler:](a2, "runScrubbingTestWithConfigurations:completionHandler:", a3, a4);
}

void sub_10002F424(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002F4E0;
  v8[3] = &unk_10006D110;
  v8[4] = v6;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(v6, "_navigateToStoryFeedWithConfiguration:completion:", a2, v8);

}

void sub_10002F4E0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002F5C0;
    v9[3] = &unk_10006D210;
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    v12 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, uint64_t, id, _QWORD *))(v5 + 16))(v5, v6, v7, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Unable to navigate to feed."));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_10002F5C0(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  char v8;

  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002F654;
  v6[3] = &unk_10006D008;
  v6[4] = v3;
  v7 = *(id *)(a1 + 48);
  v8 = a2;
  v5 = v4;
  objc_msgSend(v3, "_dismissStoryFeed:completion:", v5, v6);

}

id sub_10002F654(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return (id)(*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  else
    return objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Unable to dismiss feed."));
}

void sub_10002F67C(id a1, PXStoryPPTPerformer *a2, PXFeedTestElement *a3, id a4)
{
  -[PXStoryPPTPerformer runFeedScrollingTestWithElement:completion:](a2, "runFeedScrollingTestWithElement:completion:", a3, a4);
}

void sub_10002F684(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, id, _QWORD *);
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(objc_alloc((Class)PXMockExtendedTraitCollection), "initWithFormFactor:orientation:visibleChromeElements:", 4, 1, 0);
  v8 = objc_msgSend(objc_alloc((Class)PXStoryViewConfiguration), "initWithConfiguration:extendedTraitCollection:", v6, v7);

  v11 = a1 + 32;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(v11 + 8);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002F778;
  v14[3] = &unk_10006D080;
  v15 = v5;
  v12 = *(void (**)(uint64_t, uint64_t, id, _QWORD *))(v10 + 16);
  v13 = v5;
  v12(v10, v9, v8, v14);

}

uint64_t sub_10002F778(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10002F784(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002F840;
  v8[3] = &unk_10006D030;
  v8[4] = v6;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(v6, "_navigateToStoryPlayerWithConfiguration:completion:", a2, v8);

}

void sub_10002F840(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 56);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10002F920;
    v7[3] = &unk_10006D210;
    v6 = *(_QWORD *)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v9 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, uint64_t, id, _QWORD *))(v5 + 16))(v5, v6, v8, v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Unable to navigate to player."));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_10002F920(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  char v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002F9AC;
  v5[3] = &unk_10006D008;
  v5[4] = v3;
  v6 = *(id *)(a1 + 48);
  v7 = a2;
  objc_msgSend(v3, "_dismissStoryPlayer:animated:completion:", v4, 0, v5);

}

id sub_10002F9AC(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return (id)(*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  else
    return objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Unable to dismiss player."));
}

void sub_10002F9D4(id a1, PXStoryPPTPerformer *a2, PXStoryViewConfiguration *a3, id a4)
{
  -[PXStoryPPTPerformer runTimelineProductionTestWithViewConfiguration:completion:](a2, "runTimelineProductionTestWithViewConfiguration:completion:", a3, a4);
}

void sub_10002F9DC(id a1, PXStoryPPTPerformer *a2, PXStoryViewConfiguration *a3, id a4)
{
  -[PXStoryPPTPerformer runRecipeProductionTestWithViewConfiguration:completion:](a2, "runRecipeProductionTestWithViewConfiguration:completion:", a3, a4);
}

void sub_10002F9E4(id a1, PXStoryPPTPerformer *a2, PXStoryPlayerTestElement *a3, id a4)
{
  -[PXStoryPPTPerformer runExportTestWithElement:completion:](a2, "runExportTestWithElement:completion:", a3, a4);
}

void sub_10002F9EC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002FB38;
  v12[3] = &unk_10006CEC0;
  v4 = *(void **)(a1 + 40);
  v13 = *(id *)(a1 + 32);
  v14 = v4;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002FB68;
  v6[3] = &unk_10006CF38;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 64);
  v11 = v3;
  v5 = v3;
  objc_msgSend(v13, "_navigateToLatestMemoryInForYouWithWillPresentHandler:completionHandler:", v12, v6);

}

id sub_10002FB2C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "finishedTest:", *(_QWORD *)(a1 + 40));
}

id sub_10002FB38(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pu_startedAnimationSubTest:forTest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "pu_startedAnimationSubTest:forTest:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void sub_10002FB68(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v4 = dispatch_time(0, 2000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002FC74;
  v6[3] = &unk_10006CF10;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 64);
  v10 = v3;
  v11 = *(id *)(a1 + 72);
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);

}

void sub_10002FC74(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "pu_startedAnimationSubTest:forTest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "pu_startedAnimationSubTest:forTest:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002FD50;
  v4[3] = &unk_10006CEE8;
  v4[4] = v2;
  v3 = *(_QWORD *)(a1 + 64);
  v5 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 72);
  objc_msgSend(v2, "_dismissStoryPlayer:animated:completion:", v3, 1, v4);

}

void sub_10002FD50(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FDF4;
  block[3] = &unk_10006D620;
  v4 = *(id *)(a1 + 64);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_10002FDF4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "next");
}

void sub_10002FDFC(id a1, PXStoryPPTPerformer *a2, PXStoryPlayerTestElement *a3, id a4)
{
  -[PXStoryPPTPerformer runPlaybackTestWithElement:completion:](a2, "runPlaybackTestWithElement:completion:", a3, a4);
}

void sub_10002FE04(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002FE84;
  v6[3] = &unk_10006CE50;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "runPlaybackStartTestWithElement:completion:", v5, v6);

}

id sub_10002FE84(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002FEE0;
  v4[3] = &unk_10006C038;
  v4[4] = v2;
  return objc_msgSend(v2, "_dismissStoryPlayer:animated:completion:", v1, 0, v4);
}

id sub_10002FEE0(uint64_t a1, char a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
    return objc_msgSend(v2, "finishedCurrentTest");
  else
    return objc_msgSend(v2, "failedCurrentTestWithFailure:", CFSTR("Unable to dismiss player."));
}

void sub_10002FEF8(id a1, PXStoryPPTPerformer *a2, PXStoryPlayerTestElement *a3, id a4)
{
  -[PXStoryPPTPerformer runScrollingWithTestElement:completion:](a2, "runScrollingWithTestElement:completion:", a3, a4);
}

void sub_10002FF00(id a1, PXStoryPPTPerformer *a2, PXStoryPlayerTestElement *a3, id a4)
{
  -[PXStoryPPTPerformer runScrubbingTestWithElement:completion:](a2, "runScrubbingTestWithElement:completion:", a3, a4);
}

void sub_10002FF08(uint64_t a1)
{
  void *v2;
  void *v3;

  sub_100030390();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PUTesterDefaultVideoGenerator");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_10007C140 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getPUTesterDefaultVideoGeneratorClass(void)_block_invoke"));
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PhotosApplication-Testing.m"), 199, CFSTR("Unable to find class %s"), "PUTesterDefaultVideoGenerator");

    __break(1u);
  }
}

void sub_10002FFCC(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;
  id v8;
  __int16 v9;

  v2 = dispatch_time(0, 2000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000301BC;
  v4[3] = &unk_10006CDC8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(_WORD *)(a1 + 72);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);

}

uint64_t sub_1000300A0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000300B0(uint64_t a1)
{

}

void sub_1000300B8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 0));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else if (v6)
  {
    v11 = PLPPTGetLog(v6);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to generate a video %@", (uint8_t *)&v13, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1000301BC(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  __int16 v12;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  v4 = *(_QWORD *)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "gridView"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100030294;
  v8[3] = &unk_10006CDA0;
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  v11 = *(id *)(a1 + 64);
  v12 = *(_WORD *)(a1 + 72);
  objc_msgSend(v2, "ppt_performScrollTest:withOptions:gridView:completionHandler:", v3, v4, v5, v8);

}

void sub_100030294(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;
  __int16 v12;

  v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100030344;
  v8[3] = &unk_10006CD78;
  v11 = a2;
  v6 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v12 = *(_WORD *)(a1 + 56);
  v7 = v5;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v8);

}

id sub_100030344(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "finishedCurrentTestWithExtraResults:", *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(v3, "failedCurrentTest");
  objc_msgSend(*(id *)(a1 + 48), "setEnableInlinePlayback:", *(unsigned __int8 *)(a1 + 57));
  return objc_msgSend(*(id *)(a1 + 48), "setMaxNumberOfPlayingItems:", *(unsigned __int8 *)(a1 + 58));
}

void sub_100030390()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_10007C128)
  {
    v4 = off_10006D450;
    v5 = 0;
    qword_10007C128 = _sl_dlopen(&v4, &v3);
  }
  if (!qword_10007C128)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *PhotosUITesterLibrary(void)"));
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PhotosApplication-Testing.m"), 193, CFSTR("%s"), v3);

    __break(1u);
    goto LABEL_7;
  }
  v0 = v3;
  if (v3)
LABEL_7:
    free(v0);
}

void sub_100030490(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "index")));
  if (!*(_BYTE *)(a1 + 88))
    objc_msgSend(*(id *)(a1 + 40), "setDefaultValuesWithPresetName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "createLayout"));
  v6 = objc_msgSend(objc_alloc((Class)PXGPPTViewController), "initWithLayout:", v5);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100030608;
  v12[3] = &unk_10006CD00;
  v8 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v13 = v4;
  v14 = v7;
  v15 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 72);
  v17 = v6;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 80);
  v20 = v3;
  v9 = v3;
  v10 = v6;
  v11 = v4;
  objc_msgSend(v8, "presentViewController:animated:completion:", v10, 1, v12);

}

id sub_1000305FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTestWithExtraResults:", *(_QWORD *)(a1 + 40));
}

void sub_100030608(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "startedSubTest:forTest:", v2, *(_QWORD *)(a1 + 48));
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 64), "gridView"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003071C;
  v8[3] = &unk_10006CCD8;
  v6 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v2;
  v10 = v6;
  v11 = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 80);
  v13 = *(id *)(a1 + 88);
  v7 = v2;
  objc_msgSend(v3, "ppt_performScrollTest:withOptions:gridView:completionHandler:", &stru_10006E450, v4, v5, v8);

}

void sub_10003071C(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = *(void **)(a1 + 56);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000307FC;
  v10[3] = &unk_10006CCB0;
  v16 = a2;
  v11 = v5;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v15 = v8;
  v9 = v5;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v10);

}

void sub_1000307FC(uint64_t a1)
{
  void *v2;
  void **v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, void *);
  void *v6;
  id v7;
  id v8;

  if (*(_BYTE *)(a1 + 72))
  {
    v3 = _NSConcreteStackBlock;
    v4 = 3221225472;
    v5 = sub_1000308A8;
    v6 = &unk_10006CC88;
    v2 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &v3);
    objc_msgSend(*(id *)(a1 + 56), "next", v3, v4, v5, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "failedCurrentTest");
    _objc_msgSend(*(id *)(a1 + 56), "stop");
  }
}

void sub_1000308A8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sub:%@:%@"), v5, a2));
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);

}

void sub_100030928(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurationDescription"));
  objc_msgSend(*(id *)(a1 + 40), "pu_startedAnimationSubTest:forTest:", v7, *(_QWORD *)(a1 + 48));
  v8 = *(void **)(a1 + 56);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100030E70;
  v14[3] = &unk_10006CB98;
  v15 = *(id *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 64);
  v17 = a2;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100030EBC;
  v11[3] = &unk_10006B110;
  v9 = *(void **)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 40);
  v12 = v7;
  v13 = v9;
  v10 = v7;
  objc_msgSend(v8, "animate:animationRenderingCompletionHandler:proceedHandler:", v14, v11, v6);

}

void sub_100030A40(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100030B30;
  v11[3] = &unk_10006CC38;
  v12 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v5 = *(void **)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v13 = v3;
  v15 = v4;
  v14 = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100030C34;
  v8[3] = &unk_10006D648;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v9 = v6;
  v10 = v7;
  PXIterateAsynchronously(v2, v11, v8);

}

void sub_100030B30(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  void *v5;
  float v6;
  dispatch_time_t v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v4, "index")));
  objc_msgSend(v5, "floatValue");
  LODWORD(v2) = vcvtps_u32_f32(sqrtf(v6));
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfRows:", v2);
  objc_msgSend(*(id *)(a1 + 32), "setNumberOfColumns:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setStyle:", 0);
  v7 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030C98;
  block[3] = &unk_10006CC10;
  v8 = *(void **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v11 = v4;
  v12 = v8;
  v9 = v4;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_100030C34(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100030C90;
  v3[3] = &unk_10006D620;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, v3);
}

id sub_100030C90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_100030C98(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100030D4C;
  v5[3] = &unk_10006CBE8;
  v2 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100030DEC;
  v3[3] = &unk_10006D620;
  v4 = *(id *)(a1 + 32);
  PXIterateAsynchronously(v2, v5, v3);

}

void sub_100030D4C(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void (*v5)(_QWORD *, uint64_t, _QWORD *);
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100030DF4;
  v7[3] = &unk_10006B528;
  v8 = v3;
  v9 = v4;
  v5 = (void (*)(_QWORD *, uint64_t, _QWORD *))v4[2];
  v6 = v3;
  v5(v9, 1, v7);

}

id sub_100030DEC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "next");
}

void sub_100030DF4(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100030E68;
  v2[3] = &unk_10006D620;
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, _QWORD, _QWORD *))(v1 + 16))(v1, 0, v2);

}

id sub_100030E68(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "next");
}

void sub_100030E70(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "createAnimation"));
  objc_msgSend(v2, "setDuration:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setStyle:", *(_QWORD *)(a1 + 48));

}

id sub_100030EBC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_100030ECC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(v9, "mean");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10 * 1000.0));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, CFSTR("editorialLayoutGeneration:mean"));

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("ms"), CFSTR("editorialLayoutGeneration:meanUnits"));
  objc_msgSend(v9, "min");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12 * 1000.0));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, CFSTR("editorialLayoutGeneration:min"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ms (%@)"), v8));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, CFSTR("editorialLayoutGeneration:minUnits"));

  objc_msgSend(v9, "max");
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16 * 1000.0));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v17, CFSTR("editorialLayoutGeneration:max"));

  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ms (%@)"), v7));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, CFSTR("editorialLayoutGeneration:maxUnits"));

}

void sub_100031074(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(v9, "mean");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10 * 1000.0));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, CFSTR("gridLayoutGeneration:mean"));

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("ms"), CFSTR("gridLayoutGeneration:meanUnits"));
  objc_msgSend(v9, "min");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12 * 1000.0));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, CFSTR("gridLayoutGeneration:min"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ms (%@)"), v8));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, CFSTR("gridLayoutGeneration:minUnits"));

  objc_msgSend(v9, "max");
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16 * 1000.0));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v17, CFSTR("gridLayoutGeneration:max"));

  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ms (%@)"), v7));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, CFSTR("gridLayoutGeneration:maxUnits"));

}

id sub_10003121C(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "measurementsDictionaryRepresentation"));
  objc_msgSend(v1, "finishedCurrentTestWithExtraResults:", v2);

  return +[PXPPTLoadingLatencyMeter stopMeasurements](PXPPTLoadingLatencyMeter, "stopMeasurements");
}

id sub_10003125C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("%@"), a2);
}

id sub_100031288(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "setSelectedIndexPaths:", *(_QWORD *)(a1 + 32));
}

void sub_100031294(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "canPlayAutoloop") & 1) == 0)
  {
    if (objc_msgSend(v6, "canPerformEditOperation:", 2))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      if (objc_msgSend(*(id *)(a1 + 32), "count") == *(id *)(a1 + 40))
        *a4 = 1;
    }
  }

}

void sub_100031308(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
  objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", 0);
  v5 = *(void **)(a1 + 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentTestName"));
  objc_msgSend(v5, "startedSubTest:forTest:withMetrics:", CFSTR("GenerateSingleAutoLoop"), v6, &off_100071CB8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100031514;
  v10[3] = &unk_10006CAD0;
  v7 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v4;
  v14 = v3;
  v13 = v7;
  v8 = v3;
  v9 = v4;
  objc_msgSend(v11, "_convertAsset:toVariationType:completionHandler:", v9, 1, v10);

}

void sub_100031418(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("@avg.creationDate.timeIntervalSinceReferenceDate")));
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  v5 = *(void **)(a1 + 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentTestName"));
  v9 = CFSTR("TestedAssetsHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v4));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  objc_msgSend(v5, "finishedTest:extraResults:", v6, v8);

}

void sub_100031514(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentTestName"));
  objc_msgSend(v6, "finishedSubTest:forTest:", CFSTR("GenerateSingleAutoLoop"), v7);

  v8 = *(void **)(a1 + 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentTestName"));
  objc_msgSend(v8, "startedSubTest:forTest:withMetrics:", CFSTR("RevertSingleAutoLoop"), v9, &off_100071CD0);

  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100031650;
  v13[3] = &unk_10006CAA8;
  v13[4] = v10;
  v18 = a2;
  v17 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 40);
  v16 = v5;
  v12 = v5;
  objc_msgSend(v10, "_convertAsset:toVariationType:completionHandler:", v11, 0, v13);

}

void sub_100031650(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  id v15;

  v15 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentTestName"));
  objc_msgSend(v5, "finishedSubTest:forTest:", CFSTR("RevertSingleAutoLoop"), v6);

  if (*(_BYTE *)(a1 + 72))
    v7 = a2 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    if (*(_BYTE *)(a1 + 72))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 56);
    if (a2)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v14 = v13;
    objc_msgSend(v8, "failedCurrentTestWithFailure:", CFSTR("GenerateAutoLoop asset:%@ convertSuccess:%@ with error:%@ revertSuccess:%@ with error:%@"), v9, v11, v12, v14, v15);

  }
  else
  {
    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 40), "count") == 0);
  }

}

void sub_100031760(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void ***v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[3];
  char v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "startedCurrentTest");

  v5 = objc_alloc_init((Class)UIImagePickerController);
  objc_msgSend(v5, "setSourceType:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setMediaTypes:", *(_QWORD *)(a1 + 32));
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100031898;
  v10 = &unk_10006CA30;
  v11 = v13;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v6 = objc_retainBlock(&v7);
  objc_msgSend(v5, "_setPhotoPickerDisplayCompletion:", v6, v7, v8, v9, v10, v11);
  objc_msgSend(v3, "presentViewController:animated:completion:", v5, 1, 0);

  objc_destroyWeak(&v12);
  _Block_object_dispose(v13, 8);

}

void sub_100031878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  id *v15;

  objc_destroyWeak(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_100031898(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "finishedCurrentTest");

  }
}

void sub_1000318E8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "startedCurrentTest");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "viewController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000319D8;
  v6[3] = &unk_10006C9E0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "presentViewController:animated:completion:", v5, 1, v6);

  objc_destroyWeak(&v8);
}

void sub_1000319C4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000319D8(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100031B24;
  v8[3] = &unk_10006C918;
  objc_copyWeak(&v9, v2);
  objc_msgSend(WeakRetained, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v4, CFSTR("PPT_AssetPickerDidFinishSearchQuery"), 1, v8);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ppt_scrollTestViewController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100031B50;
  v6[3] = &unk_10006C9B8;
  objc_copyWeak(&v7, v2);
  objc_msgSend(v5, "ppt_prepareForSearchTest:", v6);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&v9);
}

void sub_100031AFC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100031B24(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishedCurrentTest");

}

void sub_100031B50(uint64_t a1, void *a2)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "startedCurrentTest");

  objc_msgSend(v4, "setText:", CFSTR("a"));
}

void sub_100031BA4(id *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "viewController"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100031C88;
  v5[3] = &unk_10006C968;
  v6 = a1[4];
  objc_copyWeak(&v8, a1 + 6);
  v7 = a1[5];
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, v5);

  objc_destroyWeak(&v8);
}

void sub_100031C74(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100031C88(id *a1)
{
  void *v2;
  dispatch_time_t v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "ppt_scrollTestViewController"));
  objc_msgSend(v2, "ppt_switchToAlbumsTab");
  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031D70;
  block[3] = &unk_10006C968;
  v6 = v2;
  v4 = v2;
  objc_copyWeak(&v8, a1 + 6);
  v7 = a1[5];
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
}

void sub_100031D70(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "childViewControllers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
      v8 = objc_opt_class(PUAlbumsGadgetViewController);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        break;
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    WeakRetained = v7;

    if (!WeakRetained)
      goto LABEL_12;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "collectionView"));
    v11 = objc_loadWeakRetained((id *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentTestName"));
    objc_msgSend(v11, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v12, *(_QWORD *)(a1 + 40), v10, 0);

  }
  else
  {
LABEL_9:

LABEL_12:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "failedCurrentTestWithFailure:", CFSTR("PUAlbumsGadgetViewController not found on image picker for runScrollAssetPickerAlbumsTest"));
  }

}

void sub_100031F0C(id *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "viewController"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100031FF0;
  v5[3] = &unk_10006C968;
  v6 = a1[4];
  objc_copyWeak(&v8, a1 + 6);
  v7 = a1[5];
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, v5);

  objc_destroyWeak(&v8);
}

void sub_100031FDC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100031FF0(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ppt_scrollTestViewController"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "childViewControllers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
      v9 = objc_opt_class(PXPhotosUIViewController);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v8;

    if (!v10)
      goto LABEL_12;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_scrollViewToTestForViewController:", v10));

    v13 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v13, "startedCurrentTest");

    v14 = objc_loadWeakRetained((id *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentTestName"));
    objc_msgSend(v14, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v15, *(_QWORD *)(a1 + 40), v12, 0);

  }
  else
  {
LABEL_9:

LABEL_12:
    v10 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v10, "failedCurrentTestWithFailure:", CFSTR("PXPhotosUIViewController not found on image picker for runScrollAssetPickerTest"));
  }

}

void sub_1000321CC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = objc_alloc_init((Class)UIViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setModalPresentationStyle:", 5);
  v7 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000322F8;
  block[3] = &unk_10006C968;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v11 = v3;
  v12 = v4;
  v8 = v4;
  v9 = v3;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v13);
}

void sub_1000322F8(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "startedCurrentTest");

  v4 = objc_alloc((Class)PHPickerConfiguration);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
  v6 = objc_msgSend(v4, "initWithPhotoLibrary:", v5);

  v7 = objc_msgSend(objc_alloc((Class)PHPickerViewController), "initWithConfiguration:", v6);
  v9 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100032438;
  v11[3] = &unk_10006C968;
  v12 = v8;
  v10 = v7;
  v13 = v10;
  objc_copyWeak(&v14, v2);
  objc_msgSend(v9, "presentViewController:animated:completion:", v12, 0, v11);
  objc_destroyWeak(&v14);

}

void sub_100032424(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100032438(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 0, 0);
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003251C;
  v5[3] = &unk_10006C918;
  objc_copyWeak(&v6, v2);
  objc_msgSend(WeakRetained, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v4, CFSTR("PPT_PickerFinishedLoading"), 1, v5);

  objc_destroyWeak(&v6);
}

void sub_100032508(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003251C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishedCurrentTest");

}

id sub_100032548(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000325A0;
  v3[3] = &unk_10006D620;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "ppt_prepareZeroKeywordRequest:", v3);
}

void sub_1000325A0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100032738;
  v13[3] = &unk_10006C8A0;
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v3, CFSTR("PPT_ZeroKeywordRequestBegan"), 1, v13);

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100032798;
  v12[3] = &unk_10006C8A0;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v5, CFSTR("PPT_ZeroKeywordRequestFinished"), 1, v12);

  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000327E4;
  v11[3] = &unk_10006C8A0;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v7, CFSTR("PPT_ZeroKeywordDataSourceSetupBegan"), 1, v11);

  v8 = *(void **)(a1 + 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100032838;
  v10[3] = &unk_10006C8A0;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v9, CFSTR("PPT_ZeroKeywordDataSourceSetupFinished"), 1, v10);

}

void sub_100032738(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "startedSubTest:forTest:withMetrics:", CFSTR("ZeroKeywordRequest"), v3, &off_100071C88);

}

void sub_100032798(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "finishedSubTest:forTest:", CFSTR("ZeroKeywordRequest"), v2);

}

void sub_1000327E4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "startedSubTest:forTest:withMetrics:", CFSTR("DataSourceSetup"), v2, &off_100071CA0);

}

id sub_100032838(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "finishedSubTest:forTest:", CFSTR("DataSourceSetup"), v3);

  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

id sub_10003288C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
}

id sub_100032894(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

id sub_10003289C(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000328F4;
  v3[3] = &unk_10006C8C8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "ppt_prepareForSearchTest:", v3);
}

void sub_1000328F4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000329BC;
  v6[3] = &unk_10006C8A0;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v5, CFSTR("PPT_SearchResultsDidFinishSearchQuery"), 1, v6);

  objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
  objc_msgSend(v4, "setText:", CFSTR("a"));
  objc_msgSend(v4, "becomeFirstResponder");

}

id sub_1000329BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_1000329C4(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032A6C;
  block[3] = &unk_10006C680;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_100032A6C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char isKindOfClass;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_opt_class(PXPeopleCollectionViewController);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);
  v5 = *(void **)(a1 + 40);
  if ((isKindOfClass & 1) == 0)
    return objc_msgSend(v5, "failedCurrentTestWithFailure:", CFSTR("People view controller is not of type PXPeopleCollectionViewController."));
  objc_msgSend(v5, "startedCurrentTest");
  objc_msgSend(*(id *)(a1 + 32), "setPeopleHomeSortingType:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "finishedCurrentTest");
}

void sub_100032AD8(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9[2];

  v3 = a2;
  v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032E38;
  block[3] = &unk_10006C7B0;
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9[1] = v5;
  v6 = v3;
  objc_copyWeak(v9, (id *)(a1 + 32));
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v9);

}

void sub_100032BA0(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10[2];

  v3 = a2;
  v4 = dispatch_time(0, 2000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100032C7C;
  v7[3] = &unk_10006C828;
  v5 = *(void **)(a1 + 48);
  v8 = v3;
  v10[1] = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v3;
  objc_copyWeak(v10, (id *)(a1 + 40));
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v7);
  objc_destroyWeak(v10);

}

void sub_100032C7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_opt_class(PXPeopleCollectionViewController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 56) != 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ppt_indexPathsForPeopleThatCanChangeToType:", v5));
    if (objc_msgSend(v6, "count"))
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100032DE8;
      v8[3] = &unk_10006C800;
      v10 = *(id *)(a1 + 40);
      v9 = v4;
      objc_copyWeak(&v11, (id *)(a1 + 48));
      objc_msgSend(v9, "ppt_changeIndexPaths:toType:withCompletion:", v6, v5, v8);
      objc_destroyWeak(&v11);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "failedCurrentTestWithFailure:", CFSTR("The people view controller is not of type PXPeopleCollectionViewController."));

  }
}

void sub_100032DD4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100032DE8(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "failedCurrentTestWithFailure:", CFSTR("Couldn't prep the test."));

  }
}

void sub_100032E38(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ppt_indexPathsForPeopleThatCanChangeToType:", *(_QWORD *)(a1 + 48)));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "startedCurrentTest");

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100032F14;
  v6[3] = &unk_10006C788;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  objc_msgSend(v4, "ppt_changeIndexPaths:toType:withCompletion:", v2, v5, v6);
  objc_destroyWeak(&v7);

}

void sub_100032F00(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100032F14(uint64_t a1, int a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "finishedCurrentTest");
  else
    objc_msgSend(WeakRetained, "failedCurrentTestWithFailure:", CFSTR("Couldn't change index paths to the test type."));

}

void sub_100032F60(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = dispatch_time(0, 2000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100033020;
  v6[3] = &unk_10006C9E0;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(&v8);

}

void sub_100033020(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  unsigned int v8;
  id v9;
  const __CFString *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_opt_class(PXPeopleCollectionViewController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v11 = *(id *)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ppt_randomPerson"));
    v5 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = WeakRetained;
    if (v4)
    {
      objc_msgSend(WeakRetained, "startedCurrentTest");

      v8 = objc_msgSend(v11, "ppt_namePerson:", v4);
      v9 = objc_loadWeakRetained(v5);
      v7 = v9;
      if (v8)
      {
        objc_msgSend(v9, "finishedCurrentTest");
LABEL_9:

        goto LABEL_10;
      }
      v10 = CFSTR("Error renaming Person.");
    }
    else
    {
      v10 = CFSTR("Was not able to find a random Person.");
    }
    objc_msgSend(v7, "failedCurrentTestWithFailure:", v10);
    goto LABEL_9;
  }
  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v11, "failedCurrentTestWithFailure:", CFSTR("The people view controller is not of type PXPeopleCollectionViewController."));
LABEL_10:

}

void sub_100033114(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = dispatch_time(0, 2000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000331D4;
  v6[3] = &unk_10006C9E0;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(&v8);

}

void sub_1000331D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  id v12;
  id WeakRetained;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_opt_class(PXPeopleCollectionViewController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = *(id *)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ppt_bestPersonForBootstrap"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v5, 0));
      objc_msgSend(v6, "setWantsNaming:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "processName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_Apps/Projects/Photos/Tests/PhotosApplication-Testing.m"), "lastPathComponent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v8, v9, "-[PLPhotosApplication(Testing) runCommitPeopleBootstrapTest:]_block_invoke_2", 3993));
      objc_msgSend(v6, "setCallerInfo:", v10);

      +[PXPeopleUtilities showBootstrapIfNeededWithContext:fromParentVC:force:delegate:](PXPeopleUtilities, "showBootstrapIfNeededWithContext:fromParentVC:force:delegate:", v6, v4, 1, 0);
      v11 = dispatch_time(0, 2000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100033408;
      block[3] = &unk_10006C968;
      v16 = v4;
      v17 = v6;
      v12 = v6;
      objc_copyWeak(&v18, (id *)(a1 + 40));
      dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v18);

    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "failedCurrentTestWithFailure:", CFSTR("Could not find best Person for Bootstrap."));

    }
  }
  else
  {
    v14 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v14, "failedCurrentTestWithFailure:", CFSTR("Top view controller is not of type PXPeopleCollectionViewController."));

  }
}

void sub_100033408(id *a1)
{
  void *v2;
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "presentedViewController"));
  v3 = objc_msgSend(objc_alloc((Class)PXPeopleNameSelection), "initWithName:", CFSTR("TEST_NAME_123"));
  objc_msgSend(a1[5], "setNameSelection:", v3);
  v4 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "startedCurrentTest");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "flowController"));
  v7 = objc_loadWeakRetained(v4);
  objc_msgSend(v6, "done:", v7);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100033530;
  v8[3] = &unk_10006B660;
  objc_copyWeak(&v9, v4);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v8);
  objc_destroyWeak(&v9);

}

void sub_10003351C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100033530(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishedCurrentTest");

}

void sub_10003355C(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = dispatch_time(0, 2000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003361C;
  v6[3] = &unk_10006C9E0;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(&v8);

}

void sub_10003361C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id *v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_opt_class(PXPeopleCollectionViewController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dataSource"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allPersons"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sortedArrayUsingComparator:", &stru_10006C738));
    v6 = objc_msgSend(v5, "count");
    if ((unint64_t)v6 >= 5)
      v7 = 5;
    else
      v7 = (uint64_t)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subarrayWithRange:", 0, v7));
    v9 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained(v9);
    objc_msgSend(WeakRetained, "startedCurrentTest");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    +[PXPeopleUtilities mergePersons:withPerson:](PXPeopleUtilities, "mergePersons:withPerson:", v8, v11);

    v12 = objc_loadWeakRetained(v9);
    objc_msgSend(v12, "finishedCurrentTest");

  }
  else
  {
    v13 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v13, "failedCurrentTestWithFailure:", CFSTR("People view controller is not of type PXPeopleCollectionViewController."));
  }

}

int64_t sub_10003374C(id a1, PHPerson *a2, PHPerson *a3)
{
  PHPerson *v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = -[PHPerson faceCount](a2, "faceCount");
  v6 = -[PHPerson faceCount](v4, "faceCount");

  return (uint64_t)v5 < (uint64_t)v6;
}

void sub_10003379C(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = dispatch_time(0, 2000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100033840;
  v7[3] = &unk_10006D648;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v7);

}

void sub_100033840(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ppt_indexPathOfPersonWithMostAssets"));
  v3 = *(void **)(a1 + 40);
  v4 = (id)v2;
  if (v2)
  {
    objc_msgSend(v3, "startedCurrentTest");
    objc_msgSend(*(id *)(a1 + 32), "showDetailsForMemberAtIndexPath:", v4);
    objc_msgSend(*(id *)(a1 + 40), "finishedCurrentTest");
  }
  else
  {
    objc_msgSend(v3, "failedCurrentTestWithFailure:", CFSTR("Could not find Person with most assets."));
  }

}

void sub_1000338AC(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = dispatch_time(0, 2000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100033950;
  v6[3] = &unk_10006D648;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);

}

void sub_100033950(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  _QWORD block[4];
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_opt_class(PXPeopleCollectionViewController);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    v4 = *(id *)(a1 + 40);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "librarySpecificFetchOptions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHPerson fetchPersonsWithOptions:](PHPerson, "fetchPersonsWithOptions:", v6));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PXPeopleBootstrapContext contextWithPerson:type:](PXPeopleBootstrapContext, "contextWithPerson:type:", v8, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/Library/Caches/com.apple.xbs/Sources/Photos_Apps/Projects/Photos/Tests/PhotosApplication-Testing.m"), "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%s:%d"), v11, v12, "-[PLPhotosApplication(Testing) runLoadPeopleBootstrapTest:]_block_invoke_2", 3930));
    objc_msgSend(v9, "setCallerInfo:", v13);

    +[PXPeopleUtilities showBootstrapIfNeededWithContext:fromParentVC:](PXPeopleUtilities, "showBootstrapIfNeededWithContext:fromParentVC:", v9, v4);
    v14 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100033B54;
    block[3] = &unk_10006D620;
    v16 = *(id *)(a1 + 40);
    dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);
    objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");

  }
}

void sub_100033B54(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedViewController"));
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 0, 0);

}

void sub_100033B8C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];

  v3 = a2;
  v4 = objc_opt_class(PXPeopleCollectionViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
    objc_msgSend(v5, "setPpt_shouldRunPPTCode:", 1);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100033C50;
    v6[3] = &unk_10006D620;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "setPpt_cellsLoadedCompletionBlock:", v6);

    objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("peopleHomeViewController is not of type PXPeopleCollectionViewController"));
  }

}

id sub_100033C50(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_100033C58(uint64_t a1, void *a2)
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

void sub_100033CE8(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033D94;
  block[3] = &unk_10006C680;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  block[4] = v5;
  v7 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100033D94(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
  v2 = objc_alloc_init((Class)UIImagePickerController);
  objc_msgSend(v2, "setSourceType:", *(_QWORD *)(a1 + 48));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100033E30;
  v4[3] = &unk_10006D648;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v5, "presentViewController:animated:completion:", v2, 0, v4);

}

void sub_100033E30(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100033EA4;
  v5[3] = &unk_10006D648;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "installCACommitCompletionBlock:", v5);

}

id sub_100033EA4(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100033F00;
  v3[3] = &unk_10006D620;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 0, v3);
}

id sub_100033F00(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_100033F08(uint64_t a1)
{
  void *v2;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
  ppt_ResetSyncStatusWithLibrary(1, v2);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033F94;
  block[3] = &unk_10006D620;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100033F94(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_100033F9C(uint64_t a1)
{
  void *v2;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
  ppt_ResetSyncStatusWithLibrary(0, v2);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034028;
  block[3] = &unk_10006D620;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100034028(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_100034030(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PLPhotoLibrary systemPhotoLibrary](PLPhotoLibrary, "systemPhotoLibrary"));
  +[PLManagedAsset createMastersInLibrary:](PLManagedAsset, "createMastersInLibrary:", v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000343B4;
  block[3] = &unk_10006D620;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100034400;
  v29[3] = &unk_10006D620;
  v3 = v2;
  v30 = v3;
  objc_msgSend(v3, "performBlockAndWait:completionHandler:", v29, &stru_10006C5F8);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100034508;
  v28[3] = &unk_10006D620;
  v28[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v28);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100034554;
  v26[3] = &unk_10006D620;
  v4 = v3;
  v27 = v4;
  objc_msgSend(v4, "performBlockAndWait:completionHandler:", v26, &stru_10006C618);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100034574;
  v25[3] = &unk_10006D620;
  v25[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v25);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000345C0;
  v24[3] = &unk_10006D620;
  v24[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v24);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003460C;
  v22[3] = &unk_10006D620;
  v5 = v4;
  v23 = v5;
  objc_msgSend(v5, "performBlockAndWait:completionHandler:", v22, &stru_10006C638);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003462C;
  v21[3] = &unk_10006D620;
  v21[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v21);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100034678;
  v20[3] = &unk_10006D620;
  v20[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000346C4;
  v18[3] = &unk_10006D620;
  v6 = v5;
  v19 = v6;
  objc_msgSend(v6, "performBlockAndWait:completionHandler:", v18, &stru_10006C658);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000346E4;
  v17[3] = &unk_10006D620;
  v17[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100034730;
  v16[3] = &unk_10006D620;
  v16[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  do
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003477C;
    v9[3] = &unk_10006D538;
    v7 = v6;
    v10 = v7;
    v11 = &v12;
    objc_msgSend(v7, "performTransactionAndWait:", v9);

  }
  while (!*((_BYTE *)v13 + 24));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000348F0;
  v8[3] = &unk_10006D620;
  v8[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  _Block_object_dispose(&v12, 8);
}

void sub_10003439C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000343B4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "finishedSubTest:forTest:", CFSTR("createMaster"), v2);

}

void sub_100034400(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PLGenericAlbum albumsToUploadInitiallyInLibrary:limit:](PLGenericAlbum, "albumsToUploadInitiallyInLibrary:limit:", *(_QWORD *)(a1 + 32), 50));
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void sub_100034508(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "startedSubTest:forTest:", CFSTR("estimatedLibrarySizeCalculation"), v2);

}

id sub_100034554(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "estimatedLibrarySizes");
}

void sub_100034574(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "finishedSubTest:forTest:", CFSTR("estimatedLibrarySizeCalculation"), v2);

}

void sub_1000345C0(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "startedSubTest:forTest:", CFSTR("originalPhotosAndPurgableLibrarySize"), v2);

}

id sub_10003460C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "librarySizesFromDB");
}

void sub_10003462C(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "finishedSubTest:forTest:", CFSTR("originalPhotosAndPurgableLibrarySize"), v2);

}

void sub_100034678(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "startedSubTest:forTest:", CFSTR("purgeableSharedStreamsSize"), v2);

}

id sub_1000346C4(uint64_t a1)
{
  return +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:](PLDiskSpaceManagement, "performCloudSharingSpaceManagementWithBytesToPurge:shouldFreeSpace:shouldKeepRecentlyViewedAssets:fromPhotoLibrary:", 0, 0, 0, *(_QWORD *)(a1 + 32));
}

void sub_1000346E4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "finishedSubTest:forTest:", CFSTR("purgeableSharedStreamsSize"), v2);

}

void sub_100034730(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "startedSubTest:forTest:", CFSTR("fetchAssets"), v2);

}

void sub_10003477C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "managedObjectContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PLManagedAsset assetsToUploadInitiallyInManagedObjectContext:limit:](PLManagedAsset, "assetsToUploadInitiallyInManagedObjectContext:limit:", v2, 50));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "incrementUploadAttempts", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v9, "setLastUploadAttemptDate:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "count") == 0;
}

id sub_1000348F0(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "finishedSubTest:forTest:", CFSTR("fetchAssets"), v3);

  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_100034954(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  dispatch_time_t v20;
  id v21;
  _QWORD block[5];
  id v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)));
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(*(_QWORD *)(v5 + 8) + 24);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100034D08;
  v38[3] = &unk_10006C538;
  v7 = *(_QWORD *)(a1 + 104);
  v38[4] = *(_QWORD *)(a1 + 40);
  v41 = v5;
  v42 = v7;
  v43 = v6;
  v44 = *(_QWORD *)(a1 + 112);
  v8 = v3;
  v40 = v8;
  v39 = *(id *)(a1 + 32);
  v9 = objc_retainBlock(v38);
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 1;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v11 = v10;
  v12 = *(void **)(a1 + 40);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentTestName"));
  objc_msgSend(v12, "startedSubTest:forTest:withMetrics:", CFSTR("highQualityImage"), v13, &__NSArray0__struct);

  v14 = *(_QWORD *)(a1 + 136);
  v15 = *(void **)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 56);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100034E70;
  v26[3] = &unk_10006C560;
  v33 = v11;
  v30 = &v34;
  v31 = *(_OWORD *)(a1 + 80);
  v27 = *(id *)(a1 + 64);
  v17 = v9;
  v29 = v17;
  v18 = v4;
  v19 = *(_QWORD *)(a1 + 96);
  v28 = v18;
  v32 = v19;
  objc_msgSend(v15, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v18, v14, v16, v26, *(double *)(a1 + 120), *(double *)(a1 + 128));
  *((_BYTE *)v35 + 24) = 0;
  v20 = dispatch_time(0, 60000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035058;
  block[3] = &unk_10006C588;
  v24 = *(_QWORD *)(a1 + 72);
  v25 = v6;
  block[4] = *(_QWORD *)(a1 + 40);
  v23 = v18;
  v21 = v18;
  dispatch_after(v20, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v34, 8);
}

void sub_100034BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

id sub_100034BE4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v2 < 1)
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v5 = objc_alloc_init((Class)NSMutableDictionary);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)/ *(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("imagePixelSize:mean"));

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[PXPPTLoadingLatencyMeter sharedInstance](PXPPTLoadingLatencyMeter, "sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "measurementsDictionaryRepresentation"));
      objc_msgSend(v5, "addEntriesFromDictionary:", v8);

      +[PXPPTLoadingLatencyMeter stopMeasurements](PXPPTLoadingLatencyMeter, "stopMeasurements");
      objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTestWithExtraResults:", v5);

      return _objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
    }
    v3 = *(void **)(a1 + 32);
    v4 = CFSTR("Unable to get image results for any assets.");
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v10 = v2;
    v4 = CFSTR("%ld images were in the cloud and had to be downloaded, please run the test again.");
  }
  objc_msgSend(v3, "failedCurrentTestWithFailure:", v4, v10);
  return _objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

void sub_100034D08(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("PhotosApplication-Testing.m"), 3656, CFSTR("%s must be called on the main thread"), "-[PLPhotosApplication(Testing) _runRequestImageWithTargetSize:contentMode:options:]_block_invoke_2");

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == *(_QWORD *)(a1 + 72))
  {
    v2 = *(void **)(a1 + 32);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
    objc_msgSend(v2, "finishedSubTest:forTest:", CFSTR("highQualityImage"), v3);

    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 80) * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003509C;
    block[3] = &unk_10006C510;
    v5 = *(id *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v10 = v5;
    v11 = v6;
    v9 = *(id *)(a1 + 40);
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

void sub_100034E70(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  unsigned int v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v5 = a3;
  if (!v21)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", PHImageResultIsInCloudKey));

    v13 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      NSLog(CFSTR("Media in the cloud for asset:%@, downloading."), *(_QWORD *)(a1 + 40));
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      goto LABEL_9;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", PHImageErrorKey));
    NSLog(CFSTR("Got nil image for asset:%@ error:%@"), v13, v20);

LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_9;
  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v7 = v6 - *(double *)(a1 + 88);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", PHImageResultIsDegradedKey));
  v9 = objc_msgSend(v8, "BOOLValue");

  if (!v9)
  {
    objc_msgSend(v21, "size");
    v15 = v14;
    objc_msgSend(v21, "size");
    v17 = v15 * v16;
    objc_msgSend(v21, "scale");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (uint64_t)((double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                               + 24)
                                                                          + v17 * v18);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[PXPPTLoadingLatencyMeter sharedInstance](PXPPTLoadingLatencyMeter, "sharedInstance"));
    objc_msgSend(v19, "reportLatency:forOutputQuality:", 2, v7);

    objc_msgSend(*(id *)(a1 + 32), "setImage:", v21);
    goto LABEL_8;
  }
  v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PXPPTLoadingLatencyMeter sharedInstance](PXPPTLoadingLatencyMeter, "sharedInstance"));
  objc_msgSend(v11, "reportLatency:forOutputQuality:", v10 == 0, v7);

LABEL_9:
}

id *sub_100035058(id *result)
{
  if (*(id *)(*((_QWORD *)result[6] + 1) + 24) == result[7])
    return (id *)objc_msgSend(result[4], "failedCurrentTestWithFailure:", CFSTR("Timeout requesting image for asset:%@"), result[5]);
  return result;
}

uint64_t sub_10003509C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"));
}

uint64_t sub_1000350D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000350E8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_1000350F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100035108(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id sub_100035118(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "ppt_navigateToLatestMemoryWithWillPresentHandler:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void sub_100035124(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000351A0;
  v5[3] = &unk_10006C2B8;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "ppt_navigateToFirstInvitationCMM:withCompleteHandler:", 0, v5);

}

void sub_1000351A0(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035258;
  block[3] = &unk_10006C240;
  v8 = v3;
  v5 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v6 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_100035258(uint64_t a1)
{
  uint64_t v1;

  if (*(_QWORD *)(a1 + 32) && (v1 = *(_QWORD *)(a1 + 48)) != 0)
    return (id)(*(uint64_t (**)(_QWORD))(v1 + 16))(*(_QWORD *)(a1 + 48));
  else
    return objc_msgSend(*(id *)(a1 + 40), "failedCurrentTest");
}

void sub_10003527C(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;
  char v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100035300;
  v5[3] = &unk_10006C470;
  v7 = *(_BYTE *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "ppt_navigateToFirstInvitationCMM:withCompleteHandler:", 1, v5);

}

void sub_100035300(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  dispatch_time_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v4 = objc_opt_class(PXCMMViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "ppt_setSelecting:", *(unsigned __int8 *)(a1 + 48));
  v7 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000353F0;
  block[3] = &unk_10006C240;
  v11 = v6;
  v8 = *(id *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v8;
  v9 = v6;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_1000353F0(uint64_t a1)
{
  uint64_t v1;

  if (*(_QWORD *)(a1 + 32) && (v1 = *(_QWORD *)(a1 + 48)) != 0)
    return (id)(*(uint64_t (**)(_QWORD))(v1 + 16))(*(_QWORD *)(a1 + 48));
  else
    return objc_msgSend(*(id *)(a1 + 40), "failedCurrentTest");
}

void sub_100035414(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  dispatch_time_t v8;
  _QWORD block[6];
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD v16[3];
  char v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = a2;
  if (*(_BYTE *)(a1 + 72))
  {
    v4 = *(void **)(a1 + 32);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100035A0C;
    v20[3] = &unk_10006D4D0;
    v21 = *(id *)(a1 + 48);
    objc_msgSend(v4, "installCACommitCompletionBlock:", v20);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100035A18;
    v18[3] = &unk_10006D4D0;
    v19 = *(id *)(a1 + 56);
    objc_msgSend(v3, "ppt_performBlockAfterNextNavigationAnimation:", v18);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));
  v6 = objc_opt_class(PXPhotosDetailsUIViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v17 = 0;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100035A24;
    v10[3] = &unk_10006C380;
    v15 = v7;
    v14 = v16;
    v11 = *(id *)(a1 + 40);
    v12 = v5;
    v13 = *(id *)(a1 + 64);
    objc_msgSend(v12, "ppt_performBlockAfterAllWidgetLoadingCompletes:", v10);
    v8 = dispatch_time(0, 90000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100035B9C;
    block[3] = &unk_10006D538;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v16;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v16, 8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTest");
  }

}

void sub_100035634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003564C(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  char v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("album")));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("People"));

  if (v3)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000357C8;
    v16[3] = &unk_10006C3F8;
    v4 = *(void **)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 40);
    v18 = v5;
    v16[4] = v6;
    objc_msgSend(v4, "_navigateToPeopleHomeAnimated:withCompletion:", 0, v16);

    v7 = v17;
LABEL_5:

    return;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("album")));

  v9 = *(void **)(a1 + 40);
  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100035898;
    v12[3] = &unk_10006C420;
    v13 = *(id *)(a1 + 48);
    v15 = *(_BYTE *)(a1 + 64);
    v10 = *(id *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 40);
    v14 = v10;
    v12[4] = v11;
    objc_msgSend(v9, "_navigateToAlbumForCurrentTest:", v12);

    v7 = v13;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 40), "failedCurrentTestWithFailure:", CFSTR("Memory details views don't exist anymore"));
}

void sub_1000357C8(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = dispatch_time(0, 2000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003597C;
  v8[3] = &unk_10006C3D0;
  v9 = v3;
  v11 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v10 = v6;
  v7 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v8);

}

void sub_100035898(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_opt_class(PUPhotosGridViewController);
  if ((objc_opt_isKindOfClass(v9, v3) & 1) != 0)
  {
    v4 = v9;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "photosDataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastAssetCollection"));

    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      objc_msgSend(v4, "navigateToPhotosDetailsForAssetCollection:animated:", v6, *(unsigned __int8 *)(a1 + 56));
      v7 = *(_QWORD *)(a1 + 48);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationController"));
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "failedCurrentTest");
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTest");
  }

}

void sub_10003597C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ppt_indexPathOfPersonWithMostAssets"));
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "showDetailsForMemberAtIndexPath:", v4);
    v2 = *(_QWORD *)(a1 + 56);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "failedCurrentTestWithFailure:", CFSTR("Could not find Person with most assets."));
  }

}

uint64_t sub_100035A0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100035A18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100035A24(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  double v4;
  double v5;
  void *v6;
  unsigned int v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  double v13;

  v2 = PLPPTGetLog(a1);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v5 = v4 - *(double *)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Took %0.1fs to load all details view's widgets", buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("discloseWidgets")));
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "ppt_toggleDiscloseWidgets");
  v8 = dispatch_time(0, 2000000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100035BC0;
  v9[3] = &unk_10006B528;
  v11 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);

}

id *sub_100035B9C(id *result)
{
  if (!*(_BYTE *)(*((_QWORD *)result[5] + 1) + 24))
    return (id *)objc_msgSend(result[4], "failedCurrentTestWithFailure:", CFSTR("Details view's widgets took too long to load"));
  return result;
}

uint64_t sub_100035BC0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100035BE0(uint64_t a1, int a2)
{
  dispatch_time_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  if (a2)
  {
    v3 = dispatch_time(0, 1000000000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100035C90;
    v5[3] = &unk_10006B528;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Could not navigate to Search tab"));
  }
}

void sub_100035C90(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_tabbedLibraryViewController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedNavigationController"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topViewController"));
  v4 = objc_opt_class(PUSearchHomeViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Did not get expected PUSearchHomeViewController for topViewController"));
  }

}

void sub_100035D30(uint64_t a1, int a2)
{
  dispatch_time_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  if (a2)
  {
    v3 = dispatch_time(0, 1000000000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100035DE0;
    v5[3] = &unk_10006B528;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Could not navigate to For You tab"));
  }
}

void sub_100035DE0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_tabbedLibraryViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedNavigationController"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
  v4 = objc_opt_class(PXForYouGadgetViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Did not get expected ForYouViewController for topViewController"));

}

void sub_100035E7C(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = objc_opt_class(PXPeopleCollectionViewController);
  if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Failed to navigate to people home"));

}

void sub_100035EEC(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___PXFeedViewController))
  {
    v4 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100035FE8;
    block[3] = &unk_10006B528;
    v8 = *(id *)(a1 + 32);
    v7 = v3;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("not a PXFeedViewController: %@"), v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t sub_100035FE8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void sub_100035FFC(uint64_t a1, int a2)
{
  dispatch_time_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  if (a2)
  {
    v3 = dispatch_time(0, 1000000000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000360AC;
    v5[3] = &unk_10006B528;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Could not navigate to Album tab"));
  }
}

void sub_1000360AC(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_tabbedLibraryViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedNavigationController"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
  v4 = objc_opt_class(PUAlbumsGadgetViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Could not navigate to Album tab"));

}

void sub_100036148(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  dispatch_time_t v7;
  _QWORD block[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "px_descendantViewControllerWithClass:", objc_opt_class(PXCuratedLibraryUIViewController));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v6 = objc_opt_class(PXCuratedLibraryUIViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100036250;
    block[3] = &unk_10006B528;
    v10 = *(id *)(a1 + 40);
    v9 = v5;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Top viewController is not a libraryViewController:%@"), v5);
  }

}

uint64_t sub_100036250(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100036260(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_horizontalAlbumListGadgetForType:fromAlbumsGadgetViewController:", *(_QWORD *)(a1 + 48), v3));
  +[CATransaction begin](CATransaction, "begin");
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100036374;
  v9[3] = &unk_10006C240;
  v10 = v3;
  v5 = *(id *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v6 = v3;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v9);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessoryButtonAction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  ((void (**)(_QWORD, void *, void *))v7)[2](v7, v4, v8);

  +[CATransaction commit](CATransaction, "commit");
}

void sub_100036374(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "topViewController"));

  v3 = objc_opt_class(PUAlbumListViewController);
  if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 40), "failedCurrentTestWithFailure:", CFSTR("Failed to push PUAlbumListViewController onto stack."));

}

void sub_1000363FC(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = dispatch_time(0, 1000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000364C8;
  v8[3] = &unk_10006D378;
  v9 = v3;
  v12 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v8);

}

id sub_1000364C8(uint64_t a1)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
    return (id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v3 = PLPPTGetLog(a1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to navigate to album %@", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 48), "failedCurrentTest");
}

void sub_1000365AC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "navigationController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "presentedViewController"));
  if (v4)
  {
    v5 = objc_opt_class(UINavigationController);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));
    else
      v6 = v4;
    v8 = v6;

    v7 = v8;
  }
  else
  {
    v7 = v10;
  }
  v11 = v7;
  if (*(_BYTE *)(a1 + 48))
  {
    v9 = objc_opt_class(PUOneUpViewController);
    if ((objc_opt_isKindOfClass(v11, v9) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Expected one up view controller, got %@"), v11);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1000366B0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  id v15;

  v3 = a2;
  v4 = objc_opt_class(PUFeedViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = objc_alloc((Class)PXFeedRecentsManager);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary px_deprecated_appPhotoLibrary](PHPhotoLibrary, "px_deprecated_appPhotoLibrary"));
    v7 = objc_msgSend(v5, "initWithPhotoLibrary:count:", v6, 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recentAssets"));
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v3, "navigateToCloudFeedAsset:completion:", v9, *(_QWORD *)(a1 + 40));

    }
    else
    {
      v12 = PLPPTGetLog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "no cloud feed assets found in activity feed", (uint8_t *)&v14, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "failedCurrentTest");
    }

  }
  else
  {
    v10 = PLPPTGetLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "unexpected view controller class %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTest");
  }

}

void sub_100036868(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  unint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  dispatch_time_t v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  __int128 v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  __int128 v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  _QWORD block[4];
  id v80;
  id v81;
  uint8_t v82[16];
  __int128 v83;
  uint8_t buf[16];
  __int128 v85;

  v3 = a2;
  v4 = objc_opt_class(PUPhotosGridViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionListFetchResult"));
    v7 = v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    else
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v18 = (void *)v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetsInAssetCollection:", v8));
    v20 = v19;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastObject"));
    else
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
    v22 = (void *)v21;
    v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("assetMediaType")));
    v24 = v23;
    if (v23)
    {
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        v25 = (unint64_t)objc_msgSend(v20, "count") - 1;
      else
        v25 = 0;
      v27 = objc_msgSend(v22, "mediaType");
      if (v27 != objc_msgSend(v24, "unsignedIntegerValue") && (v25 & 0x8000000000000000) == 0)
      {
        while (v25 < (unint64_t)objc_msgSend(v20, "count"))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", v25));

          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
            --v25;
          else
            ++v25;
          v28 = objc_msgSend(v26, "mediaType");
          if (v28 != objc_msgSend(v24, "unsignedIntegerValue"))
          {
            v22 = v26;
            if ((v25 & 0x8000000000000000) == 0)
              continue;
          }
          goto LABEL_29;
        }
      }
      v26 = v22;
LABEL_29:
      v29 = objc_msgSend(v26, "mediaType");
      v23 = objc_msgSend(v24, "unsignedIntegerValue");
      if (v29 != v23)
      {
        v30 = PLPPTGetLog(v23);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v24;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "no assets with mediaType = %@", buf, 0xCu);
        }

        v23 = objc_msgSend(*(id *)(a1 + 40), "failedCurrentTest");
      }
    }
    else
    {
      v26 = v22;
    }
    if (v26)
    {
      objc_msgSend(v5, "navigateToPhoto:inAssetContainer:animated:", v26, v18, 1);
      v32 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100037270;
      block[3] = &unk_10006B528;
      v81 = *(id *)(a1 + 48);
      v80 = v5;
      dispatch_after(v32, (dispatch_queue_t)&_dispatch_main_q, block);

    }
    else
    {
      v33 = PLPPTGetLog(v23);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "no initial asset to navigate to", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "failedCurrentTest");
    }

    goto LABEL_106;
  }
  v9 = objc_opt_class(PXPhotosUIViewController);
  if ((objc_opt_isKindOfClass(v3, v9) & 1) != 0)
  {
    v5 = v3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentDataSource"));

    if (*(_BYTE *)(a1 + 64))
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastAssetCollection"));
    else
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstAssetCollection"));
    v18 = (void *)v11;
    v35 = objc_alloc((Class)PXAssetCollectionReference);
    v36 = PXSimpleIndexPathNull[1];
    *(_OWORD *)buf = PXSimpleIndexPathNull[0];
    v85 = v36;
    v37 = objc_msgSend(v35, "initWithAssetCollection:keyAssetReference:indexPath:", v18, 0, buf);
    *(_OWORD *)buf = 0u;
    v85 = 0u;
    if (v7)
      objc_msgSend(v7, "indexPathForAssetCollectionReference:", v37);
    *(_OWORD *)v82 = *(_OWORD *)buf;
    v83 = v85;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetsInSectionIndexPath:", v82));
    v39 = v38;
    if (*(_BYTE *)(a1 + 64))
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "lastObject"));
    else
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "firstObject"));
    v43 = (void *)v40;
    v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("assetMediaType")));
    v45 = v44;
    v72 = v37;
    if (v44)
    {
      if (*(_BYTE *)(a1 + 64))
        v46 = (uint64_t)objc_msgSend(v39, "count") - 1;
      else
        v46 = 0;
      v53 = objc_msgSend(v43, "mediaType");
      if (v53 != objc_msgSend(v45, "unsignedIntegerValue") && (v46 & 0x8000000000000000) == 0)
      {
        while (v46 < (uint64_t)objc_msgSend(v39, "count"))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndex:", v46));

          if (*(_BYTE *)(a1 + 64))
            --v46;
          else
            ++v46;
          v54 = objc_msgSend(v47, "mediaType");
          if (v54 != objc_msgSend(v45, "unsignedIntegerValue"))
          {
            v43 = v47;
            if ((v46 & 0x8000000000000000) == 0)
              continue;
          }
          goto LABEL_68;
        }
      }
      v47 = v43;
LABEL_68:
      v55 = objc_msgSend(v47, "mediaType");
      v44 = objc_msgSend(v45, "unsignedIntegerValue");
      if (v55 != v44)
      {
        v56 = PLPPTGetLog(v44);
        v57 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v82 = 138412290;
          *(_QWORD *)&v82[4] = v45;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "no assets with mediaType = %@", v82, 0xCu);
        }

        v44 = objc_msgSend(*(id *)(a1 + 40), "failedCurrentTest");
      }
    }
    else
    {
      v47 = v43;
    }
    if (v47)
    {
      v58 = *(unsigned __int8 *)(a1 + 65);
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_100037280;
      v76[3] = &unk_10006C1C8;
      v78 = *(id *)(a1 + 48);
      v77 = v5;
      objc_msgSend(v77, "ppt_navigateToAsset:inAssetContainer:revealInOneUp:completionHandler:", v47, v18, v58, v76);

LABEL_105:
LABEL_106:

      goto LABEL_107;
    }
    v59 = PLPPTGetLog(v44);
    v60 = objc_claimAutoreleasedReturnValue(v59);
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
LABEL_104:

      objc_msgSend(*(id *)(a1 + 40), "failedCurrentTest");
      goto LABEL_105;
    }
    *(_WORD *)v82 = 0;
LABEL_103:
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "no initial asset to navigate to", v82, 2u);
    goto LABEL_104;
  }
  v12 = objc_msgSend(v3, "px_descendantViewControllerWithClass:", objc_opt_class(PXCuratedLibraryUIViewController));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
  {
    v14 = objc_msgSend(v3, "px_descendantViewControllerWithClass:", objc_opt_class(PXCuratedLibraryUIViewController));
    v5 = (id)objc_claimAutoreleasedReturnValue(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewProvider"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "viewModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentDataSource"));

    if (*(_BYTE *)(a1 + 64))
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastAssetCollection"));
    else
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstAssetCollection"));
    v18 = (void *)v17;
    v48 = objc_alloc((Class)PXAssetCollectionReference);
    v49 = PXSimpleIndexPathNull[1];
    *(_OWORD *)buf = PXSimpleIndexPathNull[0];
    v85 = v49;
    v50 = objc_msgSend(v48, "initWithAssetCollection:keyAssetReference:indexPath:", v18, 0, buf);
    *(_OWORD *)buf = 0u;
    v85 = 0u;
    if (v7)
      objc_msgSend(v7, "indexPathForAssetCollectionReference:", v50);
    *(_OWORD *)v82 = *(_OWORD *)buf;
    v83 = v85;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetsInSectionIndexPath:", v82));
    v39 = v51;
    if (*(_BYTE *)(a1 + 64))
      v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "lastObject"));
    else
      v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "firstObject"));
    v61 = (void *)v52;
    v62 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("assetMediaType")));
    v45 = v62;
    v72 = v50;
    if (v62)
    {
      if (*(_BYTE *)(a1 + 64))
        v63 = (uint64_t)objc_msgSend(v39, "count") - 1;
      else
        v63 = 0;
      v64 = objc_msgSend(v61, "mediaType");
      if (v64 != objc_msgSend(v45, "unsignedIntegerValue") && (v63 & 0x8000000000000000) == 0)
      {
        while (v63 < (uint64_t)objc_msgSend(v39, "count"))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndex:", v63));

          if (*(_BYTE *)(a1 + 64))
            --v63;
          else
            ++v63;
          v65 = objc_msgSend(v47, "mediaType");
          if (v65 != objc_msgSend(v45, "unsignedIntegerValue"))
          {
            v61 = v47;
            if ((v63 & 0x8000000000000000) == 0)
              continue;
          }
          goto LABEL_92;
        }
      }
      v47 = v61;
LABEL_92:
      v66 = objc_msgSend(v47, "mediaType");
      v62 = objc_msgSend(v45, "unsignedIntegerValue");
      if (v66 != v62)
      {
        v67 = ((uint64_t (*)(void))PLPPTGetLog)();
        v68 = objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v82 = 138412290;
          *(_QWORD *)&v82[4] = v45;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "no assets with mediaType = %@", v82, 0xCu);
        }

        v62 = objc_msgSend(*(id *)(a1 + 40), "failedCurrentTest");
      }
    }
    else
    {
      v47 = v61;
    }
    if (v47)
    {
      if (*(_BYTE *)(a1 + 65))
        v69 = 1;
      else
        v69 = 2;
      v70 = objc_msgSend(objc_alloc((Class)PXProgrammaticNavigationDestination), "initWithType:revealMode:asset:assetCollection:", 7, v69, v47, v18);
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_100037290;
      v73[3] = &unk_10006C1C8;
      v75 = *(id *)(a1 + 48);
      v74 = v5;
      objc_msgSend(v74, "navigateToDestination:options:completionHandler:", v70, 2, v73);

      goto LABEL_105;
    }
    v71 = PLPPTGetLog(v62);
    v60 = objc_claimAutoreleasedReturnValue(v71);
    if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      goto LABEL_104;
    *(_WORD *)v82 = 0;
    goto LABEL_103;
  }
  v41 = ((uint64_t (*)(void))PLPPTGetLog)();
  v42 = objc_claimAutoreleasedReturnValue(v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "unexpected view controller class %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "failedCurrentTest");
LABEL_107:

}

uint64_t sub_100037270(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_100037280(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_100037290(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1000372A0(uint64_t a1, void *a2, char a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  dispatch_time_t v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  char v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  __int128 *p_buf;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  __int128 buf;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v5 = a2;
  v6 = objc_opt_class(PUOneUpViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
    v8 = v7;
    if (!*(_BYTE *)(a1 + 48))
    {
LABEL_11:
      v19 = dispatch_time(0, 2000000000);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000376FC;
      v24[3] = &unk_10006C150;
      v20 = *(id *)(a1 + 40);
      v25 = v8;
      v26 = v20;
      v27 = a3;
      v21 = v8;
      dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v24);

      goto LABEL_15;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "browsingSession"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetsDataSource"));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v42 = 0x3032000000;
    v43 = sub_1000300A0;
    v44 = sub_1000300B0;
    v45 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = sub_1000300A0;
    v39 = sub_1000300B0;
    v40 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10003763C;
    v31[3] = &unk_10006C128;
    v13 = v11;
    v32 = v13;
    p_buf = &buf;
    v34 = &v35;
    objc_msgSend(v13, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v12, 0, v31);

    v14 = (void *)v36[5];
    if (!v14)
    {
      v14 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (!v14)
      {
        if ((objc_msgSend(v13, "isEmpty") & 1) == 0)
        {
          v15 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
          goto LABEL_8;
        }
        v14 = 0;
      }
    }
    v15 = v14;
LABEL_8:
    v16 = v15;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assetReferenceAtIndexPath:", v15));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000376F0;
      v28[3] = &unk_10006D648;
      v29 = v10;
      v18 = v17;
      v30 = v18;
      objc_msgSend(v29, "performChanges:", v28);

    }
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&buf, 8);
    goto LABEL_11;
  }
  v22 = PLPPTGetLog();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "unexpected view controller class %@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "failedCurrentTest");
LABEL_15:

}

void sub_100037608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10003763C(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetAtIndexPath:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "location"));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    objc_msgSend(v6, "faceAreaMinX");
    if (v8 != 0.0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
      *a3 = 1;
    }
  }

}

id sub_1000376F0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_1000376FC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

id sub_100037710(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_runRotationTestWithViewController:", a2);
}

id sub_10003771C(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_runRotationTestWithViewController:", a2);
}

id sub_100037728(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_runRotationTestWithViewController:", a2);
}

void sub_100037734(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;

  v3 = a2;
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000377D4;
  block[3] = &unk_10006C510;
  v4 = *(_QWORD *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_1000377CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_1000377D4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "px_firstKeyWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "windowScene"));
  v4 = objc_msgSend(v3, "interfaceOrientation");

  v12[0] = _NSConcreteStackBlock;
  if (v4 == (id)4)
    v5 = 1;
  else
    v5 = 4;
  v12[1] = 3221225472;
  v12[2] = sub_1000378B4;
  v12[3] = &unk_10006C038;
  v6 = *(void **)(a1 + 40);
  v13 = *(id *)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100037900;
  v9[3] = &unk_10006C060;
  v9[4] = v13;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 48);
  v10 = v7;
  v11 = v8;
  objc_msgSend(v13, "rotateIfNeeded:before:after:", v5, v12, v9);

}

void sub_1000378B4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "pu_startedAnimationSubTest:forTest:", CFSTR("Rotation"), v2);

}

uint64_t sub_100037900(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[4];
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "pu_finishedAnimationSubTest:forTest:", CFSTR("Rotation"), v3);

  return (*(uint64_t (**)(_QWORD, BOOL))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) == 0);
}

void sub_100037968(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 40), "pu_finishedAnimationSubTest:forTest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v2 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100037A18;
  v6[3] = &unk_10006BFE8;
  v3 = *(id *)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v7 = v3;
  v9 = v4;
  v8 = v5;
  objc_msgSend(v2, "installCACommitCompletionBlock:", v6);

}

id sub_100037A0C(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "setZoomLevel:", *(_QWORD *)(a1 + 32));
}

void sub_100037A18(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  uint64_t v9;

  v2 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037ABC;
  block[3] = &unk_10006BFE8;
  v3 = *(id *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v9 = v4;
  v8 = v5;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_100037ABC(_QWORD *a1)
{
  uint64_t v1;

  v1 = a1[4];
  if (v1)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1 + 16))(a1[4], a1[6], a1[5]);
  else
    return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void sub_100037AE0(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 72);
  if (v2 == 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 1, v2 - 1));
    objc_msgSend(*(id *)(a1 + 40), "_transitionCuratedLibraryVC:toZoomLevelsWithSubTestNames:taskHandler:completionHandler:", *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

  }
}

void sub_100037B50(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("Latency"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = dispatch_time(0, 500000000);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100037C60;
  v5[3] = &unk_10006D378;
  v6 = *(id *)(a1 + 56);
  v3 = *(id *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 64);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v5);

}

id *sub_100037C2C(id *result, char a2, uint64_t a3)
{
  if ((a2 & 1) == 0)
    return (id *)objc_msgSend(result[4], "failedCurrentTestWithFailure:", CFSTR("Failed to perform action%@ error:%@"), result[5], a3);
  return result;
}

void sub_100037C60(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "count") == (id)1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 1, (char *)objc_msgSend(*(id *)(a1 + 32), "count") - 1));
    objc_msgSend(*(id *)(a1 + 40), "_performActionsWithCuratedLibraryVC:actionsTypesAndNames:completionHandler:", *(_QWORD *)(a1 + 48), v2, *(_QWORD *)(a1 + 56));

  }
}

void sub_100037CE4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
  v4 = objc_msgSend(objc_alloc((Class)PXTwoTuple), "initWithFirst:second:", &off_100071A70, &stru_10006E450);
  v28[0] = v4;
  v5 = objc_msgSend(objc_alloc((Class)PXTwoTuple), "initWithFirst:second:", &off_100071A40, &stru_10006E450);
  v28[1] = v5;
  v6 = objc_msgSend(objc_alloc((Class)PXTwoTuple), "initWithFirst:second:", &off_100071A28, &stru_10006E450);
  v28[2] = v6;
  v7 = objc_msgSend(objc_alloc((Class)PXTwoTuple), "initWithFirst:second:", &off_100071A58, &stru_10006E450);
  v28[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));

  v9 = objc_alloc((Class)PXTwoTuple);
  v10 = objc_msgSend(v9, "initWithFirst:second:", PXCuratedLibraryActionSetPersonalLibraryFilter, CFSTR("Personal"));
  v27[0] = v10;
  v11 = objc_alloc((Class)PXTwoTuple);
  v12 = objc_msgSend(v11, "initWithFirst:second:", PXCuratedLibraryActionSetSharedLibraryFilter, CFSTR("Shared"));
  v27[1] = v12;
  v13 = objc_alloc((Class)PXTwoTuple);
  v14 = objc_msgSend(v13, "initWithFirst:second:", PXCuratedLibraryActionSetAllLibrariesFilter, CFSTR("All"));
  v27[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 3));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100037F60;
  v21[3] = &unk_10006BF70;
  v16 = *(_QWORD *)(a1 + 40);
  v22 = *(id *)(a1 + 32);
  v23 = v3;
  v24 = v8;
  v25 = v15;
  v26 = v16;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100038054;
  v20[3] = &unk_10006D620;
  v20[4] = v22;
  v17 = v15;
  v18 = v8;
  v19 = v3;
  objc_msgSend(v22, "ppt_startIterationWithBlock:completion:", v21, v20);

}

void sub_100037F60(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003805C;
  v12[3] = &unk_10006BF48;
  v12[4] = v5;
  v13 = v4;
  v14 = *(id *)(a1 + 56);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100038070;
  v9[3] = &unk_10006B810;
  v7 = *(_QWORD *)(a1 + 64);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  objc_msgSend(v5, "_transitionCuratedLibraryVC:toZoomLevelsWithSubTestNames:taskHandler:completionHandler:", v13, v6, v12, v9);

}

id sub_100038054(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

id sub_10003805C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performActionsWithCuratedLibraryVC:actionsTypesAndNames:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a3);
}

uint64_t sub_100038070(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1);
}

void sub_1000380A0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  __int128 v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
  v4 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003815C;
  v7[3] = &unk_10006BEF8;
  v8 = v3;
  v9 = *(_OWORD *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000384A0;
  v6[3] = &unk_10006D620;
  v6[4] = v9;
  v5 = v3;
  objc_msgSend(v4, "ppt_startIterationWithBlock:completion:", v7, v6);

}

void sub_10003815C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _QWORD v37[8];

  v27 = a1;
  v28 = a2;
  v2 = objc_msgSend(objc_alloc((Class)PXTwoTuple), "initWithFirst:second:", &off_100071A28, CFSTR("DaysToMonths"));
  v37[0] = v2;
  v3 = objc_msgSend(objc_alloc((Class)PXTwoTuple), "initWithFirst:second:", &off_100071A40, CFSTR("MonthsToYears"));
  v37[1] = v3;
  v4 = objc_msgSend(objc_alloc((Class)PXTwoTuple), "initWithFirst:second:", &off_100071A28, CFSTR("YearsToMonths"));
  v37[2] = v4;
  v5 = objc_msgSend(objc_alloc((Class)PXTwoTuple), "initWithFirst:second:", &off_100071A58, CFSTR("MonthsToDays"));
  v37[3] = v5;
  v6 = objc_msgSend(objc_alloc((Class)PXTwoTuple), "initWithFirst:second:", &off_100071A70, CFSTR("DaysToAllPhotos"));
  v37[4] = v6;
  v7 = objc_msgSend(objc_alloc((Class)PXTwoTuple), "initWithFirst:second:", &off_100071A58, CFSTR("AllPhotosToDays"));
  v37[5] = v7;
  v8 = objc_msgSend(objc_alloc((Class)PXTwoTuple), "initWithFirst:second:", &off_100071A40, CFSTR("DaysToYears"));
  v37[6] = v8;
  v9 = objc_msgSend(objc_alloc((Class)PXTwoTuple), "initWithFirst:second:", &off_100071A58, CFSTR("YearsToDays"));
  v37[7] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 8));

  v11 = (_QWORD *)v27;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v27 + 32), "viewProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewModel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration"));

  v15 = objc_alloc_init((Class)NSMutableArray);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "first", v27));
        if (objc_msgSend(v14, "isZoomLevelEnabled:", objc_msgSend(v22, "integerValue")))
          objc_msgSend(v15, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v18);
  }

  v24 = v11[4];
  v23 = (void *)v11[5];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000384A8;
  v29[3] = &unk_10006B810;
  v25 = v11[6];
  v30 = v28;
  v31 = v25;
  v26 = v28;
  objc_msgSend(v23, "_transitionCuratedLibraryVC:toZoomLevelsWithSubTestNames:taskHandler:completionHandler:", v24, v15, 0, v29);

}

id sub_1000384A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

uint64_t sub_1000384A8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1);
}

void sub_1000384D8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a2;
  v4 = objc_opt_class(PXPhotosUIViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewModel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentDataSource"));

    objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100038628;
    v16[3] = &unk_10006BD40;
    v10 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v17 = v8;
    v18 = v10;
    v11 = *(_QWORD *)(a1 + 48);
    v19 = v5;
    v20 = v6;
    v21 = v9;
    v22 = v11;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000388AC;
    v15[3] = &unk_10006D620;
    v15[4] = v10;
    v12 = v6;
    v13 = v5;
    v14 = v8;
    objc_msgSend(v10, "ppt_startIterationWithBlock:completion:", v16, v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTest");
  }

}

void sub_100038628(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  __int128 v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  __int128 *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastAssetCollection"));
  v5 = objc_alloc((Class)PXAssetCollectionReference);
  v6 = PXSimpleIndexPathNull[1];
  v35 = PXSimpleIndexPathNull[0];
  v36 = v6;
  v7 = objc_msgSend(v5, "initWithAssetCollection:keyAssetReference:indexPath:", v4, 0, &v35);
  v35 = 0u;
  v36 = 0u;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v8, "indexPathForAssetCollectionReference:", v7);
    v8 = *(void **)(a1 + 32);
  }
  v33 = v35;
  v34 = v36;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetsInSectionIndexPath:", &v33));
  v10 = objc_opt_class(PHAssetCollection);
  if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0 && (objc_msgSend(v4, "keyAssetsAtEnd") & 1) != 0)
  {
    *(_QWORD *)&v33 = 0;
    *((_QWORD *)&v33 + 1) = &v33;
    v34 = 0x2020000000uLL;
    v11 = (char *)objc_msgSend(v9, "count") - 1;
    v12 = -1;
  }
  else
  {
    v11 = 0;
    *(_QWORD *)&v33 = 0;
    *((_QWORD *)&v33 + 1) = &v33;
    v34 = 0x2020000000uLL;
    v12 = 1;
  }
  *((_QWORD *)&v34 + 1) = v11;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v13 = *(void **)(a1 + 40);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000388B4;
  v22[3] = &unk_10006BEA8;
  v28 = &v33;
  v14 = v9;
  v30 = v12;
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(void **)(a1 + 48);
  v23 = v14;
  v24 = v15;
  v25 = v16;
  v17 = v4;
  v26 = v17;
  v29 = v32;
  v31 = *(_QWORD *)(a1 + 72);
  v27 = *(id *)(a1 + 56);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100038A30;
  v19[3] = &unk_10006B810;
  v21 = *(_QWORD *)(a1 + 64);
  v18 = v3;
  v20 = v18;
  objc_msgSend(v13, "ppt_startIterationWithBlock:completion:", v22, v19);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v33, 8);

}

void sub_100038888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

id sub_1000388AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_1000388B4(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t);
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v4 >= (uint64_t)objc_msgSend(*(id *)(a1 + 32), "count")
    || (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) & 0x8000000000000000) != 0
    || (v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:"))) == 0)
  {
    v3[2](v3, 1);
  }
  else
  {
    v6 = (void *)v5;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += *(_QWORD *)(a1 + 88);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "currentTestName"));
    objc_msgSend(*(id *)(a1 + 40), "pu_startedAnimationSubTest:forTest:", CFSTR("ZoomIn"), v7);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100038A60;
    v12[3] = &unk_10006BE80;
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v12[4] = *(_QWORD *)(a1 + 40);
    v13 = v8;
    v14 = v7;
    v10 = *(_QWORD *)(a1 + 96);
    v17 = *(_QWORD *)(a1 + 80);
    v18 = v10;
    v16 = v3;
    v15 = *(id *)(a1 + 64);
    v11 = v7;
    objc_msgSend(v13, "ppt_navigateToAsset:inAssetContainer:revealInOneUp:completionHandler:", v6, v9, 1, v12);

  }
}

uint64_t sub_100038A30(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1);
}

void sub_100038A60(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_oneUpViewControllerForViewController:", *(_QWORD *)(a1 + 40)));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationController"));
  v8 = (void *)v7;
  if (a2 != 1 || (v6 ? (v9 = v7 == 0) : (v9 = 1), v9))
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Failed to navigate to one up view with error %@"), v5);
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100038BF4;
    v21[3] = &unk_10006D648;
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = *(id *)(a1 + 48);
    objc_msgSend(v8, "ppt_installTransitionAnimationCompletionHandler:", v21);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100038C08;
    v14[3] = &unk_10006BE58;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = *(id *)(a1 + 48);
    v10 = v6;
    v11 = *(_QWORD *)(a1 + 80);
    v16 = v10;
    v20 = v11;
    v13 = *(_OWORD *)(a1 + 64);
    v12 = (id)v13;
    v19 = v13;
    v17 = v8;
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v17, "ppt_performBlockAfterNextNavigationAnimation:", v14);

  }
}

id sub_100038BF4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", CFSTR("ZoomIn"), *(_QWORD *)(a1 + 40));
}

void sub_100038C08(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "startedSubTest:forTest:withMetrics:", CFSTR("vkAnalysisReady"), *(_QWORD *)(a1 + 40), &off_100071C70);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100038D04;
  v8[3] = &unk_10006BE30;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 88);
  v9 = v4;
  v14 = v5;
  v7 = *(_OWORD *)(a1 + 72);
  v6 = (id)v7;
  v13 = v7;
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v3, "ppt_notifyWhenVKAnalysisIsReadyWithTimeout:handler:", v8, 10.0);

}

void sub_100038D04(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  __int128 v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  __int128 v18;
  uint64_t v19;

  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("vkAnalysisReady"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "pu_startedAnimationSubTest:forTest:", CFSTR("ZoomOut"), *(_QWORD *)(a1 + 40));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100038E90;
  v17[3] = &unk_10006BD18;
  v19 = *(_QWORD *)(a1 + 88);
  v11 = *(_OWORD *)(a1 + 72);
  v2 = (id)v11;
  v18 = v11;
  v3 = objc_retainBlock(v17);
  v4 = *(void **)(a1 + 48);
  if (v4 == *(void **)(a1 + 56))
  {
    v8 = objc_msgSend(v4, "popViewControllerAnimated:", 1);
    v9 = *(void **)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100038F88;
    v12[3] = &unk_10006D648;
    v10 = *(void **)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v7 = &v13;
    v13 = v10;
    objc_msgSend(v9, "ppt_installTransitionAnimationCompletionHandler:", v12);
    objc_msgSend(*(id *)(a1 + 56), "ppt_performBlockAfterNextNavigationAnimation:", v3);
  }
  else
  {
    v5 = *(void **)(a1 + 64);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100038F50;
    v14[3] = &unk_10006C240;
    v6 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v7 = &v15;
    v15 = v6;
    v16 = v3;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v14);

  }
}

void sub_100038E90(uint64_t a1)
{
  BOOL v2;
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  BOOL v6;

  v2 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= *(_QWORD *)(a1 + 48);
  v3 = dispatch_time(0, 600000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100038F9C;
  v4[3] = &unk_10006BD90;
  v5 = *(id *)(a1 + 32);
  v6 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);

}

uint64_t sub_100038F50(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", CFSTR("ZoomOut"), *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

id sub_100038F88(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", CFSTR("ZoomOut"), *(_QWORD *)(a1 + 40));
}

uint64_t sub_100038F9C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_100038FB0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  dispatch_time_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD block[4];
  id v43;
  __int128 v44;
  uint64_t v45;

  v3 = a2;
  v4 = objc_msgSend(v3, "px_descendantViewControllerWithClass:", objc_opt_class(PXCuratedLibraryUIViewController));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (v5)
  {
    v6 = objc_msgSend(v3, "px_descendantViewControllerWithClass:", objc_opt_class(PXCuratedLibraryUIViewController));
    v7 = (id)objc_claimAutoreleasedReturnValue(v6);
    if ((objc_msgSend(v7, "ppt_dismiss") & 1) != 0)
    {
      v8 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000392B4;
      block[3] = &unk_10006C588;
      v43 = v7;
      v45 = *(_QWORD *)(a1 + 48);
      v44 = *(_OWORD *)(a1 + 32);
      dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Unable to dismiss to home"));
    }
    goto LABEL_7;
  }
  v9 = objc_opt_class(PUPhotosGridViewController);
  if ((objc_opt_isKindOfClass(v3, v9) & 1) != 0)
  {
    v10 = v3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationController"));
    objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000393C8;
    v36[3] = &unk_10006B748;
    v13 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v37 = v10;
    v38 = v13;
    v14 = *(_QWORD *)(a1 + 48);
    v40 = v12;
    v41 = v14;
    v39 = v11;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000395DC;
    v35[3] = &unk_10006D620;
    v35[4] = v13;
    v15 = v11;
    v7 = v10;
    objc_msgSend(v13, "ppt_startIterationWithBlock:completion:", v36, v35);

LABEL_7:
    goto LABEL_8;
  }
  v16 = objc_opt_class(PXPhotosUIViewController);
  if ((objc_opt_isKindOfClass(v3, v16) & 1) != 0)
  {
    v17 = v3;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "navigationController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "viewModel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentDataSource"));

    objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000395E4;
    v28[3] = &unk_10006BD40;
    v22 = *(void **)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 40);
    v29 = v20;
    v30 = v22;
    v23 = *(_QWORD *)(a1 + 48);
    v31 = v17;
    v32 = v18;
    v33 = v21;
    v34 = v23;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100039868;
    v27[3] = &unk_10006D620;
    v27[4] = v22;
    v24 = v18;
    v25 = v17;
    v26 = v20;
    objc_msgSend(v22, "ppt_startIterationWithBlock:completion:", v28, v27);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTest");
  }
LABEL_8:

}

void sub_1000392B4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  int8x16_t v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  int8x16_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "viewProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentDataSource"));

  objc_msgSend(*(id *)(a1 + 40), "startedCurrentTest");
  v5 = *(void **)(a1 + 40);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003A358;
  v12[3] = &unk_10006B748;
  v13 = v4;
  v10 = *(int8x16_t *)(a1 + 32);
  v6 = (id)v10.i64[0];
  v14 = vextq_s8(v10, v10, 8uLL);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 48);
  v16 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003A5C0;
  v11[3] = &unk_10006D620;
  v11[4] = v8;
  v9 = v4;
  objc_msgSend(v5, "ppt_startIterationWithBlock:completion:", v12, v11);

}

void sub_1000393C8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  char *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  int8x16_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  int8x16_t v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  _QWORD v30[3];
  char *v31;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "collectionListFetchResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetsInAssetCollection:", v5));
  if (objc_msgSend(*(id *)(a1 + 32), "initiallyScrolledToBottom"))
    v7 = -1;
  else
    v7 = 1;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  v8 = objc_msgSend(*(id *)(a1 + 32), "initiallyScrolledToBottom");
  v9 = 0;
  if (v8)
    v9 = (char *)objc_msgSend(v6, "count") - 1;
  v31 = v9;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v10 = *(void **)(a1 + 40);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100039F6C;
  v20[3] = &unk_10006BEA8;
  v25 = v30;
  v11 = v6;
  v21 = v11;
  v27 = v7;
  v16 = *(int8x16_t *)(a1 + 32);
  v12 = (id)v16.i64[0];
  v22 = vextq_s8(v16, v16, 8uLL);
  v13 = v5;
  v23 = v13;
  v24 = *(id *)(a1 + 48);
  v26 = v29;
  v14 = *(_QWORD *)(a1 + 56);
  v28 = *(_QWORD *)(a1 + 64);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003A128;
  v17[3] = &unk_10006B810;
  v19 = v14;
  v15 = v3;
  v18 = v15;
  objc_msgSend(v10, "ppt_startIterationWithBlock:completion:", v20, v17);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);

}

void sub_1000395B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_1000395DC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_1000395E4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  __int128 v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  __int128 *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastAssetCollection"));
  v5 = objc_alloc((Class)PXAssetCollectionReference);
  v6 = PXSimpleIndexPathNull[1];
  v35 = PXSimpleIndexPathNull[0];
  v36 = v6;
  v7 = objc_msgSend(v5, "initWithAssetCollection:keyAssetReference:indexPath:", v4, 0, &v35);
  v35 = 0u;
  v36 = 0u;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v8, "indexPathForAssetCollectionReference:", v7);
    v8 = *(void **)(a1 + 32);
  }
  v33 = v35;
  v34 = v36;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetsInSectionIndexPath:", &v33));
  v10 = objc_opt_class(PHAssetCollection);
  if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0 && (objc_msgSend(v4, "keyAssetsAtEnd") & 1) != 0)
  {
    *(_QWORD *)&v33 = 0;
    *((_QWORD *)&v33 + 1) = &v33;
    v34 = 0x2020000000uLL;
    v11 = (char *)objc_msgSend(v9, "count") - 1;
    v12 = -1;
  }
  else
  {
    v11 = 0;
    *(_QWORD *)&v33 = 0;
    *((_QWORD *)&v33 + 1) = &v33;
    v34 = 0x2020000000uLL;
    v12 = 1;
  }
  *((_QWORD *)&v34 + 1) = v11;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v13 = *(void **)(a1 + 40);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100039870;
  v22[3] = &unk_10006BEA8;
  v28 = &v33;
  v14 = v9;
  v30 = v12;
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(void **)(a1 + 48);
  v23 = v14;
  v24 = v15;
  v25 = v16;
  v17 = v4;
  v26 = v17;
  v29 = v32;
  v31 = *(_QWORD *)(a1 + 72);
  v27 = *(id *)(a1 + 56);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000399EC;
  v19[3] = &unk_10006B810;
  v21 = *(_QWORD *)(a1 + 64);
  v18 = v3;
  v20 = v18;
  objc_msgSend(v13, "ppt_startIterationWithBlock:completion:", v22, v19);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v33, 8);

}

void sub_100039844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

id sub_100039868(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_100039870(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t);
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v4 >= (uint64_t)objc_msgSend(*(id *)(a1 + 32), "count")
    || (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) & 0x8000000000000000) != 0
    || (v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:"))) == 0)
  {
    v3[2](v3, 1);
  }
  else
  {
    v6 = (void *)v5;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += *(_QWORD *)(a1 + 88);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "currentTestName"));
    objc_msgSend(*(id *)(a1 + 40), "pu_startedAnimationSubTest:forTest:", CFSTR("ZoomIn"), v7);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100039A1C;
    v12[3] = &unk_10006BE80;
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v12[4] = *(_QWORD *)(a1 + 40);
    v13 = v8;
    v14 = v7;
    v10 = *(_QWORD *)(a1 + 96);
    v17 = *(_QWORD *)(a1 + 80);
    v18 = v10;
    v16 = v3;
    v15 = *(id *)(a1 + 64);
    v11 = v7;
    objc_msgSend(v13, "ppt_navigateToAsset:inAssetContainer:revealInOneUp:completionHandler:", v6, v9, 1, v12);

  }
}

uint64_t sub_1000399EC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1);
}

void sub_100039A1C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_oneUpViewControllerForViewController:", *(_QWORD *)(a1 + 40)));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationController"));
  v8 = (void *)v7;
  if (a2 != 1 || (v6 ? (v9 = v7 == 0) : (v9 = 1), v9))
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Failed to navigate to one up view with error %@"), v5);
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100039BB0;
    v21[3] = &unk_10006D648;
    v21[4] = *(_QWORD *)(a1 + 32);
    v22 = *(id *)(a1 + 48);
    objc_msgSend(v8, "ppt_installTransitionAnimationCompletionHandler:", v21);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100039BC4;
    v14[3] = &unk_10006BE58;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = *(id *)(a1 + 48);
    v10 = v6;
    v11 = *(_QWORD *)(a1 + 80);
    v16 = v10;
    v20 = v11;
    v13 = *(_OWORD *)(a1 + 64);
    v12 = (id)v13;
    v19 = v13;
    v17 = v8;
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v17, "ppt_performBlockAfterNextNavigationAnimation:", v14);

  }
}

id sub_100039BB0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", CFSTR("ZoomIn"), *(_QWORD *)(a1 + 40));
}

void sub_100039BC4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "startedSubTest:forTest:withMetrics:", CFSTR("TimeToSharp"), *(_QWORD *)(a1 + 40), &off_100071C58);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100039CC0;
  v8[3] = &unk_10006BE30;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 88);
  v9 = v4;
  v14 = v5;
  v7 = *(_OWORD *)(a1 + 72);
  v6 = (id)v7;
  v13 = v7;
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v3, "ppt_notifyWhenFullQualityIsDisplayedWithTimeout:handler:", v8, 3.0);

}

void sub_100039CC0(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;
  __int128 v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  __int128 v18;
  uint64_t v19;

  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("TimeToSharp"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "pu_startedAnimationSubTest:forTest:", CFSTR("ZoomOut"), *(_QWORD *)(a1 + 40));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100039E4C;
  v17[3] = &unk_10006BD18;
  v19 = *(_QWORD *)(a1 + 88);
  v11 = *(_OWORD *)(a1 + 72);
  v2 = (id)v11;
  v18 = v11;
  v3 = objc_retainBlock(v17);
  v4 = *(void **)(a1 + 48);
  if (v4 == *(void **)(a1 + 56))
  {
    v8 = objc_msgSend(v4, "popViewControllerAnimated:", 1);
    v9 = *(void **)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100039F44;
    v12[3] = &unk_10006D648;
    v10 = *(void **)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v7 = &v13;
    v13 = v10;
    objc_msgSend(v9, "ppt_installTransitionAnimationCompletionHandler:", v12);
    objc_msgSend(*(id *)(a1 + 56), "ppt_performBlockAfterNextNavigationAnimation:", v3);
  }
  else
  {
    v5 = *(void **)(a1 + 64);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100039F0C;
    v14[3] = &unk_10006C240;
    v6 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v7 = &v15;
    v15 = v6;
    v16 = v3;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v14);

  }
}

void sub_100039E4C(uint64_t a1)
{
  BOOL v2;
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  BOOL v6;

  v2 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= *(_QWORD *)(a1 + 48);
  v3 = dispatch_time(0, 600000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100039F58;
  v4[3] = &unk_10006BD90;
  v5 = *(id *)(a1 + 32);
  v6 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);

}

uint64_t sub_100039F0C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", CFSTR("ZoomOut"), *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

id sub_100039F44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", CFSTR("ZoomOut"), *(_QWORD *)(a1 + 40));
}

uint64_t sub_100039F58(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_100039F6C(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  void (**v18)(id, uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v4 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count")
    || (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) & 0x8000000000000000) != 0
    || (v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:"))) == 0)
  {
    v3[2](v3, 1);
  }
  else
  {
    v6 = (void *)v5;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += *(_QWORD *)(a1 + 88);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "currentTestName"));
    objc_msgSend(*(id *)(a1 + 40), "pu_startedAnimationSubTest:forTest:", CFSTR("ZoomIn"), v7);
    objc_msgSend(*(id *)(a1 + 48), "navigateToPhoto:inAssetContainer:animated:", v6, *(_QWORD *)(a1 + 56), 1);
    v8 = *(void **)(a1 + 64);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10003A158;
    v21[3] = &unk_10006D648;
    v21[4] = *(_QWORD *)(a1 + 40);
    v9 = v7;
    v22 = v9;
    objc_msgSend(v8, "ppt_installTransitionAnimationCompletionHandler:", v21);
    v10 = *(void **)(a1 + 64);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003A16C;
    v15[3] = &unk_10006B720;
    v15[4] = *(_QWORD *)(a1 + 40);
    v16 = v9;
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 80);
    v17 = v11;
    v13 = *(_QWORD *)(a1 + 96);
    v19 = v12;
    v20 = v13;
    v18 = v3;
    v14 = v9;
    objc_msgSend(v11, "ppt_performBlockAfterNextNavigationAnimation:", v15);

  }
}

uint64_t sub_10003A128(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1);
}

id sub_10003A158(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", CFSTR("ZoomIn"), *(_QWORD *)(a1 + 40));
}

void sub_10003A16C(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "pu_startedAnimationSubTest:forTest:", CFSTR("ZoomOut"), *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 48), "popViewControllerAnimated:", 1);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003A270;
  v11[3] = &unk_10006D648;
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v3;
  objc_msgSend(v4, "ppt_installTransitionAnimationCompletionHandler:", v11);
  v5 = *(void **)(a1 + 48);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003A284;
  v8[3] = &unk_10006BD18;
  v10 = *(_QWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 56);
  v6 = (id)v7;
  v9 = v7;
  objc_msgSend(v5, "ppt_performBlockAfterNextNavigationAnimation:", v8);

}

id sub_10003A270(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", CFSTR("ZoomOut"), *(_QWORD *)(a1 + 40));
}

void sub_10003A284(uint64_t a1)
{
  BOOL v2;
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  BOOL v6;

  v2 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= *(_QWORD *)(a1 + 48);
  v3 = dispatch_time(0, 600000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003A344;
  v4[3] = &unk_10006BD90;
  v5 = *(id *)(a1 + 32);
  v6 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);

}

uint64_t sub_10003A344(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_10003A358(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  __int128 v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  __int128 *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastAssetCollection"));
  v5 = objc_alloc((Class)PXAssetCollectionReference);
  v6 = PXSimpleIndexPathNull[1];
  v35 = PXSimpleIndexPathNull[0];
  v36 = v6;
  v7 = objc_msgSend(v5, "initWithAssetCollection:keyAssetReference:indexPath:", v4, 0, &v35);
  v35 = 0u;
  v36 = 0u;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v8, "indexPathForAssetCollectionReference:", v7);
    v8 = *(void **)(a1 + 32);
  }
  v33 = v35;
  v34 = v36;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetsInSectionIndexPath:", &v33));
  v10 = objc_opt_class(PHAssetCollection);
  if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0 && (objc_msgSend(v4, "keyAssetsAtEnd") & 1) != 0)
  {
    *(_QWORD *)&v33 = 0;
    *((_QWORD *)&v33 + 1) = &v33;
    v34 = 0x2020000000uLL;
    v11 = (char *)objc_msgSend(v9, "count") - 1;
    v12 = -1;
  }
  else
  {
    v11 = 0;
    *(_QWORD *)&v33 = 0;
    *((_QWORD *)&v33 + 1) = &v33;
    v34 = 0x2020000000uLL;
    v12 = 1;
  }
  *((_QWORD *)&v34 + 1) = v11;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = 0;
  v13 = *(void **)(a1 + 40);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10003A5C8;
  v23[3] = &unk_10006BE08;
  v28 = &v33;
  v14 = v9;
  v30 = v12;
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(void **)(a1 + 48);
  v24 = v14;
  v25 = v15;
  v26 = v16;
  v17 = v4;
  v27 = v17;
  v29 = v32;
  v18 = *(_QWORD *)(a1 + 56);
  v31 = *(_QWORD *)(a1 + 64);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003A730;
  v20[3] = &unk_10006B810;
  v22 = v18;
  v19 = v3;
  v21 = v19;
  objc_msgSend(v13, "ppt_startIterationWithBlock:completion:", v23, v20);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v33, 8);

}

void sub_10003A59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

id sub_10003A5C0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_10003A5C8(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  void (**v15)(id, uint64_t);
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v4 >= (uint64_t)objc_msgSend(*(id *)(a1 + 32), "count")
    || (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) & 0x8000000000000000) != 0
    || (v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:"))) == 0)
  {
    v3[2](v3, 1);
  }
  else
  {
    v6 = (void *)v5;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += *(_QWORD *)(a1 + 80);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "currentTestName"));
    objc_msgSend(*(id *)(a1 + 40), "pu_startedAnimationSubTest:forTest:", CFSTR("ZoomIn"), v7);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003A760;
    v12[3] = &unk_10006BDE0;
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v12[4] = *(_QWORD *)(a1 + 40);
    v13 = v8;
    v14 = v7;
    v10 = *(_QWORD *)(a1 + 88);
    v16 = *(_QWORD *)(a1 + 72);
    v17 = v10;
    v15 = v3;
    v11 = v7;
    objc_msgSend(v13, "ppt_navigateToAsset:inAssetContainer:revealInOneUp:completionHandler:", v6, v9, 1, v12);

  }
}

uint64_t sub_10003A730(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1);
}

void sub_10003A760(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  _QWORD v14[5];
  id v15;
  id v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_oneUpViewControllerForViewController:", *(_QWORD *)(a1 + 40)));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navigationController"));
  v8 = (void *)v7;
  if (a2 != 1 || (v6 ? (v9 = v7 == 0) : (v9 = 1), v9))
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Failed to navigate to one up view with error %@"), v5);
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003A8CC;
    v19[3] = &unk_10006D648;
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v8, "ppt_installTransitionAnimationCompletionHandler:", v19);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003A8E0;
    v14[3] = &unk_10006B720;
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = *(id *)(a1 + 48);
    v10 = v6;
    v11 = *(_QWORD *)(a1 + 72);
    v16 = v10;
    v18 = v11;
    v13 = *(_OWORD *)(a1 + 56);
    v12 = (id)v13;
    v17 = v13;
    objc_msgSend(v8, "ppt_performBlockAfterNextNavigationAnimation:", v14);

  }
}

id sub_10003A8CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", CFSTR("ZoomIn"), *(_QWORD *)(a1 + 40));
}

void sub_10003A8E0(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  __int128 v7;
  _QWORD v8[5];
  id v9;
  id v10;
  __int128 v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "startedSubTest:forTest:withMetrics:", CFSTR("TimeToSharp"), *(_QWORD *)(a1 + 40), &off_100071C40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003A9B4;
  v8[3] = &unk_10006BDB8;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 72);
  v9 = v4;
  v12 = v5;
  v7 = *(_OWORD *)(a1 + 56);
  v6 = (id)v7;
  v11 = v7;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v3, "ppt_notifyWhenFullQualityIsDisplayedWithTimeout:handler:", v8, 3.0);

}

void sub_10003A9B4(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  __int128 v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD v11[4];
  __int128 v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "finishedSubTest:forTest:", CFSTR("TimeToSharp"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "pu_startedAnimationSubTest:forTest:", CFSTR("ZoomOut"), *(_QWORD *)(a1 + 40));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003AAC8;
  v11[3] = &unk_10006BD18;
  v13 = *(_QWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 56);
  v2 = (id)v7;
  v12 = v7;
  v3 = objc_retainBlock(v11);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003AB88;
  v8[3] = &unk_10006C240;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v8);

}

void sub_10003AAC8(uint64_t a1)
{
  BOOL v2;
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  BOOL v6;

  v2 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= *(_QWORD *)(a1 + 48);
  v3 = dispatch_time(0, 600000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003ABC0;
  v4[3] = &unk_10006BD90;
  v5 = *(id *)(a1 + 32);
  v6 = v2;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);

}

uint64_t sub_10003AB88(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", CFSTR("ZoomOut"), *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t sub_10003ABC0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_10003ABD4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("visible")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForVisibleItems"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "compare:"));

    v6 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", objc_msgSend(v5, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v42;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v42 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v11)));
          if (objc_msgSend(v12, "canContainAssets") && objc_msgSend(v12, "estimatedAssetCount"))
            objc_msgSend(v6, "addObject:", v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v9);
    }
    v13 = v7;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("all")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSourceManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collectionsFetchResult"));

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10003AFDC;
    v39[3] = &unk_10006BCC8;
    v6 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", objc_msgSend(v13, "count"));
    v40 = v6;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v39);
    v7 = v40;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "componentsSeparatedByString:", CFSTR(",")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));

    v17 = objc_alloc_init((Class)NSMutableOrderedSet);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSourceManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "collectionsFetchResult"));

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10003AFE8;
    v36[3] = &unk_10006BCF0;
    v37 = v16;
    v19 = v17;
    v38 = v19;
    v7 = v16;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v36);
    v20 = v38;
    v6 = v19;

  }
  if (objc_msgSend(v6, "count"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationController"));
    objc_msgSend(*(id *)(a1 + 40), "startedCurrentTest");
    v22 = *(void **)(a1 + 40);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10003B054;
    v29[3] = &unk_10006BD40;
    v23 = v6;
    v24 = *(_QWORD *)(a1 + 40);
    v30 = v23;
    v31 = v24;
    v32 = v3;
    v33 = v21;
    v25 = *(_QWORD *)(a1 + 56);
    v26 = *(_QWORD *)(a1 + 40);
    v34 = *(_QWORD *)(a1 + 48);
    v35 = v25;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10003B1A0;
    v28[3] = &unk_10006D620;
    v28[4] = v26;
    v27 = v21;
    objc_msgSend(v22, "ppt_startIterationWithBlock:completion:", v29, v28);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "failedCurrentTestWithFailure:", CFSTR("Failed to find albums matching provided options: \"%@\""), *(_QWORD *)(a1 + 32));
  }

}

id sub_10003AFDC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void sub_10003AFE8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedTitle"));
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void sub_10003B054(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v21[4];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectEnumerator"));
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v5 = *(void **)(a1 + 40);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003B1A8;
  v14[3] = &unk_10006BD40;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v15 = v6;
  v16 = v7;
  v17 = v8;
  v18 = *(id *)(a1 + 56);
  v19 = v21;
  v9 = *(_QWORD *)(a1 + 64);
  v20 = *(_QWORD *)(a1 + 72);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003B2FC;
  v11[3] = &unk_10006B810;
  v13 = v9;
  v10 = v3;
  v12 = v10;
  objc_msgSend(v5, "ppt_startIterationWithBlock:completion:", v14, v11);

  _Block_object_dispose(v21, 8);
}

void sub_10003B188(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_10003B1A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_10003B1A8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nextObject"));
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentTestName"));
    objc_msgSend(v5, "pu_startedAnimationSubTest:forTest:", CFSTR("IntoAlbum"), v6);

    objc_msgSend(*(id *)(a1 + 48), "navigateToCollection:animated:completion:", v4, 1, 0);
    v7 = *(void **)(a1 + 56);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003B32C;
    v17[3] = &unk_10006D620;
    v17[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "ppt_installTransitionAnimationCompletionHandler:", v17);
    v8 = *(void **)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10003B378;
    v12[3] = &unk_10006C380;
    v12[4] = *(_QWORD *)(a1 + 40);
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 72);
    v13 = v9;
    v15 = v10;
    v16 = v11;
    v14 = v3;
    objc_msgSend(v9, "ppt_performBlockAfterNextNavigationAnimation:", v12);

  }
  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }

}

uint64_t sub_10003B2FC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1);
}

void sub_10003B32C(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "pu_finishedAnimationSubTest:forTest:", CFSTR("IntoAlbum"), v2);

}

void sub_10003B378(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  _QWORD v12[5];

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "pu_startedAnimationSubTest:forTest:", CFSTR("OutOfAlbum"), v3);

  v4 = objc_msgSend(*(id *)(a1 + 40), "popViewControllerAnimated:", 1);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003B47C;
  v12[3] = &unk_10006D620;
  v5 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "ppt_installTransitionAnimationCompletionHandler:", v12);
  v6 = *(void **)(a1 + 40);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003B4C8;
  v9[3] = &unk_10006BD18;
  v11 = *(_QWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v7 = (id)v8;
  v10 = v8;
  objc_msgSend(v6, "ppt_performBlockAfterNextNavigationAnimation:", v9);

}

void sub_10003B47C(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "pu_finishedAnimationSubTest:forTest:", CFSTR("OutOfAlbum"), v2);

}

uint64_t sub_10003B4C8(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(a1[4] + 16))(a1[4], ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) >= a1[6]);
}

id sub_10003B500()
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
  v0 = (void *)qword_10007C120;
  v7 = qword_10007C120;
  if (!qword_10007C120)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003BF08;
    v3[3] = &unk_10006D288;
    v3[4] = &v4;
    sub_10003BF08((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10003B5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003B5B8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;

  objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTestName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", *(_QWORD *)(a1 + 40)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_100071C28, "objectEnumerator"));
  v5 = *(void **)(a1 + 32);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003B738;
  v13[3] = &unk_10006BC78;
  v14 = v4;
  v15 = v3;
  v16 = *(id *)(a1 + 48);
  v17 = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v21 = *(_QWORD *)(a1 + 64);
  v18 = v6;
  v19 = v7;
  v20 = *(id *)(a1 + 56);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003B868;
  v11[3] = &unk_10006D648;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = *(id *)(a1 + 56);
  v8 = v2;
  v9 = v3;
  v10 = v4;
  objc_msgSend(v5, "ppt_startIterationWithBlock:completion:", v13, v11);

}

void sub_10003B738(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nextObject"));
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, CFSTR("transition"));
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003B898;
    v9[3] = &unk_10006BC50;
    v8 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v15 = *(_QWORD *)(a1 + 88);
    v9[4] = v7;
    v10 = *(id *)(a1 + 72);
    v11 = v4;
    v12 = *(id *)(a1 + 56);
    v13 = *(id *)(a1 + 80);
    v14 = v3;
    objc_msgSend(v5, "prepareForTransitionTestWithName:options:readyHandler:", v8, v6, v9);

  }
  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }

}

id sub_10003B868(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
  return objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
}

void sub_10003B898(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[3];
  id v27;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = objc_opt_class(PUNavigationTransition);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("PhotosApplication-Testing.m"), 2149, CFSTR("unexpected class %@"), v6);

    }
  }
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("iterations")));
  v9 = objc_msgSend(v8, "integerValue");

  v27 = v9;
  v10 = *(void **)(a1 + 32);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003BA9C;
  v18[3] = &unk_10006BC28;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v19 = v11;
  v20 = v12;
  v21 = *(id *)(a1 + 56);
  v22 = *(id *)(a1 + 64);
  v13 = v5;
  v23 = v13;
  v14 = v6;
  v24 = v14;
  v25 = v26;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003BC34;
  v16[3] = &unk_10006D4D0;
  v17 = *(id *)(a1 + 72);
  objc_msgSend(v10, "ppt_startIterationWithBlock:completion:", v18, v16);

  _Block_object_dispose(v26, 8);
}

void sub_10003BA84(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10003BA9C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Push-%@"), *(_QWORD *)(a1 + 32)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Pop-%@"), *(_QWORD *)(a1 + 32)));
  objc_msgSend(*(id *)(a1 + 40), "pu_startedAnimationSubTest:forTest:", v4, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "pu_pushViewController:withTransition:animated:isInteractive:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), 1, 0);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003BC44;
  v21[3] = &unk_10006B110;
  v6 = *(void **)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v21[4] = *(_QWORD *)(a1 + 40);
  v22 = v4;
  v23 = v6;
  v8 = v4;
  objc_msgSend(v7, "ppt_installTransitionAnimationCompletionHandler:", v21);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003BC54;
  v15[3] = &unk_10006BC00;
  v9 = *(void **)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  v15[4] = *(_QWORD *)(a1 + 40);
  v16 = v5;
  v17 = v9;
  v11 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 80);
  v19 = v3;
  v20 = v12;
  v18 = v11;
  v13 = v3;
  v14 = v5;
  objc_msgSend(v10, "ppt_performBlockAfterNextNavigationAnimation:", v15);

}

uint64_t sub_10003BC34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_10003BC44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10003BC54(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  id v4;
  __int128 v5;
  _QWORD block[5];
  id v7;
  id v8;
  id v9;
  __int128 v10;

  v2 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BD2C;
  block[3] = &unk_10006BC00;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 64);
  v4 = (id)v5;
  v10 = v5;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10003BD2C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  _QWORD v9[5];
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "pu_startedAnimationSubTest:forTest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 56), "pu_popViewControllerAnimated:interactive:", 1, 0);
  v2 = *(void **)(a1 + 56);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003BE30;
  v9[3] = &unk_10006B110;
  v3 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "ppt_installTransitionAnimationCompletionHandler:", v9);
  v4 = *(void **)(a1 + 56);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003BE40;
  v7[3] = &unk_10006B810;
  v6 = *(_OWORD *)(a1 + 64);
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(v4, "ppt_performBlockAfterNextNavigationAnimation:", v7);

}

id sub_10003BE30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10003BE40(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;

  v2 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BED8;
  block[3] = &unk_10006B810;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_10003BED8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1);
}

void sub_10003BF08(uint64_t a1)
{
  void *v2;
  void *v3;

  sub_100030390();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PUTesterPPTBaselineViewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_10007C120 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getPUTesterPPTBaselineViewControllerClass(void)_block_invoke"));
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PhotosApplication-Testing.m"), 194, CFSTR("Unable to find class %s"), "PUTesterPPTBaselineViewController");

    __break(1u);
  }
}

void sub_10003BFCC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 *p_buf;
  _QWORD *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[3];
  id v38;
  __int128 buf;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v5 = a2;
  v6 = objc_opt_class(PUOneUpViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v23 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "browsingSession"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewModel"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetsDataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTestOptions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("maxPhotosCount")));
    v12 = objc_msgSend(v11, "integerValue");

    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v38 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("iterations")));
    v14 = objc_msgSend(v13, "integerValue");

    v38 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v12));
    if ((_DWORD)a3)
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastItemIndexPath"));
    else
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstItemIndexPath"));
    v19 = (void *)v16;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10003C3A0;
    v33[3] = &unk_10006BB88;
    v20 = v9;
    v34 = v20;
    v21 = v15;
    v35 = v21;
    v36 = v12;
    objc_msgSend(v20, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v19, a3, v33);
    if (objc_msgSend(v21, "count"))
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v40 = 0x3032000000;
      v41 = sub_1000300A0;
      v42 = sub_1000300B0;
      v43 = 0;
      objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
      v22 = *(void **)(a1 + 32);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10003C428;
      v25[3] = &unk_10006BBB0;
      p_buf = &buf;
      v26 = v21;
      v32 = v37;
      v27 = v20;
      v28 = v8;
      v30 = *(id *)(a1 + 40);
      v29 = v23;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10003C618;
      v24[3] = &unk_10006D620;
      v24[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v22, "ppt_startIterationWithBlock:completion:", v25, v24);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Couldn't find any Live Photo"));
    }

    _Block_object_dispose(v37, 8);
  }
  else
  {
    v17 = PLPPTGetLog();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "unexpected view controller class %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Unexpected view controller class"));
  }

}

void sub_10003C368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_10003C3A0(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetAtIndexPath:"));
  if (objc_msgSend(v5, "playbackStyle") == (id)3)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= *(_QWORD *)(a1 + 48))
      *a3 = 1;
  }

}

void sub_10003C428(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  dispatch_time_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "nextObject"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "assetReferenceAtIndexPath:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "assetsDataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetReferenceForAssetReference:", v5));

    v8 = *(void **)(a1 + 48);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10003C620;
    v20[3] = &unk_10006D648;
    v21 = v8;
    v22 = v7;
    v9 = v7;
    objc_msgSend(v21, "performChanges:", v20);
    v10 = dispatch_time(0, 500000000);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003C62C;
    v15[3] = &unk_10006C3D0;
    v18 = *(id *)(a1 + 64);
    v16 = *(id *)(a1 + 56);
    v17 = v5;
    v19 = v3;
    v11 = v5;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v15);

  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectEnumerator"));
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    (*((void (**)(id, _QWORD))v3 + 2))(v3, --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) >> 63);
  }

}

id sub_10003C618(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

id sub_10003C620(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:", *(_QWORD *)(a1 + 40));
}

void sub_10003C62C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "asset"));
  (*(void (**)(uint64_t, uint64_t, id, _QWORD))(v3 + 16))(v3, v2, v4, *(_QWORD *)(a1 + 56));

}

Class sub_10003C688(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;

  v6 = 0;
  if (!qword_10007C138)
  {
    v7 = off_10006D468;
    v8 = 0;
    qword_10007C138 = _sl_dlopen(&v7, &v6);
  }
  if (!qword_10007C138)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *NeutrinoCoreLibrary(void)"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PhotosApplication-Testing.m"), 201, CFSTR("%s"), v6);

    goto LABEL_10;
  }
  if (v6)
    free(v6);
  result = objc_getClass("NUCacheNode");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getNUCacheNodeClass(void)_block_invoke"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PhotosApplication-Testing.m"), 202, CFSTR("Unable to find class %s"), "NUCacheNode");

LABEL_10:
    __break(1u);
  }
  qword_10007C130 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10003C824(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetChangeRequest changeRequestForAsset:](PHAssetChangeRequest, "changeRequestForAsset:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v5), (_QWORD)v7));
        objc_msgSend(v6, "setVariationSuggestionStates:forVariationType:", 0, 1);
        objc_msgSend(v6, "setVariationSuggestionStates:forVariationType:", 0, 3);
        objc_msgSend(v6, "setVariationSuggestionStates:forVariationType:", 0, 2);

        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void sub_10003C954(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentTestName"));
  objc_msgSend(v7, "startedSubTest:forTest:withMetrics:", CFSTR("LivePhotoPlayback"), v9, &off_100071C10);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003CA28;
  v11[3] = &unk_10006B528;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "ppt_playCurrentLivePhotoWithCompletionHandler:", v11);

}

uint64_t sub_10003CA28(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "finishedSubTest:forTest:", CFSTR("LivePhotoPlayback"), v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_10003CA84(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003CAFC;
  v6[3] = &unk_10006D648;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_msgSend(v5, "ppt_executeAfterRender:", v6);

}

void sub_10003CAFC(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  __CFString *v3;
  _QWORD v4[4];
  uint64_t v5;
  __CFString *v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003CB88;
  v4[3] = &unk_10006D648;
  v1 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("LivePhotoInEditPlaybackSubtest");
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003CBD8;
  v2[3] = &unk_10006D648;
  v2[4] = v5;
  v3 = CFSTR("LivePhotoInEditPlaybackSubtest");
  objc_msgSend(v1, "ppt_playLivePhotoWithWillBeginPlaybackBlock:didEndPlaybackBlock:", v4, v2);

}

void sub_10003CB88(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "currentTestName"));
  objc_msgSend(v1, "startedSubTest:forTest:withMetrics:", v2, v3, &off_100071BF8);

}

id sub_10003CBD8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "finishedSubTest:forTest:", v3, v4);

  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_10003CC28(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003CCB4;
  v7[3] = &unk_10006B110;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  objc_msgSend(v6, "ppt_executeAfterRender:", v7);

}

void sub_10003CCB4(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = (void *)a1[4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003CD3C;
  v6[3] = &unk_10006B110;
  v3 = v2;
  v4 = a1[5];
  v5 = (void *)a1[6];
  v7 = v3;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "ppt_selectAdjustmentsController:", v6);

}

void sub_10003CD3C(uint64_t a1)
{
  id v2;
  int8x16_t v3;
  _QWORD v4[4];
  int8x16_t v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003CDD4;
  v4[3] = &unk_10006B110;
  v3 = *(int8x16_t *)(a1 + 32);
  v2 = (id)v3.i64[0];
  v5 = vextq_s8(v3, v3, 8uLL);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "ppt_scrollBWSlider:", v4);

}

id sub_10003CDD4(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_runSelectedSliderTestForViewController:withOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10003CDE4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003CE70;
  v7[3] = &unk_10006B110;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  objc_msgSend(v6, "ppt_executeAfterRender:", v7);

}

void sub_10003CE70(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = (void *)a1[4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003CEF8;
  v6[3] = &unk_10006B110;
  v3 = v2;
  v4 = a1[5];
  v5 = (void *)a1[6];
  v7 = v3;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "ppt_selectAdjustmentsController:", v6);

}

void sub_10003CEF8(uint64_t a1)
{
  id v2;
  int8x16_t v3;
  _QWORD v4[4];
  int8x16_t v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003CF90;
  v4[3] = &unk_10006B110;
  v3 = *(int8x16_t *)(a1 + 32);
  v2 = (id)v3.i64[0];
  v5 = vextq_s8(v3, v3, 8uLL);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "ppt_scrollColorSlider:", v4);

}

id sub_10003CF90(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_runSelectedSliderTestForViewController:withOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10003CFA0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003D02C;
  v7[3] = &unk_10006B110;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  objc_msgSend(v6, "ppt_executeAfterRender:", v7);

}

void sub_10003D02C(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = (void *)a1[4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003D0B4;
  v6[3] = &unk_10006B110;
  v3 = v2;
  v4 = a1[5];
  v5 = (void *)a1[6];
  v7 = v3;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v3, "ppt_selectAdjustmentsController:", v6);

}

void sub_10003D0B4(uint64_t a1)
{
  id v2;
  int8x16_t v3;
  _QWORD v4[4];
  int8x16_t v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003D14C;
  v4[3] = &unk_10006B110;
  v3 = *(int8x16_t *)(a1 + 32);
  v2 = (id)v3.i64[0];
  v5 = vextq_s8(v3, v3, 8uLL);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "ppt_scrollLightSlider:", v4);

}

id sub_10003D14C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_runSelectedSliderTestForViewController:withOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10003D15C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v10 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  objc_msgSend(*(id *)(a1 + 32), "ppt_scrollSelectedSliderByDelta");
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == *(_QWORD *)(a1 + 64))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v8 = v7;

    objc_msgSend(v10, "invalidate");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ppt_renderStatisticsDictionaryForTimeInterval:", v8));
    objc_msgSend(*(id *)(a1 + 40), "finishedCurrentTestWithExtraResults:", v9);

  }
}

void sub_10003D250(id a1, PUPhotoEditViewController *a2)
{
  PUPhotoEditViewController *v2;
  _QWORD v3[4];
  PUPhotoEditViewController *v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003D2C0;
  v3[3] = &unk_10006D620;
  v4 = a2;
  v2 = v4;
  -[PUPhotoEditViewController ppt_executeAfterRender:](v2, "ppt_executeAfterRender:", v3);

}

void sub_10003D2C0(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003D320;
  v2[3] = &unk_10006D620;
  v3 = v1;
  objc_msgSend(v3, "ppt_applyAutoenhance:", v2);

}

void sub_10003D320(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 250000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D3AC;
  block[3] = &unk_10006D620;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_10003D3AC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "ppt_save");
}

void sub_10003D3B4(id a1, PUPhotoEditViewController *a2)
{
  PUPhotoEditViewController *v2;
  _QWORD v3[4];
  PUPhotoEditViewController *v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003D424;
  v3[3] = &unk_10006D620;
  v4 = a2;
  v2 = v4;
  -[PUPhotoEditViewController ppt_executeAfterRender:](v2, "ppt_executeAfterRender:", v3);

}

void sub_10003D424(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003D484;
  v2[3] = &unk_10006D620;
  v3 = v1;
  objc_msgSend(v3, "ppt_selectPerspectiveController:", v2);

}

id sub_10003D484(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "ppt_cancelEdits");
}

void sub_10003D48C(id a1, PUPhotoEditViewController *a2)
{
  PUPhotoEditViewController *v2;
  _QWORD v3[4];
  PUPhotoEditViewController *v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003D4FC;
  v3[3] = &unk_10006D620;
  v4 = a2;
  v2 = v4;
  -[PUPhotoEditViewController ppt_executeAfterRender:](v2, "ppt_executeAfterRender:", v3);

}

void sub_10003D4FC(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003D55C;
  v2[3] = &unk_10006D620;
  v3 = v1;
  objc_msgSend(v3, "ppt_selectCropController:", v2);

}

id sub_10003D55C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "ppt_cancelEdits");
}

void sub_10003D564(id a1, PUPhotoEditViewController *a2)
{
  PUPhotoEditViewController *v2;
  _QWORD v3[4];
  PUPhotoEditViewController *v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003D5D4;
  v3[3] = &unk_10006D620;
  v4 = a2;
  v2 = v4;
  -[PUPhotoEditViewController ppt_executeAfterRender:](v2, "ppt_executeAfterRender:", v3);

}

void sub_10003D5D4(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003D634;
  v2[3] = &unk_10006D620;
  v3 = v1;
  objc_msgSend(v3, "ppt_selectAdjustmentsController:", v2);

}

id sub_10003D634(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "ppt_cancelEdits");
}

void sub_10003D63C(id a1, PUPhotoEditViewController *a2)
{
  PUPhotoEditViewController *v2;
  _QWORD v3[4];
  PUPhotoEditViewController *v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003D6AC;
  v3[3] = &unk_10006D620;
  v4 = a2;
  v2 = v4;
  -[PUPhotoEditViewController ppt_executeAfterRender:](v2, "ppt_executeAfterRender:", v3);

}

void sub_10003D6AC(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D714;
  block[3] = &unk_10006D620;
  v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10003D714(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003D774;
  v2[3] = &unk_10006D620;
  v3 = v1;
  objc_msgSend(v3, "ppt_selectNextLightingEffect:", v2);

}

id sub_10003D774(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "ppt_save");
}

void sub_10003D77C(id a1, PUPhotoEditViewController *a2)
{
  PUPhotoEditViewController *v2;
  _QWORD v3[4];
  PUPhotoEditViewController *v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003D7EC;
  v3[3] = &unk_10006D620;
  v4 = a2;
  v2 = v4;
  -[PUPhotoEditViewController ppt_executeAfterRender:](v2, "ppt_executeAfterRender:", v3);

}

void sub_10003D7EC(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003D84C;
  v2[3] = &unk_10006D620;
  v3 = v1;
  objc_msgSend(v3, "ppt_selectFiltersController:", v2);

}

id sub_10003D84C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "ppt_cancelEdits");
}

void sub_10003D854(id a1, PUPhotoEditViewController *a2)
{
  PUPhotoEditViewController *v2;
  _QWORD v3[4];
  PUPhotoEditViewController *v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003D8C4;
  v3[3] = &unk_10006D620;
  v4 = a2;
  v2 = v4;
  -[PUPhotoEditViewController ppt_executeAfterRender:](v2, "ppt_executeAfterRender:", v3);

}

id sub_10003D8C4(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "ppt_cancelEdits");
}

void sub_10003D8CC(id a1, PUPhotoEditViewController *a2)
{
  -[PUPhotoEditViewController ppt_cancelEdits](a2, "ppt_cancelEdits");
}

void sub_10003D8D4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003D9A8;
  v10[3] = &unk_10006B978;
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v11 = v3;
  v12 = v5;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 48);
  v13 = v6;
  v14 = v7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003DAB8;
  v9[3] = &unk_10006D620;
  v9[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  objc_msgSend(v5, "ppt_startIterationWithBlock:completion:", v10, v9);

}

void sub_10003D9A8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ppt_overOneUpPresentationSession"));
  v5 = *(void **)(a1 + 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentTestName"));
  objc_msgSend(v5, "pu_startedAnimationSubTest:forTest:", CFSTR("Enter"), v6);

  objc_msgSend(v4, "ppt_presentPhotoEditor");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003DAC0;
  v13[3] = &unk_10006B950;
  v8 = *(void **)(a1 + 48);
  v13[4] = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 56);
  v16 = v3;
  v17 = v10;
  v15 = v9;
  v11 = v3;
  v12 = v7;
  objc_msgSend(v12, "ppt_performBlockAfterNextNavigationAnimation:", v13);

}

id sub_10003DAB8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_10003DAC0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  _QWORD v11[5];
  __int128 v12;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "pu_finishedAnimationSubTest:forTest:", CFSTR("Enter"), v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "topViewController"));
  v5 = objc_opt_class(PUPhotoEditViewController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentTestName"));
    objc_msgSend(v6, "pu_startedAnimationSubTest:forTest:", CFSTR("Exit"), v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003DBFC;
    v11[3] = &unk_10006C510;
    v8 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v10 = *(_OWORD *)(a1 + 56);
    v9 = (id)v10;
    v12 = v10;
    objc_msgSend(v8, "ppt_performBlockAfterNextNavigationAnimation:", v11);

  }
  else
  {
    NSLog(CFSTR("navigation to photo editor failed"));
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTest");
  }

}

uint64_t sub_10003DBFC(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[4];
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "pu_finishedAnimationSubTest:forTest:", CFSTR("Exit"), v3);

  return (*(uint64_t (**)(_QWORD, BOOL))(a1[5] + 16))(a1[5], --*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) < 1);
}

void sub_10003DC78(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("iterations")));
  v5 = objc_msgSend(v4, "integerValue");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003DD6C;
  v10[3] = &unk_10006B928;
  v11 = v3;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003DF74;
  v9[3] = &unk_10006D620;
  v9[4] = v7;
  v8 = v3;
  PXIterateAsynchronously(v5, v10, v9);

}

void sub_10003DD6C(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "browsingSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetsDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentAssetReference"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForAssetReference:", v7));

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1000300A0;
  v26 = sub_1000300B0;
  v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003DF7C;
  v19[3] = &unk_10006B900;
  v9 = v8;
  v20 = v9;
  v21 = &v22;
  objc_msgSend(v6, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v9, 0, v19);
  if (v23[5])
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetReferenceAtIndexPath:"));
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_10003DFE4;
    v16 = &unk_10006D648;
    v17 = v5;
    v11 = v10;
    v18 = v11;
    objc_msgSend(v17, "performChanges:", &v13);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKey:", CFSTR("documentMenuActions"), v13, v14, v15, v16));

  if (v12)
    objc_msgSend(a1[6], "_runLoadOneUpDocumentMenuActionsSubTest:", a1[4]);
  objc_msgSend(v3, "next");

  _Block_object_dispose(&v22, 8);
}

void sub_10003DF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10003DF74(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_10003DF7C(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (*(id *)(a1 + 32) != v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = v7;
    *a3 = 1;
  }

}

id sub_10003DFE4(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:", *(_QWORD *)(a1 + 40));
}

id sub_10003DFF0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_runSharingTest:withActivityType:", CFSTR("ScrollShareSheetNatural"), 0);
}

void sub_10003E004(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  _QWORD v19[3];
  char v20;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ppt_overOneUpPresentationSession"));
  objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003E1BC;
  v18[3] = &unk_10006B860;
  v18[4] = v19;
  objc_msgSend(v5, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v6, CFSTR("AddedNextButton"), 1, v18);

  v7 = *(void **)(a1 + 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentTestName"));
  objc_msgSend(v7, "pu_startedAnimationSubTest:forTest:", CFSTR("ShareSheetPresentation"), v8);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003E1D0;
  v12[3] = &unk_10006B8B0;
  v9 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v9;
  v10 = v4;
  v14 = v10;
  v11 = v3;
  v15 = v11;
  v16 = *(id *)(a1 + 48);
  v17 = v19;
  objc_msgSend(v10, "ppt_presentShareSheetWithCompletion:", v12);

  _Block_object_dispose(v19, 8);
}

void sub_10003E1A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003E1BC(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void sub_10003E1D0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void ***v7;
  void ***v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "pu_finishedAnimationSubTest:forTest:", CFSTR("ShareSheetPresentation"), v3);

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003E350;
  v17[3] = &unk_10006B888;
  v6 = *(_QWORD *)(a1 + 40);
  v17[4] = *(_QWORD *)(a1 + 32);
  v18 = *(id *)(a1 + 48);
  objc_msgSend(v4, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:", v5, v6, 1, v17);

  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10003E3D0;
  v12 = &unk_10006B268;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 64);
  v7 = objc_retainBlock(&v9);
  v8 = v7;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 48), "ppt_tapNextButton:", v7, v9, v10, v11, v12, v13, v14, v15);
  else
    ((void (*)(void ***))v7[2])(v7);

}

id sub_10003E350(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "finishedSubTest:forTest:", CFSTR("Sharing"), v3);

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTestName"));
  objc_msgSend(v4, "pu_finishedAnimationSubTest:forTest:", CFSTR("Sharing"), v5);

  return _objc_msgSend(*(id *)(a1 + 32), "tearDownSharingTest:", *(_QWORD *)(a1 + 40));
}

void sub_10003E3D0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  id v20;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "startedSubTest:forTest:withMetrics:", CFSTR("Sharing"), v3, &off_100071BE0);

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTestName"));
  objc_msgSend(v4, "pu_startedAnimationSubTest:forTest:", CFSTR("Sharing"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTestName"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ScrollShareSheetNatural"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTestName"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("ScrollShareSheetCarousel"));

  if (v9)
    v10 = 3;
  else
    v10 = 0;
  if ((v7 & 1) != 0 || v9)
  {
    v11 = *(void **)(a1 + 40);
    if (v11)
    {
      if (objc_msgSend(v11, "_appearState") == 2)
      {
        v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "ppt_activityViewController"));
        if (v20)
        {
          if (+[PhotosTestingRPTHelper isRPTAvailable](PhotosTestingRPTHelper, "isRPTAvailable"))
          {
            v12 = objc_opt_respondsToSelector(v20, "runScrollingTestWithName:type:completionHandler:");
            v13 = v20;
            if ((v12 & 1) == 0)
            {
LABEL_22:

              return;
            }
            v14 = *(void **)(a1 + 32);
            v15 = v20;
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentTestName"));
            objc_msgSend(v15, "runScrollingTestWithName:type:completionHandler:", v16, v10, 0);

LABEL_21:
            v13 = v20;
            goto LABEL_22;
          }
          v18 = *(void **)(a1 + 32);
          v19 = CFSTR("RecapPerformanceTesting FWS is not available.");
        }
        else
        {
          v18 = *(void **)(a1 + 32);
          v19 = CFSTR("ActivityViewController is nil");
        }
        objc_msgSend(v18, "failedCurrentTestWithFailure:", v19);
        goto LABEL_21;
      }
      v17 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("OneUpViewController:%@ is nil or has not appeared yet."), v17);
    return;
  }
  if (*(_QWORD *)(a1 + 56))
    _objc_msgSend(*(id *)(a1 + 48), "ppt_shareUsingActivityOfType:");
  else
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Code which should be unreachable has been reached."));
}

void sub_10003E5E4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E65C;
  v4[3] = &unk_10006D648;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

id sub_10003E65C(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "ppt_cancelActivity");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E6C4;
  v4[3] = &unk_10006D620;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v2, "ppt_dismissShareSheetWithCompletion:", v4);
}

id sub_10003E6C4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_10003E6CC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003E780;
  v8[3] = &unk_10006C088;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003E82C;
  v7[3] = &unk_10006D620;
  v7[4] = v5;
  v6 = v3;
  objc_msgSend(v5, "ppt_startIterationWithBlock:completion:", v8, v7);

}

void sub_10003E780(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ppt_overOneUpPresentationSession"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003E834;
  v8[3] = &unk_10006C510;
  v5 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v5;
  v9 = v4;
  v6 = v3;
  v7 = v4;
  objc_msgSend(v7, "ppt_presentShareSheetWithCompletion:", v8);

}

id sub_10003E82C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_10003E834(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[4];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003E8B0;
  v4[3] = &unk_10006B810;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "ppt_dismissShareSheetWithCompletion:", v4);

}

uint64_t sub_10003E8B0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1);
}

void sub_10003E8E0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[3];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD *v42;
  uint64_t v43;
  id v44;
  _QWORD v45[5];

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "browsingSession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewModel"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetsDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTestOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("maxPhotosCount")));
  v11 = objc_msgSend(v10, "integerValue");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("offset")));
  v13 = (uint64_t)objc_msgSend(v12, "integerValue");

  if (v13 <= 1)
    v14 = 1;
  else
    v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v11));
  if ((a3 & 1) != 0)
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastItemIndexPath"));
  else
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstItemIndexPath"));
  v17 = (void *)v16;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10003EC60;
  v40[3] = &unk_10006B798;
  v42 = v45;
  v43 = v14;
  v18 = v15;
  v41 = v18;
  v44 = v11;
  objc_msgSend(v8, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v17, a3, v40);
  if (objc_msgSend(v18, "count"))
  {
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v39 = 0;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("iterations")));
    v20 = objc_msgSend(v19, "integerValue");

    v39 = v20;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = sub_1000300A0;
    v36[4] = sub_1000300B0;
    v37 = 0;
    v21 = objc_alloc_init((Class)PXStatsCalculator);
    objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
    v22 = *(void **)(a1 + 32);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10003ECCC;
    v28[3] = &unk_10006B7E8;
    v34 = v36;
    v29 = v8;
    v30 = v7;
    v31 = v5;
    v32 = v21;
    v35 = v38;
    v33 = v18;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10003EE64;
    v25[3] = &unk_10006D648;
    v23 = v32;
    v24 = *(_QWORD *)(a1 + 32);
    v26 = v23;
    v27 = v24;
    objc_msgSend(v22, "ppt_startIterationWithBlock:completion:", v28, v25);

    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v38, 8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Couldn't find any photos"));
  }

  _Block_object_dispose(v45, 8);
}

void sub_10003EC24(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id sub_10003EC60(id result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;
  id *v6;

  v3 = *(_QWORD *)(*((_QWORD *)result + 5) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  if (!(v4 % *((_QWORD *)result + 6)))
  {
    v6 = (id *)result;
    objc_msgSend(*((id *)result + 4), "addObject:", a2);
    result = objc_msgSend(v6[4], "count");
    if (result >= v6[7])
      *a3 = 1;
  }
  return result;
}

void sub_10003ECCC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "nextObject"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetReferenceAtIndexPath:", v4));
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v7 = v6;
    v8 = *(void **)(a1 + 40);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003EFFC;
    v19[3] = &unk_10006D648;
    v20 = v8;
    v21 = v5;
    v9 = v5;
    objc_msgSend(v20, "performChanges:", v19);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003F004;
    v15[3] = &unk_10006B7C0;
    v18 = v7;
    v10 = *(void **)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v17 = v3;
    objc_msgSend(v10, "ppt_notifyWhenFullQualityIsDisplayedWithTimeout:handler:", v15, 2.0);

  }
  else
  {
    v11 = --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 64), "objectEnumerator"));
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    (*((void (**)(id, unint64_t))v3 + 2))(v3, v11 >> 63);
  }

}

void sub_10003EE64(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "count")));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v2, CFSTR("highQualityImage-Latency:count"));

  objc_msgSend(*(id *)(a1 + 32), "mean");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v3, CFSTR("highQualityImage-Latency:mean"));

  objc_msgSend(*(id *)(a1 + 32), "standardDeviation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, CFSTR("highQualityImage-Latency:stdev"));

  objc_msgSend(*(id *)(a1 + 32), "min");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("highQualityImage-Latency:min"));

  objc_msgSend(*(id *)(a1 + 32), "max");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("highQualityImage-Latency:max"));

  objc_msgSend(*(id *)(a1 + 32), "mean");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0 / v7));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("highQualityImage-ImagesPerSecond"));

  objc_msgSend(*(id *)(a1 + 40), "finishedCurrentTestWithExtraResults:", v9);
}

id sub_10003EFFC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:", *(_QWORD *)(a1 + 40));
}

void sub_10003F004(uint64_t a1, int a2)
{
  double v3;
  _QWORD block[4];
  id v5;

  if (a2)
  {
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    objc_msgSend(*(id *)(a1 + 32), "addValue:", v3 - *(double *)(a1 + 48));
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F098;
  block[3] = &unk_10006D4D0;
  v5 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_10003F098(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_10003F0A8(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_runScrubTestWithOneUpViewController:options:", a2, *(_QWORD *)(a1 + 40));
}

void sub_10003F0B8(uint64_t a1, void *a2)
{
  uint64_t v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double Width;
  double v12;
  double v13;
  uint64_t v14;
  id v15;
  CGRect v16;

  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "ppt_mainScrollView"));
  v3 = objc_opt_class(UIScrollView);
  isKindOfClass = objc_opt_isKindOfClass(v15, v3);
  v5 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentTestName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("iterations")));
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v15, "contentSize");
    v10 = v9;
    objc_msgSend(v15, "bounds");
    Width = CGRectGetWidth(v16);
    objc_msgSend(v15, "_interpageSpacing");
    v13 = v10 / (Width + v12);
    if ((uint64_t)v13 >= 10)
      v14 = 10;
    else
      v14 = (uint64_t)v13;
    objc_msgSend(v15, "pu_ppt_performPageSwipeTest:iterations:numberOfPages:scrollAxis:", v6, v8, v14, 1);

  }
  else
  {
    objc_msgSend(v5, "failedCurrentTest");
  }

}

void sub_10003F1B0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("openInfoPanel")));

  if (v3)
  {
    objc_msgSend(v5, "ppt_toggleAccessoryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    objc_msgSend(v4, "layoutIfNeeded");

  }
  objc_msgSend(*(id *)(a1 + 40), "_runScrollTestWithOneUpViewController:options:", v5, *(_QWORD *)(a1 + 32));

}

void sub_10003F22C(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD block[5];
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "ppt_toggleAccessoryView");
  v2 = dispatch_time(0, 1000000 * *(_QWORD *)(a1 + 64));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F2E8;
  block[3] = &unk_10006B770;
  v3 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = v5;
  v8 = v4;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10003F2E8(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003F3B8;
  v6[3] = &unk_10006B748;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = v4;
  v9 = v3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003F4A8;
  v5[3] = &unk_10006D620;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "ppt_startIterationWithBlock:completion:", v6, v5);

}

void sub_10003F3B8(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pu_startedAnimationSubTest:forTest:", CFSTR("RevealRelatedTransition"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "ppt_toggleAccessoryView");
  v4 = dispatch_time(0, 1000000 * *(_QWORD *)(a1 + 64));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003F4B0;
  v9[3] = &unk_10006B720;
  v5 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = v7;
  v11 = v6;
  v12 = v3;
  v8 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v9);

}

id sub_10003F4A8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_10003F4B0(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  id v4;
  __int128 v5;
  _QWORD block[5];
  id v7;
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", CFSTR("RevealRelatedTransition"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "pu_startedAnimationSubTest:forTest:", CFSTR("HideRelatedTransition"), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "ppt_toggleAccessoryView");
  v2 = dispatch_time(0, 1000000 * *(_QWORD *)(a1 + 72));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F594;
  block[3] = &unk_10006D328;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = *(_OWORD *)(a1 + 56);
  v4 = (id)v5;
  v8 = v5;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);

}

uint64_t sub_10003F594(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pu_finishedAnimationSubTest:forTest:", CFSTR("HideRelatedTransition"), *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) < 1);
}

void sub_10003F5F0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (v8)
    objc_msgSend(WeakRetained, "_oneUpDetailsTransitionWith:testOptions:", v8, *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(WeakRetained, "failedCurrentTestWithFailure:", CFSTR("%@"), v5);

}

id sub_10003F678(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_oneUpDetailsTransitionWith:testOptions:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t sub_10003F688(uint64_t a1)
{
  return PXPreferencesSetLibraryFilterViewModeWithSharedLibraryOrPreview(*(_QWORD *)(a1 + 32), 1);
}

void sub_10003F694(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003F738;
  v3[3] = &unk_10006B688;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "_navigateToContentSyndicationOneUpWithCompleteHandler:", v3);

  objc_destroyWeak(&v4);
}

void sub_10003F724(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003F738(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id *v11;
  id WeakRetained;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "browsingSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewModel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetsDataSource"));
  v10 = objc_msgSend(v9, "isEmpty");

  v11 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v11);
  v13 = WeakRetained;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "failedCurrentTestWithFailure:", CFSTR("%@"), v6);

  }
  else
  {
    objc_msgSend(WeakRetained, "startedCurrentTest");

    objc_msgSend(v5, "ppt_toggleAccessoryView");
    v14 = objc_loadWeakRetained(v11);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003F888;
    v15[3] = &unk_10006B660;
    objc_copyWeak(&v16, v11);
    objc_msgSend(v14, "installCACommitCompletionBlock:", v15);

    objc_destroyWeak(&v16);
  }

}

void sub_10003F874(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10003F888(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishedCurrentTest");

}

id sub_10003F8B4(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_configureLibraryFilterModeWithTestOptions:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003F924;
  v4[3] = &unk_10006B638;
  v4[4] = v2;
  return objc_msgSend(v2, "_navigateToAssetInOneUpPreferLocationAndFace:forCurrentTest:", 1, v4);
}

void sub_10003F924(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "browsingSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetsDataSource"));
  v7 = objc_msgSend(v6, "isEmpty");

  v8 = *(void **)(a1 + 32);
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v8, "failedCurrentTest");
  }
  else
  {
    objc_msgSend(v8, "startedCurrentTest");
    objc_msgSend(v3, "ppt_toggleAccessoryView");
    v9 = *(void **)(a1 + 32);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003F9F4;
    v10[3] = &unk_10006D620;
    v10[4] = v9;
    objc_msgSend(v9, "installCACommitCompletionBlock:", v10);
  }

}

id sub_10003F9F4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_10003F9FC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "contentScrollView"));
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTestName"));
  objc_msgSend(v3, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v4, *(_QWORD *)(a1 + 40), v5, 0);

}

void sub_10003FA6C(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "contentScrollView"));
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTestName"));
  objc_msgSend(v3, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v4, *(_QWORD *)(a1 + 40), v5, 0);

}

void sub_10003FADC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "contentScrollView"));
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTestName"));
  objc_msgSend(v3, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v4, *(_QWORD *)(a1 + 40), v5, 0);

}

void sub_10003FB4C(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  if (a2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "ppt_scrollView"));
    objc_msgSend(*(id *)(a1 + 32), "ppt_performScrollTest:withOptions:scrollView:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v4, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedTest:withFailure:", *(_QWORD *)(a1 + 40), a3);
  }
}

void sub_10003FBB4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  unsigned int v9;
  void *v10;
  dispatch_time_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  v4 = objc_opt_class(PUFeedViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("allVideos")));
    v6 = v5;
    if (v5)
      v7 = objc_msgSend(v5, "compare:options:", CFSTR("yes"), 1) == 0;
    else
      v7 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance"));
    v9 = objc_msgSend(v8, "forceAllItemsAsVideo");

    if (v7 != v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[PUFeedSettings sharedInstance](PUFeedSettings, "sharedInstance"));
      objc_msgSend(v10, "setForceAllItemsAsVideo:", v7);

    }
    v11 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003FD2C;
    block[3] = &unk_10006B110;
    v12 = v3;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v16 = v12;
    v17 = v13;
    v18 = v14;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTest");
  }

}

void sub_10003FD2C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ppt_currentCollectionView"));
  v2 = *(void **)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v3, *(_QWORD *)(a1 + 48), v4, 0);

}

BOOL sub_10003FD9C(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "provider"));
  v4 = objc_msgSend(v3, "albumListType") == *(id *)(a1 + 32);

  return v4;
}

void sub_10003FDE0(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;

  v3 = (void *)a1[4];
  v4 = a1[6];
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_horizontalAlbumListGadgetForType:fromAlbumsGadgetViewController:", v4, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationHelper"));

  objc_msgSend(v7, "navigateToGadgetDeferIfNeeded:animated:nestedNavigationBlock:", v6, 0, 0);
  v8 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FEE0;
  block[3] = &unk_10006B110;
  v9 = a1[4];
  v10 = (void *)a1[5];
  v13 = v6;
  v14 = v9;
  v15 = v10;
  v11 = v6;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10003FEE0(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "collectionView"));
  v2 = *(void **)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:completionHandler:", v3, *(_QWORD *)(a1 + 48), v4, 1, 0);

}

id sub_10003FF54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (a2)
    return _objc_msgSend(v4, "_runScrubTestWithOneUpViewController:options:", a2, *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v4, "failedCurrentTestWithFailure:", CFSTR("%@"), a3);
}

id sub_10003FF9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v4, "_runScrollTestWithOneUpViewController:options:", a2, *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v4, "failedCurrentTestWithFailure:", CFSTR("%@"), a3);
}

void sub_10003FFE4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v10 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_assetForGridViewController:startFromEnd:assetCollection:", v3, 0, &v10));
    v6 = v10;
    if (v5)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10004010C;
      v7[3] = &unk_10006B550;
      v7[4] = *(_QWORD *)(a1 + 32);
      v8 = v3;
      v9 = *(id *)(a1 + 40);
      objc_msgSend(v8, "ppt_navigateToAsset:inAssetContainer:revealInOneUp:completionHandler:", v5, v6, 1, v7);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_10004010C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  dispatch_time_t v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;

  if (a2 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_oneUpViewControllerForViewController:", *(_QWORD *)(a1 + 40)));
    if (v4)
    {
      v5 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004023C;
      block[3] = &unk_10006B528;
      v10 = *(id *)(a1 + 48);
      v9 = v4;
      dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to navigate with result: %ld, error: %@"), a2, a3));
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v7);

  }
}

uint64_t sub_10004023C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void sub_100040250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  if (a2)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_scrollViewToTestForViewController:", a2));
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentTestName"));
    objc_msgSend(v5, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v6, *(_QWORD *)(a1 + 40), v7, 0);

  }
  else
  {
    objc_msgSend(v4, "failedCurrentTestWithFailure:", CFSTR("%@"), a3);
  }
}

void sub_1000402EC(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004035C;
  v3[3] = &unk_10006B4B0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "ppt_navigateToContentSyndicationGridViewControllerWithCompleteHandler:", v3);

}

void sub_10004035C(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = dispatch_time(0, 1000000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100040410;
  v6[3] = &unk_10006B528;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v6);

}

uint64_t sub_100040410(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = objc_opt_class(PXPhotosUIViewController);
  objc_opt_isKindOfClass(v2, v3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100040474(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSourceManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gadgetsOfType:", 21));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v8 = objc_opt_class(PXHorizontalCollectionGadget);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationHelper"));
    objc_msgSend(v9, "navigateToGadgetDeferIfNeeded:animated:nestedNavigationBlock:", v7, 0, 0);

    v10 = dispatch_time(0, 3000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000405CC;
    block[3] = &unk_10006B110;
    v11 = v7;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v15 = v11;
    v16 = v12;
    v17 = v13;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("Could not find syndicated content gadget!"));
  }

}

void sub_1000405CC(uint64_t a1)
{
  double Width;
  void *v3;
  double v4;
  void *v5;
  id v6;
  CGRect v7;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "collectionView"));
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v7);
  objc_msgSend(v6, "contentSize");
  v3 = *(void **)(a1 + 40);
  if (v4 >= Width + Width)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "currentTestName"));
    objc_msgSend(v3, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:completionHandler:", v5, *(_QWORD *)(a1 + 48), v6, 1, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "failedCurrentTestWithFailure:", CFSTR("Syndicated content widget doesn't have enough scrollable content!"));
  }

}

void sub_10004067C(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "mainScrollView"));
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTestName"));
  objc_msgSend(v3, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v4, *(_QWORD *)(a1 + 40), v5, 0);

}

void sub_1000406EC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "mainScrollView"));
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTestName"));
  objc_msgSend(v3, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v4, *(_QWORD *)(a1 + 40), v5, 0);

}

void sub_10004075C(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = dispatch_time(0, 4000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040810;
  block[3] = &unk_10006B110;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100040810(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "collectionView"));
  v2 = *(void **)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v3, *(_QWORD *)(a1 + 48), v4, 0);

}

void sub_100040880(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  void *v7;
  dispatch_time_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "viewProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewModel"));
  v5 = *(id *)(a1 + 56);
  if (v5 == objc_msgSend(v4, "zoomLevel"))
  {
    v6 = 0;
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000409E0;
    v17[3] = &unk_10006B3F0;
    v17[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v4, "performChanges:", v17);
    v6 = 1000000000;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetsDataSourceManager"));
  objc_msgSend(v7, "performChanges:", &stru_10006B410);

  v8 = dispatch_time(0, v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000409EC;
  block[3] = &unk_10006B268;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v13 = v3;
  v14 = v9;
  v15 = v10;
  v16 = *(id *)(a1 + 48);
  v11 = v3;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

}

id sub_1000409E0(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "setZoomLevel:", *(_QWORD *)(a1 + 32));
}

void sub_1000409EC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "gridView"));
  objc_msgSend(*(id *)(a1 + 40), "ppt_performScrollTest:withOptions:gridView:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v2, 0);

}

void sub_100040A38(id a1, PXCuratedLibraryMutableAssetsDataSourceManager *a2)
{
  -[PXCuratedLibraryMutableAssetsDataSourceManager forceAccurateAllSectionsIfNeeded](a2, "forceAccurateAllSectionsIfNeeded");
}

void sub_100040A40(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100040AD4;
  v7[3] = &unk_10006B3D0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  objc_msgSend(v6, "ppt_prepareForSearchScrollingTestWithSearchText:completion:", CFSTR("a"), v7);

}

void sub_100040AD4(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ppt_dismissKeyboard");
  v4 = dispatch_time(0, 20000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040B94;
  block[3] = &unk_10006B110;
  v5 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100040B94(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v3, a1[5], a1[6], 0);

}

void sub_100040BE4(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040C98;
  block[3] = &unk_10006B110;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100040C98(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "collectionView"));
  v2 = *(void **)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentTestName"));
  objc_msgSend(v2, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v3, *(_QWORD *)(a1 + 48), v4, 0);

}

void sub_100040D08(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "startedCurrentTest");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTestName"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100040E20;
  v11[3] = &unk_10006D620;
  v6 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iterations")));
  v8 = objc_msgSend(v7, "integerValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("delay")));
  objc_msgSend(v9, "doubleValue");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100040E28;
  v10[3] = &unk_10006D620;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "ppt_performPlacesZoomTest:preparationHandler:iterations:delay:completion:", v5, v11, v8, v10);

}

id sub_100040E20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
}

id sub_100040E28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

void sub_100040E30(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTestName"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100040F70;
  v13[3] = &unk_10006D620;
  v6 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("iterations")));
  v8 = objc_msgSend(v7, "integerValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("screenDelta")));
  v10 = objc_msgSend(v9, "integerValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("delay")));
  objc_msgSend(v11, "doubleValue");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100040F78;
  v12[3] = &unk_10006D620;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "ppt_performPlacesScrollTest:preparationHandler:iterations:screenDelta:delay:completion:", v5, v13, v8, v10, v12);

}

id sub_100040F70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startedCurrentTest");
}

id sub_100040F78(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishedCurrentTest");
}

id sub_100040F80(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "applySettings:", *(_QWORD *)(a1 + 40));
}

id sub_100040F8C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "applySettings:", *(_QWORD *)(a1 + 40));
}

void sub_100040F98(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "collectionView"));
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTestName"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100041064;
  v7[3] = &unk_10006B330;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v4, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v5, v6, v3, v7);

}

uint64_t sub_100041064(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100041094(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_opt_class(PXPeopleDetailViewController);
  if ((objc_opt_isKindOfClass(v7, v3) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ppt_scrollView"));
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentTestName"));
    objc_msgSend(v5, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v6, *(_QWORD *)(a1 + 40), v4, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "failedCurrentTestWithFailure:", CFSTR("The photos detail view controller is not of type PXPeopleDetailViewController."));
  }

}

void sub_100041140(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000411F4;
  block[3] = &unk_10006B110;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_1000411F4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setPeopleHomeSortingType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setPpt_shouldRunPPTCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "collectionView"));
  v3 = *(void **)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTestName"));
  v5 = *(_QWORD *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000412D0;
  v6[3] = &unk_10006B2B8;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:extraResultsBlock:completionHandler:", v4, v5, v2, 2, v6, 0);

}

id sub_1000412D0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "ppt_scrollingInformation");
}

void sub_1000412D8(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004138C;
  block[3] = &unk_10006B110;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10004138C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setPpt_shouldRunPPTCode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "collectionView"));
  v3 = *(void **)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTestName"));
  v5 = *(_QWORD *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004145C;
  v6[3] = &unk_10006B2B8;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:extraResultsBlock:completionHandler:", v4, v5, v2, 2, v6, 0);

}

id sub_10004145C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "ppt_scrollingInformation");
}

void sub_100041464(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_tungstenViewToTestForViewController:", *(_QWORD *)(a1 + 40)));
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTestName"));
  v5 = *(_QWORD *)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004150C;
  v6[3] = &unk_10006B218;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "ppt_performScrollTest:withOptions:gridView:completionHandler:", v4, v5, v2, v6);

}

void sub_10004150C(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rootViewController"));
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

void sub_100041544(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_tungstenViewToTestForViewController:"));
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTestName"));
    objc_msgSend(v4, "ppt_performScrollTest:withOptions:gridView:completionHandler:", v5, *(_QWORD *)(a1 + 40), v3, 0);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_scrollViewToTestForViewController:", v8));
    if (v5)
    {
      v6 = *(void **)(a1 + 32);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentTestName"));
      objc_msgSend(v6, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v7, *(_QWORD *)(a1 + 40), v5, 0);

    }
  }

}

void sub_10004161C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentTestName"));
  v4 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000416E0;
  v6[3] = &unk_10006B240;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v2;
  v8 = v3;
  v9 = *(id *)(a1 + 56);
  v5 = v2;
  objc_msgSend(v4, "prepareForScrollTestWithName:options:readyHandler:", v5, v8, v6);

}

void sub_1000416E0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100041768;
  v6[3] = &unk_10006B218;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "ppt_performScrollTest:withOptions:scrollView:completionHandler:", v4, v5, a2, v6);

}

id sub_100041768(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

void sub_100041778(uint64_t a1, char a2)
{
  uint64_t v3;
  id v4;

  if ((a2 & 1) != 0)
    v3 = 0;
  else
    v3 = objc_claimAutoreleasedReturnValue(+[NSError px_genericErrorWithDebugDescription:](NSError, "px_genericErrorWithDebugDescription:", CFSTR("Scroll test %@ failed"), *(_QWORD *)(a1 + 32)));
  v4 = (id)v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1000417E8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  PXPPTDidEndScrollTestOnScrollView(*(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

void sub_10004183C(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v6;
  id v7;

  v7 = a2;
  v6 = objc_opt_class(PXGView);
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void sub_1000418B4(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double Area;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  id v29;

  v29 = a2;
  v5 = objc_opt_class(UIScrollView);
  isKindOfClass = objc_opt_isKindOfClass(v29, v5);
  v7 = v29;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_7;
  v8 = (void *)a1[4];
  objc_msgSend(v29, "bounds");
  v9 = objc_msgSend(v8, "convertRect:fromCoordinateSpace:", v29);
  Area = PXSizeGetArea(v9, v10, v11);
  v7 = v29;
  v13 = Area;
  if (Area <= *(double *)(*(_QWORD *)(a1[6] + 8) + 24))
    goto LABEL_7;
  v14 = v29;
  if (v14)
  {
    v15 = objc_opt_class(UIScrollView);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
      goto LABEL_5;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v24 = a1[9];
    v25 = a1[5];
    v26 = (objc_class *)objc_opt_class(UIScrollView);
    v27 = NSStringFromClass(v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "px_descriptionForAssertionMessage"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v24, v25, CFSTR("PhotosApplication-Testing.m"), 819, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("view"), v23, v28);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v19 = a1[9];
    v20 = a1[5];
    v21 = (objc_class *)objc_opt_class(UIScrollView);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v19, v20, CFSTR("PhotosApplication-Testing.m"), 819, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("view"), v23);
  }

LABEL_5:
  v16 = *(_QWORD *)(a1[7] + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v14;

  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v13;
  v7 = v29;
  if (v13 >= *(double *)(*(_QWORD *)(a1[8] + 8) + 24))
    *a3 = 1;
LABEL_7:

}

void sub_100041AB0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    if (v11)
    {
      objc_msgSend(v8, "failedCurrentTestWithFailure:", CFSTR("%@"), v11);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[PXPPTNavigationHelper caseNameStringForPXProgrammaticNavigationResult:](PXPPTNavigationHelper, "caseNameStringForPXProgrammaticNavigationResult:", a2));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to navigate to destination. No reason was given. ProgrammaticNavigationResult is: %@"), v9));
      objc_msgSend(v8, "failedCurrentTestWithFailure:", CFSTR("%@"), v10);

    }
  }

}

uint64_t sub_100041B90(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100041BA4(id a1, PXCuratedLibraryMutableAssetsDataSourceManager *a2)
{
  -[PXCuratedLibraryMutableAssetsDataSourceManager forceAccurateAllSectionsIfNeeded](a2, "forceAccurateAllSectionsIfNeeded");
}

id sub_100041BAC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAllowImageRequests:", *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setAllowCaching:", *(unsigned __int8 *)(a1 + 41));
}

id sub_100041BDC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setHDRConsideration:", *(_QWORD *)(a1 + 40));
}

id sub_100041C08(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;

  v2 = PLPPTGetLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Performing test with selector:%@", (uint8_t *)&v6, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "performSelector:withObject:", NSSelectorFromString(*(NSString **)(a1 + 32)), *(_QWORD *)(a1 + 48));
}

id sub_100041CC4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performTestWithBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_100041CD0(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "failedTest:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t sub_100041D18(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

id sub_100041D30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_computeFibonnaciNumbersForDuration:", *(double *)(a1 + 40) + *(double *)(a1 + 48));
}

void sub_100041D44(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100041E48;
    v5[3] = &unk_10006B070;
    v2 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    v7 = v2;
    v3 = *(id *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    v8 = v3;
    v9 = v4;
    objc_msgSend(v6, "installCACommitCompletionBlock:", v5);

  }
}

id sub_100041DE0(id result)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(*((_QWORD *)result + 7) + 8);
  if (*(_QWORD *)(v1 + 24) == 1)
  {
    v2 = result;
    result = objc_msgSend(*((id *)result + 4), "finishedSubTest:forTest:", v2[5], v2[6]);
    v1 = *(_QWORD *)(v2[7] + 8);
  }
  *(_QWORD *)(v1 + 24) = 2;
  return result;
}

uint64_t sub_100041E2C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, a2);
  return result;
}

id sub_100041E48(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "startedSubTest:forTest:withMetrics:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &off_100071BC8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

id sub_100041E88(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "failedTest:", *(_QWORD *)(a1 + 40));
}

void sub_100041E94(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  id v20;
  CGRect v21;
  CGRect v22;

  v20 = a2;
  if ((objc_msgSend(v20, "isHidden") & 1) == 0)
  {
    v6 = objc_opt_class(UIScrollView);
    if ((objc_opt_isKindOfClass(v20, v6) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v15 = *(void **)(a1 + 32);
      objc_msgSend(v20, "bounds");
      objc_msgSend(v15, "convertRect:fromView:", v20);
      v22.origin.x = v16;
      v22.origin.y = v17;
      v22.size.width = v18;
      v22.size.height = v19;
      v21.origin.x = v8;
      v21.origin.y = v10;
      v21.size.width = v12;
      v21.size.height = v14;
      if (CGRectContainsRect(v21, v22))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
        *a3 = 1;
      }
    }
  }

}

id sub_100041F7C(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ppt_extraResults"));
  objc_msgSend(*(id *)(a1 + 32), "ppt_cleanUpAfterTest:isScrollTest:", *(_QWORD *)(a1 + 40), 1);
  return v2;
}

uint64_t sub_100041FB8(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100042130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100042154(_QWORD *a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if ((a2 & 1) != 0)
  {
    v3 = a1[4];
    if (v3)
      (*(void (**)(void))(v3 + 16))();
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) + 16))();
  }
}

uint64_t sub_100042554(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100043468(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t sub_100043484(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t sub_1000434A0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t sub_1000434BC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void sub_1000434D8(id a1)
{
  byte_10007C148 = +[RPTTestRunner isRecapAvailable](RPTTestRunner, "isRecapAvailable");
}

void sub_100044764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100044C74(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "contentModeIsAvailableForNavigation:", 13);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "navigateToContentMode:animated:completion:", 13, 0, 0);
  return result;
}

void sub_100044CD4(id a1, int64_t a2, NSError *a3)
{
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  __int16 v9;
  NSError *v10;

  v4 = a3;
  if (a2 != 1)
  {
    v5 = PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134218242;
      v8 = a2;
      v9 = 2112;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error navigating to allSharedAlbums destination: result=%ti error=%@", (uint8_t *)&v7, 0x16u);
    }

  }
}

void sub_100044D9C(id a1, int64_t a2, NSError *a3)
{
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  __int16 v9;
  NSError *v10;

  v4 = a3;
  if (a2 != 1)
  {
    v5 = PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134218242;
      v8 = a2;
      v9 = 2112;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error navigating to allAlbums destination: result=%ti error=%@", (uint8_t *)&v7, 0x16u);
    }

  }
}

void sub_100045908(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000459CC;
    block[3] = &unk_10006D648;
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100045AA0;
    v7[3] = &unk_10006D620;
    v7[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }

}

void sub_1000459CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t Log;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  if (objc_msgSend(*(id *)(a1 + 32), "MSContainsErrorWithDomain:code:", kMSASModelErrorDomain, 5))
    v2 = 4;
  else
    v2 = 3;
  Log = PLPhotoSharingGetLog(objc_msgSend(*(id *)(a1 + 40), "_showAlertForError:", v2));
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "ERROR: Failed to subcribe to shared stream %@", (uint8_t *)&v6, 0xCu);
  }

}

id sub_100045AA0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_navigateToPhotoStreamTab");
}

void sub_100045AA8(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "px_firstKeyWindow"));
  objc_msgSend(v2, "pl_presentViewController:animated:", *(_QWORD *)(a1 + 32), 1);

}

void sub_100045B00(id a1, UIAlertAction *a2)
{
  +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 7, 0);
}

void sub_100045B14(id a1, UIAlertAction *a2)
{
  +[PXSystemNavigation navigateToDestination:completion:](PXSystemNavigation, "navigateToDestination:completion:", 4, 0);
}

id objc_msgSend_HDRConsideration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HDRConsideration");
}

id objc_msgSend_MSContainsErrorWithDomain_code_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MSContainsErrorWithDomain:code:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLContexts");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__RPTOppositeOfDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_RPTOppositeOfDirection:");
}

id objc_msgSend__RPTScrollDirectionForContentFromEnd_scrollVertical_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_RPTScrollDirectionForContentFromEnd:scrollVertical:");
}

id objc_msgSend__addTest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addTest:completionHandler:");
}

id objc_msgSend__albumForKnownName_orUUID_requestIsValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_albumForKnownName:orUUID:requestIsValid:");
}

id objc_msgSend__appearState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appearState");
}

id objc_msgSend__assetForGridViewController_startFromEnd_assetCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assetForGridViewController:startFromEnd:assetCollection:");
}

id objc_msgSend__axisFromOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_axisFromOptions:");
}

id objc_msgSend__callCompletionHandlersForTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callCompletionHandlersForTest:");
}

id objc_msgSend__canProceedWithPhotoLibraryInGoodState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canProceedWithPhotoLibraryInGoodState");
}

id objc_msgSend__checkAndAlertSubscribedStreamsLimitReached(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkAndAlertSubscribedStreamsLimitReached");
}

id objc_msgSend__computeFibonnaciNumbersForDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeFibonnaciNumbersForDuration:");
}

id objc_msgSend__configSwipeParams_forSpeed_returnTrip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configSwipeParams:forSpeed:returnTrip:");
}

id objc_msgSend__configureLibraryFilterModeWithTestOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureLibraryFilterModeWithTestOptions:");
}

id objc_msgSend__contentStartFromEndFromOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentStartFromEndFromOptions:");
}

id objc_msgSend__convertAsset_toVariationType_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertAsset:toVariationType:completionHandler:");
}

id objc_msgSend__curatedLibraryVC_transitionToZoomLevel_animationSubTestName_task_then_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_curatedLibraryVC:transitionToZoomLevel:animationSubTestName:task:then:");
}

id objc_msgSend__dequeueNextImportDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dequeueNextImportDevice");
}

id objc_msgSend__dismissStoryFeed_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissStoryFeed:completion:");
}

id objc_msgSend__dismissStoryPlayer_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissStoryPlayer:animated:completion:");
}

id objc_msgSend__endedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endedTest:");
}

id objc_msgSend__ensureSplitViewControllerExistsIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ensureSplitViewControllerExistsIfNeeded");
}

id objc_msgSend__ensureTabbedLibraryViewControllerExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ensureTabbedLibraryViewControllerExists");
}

id objc_msgSend__ensurelemonadeRootViewControllerExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ensurelemonadeRootViewControllerExists");
}

id objc_msgSend__executePendingRequestsIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executePendingRequestsIfNeeded");
}

id objc_msgSend__finishNavigationSuccessfully_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishNavigationSuccessfully:");
}

id objc_msgSend__gridView_performBlockAfterAnimationsCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_gridView:performBlockAfterAnimationsCompleted:");
}

id objc_msgSend__handleFetchedMomentShare_forURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleFetchedMomentShare:forURL:error:");
}

id objc_msgSend__horizontalAlbumListGadgetForType_fromAlbumsGadgetViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_horizontalAlbumListGadgetForType:fromAlbumsGadgetViewController:");
}

id objc_msgSend__installWillFinishTestHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_installWillFinishTestHandler:");
}

id objc_msgSend__interpageSpacing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_interpageSpacing");
}

id objc_msgSend__invalidateAppUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateAppUI");
}

id objc_msgSend__isUserActivityExpired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isUserActivityExpired:");
}

id objc_msgSend__itemProviderCollections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemProviderCollections");
}

id objc_msgSend__iterationsFromOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_iterationsFromOptions:");
}

id objc_msgSend__launchUIImagePickerControllerWithOptions_sourceType_mediaTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_launchUIImagePickerControllerWithOptions:sourceType:mediaTypes:");
}

id objc_msgSend__navigateToAlbumForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToAlbumForCurrentTest:");
}

id objc_msgSend__navigateToAlbumsTabForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToAlbumsTabForCurrentTest:");
}

id objc_msgSend__navigateToAssetForCurrentTestInOneUp_startFromEnd_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToAssetForCurrentTestInOneUp:startFromEnd:completion:");
}

id objc_msgSend__navigateToAssetInOneUpForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToAssetInOneUpForCurrentTest:");
}

id objc_msgSend__navigateToAssetInOneUpPreferLocationAndFace_forCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToAssetInOneUpPreferLocationAndFace:forCurrentTest:");
}

id objc_msgSend__navigateToContentSyndicationOneUpWithCompleteHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToContentSyndicationOneUpWithCompleteHandler:");
}

id objc_msgSend__navigateToContentSyndicationSeeAllGridWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToContentSyndicationSeeAllGridWithCompletionHandler:");
}

id objc_msgSend__navigateToCuratedLibraryTabForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToCuratedLibraryTabForCurrentTest:");
}

id objc_msgSend__navigateToDestination_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToDestination:completionHandler:");
}

id objc_msgSend__navigateToForYouForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToForYouForCurrentTest:");
}

id objc_msgSend__navigateToIncomingCMMInvitationForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToIncomingCMMInvitationForCurrentTest:");
}

id objc_msgSend__navigateToIncomingCMMInvitationForCurrentTest_selecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToIncomingCMMInvitationForCurrentTest:selecting:");
}

id objc_msgSend__navigateToLatestMemoryInForYouWithWillPresentHandler_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToLatestMemoryInForYouWithWillPresentHandler:completionHandler:");
}

id objc_msgSend__navigateToLivePhotosForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToLivePhotosForCurrentTest:");
}

id objc_msgSend__navigateToMemoryFeedWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToMemoryFeedWithCompletionHandler:");
}

id objc_msgSend__navigateToMyAlbumListForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToMyAlbumListForCurrentTest:");
}

id objc_msgSend__navigateToOutgoingCMMInvitationForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToOutgoingCMMInvitationForCurrentTest:");
}

id objc_msgSend__navigateToPeopleHomeAnimated_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToPeopleHomeAnimated:withCompletion:");
}

id objc_msgSend__navigateToPhotoStreamTab(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToPhotoStreamTab");
}

id objc_msgSend__navigateToPhotosDetailsForCurrentTestAnimated_willTapHandler_willTransitionHandler_didTransitionHandler_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToPhotosDetailsForCurrentTestAnimated:willTapHandler:willTransitionHandler:didTransitionHandler:completion:");
}

id objc_msgSend__navigateToSearchTabForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToSearchTabForCurrentTest:");
}

id objc_msgSend__navigateToSharedAlbumListForCurrentTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToSharedAlbumListForCurrentTest:");
}

id objc_msgSend__navigateToStoryFeedWithConfiguration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToStoryFeedWithConfiguration:completion:");
}

id objc_msgSend__navigateToStoryPlayerWithConfiguration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_navigateToStoryPlayerWithConfiguration:completion:");
}

id objc_msgSend__nebulaDaemonProxyManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nebulaDaemonProxyManager");
}

id objc_msgSend__newImportViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newImportViewController");
}

id objc_msgSend__oneUpDetailsTransitionWith_testOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_oneUpDetailsTransitionWith:testOptions:");
}

id objc_msgSend__oneUpViewControllerForViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_oneUpViewControllerForViewController:");
}

id objc_msgSend__openItemProviderCollections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openItemProviderCollections:");
}

id objc_msgSend__openMomentShareWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openMomentShareWithURL:");
}

id objc_msgSend__openSpotlightSearchActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openSpotlightSearchActivity:");
}

id objc_msgSend__openUniversalLinkActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openUniversalLinkActivity:");
}

id objc_msgSend__oscillationScrollTestParamsWithScrollBounds_contentFromEnd_axis_speed_pages_iterations_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_oscillationScrollTestParamsWithScrollBounds:contentFromEnd:axis:speed:pages:iterations:completionHandler:");
}

id objc_msgSend__pagesFromOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pagesFromOptions:");
}

id objc_msgSend__paramsArrayByParams_iterations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_paramsArrayByParams:iterations:");
}

id objc_msgSend__performActionType_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performActionType:completionHandler:");
}

id objc_msgSend__performActionsWithCuratedLibraryVC_actionsTypesAndNames_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performActionsWithCuratedLibraryVC:actionsTypesAndNames:completionHandler:");
}

id objc_msgSend__performBlockWhenImportSourceIsReady_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performBlockWhenImportSourceIsReady:");
}

id objc_msgSend__performScrollTest_iterations_delta_length_scrollAxis_extraResultsBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:");
}

id objc_msgSend__performTestWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performTestWithBlock:");
}

id objc_msgSend__performWithoutDeferringTransitions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performWithoutDeferringTransitions:");
}

id objc_msgSend__purgeVariationsCaches(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_purgeVariationsCaches");
}

id objc_msgSend__responderForKeyEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_responderForKeyEvents");
}

id objc_msgSend__runImportTestCommonInit_navigateToImportTab_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runImportTestCommonInit:navigateToImportTab:completionHandler:");
}

id objc_msgSend__runLoadOneUpDocumentMenuActionsSubTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runLoadOneUpDocumentMenuActionsSubTest:");
}

id objc_msgSend__runPhotoEditTestWithOptions_afterEditOpenedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runPhotoEditTestWithOptions:afterEditOpenedBlock:");
}

id objc_msgSend__runRequestImageWithTargetSize_contentMode_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runRequestImageWithTargetSize:contentMode:options:");
}

id objc_msgSend__runScrollTestWithOneUpViewController_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runScrollTestWithOneUpViewController:options:");
}

id objc_msgSend__satisfyAppIntentsURLNavigationPerformerProviderRequestsIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_satisfyAppIntentsURLNavigationPerformerProviderRequestsIfNecessary");
}

id objc_msgSend__schedulePendingNavigation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_schedulePendingNavigation");
}

id objc_msgSend__scrollTestDelta_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollTestDelta:options:");
}

id objc_msgSend__scrollTestLength_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollTestLength:options:");
}

id objc_msgSend__scrollViewToTestForViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollViewToTestForViewController:");
}

id objc_msgSend__setNebulaDaemonProxyManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNebulaDaemonProxyManager:");
}

id objc_msgSend__setPhotoPickerDisplayCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPhotoPickerDisplayCompletion:");
}

id objc_msgSend__shareSheetScrollTestParamsWithScrollBounds_pages_iterations_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shareSheetScrollTestParamsWithScrollBounds:pages:iterations:completionHandler:");
}

id objc_msgSend__showAlertForError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAlertForError:");
}

id objc_msgSend__showCloudPhotoLibraryExitPromptIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showCloudPhotoLibraryExitPromptIfNecessary");
}

id objc_msgSend__showContactsPromptIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showContactsPromptIfNecessary");
}

id objc_msgSend__showSyncReminderPromptIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showSyncReminderPromptIfNecessary");
}

id objc_msgSend__speedFromTestName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_speedFromTestName:");
}

id objc_msgSend__swipeCountFromOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_swipeCountFromOptions:");
}

id objc_msgSend__swipeTestParamsWithScrollBounds_contentFromEnd_axis_speed_swipeCount_iterations_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_swipeTestParamsWithScrollBounds:contentFromEnd:axis:speed:swipeCount:iterations:completionHandler:");
}

id objc_msgSend__tabbedLibraryViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tabbedLibraryViewController");
}

id objc_msgSend__tabbedLibraryViewControllerIfExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tabbedLibraryViewControllerIfExists");
}

id objc_msgSend__tearDownImportViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tearDownImportViewController");
}

id objc_msgSend__transitionCuratedLibraryVC_toZoomLevelsWithSubTestNames_taskHandler_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transitionCuratedLibraryVC:toZoomLevelsWithSubTestNames:taskHandler:completionHandler:");
}

id objc_msgSend__tungstenViewToTestForViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tungstenViewToTestForViewController:");
}

id objc_msgSend__uuidFromURLParams_prefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_uuidFromURLParams:prefix:");
}

id objc_msgSend__zoomLevelFromTestDefinitionZoomLevelName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_zoomLevelFromTestDefinitionZoomLevelName:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_acceptInvitationWithToken_personID_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptInvitationWithToken:personID:completionBlock:");
}

id objc_msgSend_accessoryButtonAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryButtonAction");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "action");
}

id objc_msgSend_actionManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionManager");
}

id objc_msgSend_actionManagerForObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionManagerForObjects:");
}

id objc_msgSend_actionPerformerForActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionPerformerForActionType:");
}

id objc_msgSend_actionPerformerForActionType_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionPerformerForActionType:parameters:");
}

id objc_msgSend_actionTypeForGenericType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionTypeForGenericType:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activationOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activationOptions");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityType");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addDeferredKeyObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDeferredKeyObserver:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addImportControllerObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addImportControllerObserver:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_addValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addValue:");
}

id objc_msgSend_additionalResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "additionalResults");
}

id objc_msgSend_adjustedContentInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustedContentInset");
}

id objc_msgSend_albumIsAvailableForNavigation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "albumIsAvailableForNavigation:");
}

id objc_msgSend_albumListForContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "albumListForContentMode:");
}

id objc_msgSend_albumListInPhotoLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "albumListInPhotoLibrary:");
}

id objc_msgSend_albumListType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "albumListType");
}

id objc_msgSend_albumWithKind_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "albumWithKind:inManagedObjectContext:");
}

id objc_msgSend_albumWithUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "albumWithUuid:");
}

id objc_msgSend_albums(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "albums");
}

id objc_msgSend_albumsToUploadInitiallyInLibrary_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "albumsToUploadInitiallyInLibrary:limit:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allAlbumsCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allAlbumsCollection");
}

id objc_msgSend_allImportedPhotosAlbumCreateIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allImportedPhotosAlbumCreateIfNeeded:");
}

id objc_msgSend_allPersons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allPersons");
}

id objc_msgSend_allowCaching(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowCaching");
}

id objc_msgSend_allowImageRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowImageRequests");
}

id objc_msgSend_alternateWithTitle_action_modifierFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alternateWithTitle:action:modifierFlags:");
}

id objc_msgSend_alwaysBounceHorizontal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alwaysBounceHorizontal");
}

id objc_msgSend_animate_animationRenderingCompletionHandler_proceedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animate:animationRenderingCompletionHandler:proceedHandler:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appleMusicPromptTrigger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appleMusicPromptTrigger");
}

id objc_msgSend_applicationScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationScene");
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationState");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asset");
}

id objc_msgSend_assetActionManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetActionManager");
}

id objc_msgSend_assetAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetAtIndexPath:");
}

id objc_msgSend_assetCollectionSubtype(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetCollectionSubtype");
}

id objc_msgSend_assetIsAvailableForNavigation_inAlbum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetIsAvailableForNavigation:inAlbum:");
}

id objc_msgSend_assetReferenceAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetReferenceAtIndexPath:");
}

id objc_msgSend_assetReferenceForAssetReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetReferenceForAssetReference:");
}

id objc_msgSend_assetWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetWithUUID:");
}

id objc_msgSend_assetsDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetsDataSource");
}

id objc_msgSend_assetsDataSourceManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetsDataSourceManager");
}

id objc_msgSend_assetsInAssetCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetsInAssetCollection:");
}

id objc_msgSend_assetsInSectionIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetsInSectionIndexPath:");
}

id objc_msgSend_assetsToUploadInitiallyInManagedObjectContext_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetsToUploadInitiallyInManagedObjectContext:limit:");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "begin");
}

id objc_msgSend_beginObservingSystemEventsForAutomaticInvalidation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObservingSystemEventsForAutomaticInvalidation");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_browsingSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "browsingSession");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_cachedPrimaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedPrimaryAppleAccount");
}

id objc_msgSend_canContainAssets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canContainAssets");
}

id objc_msgSend_canPerformActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canPerformActionType:");
}

id objc_msgSend_canPerformEditOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canPerformEditOperation:");
}

id objc_msgSend_canPerformEditsWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canPerformEditsWithRootViewController:");
}

id objc_msgSend_canPlayAutoloop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canPlayAutoloop");
}

id objc_msgSend_canRedo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canRedo");
}

id objc_msgSend_canUndo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canUndo");
}

id objc_msgSend_cancelPendingNavigation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPendingNavigation");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_caseNameStringForPXProgrammaticNavigationResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseNameStringForPXProgrammaticNavigationResult:");
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "category");
}

id objc_msgSend_changeRequestForAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeRequestForAsset:");
}

id objc_msgSend_changeRequestForCloudSharedAlbum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeRequestForCloudSharedAlbum:");
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "childViewControllers");
}

id objc_msgSend_clearCacheDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCacheDirectory");
}

id objc_msgSend_clockwise(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clockwise");
}

id objc_msgSend_cloudFeedAssetIsAvailableForNavigation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudFeedAssetIsAvailableForNavigation:");
}

id objc_msgSend_cloudFeedCommentIsAvailableForNavigation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudFeedCommentIsAvailableForNavigation:");
}

id objc_msgSend_cloudFeedInvitationForAlbumIsAvailableForNavigation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudFeedInvitationForAlbumIsAvailableForNavigation:");
}

id objc_msgSend_cloudFeedIsAvailableForNavigation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudFeedIsAvailableForNavigation");
}

id objc_msgSend_cloudKitShareMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudKitShareMetadata");
}

id objc_msgSend_cloudSharedCommentWithGUID_inLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudSharedCommentWithGUID:inLibrary:");
}

id objc_msgSend_collectionActionReceiver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionActionReceiver");
}

id objc_msgSend_collectionAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionAtIndexPath:");
}

id objc_msgSend_collectionListFetchResult(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionListFetchResult");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView");
}

id objc_msgSend_collectionsFetchResult(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionsFetchResult");
}

id objc_msgSend_commandWithTitle_image_action_input_modifierFlags_propertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandWithTitle:image:action:input:modifierFlags:propertyList:");
}

id objc_msgSend_commandWithTitle_image_action_input_modifierFlags_propertyList_alternates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandWithTitle:image:action:input:modifierFlags:propertyList:alternates:");
}

id objc_msgSend_commentIsAvailableForNavigation_inAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commentIsAvailableForNavigation:inAsset:");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commit");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationDescription");
}

id objc_msgSend_configureCollectionViewGridLayout_forWidth_safeAreaInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureCollectionViewGridLayout:forWidth:safeAreaInsets:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectedScenes");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "content");
}

id objc_msgSend_contentModeIsAvailableForNavigation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentModeIsAvailableForNavigation:");
}

id objc_msgSend_contentScrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentScrollView");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentViewController");
}

id objc_msgSend_contextMenuElementsWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextMenuElementsWithHandler:");
}

id objc_msgSend_contextWithPerson_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextWithPerson:type:");
}

id objc_msgSend_convertRect_fromCoordinateSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromCoordinateSpace:");
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromView:");
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toView:");
}

id objc_msgSend_coordinateSpace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinateSpace");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_cplAlbumChangeInPhotoLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cplAlbumChangeInPhotoLibrary:");
}

id objc_msgSend_cplStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cplStatus");
}

id objc_msgSend_createAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAnimation");
}

id objc_msgSend_createLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createLayout");
}

id objc_msgSend_createMastersInLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createMastersInLibrary:");
}

id objc_msgSend_createPhotoLibraryWithURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPhotoLibraryWithURL:options:error:");
}

id objc_msgSend_creationOptionsForUserLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "creationOptionsForUserLibrary");
}

id objc_msgSend_currentAssetReference(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentAssetReference");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDataSource");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentNotificationCenter");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentTestName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTestName");
}

id objc_msgSend_currentTestOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTestOptions");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSource");
}

id objc_msgSend_dataSourceManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSourceManager");
}

id objc_msgSend_dataSourceManagerForAssetCollection_existingAssetsFetchResult_existingKeyAssetsFetchResult_fetchPropertySets_basePredicate_options_ignoreSharedLibraryFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:");
}

id objc_msgSend_dataSourceManagerWithAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSourceManagerWithAsset:");
}

id objc_msgSend_dataSourceManagerWithAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSourceManagerWithAssets:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "day");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultConfigurations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultConfigurations");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultPresenterWithViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultPresenterWithViewController:");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_destinationURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationURL");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didRecieveSpotlightSearchActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRecieveSpotlightSearchActivity");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_donateSignalForEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateSignalForEvent:");
}

id objc_msgSend_done_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "done:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enableDeviceImport(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableDeviceImport");
}

id objc_msgSend_enableInlinePlayback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableInlinePlayback");
}

id objc_msgSend_enableMultiLibraryMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableMultiLibraryMode");
}

id objc_msgSend_engine(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engine");
}

id objc_msgSend_enumerateFeedConfigurationsUsingBlock_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateFeedConfigurationsUsingBlock:completion:");
}

id objc_msgSend_enumerateIndexPathsStartingAtIndexPath_reverseDirection_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateStoryConfigurationsUsingBlock_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateStoryConfigurationsUsingBlock:completion:");
}

id objc_msgSend_estimatedAssetCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedAssetCount");
}

id objc_msgSend_estimatedLibrarySizes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedLibrarySizes");
}

id objc_msgSend_exitDeleteTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitDeleteTime");
}

id objc_msgSend_faceAreaMinX(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceAreaMinX");
}

id objc_msgSend_faceCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "faceCount");
}

id objc_msgSend_failedCurrentTest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedCurrentTest");
}

id objc_msgSend_failedCurrentTestWithFailure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedCurrentTestWithFailure:");
}

id objc_msgSend_failedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedTest:");
}

id objc_msgSend_failedTest_withFailure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedTest:withFailure:");
}

id objc_msgSend_fallbackUndoManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fallbackUndoManager");
}

id objc_msgSend_feedViewControllerWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedViewControllerWithConfiguration:");
}

id objc_msgSend_fetchAssetCollectionsWithType_subtype_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetCollectionsWithType:subtype:options:");
}

id objc_msgSend_fetchAssetsInAssetCollection_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsInAssetCollection:options:");
}

id objc_msgSend_fetchAssetsWithMediaType_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsWithMediaType:options:");
}

id objc_msgSend_fetchAssetsWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsWithOptions:");
}

id objc_msgSend_fetchCloudSharedAlbumsWithGUIDs_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCloudSharedAlbumsWithGUIDs:options:");
}

id objc_msgSend_fetchPersonsWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPersonsWithOptions:");
}

id objc_msgSend_fetchTopLevelUserCollectionsWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchTopLevelUserCollectionsWithOptions:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_finishedCurrentTest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedCurrentTest");
}

id objc_msgSend_finishedCurrentTestWithExtraResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedCurrentTestWithExtraResults:");
}

id objc_msgSend_finishedSubTest_forTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedSubTest:forTest:");
}

id objc_msgSend_finishedTest_extraResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedTest:extraResults:");
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "first");
}

id objc_msgSend_firstAssetCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstAssetCollection");
}

id objc_msgSend_firstItemIndexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstItemIndexPath");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_flowController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flowController");
}

id objc_msgSend_forceAllItemsAsVideo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceAllItemsAsVideo");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_gadgetsOfType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gadgetsOfType:");
}

id objc_msgSend_generateVideoWithFileNameSuffix_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateVideoWithFileNameSuffix:completionHandler:");
}

id objc_msgSend_gesturePerformerForTestWithName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gesturePerformerForTestWithName:options:");
}

id objc_msgSend_getPersistedLibraryContentModeSelection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPersistedLibraryContentModeSelection");
}

id objc_msgSend_gridView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gridView");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleOAuthRedirectURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleOAuthRedirectURL:");
}

id objc_msgSend_handlePhoneInvitationFailuresWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePhoneInvitationFailuresWithCompletionBlock:");
}

id objc_msgSend_hasPersistedLibraryContentModeSelection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPersistedLibraryContentModeSelection");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasReachedLimitOfSubscribedStreamsInLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasReachedLimitOfSubscribedStreamsInLibrary:");
}

id objc_msgSend_hasReloadedWidgetWhenActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasReloadedWidgetWhenActive");
}

id objc_msgSend_hasSharedLibraryOrPreview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSharedLibraryOrPreview");
}

id objc_msgSend_hiddenAlbumIsVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hiddenAlbumIsVisible");
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalSizeClass");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "host");
}

id objc_msgSend_iTunesLibraryAlbumInLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iTunesLibraryAlbumInLibrary:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_importItemProviders_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importItemProviders:completionHandler:");
}

id objc_msgSend_importSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importSource");
}

id objc_msgSend_importViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importViewController");
}

id objc_msgSend_importViewControllerInstanceHost(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importViewControllerInstanceHost");
}

id objc_msgSend_importViewControllerSpec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importViewControllerSpec");
}

id objc_msgSend_inProgressURLNavigationRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inProgressURLNavigationRequest");
}

id objc_msgSend_incrementUploadAttempts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementUploadAttempts");
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "index");
}

id objc_msgSend_indexPathForAssetCollectionReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForAssetCollectionReference:");
}

id objc_msgSend_indexPathForAssetReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForAssetReference:");
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForItem:inSection:");
}

id objc_msgSend_indexPathSetWithIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathSetWithIndexPath:");
}

id objc_msgSend_indexPathsForVisibleItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathsForVisibleItems");
}

id objc_msgSend_initWithAdjustments_rootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAdjustments:rootViewController:");
}

id objc_msgSend_initWithAssetCollection_keyAssetReference_indexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetCollection:keyAssetReference:indexPath:");
}

id objc_msgSend_initWithAssetsDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetsDataSource:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConfiguration_extendedTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:extendedTraitCollection:");
}

id objc_msgSend_initWithContainerView_delegate_testOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerView:delegate:testOptions:");
}

id objc_msgSend_initWithDataSourceManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSourceManager:");
}

id objc_msgSend_initWithDataSourceManager_mediaProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSourceManager:mediaProvider:");
}

id objc_msgSend_initWithDefaultTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDefaultTitle");
}

id objc_msgSend_initWithDelegate_testOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:testOptions:");
}

id objc_msgSend_initWithDestination_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDestination:options:completionHandler:");
}

id objc_msgSend_initWithDestinationURL_rootController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDestinationURL:rootController:");
}

id objc_msgSend_initWithFileBackedAssetDescriptionsBySection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileBackedAssetDescriptionsBySection:");
}

id objc_msgSend_initWithFireDate_interval_repeats_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFireDate:interval:repeats:block:");
}

id objc_msgSend_initWithFirst_second_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFirst:second:");
}

id objc_msgSend_initWithFormFactor_orientation_visibleChromeElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormFactor:orientation:visibleChromeElements:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLayout:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithNavigationRoot_photoLibrary_libraryFilterState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNavigationRoot:photoLibrary:libraryFilterState:");
}

id objc_msgSend_initWithObject_revealMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObject:revealMode:");
}

id objc_msgSend_initWithPHConfiguration_coordinatorActionHandler_loadingStatusManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPHConfiguration:coordinatorActionHandler:loadingStatusManager:");
}

id objc_msgSend_initWithPerson_targetSize_displayScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPerson:targetSize:displayScale:");
}

id objc_msgSend_initWithPhotoLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPhotoLibrary:");
}

id objc_msgSend_initWithPhotoLibrary_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPhotoLibrary:count:");
}

id objc_msgSend_initWithPhotoLibraryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPhotoLibraryURL:");
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSearchText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSearchText:");
}

id objc_msgSend_initWithSelectionManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSelectionManager:");
}

id objc_msgSend_initWithSharedLibraryStatusProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSharedLibraryStatusProvider:");
}

id objc_msgSend_initWithSidebarNavigationController_contentViewController_compactViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSidebarNavigationController:contentViewController:compactViewController:");
}

id objc_msgSend_initWithSpec_photoLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSpec:photoLibrary:");
}

id objc_msgSend_initWithSpec_photoLibrary_libraryFilterState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSpec:photoLibrary:libraryFilterState:");
}

id objc_msgSend_initWithTestName_scrollBounds_scrollContentLength_direction_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:");
}

id objc_msgSend_initWithTestName_scrollingBounds_swipeCount_direction_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestName:scrollingBounds:swipeCount:direction:completionHandler:");
}

id objc_msgSend_initWithTestName_testOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestName:testOptions:");
}

id objc_msgSend_initWithType_revealMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:revealMode:");
}

id objc_msgSend_initWithType_revealMode_asset_assetCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:revealMode:asset:assetCollection:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithUndoManager_privacyController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUndoManager:privacyController:");
}

id objc_msgSend_initWithWelcomeController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWelcomeController:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_initiallyScrolledToBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiallyScrolledToBottom");
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "input");
}

id objc_msgSend_insertChildMenu_atEndOfMenuForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertChildMenu:atEndOfMenuForIdentifier:");
}

id objc_msgSend_insertSiblingMenu_afterMenuForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSiblingMenu:afterMenuForIdentifier:");
}

id objc_msgSend_installCACommitCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installCACommitCompletionBlock:");
}

id objc_msgSend_installNotificationObserverForNotificationName_notificationName_forOneNotification_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installNotificationObserverForNotificationName:notificationName:forOneNotification:usingBlock:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectsSet:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateActionManagerProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateActionManagerProvider");
}

id objc_msgSend_invitationRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitationRecords");
}

id objc_msgSend_invitationState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitationState");
}

id objc_msgSend_inviteePhones(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inviteePhones");
}

id objc_msgSend_isCloudPhotoLibraryEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCloudPhotoLibraryEnabled");
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEmpty");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isLemonadeUIEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLemonadeUIEnabled");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isRPTAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRPTAvailable");
}

id objc_msgSend_isRPTStyleTestName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRPTStyleTestName:");
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRecapAvailable");
}

id objc_msgSend_isSidebarEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSidebarEnabled");
}

id objc_msgSend_isSourceTypeAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSourceTypeAvailable:");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_isZoomLevelEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isZoomLevelEnabled:");
}

id objc_msgSend_itemSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemSize");
}

id objc_msgSend_keyAssetsAtEnd(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyAssetsAtEnd");
}

id objc_msgSend_keyCollectionActionReceiver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyCollectionActionReceiver");
}

id objc_msgSend_keyCommandWithInput_modifierFlags_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyCommandWithInput:modifierFlags:action:");
}

id objc_msgSend_keyRootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyRootViewController");
}

id objc_msgSend_keySpec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keySpec");
}

id objc_msgSend_keyTabbedLibraryViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyTabbedLibraryViewController");
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWindow");
}

id objc_msgSend_kindValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kindValue");
}

id objc_msgSend_lastAssetCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastAssetCollection");
}

id objc_msgSend_lastDidEnterBackgroundDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastDidEnterBackgroundDate");
}

id objc_msgSend_lastImportedPhotosAlbumCreateIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastImportedPhotosAlbumCreateIfNeeded:");
}

id objc_msgSend_lastItemIndexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastItemIndexPath");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastSuccessfulSyncDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastSuccessfulSyncDate");
}

id objc_msgSend_launchedToTest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchedToTest");
}

id objc_msgSend_layoutDirection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutDirection");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_lemonadeRootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lemonadeRootViewController");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_libraryContentControllerSpec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryContentControllerSpec");
}

id objc_msgSend_libraryFilterState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryFilterState");
}

id objc_msgSend_librarySizesFromDB(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "librarySizesFromDB");
}

id objc_msgSend_librarySpecificFetchOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "librarySpecificFetchOptions");
}

id objc_msgSend_libraryViewMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryViewMode");
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedTitle");
}

id objc_msgSend_localizedTitleForActionType_useCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedTitleForActionType:useCase:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "location");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainDisplay");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_mainScrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScrollView");
}

id objc_msgSend_mainSystem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainSystem");
}

id objc_msgSend_mainWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainWindow");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedObjectContext");
}

id objc_msgSend_max(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "max");
}

id objc_msgSend_maxNumberOfPlayingItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxNumberOfPlayingItems");
}

id objc_msgSend_maxSubscribedStreams(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxSubscribedStreams");
}

id objc_msgSend_mean(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mean");
}

id objc_msgSend_measurementsDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "measurementsDictionaryRepresentation");
}

id objc_msgSend_mediaProviderWithLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaProviderWithLibrary:");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaType");
}

id objc_msgSend_menuForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuForIdentifier:");
}

id objc_msgSend_menuWithTitle_image_identifier_options_children_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuWithTitle:image:identifier:options:children:");
}

id objc_msgSend_mergePersons_withPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergePersons:withPerson:");
}

id objc_msgSend_min(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "min");
}

id objc_msgSend_modifierFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifierFlags");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_navigateAllowingRetry_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateAllowingRetry:completion:");
}

id objc_msgSend_navigateToAlbum_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToAlbum:animated:completion:");
}

id objc_msgSend_navigateToAlbumsTabRoot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToAlbumsTabRoot");
}

id objc_msgSend_navigateToAsset_inAlbum_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToAsset:inAlbum:animated:");
}

id objc_msgSend_navigateToCloudFeedAsset_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToCloudFeedAsset:completion:");
}

id objc_msgSend_navigateToCloudFeedComment_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToCloudFeedComment:completion:");
}

id objc_msgSend_navigateToCloudFeedWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToCloudFeedWithCompletion:");
}

id objc_msgSend_navigateToCollection_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToCollection:animated:completion:");
}

id objc_msgSend_navigateToComment_forAsset_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToComment:forAsset:animated:");
}

id objc_msgSend_navigateToContentMode_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToContentMode:animated:completion:");
}

id objc_msgSend_navigateToDestination_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToDestination:completion:");
}

id objc_msgSend_navigateToDestination_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToDestination:options:completionHandler:");
}

id objc_msgSend_navigateToFallbackForDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToFallbackForDestination:");
}

id objc_msgSend_navigateToFeaturedPhotoWithSuggestionIdentifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToFeaturedPhotoWithSuggestionIdentifier:animated:");
}

id objc_msgSend_navigateToFirstGadgetWithTypeDeferIfNeeded_animated_nestedNavigationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToFirstGadgetWithTypeDeferIfNeeded:animated:nestedNavigationBlock:");
}

id objc_msgSend_navigateToGadgetDeferIfNeeded_animated_nestedNavigationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToGadgetDeferIfNeeded:animated:nestedNavigationBlock:");
}

id objc_msgSend_navigateToInitialLocationInNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToInitialLocationInNavigationController:");
}

id objc_msgSend_navigateToInvitationCMMWithIdentifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToInvitationCMMWithIdentifier:animated:");
}

id objc_msgSend_navigateToOneYearAgoSearch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToOneYearAgoSearch");
}

id objc_msgSend_navigateToPeopleAlbumAnimated_revealPersonWithLocalIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToPeopleAlbumAnimated:revealPersonWithLocalIdentifier:completion:");
}

id objc_msgSend_navigateToPhoto_inAssetContainer_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToPhoto:inAssetContainer:animated:");
}

id objc_msgSend_navigateToPhotosDetailsForAssetCollection_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToPhotosDetailsForAssetCollection:animated:");
}

id objc_msgSend_navigateToPlacesAlbumAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToPlacesAlbumAnimated:");
}

id objc_msgSend_navigateToRevealAsset_inAlbum_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToRevealAsset:inAlbum:animated:");
}

id objc_msgSend_navigateToRevealCloudFeedAsset_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToRevealCloudFeedAsset:completion:");
}

id objc_msgSend_navigateToRevealCloudFeedComment_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToRevealCloudFeedComment:completion:");
}

id objc_msgSend_navigateToRevealCloudFeedInvitationForAlbum_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToRevealCloudFeedInvitationForAlbum:completion:");
}

id objc_msgSend_navigateToRevealTheMostRecentMemoryAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToRevealTheMostRecentMemoryAnimated:");
}

id objc_msgSend_navigateToSearchWithHashtag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToSearchWithHashtag:");
}

id objc_msgSend_navigateToSearchWithTerms_searchCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToSearchWithTerms:searchCategories:");
}

id objc_msgSend_navigateToURLDestination_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigateToURLDestination:completionHandler:");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationHelper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationHelper");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_newWithTestName_parameters_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newWithTestName:parameters:completionHandler:");
}

id objc_msgSend_next(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "next");
}

id objc_msgSend_nextExistingParticipantOnRouteToDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextExistingParticipantOnRouteToDestination:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextObject");
}

id objc_msgSend_nextResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextResponder");
}

id objc_msgSend_noteSceneWillEnterForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noteSceneWillEnterForeground:");
}

id objc_msgSend_notificationSuppressionContexts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationSuppressionContexts");
}

id objc_msgSend_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfItemsInSection:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openCloudKitShareWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openCloudKitShareWithURL:");
}

id objc_msgSend_openRoutingURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openRoutingURL:");
}

id objc_msgSend_openUserActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openUserActivity:");
}

id objc_msgSend_originalUniformTypeIdentifierForAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "originalUniformTypeIdentifierForAsset:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pendingCloudKitShareURLToOpen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingCloudKitShareURLToOpen");
}

id objc_msgSend_pendingProgrammaticNavigationRequestToOpen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingProgrammaticNavigationRequestToOpen");
}

id objc_msgSend_pendingURLToOpen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingURLToOpen");
}

id objc_msgSend_pendingUserActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingUserActivity");
}

id objc_msgSend_performActionWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performActionWithCompletionHandler:");
}

id objc_msgSend_performBlockAndWait_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWait:completionHandler:");
}

id objc_msgSend_performChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performChanges:");
}

id objc_msgSend_performChanges_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performChanges:completionHandler:");
}

id objc_msgSend_performChangesAndWait_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performChangesAndWait:error:");
}

id objc_msgSend_performCrashRecoveryIfNeededForceEndLastTimelapseSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performCrashRecoveryIfNeededForceEndLastTimelapseSession:");
}

id objc_msgSend_performRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequest");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_performTransactionAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTransactionAndWait:");
}

id objc_msgSend_photoLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoLibrary");
}

id objc_msgSend_photoLibraryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photoLibraryURL");
}

id objc_msgSend_photosDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photosDataSource");
}

id objc_msgSend_photosWindowSceneDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "photosWindowSceneDelegate");
}

id objc_msgSend_pl_presentViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pl_presentViewController:animated:");
}

id objc_msgSend_pl_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pl_sharedAccountStore");
}

id objc_msgSend_placeholderCommandTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeholderCommandTitle");
}

id objc_msgSend_playbackStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackStyle");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_ppt_activityViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_activityViewController");
}

id objc_msgSend_ppt_animator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_animator");
}

id objc_msgSend_ppt_applyAutoenhance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_applyAutoenhance:");
}

id objc_msgSend_ppt_barsController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_barsController");
}

id objc_msgSend_ppt_beginPausingChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_beginPausingChanges");
}

id objc_msgSend_ppt_bestPersonForBootstrap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_bestPersonForBootstrap");
}

id objc_msgSend_ppt_cancelActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_cancelActivity");
}

id objc_msgSend_ppt_changeIndexPaths_toType_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_changeIndexPaths:toType:withCompletion:");
}

id objc_msgSend_ppt_cleanUpAfterTest_isScrollTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_cleanUpAfterTest:isScrollTest:");
}

id objc_msgSend_ppt_configureSelectedSliderWithSteps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_configureSelectedSliderWithSteps:");
}

id objc_msgSend_ppt_currentCollectionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_currentCollectionView");
}

id objc_msgSend_ppt_determineAxisForScrollView_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_determineAxisForScrollView:withOptions:");
}

id objc_msgSend_ppt_dismiss(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_dismiss");
}

id objc_msgSend_ppt_dismissKeyboard(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_dismissKeyboard");
}

id objc_msgSend_ppt_dismissShareSheetWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_dismissShareSheetWithCompletion:");
}

id objc_msgSend_ppt_documentMenuActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_documentMenuActions");
}

id objc_msgSend_ppt_endPausingChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_endPausingChanges");
}

id objc_msgSend_ppt_executeAfterRender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_executeAfterRender:");
}

id objc_msgSend_ppt_extraResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_extraResults");
}

id objc_msgSend_ppt_indexPathOfPersonWithMostAssets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_indexPathOfPersonWithMostAssets");
}

id objc_msgSend_ppt_indexPathsForPeopleThatCanChangeToType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_indexPathsForPeopleThatCanChangeToType:");
}

id objc_msgSend_ppt_insertImportDataSourceWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_insertImportDataSourceWithOptions:completionHandler:");
}

id objc_msgSend_ppt_installTransitionAnimationCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_installTransitionAnimationCompletionHandler:");
}

id objc_msgSend_ppt_mainScrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_mainScrollView");
}

id objc_msgSend_ppt_namePerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_namePerson:");
}

id objc_msgSend_ppt_navigateToAsset_inAssetContainer_revealInOneUp_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_navigateToAsset:inAssetContainer:revealInOneUp:completionHandler:");
}

id objc_msgSend_ppt_navigateToContentSyndicationGridViewControllerWithCompleteHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_navigateToContentSyndicationGridViewControllerWithCompleteHandler:");
}

id objc_msgSend_ppt_navigateToFirstInvitationCMM_withCompleteHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_navigateToFirstInvitationCMM:withCompleteHandler:");
}

id objc_msgSend_ppt_navigationControllerForContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_navigationControllerForContentMode:");
}

id objc_msgSend_ppt_notifyWhenFullQualityIsDisplayedWithTimeout_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_notifyWhenFullQualityIsDisplayedWithTimeout:handler:");
}

id objc_msgSend_ppt_notifyWhenVKAnalysisIsReadyWithTimeout_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_notifyWhenVKAnalysisIsReadyWithTimeout:handler:");
}

id objc_msgSend_ppt_overOneUpPresentationSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_overOneUpPresentationSession");
}

id objc_msgSend_ppt_performBlockAfterAllWidgetLoadingCompletes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performBlockAfterAllWidgetLoadingCompletes:");
}

id objc_msgSend_ppt_performBlockAfterNextNavigationAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performBlockAfterNextNavigationAnimation:");
}

id objc_msgSend_ppt_performDeleteWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performDeleteWithOptions:completionHandler:");
}

id objc_msgSend_ppt_performImportToLibraryWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performImportToLibraryWithOptions:completionHandler:");
}

id objc_msgSend_ppt_performPlacesScrollTest_preparationHandler_iterations_screenDelta_delay_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performPlacesScrollTest:preparationHandler:iterations:screenDelta:delay:completion:");
}

id objc_msgSend_ppt_performPlacesZoomTest_preparationHandler_iterations_delay_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performPlacesZoomTest:preparationHandler:iterations:delay:completion:");
}

id objc_msgSend_ppt_performScrollTest_withOptions_gridView_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performScrollTest:withOptions:gridView:completionHandler:");
}

id objc_msgSend_ppt_performScrollTest_withOptions_scrollBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performScrollTest:withOptions:scrollBounds:");
}

id objc_msgSend_ppt_performScrollTest_withOptions_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performScrollTest:withOptions:scrollView:completionHandler:");
}

id objc_msgSend_ppt_performScrollTest_withOptions_scrollView_scrollAxis_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:completionHandler:");
}

id objc_msgSend_ppt_performScrollTest_withOptions_scrollView_scrollAxis_extraResultsBlock_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performScrollTest:withOptions:scrollView:scrollAxis:extraResultsBlock:completionHandler:");
}

id objc_msgSend_ppt_performThumbnailWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_performThumbnailWithOptions:completionHandler:");
}

id objc_msgSend_ppt_playCurrentLivePhotoWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_playCurrentLivePhotoWithCompletionHandler:");
}

id objc_msgSend_ppt_playLivePhotoWithWillBeginPlaybackBlock_didEndPlaybackBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_playLivePhotoWithWillBeginPlaybackBlock:didEndPlaybackBlock:");
}

id objc_msgSend_ppt_prepareApplicationForTesting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_prepareApplicationForTesting");
}

id objc_msgSend_ppt_prepareForSearchScrollingTestWithSearchText_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_prepareForSearchScrollingTestWithSearchText:completion:");
}

id objc_msgSend_ppt_prepareForSearchTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_prepareForSearchTest:");
}

id objc_msgSend_ppt_prepareForTest_withOptions_isScrollTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_prepareForTest:withOptions:isScrollTest:");
}

id objc_msgSend_ppt_prepareZeroKeywordRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_prepareZeroKeywordRequest:");
}

id objc_msgSend_ppt_presentPhotoEditor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_presentPhotoEditor");
}

id objc_msgSend_ppt_presentShareSheetWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_presentShareSheetWithCompletion:");
}

id objc_msgSend_ppt_randomPerson(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_randomPerson");
}

id objc_msgSend_ppt_removeImportDataSourceWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_removeImportDataSourceWithOptions:completionHandler:");
}

id objc_msgSend_ppt_renderStatisticsDictionaryForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_renderStatisticsDictionaryForTimeInterval:");
}

id objc_msgSend_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_runTabSwitchingTestWithName:options:delegate:completionHandler:");
}

id objc_msgSend_ppt_scrollBWSlider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_scrollBWSlider:");
}

id objc_msgSend_ppt_scrollColorSlider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_scrollColorSlider:");
}

id objc_msgSend_ppt_scrollLightSlider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_scrollLightSlider:");
}

id objc_msgSend_ppt_scrollSelectedSliderByDelta(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_scrollSelectedSliderByDelta");
}

id objc_msgSend_ppt_scrollTestViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_scrollTestViewController");
}

id objc_msgSend_ppt_scrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_scrollView");
}

id objc_msgSend_ppt_scrollableBoundsForTesting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_scrollableBoundsForTesting");
}

id objc_msgSend_ppt_scrubberView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_scrubberView");
}

id objc_msgSend_ppt_selectAdjustmentsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_selectAdjustmentsController:");
}

id objc_msgSend_ppt_selectCropController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_selectCropController:");
}

id objc_msgSend_ppt_selectFiltersController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_selectFiltersController:");
}

id objc_msgSend_ppt_selectNextLightingEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_selectNextLightingEffect:");
}

id objc_msgSend_ppt_selectPerspectiveController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_selectPerspectiveController:");
}

id objc_msgSend_ppt_setSelecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_setSelecting:");
}

id objc_msgSend_ppt_startIterationWithBlock_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_startIterationWithBlock:completion:");
}

id objc_msgSend_ppt_switchToAlbumsTab(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_switchToAlbumsTab");
}

id objc_msgSend_ppt_tapNextButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_tapNextButton:");
}

id objc_msgSend_ppt_testDefinitions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_testDefinitions");
}

id objc_msgSend_ppt_toggleAccessoryView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_toggleAccessoryView");
}

id objc_msgSend_ppt_toggleDiscloseWidgets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ppt_toggleDiscloseWidgets");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_prepareForScrollTestWithName_options_readyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForScrollTestWithName:options:readyHandler:");
}

id objc_msgSend_prepareForTransitionTestWithName_options_readyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForTransitionTestWithName:options:readyHandler:");
}

id objc_msgSend_prepareInformationForLookups(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareInformationForLookups");
}

id objc_msgSend_presentRetailExperienceView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentRetailExperienceView");
}

id objc_msgSend_presentUpsellSheetIfNecessaryWithActivationOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentUpsellSheetIfNecessaryWithActivationOptions:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentWelcomeViewControllersIfNecessaryFromViewController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentWelcomeViewControllersIfNecessaryFromViewController:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_privacyControllerForCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privacyControllerForCollection:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processName");
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider");
}

id objc_msgSend_pu_debugCurrentAsset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pu_debugCurrentAsset");
}

id objc_msgSend_pu_finishedAnimationSubTest_forTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pu_finishedAnimationSubTest:forTest:");
}

id objc_msgSend_pu_popViewControllerAnimated_interactive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pu_popViewControllerAnimated:interactive:");
}

id objc_msgSend_pu_ppt_performPageSwipeTest_iterations_numberOfPages_scrollAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pu_ppt_performPageSwipeTest:iterations:numberOfPages:scrollAxis:");
}

id objc_msgSend_pu_prepareCPAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pu_prepareCPAnalytics");
}

id objc_msgSend_pu_pushViewController_withTransition_animated_isInteractive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pu_pushViewController:withTransition:animated:isInteractive:");
}

id objc_msgSend_pu_shouldSelectViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pu_shouldSelectViewController:");
}

id objc_msgSend_pu_startedAnimationSubTest_forTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pu_startedAnimationSubTest:forTest:");
}

id objc_msgSend_publicDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publicDescription");
}

id objc_msgSend_purgeAll(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeAll");
}

id objc_msgSend_px_beginPausingChangesWithTimeout_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_beginPausingChangesWithTimeout:identifier:");
}

id objc_msgSend_px_builtInAlbumNameForSubtype_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_builtInAlbumNameForSubtype:");
}

id objc_msgSend_px_deprecated_appPhotoLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_deprecated_appPhotoLibrary");
}

id objc_msgSend_px_descendantViewControllerWithClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_descendantViewControllerWithClass:");
}

id objc_msgSend_px_descriptionForAssertionMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_descriptionForAssertionMessage");
}

id objc_msgSend_px_enableExtendedTraitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_enableExtendedTraitCollection");
}

id objc_msgSend_px_endPausingChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_endPausingChanges:");
}

id objc_msgSend_px_enumerateDescendantSubviewsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_enumerateDescendantSubviewsUsingBlock:");
}

id objc_msgSend_px_firstKeyWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_firstKeyWindow");
}

id objc_msgSend_px_genericErrorWithDebugDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_genericErrorWithDebugDescription:");
}

id objc_msgSend_px_integerValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_integerValues");
}

id objc_msgSend_px_isScrolledAtEdge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_isScrolledAtEdge:");
}

id objc_msgSend_px_localDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_localDefaults");
}

id objc_msgSend_px_navigationDestination(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_navigationDestination");
}

id objc_msgSend_px_photoLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_photoLibrary");
}

id objc_msgSend_px_setHidesTabBarForRegularHorizontalSizeClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_setHidesTabBarForRegularHorizontalSizeClass:");
}

id objc_msgSend_px_systemPhotoLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_systemPhotoLibrary");
}

id objc_msgSend_px_virtualCollections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "px_virtualCollections");
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "query");
}

id objc_msgSend_queryKeysAndValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryKeysAndValues");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_recentAssets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentAssets");
}

id objc_msgSend_redo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redo");
}

id objc_msgSend_redoMenuItemTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redoMenuItemTitle");
}

id objc_msgSend_refreshRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshRate");
}

id objc_msgSend_registerChangeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerChangeObserver:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeMenuForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeMenuForIdentifier:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_replaceChildrenOfMenuForIdentifier_fromChildrenBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:");
}

id objc_msgSend_reportLatency_forOutputQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportLatency:forOutputQuality:");
}

id objc_msgSend_reportPhotosAppEnteredBackground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportPhotosAppEnteredBackground");
}

id objc_msgSend_reportPhotosAppLaunchedOrEnteredForegroundWithPreviousSearchText_previousSearchTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportPhotosAppLaunchedOrEnteredForegroundWithPreviousSearchText:previousSearchTokens:");
}

id objc_msgSend_reportPhotosAppLaunchedOrEnteredForegroundWithSpotlightSearchActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportPhotosAppLaunchedOrEnteredForegroundWithSpotlightSearchActivity");
}

id objc_msgSend_reportPhotosAppQuit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportPhotosAppQuit");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request");
}

id objc_msgSend_requestAccessForEntityType_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAccessForEntityType:completionHandler:");
}

id objc_msgSend_requestAuthorizationWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAuthorizationWithOptions:completionHandler:");
}

id objc_msgSend_requestFaceCropForOptions_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestFaceCropForOptions:resultHandler:");
}

id objc_msgSend_requestImageForAsset_targetSize_contentMode_options_resultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestImageForAsset:targetSize:contentMode:options:resultHandler:");
}

id objc_msgSend_resourceSpecifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceSpecifier");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "role");
}

id objc_msgSend_rootAlbumCollectionList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootAlbumCollectionList");
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootController");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_rotateIfNeeded_before_after_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotateIfNeeded:before:after:");
}

id objc_msgSend_routingOptionsForDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "routingOptionsForDestination:");
}

id objc_msgSend_runEditorialLayoutTestWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runEditorialLayoutTestWithOptions:completionHandler:");
}

id objc_msgSend_runGridLayoutTestWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runGridLayoutTestWithOptions:completionHandler:");
}

id objc_msgSend_runPlaybackStartTestWithElement_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runPlaybackStartTestWithElement:completion:");
}

id objc_msgSend_runRenderTextTestWithOptions_latencyMeter_completionHandler_failureHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runRenderTextTestWithOptions:latencyMeter:completionHandler:failureHandler:");
}

id objc_msgSend_runScrollingTestWithName_type_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runScrollingTestWithName:type:completionHandler:");
}

id objc_msgSend_runTestWithName_RPTOptions_scrollBounds_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestWithName:RPTOptions:scrollBounds:completionHandler:");
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestWithParameters:");
}

id objc_msgSend_runTestWithParameters_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestWithParameters:delegate:");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeAreaInsets");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scale");
}

id objc_msgSend_scheduleDeferredTaskWithQoS_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleDeferredTaskWithQoS:block:");
}

id objc_msgSend_schedulePromptWithIdentifier_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedulePromptWithIdentifier:action:");
}

id objc_msgSend_scheduleTaskWithQoS_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleTaskWithQoS:block:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheme");
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screen");
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenScale");
}

id objc_msgSend_scrollTestCPUSustainDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollTestCPUSustainDuration");
}

id objc_msgSend_scrollTestCPUWarmupDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollTestCPUWarmupDuration");
}

id objc_msgSend_scrollTestRampUpDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollTestRampUpDuration");
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollView");
}

id objc_msgSend_scrollViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollViewController");
}

id objc_msgSend_scrollViewWillBeginDragging_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollViewWillBeginDragging:");
}

id objc_msgSend_scrollingPresetNames(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollingPresetNames");
}

id objc_msgSend_searchControllerSearchText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchControllerSearchText");
}

id objc_msgSend_searchControllerSearchTokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchControllerSearchTokens");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "second");
}

id objc_msgSend_selectedContentMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedContentMode");
}

id objc_msgSend_selectedNavigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedNavigationController");
}

id objc_msgSend_sendEvent_withPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:withPayload:");
}

id objc_msgSend_sendNavigationEndEventForURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNavigationEndEventForURL:");
}

id objc_msgSend_sendNavigationStartEventForURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNavigationStartEventForURL:");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setActionProviderDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionProviderDelegate:");
}

id objc_msgSend_setActivationOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationOptions:");
}

id objc_msgSend_setAllowCaching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowCaching:");
}

id objc_msgSend_setAllowImageRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowImageRequests:");
}

id objc_msgSend_setAllowSecondaryDegradedImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowSecondaryDegradedImage:");
}

id objc_msgSend_setAllowedActionTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedActionTypes:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCallerInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerInfo:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setCurrentTestName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTestName:");
}

id objc_msgSend_setCurrentTestOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTestOptions:");
}

id objc_msgSend_setDefaultValuesWithPresetName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultValuesWithPresetName:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeliveryMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeliveryMode:");
}

id objc_msgSend_setDidRecieveSpotlightSearchActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidRecieveSpotlightSearchActivity:");
}

id objc_msgSend_setDiscoverabilityTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoverabilityTitle:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEnableInlinePlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableInlinePlayback:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFetchPropertySets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchPropertySets:");
}

id objc_msgSend_setForceAllItemsAsVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForceAllItemsAsVideo:");
}

id objc_msgSend_setHDRConsideration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHDRConsideration:");
}

id objc_msgSend_setHasReloadedWidgetWhenActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasReloadedWidgetWhenActive:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImportSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImportSource:");
}

id objc_msgSend_setImportViewController_forImportSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImportViewController:forImportSource:");
}

id objc_msgSend_setImportViewControllerProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImportViewControllerProvider:");
}

id objc_msgSend_setInProgressURLNavigationRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInProgressURLNavigationRequest:");
}

id objc_msgSend_setIncludeAllPhotosSmartAlbum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeAllPhotosSmartAlbum:");
}

id objc_msgSend_setIncludeAssetSourceTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeAssetSourceTypes:");
}

id objc_msgSend_setIncludeHiddenAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeHiddenAssets:");
}

id objc_msgSend_setInternalCreateOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalCreateOptions:");
}

id objc_msgSend_setInternalPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalPredicate:");
}

id objc_msgSend_setInternalSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalSortDescriptors:");
}

id objc_msgSend_setInvitationStateLocalForInvitationRecords_invitationStateLocal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitationStateLocalForInvitationRecords:invitationStateLocal:");
}

id objc_msgSend_setInvitationsDataSourceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitationsDataSourceType:");
}

id objc_msgSend_setIterationDurationFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIterationDurationFactor:");
}

id objc_msgSend_setLargeTitleDisplayMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLargeTitleDisplayMode:");
}

id objc_msgSend_setLastDidEnterBackgroundDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastDidEnterBackgroundDate:");
}

id objc_msgSend_setLastUploadAttemptDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastUploadAttemptDate:");
}

id objc_msgSend_setLemonadeRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLemonadeRootViewController:");
}

id objc_msgSend_setMainWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMainWindow:");
}

id objc_msgSend_setMaxNumberOfPlayingItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxNumberOfPlayingItems:");
}

id objc_msgSend_setMediaTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaTypes:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNameSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNameSelection:");
}

id objc_msgSend_setNetworkAccessAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkAccessAllowed:");
}

id objc_msgSend_setNumber_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumber:forKey:");
}

id objc_msgSend_setNumberOfColumns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfColumns:");
}

id objc_msgSend_setNumberOfRows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfRows:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPendingCloudKitShareURLToOpen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingCloudKitShareURLToOpen:");
}

id objc_msgSend_setPendingProgrammaticNavigationRequestToOpen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingProgrammaticNavigationRequestToOpen:");
}

id objc_msgSend_setPendingURLToOpen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingURLToOpen:");
}

id objc_msgSend_setPendingUserActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingUserActivity:");
}

id objc_msgSend_setPeopleHomeSortingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeopleHomeSortingType:");
}

id objc_msgSend_setPerformerDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPerformerDelegate:");
}

id objc_msgSend_setPersistedLibraryContentModeSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistedLibraryContentModeSelection:");
}

id objc_msgSend_setPpt_cellsLoadedCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPpt_cellsLoadedCompletionBlock:");
}

id objc_msgSend_setPpt_shouldRunPPTCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPpt_shouldRunPPTCode:");
}

id objc_msgSend_setPrefersLargeTitles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrefersLargeTitles:");
}

id objc_msgSend_setPresentationEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationEnvironment:");
}

id objc_msgSend_setPreventSheetDismissal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreventSheetDismissal:");
}

id objc_msgSend_setResizeMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResizeMode:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setSelectedContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedContentMode:");
}

id objc_msgSend_setShouldFlick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldFlick:");
}

id objc_msgSend_setShowHorizontalGadget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowHorizontalGadget:");
}

id objc_msgSend_setShowVerticalSampleGadgets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowVerticalSampleGadgets:");
}

id objc_msgSend_setSidebarViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSidebarViewController:");
}

id objc_msgSend_setSourceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceType:");
}

id objc_msgSend_setSpec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpec:");
}

id objc_msgSend_setSplitViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSplitViewController:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSwipeCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeCount:");
}

id objc_msgSend_setSwipeSpeedFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeSpeedFactor:");
}

id objc_msgSend_setTabbedLibraryViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTabbedLibraryViewController:");
}

id objc_msgSend_setTestName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTestName:");
}

id objc_msgSend_setTestOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTestOptions:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUndoActionsInvalidator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUndoActionsInvalidator:");
}

id objc_msgSend_setVariationSuggestionStates_forVariationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVariationSuggestionStates:forVariationType:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setViewController_forColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewController:forColumn:");
}

id objc_msgSend_setViewMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewMode:");
}

id objc_msgSend_setWantsIncrementalChangeDetails_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsIncrementalChangeDetails:");
}

id objc_msgSend_setWantsNaming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsNaming:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setupAppUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupAppUI");
}

id objc_msgSend_setupOnInternalDevicesWithWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupOnInternalDevicesWithWindow:");
}

id objc_msgSend_setupStatusBarInternalSettingsGestureOnInternalDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupStatusBarInternalSettingsGestureOnInternalDevices");
}

id objc_msgSend_setupSystemPropertyProvidersForLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupSystemPropertyProvidersForLibrary:");
}

id objc_msgSend_setupWithConfigurationFilename_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupWithConfigurationFilename:inBundle:");
}

id objc_msgSend_share(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "share");
}

id objc_msgSend_sharedAlbumsCollectionList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedAlbumsCollectionList");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedContactStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedContactStore");
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedController");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedLibraryStatusProviderWithPhotoLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedLibraryStatusProviderWithPhotoLibrary:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedScheduler");
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedSession");
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedSettings");
}

id objc_msgSend_sharedStreamsEnabledForPhotoLibraryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedStreamsEnabledForPhotoLibraryURL:");
}

id objc_msgSend_sharingPersonID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharingPersonID");
}

id objc_msgSend_shortcutItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortcutItem");
}

id objc_msgSend_shortcutURLForShortcutItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortcutURLForShortcutItem:");
}

id objc_msgSend_shouldMobileSlideShowLaunchWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldMobileSlideShowLaunchWithError:");
}

id objc_msgSend_shouldPromptUserForLibrarySchemaMismatch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldPromptUserForLibrarySchemaMismatch");
}

id objc_msgSend_shouldTestNestedScrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldTestNestedScrollView");
}

id objc_msgSend_shouldUseRPTScrollingForRPTOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUseRPTScrollingForRPTOptions:");
}

id objc_msgSend_showBootstrapIfNeededWithContext_fromParentVC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showBootstrapIfNeededWithContext:fromParentVC:");
}

id objc_msgSend_showBootstrapIfNeededWithContext_fromParentVC_force_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showBootstrapIfNeededWithContext:fromParentVC:force:delegate:");
}

id objc_msgSend_showDetailsForMemberAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showDetailsForMemberAtIndexPath:");
}

id objc_msgSend_showNetworkPromptIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showNetworkPromptIfNecessary");
}

id objc_msgSend_showPromptsIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showPromptsIfNeededWithCompletion:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "size");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_spec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spec");
}

id objc_msgSend_specForIdiom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specForIdiom:");
}

id objc_msgSend_splitViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "splitViewController");
}

id objc_msgSend_standardDeviation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardDeviation");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startAppTracking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAppTracking");
}

id objc_msgSend_startMeasurementsForOutputType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMeasurementsForOutputType:");
}

id objc_msgSend_startServerOnInternalDevicesWithAgentClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startServerOnInternalDevicesWithAgentClass:");
}

id objc_msgSend_startViewTracking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startViewTracking");
}

id objc_msgSend_startedCurrentTest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedCurrentTest");
}

id objc_msgSend_startedSubTest_forTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedSubTest:forTest:");
}

id objc_msgSend_startedSubTest_forTest_withMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedSubTest:forTest:withMetrics:");
}

id objc_msgSend_startedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedTest:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_stateRestorationActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateRestorationActivity");
}

id objc_msgSend_stopMeasurements(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopMeasurements");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_submitWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitWithCompletionHandler:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subviews");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superview");
}

id objc_msgSend_swipeSpeedFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "swipeSpeedFactor:");
}

id objc_msgSend_system(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "system");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_systemLibraryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLibraryURL");
}

id objc_msgSend_systemPhotoLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemPhotoLibrary");
}

id objc_msgSend_tabbedLibraryViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabbedLibraryViewController");
}

id objc_msgSend_targetForAction_withSender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetForAction:withSender:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topViewController");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_typeWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeWithIdentifier:");
}

id objc_msgSend_undo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undo");
}

id objc_msgSend_undoActionsInvalidator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undoActionsInvalidator");
}

id objc_msgSend_undoManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undoManager");
}

id objc_msgSend_undoMenuItemTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undoMenuItemTitle");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateAppShortcutParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAppShortcutParameters");
}

id objc_msgSend_updateDisplayedTabsAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDisplayedTabsAnimated:");
}

id objc_msgSend_updateShowHiddenAlbumCachedValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateShowHiddenAlbumCachedValue");
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userActivities");
}

id objc_msgSend_userActivityURLForUserActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userActivityURLForUserActivity:");
}

id objc_msgSend_userDidViewSharedLibraryParticipantAssetTrashNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDidViewSharedLibraryParticipantAssetTrashNotification");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_userLibraryAlbumInLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userLibraryAlbumInLibrary:");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuid");
}

id objc_msgSend_uuidFromAssetURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuidFromAssetURL:");
}

id objc_msgSend_uuidFromLocalIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuidFromLocalIdentifier:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_variationCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "variationCache");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewController");
}

id objc_msgSend_viewControllerWithConfiguration_contentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerWithConfiguration:contentViewController:");
}

id objc_msgSend_viewControllerWithPhotoLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerWithPhotoLibrary:");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllers");
}

id objc_msgSend_viewModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewModel");
}

id objc_msgSend_viewProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewProvider");
}

id objc_msgSend_viewResetTimeoutDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewResetTimeoutDuration");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "webpageURL");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowScene");
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windows");
}

id objc_msgSend_yellowColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "yellowColor");
}

id objc_msgSend_zoomLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zoomLevel");
}
