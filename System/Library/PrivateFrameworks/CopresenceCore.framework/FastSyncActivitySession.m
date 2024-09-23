@implementation FastSyncActivitySession

- (void)assertionWillInvalidate:(id)a3
{
  uint64_t v4;
  _TtC14CopresenceCore23FastSyncActivitySession *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;

  v4 = one-time initialization token for host;
  v10 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Log.host);
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1ACCCC000, v7, v8, "[Assertion] DomainAssertionObserver assertionWillInvalidate for app.", v9, 2u);
    MEMORY[0x1AF44981C](v9, -1, -1);
  }

}

@end
