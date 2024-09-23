@implementation ASPasskeyConfigurationSubscriberAdapter

- (_TtC26AuthenticationServicesCore39ASPasskeyConfigurationSubscriberAdapter)init
{
  return (_TtC26AuthenticationServicesCore39ASPasskeyConfigurationSubscriberAdapter *)sub_20E6C4FB8();
}

- (id)configurationClasses
{
  _TtC26AuthenticationServicesCore39ASPasskeyConfigurationSubscriberAdapter *v2;
  NSString *v3;
  Class v4;
  uint64_t ObjCClassMetadata;
  uint64_t v6;
  void *v7;

  v2 = self;
  v3 = (NSString *)sub_20E6EA1C0();
  v4 = NSClassFromString(v3);

  if (v4)
  {
    ObjCClassMetadata = swift_getObjCClassMetadata();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253E8D598);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_20E6EE520;
    *(_QWORD *)(v6 + 32) = ObjCClassMetadata;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_253E8D590);
  v7 = (void *)sub_20E6EA334();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)allDeclarationKeys
{
  _TtC26AuthenticationServicesCore39ASPasskeyConfigurationSubscriberAdapter *v2;
  void *v3;

  v2 = self;
  sub_20E6C52EC();

  sub_20E67BE44(0, (unint64_t *)&unk_253E8D580);
  sub_20E6C4F0C();
  v3 = (void *)sub_20E6EA3A0();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)applyConfiguration:(id)a3 scope:(int64_t)a4 returningReasons:(id *)a5 error:(id *)a6
{
  id v8;
  _TtC26AuthenticationServicesCore39ASPasskeyConfigurationSubscriberAdapter *v9;

  v8 = a3;
  v9 = self;
  sub_20E6C6208(v8, a4);

  return 1;
}

- (BOOL)removeDeclarationKey:(id)a3 scope:(int64_t)a4 error:(id *)a5
{
  id v7;
  _TtC26AuthenticationServicesCore39ASPasskeyConfigurationSubscriberAdapter *v8;

  v7 = a3;
  v8 = self;
  sub_20E6C5740(v7, a4);

  return 1;
}

- (id)declarationKeyForConfiguration:(id)a3
{
  void *v5;
  id v6;
  _TtC26AuthenticationServicesCore39ASPasskeyConfigurationSubscriberAdapter *v7;
  void *v8;
  id v9;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  v8 = (void *)sub_20E6EA1C0();
  v9 = objc_msgSend(v5, sel_newDeclarationKeyWithSubscriberIdentifier_reference_, v8, v6);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore39ASPasskeyConfigurationSubscriberAdapter_currentConfiguration));
}

@end
