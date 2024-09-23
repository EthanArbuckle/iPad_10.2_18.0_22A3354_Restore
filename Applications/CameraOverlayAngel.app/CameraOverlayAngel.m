BOOL sub_100004308(id a1, NSNumber *a2, CAMOverlayClientConnection *a3, BOOL *a4)
{
  BOOL result;

  result = (id)-[CAMOverlayClientConnection status](a3, "status") == (id)1;
  *a4 = result;
  return result;
}

void sub_100004A70(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v2 = a2;
  v3 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v2, "localizedDescription"));
    v5 = 138543362;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);

  }
}

void sub_1000050D8(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_10001F148;
  qword_10001F148 = (uint64_t)v1;

}

void sub_100005228(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.CameraOverlayAngel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CAMOverlayServiceSpecification identifier](CAMOverlayServiceSpecification, "identifier"));
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

id sub_100005640(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "setUserInfo:", *(_QWORD *)(a1 + 32));
}

void sub_10000564C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "addObserver:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_connectionsByProcessID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", *(_QWORD *)(a1 + 48)));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005710;
  v8[3] = &unk_1000188E8;
  v5 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v5, "_enumerateObserversWithBlock:", v8);

}

id sub_100005710(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "serverReceivedConnection:fromProcessID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void sub_10000579C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 == 2)
  {
    v8 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "auditToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v5, "versionedPID")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_connectionsByProcessID"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v6);

    objc_msgSend(v8, "serverLostConnectionFromProcessID:", objc_msgSend(v6, "longLongValue"));
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v8 = v3;
    objc_msgSend(v3, "serverActivatedConnection:", *(_QWORD *)(a1 + 32));
LABEL_5:
    v3 = v8;
  }

}

__CFString *CAMStringForOverlayClientConnectionStatus(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_100018AE8[a1];
}

void sub_100005DA4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CAMOverlayServiceSpecification serviceQuality](CAMOverlayServiceSpecification, "serviceQuality"));
  objc_msgSend(v3, "setServiceQuality:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAMOverlayServiceSpecification interface](CAMOverlayServiceSpecification, "interface"));
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_initWeak(&location, *(id *)(a1 + 40));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005F64;
  v10[3] = &unk_100018960;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setActivationHandler:", v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005FAC;
  v8[3] = &unk_100018960;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005FF4;
  v6[3] = &unk_100018960;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void sub_100005F28(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_100005F64(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleConnectionDidActivate:", v3);

}

void sub_100005FAC(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleConnectionDidInterrupt:", v3);

}

void sub_100005FF4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleConnectionDidInvalidate:", v3);

}

id sub_100006378(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "clientConnection:didChangeStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

id sub_100006604(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "remoteTarget"));
  objc_msgSend(*(id *)(a1 + 32), "_setClientProxy:", v2);

  return _objc_msgSend(*(id *)(a1 + 32), "_updateStatusWithReason:", 2);
}

id sub_1000066A0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setClientProxy:", 0);
  return _objc_msgSend(*(id *)(a1 + 32), "_updateStatusWithReason:", 2);
}

id sub_100006728(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_connection:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setClientProxy:", 0);
  return _objc_msgSend(*(id *)(a1 + 32), "_updateStatusWithReason:", 2);
}

id sub_100007530(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_setControls:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setControlsByID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_setUpdatesByID:", *(_QWORD *)(a1 + 56));
  v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000075B0;
  v4[3] = &unk_100018A28;
  v4[4] = v2;
  return objc_msgSend(v2, "_enumerateObserversWithBlock:", v4);
}

id sub_1000075B0(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "clientConnectionDidChangeControls:", *(_QWORD *)(a1 + 32));
}

void sub_100007760(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v2 = a1 + 32;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "controlsByID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(v2 + 8)));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "validateUpdate:", *(_QWORD *)(a1 + 48)));
  }
  else
  {
    v6 = CAMOverlayErrorDomain;
    v20 = NSDebugDescriptionErrorKey;
    v21 = CFSTR("InvalidIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, -100, v7));

  }
  if (v5)
  {
    v8 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100010650((id *)v2);

  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 48), "isValueUpdate"))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_updatesByID"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));

    }
    v11 = *(void **)(a1 + 32);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000079AC;
    v18[3] = &unk_100018A78;
    v18[4] = v11;
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v11, "_enumerateObserversWithBlock:", v18);

  }
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_connectionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000079B8;
  block[3] = &unk_100018AA0;
  v13 = *(id *)(a1 + 56);
  v16 = v5;
  v17 = v13;
  v14 = v5;
  dispatch_async(v12, block);

}

id sub_1000079AC(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "clientConnection:didApplyControlUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t sub_1000079B8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100007AF0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

int main(int argc, const char **argv, const char **envp)
{
  void *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  NSString *v9;

  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAMOverlayServer sharedInstance](CAMOverlayServer, "sharedInstance"));
  objc_msgSend(v6, "start");

  v7 = (objc_class *)objc_opt_class(CAMOverlayAppDelegate);
  v8 = NSStringFromClass(v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(v8);
  objc_autoreleasePoolPop(v5);
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, 0, v9);

  return (int)argv;
}

void type metadata accessor for SliderType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10001ECB8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100018DB8);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10001ECB8);
  }
}

void sub_100007C0C()
{
  id v0;
  NSString v1;
  id v2;

  v0 = objc_allocWithZone((Class)NSUserDefaults);
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "initWithSuiteName:", v1);

  qword_10001F260 = (uint64_t)v2;
}

id sub_100007C78()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  qword_10001F268 = (uint64_t)result;
  return result;
}

_QWORD *sub_100007CB0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100007CC0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_100007CCC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100007CE0()
{
  void *v0;
  NSString v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[2];
  _OWORD v9[2];
  _BYTE v10[24];
  uint64_t v11;

  if (qword_10001ECA8 != -1)
    swift_once(&qword_10001ECA8, sub_100007C78);
  v0 = (void *)qword_10001F268;
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "objectForKey:", v1);

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v9, v2);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_100007E68((uint64_t)v9, (uint64_t)v10);
  if (!v11)
  {
    sub_100007EF0((uint64_t)v10);
    return 0;
  }
  if ((swift_dynamicCast(v8, v10, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) == 0)
    return 0;
  v3 = v8[0];
  v4 = v8[1];
  sub_100007F30(0, &qword_10001ECC8, NSKeyedUnarchiver_ptr);
  v5 = sub_100007F30(0, &qword_10001ECD0, CAMAbstractOverlayServiceControl_ptr);
  v7 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v5, v3, v4, v5);
  sub_100007F68(v3, v4);
  return v7;
}

uint64_t sub_100007E68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007EB0(&qword_10001ECC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007EB0(uint64_t *a1)
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

uint64_t sub_100007EF0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100007EB0(&qword_10001ECC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007F30(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_100007F68(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    ((void (*)(void))swift_release)();
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

void sub_100007FAC(void *a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  Class isa;
  NSString v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19;

  if (a1)
  {
    v2 = (void *)objc_opt_self(NSKeyedArchiver);
    v19 = 0;
    v3 = a1;
    v4 = objc_msgSend(v2, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v19);
    v5 = v19;
    if (v4)
    {
      v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v4);
      v8 = v7;

      if (qword_10001ECA8 != -1)
        swift_once(&qword_10001ECA8, sub_100007C78);
      v9 = (void *)qword_10001F268;
      isa = Data._bridgeToObjectiveC()().super.isa;
      v11 = String._bridgeToObjectiveC()();
      objc_msgSend(v9, "setObject:forKey:", isa, v11);

      sub_100007F68(v6, v8);
      goto LABEL_12;
    }
    v12 = v5;
    v13 = _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease(v13);
  }
  if (qword_10001ECB0 != -1)
    swift_once(&qword_10001ECB0, sub_100010520);
  v14 = type metadata accessor for Logger(0);
  v15 = sub_1000081E0(v14, (uint64_t)qword_10001F270);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Failed to archive lastUsedControl in writeLastUsedControl", v18, 2u);
    swift_slowDealloc(v18, -1, -1);
  }

  v3 = a1;
LABEL_12:

}

uint64_t sub_1000081E0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_10000823C()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  uint64_t v9;
  Class v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  void *v21;
  char v22;
  NSNumber v23;
  NSNumber v24;
  uint64_t v25;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v27;
  unint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  objc_class *v39;
  id v40;
  _QWORD *v41;
  _QWORD *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  id v50;
  Class isa;
  id v52;
  id v53;
  unint64_t v54;
  void *v55;
  id v56;
  _BOOL8 v57;
  uint64_t v58;
  _QWORD v59[2];
  _QWORD *v60;

  v1 = objc_opt_self(CAMOverlayServiceSlider);
  v2 = (id)swift_dynamicCastObjCClass(v0, v1);
  v3 = v0;
  if (!v2)
    return (uint64_t)v3;
  if ((sub_1000099BC((uint64_t)objc_msgSend(v2, "sliderType"), (uint64_t)&off_100018B18) & 1) == 0)
  {
LABEL_37:
    v53 = objc_msgSend(v2, "sliderUnpackingDisplayValuesIfNeeded");

    return (uint64_t)v53;
  }
  v4 = objc_msgSend(v2, "captureDeviceUniqueID");
  if (!v4)
    return (uint64_t)v3;
  v5 = v4;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v9 = sub_1000087D8(v8);

  v58 = v9;
  if (!v9)
    return (uint64_t)v3;
  v57 = objc_msgSend(v2, "sliderType") == (id)6;
  v10 = (Class)objc_msgSend(v2, "displayValuesByValue");
  if (v10)
  {
LABEL_28:

LABEL_29:
    v40 = objc_msgSend(v2, "primaryValues");

    if (!v40)
    {
      v41 = sub_1000096B4(v57, v58, 0, 0);
      v42 = v41;
      v43 = v41[2];
      if (v43 >= 2 && (v44 = (v43 - 1) & 0x7FFFFFFFFFFFFFFFLL) != 0)
      {
        v60 = _swiftEmptyArrayStorage;
        specialized ContiguousArray.reserveCapacity(_:)(v44);
        v45 = 5;
        do
        {
          v46 = (id)v42[v45];
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          v47 = v60[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v47);
          v48 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v47, v46);
          specialized ContiguousArray._endMutation()(v48);
          v45 += 2;
          --v44;
        }
        while (v44);
        v49 = v60;
        swift_unknownObjectRelease(v42);
      }
      else
      {
        swift_unknownObjectRelease(v41);
        v49 = _swiftEmptyArrayStorage;
      }
      v50 = objc_allocWithZone((Class)CAMOverlayDiscreteFloatRange);
      sub_100009934();
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v49);
      v52 = objc_msgSend(v50, "initWithValues:", isa);

      v2 = objc_msgSend(v2, "sliderWithPrimaryValues:", v52);
    }
    goto LABEL_37;
  }
  v11 = objc_msgSend(v2, "valueRange");
  if (!v11)
    goto LABEL_29;
  v12 = v11;
  v56 = v3;
  objc_msgSend(v11, "minimum");
  v59[0] = v13;
  v55 = v12;
  objc_msgSend(v12, "maximum");
  v59[1] = v14;
  v15 = sub_100009A20((uint64_t)_swiftEmptyArrayStorage);
  v16 = (void *)objc_opt_self(CAMZoomControlUtilities);
  v17 = 0;
  v18 = 0;
  while (1)
  {
    v22 = v17;
    objc_msgSend(v16, "zoomControlDisplayValueForZoomFactor:mode:device:videoConfiguration:", v57, v58, 0, *(double *)&v59[v18]);
    v23.super.super.isa = CGFloat._bridgeToObjectiveC()().super.super.isa;
    v24.super.super.isa = CGFloat._bridgeToObjectiveC()().super.super.isa;
    if ((v15 & 0xC000000000000001) != 0)
    {
      if (v15 >= 0)
        v15 &= 0xFFFFFFFFFFFFFF8uLL;
      v25 = __CocoaDictionary.count.getter(v15);
      if (__OFADD__(v25, 1))
        goto LABEL_39;
      v15 = sub_100008A88(v15, v25 + 1);
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v15);
    v60 = (_QWORD *)v15;
    v28 = sub_10000DB10((uint64_t)v23.super.super.isa);
    v29 = *(_QWORD *)(v15 + 16);
    v30 = (v27 & 1) == 0;
    v31 = v29 + v30;
    if (__OFADD__(v29, v30))
      break;
    v32 = v27;
    if (*(_QWORD *)(v15 + 24) >= v31)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v15 = (uint64_t)v60;
        if ((v27 & 1) != 0)
          goto LABEL_9;
      }
      else
      {
        sub_100008F54();
        v15 = (uint64_t)v60;
        if ((v32 & 1) != 0)
          goto LABEL_9;
      }
    }
    else
    {
      sub_100008CA8(v31, isUniquelyReferenced_nonNull_native);
      v33 = sub_10000DB10((uint64_t)v23.super.super.isa);
      if ((v32 & 1) != (v34 & 1))
        goto LABEL_41;
      v28 = v33;
      v15 = (uint64_t)v60;
      if ((v32 & 1) != 0)
      {
LABEL_9:
        v20 = *(_QWORD *)(v15 + 56);
        v21 = *(void **)(v20 + 8 * v28);
        *(NSNumber *)(v20 + 8 * v28) = v24;

        goto LABEL_10;
      }
    }
    *(_QWORD *)(v15 + 8 * (v28 >> 6) + 64) |= 1 << v28;
    v35 = 8 * v28;
    *(NSNumber *)(*(_QWORD *)(v15 + 48) + v35) = v23;
    *(NSNumber *)(*(_QWORD *)(v15 + 56) + v35) = v24;
    v36 = *(_QWORD *)(v15 + 16);
    v37 = __OFADD__(v36, 1);
    v38 = v36 + 1;
    if (v37)
      goto LABEL_40;
    *(_QWORD *)(v15 + 16) = v38;
    v39 = v23.super.super.isa;
LABEL_10:

    swift_bridgeObjectRelease(0x8000000000000000);
    v17 = 1;
    v18 = 1;
    if ((v22 & 1) != 0)
    {
      sub_100009934();
      sub_100009970();
      v10 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v15);
      objc_msgSend(v2, "setDisplayValuesByValue:", v10);
      swift_unknownObjectRelease(v55);
      v3 = v56;
      goto LABEL_28;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  v54 = sub_100009934();
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v54);
  __break(1u);
  return result;
}

id sub_100008784(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for OverlayServiceControlHelpers()
{
  return objc_opt_self(CAMOverlayServiceControlHelpers);
}

uint64_t sub_1000087D8(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = kFigCaptureVideoSourceUniqueID_BackWide;
  v2 = a1;
  if ((objc_msgSend(v2, "isEqualToString:", v1) & 1) != 0)
  {
    v3 = 2;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", kFigCaptureVideoSourceUniqueID_FrontWide) & 1) != 0)
  {
    v3 = 8;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", kFigCaptureVideoSourceUniqueID_Telephoto) & 1) != 0)
  {
    v3 = 3;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", kFigCaptureVideoSourceUniqueID_Bravo) & 1) != 0)
  {
    v3 = 4;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", kFigCaptureVideoSourceUniqueID_Pearl) & 1) != 0)
  {
    v3 = 9;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", kFigCaptureVideoSourceUniqueID_BackSuperWide) & 1) != 0)
  {
    v3 = 5;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", kFigCaptureVideoSourceUniqueID_WideBravo) & 1) != 0)
  {
    v3 = 6;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", kFigCaptureVideoSourceUniqueID_SuperBravo) & 1) != 0)
  {
    v3 = 7;
  }
  else if (objc_msgSend(v2, "isEqualToString:", kFigCaptureVideoSourceUniqueID_FrontSuperWide))
  {
    v3 = 10;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

_QWORD *sub_100008920(uint64_t a1)
{
  int64_t v1;
  _QWORD *v2;
  __int128 *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD *v18;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    v18 = _swiftEmptyArrayStorage;
    sub_10000DE90(0, v1, 0);
    v4 = (__int128 *)(a1 + 32);
    v2 = _swiftEmptyArrayStorage;
    do
    {
      v14 = *v4;
      v16 = v14;
      v5 = (id)v14;
      v6 = *((id *)&v14 + 1);
      v7 = v5;
      v8 = v6;
      v9 = sub_100007EB0(&qword_10001ED08);
      v10 = sub_100007EB0((uint64_t *)&unk_10001F0D0);
      swift_dynamicCast(&v17, &v16, v9, v10, 7);
      v15 = v17;

      if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      {
        sub_10000DE90(0, v2[2] + 1, 1);
        v2 = v18;
      }
      v12 = v2[2];
      v11 = v2[3];
      if (v12 >= v11 >> 1)
      {
        sub_10000DE90(v11 > 1, v12 + 1, 1);
        v2 = v18;
      }
      v2[2] = v12 + 1;
      *(_OWORD *)&v2[2 * v12 + 4] = v15;
      ++v4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

Swift::Int sub_100008A88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int result;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (a2)
  {
    sub_100007EB0((uint64_t *)&unk_10001F0C0);
    v4 = static _DictionaryStorage.convert(_:capacity:)(a1, a2);
    v29 = v4;
    v5 = __CocoaDictionary.makeIterator()(a1);
    v6 = __CocoaDictionary.Iterator.next()();
    if (v6)
    {
      v8 = v6;
      v9 = v7;
      v10 = sub_100009934();
      do
      {
        v27 = v8;
        swift_dynamicCast(&v28, &v27, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
        v26 = v9;
        swift_dynamicCast(&v27, &v26, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
        v4 = v29;
        v21 = *(_QWORD *)(v29 + 16);
        if (*(_QWORD *)(v29 + 24) <= v21)
        {
          sub_100008CA8(v21 + 1, 1);
          v4 = v29;
        }
        v12 = v27;
        v11 = v28;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v14 = v4 + 64;
        v15 = -1 << *(_BYTE *)(v4 + 32);
        v16 = result & ~v15;
        v17 = v16 >> 6;
        if (((-1 << v16) & ~*(_QWORD *)(v4 + 64 + 8 * (v16 >> 6))) != 0)
        {
          v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v4 + 64 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v22 = 0;
          v23 = (unint64_t)(63 - v15) >> 6;
          do
          {
            if (++v17 == v23 && (v22 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v24 = v17 == v23;
            if (v17 == v23)
              v17 = 0;
            v22 |= v24;
            v25 = *(_QWORD *)(v14 + 8 * v17);
          }
          while (v25 == -1);
          v18 = __clz(__rbit64(~v25)) + (v17 << 6);
        }
        *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
        v19 = 8 * v18;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + v19) = v11;
        *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v12;
        ++*(_QWORD *)(v4 + 16);
        v8 = __CocoaDictionary.Iterator.next()();
        v9 = v20;
      }
      while (v8);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v4;
}

Swift::Int sub_100008CA8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  Swift::Int result;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100007EB0((uint64_t *)&unk_10001F0C0);
  v38 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v37 = v3;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v10 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v11 = ~(-1 << v9);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v9 + 63) >> 6;
    v14 = v7 + 64;
    result = swift_retain(v5);
    v16 = 0;
    while (1)
    {
      if (v12)
      {
        v22 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v23 = v22 | (v16 << 6);
      }
      else
      {
        if (__OFADD__(v16++, 1))
          goto LABEL_41;
        if (v16 >= v13)
        {
LABEL_34:
          swift_release(v5);
          v3 = v37;
          if ((v38 & 1) != 0)
          {
            v36 = 1 << *(_BYTE *)(v5 + 32);
            if (v36 >= 64)
              bzero((void *)(v5 + 64), ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
            else
              *v10 = -1 << v36;
            *(_QWORD *)(v5 + 16) = 0;
          }
          break;
        }
        v25 = v10[v16];
        if (!v25)
        {
          v26 = v16 + 1;
          if (v16 + 1 >= v13)
            goto LABEL_34;
          v25 = v10[v26];
          if (!v25)
          {
            while (1)
            {
              v16 = v26 + 1;
              if (__OFADD__(v26, 1))
                break;
              if (v16 >= v13)
                goto LABEL_34;
              v25 = v10[v16];
              ++v26;
              if (v25)
                goto LABEL_23;
            }
LABEL_40:
            __break(1u);
LABEL_41:
            __break(1u);
            return result;
          }
          ++v16;
        }
LABEL_23:
        v12 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v16 << 6);
      }
      v27 = 8 * v23;
      v28 = *(void **)(*(_QWORD *)(v5 + 48) + v27);
      v29 = *(void **)(*(_QWORD *)(v5 + 56) + v27);
      if ((v38 & 1) == 0)
      {
        v30 = v28;
        v31 = v29;
      }
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
      v17 = -1 << *(_BYTE *)(v8 + 32);
      v18 = result & ~v17;
      v19 = v18 >> 6;
      if (((-1 << v18) & ~*(_QWORD *)(v14 + 8 * (v18 >> 6))) != 0)
      {
        v20 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v14 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v32 = 0;
        v33 = (unint64_t)(63 - v17) >> 6;
        do
        {
          if (++v19 == v33 && (v32 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v34 = v19 == v33;
          if (v19 == v33)
            v19 = 0;
          v32 |= v34;
          v35 = *(_QWORD *)(v14 + 8 * v19);
        }
        while (v35 == -1);
        v20 = __clz(__rbit64(~v35)) + (v19 << 6);
      }
      *(_QWORD *)(v14 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      v21 = 8 * v20;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + v21) = v28;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + v21) = v29;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

id sub_100008F54()
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
  void *v18;
  id v19;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100007EB0((uint64_t *)&unk_10001F0C0);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    if (!v21)
      break;
LABEL_23:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
  }
  v22 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void sub_1000090E0(unint64_t a1, unint64_t a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  unint64_t v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  BOOL v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v40;
  id v41;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v5 = a2;
  v6 = a1;
  v7 = (void *)(a1 >> 62);
  if (a1 >> 62)
    goto LABEL_108;
  v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  v9 = a2 >> 62;
  if (!(a2 >> 62))
    goto LABEL_3;
LABEL_112:
  if (v5 < 0)
    v47 = v5;
  else
    v47 = v5 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v5);
  v10 = _CocoaArrayWrapper.endIndex.getter(v47);
  swift_bridgeObjectRelease(v5);
LABEL_4:
  if (v10 >= v8)
    v11 = v8;
  else
    v11 = v10;
  v59 = v6;
  v60 = v5;
  v51 = v9;
  if ((uint64_t)v11 > 0)
  {
    v12 = sub_100007EB0((uint64_t *)&unk_10001ED10);
    v13 = (_QWORD *)swift_allocObject(v12, 16 * v11 + 32, 7);
    v14 = j__malloc_size(v13);
    v15 = v14 - 32;
    if (v14 < 32)
      v15 = v14 - 17;
    v8 = v15 >> 4;
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 4);
    v55 = v13;
    if (v7)
    {
      if (v6 < 0)
        v2 = (void *)v6;
      else
        v2 = (void *)(v6 & 0xFFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain_n(v6, 2);
      swift_bridgeObjectRetain(v5);
      v10 = _CocoaArrayWrapper.endIndex.getter(v2);
      swift_bridgeObjectRelease(v6);
    }
    else
    {
      v10 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v6);
      swift_bridgeObjectRetain(v5);
    }
    if (v10)
    {
      v53 = v11;
      v11 = v6 & 0xC000000000000001;
      if ((v6 & 0xC000000000000001) == 0)
      {
        if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_120:
          v24 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v11, v6);
          goto LABEL_52;
        }
        v16 = *(id *)(v6 + 32);
LABEL_26:
        v2 = v16;
        v49 = v7;
        if (v9)
        {
          if (v5 < 0)
            v17 = v5;
          else
            v17 = v5 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v5);
          v7 = (void *)_CocoaArrayWrapper.endIndex.getter(v17);
          swift_bridgeObjectRelease(v5);
        }
        else
        {
          v7 = *(void **)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        if (!v7)
          goto LABEL_124;
        v18 = 0;
        v19 = v5;
        v5 &= 0xC000000000000001;
        v56 = v19 + 32;
        v58 = v19 & 0xFFFFFFFFFFFFFF8;
        v4 = v6 & 0xFFFFFFFFFFFFFF8;
        v54 = (v8 & 0x7FFFFFFFFFFFFFFFLL) - v53;
        v3 = v55 + 6;
        v20 = v6 + 40;
        v6 = v10 - 1;
        while (1)
        {
          if (v5)
          {
            v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v18, v60);
          }
          else
          {
            if (v18 >= *(_QWORD *)(v58 + 16))
              goto LABEL_99;
            v22 = *(id *)(v56 + 8 * v18);
          }
          *(v3 - 2) = v2;
          *(v3 - 1) = v22;
          if (v53 - 1 == v18)
            break;
          if (v6 == v18)
          {
            __break(1u);
LABEL_99:
            __break(1u);
LABEL_100:
            __break(1u);
LABEL_101:
            __break(1u);
LABEL_102:
            __break(1u);
LABEL_103:
            __break(1u);
LABEL_104:
            __break(1u);
LABEL_105:
            __break(1u);
LABEL_106:
            __break(1u);
LABEL_107:
            __break(1u);
LABEL_108:
            if (v6 < 0)
              v46 = v6;
            else
              v46 = v6 & 0xFFFFFFFFFFFFFF8;
            swift_bridgeObjectRetain(v6);
            v8 = _CocoaArrayWrapper.endIndex.getter(v46);
            swift_bridgeObjectRelease(v6);
            v9 = (unint64_t)v5 >> 62;
            if ((unint64_t)v5 >> 62)
              goto LABEL_112;
LABEL_3:
            v10 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
            goto LABEL_4;
          }
          v23 = v18 + 1;
          if (v11)
          {
            v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v23, v59);
          }
          else
          {
            if (v23 >= *(_QWORD *)(v4 + 16))
              goto LABEL_100;
            v21 = *(id *)(v20 + 8 * v18);
          }
          v2 = v21;
          v3 += 2;
          if (v7 == (void *)++v18)
            goto LABEL_124;
        }
        v6 = v59;
        v5 = v60;
        v8 = (uint64_t)v55;
        v11 = v53;
        if (!v49)
          goto LABEL_46;
        goto LABEL_14;
      }
LABEL_118:
      v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v6);
      goto LABEL_26;
    }
LABEL_117:
    __break(1u);
    goto LABEL_118;
  }
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_117;
  }
  v8 = (uint64_t)_swiftEmptyArrayStorage;
  v54 = _swiftEmptyArrayStorage[3] >> 1;
  v4 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v5);
  v3 = &_swiftEmptyArrayStorage[4];
  if (!v7)
  {
LABEL_46:
    v10 = *(_QWORD *)(v4 + 16);
    goto LABEL_47;
  }
LABEL_14:
  if (v6 < 0)
    v2 = (void *)v6;
  else
    v2 = (void *)v4;
  swift_bridgeObjectRetain(v6);
  v10 = _CocoaArrayWrapper.endIndex.getter(v2);
  swift_bridgeObjectRelease(v6);
LABEL_47:
  v4 = v54;
  if (v11 == v10)
  {
LABEL_48:
    swift_bridgeObjectRelease(v5);
    swift_bridgeObjectRelease(v6);
    goto LABEL_94;
  }
  v58 = v6 & 0xC000000000000001;
  if ((v6 & 0xC000000000000001) != 0)
    goto LABEL_120;
  if (v11 >= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_122;
  }
  v24 = *(id *)(v6 + 8 * v11 + 32);
LABEL_52:
  v7 = v24;
  v25 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:

    __break(1u);
    return;
  }
  if (v51)
  {
    if (v5 < 0)
      v26 = v5;
    else
      v26 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v5);
    v2 = (void *)_CocoaArrayWrapper.endIndex.getter(v26);
    swift_bridgeObjectRelease(v5);
    if ((void *)v11 == v2)
      goto LABEL_93;
    goto LABEL_60;
  }
  v2 = *(void **)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  if ((void *)v11 != v2)
  {
LABEL_60:
    v55 = (_QWORD *)v10;
    v57 = v5 & 0xC000000000000001;
    v52 = v5 + 32;
    v53 = v5 & 0xFFFFFFFFFFFFFF8;
    v48 = v6 + 32;
    v50 = v6 & 0xFFFFFFFFFFFFFF8;
    do
    {
      if (v57)
      {
        v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v11, v5);
        if (!v4)
          goto LABEL_69;
      }
      else
      {
        if ((v11 & 0x8000000000000000) != 0)
          goto LABEL_103;
        if (v11 >= *(_QWORD *)(v53 + 16))
          goto LABEL_104;
        v27 = *(id *)(v52 + 8 * v11);
        if (!v4)
        {
LABEL_69:
          v29 = *(_QWORD *)(v8 + 24);
          if ((uint64_t)((v29 >> 1) + 0x4000000000000000) < 0)
            goto LABEL_105;
          v30 = v29 & 0xFFFFFFFFFFFFFFFELL;
          if (v30 <= 1)
            v31 = 1;
          else
            v31 = v30;
          v32 = sub_100007EB0((uint64_t *)&unk_10001ED10);
          v33 = (_QWORD *)swift_allocObject(v32, 16 * v31 + 32, 7);
          v34 = j__malloc_size(v33);
          v35 = v34 - 32;
          if (v34 < 32)
            v35 = v34 - 17;
          v36 = v35 >> 4;
          v33[2] = v31;
          v33[3] = 2 * (v35 >> 4);
          v37 = (unint64_t)(v33 + 4);
          v38 = *(_QWORD *)(v8 + 24) >> 1;
          if (*(_QWORD *)(v8 + 16))
          {
            if (v33 != (_QWORD *)v8 || v37 >= v8 + 32 + 16 * v38)
              memmove(v33 + 4, (const void *)(v8 + 32), 16 * v38);
            *(_QWORD *)(v8 + 16) = 0;
          }
          v3 = (_QWORD *)(v37 + 16 * v38);
          v40 = (v36 & 0x7FFFFFFFFFFFFFFFLL) - v38;
          swift_release(v8);
          v8 = (uint64_t)v33;
          v6 = v59;
          v5 = v60;
          v28 = __OFSUB__(v40, 1);
          v4 = v40 - 1;
          if (v28)
            goto LABEL_101;
          goto LABEL_84;
        }
      }
      v28 = __OFSUB__(v4--, 1);
      if (v28)
        goto LABEL_101;
LABEL_84:
      *v3 = v7;
      v3[1] = v27;
      if ((_QWORD *)v25 == v55)
        goto LABEL_48;
      if (v58)
      {
        v41 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v25, v6);
      }
      else
      {
        if ((v25 & 0x8000000000000000) != 0)
          goto LABEL_106;
        if (v25 >= *(_QWORD *)(v50 + 16))
          goto LABEL_107;
        v41 = *(id *)(v48 + 8 * v25);
      }
      v7 = v41;
      if (__OFADD__(v25, 1))
        goto LABEL_102;
      v3 += 2;
      v11 = v25;
    }
    while (v25++ != (_QWORD)v2);
  }
LABEL_93:
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);

LABEL_94:
  v43 = *(_QWORD *)(v8 + 24);
  if (v43 < 2)
    return;
  v44 = v43 >> 1;
  v28 = __OFSUB__(v44, v4);
  v45 = v44 - v4;
  if (v28)
    goto LABEL_123;
  *(_QWORD *)(v8 + 16) = v45;
}

_QWORD *sub_1000096B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  int64_t v10;
  id v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSNumber v24;
  double v25;
  Class isa;
  uint64_t v27;
  objc_class *v28;
  objc_class *v29;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  void *v35;

  v34 = 0;
  v35 = 0;
  objc_msgSend((id)objc_opt_self(CAMZoomControlUtilities), "shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:", a1, a2, a3, a4, &v35, &v34);
  v5 = v34;
  v6 = v35;
  if (v35)
  {
    v35 = 0;
    sub_100009934();
    v7 = v6;
    v8 = v5;
    v9 = v7;
    static Array._conditionallyBridgeFromObjectiveC(_:result:)();

    v10 = (int64_t)v35;
    if (v35)
    {
      if (v8
        && (v35 = 0,
            v11 = v8,
            static Array._conditionallyBridgeFromObjectiveC(_:result:)(),
            v11,
            (v12 = (int64_t)v35) != 0))
      {
        if ((unint64_t)v10 >> 62)
        {
          v32 = v5;
          if (v10 >= 0)
            v19 = v10 & 0xFFFFFFFFFFFFFF8;
          else
            v19 = v10;
          swift_bridgeObjectRetain(v10);
          v20 = _CocoaArrayWrapper.endIndex.getter(v19);
          swift_bridgeObjectRelease(v10);
          v13 = v20;
          v5 = v32;
        }
        else
        {
          v13 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if ((unint64_t)v12 >> 62)
        {
          v31 = v13;
          v33 = v5;
          if (v12 >= 0)
            v21 = v12 & 0xFFFFFFFFFFFFFF8;
          else
            v21 = v12;
          swift_bridgeObjectRetain(v12);
          v22 = _CocoaArrayWrapper.endIndex.getter(v21);
          swift_bridgeObjectRelease(v12);
          v23 = v22;
          v5 = v33;
          if (v31 == v23)
            goto LABEL_9;
        }
        else if (v13 == *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_9:
          sub_1000090E0(v10, v12);
          v15 = v14;
          swift_bridgeObjectRelease(v12);
          swift_bridgeObjectRelease(v10);
          v16 = sub_100008920(v15);

          swift_release(v15);
          return v16;
        }
        swift_bridgeObjectRelease(v10);
        v18 = v12;
      }
      else
      {
        v18 = v10;
      }
      swift_bridgeObjectRelease(v18);
    }
  }
  else
  {
    v17 = v34;
  }
  sub_100009934();
  v24.super.super.isa = NSNumber.init(floatLiteral:)(1.0).super.super.isa;
  v25 = 3.0;
  if (!a1)
    v25 = 5.0;
  isa = NSNumber.init(floatLiteral:)(v25).super.super.isa;
  v27 = sub_100007EB0(&qword_10001ED00);
  v16 = (_QWORD *)swift_allocObject(v27, 64, 7);
  *((_OWORD *)v16 + 1) = xmmword_1000128C0;
  v16[4] = v24.super.super.isa;
  v16[5] = v24.super.super.isa;
  v16[6] = isa;
  v16[7] = isa;
  v28 = v24.super.super.isa;
  v29 = isa;

  return v16;
}

unint64_t sub_100009934()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001F050;
  if (!qword_10001F050)
  {
    v1 = objc_opt_self(NSNumber);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001F050);
  }
  return result;
}

unint64_t sub_100009970()
{
  unint64_t result;
  unint64_t v1;

  result = qword_10001F060;
  if (!qword_10001F060)
  {
    v1 = sub_100009934();
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10001F060);
  }
  return result;
}

uint64_t sub_1000099BC(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

unint64_t sub_100009A20(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  void *v7;
  id v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007EB0((uint64_t *)&unk_10001F0C0);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 40);
  while (1)
  {
    v7 = *v6;
    v8 = *(v6 - 1);
    v9 = v7;
    result = sub_10000DB10((uint64_t)v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = 8 * result;
    *(_QWORD *)(v4[6] + v12) = v8;
    *(_QWORD *)(v4[7] + v12) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v6 += 2;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100009B28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007EB0(&qword_10001F0B0);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100010434(v7, (uint64_t)v16);
    result = sub_10000DB40((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_10001047C(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_100009DCC()
{
  return sub_10000CEFC(0, type metadata accessor for OverlayWindow);
}

uint64_t type metadata accessor for OverlayWindow()
{
  return objc_opt_self(_TtC18CameraOverlayAngelP33_26879C1C0E4FD34210CC0E55F689DAC713OverlayWindow);
}

void sub_100009E78(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;

  v2 = v1;
  if (qword_10001ECB0 != -1)
    swift_once(&qword_10001ECB0, sub_100010520);
  v4 = type metadata accessor for Logger(0);
  sub_1000081E0(v4, (uint64_t)qword_10001F270);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138543362;
    v15 = v5;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v8 + 4, v8 + 12);
    *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SceneDelegate: Disconnected scene: %{public}@", v8, 0xCu);
    v11 = sub_100007EB0(&qword_10001F018);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  v12 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window) = 0;

  v13 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController) = 0;

  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientMonitor), "endMonitoring");
  v14 = objc_msgSend((id)objc_opt_self(BKSTouchDeliveryObservationService), "sharedInstance");
  objc_msgSend(v14, "removeObserver:", v2);

}

void sub_10000A0DC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  void *v17;
  NSString v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  uint64_t v27;

  v1 = v0;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window);
  if (v2
    && (v3 = objc_msgSend(v2, "windowScene")) != 0
    && (v3, !*(_QWORD *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken))
    && (v4 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer,
        !*(_QWORD *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer)))
  {
    if (qword_10001ECB0 != -1)
      swift_once(&qword_10001ECB0, sub_100010520);
    v12 = type metadata accessor for Logger(0);
    v13 = sub_1000081E0(v12, (uint64_t)qword_10001F270);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "SceneDelegate: Waiting for scene teardown", v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }

    if (qword_10001ECA0 != -1)
      swift_once(&qword_10001ECA0, sub_100007C0C);
    v17 = (void *)qword_10001F260;
    if (!qword_10001F260
      || (v18 = String._bridgeToObjectiveC()(),
          objc_msgSend(v17, "doubleForKey:", v18),
          v20 = v19,
          v18,
          v20 <= 0.0))
    {
      v20 = 5.0;
    }
    v21 = (void *)objc_opt_self(NSTimer);
    v22 = swift_allocObject(&unk_100018E08, 24, 7);
    swift_unknownObjectWeakInit(v22 + 16, v1);
    v26[4] = sub_10001036C;
    v27 = v22;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 1107296256;
    v26[2] = sub_10000A48C;
    v26[3] = &unk_100018E70;
    v23 = _Block_copy(v26);
    swift_release(v27);
    v24 = objc_msgSend(v21, "scheduledTimerWithTimeInterval:repeats:block:", 0, v23, v20);
    _Block_release(v23);
    v25 = *(void **)(v1 + v4);
    *(_QWORD *)(v1 + v4) = v24;

  }
  else
  {
    v5 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer;
    if (*(_QWORD *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer))
    {
      if (qword_10001ECB0 != -1)
        swift_once(&qword_10001ECB0, sub_100010520);
      v6 = type metadata accessor for Logger(0);
      v7 = sub_1000081E0(v6, (uint64_t)qword_10001F270);
      v8 = Logger.logObject.getter(v7);
      v9 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "SceneDelegate: Canceling teardown", v10, 2u);
        swift_slowDealloc(v10, -1, -1);
      }

      objc_msgSend(*(id *)(v1 + v5), "invalidate");
      v11 = *(void **)(v1 + v5);
      *(_QWORD *)(v1 + v5) = 0;

    }
  }
}

void sub_10000A434(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  _BYTE v6[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    sub_10000A490(a1);

  }
}

void sub_10000A490(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD aBlock[6];

  v3 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v4 = *(void **)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window);
  if (!v4)
  {

    return;
  }
  v18 = v3;
  v5 = objc_msgSend(v4, "windowScene");
  if (!v5)
    goto LABEL_13;
  v6 = v5;
  if ((objc_msgSend(a1, "isValid") & 1) == 0
    || (v7 = *(void **)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer)) == 0
    || (sub_100007F30(0, &qword_10001F020, NSTimer_ptr),
        v8 = a1,
        v9 = v7,
        v10 = static NSObject.== infix(_:_:)(v8, v9),
        v8,
        v9,
        (v10 & 1) == 0))
  {

LABEL_13:
    return;
  }
  if (qword_10001ECB0 != -1)
    swift_once(&qword_10001ECB0, sub_100010520);
  v11 = type metadata accessor for Logger(0);
  v12 = sub_1000081E0(v11, (uint64_t)qword_10001F270);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "SceneDelegate: Committing teardown", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  v16 = objc_msgSend(v6, "session");
  aBlock[4] = sub_10000A6EC;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A48C;
  aBlock[3] = &unk_100018E48;
  v17 = _Block_copy(aBlock);
  objc_msgSend(v18, "requestSceneSessionDestruction:options:errorHandler:", v16, 0, v17);

  _Block_release(v17);
}

void sub_10000A6EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *oslog;
  uint64_t v10;
  uint64_t v11;

  if (qword_10001ECB0 != -1)
    swift_once(&qword_10001ECB0, sub_100010520);
  v2 = type metadata accessor for Logger(0);
  sub_1000081E0(v2, (uint64_t)qword_10001F270);
  swift_errorRetain(a1);
  v3 = swift_errorRetain(a1);
  oslog = Logger.logObject.getter(v3);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 138543362;
    swift_errorRetain(a1);
    v7 = _swift_stdlib_bridgeErrorToNSError(a1);
    v10 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v5 + 4, v5 + 12);
    *v6 = v7;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "SceneDelegate: Failed teardown: %{public}@", v5, 0xCu);
    v8 = sub_100007EB0(&qword_10001F018);
    swift_arrayDestroy(v6, 1, v8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);

  }
}

void sub_10000A8AC(uint64_t a1, void *a2)
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

void sub_10000A960(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  char v7;
  id v8;

  v2 = v1;
  v3 = a1;
  v4 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection;
  v5 = *(void **)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  if (v5)
  {
    if (!a1)
      goto LABEL_7;
    sub_100007F30(0, &qword_10001F058, &off_100018358);
    v6 = v5;
    v3 = v3;
    v7 = static NSObject.== infix(_:_:)(v6, v3);

    if ((v7 & 1) != 0)
      return;
LABEL_6:
    v8 = v3;
    objc_msgSend(v8, "setQuietUIActive:", 0);
    objc_msgSend(v8, "sendOverlayVisibility:activeControlIdentifier:", 0, 0);

    objc_msgSend(v8, "removeObserver:", v2);
    v5 = *(void **)(v2 + v4);
    if (!v5)
    {
LABEL_8:
      sub_10000B178();
      return;
    }
LABEL_7:
    objc_msgSend(v5, "addObserver:", v2);
    goto LABEL_8;
  }
  if (a1)
    goto LABEL_6;
}

void sub_10000AA6C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char **v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  char v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  Swift::String v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v49;
  void (*v50)(uint64_t *, _QWORD);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  Swift::String v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  _QWORD *v66;
  id v67;
  uint64_t v68;
  void *v69;
  char *v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  void *v82;

  v1 = v0;
  v82 = 0;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken);
  v3 = &selRef_setInvalidationHandler_;
  if (!v2 || !*(_QWORD *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window))
    goto LABEL_41;
  v4 = (void *)objc_opt_self(CAMOverlayServer);
  v5 = v2;
  v6 = objc_msgSend(v4, "sharedInstance");
  v7 = objc_msgSend(v6, "connectionsByProcessID");

  v8 = sub_100007F30(0, (unint64_t *)&qword_10001F050, NSNumber_ptr);
  v9 = sub_100007F30(0, &qword_10001F058, &off_100018358);
  v10 = sub_100009970();
  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v7, v8, v9, v10);

  v12 = v5;
  v13 = swift_bridgeObjectRetain(v11);
  sub_10000E5D0(v13, (uint64_t)v12);
  v15 = v14;
  swift_bridgeObjectRelease(v11);

  v82 = v15;
  v16 = *(void **)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  v76 = v12;
  if (v15)
  {
    if (v16)
    {
      v17 = v15;
      v18 = v16;
      v19 = static NSObject.== infix(_:_:)(v17, v18);

      if ((v19 & 1) != 0)
      {

LABEL_8:
        swift_bridgeObjectRelease(v11);

        goto LABEL_41;
      }
    }
    else
    {
      v20 = v15;
    }
  }
  else if (!v16)
  {
    goto LABEL_8;
  }
  v75 = v15;
  if ((v11 & 0xC000000000000001) != 0)
  {
    if (v11 < 0)
      v21 = v11;
    else
      v21 = v11 & 0xFFFFFFFFFFFFFF8;
    v22 = __CocoaDictionary.count.getter(v21);
    v74 = v1;
    if (v22)
      goto LABEL_15;
  }
  else
  {
    v22 = *(_QWORD *)(v11 + 16);
    v74 = v1;
    if (v22)
    {
LABEL_15:
      sub_10000DEAC(0, v22 & ~(v22 >> 63), 0);
      v79 = sub_10000E1B8(v11);
      v80 = v23;
      v81 = v24 & 1;
      if (v22 < 0)
      {
        __break(1u);
LABEL_43:
        __break(1u);
      }
      if (v11 < 0)
        v25 = v11;
      else
        v25 = v11 & 0xFFFFFFFFFFFFFF8;
      do
      {
        while (1)
        {
          sub_10000E414(v79, v80, v81, v11);
          v36 = v35;
          v77 = 2314;
          v78 = 0xE200000000000000;
          v37 = objc_msgSend(v35, "description");
          v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v40 = v39;

          v41._countAndFlagsBits = v38;
          v41._object = v40;
          String.append(_:)(v41);

          swift_bridgeObjectRelease(v40);
          v42 = v77;
          v43 = v78;
          if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
            sub_10000DEAC(0, _swiftEmptyArrayStorage[2] + 1, 1);
          v45 = _swiftEmptyArrayStorage[2];
          v44 = _swiftEmptyArrayStorage[3];
          if (v45 >= v44 >> 1)
            sub_10000DEAC(v44 > 1, v45 + 1, 1);
          _swiftEmptyArrayStorage[2] = v45 + 1;
          v46 = &_swiftEmptyArrayStorage[2 * v45];
          v46[4] = v42;
          v46[5] = v43;
          if ((v11 & 0xC000000000000001) != 0)
            break;
          v26 = v79;
          v27 = v80;
          v28 = v81;
          sub_10000E278(v79, v80, v81, v11);
          v30 = v29;
          v32 = v31;
          v34 = v33;
          sub_1000102AC(v26, v27, v28);
          v79 = v30;
          v80 = v32;
          v81 = v34 & 1;
          if (!--v22)
            goto LABEL_30;
        }
        if ((v81 & 1) == 0)
          goto LABEL_43;
        v47 = __CocoaDictionary.Index.handleBitPattern.getter(v79, v80);
        if (v47)
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v47);
        else
          isUniquelyReferenced_nonNull_native = 1;
        v49 = sub_100007EB0(&qword_10001F068);
        v50 = (void (*)(uint64_t *, _QWORD))Dictionary.Index._asCocoa.modify(&v77, v49);
        __CocoaDictionary.formIndex(after:isUnique:)(v51, isUniquelyReferenced_nonNull_native, v25);
        v50(&v77, 0);
        --v22;
      }
      while (v22);
LABEL_30:
      sub_1000102AC(v79, v80, v81);
      swift_bridgeObjectRelease(v11);
      v1 = v74;
      goto LABEL_33;
    }
  }
  swift_bridgeObjectRelease(v11);
LABEL_33:
  v77 = (uint64_t)_swiftEmptyArrayStorage;
  v52 = sub_100007EB0(&qword_10001F070);
  v53 = sub_1000103EC(&qword_10001F078, &qword_10001F070, (uint64_t)&protocol conformance descriptor for [A]);
  v54 = BidirectionalCollection<>.joined(separator:)(0, 0xE000000000000000, v52, v53);
  v56 = v55;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  v77 = v54;
  v78 = v56;
  swift_bridgeObjectRetain(v56);
  v57._countAndFlagsBits = 10;
  v57._object = (void *)0xE100000000000000;
  String.append(_:)(v57);
  swift_bridgeObjectRelease(v56);
  v58 = v77;
  v59 = v78;
  v3 = &selRef_setInvalidationHandler_;
  if (qword_10001ECB0 != -1)
    swift_once(&qword_10001ECB0, sub_100010520);
  v60 = type metadata accessor for Logger(0);
  sub_1000081E0(v60, (uint64_t)qword_10001F270);
  v61 = v75;
  v62 = swift_bridgeObjectRetain(v59);
  v63 = Logger.logObject.getter(v62);
  v64 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v63, v64))
  {
    v65 = swift_slowAlloc(22, -1);
    v66 = (_QWORD *)swift_slowAlloc(8, -1);
    v73 = swift_slowAlloc(32, -1);
    v77 = v73;
    *(_DWORD *)v65 = 138543618;
    if (v75)
    {
      v79 = (uint64_t)v61;
      v67 = v61;
    }
    else
    {
      v79 = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, &v80, v65 + 4, v65 + 12);
    *v66 = v75;

    *(_WORD *)(v65 + 12) = 2082;
    swift_bridgeObjectRetain(v59);
    v79 = sub_10000D4D0(v58, v59, &v77);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, &v80, v65 + 14, v65 + 22);
    swift_bridgeObjectRelease_n(v59, 3);
    _os_log_impl((void *)&_mh_execute_header, v63, v64, "SceneDelegate: Adopting connection %{public}@ out of [%{public}s]", (uint8_t *)v65, 0x16u);
    v68 = sub_100007EB0(&qword_10001F018);
    swift_arrayDestroy(v66, 1, v68);
    swift_slowDealloc(v66, -1, -1);
    swift_arrayDestroy(v73, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v73, -1, -1);
    swift_slowDealloc(v65, -1, -1);

    v1 = v74;
    v3 = &selRef_setInvalidationHandler_;
  }
  else
  {

    swift_bridgeObjectRelease_n(v59, 2);
  }
LABEL_41:
  swift_beginAccess(&v82, &v77, 0, 0);
  v69 = v82;
  v70 = v3[431];
  v71 = *(void **)&v70[v1];
  *(_QWORD *)&v70[v1] = v82;
  v72 = v69;
  sub_10000A960(v71);

}

void sub_10000B178()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSArray v19;
  NSDictionary v20;
  id v21;
  void *v22;
  id v23;
  char *v24;
  uint64_t v25;
  id v26;

  v1 = v0;
  v2 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection;
  v3 = *(void **)&v0[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection];
  if (!v3)
  {
    v7 = 0;
    goto LABEL_13;
  }
  v4 = objc_msgSend(v3, "updatesByID");
  if (!v4)
  {
    v7 = 0;
    v8 = *(void **)&v0[v2];
    if (v8)
      goto LABEL_7;
LABEL_13:
    v26 = 0;
    v12 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  v6 = sub_100007F30(0, &qword_10001F028, CAMOverlayServiceControlUpdate_ptr);
  v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for String, v6, &protocol witness table for String);

  v8 = *(void **)&v1[v2];
  if (!v8)
    goto LABEL_13;
LABEL_7:
  v9 = objc_msgSend(v8, "controls");
  if (!v9)
    goto LABEL_13;
  v10 = v9;
  v11 = sub_100007F30(0, &qword_10001ECD0, CAMAbstractOverlayServiceControl_ptr);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);

  if ((unint64_t)v12 >> 62)
  {
    if (v12 < 0)
      v25 = v12;
    else
      v25 = v12 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v12);
    if (_CocoaArrayWrapper.endIndex.getter(v25) >= 1)
      goto LABEL_10;
LABEL_31:
    swift_bridgeObjectRelease(v12);
    v26 = 0;
    goto LABEL_14;
  }
  v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(v12);
  if (v13 < 1)
    goto LABEL_31;
LABEL_10:
  v14 = *(void **)&v1[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_lastUsedControl];
  if (v14 && (v15 = v14, v26 = sub_10000B468(v12), v15, v26))
  {
    swift_bridgeObjectRelease(v12);
  }
  else
  {
    v24 = v1;
    v26 = sub_10000ED18(v12, (uint64_t)v24);
    swift_bridgeObjectRelease(v12);

  }
LABEL_14:
  v16 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController;
  v17 = *(void **)&v1[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController];
  if (!v17)
  {
    swift_bridgeObjectRelease(v7);
    swift_bridgeObjectRelease(v12);
    if (*(_QWORD *)&v1[v2])
      goto LABEL_25;
    goto LABEL_23;
  }
  if (v12)
  {
    sub_100007F30(0, &qword_10001ECD0, CAMAbstractOverlayServiceControl_ptr);
    v18 = v17;
    v19.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v12);
    if (v7)
    {
LABEL_17:
      sub_100007F30(0, &qword_10001F028, CAMOverlayServiceControlUpdate_ptr);
      v20.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v7);
      goto LABEL_22;
    }
  }
  else
  {
    v21 = v17;
    v19.super.isa = 0;
    if (v7)
      goto LABEL_17;
  }
  v20.super.isa = 0;
LABEL_22:
  objc_msgSend(v17, "setControls:updatesByID:activeControl:", v19.super.isa, v20.super.isa, v26, v26);

  if (*(_QWORD *)&v1[v2])
    goto LABEL_25;
LABEL_23:
  v22 = *(void **)&v1[v16];
  if (v22)
  {
    v23 = v22;
    objc_msgSend(v23, "dismissViewControllerAnimated:completion:", 1, 0);

  }
LABEL_25:

}

id sub_10000B468(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  id v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  char **v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  char *v58;
  uint64_t v60;
  _QWORD *v61;
  id v62;
  uint64_t v64;
  unint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  _QWORD *v69;
  id v70;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_42;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v2; v2 = _CocoaArrayWrapper.endIndex.getter(v46))
  {
    v65 = v1 & 0xC000000000000001;
    v3 = 4;
    while (1)
    {
      v4 = v65 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v3 - 4, v1) : *(id *)(v1 + 8 * v3);
      v5 = v4;
      v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1))
        break;
      v7 = v1;
      v8 = objc_msgSend(v4, "identifier");
      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v11 = v10;

      v12 = objc_msgSend(v66, "identifier");
      v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v15 = v14;

      if (v9 == v13 && v11 == v15)
      {
        swift_bridgeObjectRelease(v7);
        swift_bridgeObjectRelease(v11);
LABEL_22:
        swift_bridgeObjectRelease(v11);
        return v5;
      }
      v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v9, v11, v13, v15, 0);
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v15);
      if ((v17 & 1) != 0)
      {
        v11 = v7;
        goto LABEL_22;
      }

      ++v3;
      v1 = v7;
      if (v6 == v2)
        goto LABEL_14;
    }
    __break(1u);
LABEL_42:
    if (v1 < 0)
      v46 = v1;
    else
      v46 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
  }
LABEL_14:
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRetain(v1);
  v18 = v66;
  v19 = sub_10000E8AC(v1, v18);
  swift_bridgeObjectRelease(v1);

  v69 = v19;
  v70 = v18;
  v20 = v18;
  swift_bridgeObjectRetain(v19);
  v21 = sub_100007EB0(&qword_10001F030);
  v22 = sub_100007EB0(&qword_10001F038);
  if (!swift_dynamicCast(&v67, &v69, v21, v22, 0))
  {
    v26 = v69;

    swift_bridgeObjectRelease(v26);
    v69 = v19;
    v70 = v20;
    v27 = v20;
    swift_bridgeObjectRetain(v19);
    v28 = sub_100007EB0(&qword_10001F040);
    if (swift_dynamicCast(&v67, &v69, v21, v28, 0))
    {

      swift_bridgeObjectRelease(v19);
      v29 = v67;
      v30 = v68;
      v31 = &selRef_pickerType;
    }
    else
    {
      v32 = v69;

      swift_bridgeObjectRelease(v32);
      v69 = v19;
      v70 = v27;
      v33 = sub_100007EB0(&qword_10001F048);
      if (!swift_dynamicCast(&v67, &v69, v21, v33, 0))
      {
LABEL_76:
        v61 = v69;

        swift_bridgeObjectRelease(v61);
        goto LABEL_77;
      }
      v29 = v67;
      v30 = v68;
      v31 = &selRef_toggleType;
    }
    v5 = sub_10000EA14(v29, v30, (SEL *)v31);
    swift_bridgeObjectRelease(v29);

    v34 = v69;
    swift_bridgeObjectRelease(v34);
    if (v5)
      return v5;
LABEL_77:
    v62 = v20;
    v5 = (id)sub_10000EB58(v1, v62);

    return v5;
  }

  swift_bridgeObjectRelease(v19);
  v23 = v67;
  v24 = v68;
  v5 = sub_10000EA14(v23, v24, (SEL *)&selRef_sliderType);

  if (!v5)
  {
    v35 = objc_opt_self(CAMOverlayServiceSlider);
    v36 = swift_dynamicCastObjCClass(v24, v35);
    if (v36)
    {
      v37 = (void *)v36;
      v38 = v24;
      v39 = sub_1000099BC((uint64_t)objc_msgSend(v37, "sliderType"), (uint64_t)&off_100018B50);

      v64 = v1;
      if ((v39 & 1) != 0)
      {
        if ((unint64_t)v23 >> 62)
          goto LABEL_48;
        v40 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain(v23);
        for (; v40; v40 = _CocoaArrayWrapper.endIndex.getter(v47))
        {
          v41 = 4;
          while (1)
          {
            v42 = (v23 & 0xC000000000000001) != 0
                ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v41 - 4, v23)
                : *(id *)(v23 + 8 * v41);
            v5 = v42;
            v43 = v41 - 3;
            if (__OFADD__(v41 - 4, 1))
              break;
            v44 = objc_opt_self(CAMOverlayServiceSlider);
            v45 = (void *)swift_dynamicCastObjCClass(v5, v44);
            if (v45 && (char *)objc_msgSend(v45, "sliderType") - 5 < (char *)2)
            {

              swift_bridgeObjectRelease_n(v23, 2);
              goto LABEL_17;
            }

            ++v41;
            if (v43 == v40)
              goto LABEL_52;
          }
          __break(1u);
LABEL_48:
          if (v23 < 0)
            v47 = v23;
          else
            v47 = v23 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v23);
        }
LABEL_52:
        swift_bridgeObjectRelease(v23);
        v1 = v64;
      }
      v48 = v38;
      v49 = sub_1000099BC((uint64_t)objc_msgSend(v37, "sliderType"), (uint64_t)&off_100018B80);

      if ((v49 & 1) != 0)
      {
        if ((unint64_t)v23 >> 62)
          goto LABEL_71;
        v50 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain(v23);
        for (; v50; v50 = _CocoaArrayWrapper.endIndex.getter(v60))
        {
          v51 = 4;
          while (1)
          {
            v52 = (v23 & 0xC000000000000001) != 0
                ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v51 - 4, v23)
                : *(id *)(v23 + 8 * v51);
            v53 = v52;
            v54 = v51 - 3;
            if (__OFADD__(v51 - 4, 1))
              break;
            v55 = objc_opt_self(CAMOverlayServiceSlider);
            v56 = swift_dynamicCastObjCClass(v53, v55);
            if (v56)
            {
              v57 = (void *)v56;
              v5 = v53;
              v58 = (char *)objc_msgSend(v57, "sliderType");

              if ((unint64_t)(v58 - 5) < 2 || v58 == (char *)7)
              {
                swift_bridgeObjectRelease_n(v23, 2);

                goto LABEL_17;
              }
            }

            ++v51;
            if (v54 == v50)
              goto LABEL_75;
          }
          __break(1u);
LABEL_71:
          if (v23 < 0)
            v60 = v23;
          else
            v60 = v23 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v23);
        }
LABEL_75:

        swift_bridgeObjectRelease_n(v23, 2);
        v1 = v64;
      }
      else
      {
        swift_bridgeObjectRelease(v23);

      }
    }
    else
    {
      swift_bridgeObjectRelease(v23);

    }
    goto LABEL_76;
  }
  swift_bridgeObjectRelease(v23);

LABEL_17:
  v25 = v69;

  swift_bridgeObjectRelease(v25);
  return v5;
}

void sub_10000BBB0()
{
  uint64_t v0;
  uint64_t v1;
  __CFString *v2;
  __CFString *v3;
  int AppBooleanValue;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  Boolean keyExistsAndHasValidFormat[8];
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  void (*v18)(void *);
  uint64_t v19;

  v1 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer), "invalidate");
  keyExistsAndHasValidFormat[0] = 0;
  v2 = (__CFString *)String._bridgeToObjectiveC()();
  v3 = (__CFString *)String._bridgeToObjectiveC()();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v2, v3, keyExistsAndHasValidFormat);

  if (!keyExistsAndHasValidFormat[0] || AppBooleanValue)
  {
    v5 = swift_allocObject(&unk_100018E08, 24, 7);
    swift_unknownObjectWeakInit(v5 + 16, v0);
    v18 = sub_10001028C;
    v19 = v5;
    *(_QWORD *)keyExistsAndHasValidFormat = _NSConcreteStackBlock;
    v15 = 1107296256;
    v16 = sub_10000A48C;
    v17 = &unk_100018E20;
    v6 = _Block_copy(keyExistsAndHasValidFormat);
    v7 = (void *)objc_opt_self(NSTimer);
    swift_retain(v5);
    v8 = objc_msgSend(v7, "timerWithTimeInterval:repeats:block:", 0, v6, 0.5);
    _Block_release(v6);
    v9 = v19;
    swift_release(v5);
    swift_release(v9);
    v10 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v8;

    v11 = objc_msgSend((id)objc_opt_self(NSRunLoop), "currentRunLoop");
    v12 = *(_QWORD *)(v0 + v1);
    if (v12)
    {
      v13 = v11;
      objc_msgSend(v11, "addTimer:forMode:", v12, NSRunLoopCommonModes);

    }
    else
    {
      __break(1u);
    }
  }
}

void sub_10000BDB0(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  char v12;
  __CFString *v13;
  __CFString *v14;
  int AppBooleanValue;
  BOOL v16;
  uint64_t v17;
  void *v18;
  Boolean keyExistsAndHasValidFormat;
  _BYTE v20[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v20, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (char *)Strong;
    v6 = *(void **)(Strong + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
    if (v6
      && (v7 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer,
          (v8 = *(void **)(Strong + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer)) != 0))
    {
      sub_100007F30(0, &qword_10001F020, NSTimer_ptr);
      v9 = v6;
      v10 = a1;
      v11 = v8;
      v12 = static NSObject.== infix(_:_:)(v10, v11);

      if ((v12 & 1) != 0)
      {
        if (objc_msgSend(v9, "overlayVisible"))
        {
          keyExistsAndHasValidFormat = 0;
          v13 = (__CFString *)String._bridgeToObjectiveC()();
          v14 = (__CFString *)String._bridgeToObjectiveC()();
          AppBooleanValue = CFPreferencesGetAppBooleanValue(v13, v14, &keyExistsAndHasValidFormat);

          if (keyExistsAndHasValidFormat)
            v16 = AppBooleanValue == 0;
          else
            v16 = 0;
          v17 = !v16;
          objc_msgSend(v9, "setQuietUIActive:", v17);
        }
        v18 = *(void **)&v5[v7];
        *(_QWORD *)&v5[v7] = 0;

        v9 = v18;
      }
      else
      {

      }
    }
    else
    {
      v9 = (id)Strong;
    }

  }
}

void sub_10000BF74(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;

  if ((a2 & 1) != 0)
  {
    sub_10000BBB0();
  }
  else
  {
    v5 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer;
    objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer), "invalidate");
    v6 = *(void **)(v2 + v5);
    *(_QWORD *)(v2 + v5) = 0;

    v7 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
    if (v7)
      objc_msgSend(v7, "setQuietUIActive:", 0);
  }
  v8 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(a1, "activeControl");
    if (v10)
    {
      v11 = v10;
      v12 = objc_msgSend(v10, "identifier");

      static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
      v14 = v13;

      v15 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v14);
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v9, "sendOverlayVisibility:activeControlIdentifier:", a2 & 1, v15);

  }
}

void sub_10000C114(void *a1, id a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  _UNKNOWN **v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  _UNKNOWN **v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  _QWORD *v62;
  unint64_t v63;
  id v64;

  v3 = v2;
  v4 = a2;
  v6 = objc_msgSend(a2, "controlIdentifier");
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v9 = v8;

  v10 = objc_msgSend(a1, "controlsByID");
  if (v10)
  {
    v11 = v10;
    v12 = sub_100007F30(0, &qword_10001ECD0, CAMAbstractOverlayServiceControl_ptr);
    v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v11, &type metadata for String, v12, &protocol witness table for String);

    if (*(_QWORD *)(v13 + 16))
    {
      swift_bridgeObjectRetain(v9);
      v14 = sub_10000DB70(v7, v9);
      if ((v15 & 1) != 0)
      {
        v16 = *(void **)(*(_QWORD *)(v13 + 56) + 8 * v14);
        v17 = v16;
      }
      else
      {
        v16 = 0;
      }
      swift_bridgeObjectRelease(v9);
    }
    else
    {
      v16 = 0;
    }
    swift_bridgeObjectRelease(v13);
  }
  else
  {
    v16 = 0;
  }
  v18 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection;
  v19 = *(void **)(v3 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  if (v19)
  {
    v20 = objc_msgSend(v19, "controlsByID");
    v21 = sub_100007F30(0, &qword_10001ECD0, CAMAbstractOverlayServiceControl_ptr);
    v22 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v20, &type metadata for String, v21, &protocol witness table for String);

    if (*(_QWORD *)(v22 + 16))
    {
      v23 = sub_10000DB70(v7, v9);
      if ((v24 & 1) != 0)
      {
        v64 = *(id *)(*(_QWORD *)(v22 + 56) + 8 * v23);
        v25 = v64;
        swift_bridgeObjectRelease(v9);
        swift_bridgeObjectRelease(v22);
        v26 = v64;
        if (!v16)
          goto LABEL_21;
        goto LABEL_18;
      }
    }
    swift_bridgeObjectRelease(v9);
    v27 = v22;
  }
  else
  {
    v27 = v9;
  }
  swift_bridgeObjectRelease(v27);
  v26 = 0;
  v64 = 0;
  if (!v16)
  {
LABEL_21:
    v28 = sub_100010190();
    sub_10000C6BC((uint64_t)v28);

    goto LABEL_44;
  }
LABEL_18:
  if (!v26)
    goto LABEL_21;
  v28 = v16;
  v29 = objc_msgSend(v28, "validateUpdate:", v4);
  if (v29)
  {
    v30 = v29;
    sub_10000C6BC((uint64_t)v29);

    v28 = v30;
LABEL_44:

    return;
  }
  objc_msgSend(*(id *)(v3 + v18), "applyControlUpdate:", v4);
  v31 = *(void **)(v3 + v18);
  if (v31)
  {
    v32 = v31;
    if ((objc_msgSend(v32, "quietUIActive") & 1) == 0
      && !*(_QWORD *)(v3 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer))
    {
      sub_10000BBB0();
    }

  }
  v33 = &_s10Foundation22_convertNSErrorToErrorys0E0_pSo0C0CSgF_ptr;
  v34 = objc_opt_self(CAMOverlayServiceSlider);
  v35 = swift_dynamicCastObjCClass(v28, v34);
  if (!v35
    || (v36 = (void *)v35,
        v28 = v28,
        LOBYTE(v36) = sub_1000099BC((uint64_t)objc_msgSend(v36, "sliderType"), (uint64_t)&off_100018C28),
        v28,
        (v36 & 1) == 0)
    || (v37 = objc_msgSend(a1, "controls")) == 0)
  {

    goto LABEL_44;
  }
  v38 = v37;
  v39 = sub_100007F30(0, &qword_10001ECD0, CAMAbstractOverlayServiceControl_ptr);
  v40 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v38, v39);

  v28 = v28;
  v41 = (uint64_t)sub_10000F6FC(v40, (uint64_t)v28);
  swift_bridgeObjectRelease(v40);

  if ((unint64_t)v41 >> 62)
  {
    if (v41 < 0)
      v56 = v41;
    else
      v56 = v41 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v41);
    v42 = _CocoaArrayWrapper.endIndex.getter(v56);
    if (!v42)
      goto LABEL_50;
  }
  else
  {
    v42 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v41);
    if (!v42)
      goto LABEL_50;
  }
  if (v42 < 1)
  {
    __break(1u);
    goto LABEL_64;
  }
  v43 = 0;
  v63 = v41 & 0xC000000000000001;
  do
  {
    if (v63)
      v44 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v43, v41);
    else
      v44 = *(id *)(v41 + 8 * v43 + 32);
    v45 = v44;
    v46 = objc_opt_self(v33[110]);
    v47 = swift_dynamicCastObjCClass(v45, v46);
    if (v47)
    {
      v48 = v47;
      v49 = v41;
      v50 = v4;
      v51 = a1;
      v52 = v33;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v54 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
      v53 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v54 >= v53 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v53 > 1, v54 + 1, 1);
      v55 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v54, v48);
      specialized Array._endMutation()(v55);
      v33 = v52;
      a1 = v51;
      v4 = v50;
      v41 = v49;
    }
    else
    {

    }
    ++v43;
  }
  while (v42 != v43);
LABEL_50:
  swift_bridgeObjectRelease(v41);
  swift_bridgeObjectRelease(v41);
  if (!((unint64_t)_swiftEmptyArrayStorage >> 62))
  {
    v57 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v57)
      goto LABEL_52;
LABEL_62:

    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    goto LABEL_44;
  }
  if ((uint64_t)_swiftEmptyArrayStorage < 0)
    v62 = _swiftEmptyArrayStorage;
  else
    v62 = (_QWORD *)((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
  v57 = _CocoaArrayWrapper.endIndex.getter(v62);
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  if (!v57)
    goto LABEL_62;
LABEL_52:
  if (v57 >= 1)
  {
    v58 = 0;
    do
    {
      if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001) != 0)
        v59 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v58, _swiftEmptyArrayStorage);
      else
        v59 = (id)_swiftEmptyArrayStorage[v58 + 4];
      v60 = v59;
      ++v58;
      objc_msgSend(v4, "floatValue", v63, v64);
      v61 = objc_msgSend(v60, "updateWithFloatValue:");
      objc_msgSend(a1, "applyControlUpdate:", v61);

    }
    while (v57 != v58);
    goto LABEL_62;
  }
LABEL_64:
  __break(1u);
}

void sub_10000C6BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  if (qword_10001ECB0 != -1)
    swift_once(&qword_10001ECB0, sub_100010520);
  v2 = type metadata accessor for Logger(0);
  sub_1000081E0(v2, (uint64_t)qword_10001F270);
  swift_errorRetain(a1);
  v3 = swift_errorRetain(a1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138543362;
    swift_errorRetain(a1);
    v8 = _swift_stdlib_bridgeErrorToNSError(a1);
    v15 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v6 + 4, v6 + 12);
    *v7 = v8;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "SceneDelegate: Invalid control update from overlay: %{public}@", v6, 0xCu);
    v9 = sub_100007EB0(&qword_10001F018);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  v10 = objc_msgSend((id)objc_opt_self(CAMCaptureCapabilities), "capabilities");
  if (!v10)
  {
    __break(1u);
    goto LABEL_10;
  }
  v11 = v10;
  v12 = objc_msgSend(v10, "isInternalInstall");

  if (v12)
  {
LABEL_10:
    v15 = 0;
    v16 = 0xE000000000000000;
    v14 = a1;
    v13 = sub_100007EB0(&qword_10001F010);
    _print_unlocked<A, B>(_:_:)(&v14, &v15, v13, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v15, v16, "CameraOverlayAngel/OverlaySceneDelegate.swift", 45, 2, 289, 0);
    __break(1u);
  }
}

void sub_10000CA28(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  char v12;
  void *v13;
  _BYTE v14[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v14, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (char *)Strong;
    v6 = *(void **)(Strong + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
    if (v6
      && (v7 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer,
          (v8 = *(void **)(Strong + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer)) != 0))
    {
      sub_100007F30(0, &qword_10001F020, NSTimer_ptr);
      v9 = v6;
      v10 = a1;
      v11 = v8;
      v12 = static NSObject.== infix(_:_:)(v10, v11);

      if ((v12 & 1) != 0)
      {
        objc_msgSend(v9, "setQuietUIActive:", 0);
        v13 = *(void **)&v5[v7];
        *(_QWORD *)&v5[v7] = 0;

        v9 = v13;
      }
      else
      {

      }
    }
    else
    {
      v9 = (id)Strong;
    }

  }
}

void sub_10000CC0C(uint64_t a1, int a2)
{
  void *v2;
  void *v4;
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  if (v2)
  {
    v4 = *(void **)(a1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController);
    if (v4)
    {
      v6 = v2;
      v15 = v4;
      v7 = objc_msgSend(v15, "overlayView");
      v8 = objc_msgSend(v7, "isSliderVisible");

      if (v8)
      {
        v9 = objc_msgSend(v6, "auditToken");
        v10 = objc_msgSend(v9, "pid");

        if (v10 == a2)
        {
          objc_msgSend(v15, "dismissOverlayForced:", 0);
          v11 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer;
          objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer), "invalidate");
          v12 = *(void **)(a1 + v11);
          *(_QWORD *)(a1 + v11) = 0;

          v13 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer;
          objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer), "invalidate");
          v14 = *(void **)(a1 + v13);
          *(_QWORD *)(a1 + v13) = 0;

          objc_msgSend(v6, "setQuietUIActive:", 0);
        }
      }

    }
  }
}

uint64_t sub_10000CD68(uint64_t a1)
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

id sub_10000CDD4()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  uint64_t v4;
  objc_super v6;

  *(_QWORD *)&v0[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController] = 0;
  v1 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientMonitor;
  v2 = objc_allocWithZone((Class)CAMOverlayClientMonitor);
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, "init");
  *(_QWORD *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_figCameraViewfinder] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection] = 0;
  v4 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_lastUsedControl;
  *(_QWORD *)&v3[v4] = sub_100007CE0();
  *(_QWORD *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_defaultSliderType] = 5;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer] = 0;

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for OverlaySceneDelegate();
  return objc_msgSendSuper2(&v6, "init");
}

id sub_10000CEF0(uint64_t a1)
{
  return sub_10000CEFC(a1, type metadata accessor for OverlaySceneDelegate);
}

id sub_10000CEFC(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for OverlaySceneDelegate()
{
  return objc_opt_self(_TtC18CameraOverlayAngel20OverlaySceneDelegate);
}

void sub_10000D158(void *a1, const char *a2, char a3, const char *a4)
{
  uint64_t v4;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  if (a1)
  {
    v8 = v4;
    objc_msgSend(a1, "clientAuditToken");
    v23 = v26;
    v24 = v25;
    v9 = objc_allocWithZone((Class)BSAuditToken);
    v25 = v24;
    v26 = v23;
    v10 = objc_msgSend(v9, "initWithAuditToken:", &v25);
    v11 = *(void **)(v8 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken);
    if (v11)
    {
      v12 = v11;
      if (-[NSObject hasSameProcessAsAuditToken:](v12, "hasSameProcessAsAuditToken:", v10))
      {
        if (qword_10001ECB0 != -1)
          swift_once(&qword_10001ECB0, sub_100010520);
        v13 = type metadata accessor for Logger(0);
        sub_1000081E0(v13, (uint64_t)qword_10001F270);
        v14 = v10;
        v15 = Logger.logObject.getter(v14);
        v16 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v15, v16))
        {
          v17 = (uint8_t *)swift_slowAlloc(8, -1);
          *(_DWORD *)v17 = 67240192;
          LODWORD(v25) = -[NSObject pid](v14, "pid");
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, (char *)&v25 + 4, v17 + 4, v17 + 8);

          _os_log_impl((void *)&_mh_execute_header, v15, v16, a2, v17, 8u);
          swift_slowDealloc(v17, -1, -1);
        }
        else
        {

          v15 = v14;
        }

        v21 = *(void **)(v8 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController);
        if (v21)
        {
          v22 = v21;
          objc_msgSend(v22, "updateUIForCapturingMovieRecording:", a3 & 1);

        }
LABEL_17:

        return;
      }

    }
    if (qword_10001ECB0 != -1)
      swift_once(&qword_10001ECB0, sub_100010520);
    v18 = type metadata accessor for Logger(0);
    sub_1000081E0(v18, (uint64_t)qword_10001F270);
    v12 = v10;
    v14 = Logger.logObject.getter(v12);
    v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v20 = 67240192;
      LODWORD(v25) = -[NSObject pid](v12, "pid");
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, (char *)&v25 + 4, v20 + 4, v20 + 8);

      _os_log_impl((void *)&_mh_execute_header, v14, v19, a4, v20, 8u);
      swift_slowDealloc(v20, -1, -1);
    }
    else
    {

      v14 = v12;
    }
    goto LABEL_17;
  }
  __break(1u);
}

uint64_t sub_10000D4D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13[3];
  void *ObjectType;

  v6 = sub_10000D5A0(v13, 0, 0, 1, a1, a2);
  v8 = v13[0];
  if (v6)
  {
    v9 = v6;
    ObjectType = (void *)swift_getObjectType(v6, v7);
    v13[0] = v9;
    v10 = *a3;
    if (*a3)
    {
      sub_100010328((uint64_t)v13, *a3);
      *a3 = v10 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    v11 = *a3;
    if (*a3)
    {
      sub_100010328((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100010308(v13);
  return v8;
}

uint64_t sub_10000D5A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000D758(a5, a6);
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

uint64_t sub_10000D758(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000D7EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_10000D9C4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000D9C4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000D7EC(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000D960(v4, 0);
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
        return _swiftEmptyArrayStorage;
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
    return _swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_10000D960(uint64_t a1, uint64_t a2)
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
    return _swiftEmptyArrayStorage;
  v4 = sub_100007EB0(&qword_10001F080);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000D9C4(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100007EB0(&qword_10001F080);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
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

unint64_t sub_10000DB10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10000DBD4(a1, v4);
}

unint64_t sub_10000DB40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10000DCEC(a1, v4);
}

unint64_t sub_10000DB70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000DDB0(a1, a2, v5);
}

unint64_t sub_10000DBD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_100007F30(0, (unint64_t *)&qword_10001F050, NSNumber_ptr);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = static NSObject.== infix(_:_:)();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_10000DCEC(uint64_t a1, uint64_t a2)
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
      sub_10001048C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_1000104C8((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10000DDB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000DE90(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_10000DEC8(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_10000DEAC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10000E050(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10000DEC8(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100007EB0(&qword_10001ED00);
    v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 4);
  }
  else
  {
    v11 = _swiftEmptyArrayStorage;
  }
  v14 = (unint64_t)(v11 + 4);
  v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 16 * v8)
      memmove(v11 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v15 >= v14 + 16 * v8 || v14 >= v15 + 16 * v8)
  {
    v18 = sub_100007EB0((uint64_t *)&unk_10001F0D0);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v18);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000E050(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
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
        goto LABEL_32;
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
    v10 = sub_100007EB0(&qword_10001F088);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000E1B8(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 >= 0)
      a1 &= 0xFFFFFFFFFFFFFF8uLL;
    return __CocoaDictionary.startIndex.getter(a1);
  }
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v1 = 1 << v5;
  if (v6 < 7)
    return v1;
  v2 = *(_QWORD *)(a1 + 72);
  if (v2)
  {
    v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  v7 = (unint64_t)(v1 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v3 = 64;
  while (v8)
  {
    v10 = *v9++;
    v2 = v10;
    --v8;
    v3 += 64;
    if (v10)
      return __clz(__rbit64(v2)) + v3;
  }
  return v1;
}

void sub_10000E278(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(_BYTE *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
      {
        _HashTable.occupiedBucket(after:)(a1);
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (__CocoaDictionary.Index.age.getter(a1, a2) != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v6 = __CocoaDictionary.Index.key.getter(a1, a2);
  v13 = v6;
  sub_1000102FC(a1, a2, 1);
  v7 = sub_100007F30(0, (unint64_t *)&qword_10001F050, NSNumber_ptr);
  swift_unknownObjectRetain(v6, v8);
  swift_dynamicCast(&v14, &v13, (char *)&type metadata for Swift.AnyObject + 8, v7, 7);
  v9 = v14;
  swift_unknownObjectRelease(v6);
  sub_10000DB10((uint64_t)v9);
  v11 = v10;

  if ((v11 & 1) != 0)
  {
    v12 = __CocoaDictionary.Index.dictionary.getter(a1, a2);
    __CocoaDictionary.index(after:)(a1, a2, v12);
    sub_1000102AC(a1, a2, 1);
    swift_unknownObjectRelease(v12);
    return;
  }
LABEL_14:
  __break(1u);
}

void sub_10000E414(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  char v16;
  id v17;
  uint64_t v18;
  void *v19;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
      {
LABEL_15:
        v17 = *(id *)(*(_QWORD *)(a4 + 56) + 8 * v6);
        return;
      }
      __break(1u);
LABEL_13:
      if (__CocoaDictionary.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        v11 = __CocoaDictionary.Index.key.getter(v6, a2);
        v18 = v11;
        v12 = sub_100007F30(0, (unint64_t *)&qword_10001F050, NSNumber_ptr);
        swift_unknownObjectRetain(v11, v13);
        swift_dynamicCast(&v19, &v18, (char *)&type metadata for Swift.AnyObject + 8, v12, 7);
        v14 = v19;
        swift_unknownObjectRelease(v11);
        v6 = sub_10000DB10((uint64_t)v14);
        v16 = v15;

        if ((v16 & 1) != 0)
          goto LABEL_15;
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    __break(1u);
    goto LABEL_18;
  }
  if ((a3 & 1) == 0)
  {
LABEL_20:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  v8 = __CocoaDictionary.value(at:)(a1, a2, v7);
  v18 = v8;
  v9 = sub_100007F30(0, &qword_10001F058, &off_100018358);
  swift_unknownObjectRetain(v8, v10);
  swift_dynamicCast(&v19, &v18, (char *)&type metadata for Swift.AnyObject + 8, v9, 7);
  swift_unknownObjectRelease(v8);
}

void sub_10000E5D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  unsigned __int8 v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v28;
  void *v29;

  v2 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 >= 0)
      a1 &= 0xFFFFFFFFFFFFFF8uLL;
    v26 = 0;
    v3 = 0;
    v4 = 0;
    v5 = __CocoaDictionary.makeIterator()(a1) | 0x8000000000000000;
  }
  else
  {
    v6 = -1 << *(_BYTE *)(a1 + 32);
    v3 = ~v6;
    v26 = a1 + 64;
    v7 = -v6;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v4 = v8 & *(_QWORD *)(a1 + 64);
    v5 = a1;
  }
  v9 = swift_bridgeObjectRetain(v2);
  v10 = 0;
  v25 = (unint64_t)(v3 + 64) >> 6;
  while ((v5 & 0x8000000000000000) != 0)
  {
    v14 = __CocoaDictionary.Iterator.next()(v9);
    if (!v14)
      goto LABEL_36;
    v16 = v15;
    swift_unknownObjectRelease(v14);
    v28 = v16;
    v17 = sub_100007F30(0, &qword_10001F058, &off_100018358);
    swift_unknownObjectRetain(v16, v18);
    swift_dynamicCast(&v29, &v28, (char *)&type metadata for Swift.AnyObject + 8, v17, 7);
    v19 = v29;
    swift_unknownObjectRelease(v16);
    v13 = v10;
    v11 = v4;
    if (!v19)
      goto LABEL_36;
LABEL_34:
    if (objc_msgSend(v19, "status") == (id)1)
    {
      v23 = objc_msgSend(v19, "auditToken");
      v24 = objc_msgSend(v23, "hasSameProcessAsAuditToken:", a2);

      if ((v24 & 1) != 0)
        goto LABEL_36;
    }

    v10 = v13;
    v4 = v11;
  }
  if (v4)
  {
    v11 = (v4 - 1) & v4;
    v12 = __clz(__rbit64(v4)) | (v10 << 6);
    v13 = v10;
LABEL_33:
    v19 = *(id *)(*(_QWORD *)(v5 + 56) + 8 * v12);
    if (!v19)
      goto LABEL_36;
    goto LABEL_34;
  }
  v20 = v10 + 1;
  if (!__OFADD__(v10, 1))
  {
    if (v20 >= v25)
      goto LABEL_36;
    v21 = *(_QWORD *)(v26 + 8 * v20);
    v13 = v10 + 1;
    if (!v21)
    {
      v13 = v10 + 2;
      if (v10 + 2 >= v25)
        goto LABEL_36;
      v21 = *(_QWORD *)(v26 + 8 * v13);
      if (!v21)
      {
        v13 = v10 + 3;
        if (v10 + 3 >= v25)
          goto LABEL_36;
        v21 = *(_QWORD *)(v26 + 8 * v13);
        if (!v21)
        {
          v13 = v10 + 4;
          if (v10 + 4 >= v25)
            goto LABEL_36;
          v21 = *(_QWORD *)(v26 + 8 * v13);
          if (!v21)
          {
            v13 = v10 + 5;
            if (v10 + 5 >= v25)
              goto LABEL_36;
            v21 = *(_QWORD *)(v26 + 8 * v13);
            if (!v21)
            {
              v22 = v10 + 6;
              while (v25 != v22)
              {
                v21 = *(_QWORD *)(v26 + 8 * v22++);
                if (v21)
                {
                  v13 = v22 - 1;
                  goto LABEL_32;
                }
              }
LABEL_36:
              sub_100010364(v5);
              return;
            }
          }
        }
      }
    }
LABEL_32:
    v11 = (v21 - 1) & v21;
    v12 = __clz(__rbit64(v21)) + (v13 << 6);
    goto LABEL_33;
  }
  __break(1u);
}

_QWORD *sub_10000E8AC(uint64_t a1, void *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  if ((unint64_t)a1 >> 62)
    goto LABEL_16;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      v4 = 0;
      v5 = a1 & 0xFFFFFFFFFFFFFF8;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
LABEL_9:
        v7 = v6;
        v8 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_15;
        v9 = objc_msgSend(v6, "controlType");
        if (v9 == objc_msgSend(a2, "controlType"))
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          v10 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v10);
          v5 = a1 & 0xFFFFFFFFFFFFFF8;
          v11 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v10, v7);
          specialized ContiguousArray._endMutation()(v11);
        }
        else
        {

        }
        ++v4;
        if (v8 == v3)
          return _swiftEmptyArrayStorage;
      }
      if (v4 < *(_QWORD *)(v5 + 16))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      if (a1 < 0)
        v13 = a1;
      else
        v13 = a1 & 0xFFFFFFFFFFFFFF8;
      v3 = _CocoaArrayWrapper.endIndex.getter(v13);
      if (!v3)
        return _swiftEmptyArrayStorage;
    }
    v6 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

void *sub_10000EA14(uint64_t a1, void *a2, SEL *a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  if ((unint64_t)a1 >> 62)
    goto LABEL_14;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v6; v6 = _CocoaArrayWrapper.endIndex.getter(v12))
  {
    v7 = 4;
    while (1)
    {
      v8 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, a1)
         : *(id *)(a1 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v11 = objc_msgSend(v8, *a3);
      if (v11 == objc_msgSend(a2, *a3) && objc_msgSend(v9, *a3))
      {
        swift_bridgeObjectRelease(a1);
        return v9;
      }

      ++v7;
      if (v10 == v6)
        goto LABEL_18;
    }
    __break(1u);
LABEL_14:
    if (a1 < 0)
      v12 = a1;
    else
      v12 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
LABEL_18:
  swift_bridgeObjectRelease(a1);
  return 0;
}

uint64_t sub_10000EB58(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  void *v21;

  if ((unint64_t)a1 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v3)
  {
    for (i = 4; ; ++i)
    {
      v5 = i - 4;
      if ((a1 & 0xC000000000000001) == 0)
        break;
      v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, a1);
      v7 = i - 3;
      if (__OFADD__(v5, 1))
        goto LABEL_19;
LABEL_9:
      v21 = v6;
      v8 = objc_msgSend(v6, "title");
      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v11 = v10;

      v12 = objc_msgSend(a2, "title");
      v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v15 = v14;

      if (v9 == v13 && v11 == v15)
      {
        swift_bridgeObjectRelease(a1);
        swift_bridgeObjectRelease(v11);
LABEL_18:
        v3 = (uint64_t)v21;
        swift_bridgeObjectRelease(v11);
        return v3;
      }
      v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v9, v11, v13, v15, 0);
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v15);
      if ((v17 & 1) != 0)
      {
        v11 = a1;
        goto LABEL_18;
      }

      if (v7 == v3)
      {
        swift_bridgeObjectRelease(a1);
        return 0;
      }
    }
    v6 = *(id *)(a1 + 8 * i);
    v7 = i - 3;
    if (!__OFADD__(v5, 1))
      goto LABEL_9;
LABEL_19:
    __break(1u);
LABEL_20:
    if (a1 < 0)
      v18 = a1;
    else
      v18 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v18);
  }
  swift_bridgeObjectRelease(a1);
  return v3;
}

void *sub_10000ED18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if ((unint64_t)a1 >> 62)
    goto LABEL_14;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v4; v4 = _CocoaArrayWrapper.endIndex.getter(v12))
  {
    v5 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_defaultSliderType;
    v6 = 4;
    while (1)
    {
      v7 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6 - 4, a1)
         : *(id *)(a1 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v10 = objc_opt_self(CAMOverlayServiceSlider);
      v11 = (void *)swift_dynamicCastObjCClass(v8, v10);
      if (v11 && objc_msgSend(v11, "sliderType") == *(id *)(a2 + v5))
      {
        swift_bridgeObjectRelease(a1);
        return v8;
      }

      ++v6;
      if (v9 == v4)
        goto LABEL_18;
    }
    __break(1u);
LABEL_14:
    if (a1 < 0)
      v12 = a1;
    else
      v12 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
LABEL_18:
  swift_bridgeObjectRelease(a1);
  return 0;
}

void sub_10000EE60(char **a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char **v8;
  uint64_t v9;
  char **v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  char **v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSString v20;
  unsigned int v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  Swift::String v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t v51;

  v2 = v1;
  v4 = objc_opt_self(UIWindowScene);
  v5 = swift_dynamicCastObjCClass(a1, v4);
  if (!v5)
    goto LABEL_21;
  v6 = v5;
  v7 = qword_10001ECB0;
  v8 = a1;
  if (v7 != -1)
    swift_once(&qword_10001ECB0, sub_100010520);
  v9 = type metadata accessor for Logger(0);
  sub_1000081E0(v9, (uint64_t)qword_10001F270);
  v10 = v8;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v49 = (unint64_t *)swift_slowAlloc(8, -1);
    v50 = v6;
    *(_DWORD *)v13 = 138543362;
    v14 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51, v13 + 4, v13 + 12);
    *v49 = v6;

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "SceneDelegate: Connecting new scene %{public}@", v13, 0xCu);
    v15 = sub_100007EB0(&qword_10001F018);
    swift_arrayDestroy(v49, 1, v15);
    swift_slowDealloc(v49, -1, -1);
    swift_slowDealloc(v13, -1, -1);

  }
  else
  {

  }
  v16 = objc_msgSend(objc_allocWithZone((Class)CAMSystemOverlayViewController), "init");
  objc_msgSend(v16, "setDelegate:", v2);
  v17 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController) = v16;
  v18 = v16;

  if (qword_10001ECA0 != -1)
    swift_once(&qword_10001ECA0, sub_100007C0C);
  v19 = (void *)qword_10001F260;
  if (!qword_10001F260)
    goto LABEL_16;
  v20 = String._bridgeToObjectiveC()();
  v21 = objc_msgSend(v19, "BOOLForKey:", v20);

  if (!v21)
    goto LABEL_16;
  v22 = objc_msgSend(objc_allocWithZone((Class)CAMOverlayDebugViewController), "init");
  objc_msgSend(v18, "addChildViewController:", v22);
  a1 = &selRef_setInvalidationHandler_;
  v23 = objc_msgSend(v18, "view");
  if (!v23)
  {
    __break(1u);
    goto LABEL_18;
  }
  v24 = v23;
  v25 = objc_msgSend(v22, "view");
  if (!v25)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v26 = v25;
  objc_msgSend(v24, "addSubview:", v25);

  v27 = objc_msgSend(v22, "view");
  if (v27)
  {
    v28 = v27;
    v29 = objc_msgSend(v18, "view");
    if (v29)
    {
      v30 = v29;
      objc_msgSend(v29, "bounds");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;

      objc_msgSend(v28, "setFrame:", v32, v34, v36, v38);
      objc_msgSend(v22, "didMoveToParentViewController:", v18);

LABEL_16:
      v39 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for OverlayWindow()), "initWithWindowScene:", v6);
      objc_msgSend(v39, "setRootViewController:", v18);
      v40 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window);
      *(_QWORD *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window) = v39;
      v41 = v39;

      objc_msgSend(v41, "makeKeyAndVisible");
      v42 = objc_msgSend((id)objc_opt_self(CAMOverlayServer), "sharedInstance");
      objc_msgSend(v42, "addObserver:", v2);

      objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientMonitor), "beginMonitoringScene:delegate:", v6, v2);
      sub_10000AA6C();
      sub_10000A0DC();
      v43 = objc_msgSend((id)objc_opt_self(BKSTouchDeliveryObservationService), "sharedInstance");
      objc_msgSend(v43, "addObserver:", v2);

      return;
    }
    goto LABEL_20;
  }
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  v50 = 0;
  v51 = 0xE000000000000000;
  _StringGuts.grow(_:)(43);
  swift_bridgeObjectRelease(v51);
  v50 = 0xD000000000000029;
  v51 = 0x8000000100015FC0;
  v44 = objc_msgSend(a1, "description");
  v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v47 = v46;

  v48._countAndFlagsBits = v45;
  v48._object = v47;
  String.append(_:)(v48);
  swift_bridgeObjectRelease(v47);
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v50, v51, "CameraOverlayAngel/OverlaySceneDelegate.swift", 45, 2, 40, 0);
  __break(1u);
}

void sub_10000F3E0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  unint64_t v22;
  Class isa;
  void *v24;
  id v25;
  unsigned int v26;
  uint64_t v27;

  v2 = v1;
  if (a1)
  {
    v4 = qword_10001ECB0;
    v5 = a1;
    if (v4 != -1)
      swift_once(&qword_10001ECB0, sub_100010520);
    v6 = type metadata accessor for Logger(0);
    sub_1000081E0(v6, (uint64_t)qword_10001F270);
    v7 = v5;
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v10 = 67240192;
      v26 = objc_msgSend(v7, "pid");
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v10 + 4, v10 + 8);

      _os_log_impl((void *)&_mh_execute_header, v8, v9, "SceneDelegate: Client monitor PID: %{public}d", v10, 8u);
      swift_slowDealloc(v10, -1, -1);

    }
    else
    {

    }
    v18 = objc_msgSend(objc_allocWithZone((Class)FigCameraViewfinder), "init");
    v19 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_figCameraViewfinder);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_figCameraViewfinder) = v18;
    v20 = v18;

    sub_100007F30(0, &qword_10001F090, OS_dispatch_queue_ptr);
    v21 = (void *)static OS_dispatch_queue.main.getter();
    objc_msgSend(v20, "setDelegate:queue:", v2, v21);

    v22 = sub_100009B28((uint64_t)_swiftEmptyArrayStorage);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v22);
    objc_msgSend(v20, "startWithOptions:", isa);

  }
  else
  {
    if (qword_10001ECB0 != -1)
      swift_once(&qword_10001ECB0, sub_100010520);
    v11 = type metadata accessor for Logger(0);
    v12 = sub_1000081E0(v11, (uint64_t)qword_10001F270);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "SceneDelegate: Client monitor reported no button client", v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }

    v16 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_figCameraViewfinder;
    objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_figCameraViewfinder), "stop");
    v17 = *(void **)(v2 + v16);
    *(_QWORD *)(v2 + v16) = 0;

    v7 = 0;
  }
  v24 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken) = a1;
  v25 = v7;

  sub_10000AA6C();
  sub_10000A0DC();
}

_QWORD *sub_10000F6FC(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v23;

  v2 = a1;
  v23 = _swiftEmptyArrayStorage;
  if (a1 >> 62)
    goto LABEL_25;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      v21 = v2;
      v4 = 0;
      v5 = v2 & 0xC000000000000001;
      v6 = v2 & 0xFFFFFFFFFFFFFF8;
      v7 = v2 + 32;
      while (1)
      {
        if (v5)
        {
          v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v21);
        }
        else
        {
          if (v4 >= *(_QWORD *)(v6 + 16))
            goto LABEL_23;
          v8 = *(id *)(v7 + 8 * v4);
        }
        v2 = (uint64_t)v8;
        if (__OFADD__(v4++, 1))
          goto LABEL_24;
        v10 = objc_opt_self(CAMOverlayServiceSlider);
        v11 = swift_dynamicCastObjCClass(v2, v10);
        if (v11)
          break;

LABEL_5:
        if (v4 == v3)
          return v23;
      }
      v12 = (void *)v11;
      v13 = (id)v2;
      v14 = objc_msgSend(v12, "sliderType");
      if (v14 == (id)5)
        break;
      v17 = 5;
      while (1)
      {
        v18 = v17 - 3;
        if (__OFADD__(v17 - 4, 1))
          break;
        if (*(&off_100018BF0 + v17) == v14)
          goto LABEL_12;
        ++v17;
        if (v18 == 3)
        {

          goto LABEL_19;
        }
      }
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      if (v2 < 0)
        v20 = v2;
      else
        v20 = v2 & 0xFFFFFFFFFFFFFF8;
      v3 = _CocoaArrayWrapper.endIndex.getter(v20);
      if (!v3)
        return _swiftEmptyArrayStorage;
    }
LABEL_12:

    v2 = sub_100007F30(0, &qword_10001ECD0, CAMAbstractOverlayServiceControl_ptr);
    if ((static NSObject.== infix(_:_:)(v13, a2) & 1) != 0)
    {
LABEL_19:

    }
    else
    {
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v15 = v23[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v15);
      v16 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v15, v13);
      v2 = (uint64_t)&v23;
      specialized ContiguousArray._endMutation()(v16);
    }
    goto LABEL_5;
  }
  return _swiftEmptyArrayStorage;
}

void sub_10000F8F8()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  if (v1)
  {
    v2 = v1;
    if ((objc_msgSend(v2, "quietUIActive") & 1) == 0
      && !*(_QWORD *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer))
    {
      sub_10000BBB0();
    }

  }
}

void sub_10000F95C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  id v13;

  v2 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_lastUsedControl;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_lastUsedControl);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_lastUsedControl) = a1;
  v4 = a1;

  v5 = *(void **)(v1 + v2);
  v6 = v5;
  sub_100007FAC(v5);
  v7 = *(void **)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v4, "identifier");
    if (!v9)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(0);
      v11 = v10;
      v12 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v11);
      v9 = v12;
    }
    v13 = v9;
    objc_msgSend(v8, "sendActiveControlIdentifier:");

  }
}

void sub_10000FA34()
{
  uint64_t v0;
  __CFString *v1;
  __CFString *v2;
  int AppBooleanValue;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  Boolean keyExistsAndHasValidFormat[8];
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  void (*v22)(void *);
  uint64_t v23;

  keyExistsAndHasValidFormat[0] = 0;
  v1 = (__CFString *)String._bridgeToObjectiveC()();
  v2 = (__CFString *)String._bridgeToObjectiveC()();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v1, v2, keyExistsAndHasValidFormat);

  if (!keyExistsAndHasValidFormat[0] || AppBooleanValue)
  {
    v4 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer;
    objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer), "invalidate");
    v5 = *(void **)(v0 + v4);
    *(_QWORD *)(v0 + v4) = 0;

    v6 = *(void **)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
    if (v6)
    {
      v7 = v6;
      if (objc_msgSend(v7, "quietUIActive"))
      {
        v8 = swift_allocObject(&unk_100018E08, 24, 7);
        swift_unknownObjectWeakInit(v8 + 16, v0);
        v22 = sub_10001042C;
        v23 = v8;
        *(_QWORD *)keyExistsAndHasValidFormat = _NSConcreteStackBlock;
        v19 = 1107296256;
        v20 = sub_10000A48C;
        v21 = &unk_100018EE8;
        v9 = _Block_copy(keyExistsAndHasValidFormat);
        v10 = (void *)objc_opt_self(NSTimer);
        swift_retain(v8);
        v11 = objc_msgSend(v10, "timerWithTimeInterval:repeats:block:", 0, v9, 1.0);
        _Block_release(v9);
        v12 = v23;
        swift_release(v8);
        swift_release(v12);
        v13 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer;
        v14 = *(void **)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer);
        *(_QWORD *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer) = v11;

        v15 = objc_msgSend((id)objc_opt_self(NSRunLoop), "currentRunLoop");
        v16 = *(_QWORD *)(v0 + v13);
        if (!v16)
        {
          __break(1u);
          return;
        }
        v17 = v15;
        objc_msgSend(v15, "addTimer:forMode:", v16, NSRunLoopCommonModes);

        v7 = v17;
      }

    }
  }
}

uint64_t sub_10000FC78(int a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[5];
  uint64_t v24;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v22 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007F30(0, &qword_10001F090, OS_dispatch_queue_ptr);
  v11 = (void *)static OS_dispatch_queue.main.getter();
  v12 = swift_allocObject(&unk_100018EA8, 28, 7);
  *(_QWORD *)(v12 + 16) = v1;
  *(_DWORD *)(v12 + 24) = a1;
  aBlock[4] = sub_100010398;
  v24 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000CD68;
  aBlock[3] = &unk_100018EC0;
  v13 = _Block_copy(aBlock);
  v14 = v24;
  v15 = v2;
  v16 = swift_release(v14);
  static DispatchQoS.unspecified.getter(v16);
  aBlock[0] = _swiftEmptyArrayStorage;
  v17 = sub_1000103A4();
  v18 = sub_100007EB0(&qword_10001F0A0);
  v19 = sub_1000103EC(&qword_10001F0A8, &qword_10001F0A0, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v18, v19, v4, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_10000FE78(void *a1, const char *a2, const char *a3)
{
  uint64_t v3;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  if (a1)
  {
    v6 = v3;
    objc_msgSend(a1, "clientAuditToken");
    v21 = v24;
    v22 = v23;
    v7 = objc_allocWithZone((Class)BSAuditToken);
    v23 = v22;
    v24 = v21;
    v8 = objc_msgSend(v7, "initWithAuditToken:", &v23);
    v9 = *(void **)(v6 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken);
    if (v9)
    {
      v10 = v9;
      if (-[NSObject hasSameProcessAsAuditToken:](v10, "hasSameProcessAsAuditToken:", v8))
      {
        if (qword_10001ECB0 != -1)
          swift_once(&qword_10001ECB0, sub_100010520);
        v11 = type metadata accessor for Logger(0);
        sub_1000081E0(v11, (uint64_t)qword_10001F270);
        v12 = v8;
        v13 = Logger.logObject.getter(v12);
        v14 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v13, v14))
        {
          v15 = (uint8_t *)swift_slowAlloc(8, -1);
          *(_DWORD *)v15 = 67240192;
          LODWORD(v23) = -[NSObject pid](v12, "pid");
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, (char *)&v23 + 4, v15 + 4, v15 + 8);

          _os_log_impl((void *)&_mh_execute_header, v13, v14, a2, v15, 8u);
          swift_slowDealloc(v15, -1, -1);
        }
        else
        {

          v13 = v12;
        }

        v19 = *(void **)(v6 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController);
        if (v19)
        {
          v20 = objc_msgSend(v19, "overlayView");
          objc_msgSend(v20, "setSliderFeedbackDisabled:", 0);

        }
LABEL_17:

        return;
      }

    }
    if (qword_10001ECB0 != -1)
      swift_once(&qword_10001ECB0, sub_100010520);
    v16 = type metadata accessor for Logger(0);
    sub_1000081E0(v16, (uint64_t)qword_10001F270);
    v10 = v8;
    v12 = Logger.logObject.getter(v10);
    v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v18 = 67240192;
      LODWORD(v23) = -[NSObject pid](v10, "pid");
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, (char *)&v23 + 4, v18 + 4, v18 + 8);

      _os_log_impl((void *)&_mh_execute_header, v12, v17, a3, v18, 8u);
      swift_slowDealloc(v18, -1, -1);
    }
    else
    {

      v12 = v10;
    }
    goto LABEL_17;
  }
  __break(1u);
}

id sub_100010190()
{
  uint64_t v0;
  __CFString *v1;
  __CFString *v2;
  void *v3;
  void *v4;
  NSErrorUserInfoKey v6;
  const __CFString *v7;

  v0 = CAMOverlayErrorDomain;
  v6 = NSDebugDescriptionErrorKey;
  v1 = CFSTR("InvalidIdentifier");
  v2 = CFSTR("InvalidIdentifier");
  v7 = CFSTR("InvalidIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v0, -100, v3));

  return v4;
}

uint64_t sub_100010268()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10001028C(void *a1)
{
  uint64_t v1;

  sub_10000BDB0(a1, v1);
}

uint64_t sub_100010294(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000102A4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000102AC(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t sub_1000102B8(uint64_t *a1)
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

uint64_t sub_1000102FC(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain(result);
  return result;
}

uint64_t sub_100010308(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100010328(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100010364(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

void sub_10001036C(void *a1)
{
  uint64_t v1;

  sub_10000A434(a1, v1);
}

uint64_t sub_100010374()
{
  uint64_t v0;

  return swift_deallocObject(v0, 28, 7);
}

void sub_100010398()
{
  uint64_t v0;

  sub_10000CC0C(*(_QWORD *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

unint64_t sub_1000103A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001F098;
  if (!qword_10001F098)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10001F098);
  }
  return result;
}

uint64_t sub_1000103EC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000102B8(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_10001042C(void *a1)
{
  uint64_t v1;

  sub_10000CA28(a1, v1);
}

uint64_t sub_100010434(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007EB0(&qword_10001F0B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10001047C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001048C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1000104C8(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100010520()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100010590(v0, qword_10001F270);
  sub_1000081E0(v0, (uint64_t)qword_10001F270);
  return Logger.init(subsystem:category:)(0xD000000000000018, 0x8000000100016010, 0x6C65676E41, 0xE500000000000000);
}

uint64_t *sub_100010590(uint64_t a1, uint64_t *a2)
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

void sub_1000105D0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_loggingHeader"));
  sub_100007B04();
  sub_100007AF0((void *)&_mh_execute_header, v2, v3, "%{public}@: Attempted to send invalid active control ID %{public}@", v4, v5, v6, v7, v8);

  sub_100007B1C();
}

void sub_100010650(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "_loggingHeader"));
  sub_100007B04();
  sub_100007AF0((void *)&_mh_execute_header, v2, v3, "%{public}@: %{public}@", v4, v5, v6, v7, v8);

  sub_100007B1C();
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_FBSScene");
}

id objc_msgSend__clientProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientProxy");
}

id objc_msgSend__connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connection");
}

id objc_msgSend__connectionQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectionQueue");
}

id objc_msgSend__connectionsByProcessID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectionsByProcessID");
}

id objc_msgSend__debugID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_debugID");
}

id objc_msgSend__enumerateObserversWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateObserversWithBlock:");
}

id objc_msgSend__handleConnectionDidActivate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConnectionDidActivate:");
}

id objc_msgSend__handleConnectionDidInterrupt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConnectionDidInterrupt:");
}

id objc_msgSend__handleConnectionDidInvalidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConnectionDidInvalidate:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_init");
}

id objc_msgSend__listener(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_listener");
}

id objc_msgSend__loggingHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loggingHeader");
}

id objc_msgSend__registeredObservers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registeredObservers");
}

id objc_msgSend__setClientProxy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setClientProxy:");
}

id objc_msgSend__setControls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setControls:");
}

id objc_msgSend__setControlsByID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setControlsByID:");
}

id objc_msgSend__setStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setStatus:");
}

id objc_msgSend__setUpdatesByID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUpdatesByID:");
}

id objc_msgSend__updatesByID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatesByID");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_adoptConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adoptConnection:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyObject");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auditToken");
}

id objc_msgSend_cameraOverlaySceneClientMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cameraOverlaySceneClientMonitor");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_clientMonitor_didUpdateWithAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientMonitor:didUpdateWithAuditToken:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureConnection:");
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectedScenes");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection");
}

id objc_msgSend_connectionsByProcessID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionsByProcessID");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:multiplier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_controlIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controlIdentifier");
}

id objc_msgSend_controlsByID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controlsByID");
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

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_decodeStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeStringForKey:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didChangeInterfaceReduced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeInterfaceReduced:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashTableWithOptions:");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierKey");
}

id objc_msgSend_initWithBoardServiceConnection_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBoardServiceConnection:queue:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interface");
}

id objc_msgSend_interpretControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interpretControl:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isValueUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValueUpdate");
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "label");
}

id objc_msgSend_listenerWithConfigurator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listenerWithConfigurator:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_overlayRequestingProcessAuditToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overlayRequestingProcessAuditToken");
}

id objc_msgSend_panning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "panning");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pid");
}

id objc_msgSend_remoteTarget(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteTarget");
}

id objc_msgSend_remoteToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteToken");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSceneSessionDestruction:options:errorHandler:");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "role");
}

id objc_msgSend_serverActivatedConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverActivatedConnection:");
}

id objc_msgSend_serverDidChangeActiveControlIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverDidChangeActiveControlIdentifier:");
}

id objc_msgSend_serverDidChangeOverlayVisible_activeControlIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverDidChangeOverlayVisible:activeControlIdentifier:");
}

id objc_msgSend_serverDidUpdateControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverDidUpdateControl:");
}

id objc_msgSend_serverLostConnectionFromProcessID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverLostConnectionFromProcessID:");
}

id objc_msgSend_serviceQuality(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceQuality");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setActivationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationHandler:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDomain:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:");
}

id objc_msgSend_setInterfaceTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceTarget:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfTouchesRequired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfTouchesRequired:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPanning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPanning:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceQuality:");
}

id objc_msgSend_setTargetQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetQueue:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTranslation_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslation:inView:");
}

id objc_msgSend_setUnderlyingMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnderlyingMonitor:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisible:");
}

id objc_msgSend_set_connection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_connection:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "status");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_underlyingMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underlyingMonitor");
}

id objc_msgSend_updateLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLabel");
}

id objc_msgSend_updatesByID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatesByID");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_validateUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateUpdate:");
}

id objc_msgSend_valueType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueType");
}

id objc_msgSend_versionedPID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "versionedPID");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_visible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visible");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widthAnchor");
}
