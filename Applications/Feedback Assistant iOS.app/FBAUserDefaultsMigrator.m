@implementation FBAUserDefaultsMigrator

- (_TtC18Feedback_Assistant23FBAUserDefaultsMigrator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBAUserDefaultsMigrator();
  return -[FBAUserDefaultsMigrator init](&v3, "init");
}

+ (void)run
{
  NSString v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint8_t *v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint8_t *v30;
  NSString v31;
  uint64_t v32;
  id v33;
  id v34;

  v34 = objc_msgSend((id)objc_opt_self(FBKSharedConstants), "sharedUserDefaults");
  v0 = String._bridgeToObjectiveC()();
  v1 = objc_msgSend(v34, "BOOLForKey:", v0);

  if ((v1 & 1) != 0)
  {
    if (qword_100115E68 != -1)
      swift_once(&qword_100115E68, sub_1000984D4);
    v2 = type metadata accessor for Logger(0);
    v3 = sub_10005067C(v2, (uint64_t)qword_100117EA8);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "User defaults migrator already completed, skipping.", v6, 2u);
      swift_slowDealloc(v6, -1, -1);
    }
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
    if (qword_100115E68 != -1)
      swift_once(&qword_100115E68, sub_1000984D4);
    v7 = type metadata accessor for Logger(0);
    v8 = sub_10005067C(v7, (uint64_t)qword_100117EA8);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.debug.getter(v9);
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Gathering defaults", v11, 2u);
      swift_slowDealloc(v11, -1, -1);
    }

    v12 = FBKAgreedLegalVersionKey;
    v33 = -[NSObject integerForKey:](v4, "integerForKey:", FBKAgreedLegalVersionKey);
    v13 = -[NSObject stringForKey:](v4, "stringForKey:", CFSTR("LastSuccessfulLogin"));
    v14 = v13;
    if (v13)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
      v16 = v15;
    }
    else
    {
      v16 = 0;
    }
    v17 = -[NSObject BOOLForKey:](v4, "BOOLForKey:", FBKSuppressPrivacyNoticePreferencesKey);
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.default.getter(v18);
    if (os_log_type_enabled(v18, v19))
    {
      v20 = v12;
      v21 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Migrating defaults to shared domain", v21, 2u);
      v22 = v21;
      v12 = v20;
      swift_slowDealloc(v22, -1, -1);
    }

    if (v33 && !objc_msgSend(v34, "integerForKey:", v12))
      objc_msgSend(v34, "setInteger:forKey:", v33, v12);
    if (v16)
    {
      swift_bridgeObjectRelease(v16);
      v23 = objc_msgSend(v34, "stringForKey:", CFSTR("LastSuccessfulLogin"));
      if (v23)
      {
        v24 = v23;

        v14 = v24;
      }
      else
      {
        objc_msgSend(v34, "setObject:forKey:", v14, CFSTR("LastSuccessfulLogin"));
      }
    }

    if ((_DWORD)v17)
    {
      v25 = objc_msgSend(v34, "BOOLForKey:", v32);
      if ((v25 & 1) == 0)
        v25 = objc_msgSend(v34, "setBool:forKey:", 1, v32);
    }
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.default.getter(v26);
    if (os_log_type_enabled(v26, v27))
    {
      v28 = v12;
      v29 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Deleting defaults in app domain", v29, 2u);
      v30 = v29;
      v12 = v28;
      swift_slowDealloc(v30, -1, -1);
    }

    -[NSObject removeObjectForKey:](v4, "removeObjectForKey:", v12);
    -[NSObject removeObjectForKey:](v4, "removeObjectForKey:", CFSTR("LastSuccessfulLogin"));
    -[NSObject removeObjectForKey:](v4, "removeObjectForKey:", v32);
    v31 = String._bridgeToObjectiveC()();
    objc_msgSend(v34, "setBool:forKey:", 1, v31);

    v34 = v31;
  }

}

@end
