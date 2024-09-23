@implementation CRStringDecoder

- (id)storageWithError:(id *)a3
{
  _TtC9Coherence15CRStringDecoder *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_1BDF078A4(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1BE1B34A0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (id)versionWithError:(id *)a3
{
  return sub_1BDF07ECC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_1BDF07A34);
}

- (id)addedByVersionWithError:(id *)a3
{
  return sub_1BDF07ECC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_1BDF07A74);
}

- (id)fromVersionWithError:(id *)a3
{
  return sub_1BDF07ECC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_1BDF07E4C);
}

- (id)fromAddedByVersionWithError:(id *)a3
{
  return sub_1BDF07ECC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_1BDF07E8C);
}

- (int64_t)substringCount
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC9Coherence15CRStringDecoder *v8;
  int64_t v9;
  uint64_t v11;

  v3 = type metadata accessor for Proto_Sequence(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDD9C318((uint64_t)self + OBJC_IVAR____TtC9Coherence15CRStringDecoder_encoded, (uint64_t)v5, type metadata accessor for Proto_Sequence);
  v6 = *(_QWORD *)&v5[*(int *)(v3 + 20)];
  swift_beginAccess();
  v7 = *(_QWORD *)(v6 + 40);
  v8 = self;
  swift_bridgeObjectRetain();
  sub_1BDD9C3E0((uint64_t)v5, type metadata accessor for Proto_Sequence);
  v9 = *(_QWORD *)(v7 + 16);

  swift_bridgeObjectRelease();
  return v9;
}

- (void)decodeSubstring:(int64_t)a3
{
  _TtC9Coherence15CRStringDecoder *v4;

  v4 = self;
  sub_1BDF08034(a3);

}

- (id)substringCharReplicaWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9Coherence15CRStringDecoder *v8;
  void *v9;
  uint64_t v11;

  v4 = sub_1BE1B1F58();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1BDF081EC((uint64_t)v7);

  v9 = (void *)sub_1BE1B1F04();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (unsigned)substringCharClock
{
  _TtC9Coherence15CRStringDecoder *v2;
  unsigned int v3;

  v2 = self;
  v3 = sub_1BDF08694();

  return v3;
}

- (int64_t)substringAddedByCount
{
  return sub_1BDF089BC(self, (uint64_t)a2, &OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__addedBy);
}

- (id)substringAddedByReplica:(int64_t)a3 withError:(id *)a4
{
  return sub_1BDF08D20(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_1BDF08944);
}

- (unsigned)substringAddedByCounter:(int64_t)a3
{
  _TtC9Coherence15CRStringDecoder *v4;

  v4 = self;
  LODWORD(a3) = sub_1BDF0896C(a3);

  return a3;
}

- (int64_t)substringRemovedAddedByCount
{
  return sub_1BDF089BC(self, (uint64_t)a2, &OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__removedAddedBy);
}

- (id)substringRemovedAddedByReplica:(int64_t)a3 withError:(id *)a4
{
  return sub_1BDF08D20(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_1BDF08ABC);
}

- (unsigned)substringRemovedAddedByCounter:(int64_t)a3
{
  _TtC9Coherence15CRStringDecoder *v4;

  v4 = self;
  LODWORD(a3) = sub_1BDF08E20(a3);

  return a3;
}

- (unsigned)substringLength
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  char *v6;
  _DWORD *v7;
  _BYTE v9[24];

  v3 = type metadata accessor for Proto_Subsequence(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = (char *)self + OBJC_IVAR____TtC9Coherence15CRStringDecoder_subsequence;
  swift_beginAccess();
  sub_1BDD9C318((uint64_t)v6, (uint64_t)v5, type metadata accessor for Proto_Subsequence);
  v7 = (_DWORD *)(*(_QWORD *)&v5[*(int *)(v3 + 20)]
                + OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__length);
  swift_beginAccess();
  LODWORD(v7) = *v7;
  sub_1BDD9C3E0((uint64_t)v5, type metadata accessor for Proto_Subsequence);
  return v7;
}

- (int64_t)substringContentOptions
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  char *v6;
  int64_t *v7;
  int64_t v8;
  _BYTE v10[24];

  v3 = type metadata accessor for Proto_Subsequence(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = (char *)self + OBJC_IVAR____TtC9Coherence15CRStringDecoder_subsequence;
  swift_beginAccess();
  sub_1BDD9C318((uint64_t)v6, (uint64_t)v5, type metadata accessor for Proto_Subsequence);
  v7 = (int64_t *)(*(_QWORD *)&v5[*(int *)(v3 + 20)]
                        + OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__contentOptions);
  swift_beginAccess();
  v8 = *v7;
  sub_1BDD9C3E0((uint64_t)v5, type metadata accessor for Proto_Subsequence);
  return v8;
}

- (int64_t)substringChildCount
{
  return sub_1BDF089BC(self, (uint64_t)a2, &OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__child);
}

- (unsigned)substringChild:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  _TtC9Coherence15CRStringDecoder *v11;
  unsigned int result;
  unsigned int v13;
  _BYTE v14[24];

  v5 = type metadata accessor for Proto_Subsequence(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = (char *)self + OBJC_IVAR____TtC9Coherence15CRStringDecoder_subsequence;
  swift_beginAccess();
  sub_1BDD9C318((uint64_t)v8, (uint64_t)v7, type metadata accessor for Proto_Subsequence);
  v9 = (uint64_t *)(*(_QWORD *)&v7[*(int *)(v5 + 20)]
                 + OBJC_IVAR____TtCV9Coherence17Proto_SubsequenceP33_8F93C82C9C5F20EAB9E21F7119431FBB13_StorageClass__child);
  swift_beginAccess();
  v10 = *v9;
  v11 = self;
  swift_bridgeObjectRetain();
  result = sub_1BDD9C3E0((uint64_t)v7, type metadata accessor for Proto_Subsequence);
  if (a3 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(v10 + 16) > (unint64_t)a3)
  {
    v13 = *(_DWORD *)(v10 + 4 * a3 + 32);

    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

- (_TtC9Coherence15CRStringDecoder)init
{
  _TtC9Coherence15CRStringDecoder *result;

  result = (_TtC9Coherence15CRStringDecoder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BDF0A5F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC9Coherence15CRStringDecoder_encoded, &OBJC_IVAR____TtC9Coherence15CRStringDecoder_subsequence);
}

@end
