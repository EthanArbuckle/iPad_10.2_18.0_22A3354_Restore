@implementation MetricsInspectorScanner

- (void)dealloc
{
  _TtC9JetEngine23MetricsInspectorScanner *v2;

  v2 = self;
  sub_19CDDDEB4();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9JetEngine23MetricsInspectorScanner *v8;

  sub_19CCE5204(0, (unint64_t *)&qword_1ECEB24C0);
  v6 = sub_19CFDF3C8();
  v7 = a3;
  v8 = self;
  sub_19CDDEE4C(v6);

  swift_bridgeObjectRelease();
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC9JetEngine23MetricsInspectorScanner *v11;

  swift_getObjectType();
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9JetEngine23MetricsInspectorScanner_stateLock);
  v9 = a3;
  v10 = a4;
  v11 = self;
  objc_msgSend(v8, sel_lock);
  sub_19CDDE394(v10, (uint64_t)v11);
  objc_msgSend(v8, sel_unlock);

}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  void *v7;
  id v8;
  id v9;
  _TtC9JetEngine23MetricsInspectorScanner *v10;

  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9JetEngine23MetricsInspectorScanner_stateLock);
  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_msgSend(v7, sel_lock);
  sub_19CDDE78C((uint64_t)v10, v9);
  objc_msgSend(v7, sel_unlock);

}

- (void)netServiceDidResolveAddress:(id)a3
{
  id v4;
  _TtC9JetEngine23MetricsInspectorScanner *v5;

  v4 = a3;
  v5 = self;
  sub_19CDDF028(v4);

}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9JetEngine23MetricsInspectorScanner *v8;

  sub_19CCE5204(0, (unint64_t *)&qword_1ECEB24C0);
  v6 = sub_19CFDF3C8();
  v7 = a3;
  v8 = self;
  sub_19CDDF214(v7, v6);

  swift_bridgeObjectRelease();
}

- (_TtC9JetEngine23MetricsInspectorScanner)init
{
  _TtC9JetEngine23MetricsInspectorScanner *result;

  result = (_TtC9JetEngine23MetricsInspectorScanner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (uint64_t)netServiceBrowserWillSearch:
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  __int128 v7;
  __int128 v8;
  _QWORD v9[4];

  if (qword_1ECEB31D8 != -1)
    swift_once();
  v0 = (void *)qword_1ECEB30F0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB31C0);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_19D0522A0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB3360);
  v2 = swift_allocObject();
  v3 = MEMORY[0x1E0DEA968];
  *(_OWORD *)(v2 + 16) = xmmword_19D0522A0;
  v9[3] = v3;
  v9[0] = 0xD000000000000037;
  v9[1] = 0x800000019D06EB90;
  v7 = 0u;
  v8 = 0u;
  v4 = v0;
  sub_19CD40658((uint64_t)v9, (uint64_t)&v7);
  *(_BYTE *)(v2 + 64) = 0;
  v5 = v8;
  *(_OWORD *)(v2 + 32) = v7;
  *(_OWORD *)(v2 + 48) = v5;
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)&v7 = v4;
  LOBYTE(v9[0]) = 3;
  OSLogger.log(contentsOf:withLevel:)((Swift::OpaquePointer)v1, (JetEngine::LogMessageLevel)v9);

  return swift_bridgeObjectRelease();
}

- (uint64_t)netServiceBrowserDidStopSearch:
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  __int128 v7;
  __int128 v8;
  _QWORD v9[4];

  if (qword_1ECEB31D8 != -1)
    swift_once();
  v0 = (void *)qword_1ECEB30F0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB31C0);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_19D0522A0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEB3360);
  v2 = swift_allocObject();
  v3 = MEMORY[0x1E0DEA968];
  *(_OWORD *)(v2 + 16) = xmmword_19D0522A0;
  v9[3] = v3;
  v9[0] = 0xD000000000000037;
  v9[1] = 0x800000019D06EB50;
  v7 = 0u;
  v8 = 0u;
  v4 = v0;
  sub_19CD40658((uint64_t)v9, (uint64_t)&v7);
  *(_BYTE *)(v2 + 64) = 0;
  v5 = v8;
  *(_OWORD *)(v2 + 32) = v7;
  *(_OWORD *)(v2 + 48) = v5;
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)&v7 = v4;
  LOBYTE(v9[0]) = 3;
  OSLogger.log(contentsOf:withLevel:)((Swift::OpaquePointer)v1, (JetEngine::LogMessageLevel)v9);

  return swift_bridgeObjectRelease();
}

@end
