@implementation HFMatterAccessoryRepresentable

- (HFMatterAccessoryRepresentable)initWithAccessory:(id)a3
{
  return (HFMatterAccessoryRepresentable *)MatterAccessoryRepresentable.init(accessory:)(a3);
}

- (HFMatterAccessoryRepresentable)init
{
  HFMatterAccessoryRepresentable *result;

  result = (HFMatterAccessoryRepresentable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___HFMatterAccessoryRepresentable_tilePath;
  v4 = sub_1DD63D984();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1DD3540B8((uint64_t)self + OBJC_IVAR___HFMatterAccessoryRepresentable__staticMatterDevice, &qword_1F03E47B8);
  sub_1DD3540B8((uint64_t)self + OBJC_IVAR___HFMatterAccessoryRepresentable__tileInfo, &qword_1F03E49E0);
}

- (HFHomeContainedObject)hf_homeKitObject
{
  return (HFHomeContainedObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory));
}

- (Class)hf_itemClass
{
  type metadata accessor for MatterAccessoryLikeItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)hf_canShowInControlCenter
{
  return 0;
}

- (HMRoom)hf_safeRoom
{
  return (HMRoom *)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_room);
}

- (BOOL)hf_canSpanMultipleRooms
{
  return 0;
}

- (BOOL)hf_isIdentifiable
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_isIdentifiable);
}

- (BOOL)hf_isMatterOnlyAccessory
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_isMatterOnlyAccessory);
}

- (NSSet)hf_containedCharacteristics
{
  return (NSSet *)sub_1DD3F09D8(self, (uint64_t)a2, sub_1DD3EBDA4, (unint64_t *)&qword_1ED378380, 0x1E0CBA458, (unint64_t *)&qword_1ED378390);
}

- (NSSet)hf_containedServices
{
  return (NSSet *)sub_1DD3F09D8(self, (uint64_t)a2, sub_1DD3EE1B4, (unint64_t *)&qword_1F03E41C0, 0x1E0CBA7E0, (unint64_t *)&qword_1F03E4AF0);
}

- (NSSet)hf_containedProfiles
{
  return (NSSet *)sub_1DD3F09D8(self, (uint64_t)a2, sub_1DD3EE534, &qword_1F03E46F0, 0x1E0CBA2A0, &qword_1F03E48D8);
}

- (NSSet)hf_associatedAccessories
{
  uint64_t inited;
  void *v4;
  uint64_t v5;
  HFMatterAccessoryRepresentable *v6;
  id v7;
  HFMatterAccessoryRepresentable *v8;
  id v9;
  uint64_t v10;
  void *v11;
  unint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED378430);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DD667C50;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory);
  *(_QWORD *)(inited + 32) = v4;
  v13 = inited;
  sub_1DD63E20C();
  if (v13 >> 62)
  {
    v8 = self;
    v9 = v4;
    swift_bridgeObjectRetain();
    v10 = sub_1DD63E7B8();
    swift_bridgeObjectRelease();
    if (!v10)
      goto LABEL_5;
    goto LABEL_3;
  }
  v5 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = self;
  v7 = v4;
  if (v5)
LABEL_3:
    sub_1DD3EE550(v13);
LABEL_5:
  swift_bridgeObjectRelease();

  sub_1DD352AB0(0, &qword_1F03E46E0);
  sub_1DD352A70((unint64_t *)&unk_1F03E55B0, &qword_1F03E46E0);
  v11 = (void *)sub_1DD63E380();
  swift_bridgeObjectRelease();
  return (NSSet *)v11;
}

- (BOOL)hf_isInRoom:(id)a3
{
  id v4;
  HFMatterAccessoryRepresentable *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = MatterAccessoryRepresentable.__hf_is(in:)((HMRoom)v4);

  return self & 1;
}

- (id)hf_moveToRoom:(id)a3
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_moveToRoom_, a3);
}

- (HFAccessoryType)hf_accessoryType
{
  HFMatterAccessoryRepresentable *v2;
  id v3;

  v2 = self;
  v3 = MatterAccessoryRepresentable.__hf_accessoryType.getter();

  return (HFAccessoryType *)v3;
}

- (HFServiceNameComponents)hf_serviceNameComponents
{
  return (HFServiceNameComponents *)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_serviceNameComponents);
}

- (BOOL)hf_isFavorite
{
  return sub_1DD3F18FC(self, (uint64_t)a2, MEMORY[0x1E0D32738]);
}

- (BOOL)hf_hasSetFavorite
{
  HFMatterAccessoryRepresentable *v2;
  BOOL v3;

  v2 = self;
  v3 = MatterAccessoryRepresentable.hasSetFavorite.getter();

  return v3;
}

- (BOOL)hf_shouldShowInFavorites
{
  return -[HFMatterAccessoryRepresentable hf_effectiveIsFavorite](self, sel_hf_effectiveIsFavorite);
}

- (BOOL)hf_effectiveIsFavorite
{
  return -[HFMatterAccessoryRepresentable hf_isFavorite](self, sel_hf_isFavorite);
}

- (id)hf_updateIsFavorite:(BOOL)a3
{
  _BOOL4 v3;
  HFMatterAccessoryRepresentable *v4;
  id v5;

  v3 = a3;
  v4 = self;
  v5 = MatterAccessoryRepresentable.updateIsFavorite(_:)(v3);

  return v5;
}

- (BOOL)hf_supportsHomeStatus
{
  return 1;
}

- (BOOL)hf_isVisibleInHomeStatus
{
  return sub_1DD3F18FC(self, (uint64_t)a2, MEMORY[0x1E0D32750]);
}

- (BOOL)hf_hasSetVisibleInHomeStatus
{
  HFMatterAccessoryRepresentable *v2;
  BOOL v3;

  v2 = self;
  v3 = MatterAccessoryRepresentable.hasSetVisibleInHomeStatus.getter();

  return v3;
}

- (BOOL)hf_isForcedVisibleInHomeStatus
{
  return 0;
}

- (id)hf_updateIsVisibleInHomeStatus:(BOOL)a3
{
  _BOOL4 v3;
  HFMatterAccessoryRepresentable *v4;
  id v5;

  v3 = a3;
  v4 = self;
  v5 = MatterAccessoryRepresentable.updateIsVisibleInHomeStatus(_:)(v3);

  return v5;
}

- (BOOL)hf_showInHomeDashboard
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  HFMatterAccessoryRepresentable *v10;
  char v11;
  uint64_t v13;

  v3 = sub_1DD63DB34();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03E47B8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = self;
  sub_1DD3EF30C(v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3))
  {
    sub_1DD3540B8((uint64_t)v9, &qword_1F03E47B8);
    v11 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
    sub_1DD3540B8((uint64_t)v9, &qword_1F03E47B8);
    v11 = sub_1DD63DAC8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  return v11 & 1;
}

- (BOOL)hf_hasSetShowInHomeDashboard
{
  HFMatterAccessoryRepresentable *v2;
  BOOL v3;

  v2 = self;
  v3 = MatterAccessoryRepresentable.hasSetShowInHomeDashboard.getter();

  return v3;
}

- (BOOL)hf_effectiveShowInHomeDashboard
{
  return -[HFMatterAccessoryRepresentable hf_showInHomeDashboard](self, sel_hf_showInHomeDashboard);
}

- (id)hf_updateShowInHomeDashboard:(BOOL)a3
{
  _BOOL4 v3;
  HFMatterAccessoryRepresentable *v4;
  id v5;

  v3 = a3;
  v4 = self;
  v5 = MatterAccessoryRepresentable.updateShowInHomeDashboard(_:)(v3);

  return v5;
}

- (NSString)hf_tileSize
{
  HFMatterAccessoryRepresentable *v2;
  void *v3;

  v2 = self;
  v3 = (void *)MatterAccessoryRepresentable.__hf_tileSize.getter();

  return (NSString *)v3;
}

- (id)hf_setTileSize:(id)a3
{
  id v5;
  HFMatterAccessoryRepresentable *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = MatterAccessoryRepresentable.__hf_setTileSize(_:)(a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  HFMatterAccessoryRepresentable *v4;
  HFMatterAccessoryRepresentable *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DD63E56C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = MatterAccessoryRepresentable.isEqual(_:)((uint64_t)v8);

  sub_1DD3540B8((uint64_t)v8, (uint64_t *)&unk_1ED3785F0);
  return v6 & 1;
}

- (int64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  HFMatterAccessoryRepresentable *v7;
  id v8;
  int64_t v9;
  _BYTE v11[24];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v3 = sub_1DD63D7C8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DD63E944();
  v7 = self;
  sub_1DD63D960();
  v8 = objc_msgSend(*(id *)((char *)&v7->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_uniqueIdentifier);
  sub_1DD63D7A4();

  sub_1DD63D7B0();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  v18 = v13;
  v19 = v14;
  v20 = v15;
  v16 = *(_OWORD *)&v11[8];
  v17 = v12;
  v9 = sub_1DD63E92C();

  return v9;
}

@end
