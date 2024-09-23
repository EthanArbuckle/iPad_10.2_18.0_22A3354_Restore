@implementation FPCKDetachedRoot

- (NSURL)physicalLocation
{
  return (NSURL *)(id)sub_23B1C5954();
}

- (NSURL)logicalLocation
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542E6740);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23AA8EFC8((uint64_t)self + OBJC_IVAR____TtC9libfssync16FPCKDetachedRoot_logicalLocation, (uint64_t)v5, (uint64_t *)&unk_2542E6740);
  v6 = sub_23B1C5A08();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_23B1C5954();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSURL *)v8;
}

- (unint64_t)inode
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync16FPCKDetachedRoot_inode);
}

- (BOOL)shouldRefreshBookmark
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC9libfssync16FPCKDetachedRoot_shouldRefreshBookmark);
}

- (_TtC9libfssync16FPCKDetachedRoot)initWithPhysicalLocation:(id)a3 rootURL:(id)a4 error:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE v12[16];

  v5 = sub_23B1C5A08();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v12[-v9];
  sub_23B1C59CC();
  sub_23B1C59CC();
  return (_TtC9libfssync16FPCKDetachedRoot *)sub_23ADBC604((uint64_t)v10, (uint64_t)v8);
}

- (_TtC9libfssync16FPCKDetachedRoot)init
{
  _TtC9libfssync16FPCKDetachedRoot *result;

  result = (_TtC9libfssync16FPCKDetachedRoot *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9libfssync16FPCKDetachedRoot_physicalLocation;
  v4 = sub_23B1C5A08();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_23AA8A05C((uint64_t)self + OBJC_IVAR____TtC9libfssync16FPCKDetachedRoot_logicalLocation, (uint64_t *)&unk_2542E6740);
}

@end
