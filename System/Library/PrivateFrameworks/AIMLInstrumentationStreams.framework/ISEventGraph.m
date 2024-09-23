@implementation ISEventGraph

- (id)sievents
{
  ISEventGraph *v2;
  void *v3;

  v2 = self;
  EventGraph.sievents()();

  sub_21DC13C88(0, (unint64_t *)&qword_2553A8478);
  v3 = (void *)sub_21DC71B64();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)sieventsWithType:(Class)a3
{
  return sub_21DC0EAE4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))EventGraph.sievents(type:));
}

- (id)sieventsWithComponentName:(int)a3
{
  ISEventGraph *v4;
  void *v5;

  v4 = self;
  EventGraph.sievents(componentName:)(a3);

  sub_21DC13C88(0, (unint64_t *)&qword_2553A8478);
  v5 = (void *)sub_21DC71B64();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)sieventsWithComponentIdentifier:(id)a3
{
  id v4;
  ISEventGraph *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  EventGraph.sievents(componentIdentifier:)((uint64_t)v4);

  sub_21DC13C88(0, (unint64_t *)&qword_2553A8478);
  v6 = (void *)sub_21DC71B64();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)sieventsWithInnerType:(Class)a3
{
  return sub_21DC0EAE4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))EventGraph.sievents(innerType:));
}

- (id)sieventWithInnerType:(Class)a3
{
  uint64_t ObjCClassMetadata;
  ISEventGraph *v5;
  unint64_t v6;
  id result;
  id v8;
  void *v9;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  v5 = self;
  v6 = sub_21DC2641C(ObjCClassMetadata);
  if (!(v6 >> 62))
  {
    result = *(id *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (result)
      goto LABEL_3;
LABEL_8:

    swift_bridgeObjectRelease();
    v9 = 0;
    return v9;
  }
  result = (id)sub_21DC71FCC();
  if (!result)
    goto LABEL_8;
LABEL_3:
  if ((v6 & 0xC000000000000001) != 0)
  {
    MEMORY[0x22079D208](0, v6);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v8 = *(id *)(v6 + 32);
LABEL_6:
    swift_bridgeObjectRelease();
    sub_21DC13C88(0, (unint64_t *)&qword_2553A8478);
    v9 = (void *)sub_21DC71D2C();

    return v9;
  }
  __break(1u);
  return result;
}

- (id)getComponentGroupBridgesWithType:(Class)a3
{
  uint64_t ObjCClassMetadata;
  ISEventGraph *v5;
  void *v6;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  v5 = self;
  EventGraph.getComponentGroupBridges(type:)(ObjCClassMetadata);

  type metadata accessor for ComponentGroupBridge();
  v6 = (void *)sub_21DC71B64();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)getComponentGroupBridgeWithType:(Class)a3
{
  ISEventGraph *v4;
  id v5;
  unint64_t v6;
  id result;
  void *v8;
  id v9;

  v4 = self;
  v5 = -[ISEventGraph getComponentGroupBridgesWithType:](v4, sel_getComponentGroupBridgesWithType_, a3);
  type metadata accessor for ComponentGroupBridge();
  v6 = sub_21DC71B70();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = (void *)sub_21DC71FCC();
    result = (id)swift_bridgeObjectRelease();
    if (!v8)
      goto LABEL_7;
  }
  else
  {
    v8 = *(void **)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v8)
    {
LABEL_7:

      swift_bridgeObjectRelease();
      return v8;
    }
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
    v9 = (id)MEMORY[0x22079D208](0, v6);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v9 = *(id *)(v6 + 32);
LABEL_6:
    v8 = v9;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

- (ISComponentGroup)ueiBridge
{
  return (ISComponentGroup *)sub_21DC0F2E4(self, (uint64_t)a2, (unint64_t *)&qword_2553AA420);
}

- (ISComponentGroup)orchBridge
{
  return (ISComponentGroup *)sub_21DC0F2E4(self, (uint64_t)a2, &qword_2553A8488);
}

- (ISComponentGroup)nlxBridge
{
  return (ISComponentGroup *)sub_21DC0F2E4(self, (uint64_t)a2, (unint64_t *)&qword_2553A8490);
}

- (ISComponentGroup)asrBridge
{
  return (ISComponentGroup *)sub_21DC0F2E4(self, (uint64_t)a2, &qword_2553A8498);
}

- (NSSet)componentIdentifiersBridge
{
  ISEventGraph *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;

  v2 = self;
  v3 = sub_21DC2630C();
  v4 = sub_21DC0E200(v3);
  swift_bridgeObjectRelease();
  sub_21DC4A610(v4);

  swift_bridgeObjectRelease();
  type metadata accessor for ComponentIdentifierBridge();
  sub_21DC13D04(&qword_2553A84E0, (uint64_t (*)(uint64_t))type metadata accessor for ComponentIdentifierBridge, MEMORY[0x24BEE5BD8]);
  v5 = (void *)sub_21DC71C54();
  swift_bridgeObjectRelease();
  return (NSSet *)v5;
}

- (double)timestamp
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___ISEventGraph_timestamp);
}

- (NSDate)date
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v9;

  v2 = sub_21DC71588();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DC7151C();
  v7 = (void *)sub_21DC71540();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return (NSDate *)v7;
}

- (ISEventGraph)init
{
  ISEventGraph *result;

  result = (ISEventGraph *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
