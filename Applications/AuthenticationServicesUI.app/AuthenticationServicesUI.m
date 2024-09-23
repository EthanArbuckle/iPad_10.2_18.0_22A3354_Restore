uint64_t sub_100003698()
{
  if (qword_100011DA8 != -1)
    dispatch_once(&qword_100011DA8, &stru_10000C540);
  return qword_100011DA0;
}

void sub_1000036D8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.AuthenticationServicesUI", "Authorization");
  v2 = (void *)qword_100011DA0;
  qword_100011DA0 = (uint64_t)v1;

}

void sub_100003934(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 80))
  {
    *(_BYTE *)(v1 + 80) = 1;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000039FC;
    v6[3] = &unk_10000C568;
    v6[4] = *(_QWORD *)(a1 + 32);
    v3 = objc_retainBlock(v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "navigationController"));
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v3);
    else
      ((void (*)(_QWORD *))v3[2])(v3);

  }
}

id sub_1000039FC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
  objc_msgSend(v4, "invalidate");

  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLookupConnection");
}

void sub_100003B84(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 64))
    objc_msgSend(*(id *)(v1 + 8), "updateInterfaceWithLoginChoices:", *(_QWORD *)(a1 + 40));
  else
    objc_storeStrong((id *)(v1 + 56), *(id *)(a1 + 40));
}

_QWORD *sub_100003C24(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (*(_BYTE *)(v1 + 64))
    return objc_msgSend(*(id *)(v1 + 8), "presentPINEntryInterface");
  *(_BYTE *)(v1 + 48) = 1;
  return result;
}

id sub_100003D18(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "authorizationViewController:didCompleteWithCredential:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0, *(_QWORD *)(a1 + 40));
}

id sub_100003D8C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cableClientWillConnect");
}

id sub_100003DF8(uint64_t a1)
{
  return _objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cableClientWillAuthenticate");
}

void sub_100004190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000041C8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = sub_100003698();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100007BD0(v5, v3);
    objc_msgSend(WeakRetained, "_dismissAndExit");
  }

}

id sub_100004420(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissAndExit");
}

uint64_t sub_1000044E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id sub_100004620(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissAndExit");
}

id sub_1000046A0(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
  return _objc_msgSend(*(id *)(a1 + 32), "_performQueuedUpdatesIfNecessary");
}

id sub_100004714(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000476C;
  v3[3] = &unk_10000C568;
  v3[4] = v1;
  return objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, v3);
}

void sub_10000476C(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000047C8;
  block[3] = &unk_10000C568;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1000047C8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showAuthorizationFlow");
}

void sub_100004888(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t start(int a1, char **a2)
{
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  uint64_t v7;

  v4 = (objc_class *)objc_opt_class(ASViewServiceApplicationDelegate);
  v5 = NSStringFromClass(v4);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(v5);
  v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

uint64_t sub_1000048F4()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100004974(v0, qword_100011DB0);
  sub_1000049B4(v0, (uint64_t)qword_100011DB0);
  return Logger.init(subsystem:category:)(0xD000000000000022, 0x800000010000B3A0, 0xD000000000000010, 0x800000010000B3D0);
}

uint64_t *sub_100004974(uint64_t a1, uint64_t *a2)
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

uint64_t sub_1000049B4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_1000049CC(char a1)
{
  char *v1;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  NSObject *v10;
  _QWORD v11[6];
  objc_super v12;

  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for RootViewController();
  objc_msgSendSuper2(&v12, "viewDidAppear:", a1 & 1);
  v3 = *(void **)&v1[OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController];
  if (v3)
  {
    v4 = v3;
    -[NSObject setModalPresentationStyle:](v4, "setModalPresentationStyle:", 3);
    v11[4] = sub_100004B64;
    v11[5] = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_100004C30;
    v11[3] = &unk_10000C700;
    v5 = _Block_copy(v11);
    objc_msgSend(v1, "presentViewController:animated:completion:", v4, 0, v5);
    _Block_release(v5);
    if (qword_100011A20 != -1)
      swift_once(&qword_100011A20, sub_1000048F4);
    v6 = type metadata accessor for Logger(0);
    sub_1000049B4(v6, (uint64_t)qword_100011DB0);
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Presenting view", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
      v10 = v4;
    }
    else
    {
      v10 = v7;
      v7 = v4;
    }

  }
}

void sub_100004B64()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_100011A20 != -1)
    swift_once(&qword_100011A20, sub_1000048F4);
  v0 = type metadata accessor for Logger(0);
  sub_1000049B4(v0, (uint64_t)qword_100011DB0);
  oslog = Logger.logObject.getter();
  v1 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Finished presenting view.", v2, 2u);
    swift_slowDealloc(v2, -1, -1);
  }

}

uint64_t sub_100004C30(uint64_t a1)
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

id sub_100004DA0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RootViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RootViewController()
{
  return objc_opt_self(_TtC24AuthenticationServicesUI18RootViewController);
}

uint64_t sub_100004E00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100004E10(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100005038(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  Swift::String v9;
  char v11;
  uint64_t v13;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(a1, "URL");
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  URL.scheme.getter();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v8 && (v9 = String.lowercased()(), swift_bridgeObjectRelease(v8), v9._object))
  {
    if (v9._countAndFlagsBits == 1868851558 && v9._object == (void *)0xE400000000000000)
      v11 = 1;
    else
      v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v9._countAndFlagsBits, v9._object, 1868851558, 0xE400000000000000, 0);
    swift_bridgeObjectRelease(v9._object);
  }
  else
  {
    v11 = 0;
  }
  return v11 & 1;
}

void sub_10000515C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id i;
  int64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  void *v27;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v2 = a1;
    else
      v2 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = __CocoaSet.makeIterator()(v2);
    v4 = sub_100007A58(0, &qword_100011BB8, UIOpenURLContext_ptr);
    v5 = sub_100007990(&qword_100011BC0, &qword_100011BB8, UIOpenURLContext_ptr);
    v6 = Set.Iterator.init(_cocoa:)(v26, v3, v4, v5);
    v1 = v26[0];
    v24 = v26[1];
    v7 = v26[2];
    v8 = v26[3];
    v9 = v26[4];
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v24 = a1 + 56;
    v7 = ~v10;
    v11 = -v10;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v9 = v12 & *(_QWORD *)(a1 + 56);
    v6 = (_QWORD *)swift_bridgeObjectRetain(a1);
    v8 = 0;
  }
  v13 = (unint64_t)(v7 + 64) >> 6;
  if (v1 < 0)
    goto LABEL_13;
LABEL_11:
  if (v9)
  {
    v14 = (v9 - 1) & v9;
    v15 = __clz(__rbit64(v9)) | (v8 << 6);
    v16 = v8;
    goto LABEL_32;
  }
  v21 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v21 < v13)
    {
      v22 = *(_QWORD *)(v24 + 8 * v21);
      v16 = v8 + 1;
      if (v22)
        goto LABEL_31;
      v16 = v8 + 2;
      if (v8 + 2 >= v13)
        goto LABEL_36;
      v22 = *(_QWORD *)(v24 + 8 * v16);
      if (v22)
        goto LABEL_31;
      v16 = v8 + 3;
      if (v8 + 3 >= v13)
        goto LABEL_36;
      v22 = *(_QWORD *)(v24 + 8 * v16);
      if (v22)
        goto LABEL_31;
      v16 = v8 + 4;
      if (v8 + 4 >= v13)
        goto LABEL_36;
      v22 = *(_QWORD *)(v24 + 8 * v16);
      if (v22)
      {
LABEL_31:
        v14 = (v22 - 1) & v22;
        v15 = __clz(__rbit64(v22)) + (v16 << 6);
LABEL_32:
        for (i = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v15); i; v14 = v9)
        {
          if ((sub_100005038(i) & 1) != 0)
            break;

          v8 = v16;
          v9 = v14;
          if ((v1 & 0x8000000000000000) == 0)
            goto LABEL_11;
LABEL_13:
          v17 = __CocoaSet.Iterator.next()(v6);
          if (!v17)
            break;
          v18 = v17;
          v25 = v17;
          v19 = sub_100007A58(0, &qword_100011BB8, UIOpenURLContext_ptr);
          swift_unknownObjectRetain(v18);
          swift_dynamicCast(&v27, &v25, (char *)&type metadata for Swift.AnyObject + 8, v19, 7);
          i = v27;
          swift_unknownObjectRelease(v18);
          v16 = v8;
        }
        goto LABEL_36;
      }
      v16 = v8 + 5;
      if (v8 + 5 < v13)
      {
        v22 = *(_QWORD *)(v24 + 8 * v16);
        if (!v22)
        {
          v23 = v8 + 6;
          while (v13 != v23)
          {
            v22 = *(_QWORD *)(v24 + 8 * v23++);
            if (v22)
            {
              v16 = v23 - 1;
              goto LABEL_31;
            }
          }
          goto LABEL_36;
        }
        goto LABEL_31;
      }
    }
LABEL_36:
    sub_100007988(v1);
    return;
  }
  __break(1u);
}

void sub_100005424(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;

  if (qword_100011A20 != -1)
    swift_once(&qword_100011A20, sub_1000048F4);
  v3 = type metadata accessor for Logger(0);
  sub_1000049B4(v3, (uint64_t)qword_100011DB0);
  v10 = a2;
  v4 = Logger.logObject.getter(v10);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    v11 = v10;
    v8 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v6 + 4, v6 + 12);
    *v7 = v10;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Opened caBLE url with %@", v6, 0xCu);
    v9 = sub_100007948(&qword_100011BC8);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

  }
}

void sub_1000055D4(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

id sub_100005684()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return objc_opt_self(_TtC24AuthenticationServicesUI13SceneDelegate);
}

uint64_t sub_10000570C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000057DC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100007AF4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_100007AF4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100007AD4(v12);
  return v7;
}

uint64_t sub_1000057DC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_100005994(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_100005994(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100005A28(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100005C00(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100005C00(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100005A28(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100005B9C(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100005B9C(uint64_t a1, uint64_t a2)
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
  v4 = sub_100007948(&qword_100011C60);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100005C00(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100007948(&qword_100011C60);
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
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100005D4C(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  char v7;
  uint64_t v8;
  Swift::Int v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  id v16;
  char v17;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v2 = v1;
  v4 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    if (v4 < 0)
      v5 = *v1;
    else
      v5 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v6 = a1;
    v7 = __CocoaSet.contains(_:)();

    if ((v7 & 1) != 0)
    {
      v8 = sub_100005F20(v5, (uint64_t)v6);
      swift_bridgeObjectRelease(v4);
      return v8;
    }
LABEL_15:
    swift_bridgeObjectRelease(v4);
    return 0;
  }
  v9 = *(_QWORD *)(v4 + 40);
  swift_bridgeObjectRetain(v4);
  v10 = NSObject._rawHashValue(seed:)(v9);
  v11 = -1 << *(_BYTE *)(v4 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v4 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
    goto LABEL_15;
  sub_100007A58(0, &qword_100011BD0, BSAction_ptr);
  v13 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v12);
  v14 = static NSObject.== infix(_:_:)(v13, a1);

  if ((v14 & 1) == 0)
  {
    v15 = ~v11;
    do
    {
      v12 = (v12 + 1) & v15;
      if (((*(_QWORD *)(v4 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
        goto LABEL_15;
      v16 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v12);
      v17 = static NSObject.== infix(_:_:)(v16, a1);

    }
    while ((v17 & 1) == 0);
  }
  swift_bridgeObjectRelease(v4);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v19 = *v2;
  v22 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1000060B8();
    v19 = v22;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * v12);
  sub_1000064FC(v12);
  v20 = *v2;
  *v2 = v22;
  swift_bridgeObjectRelease(v20);
  return v8;
}

uint64_t sub_100005F20(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  uint64_t v6;
  uint64_t v7;
  Swift::Int v8;
  Swift::Int v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  id v16;
  char v17;
  uint64_t result;
  Swift::Int v19;

  v3 = v2;
  swift_bridgeObjectRelease(*v3);
  v6 = __CocoaSet.count.getter(a1);
  v7 = swift_unknownObjectRetain(a1);
  v8 = sub_10000669C(v7, v6);
  v19 = v8;
  v9 = *(_QWORD *)(v8 + 40);
  swift_retain(v8);
  v10 = NSObject._rawHashValue(seed:)(v9);
  v11 = -1 << *(_BYTE *)(v8 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
  {
    sub_100007A58(0, &qword_100011BD0, BSAction_ptr);
    v13 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * v12);
    v14 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

    if ((v14 & 1) != 0)
    {
LABEL_6:
      swift_release(v8);
      v8 = *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v12);
      sub_1000064FC(v12);
      if ((static NSObject.== infix(_:_:)(a2, v8) & 1) != 0)
      {
        *v3 = v19;
        return v8;
      }
      __break(1u);
    }
    else
    {
      v15 = ~v11;
      while (1)
      {
        v12 = (v12 + 1) & v15;
        if (((*(_QWORD *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
          break;
        v16 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * v12);
        v17 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

        if ((v17 & 1) != 0)
          goto LABEL_6;
      }
    }
    swift_release(v8);
    __break(1u);
  }
  result = swift_release(v8);
  __break(1u);
  return result;
}

id sub_1000060B8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_100007948(&qword_100011C58);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_100006260(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100007948(&qword_100011C58);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_36;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_36;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_36;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v30;
                v29 = 1 << *(_BYTE *)(v3 + 32);
                if (v29 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_26:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v17);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

unint64_t sub_1000064FC(unint64_t result)
{
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  Swift::Int v10;
  id v11;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain(*v1);
    v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(v3 + 40);
        v11 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v6);
        v12 = NSObject._rawHashValue(seed:)(v10);

        v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            v16 = *(_QWORD *)(v3 + 48);
            v17 = (_QWORD *)(v16 + 8 * v2);
            v18 = (_QWORD *)(v16 + 8 * v6);
            if (v2 != v6 || (v2 = v6, v17 >= v18 + 1))
            {
              *v17 = *v18;
              v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release(v3);
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v19 = *(_QWORD *)(v3 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

Swift::Int sub_10000669C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2)
  {
    sub_100007948(&qword_100011C58);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()(v5);
    if (v6)
    {
      v7 = v6;
      v8 = sub_100007A58(0, &qword_100011BD0, BSAction_ptr);
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_100006260(v16 + 1);
          v4 = v23;
        }
        v9 = v22;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v11 = v4 + 56;
        v12 = -1 << *(_BYTE *)(v4 + 32);
        v13 = result & ~v12;
        v14 = v13 >> 6;
        if (((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v17 = 0;
          v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v19 = v14 == v18;
            if (v14 == v18)
              v14 = 0;
            v17 |= v19;
            v20 = *(_QWORD *)(v11 + 8 * v14);
          }
          while (v20 == -1);
          v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }
        *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v9;
        ++*(_QWORD *)(v4 + 16);
        v7 = __CocoaSet.Iterator.next()(result);
      }
      while (v7);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v4;
}

void sub_100006890(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSURL *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD aBlock[5];
  uint64_t v21;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000515C(a1);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(objc_allocWithZone((Class)ASCAgentProxy), "init");
    v9 = objc_msgSend(v7, "URL");
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    URL._bridgeToObjectiveC()(v10);
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v13 = objc_msgSend(v7, "options");
    v14 = objc_msgSend(v13, "sourceApplication");

    v15 = swift_allocObject(&unk_10000C788, 24, 7);
    *(_QWORD *)(v15 + 16) = v8;
    aBlock[4] = sub_100007B34;
    v21 = v15;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000055D4;
    aBlock[3] = &unk_10000C7A0;
    v16 = _Block_copy(aBlock);
    v17 = v21;
    v18 = v8;
    swift_release(v17);
    objc_msgSend(v18, "openCABLEURL:fromSourceApplication:withCompletionHandler:", v12, v14, v16);
    _Block_release(v16);

  }
}

uint64_t sub_100006A4C(void *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  Class isa;
  NSString v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  id v22;
  uint64_t v23;
  uint64_t v24;

  v3 = v2;
  if (qword_100011A20 != -1)
    swift_once(&qword_100011A20, sub_1000048F4);
  v6 = type metadata accessor for Logger(0);
  sub_1000049B4(v6, (uint64_t)qword_100011DB0);
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Scene will connect to session", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }

  v10 = sub_100007948(&qword_100011C68);
  v11 = swift_allocObject(v10, 40, 7);
  *(_OWORD *)(v11 + 16) = xmmword_10000B810;
  *(_QWORD *)(v11 + 32) = v3;
  v24 = v11;
  specialized Array._endMutation()();
  v12 = v3;
  sub_100007948((uint64_t *)&unk_100011CD0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v24);
  v14 = String._bridgeToObjectiveC()();
  objc_msgSend(a1, "_registerBSActionResponderArray:forKey:", isa, v14);

  v15 = objc_msgSend(a2, "URLContexts");
  v16 = sub_100007A58(0, &qword_100011BB8, UIOpenURLContext_ptr);
  v17 = sub_100007990(&qword_100011BC0, &qword_100011BB8, UIOpenURLContext_ptr);
  v18 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v15, v16, v17);

  if ((v18 & 0xC000000000000001) != 0)
  {
    if (v18 < 0)
      v19 = v18;
    else
      v19 = v18 & 0xFFFFFFFFFFFFFF8;
    v20 = __CocoaSet.count.getter(v19);
  }
  else
  {
    v20 = *(_QWORD *)(v18 + 16);
  }
  result = swift_bridgeObjectRelease(v18);
  if (v20)
  {
    v22 = objc_msgSend(a2, "URLContexts");
    v23 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v22, v16, v17);

    sub_100006890(v23);
    return swift_bridgeObjectRelease(v23);
  }
  return result;
}

uint64_t sub_100006CCC(uint64_t a1, void *a2)
{
  _UNKNOWN **v2;
  _UNKNOWN **v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD *v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t ObjectType;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  int64_t v50;
  unint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  id v81;
  Class isa;
  void *v83;
  void *v84;
  id v85;
  id v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  id v92;
  int64_t v93;
  _QWORD v94[2];
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101[6];

  v3 = v2;
  if (qword_100011A20 == -1)
    goto LABEL_2;
  while (2)
  {
    swift_once(&qword_100011A20, sub_1000048F4);
LABEL_2:
    v6 = type metadata accessor for Logger(0);
    sub_1000049B4(v6, (uint64_t)qword_100011DB0);
    v7 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Responding to BSActions", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }

    v10 = objc_opt_self(UIWindowScene);
    v11 = swift_dynamicCastObjCClass(a2, v10);
    if (!v11)
    {
      v31 = a2;
      v32 = ((uint64_t (*)(void))Logger.logObject.getter)();
      v33 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc(12, -1);
        v35 = swift_slowAlloc(32, -1);
        v101[0] = v35;
        *(_DWORD *)v34 = 136446210;
        ObjectType = swift_getObjectType(v31);
        v37 = _typeName(_:qualified:)(ObjectType, 0);
        v39 = v38;
        v97 = sub_10000570C(v37, v38, v101);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v97, &v98, v34 + 4, v34 + 12);

        swift_bridgeObjectRelease(v39);
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "Received unexpected scene %{public}s", v34, 0xCu);
        swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v35, -1, -1);
        swift_slowDealloc(v34, -1, -1);

      }
      else
      {

      }
      swift_bridgeObjectRetain(a1);
      return a1;
    }
    v12 = v11;
    v13 = objc_allocWithZone((Class)UIWindow);
    v86 = a2;
    v14 = objc_msgSend(v13, "initWithWindowScene:", v12);
    v15 = type metadata accessor for RootViewController();
    v16 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v15)), "init");
    objc_msgSend(v14, "setRootViewController:", v16);
    objc_msgSend(v14, "setContentsPosition:", 0);
    v17 = (_UNKNOWN **)((char *)v3 + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_windows);
    swift_beginAccess((char *)v3 + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_windows, v101, 33, 0);
    v18 = v14;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v20 = *(_QWORD *)((*v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v19 = *(_QWORD *)((*v17 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v20 >= v19 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1);
    v85 = v18;
    v21 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v18);
    specialized Array._endMutation()(v21);
    swift_endAccess(v101);
    v22 = *(_UNKNOWN **)((char *)v3 + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_rootViewController);
    *(_UNKNOWN **)((char *)v3 + OBJC_IVAR____TtC24AuthenticationServicesUI13SceneDelegate_rootViewController) = v16;
    v90 = (char *)v16;

    v100 = a1;
    if ((a1 & 0xC000000000000001) != 0)
    {
      if (a1 < 0)
        v23 = a1;
      else
        v23 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain_n(a1, 2);
      v24 = __CocoaSet.makeIterator()(v23);
      v3 = BSAction_ptr;
      v25 = sub_100007A58(0, &qword_100011BD0, BSAction_ptr);
      v26 = sub_100007990(&qword_100011BD8, &qword_100011BD0, BSAction_ptr);
      v27 = Set.Iterator.init(_cocoa:)(v101, v24, v25, v26);
      a1 = v101[0];
      a2 = (void *)v101[1];
      v28 = v101[2];
      v29 = v101[3];
      v30 = v101[4];
    }
    else
    {
      v40 = -1 << *(_BYTE *)(a1 + 32);
      a2 = (void *)(a1 + 56);
      v41 = ~v40;
      v42 = -v40;
      if (v42 < 64)
        v43 = ~(-1 << v42);
      else
        v43 = -1;
      v30 = v43 & *(_QWORD *)(a1 + 56);
      v27 = (_QWORD *)swift_bridgeObjectRetain_n(a1, 2);
      v28 = v41;
      v29 = 0;
    }
    v93 = (unint64_t)(v28 + 64) >> 6;
    v87 = ASCAuthorizationPresentationContextDataKey;
    v88 = a2;
    v89 = a1;
    if (a1 < 0)
    {
LABEL_19:
      v44 = __CocoaSet.Iterator.next()(v27);
      if (v44)
      {
        v45 = v44;
        *(_QWORD *)&v95 = v44;
        v46 = sub_100007A58(0, &qword_100011BD0, BSAction_ptr);
        swift_unknownObjectRetain(v45);
        swift_dynamicCast(&v97, &v95, (char *)&type metadata for Swift.AnyObject + 8, v46, 7);
        v47 = (id)v97;
        swift_unknownObjectRelease(v45);
        v48 = v29;
        v3 = (_UNKNOWN **)v30;
        if (v47)
          goto LABEL_43;
      }
      goto LABEL_71;
    }
    while (v30)
    {
      v3 = (_UNKNOWN **)((v30 - 1) & v30);
      v49 = __clz(__rbit64(v30)) | (v29 << 6);
      v48 = v29;
LABEL_42:
      v47 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v49);
      if (!v47)
        goto LABEL_71;
LABEL_43:
      v53 = objc_msgSend(v47, "info");
      if (!v53)
        goto LABEL_24;
      v54 = v53;
      v55 = objc_msgSend(v53, "objectForSetting:", 0);
      if (v55)
      {
        v56 = v55;
        _bridgeAnyObjectToAny(_:)(&v95);
        swift_unknownObjectRelease(v56);
      }
      else
      {
        v95 = 0u;
        v96 = 0u;
      }
      sub_1000079D0((uint64_t)&v95, (uint64_t)&v97);
      if (!v99)
        goto LABEL_59;
      v57 = sub_100007A58(0, &qword_100011BE8, NSDictionary_ptr);
      if ((swift_dynamicCast(v94, &v97, (char *)&type metadata for Any + 8, v57, 6) & 1) != 0)
      {
        v92 = (id)v94[0];
        v58 = objc_msgSend(v54, "objectForSetting:", 1);
        if (v58)
        {
          v59 = v58;
          _bridgeAnyObjectToAny(_:)(&v95);
          swift_unknownObjectRelease(v59);
        }
        else
        {
          v95 = 0u;
          v96 = 0u;
        }
        sub_1000079D0((uint64_t)&v95, (uint64_t)&v97);
        if (!v99)
        {

LABEL_59:
          v27 = (_QWORD *)sub_100007A18((uint64_t)&v97);
          goto LABEL_25;
        }
        v60 = sub_100007948(&qword_100011C50);
        if ((swift_dynamicCast(v94, &v97, (char *)&type metadata for Any + 8, v60, 6) & 1) == 0)
        {

          goto LABEL_23;
        }
        v91 = v94[0];
        v61 = ((uint64_t (*)(void))Logger.logObject.getter)();
        v62 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v61, v62))
        {
          v63 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v63 = 0;
          _os_log_impl((void *)&_mh_execute_header, v61, v62, "Found context action", v63, 2u);
          swift_slowDealloc(v63, -1, -1);
        }

        v65 = static String._unconditionallyBridgeFromObjectiveC(_:)(v87, v64);
        v67 = v66;
        *(_QWORD *)&v95 = v65;
        *((_QWORD *)&v95 + 1) = v66;
        swift_bridgeObjectRetain(v66);
        v68 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v95, &type metadata for String);
        v69 = objc_msgSend(v92, "__swift_objectForKeyedSubscript:", v68);
        swift_unknownObjectRelease(v68);
        if (v69)
        {
          _bridgeAnyObjectToAny(_:)(&v95);
          swift_unknownObjectRelease(v69);
        }
        else
        {
          v95 = 0u;
          v96 = 0u;
        }
        sub_1000079D0((uint64_t)&v95, (uint64_t)&v97);
        if (v99)
        {
          if ((swift_dynamicCast(v94, &v97, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) != 0)
          {
            v75 = v94[0];
            v76 = v94[1];
            v77 = swift_bridgeObjectRelease(v67);
            v78 = Logger.logObject.getter(v77);
            v79 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v78, v79))
            {
              v80 = (uint8_t *)swift_slowAlloc(2, -1);
              *(_WORD *)v80 = 0;
              _os_log_impl((void *)&_mh_execute_header, v78, v79, "Setting up with context", v80, 2u);
              swift_slowDealloc(v80, -1, -1);
            }

            v81 = objc_msgSend(objc_allocWithZone((Class)ASViewServiceViewController), "init");
            isa = Data._bridgeToObjectiveC()().super.isa;
            objc_msgSend(v81, "setUpWithPresentationContextData:xpcEndpoint:", isa, v91);

            v83 = *(void **)&v90[OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController];
            *(_QWORD *)&v90[OBJC_IVAR____TtC24AuthenticationServicesUI18RootViewController_viewServiceViewController] = v81;

            v84 = (void *)sub_100005D4C(v47);
            swift_unknownObjectRelease(v91);

            sub_100007A90(v75, v76);
            sub_100007988(v89);

            goto LABEL_72;
          }
          v70 = swift_bridgeObjectRelease(v67);
        }
        else
        {
          swift_bridgeObjectRelease(v67);
          v70 = sub_100007A18((uint64_t)&v97);
        }
        v71 = Logger.logObject.getter(v70);
        v72 = static os_log_type_t.error.getter();
        a1 = v89;
        if (os_log_type_enabled(v71, v72))
        {
          v73 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v73 = 0;
          _os_log_impl((void *)&_mh_execute_header, v71, v72, "Could not find context data", v73, 2u);
          swift_slowDealloc(v73, -1, -1);
        }

        swift_unknownObjectRelease(v91);
        v29 = v48;
        v30 = (unint64_t)v3;
        a2 = v88;
        if (v89 < 0)
          goto LABEL_19;
      }
      else
      {
LABEL_23:

LABEL_24:
LABEL_25:
        v29 = v48;
        v30 = (unint64_t)v3;
        if (a1 < 0)
          goto LABEL_19;
      }
    }
    v50 = v29 + 1;
    if (__OFADD__(v29, 1))
    {
      __break(1u);
      continue;
    }
    break;
  }
  if (v50 >= v93)
    goto LABEL_71;
  v51 = *((_QWORD *)a2 + v50);
  v48 = v29 + 1;
  if (v51)
    goto LABEL_41;
  v48 = v29 + 2;
  if (v29 + 2 >= v93)
    goto LABEL_71;
  v51 = *((_QWORD *)a2 + v48);
  if (v51)
    goto LABEL_41;
  v48 = v29 + 3;
  if (v29 + 3 >= v93)
    goto LABEL_71;
  v51 = *((_QWORD *)a2 + v48);
  if (v51)
    goto LABEL_41;
  v48 = v29 + 4;
  if (v29 + 4 >= v93)
    goto LABEL_71;
  v51 = *((_QWORD *)a2 + v48);
  if (v51)
  {
LABEL_41:
    v3 = (_UNKNOWN **)((v51 - 1) & v51);
    v49 = __clz(__rbit64(v51)) + (v48 << 6);
    goto LABEL_42;
  }
  v52 = v29 + 5;
  while (v93 != v52)
  {
    v51 = *((_QWORD *)a2 + v52++);
    if (v51)
    {
      v48 = v52 - 1;
      goto LABEL_41;
    }
  }
LABEL_71:
  sub_100007988(a1);
LABEL_72:
  objc_msgSend(v85, "makeKeyAndVisible");

  return v100;
}

void sub_100007748(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSURL *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD aBlock[5];
  uint64_t v21;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000515C(a1);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(objc_allocWithZone((Class)ASCAgentProxy), "init");
    v9 = objc_msgSend(v7, "URL");
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    URL._bridgeToObjectiveC()(v10);
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v13 = objc_msgSend(v7, "options");
    v14 = objc_msgSend(v13, "sourceApplication");

    v15 = swift_allocObject(&unk_10000C738, 24, 7);
    *(_QWORD *)(v15 + 16) = v8;
    aBlock[4] = sub_100007928;
    v21 = v15;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000055D4;
    aBlock[3] = &unk_10000C750;
    v16 = _Block_copy(aBlock);
    v17 = v21;
    v18 = v8;
    swift_release(v17);
    objc_msgSend(v18, "openCABLEURL:fromSourceApplication:withCompletionHandler:", v12, v14, v16);
    _Block_release(v16);

  }
}

uint64_t sub_100007904()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_100007928(uint64_t a1)
{
  uint64_t v1;

  sub_100005424(a1, *(void **)(v1 + 16));
}

uint64_t sub_100007930(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007940(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100007948(uint64_t *a1)
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

uint64_t sub_100007988(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100007990(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_100007A58(255, a2, a3);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000079D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007948(&qword_100011BE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007A18(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100007948(&qword_100011BE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007A58(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100007A90(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100007AD4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100007AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100007B44(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "View service did not find a presentation context.", v1, 2u);
}

void sub_100007B84(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100004888((void *)&_mh_execute_header, a3, (uint64_t)a3, "Error initializing presentation context: %{public}@", (uint8_t *)a2);

}

void sub_100007BD0(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "safari_privacyPreservingDescription"));
  v6 = 138543362;
  v7 = v4;
  sub_100004888((void *)&_mh_execute_header, v3, v5, "View service lost connection to agent with error: %{public}@", (uint8_t *)&v6);

}

id objc_msgSend__dismissAndExit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissAndExit");
}

id objc_msgSend__invalidateLookupConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateLookupConnection");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend__setUpRemoteProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUpRemoteProxy");
}

id objc_msgSend__showAuthorizationFlow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAuthorizationFlow");
}

id objc_msgSend_authorizationRequestFinishedWithCredential_error_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizationRequestFinishedWithCredential:error:completionHandler:");
}

id objc_msgSend_authorizationRequestInitiatedWithLoginChoice_authenticatedContext_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizationRequestInitiatedWithLoginChoice:authenticatedContext:completionHandler:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "events");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithPresentationContext_activity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPresentationContext:activity:");
}

id objc_msgSend_initializeClientToViewServiceConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeClientToViewServiceConnection");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isConditionalRegistrationRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConditionalRegistrationRequest");
}

id objc_msgSend_isPad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPad");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationController");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_presentPINEntryInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentPINEntryInterface");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_safari_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safari_BOOLForKey:");
}

id objc_msgSend_safari_dataForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safari_dataForKey:");
}

id objc_msgSend_safari_privacyPreservingDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safari_privacyPreservingDescription");
}

id objc_msgSend_sendResponseWithUnHandledEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendResponseWithUnHandledEvents:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsMenuButtonDismissal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsMenuButtonDismissal:");
}

id objc_msgSend_setAllowsSiri_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsSiri:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setDismissalAnimationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissalAnimationStyle:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setShouldDisableFadeInAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldDisableFadeInAnimation:");
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeDismissalStyle:");
}

id objc_msgSend_setUpWithPresentationContextData_xpcEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpWithPresentationContextData:xpcEndpoint:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_updateInterfaceWithLoginChoices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateInterfaceWithLoginChoices:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcEndpoint");
}

id objc_msgSend_xpcInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcInterface");
}
