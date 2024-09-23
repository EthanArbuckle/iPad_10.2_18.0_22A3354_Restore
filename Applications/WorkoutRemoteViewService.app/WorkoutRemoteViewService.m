uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  objc_class *v8;
  NSString *v9;
  NSString *v10;
  uint64_t v11;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(UIApplication);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (objc_class *)objc_opt_class(AppDelegate);
  v9 = NSStringFromClass(v8);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(v9);
  v11 = UIApplicationMain(a1, a2, v7, v10);

  objc_autoreleasePoolPop(v4);
  return v11;
}

void sub_100002228(void *a1, void (*a2)(uint64_t))
{
  void *v2;
  void *v3;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  __int128 v21;
  _QWORD v22[2];
  id v23[2];
  __int128 v24;
  __int128 aBlock;
  __int128 v26;
  uint64_t (*v27)();
  uint64_t v28;
  _BYTE v29[32];

  v3 = v2;
  v6 = objc_msgSend(v3, "view");
  if (!v6)
  {
    __break(1u);
    goto LABEL_27;
  }
  v7 = v6;
  v8 = objc_msgSend(v6, "window");

  if (v8)
  {
    v9 = objc_msgSend(v8, "_rootSheetPresentationController");

    if (!v9)
    {
LABEL_28:
      __break(1u);
      return;
    }
    objc_msgSend(v9, "_setShouldScaleDownBehindDescendantSheets:", 0);

  }
  v27 = sub_10000259C;
  v28 = 0;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v26 = sub_1000025A0;
  *((_QWORD *)&v26 + 1) = &unk_100008740;
  v10 = _Block_copy(&aBlock);
  v11 = objc_msgSend(v3, "_remoteViewControllerProxyWithErrorHandler:", v10);
  _Block_release(v10);
  if (v11)
  {
    _bridgeAnyObjectToAny(_:)(&aBlock, v11);
    swift_unknownObjectRelease(v11);
  }
  else
  {
    aBlock = 0u;
    v26 = 0u;
  }
  sub_100003728((uint64_t)&aBlock, (uint64_t)v29);
  sub_1000037B0((uint64_t)v29, (uint64_t)&aBlock);
  if (*((_QWORD *)&v26 + 1))
  {
    v12 = sub_100003770(&qword_10000D510);
    if ((swift_dynamicCast(v23, &aBlock, (char *)&type metadata for Any + 8, v12, 6) & 1) != 0)
    {
      v13 = v23[0];
      objc_msgSend(v23[0], "setAllowsAlertStacking:", 1);
      objc_msgSend(v13, "setWallpaperTunnelActive:", 1);
      objc_msgSend(v13, "setAllowsMenuButtonDismissal:", 1);
      objc_msgSend(v13, "setAllowsSiri:", 1);
      objc_msgSend(v13, "setDismissalAnimationStyle:", 2);
      objc_msgSend(v13, "setSwipeDismissalStyle:", 1);
      swift_unknownObjectRelease(v13);
    }
  }
  else
  {
    sub_100003F64((uint64_t)&aBlock, &qword_10000D4A8);
  }
  if (!a1)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v14 = objc_msgSend(a1, "userInfo");
  if (v14)
  {
    v15 = v14;
    v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v14, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    v22[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(WorkoutRemoteAlertConfigurationDataKey);
    v22[1] = v17;
    AnyHashable.init<A>(_:)(&aBlock, v22, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v16 + 16) && (v18 = sub_10000406C((uint64_t)&aBlock), (v19 & 1) != 0))
    {
      sub_100003F24(*(_QWORD *)(v16 + 56) + 32 * v18, (uint64_t)v23);
    }
    else
    {
      *(_OWORD *)v23 = 0u;
      v24 = 0u;
    }
    sub_10000409C((uint64_t)&aBlock);
    swift_bridgeObjectRelease(v16);
    if (*((_QWORD *)&v24 + 1))
    {
      v20 = swift_dynamicCast(&aBlock, v23, (char *)&type metadata for Any + 8, &type metadata for Data, 6);
      if ((v20 & 1) != 0)
      {
        v21 = aBlock;
        sub_100002724(aBlock, *((uint64_t *)&aBlock + 1));
        v20 = sub_1000040D0(v21, *((unint64_t *)&v21 + 1));
      }
      goto LABEL_23;
    }
  }
  else
  {
    *(_OWORD *)v23 = 0u;
    v24 = 0u;
  }
  v20 = sub_100003F64((uint64_t)v23, &qword_10000D4A8);
LABEL_23:
  if (a2)
    a2(v20);
  sub_100003F64((uint64_t)v29, &qword_10000D4A8);
}

void sub_1000025A0(uint64_t a1, void *a2)
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

id sub_100002724(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id result;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;

  v4 = type metadata accessor for WorkoutConfigurationView(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v42 - v9;
  type metadata accessor for WorkoutConfiguration(0);
  type metadata accessor for Occurrence(0);
  v11 = (void *)Occurrence.__allocating_init(count:)(0);
  type metadata accessor for WorkoutConfigurationValidator(0);
  v12 = static WorkoutConfigurationValidator.shared.getter();
  v13 = (void *)static WorkoutConfiguration.importFromData(_:with:validator:)(a1, a2, v11, v12);
  v14 = v10;
  v45 = v4;
  v15 = v5;

  swift_release(v12);
  v16 = objc_msgSend(objc_allocWithZone((Class)HKHealthStore), "init");
  v17 = objc_allocWithZone((Class)FIUIUnitManager);
  v44 = v16;
  v18 = objc_msgSend(v17, "initWithHealthStore:", v16);
  v19 = objc_allocWithZone((Class)FIUIFormattingManager);
  v43 = v18;
  result = objc_msgSend(v19, "initWithUnitManager:", v18);
  if (result)
  {
    v21 = result;
    v22 = swift_allocObject(&unk_100008700, 24, 7);
    v23 = v46;
    *(_QWORD *)(v22 + 16) = v46;
    v24 = v13;
    v25 = v21;
    v26 = v23;
    WorkoutConfigurationView.init(workoutConfiguration:formattingManager:showAddButton:showStartWorkoutButton:overrideSaveWorkoutAction:startWorkoutAction:overrideDismissAction:referenceIntervalWorkoutConfiguration:)(v24, v25, 1, 1, 0, 0, 0, 0, sub_100003FCC, v22, 0);
    v27 = v45;
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v8, v14, v45);
    v28 = sub_100003FEC((unint64_t *)&qword_10000D610, (uint64_t (*)(uint64_t))&type metadata accessor for WorkoutConfigurationView, (uint64_t)&protocol conformance descriptor for WorkoutConfigurationView);
    v29 = AnyView.init<A>(_:)(v8, v27, v28);
    v30 = (void *)_makeUIHostingController(_:)();
    swift_release(v29);
    v31 = objc_opt_self(UIViewController);
    v32 = swift_dynamicCastObjCClass(v30, v31);
    if (v32)
    {
      v33 = v32;
      v34 = objc_allocWithZone((Class)UINavigationController);
      v35 = v30;
      v36 = objc_msgSend(v34, "initWithRootViewController:", v33);
      objc_msgSend(v36, "setModalInPresentation:", 1);
      objc_msgSend(v26, "presentViewController:animated:completion:", v36, 1, 0);

      return (id)(*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v14, v27);
    }
    else
    {

      v37 = type metadata accessor for ImportError(0);
      v38 = sub_100003FEC((unint64_t *)&unk_10000D550, (uint64_t (*)(uint64_t))&type metadata accessor for ImportError, (uint64_t)&protocol conformance descriptor for ImportError);
      v39 = swift_allocError(v37, v38, 0, 0);
      v41 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v37 - 8) + 104))(v40, enum case for ImportError.unexpectedValueType(_:), v37);
      swift_willThrow(v41);

      (*(void (**)(char *, uint64_t))(v15 + 8))(v14, v27);
      sub_100002AEC(v39);
      return (id)swift_errorRelease(v39);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100002AEC(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t, uint64_t);
  void *object;
  void *v11;
  void *v12;
  NSString v13;
  NSString v14;
  id v15;
  uint64_t v16;
  NSString v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD aBlock[5];
  uint64_t v25;

  sub_100003770((uint64_t *)&unk_10000D5F0);
  __chkstk_darwin();
  v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = a1;
  swift_errorRetain(a1);
  v5 = sub_100003770(&qword_10000D548);
  v6 = type metadata accessor for ImportError(0);
  v7 = swift_dynamicCast(v4, aBlock, v5, v6, 6);
  v8 = *(_QWORD *)(v6 - 8);
  v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (v7)
  {
    v9(v4, 0, 1, v6);
    (*(void (**)(char *, uint64_t))(v8 + 88))(v4, v6);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v6);
  }
  else
  {
    v9(v4, 1, 1, v6);
    sub_100003F64((uint64_t)v4, (uint64_t *)&unk_10000D5F0);
  }
  object = String.workoutKitLocalized()()._object;
  v11 = String.workoutKitLocalized()()._object;
  v12 = String.workoutKitLocalized()()._object;
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  v15 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1);

  v16 = swift_allocObject(&unk_1000086B0, 24, 7);
  swift_unknownObjectWeakInit(v16 + 16, v1);
  swift_retain(v16);
  v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  aBlock[4] = sub_100003FC4;
  v25 = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004238;
  aBlock[3] = &unk_1000086C8;
  v18 = _Block_copy(aBlock);
  swift_release(v25);
  v19 = objc_msgSend((id)objc_opt_self(UIAlertAction), "actionWithTitle:style:handler:", v17, 0, v18);
  _Block_release(v18);
  swift_release(v16);

  objc_msgSend(v15, "addAction:", v19);
  v20 = objc_msgSend(objc_allocWithZone((Class)UIViewController), "init");
  v21 = objc_msgSend(v20, "view");
  if (v21)
  {
    v22 = v21;
    v23 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
    objc_msgSend(v22, "setBackgroundColor:", v23);

    objc_msgSend(v20, "presentViewController:animated:completion:", v15, 0, 0);
    objc_msgSend(v1, "presentViewController:animated:completion:", v20, 0, 0);

  }
  else
  {
    __break(1u);
  }
}

void sub_100002EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  _BYTE v5[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v5, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (void *)Strong;
    sub_100002EFC();

  }
}

void sub_100002EFC()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  uint64_t v9;

  v1 = swift_allocObject(&unk_1000085E8, 24, 7);
  *(_QWORD *)(v1 + 16) = v0;
  v2 = v0;
  v3 = objc_msgSend(v2, "presentedViewController");
  if (v3)
  {
    v4 = v3;
    v5 = swift_allocObject(&unk_100008610, 32, 7);
    *(_QWORD *)(v5 + 16) = sub_1000036C4;
    *(_QWORD *)(v5 + 24) = v1;
    v8[4] = sub_1000036F0;
    v9 = v5;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_100003510;
    v8[3] = &unk_100008628;
    v6 = _Block_copy(v8);
    v7 = v9;
    swift_retain(v1);
    swift_release(v7);
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v6);
    swift_release(v1);
    _Block_release(v6);

  }
  else
  {
    sub_100003028(v2);
    swift_release(v1);
  }
}

uint64_t sub_100003028(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  id v22;
  __int128 aBlock;
  __int128 v24;
  id (*v25)();
  uint64_t v26;
  _BYTE v27[32];

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = (id (*)())sub_10000259C;
  v26 = 0;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v24 = sub_1000025A0;
  *((_QWORD *)&v24 + 1) = &unk_100008650;
  v10 = _Block_copy(&aBlock);
  v11 = objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:", v10);
  _Block_release(v10);
  if (v11)
  {
    _bridgeAnyObjectToAny(_:)(&aBlock, v11);
    swift_unknownObjectRelease(v11);
  }
  else
  {
    aBlock = 0u;
    v24 = 0u;
  }
  sub_100003728((uint64_t)&aBlock, (uint64_t)v27);
  sub_1000037B0((uint64_t)v27, (uint64_t)&aBlock);
  if (*((_QWORD *)&v24 + 1))
  {
    v12 = sub_100003770(&qword_10000D510);
    if ((swift_dynamicCast(&v22, &aBlock, (char *)&type metadata for Any + 8, v12, 6) & 1) != 0)
    {
      v13 = v22;
      objc_msgSend(v22, "deactivate");
      objc_msgSend(v13, "invalidate");
      sub_1000037F8();
      v14 = static OS_dispatch_queue.main.getter();
      v21 = v3;
      v15 = (void *)v14;
      v25 = sub_1000034F0;
      v26 = 0;
      *(_QWORD *)&aBlock = _NSConcreteStackBlock;
      *((_QWORD *)&aBlock + 1) = 1107296256;
      *(_QWORD *)&v24 = sub_100003510;
      *((_QWORD *)&v24 + 1) = &unk_100008678;
      v16 = _Block_copy(&aBlock);
      static DispatchQoS.unspecified.getter();
      *(_QWORD *)&aBlock = &_swiftEmptyArrayStorage;
      v17 = sub_100003FEC(&qword_10000D520, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      v18 = sub_100003770(&qword_10000D528);
      v19 = sub_100003834();
      dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v18, v19, v2, v17);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v5, v16);
      _Block_release(v16);
      swift_unknownObjectRelease(v13);

      (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
  else
  {
    sub_100003F64((uint64_t)&aBlock, &qword_10000D4A8);
  }
  return sub_100003F64((uint64_t)v27, &qword_10000D4A8);
}

uint64_t sub_100003310(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static WOLog.app.getter(v4);
  swift_errorRetain(a1);
  v7 = swift_errorRetain(a1);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc(12, -1);
    v19 = v2;
    v11 = (uint8_t *)v10;
    v12 = swift_slowAlloc(32, -1);
    v20 = a1;
    v21 = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = sub_100003770(&qword_10000D538);
    v14 = Optional.description.getter(v13);
    v16 = v15;
    v20 = sub_1000038C4(v14, v15, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v16);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "[RemoteAlert] proxy error: %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v19);
  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

id sub_1000034F0()
{
  id result;

  result = (id)UIApp;
  if (UIApp)
    return objc_msgSend(UIApp, "terminateWithSuccess");
  __break(1u);
  return result;
}

uint64_t sub_100003510(uint64_t a1)
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

id sub_100003650()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorkoutRemoteAlertServiceViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for WorkoutRemoteAlertServiceViewController()
{
  return objc_opt_self(WorkoutRemoteAlertServiceViewController);
}

uint64_t sub_1000036A0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000036C4()
{
  uint64_t v0;

  return sub_100003028(*(void **)(v0 + 16));
}

uint64_t sub_1000036CC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000036F0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100003710(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100003720(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100003728(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003770(&qword_10000D4A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100003770(uint64_t *a1)
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

uint64_t sub_1000037B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100003770(&qword_10000D4A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000037F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000D518;
  if (!qword_10000D518)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000D518);
  }
  return result;
}

unint64_t sub_100003834()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000D530;
  if (!qword_10000D530)
  {
    v1 = sub_100003880(&qword_10000D528);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000D530);
  }
  return result;
}

uint64_t sub_100003880(uint64_t *a1)
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

uint64_t sub_1000038C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100003994(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100003F24((uint64_t)v12, *a3);
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
      sub_100003F24((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100003F04(v12);
  return v7;
}

uint64_t sub_100003994(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100003B4C(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_100003B4C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100003BE0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100003DB8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100003DB8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100003BE0(uint64_t a1, unint64_t a2)
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
      v5 = sub_100003D54(v4, 0);
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

_QWORD *sub_100003D54(uint64_t a1, uint64_t a2)
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
  v4 = sub_100003770(&qword_10000D540);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100003DB8(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100003770(&qword_10000D540);
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

uint64_t sub_100003F04(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100003F24(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100003F64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100003770(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100003FA0()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100003FC4(uint64_t a1)
{
  uint64_t v1;

  sub_100002EAC(a1, v1);
}

void sub_100003FCC()
{
  sub_100002EFC();
}

uint64_t sub_100003FEC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_10000402C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_10000403C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100004060()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

unint64_t sub_10000406C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100004114(a1, v4);
}

uint64_t sub_10000409C(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_1000040D0(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_100004114(uint64_t a1, uint64_t a2)
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
      sub_1000041D8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10000409C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000041D8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

void sub_100004238(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

id sub_100004288()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id result;
  void *v7;
  void *v8;
  id v9;

  v1 = OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager;
  v2 = *(void **)(v0 + OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager);
LABEL_5:
    v9 = v2;
    return v3;
  }
  v4 = objc_msgSend(objc_allocWithZone((Class)HKHealthStore), "init");
  v5 = objc_msgSend(objc_allocWithZone((Class)FIUIUnitManager), "initWithHealthStore:", v4);
  result = objc_msgSend(objc_allocWithZone((Class)FIUIFormattingManager), "initWithUnitManager:", v5);
  if (result)
  {
    v7 = result;

    v8 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v7;
    v3 = v7;

    v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_10000436C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", *a3);
}

void sub_1000043B4(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v3 = type metadata accessor for WorkoutConfigurationView(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1;
  v7 = sub_100004288();
  v8 = swift_allocObject(&unk_1000087C8, 24, 7);
  *(_QWORD *)(v8 + 16) = v1;
  v9 = v1;
  WorkoutConfigurationView.init(workoutConfiguration:formattingManager:showAddButton:showStartWorkoutButton:overrideSaveWorkoutAction:startWorkoutAction:overrideDismissAction:referenceIntervalWorkoutConfiguration:)(v6, v7, 1, 1, 0, 0, 0, 0, sub_1000051A8, v8, 0);
  v10 = sub_1000051B0();
  v11 = AnyView.init<A>(_:)(v5, v3, v10);
  v12 = (void *)_makeUIHostingController(_:)();
  swift_release(v11);
  v13 = objc_opt_self(UIViewController);
  v14 = swift_dynamicCastObjCClass(v12, v13);
  if (v14)
  {
    v15 = v14;
    v16 = objc_allocWithZone((Class)UINavigationController);
    v17 = v12;
    v18 = objc_msgSend(v16, "initWithRootViewController:", v15);
    sub_100004584(v18);

  }
}

uint64_t sub_100004518(void *a1)
{
  id v1;
  id v2;
  uint64_t result;

  v1 = objc_msgSend(a1, "_remoteViewControllerProxy");
  v2 = v1;
  result = swift_unknownObjectRelease(v1);
  if (v2)
  {
    objc_msgSend(v2, "dismiss");
    return swift_unknownObjectRelease(v2);
  }
  return result;
}

id sub_100004584(void *a1)
{
  void *v1;
  void *v2;
  id result;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  Class isa;

  v2 = v1;
  objc_msgSend(v1, "addChildViewController:", a1);
  result = objc_msgSend(a1, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  v5 = result;
  objc_msgSend(result, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  result = objc_msgSend(v2, "view");
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v6 = result;
  result = objc_msgSend(a1, "view");
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = result;
  objc_msgSend(v6, "addSubview:", result);

  v8 = sub_100003770(&qword_10000D600);
  v9 = swift_allocObject(v8, 64, 7);
  *(_OWORD *)(v9 + 16) = xmmword_1000077C0;
  result = objc_msgSend(a1, "view");
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v10 = result;
  v11 = objc_msgSend(result, "leadingAnchor");

  result = objc_msgSend(v2, "view");
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v12 = result;
  v13 = objc_msgSend(result, "leadingAnchor");

  v14 = objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  *(_QWORD *)(v9 + 32) = v14;
  result = objc_msgSend(a1, "view");
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v15 = result;
  v16 = objc_msgSend(result, "topAnchor");

  result = objc_msgSend(v2, "view");
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v17 = result;
  v18 = objc_msgSend(result, "topAnchor");

  v19 = objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  *(_QWORD *)(v9 + 40) = v19;
  result = objc_msgSend(a1, "view");
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v20 = result;
  v21 = objc_msgSend(result, "trailingAnchor");

  result = objc_msgSend(v2, "view");
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v22 = result;
  v23 = objc_msgSend(result, "trailingAnchor");

  v24 = objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  *(_QWORD *)(v9 + 48) = v24;
  result = objc_msgSend(a1, "view");
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v25 = result;
  v26 = objc_msgSend(result, "bottomAnchor");

  result = objc_msgSend(v2, "view");
  if (result)
  {
    v27 = result;
    v28 = (void *)objc_opt_self(NSLayoutConstraint);
    v29 = objc_msgSend(v27, "bottomAnchor");

    v30 = objc_msgSend(v26, "constraintEqualToAnchor:", v29);
    *(_QWORD *)(v9 + 56) = v30;
    specialized Array._endMutation()();
    sub_100005148();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v9);
    objc_msgSend(v28, "activateConstraints:", isa);

    return objc_msgSend(a1, "didMoveToParentViewController:", v2);
  }
LABEL_23:
  __break(1u);
  return result;
}

void sub_10000497C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t, uint64_t);
  void *object;
  void *v12;
  void *v13;
  NSString v14;
  NSString v15;
  id v16;
  uint64_t v17;
  NSString v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD aBlock[5];
  uint64_t v26;

  v3 = sub_100003770((uint64_t *)&unk_10000D5F0);
  __chkstk_darwin(v3);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = a1;
  swift_errorRetain(a1);
  v6 = sub_100003770(&qword_10000D548);
  v7 = type metadata accessor for ImportError(0);
  v8 = swift_dynamicCast(v5, aBlock, v6, v7, 6);
  v9 = *(_QWORD *)(v7 - 8);
  v10 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  if (v8)
  {
    v10(v5, 0, 1, v7);
    (*(void (**)(char *, uint64_t))(v9 + 88))(v5, v7);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v7);
  }
  else
  {
    v10(v5, 1, 1, v7);
    sub_1000050C0((uint64_t)v5);
  }
  object = String.workoutKitLocalized()()._object;
  v12 = String.workoutKitLocalized()()._object;
  v13 = String.workoutKitLocalized()()._object;
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  v16 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1);

  v17 = swift_allocObject(&unk_100008778, 24, 7);
  swift_unknownObjectWeakInit(v17 + 16, v1);
  swift_retain(v17);
  v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  aBlock[4] = sub_100005124;
  v26 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004238;
  aBlock[3] = &unk_100008790;
  v19 = _Block_copy(aBlock);
  swift_release(v26);
  v20 = objc_msgSend((id)objc_opt_self(UIAlertAction), "actionWithTitle:style:handler:", v18, 0, v19);
  _Block_release(v19);
  swift_release(v17);

  objc_msgSend(v16, "addAction:", v20);
  v21 = objc_msgSend(objc_allocWithZone((Class)UIViewController), "init");
  v22 = objc_msgSend(v21, "view");
  if (v22)
  {
    v23 = v22;
    v24 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
    objc_msgSend(v23, "setBackgroundColor:", v24);

    sub_100004584(v21);
    objc_msgSend(v21, "presentViewController:animated:completion:", v16, 0, 0);

  }
  else
  {
    __break(1u);
  }
}

void sub_100004D24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *Strong;
  void *v4;
  id v5;
  id v6;
  _BYTE v7[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v7, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = Strong;
    v5 = objc_msgSend(Strong, "_remoteViewControllerProxy");
    v6 = v5;
    swift_unknownObjectRelease(v5);
    if (v6)
    {
      objc_msgSend(v6, "dismiss");

      swift_unknownObjectRelease(v6);
    }
    else
    {

    }
  }
}

id sub_100004F5C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorkoutPreviewViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for WorkoutPreviewViewController()
{
  return objc_opt_self(WorkoutPreviewViewController);
}

uint64_t sub_1000050C0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003770((uint64_t *)&unk_10000D5F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005100()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100005124(uint64_t a1)
{
  uint64_t v1;

  sub_100004D24(a1, v1);
}

uint64_t sub_10000512C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000513C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100005148()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000D608;
  if (!qword_10000D608)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000D608);
  }
  return result;
}

uint64_t sub_100005184()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000051A8()
{
  uint64_t v0;

  return sub_100004518(*(void **)(v0 + 16));
}

unint64_t sub_1000051B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000D610;
  if (!qword_10000D610)
  {
    v1 = type metadata accessor for WorkoutConfigurationView(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for WorkoutConfigurationView, v1);
    atomic_store(result, (unint64_t *)&qword_10000D610);
  }
  return result;
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blackColor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}
