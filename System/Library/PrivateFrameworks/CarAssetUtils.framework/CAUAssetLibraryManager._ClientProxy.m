@implementation CAUAssetLibraryManager._ClientProxy

- (_TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy)init
{
  _TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy *result;

  swift_weakInit();

  result = (_TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy *)sub_2378260FC();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy_connectionQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy_connection));
}

- (void)invalidate
{
  _TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy *v2;

  v2 = self;
  sub_2378168DC();

}

- (void)refreshVariants
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _TtCC13CarAssetUtils22CAUAssetLibraryManager12_ClientProxy *v7;

  v2 = qword_2568112A8;
  v7 = self;
  if (v2 != -1)
    swift_once();
  v3 = sub_237825F10();
  __swift_project_value_buffer(v3, (uint64_t)qword_256811808);
  v4 = sub_237825EF8();
  v5 = sub_237826054();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_23780B000, v4, v5, "refreshVariants", v6, 2u);
    MEMORY[0x23B81C1EC](v6, -1, -1);
  }

  sub_237815D0C();
}

@end
