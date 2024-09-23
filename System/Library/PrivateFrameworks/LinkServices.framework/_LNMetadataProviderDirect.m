@implementation _LNMetadataProviderDirect

- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1A190D074(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.entities(forBundleIdentifier:), (unint64_t *)&qword_1ED0A3DB0);
}

- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4
{
  _TtC12LinkServices25_LNMetadataProviderDirect *v5;
  void *v6;

  sub_1A190B0C4(0, &qword_1ED0A3658);
  sub_1A19B2D14();
  v5 = self;
  _LNMetadataProviderDirect.actions(withFullyQualifiedIdentifiers:)();
  swift_bridgeObjectRelease();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED0A41A0);
  v6 = (void *)sub_1A19B2B40();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5
{
  _TtC12LinkServices25_LNMetadataProviderDirect *v7;
  void *v8;

  sub_1A19B2C00();
  if (a4)
    sub_1A19B2C00();
  v7 = self;
  _LNMetadataProviderDirect.queries(forBundleIdentifier:ofType:)();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_1A190B0C4(0, (unint64_t *)&qword_1ED0A38A0);
  v8 = (void *)sub_1A19B2D08();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1A190D074(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.enums(forBundleIdentifier:), (unint64_t *)&qword_1ED0A3DA0);
}

- (_TtC12LinkServices25_LNMetadataProviderDirect)initWithConnection:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  return (_TtC12LinkServices25_LNMetadataProviderDirect *)_LNMetadataProviderDirect.init(connection:options:)(a3, a4);
}

- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4
{
  _TtC12LinkServices25_LNMetadataProviderDirect *v5;
  void *v6;

  sub_1A19B2C00();
  v5 = self;
  _LNMetadataProviderDirect.autoShortcuts(forLocaleIdentifier:)();
  swift_bridgeObjectRelease();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED0A3778);
  v6 = (void *)sub_1A19B2B40();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)actionsWithError:(id *)a3
{
  return sub_1A193D5C0(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.actions(), (uint64_t *)&unk_1ED0A41A0);
}

- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  _TtC12LinkServices25_LNMetadataProviderDirect *v8;
  void *v9;

  sub_1A190B0C4(0, (unint64_t *)&unk_1ED0A35A0);
  sub_1A1920E6C();
  sub_1A19B2DA4();
  if (a5)
    sub_1A19B2C00();
  v8 = self;
  _LNMetadataProviderDirect.actionsConforming(to:logicalType:bundleIdentifier:)();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED0A41A0);
  v9 = (void *)sub_1A19B2B40();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4
{
  _TtC12LinkServices25_LNMetadataProviderDirect *v5;
  void *v6;

  if (a3)
    sub_1A19B2C00();
  v5 = self;
  _LNMetadataProviderDirect.actionsAndSystemProtocolDefaults(forBundleIdentifier:)();

  swift_bridgeObjectRelease();
  sub_1A190B0C4(0, &qword_1EE649008);
  v6 = (void *)sub_1A19B2B40();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1A190D074(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.actions(forBundleIdentifier:), &qword_1ED0A41B0);
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1A193D6D8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.actionIdentifiers(forBundleIdentifier:));
}

- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC12LinkServices25_LNMetadataProviderDirect *v12;
  void *v13;

  v6 = sub_1A19B2C00();
  v8 = v7;
  v9 = sub_1A19B2C00();
  v11 = v10;
  v12 = self;
  v13 = (void *)_LNMetadataProviderDirect.action(forBundleIdentifier:andActionIdentifier:)(v6, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC12LinkServices25_LNMetadataProviderDirect *v12;
  void *v13;

  v6 = sub_1A19B2C00();
  v8 = v7;
  v9 = sub_1A19B2C00();
  v11 = v10;
  v12 = self;
  _LNMetadataProviderDirect.actions(forBundleIdentifier:andActionIdentifier:)(v6, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1A190B0C4(0, &qword_1ED0A41B0);
  v13 = (void *)sub_1A19B2D08();
  swift_bridgeObjectRelease();
  return v13;
}

- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _TtC12LinkServices25_LNMetadataProviderDirect *v13;
  void *v14;

  sub_1A190B0C4(0, (unint64_t *)&unk_1EE6488B8);
  v9 = sub_1A19B2B4C();
  if (a5)
  {
    v10 = sub_1A19B2C00();
    a5 = v11;
  }
  else
  {
    v10 = 0;
  }
  v12 = a3;
  v13 = self;
  _LNMetadataProviderDirect.actionsConforming(to:withParametersOfTypes:bundleIdentifier:)((uint64_t)v13, v9, v10, (uint64_t)a5);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED0A41A0);
  v14 = (void *)sub_1A19B2B40();
  swift_bridgeObjectRelease();
  return v14;
}

- (id)bundlesWithError:(id *)a3
{
  _TtC12LinkServices25_LNMetadataProviderDirect *v3;
  void *v4;

  v3 = self;
  _LNMetadataProviderDirect.bundles()();

  v4 = (void *)sub_1A19B2D08();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)bundleRegistrationsWithError:(id *)a3
{
  _TtC12LinkServices25_LNMetadataProviderDirect *v3;
  void *v4;

  v3 = self;
  _LNMetadataProviderDirect.bundleRegistrations()();

  sub_1A190B0C4(0, &qword_1EE649000);
  v4 = (void *)sub_1A19B2D08();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)queriesWithError:(id *)a3
{
  return sub_1A193D5C0(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.queries(), (uint64_t *)&unk_1ED0A3698);
}

- (id)enumsWithError:(id *)a3
{
  return sub_1A193D5C0(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.enums(), (uint64_t *)&unk_1ED0A3688);
}

- (id)entitiesWithError:(id *)a3
{
  return sub_1A193D5C0(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.entities(), (uint64_t *)&unk_1ED0A36A8);
}

- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1A193D6D8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.entityIdentifiers(forBundleIdentifier:));
}

- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC12LinkServices25_LNMetadataProviderDirect *v9;
  id v10;

  v6 = sub_1A19B2C00();
  v8 = v7;
  v9 = self;
  v10 = _LNMetadataProviderDirect.metadataVersion(forBundleIdentifier:error:)(v6, v8, a4);

  swift_bridgeObjectRelease();
  return (int64_t)v10;
}

- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  _TtC12LinkServices25_LNMetadataProviderDirect *v9;
  Swift::String v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v6 = sub_1A19B2C00();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  _LNMetadataProviderDirect.appShortcutsProviderMangledTypeName(forBundleIdentifier:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      v12 = (void *)sub_1A19B290C();

      v13 = v12;
      v14 = 0;
      *a4 = v12;
    }
    else
    {

      v14 = 0;
    }
  }
  else
  {
    v14 = (void *)sub_1A19B2BDC();
    swift_bridgeObjectRelease();
  }
  return v14;
}

- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1A190D074(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.examplePhrases(forBundleIdentifier:), (unint64_t *)&qword_1EE648268);
}

- (_TtC12LinkServices25_LNMetadataProviderDirect)init
{
  _LNMetadataProviderDirect.init()();
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC12LinkServices25_LNMetadataProviderDirect *v13;

  v6 = _Block_copy(a5);
  v7 = sub_1A19B2C00();
  v9 = v8;
  v10 = sub_1A19B2C00();
  v12 = v11;
  _Block_copy(v6);
  v13 = self;
  sub_1A193DE94(v7, v9, v10, v12, v13, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC12LinkServices25_LNMetadataProviderDirect *v9;

  v5 = _Block_copy(a4);
  v6 = sub_1A19B2C00();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_1A193E364(v6, v8, v9, (void (**)(_QWORD, _QWORD, _QWORD))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4
{
  _TtC12LinkServices25_LNMetadataProviderDirect *v5;
  void *v6;

  sub_1A19B2A5C();
  sub_1A19B2D14();
  v5 = self;
  _LNMetadataProviderDirect.properties(forIdentifiers:)();
  swift_bridgeObjectRelease();

  sub_1A190B0C4(0, (unint64_t *)&qword_1ED0A3B80);
  sub_1A193F2A8(&qword_1ED0A3710, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v6 = (void *)sub_1A19B2B40();
  swift_bridgeObjectRelease();
  return v6;
}

@end
