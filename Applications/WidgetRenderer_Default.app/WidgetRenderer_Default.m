int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v13;

  v3 = type metadata accessor for Logger(0, argv, envp);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = Logger.init()(v5);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "May it be a light to you in dark places…", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  type metadata accessor for Bootstrap(0);
  static Bootstrap.startApplication()();
  return 0;
}

uint64_t sub_100003D84()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC22WidgetRenderer_DefaultP33_18997772F93983898689239E6E617D7619ResourceBundleClass);
}
